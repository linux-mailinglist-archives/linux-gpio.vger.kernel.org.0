Return-Path: <linux-gpio+bounces-7244-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F928FF46D
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 20:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 454C51F28989
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 18:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188BD199385;
	Thu,  6 Jun 2024 18:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDOfOKU7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444DA198E74
	for <linux-gpio@vger.kernel.org>; Thu,  6 Jun 2024 18:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717697616; cv=none; b=EXz6fYMGsauMjjrClpToItHEFyGgnVzmG1X+MMfBMa1+yO25Xfz7zFOCaw3SvYvthvdY99si2FYT6lNPiQRLdVHJ0lvw3LJpO3HZkEF4VTP+Yvwi7dY7ano2BYPL8EoMuKMHyDpOmrU6bb+wO9j5IAEseubVZKRsY8ZrgS1waJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717697616; c=relaxed/simple;
	bh=o/3gKHAWy+GNxNRXx1/QeM3ZBUFbnayFQngXdHixXHk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s/6Lwx4JSEmts+YxVEH+fF516kEvyowAeDfZ8a8FJV+ft061J0gPsm/E/lzLsblcoSezLO5NvIBrM1nmAeZlkyTwPDcsh5WvqBxM1Oznm9UskqkwDxsEQIRSHnxsYoRbLHqJas09YLLhU9XJGLx/s1ln2VUKw11OYTH3BH86hyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDOfOKU7; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-795310c1830so26550185a.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Jun 2024 11:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717697614; x=1718302414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7NlRAWVDPfw3MM+e1653bdE72wwyZa6ZWZX69XjTsAk=;
        b=KDOfOKU7aOSEIcsBZajjLCl2tFgbTEC63oqXkeAQlleNOyndu1YWWy091/JwDhzyXE
         1hv3+tV5pbJXQRcDloGD9Al3zGr2K155xcpU79g7PzA30r+0baAJdTgsuPGesZR1IpGY
         kvykYQ3wkZtPLLqRWmUD95my5UhDT0v8GlTZnk1mk6nTlIurqwLFhOT1Cxk2Epwvnogy
         kZRJq1ZEwsFFspa4VmOquOUGfmjHzKBy2mu6MHyGQ607c2RiB8rcHXxSwyxo5v7N9UFb
         Wch01tp4aLnTcZmcPSVLG7NHAzNysZQNYzcjYlfR6aRV7JwxfEtr945hmDomWUdx28Sp
         kTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717697614; x=1718302414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NlRAWVDPfw3MM+e1653bdE72wwyZa6ZWZX69XjTsAk=;
        b=OgdyPNwOkJcJ0c9ROIbStgEK7uMwxr2DWl7j31euNesA/4LGdU8lp90b0v2C3pOElm
         Xo75SWIKq77MPb/AHqtJxtKJ0svtQSVUHSEKyQHBtqZoZGRep/UoLA3gB/tP7sGWwVCH
         mM0FFsfEqo36Xbz3Cr0EByAGxZT10R1MqJeyLw6sKGzS8eLsynh+Vv6nwDtm3CckllRg
         /REciYne5KeHT0OLVhkxeq/6AOXIQWZwvb8EjUbAh8j7qcpqhAoQefUeuZkhAYaG6/m8
         SyteqxtEqILAM6iiO2XYT/aBduEgZfHsneM8FWm6ZE64xDUrmuywFIln6OeqlXvzbNji
         ulng==
X-Gm-Message-State: AOJu0YwwFlxx6Pun7Zlj5yRBuf7vJ+vMJyxTc0ATFTws8HlWmq78fPtI
	MaKyYF/o0ZBXZZn3KIDJ8RWJk/eGNRVshNrVoQqNn1pWvIeAw4RIyjWrMQ==
X-Google-Smtp-Source: AGHT+IEW7gQt7q/tlhMRwu35EabI4iUUhkgtwHVrY3RNi1gh9D+PDEDzMWQ7hhBM7+qkMh3MOpCiXQ==
X-Received: by 2002:a05:620a:7:b0:795:1df2:d045 with SMTP id af79cd13be357-7953c45ea5fmr12465785a.36.1717697613476;
        Thu, 06 Jun 2024 11:13:33 -0700 (PDT)
Received: from vfazio4.xes-mad.com (mail.xes-mad.com. [162.248.234.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f624895sm8527246d6.17.2024.06.06.11.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 11:13:33 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2] bindings: python: add script to generate sdist and wheels
Date: Thu,  6 Jun 2024 13:13:09 -0500
Message-Id: <20240606181309.476805-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a shell script that generates an sdist tarball and PEP 600/656
conformant wheels.

The wheels are generated via cibuildwheel, a tool provided by the Python
Packaging Authority (PyPA) [0]. The tool leverages toolchains within
containers maintained by PyPA [1] to generate wheels that are runnable
on hosts that meet the platform compatibility tag [2] requirements.

By default, the script creates X86_64 and AArch64 CPython 3.9-3.12
wheels for glibc and musl libc based systems.

These defaults can be overridden via CIBW_* environment variables [3].

[0]: https://cibuildwheel.pypa.io/en/stable/
[1]: https://github.com/pypa/manylinux/
[2]: https://packaging.python.org/en/latest/specifications/platform-compatibility-tags/
[3]: https://cibuildwheel.pypa.io/en/stable/options/#options-summary

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
Changes v1 -> v2:
 - spaces -> tabs
 - conform to `shellcheck -oall` recommendations
 - simplify in-script documentation
 - miscellaneous grammar fixups
---
 bindings/python/generate_pypi_artifacts.sh | 132 +++++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100755 bindings/python/generate_pypi_artifacts.sh

diff --git a/bindings/python/generate_pypi_artifacts.sh b/bindings/python/generate_pypi_artifacts.sh
new file mode 100755
index 0000000..5e526be
--- /dev/null
+++ b/bindings/python/generate_pypi_artifacts.sh
@@ -0,0 +1,132 @@
+#!/usr/bin/env sh
+#
+# This is a script to generate an sdist and wheels for publishing to PyPI.
+#
+# This script requires:
+#   * Python3 + venv or virtualenv + pip
+#   * Docker or Podman (https://cibuildwheel.pypa.io/en/stable/options/#container-engine)
+#   * binfmt support and qemu-user-static for AArch64 registered as Fixed
+#     (https://docs.kernel.org/admin-guide/binfmt-misc.html)
+#
+# On Debian based systems, AArch64 binfmt support can be checked via:
+#   cat /proc/sys/fs/binfmt_misc/qemu-aarch64
+#
+# The entry should be enabled and "F" should be in the list of flags.
+#
+
+usage()
+{
+	printf "\n"
+	printf "Usage: %s -v <libgpiod_source_version> [-o <output_directory>] [-s <source_directory>] [-cfh]\n" "$0"
+	printf "\t-v Version of libgpiod sources to bundle in sdist. Overrides LIBGPIOD_VERSION\n"
+	printf "\t-o Directory to store outputs\n"
+	printf "\t-s Directory with python binding sources\n"
+	printf "\t-c Calculate checksums for generated outputs\n"
+	printf "\t-f Forcibly remove old files from output directory\n"
+	printf "\t-h Show this help output\n"
+	exit 1
+}
+
+src_version=${LIBGPIOD_VERSION:-} # Default to environment specified library version
+output_dir=$(pwd) # Default to putting outputs in the current directory
+source_dir=$(pwd) # Assume the current directory has the python binding sources
+calc_hash=0 # Do not calculate hashes by default
+force=0 # Do not forcibly remove files by default
+
+while getopts :hv:o:s:cf value; do
+	case ${value} in
+		c)
+			calc_hash=1
+			;;
+		f)
+			force=1
+			;;
+		o)
+			output_dir=${OPTARG}
+			;;
+		s)
+			source_dir=${OPTARG}
+			;;
+		v)
+			src_version=${OPTARG}
+			;;
+		h | *)
+			usage
+			;;
+	esac
+done
+
+if [ -z "${source_dir}" ] || [ ! -d "${output_dir}" ]; then
+	printf "Invalid source directory %s.\n" "${source_dir}"
+	exit 1
+fi
+
+if [ -z "${output_dir}" ] || [ ! -w "${output_dir}" ]; then
+	printf "Output directory %s is not writable.\n" "${output_dir}"
+	exit 1
+fi
+
+if [ -z "${src_version}" ]; then
+	printf "The libgpiod source version must be specified.\n"
+	exit 1
+fi
+
+shift $((OPTIND-1))
+
+# We require Python3 for building artifacts
+if ! command -v python3 >/dev/null 2>&1; then
+	printf "Python3 is required to generate PyPI artifacts.\n"
+	exit 1
+fi
+
+# Pip is necessary for installing build dependencies
+if ! python3 -m pip -h >/dev/null 2>&1; then
+	printf "The pip module is required to generate wheels.\n"
+	exit 1
+fi
+
+# Check for a virtual environment tool to not pollute user installed packages
+has_venv=$(python3 -m venv -h >/dev/null 2>&1 && echo 1 || echo 0)
+has_virtualenv=$(python3 -m virtualenv -h >/dev/null 2>&1 && echo 1 || echo 0)
+
+if ! { [ "${has_venv}" -eq 1 ] || [ "${has_virtualenv}" -eq 1 ]; }; then
+	printf "A virtual environment module is required to generate wheels.\n"
+	exit 1
+fi
+
+venv_module=$([ "${has_virtualenv}" -eq 1 ] && echo "virtualenv" || echo "venv" )
+
+# Stage the build in a temp directory.
+cur_dir=$(pwd)
+temp_dir=$(mktemp -d)
+cd "${temp_dir}" || { printf "Failed to enter temp directory.\n"; exit 1; }
+
+# Setup a virtual environment
+python3 -m "${venv_module}" .venv
+venv_python="${temp_dir}/.venv/bin/python"
+
+# Install build dependencies
+# cibuildwheel 2.18.1 pins the toolchain containers to 2024-05-13-0983f6f
+${venv_python} -m pip install build==1.2.1 cibuildwheel==2.18.1
+
+LIBGPIOD_VERSION=${src_version} ${venv_python} -m build --sdist --outdir ./dist "${source_dir}"
+sdist=$(find ./dist -name '*.tar.gz')
+
+# Target only CPython and X86_64 + AArch64 Linux wheels unless specified otherwise via environment variables
+CIBW_BUILD=${CIBW_BUILD:-"cp*"} CIBW_ARCHS=${CIBW_ARCHS:-"x86_64,aarch64"} \
+	${venv_python} -m cibuildwheel --platform linux "${sdist}" --output-dir dist/
+
+if [ "${force}" -eq 1 ]; then
+	printf "\nRemoving files from %s/dist/\n" "${output_dir}"
+	rm -rf "${output_dir}/dist/"
+fi
+
+cp -fa dist/ "${output_dir}/"
+
+if [ "${calc_hash}" -eq 1 ]; then
+	printf "\nHashes for generated outputs:\n"
+	sha256sum "${output_dir}/dist/"*
+fi
+
+cd "${cur_dir}" || { printf "Failed to return to previous working directory.\n"; exit 1; }
+rm -rf "${temp_dir}"
-- 
2.34.1


