require 'ffi'

module Windows
  module Functions
    extend FFI::Library
    ffi_lib :secur32

    attach_function :AcquireCredentialsHandle, :AcquireCredentialsHandleA,
      [:string, :string, :ulong, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer],
      :ulong

    attach_function :InitializeSecurityContext, :InitializeSecurityContextA,
      [:pointer, :pointer, :string, :ulong, :ulong, :ulong, :pointer, :ulong, :pointer, :pointer, :pointer, :pointer],
      :ulong

    attach_function :AcceptSecurityContext,
      [:pointer, :pointer, :pointer, :ulong, :ulong, :pointer, :pointer, :pointer, :pointer],
      :ulong

    attach_function :CompleteAuthToken, [:pointer, :pointer], :ulong
    attach_function :DeleteSecurityContext, [:pointer], :ulong
    attach_function :EnumerateSecurityPackages, :EnumerateSecurityPackagesA, [:pointer, :pointer], :ulong
    attach_function :FreeContextBuffer, [:pointer], :ulong
    attach_function :FreeCredentialsHandle, [:pointer], :ulong
    attach_function :ImpersonateSecurityContext, [:pointer], :ulong
    attach_function :QueryContextAttributes, :QueryContextAttributesA, [:pointer, :ulong, :pointer], :ulong
    attach_function :QuerySecurityContextToken, [:pointer, :pointer], :ulong
    attach_function :QuerySecurityPackageInfo, :QuerySecurityPackageInfoA, [:string, :pointer], :ulong
    attach_function :RevertSecurityContext, [:pointer], :ulong
  end
end
