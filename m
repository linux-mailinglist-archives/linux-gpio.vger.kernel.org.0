Return-Path: <linux-gpio+bounces-7377-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 816799045F7
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 22:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 015871F24C0A
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 20:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3871584A21;
	Tue, 11 Jun 2024 20:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4uFiaxd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5881EB657
	for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 20:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718139084; cv=none; b=LHCDVKGWWC2t/sA/TS0uW+EXRD7+SqSyoiUwH/nnyWJvg5PyzshGNGviiuIQngHQnD6i+TnfRdiaD5/729Ly014n1CTxHWfu3Up0prdmXMDwvMXyGAH7AlNXGYDQpGTi2hf5rXQMJWm8OQrIyuV9/zPnNEDtcpGVvdjjcSymOw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718139084; c=relaxed/simple;
	bh=jw9vZ49L4qN6iMInv3qR05Q04ixvX6tKrMepPZA7aDg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IPcQ76bGNla8hO+eqddWmYeQLkBOhLJJLzgir2ytiPcPAPdS6kCBkmWM5euhM7rfth80QryOXsRmqCATzAg1Z2GsMUx4fU6rTYaG5R0m0e9Pp5YRvfnZStTSfxopn20kwBYF4DPVu3cTTKk+J0+yCyrHkdABdAW3dzbgJh4CQ+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4uFiaxd; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4ecf00ea4fbso550984e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 13:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718139081; x=1718743881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qfwXcmO7oypckS8716gVNLV9tDvxrdzwXeJR2SMMLsk=;
        b=S4uFiaxd8ldhTUaaVFzHhTgn5AcZjnlThdx4AHFb454z/6uCY1qgriGsvZVm7ehEa4
         IEt2c5gZtF3BlhcCl0yJdSyWP1MRxTTw/JYIEpMmL37DOKrCsDkg+qAayL1FtdJfrhU2
         KyclU9I7j6pSZiwHz1eLopPUOxDCmrJ3LrNWtEbFcsKZbDVdCR3J8LGejDdlgLfGVUXx
         DrJMoZhotwC8z/y8Du/2fc43IsuXBdbUmFiNRBdoXQ8NliAj2k6e4P86l0Yqm28ruStX
         K/MN6wGg8PCABxbldIJy1h996Lh0WvBVP2KwPtCAH/8vBFeaiXOxI/fFmxEQl4qUltS+
         kXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718139081; x=1718743881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfwXcmO7oypckS8716gVNLV9tDvxrdzwXeJR2SMMLsk=;
        b=foKEFJaQeeHF+z7pW0eitcZevqXeou30ZYmYRdEkgKA1O9EAXnJKEBP7+DNqk2yZM8
         S6+/jUOcATvQPzj9nmnbDGOU07llxvbJtU31yx9lql2lB46AJRWb0Ql1UpJ366T91BjB
         7dmrzPogn2uRrHbTrIhOmUt++BGT/DfFeoBwucbj45uFPxfINMS6Xc9z2EgecBj8Osrt
         Yj+XLlv/1s4mQj9YmtSlik+xClm6fM0zNNqxM/4zpfpZ+PN7+HqRZrDBljFScX3bkh3A
         7bOydQBLZjCSePQAkRb514Sen73s2Z/jY3ZoEkP9tK+PDKhFEkL8iJIch+8x2EaqIYDy
         RgRA==
X-Gm-Message-State: AOJu0YzFyewn72oIyMkOt8BG+Y09qvuth5mwMt80SzLRfmuTN6kDhW7C
	oD1BaJOkW+0R2xy3kUMpbczdEkQ7ffdUAQZsAKavikofrm9HlsFQNWU9cg==
X-Google-Smtp-Source: AGHT+IFytvtJwzIMaoKAB8oe7bPfLrCON/+b7a+wt4ELCbmSIZQNFjNix48ZGTjc9NRlbl9nxXuKqA==
X-Received: by 2002:a05:6122:c90:b0:4ec:f402:a849 with SMTP id 71dfb90a1353d-4ecf402af0emr4142438e0c.16.1718139080810;
        Tue, 11 Jun 2024 13:51:20 -0700 (PDT)
Received: from vfazio4.xes-mad.com (mail.xes-mad.com. [162.248.234.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-795eb92c6f3sm223660785a.108.2024.06.11.13.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 13:51:20 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v3] bindings: python: add script to generate sdist and wheels
Date: Tue, 11 Jun 2024 15:50:41 -0500
Message-Id: <20240611205041.1448276-1-vfazio@gmail.com>
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
Changes v2 -> v3:
 - Add SPDX header

Changes v1 -> v2:
 - spaces -> tabs
 - conform to `shellcheck -oall` recommendations
 - simplify in-script documentation
 - miscellaneous grammar fixups
---
 bindings/python/generate_pypi_artifacts.sh | 134 +++++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100755 bindings/python/generate_pypi_artifacts.sh

diff --git a/bindings/python/generate_pypi_artifacts.sh b/bindings/python/generate_pypi_artifacts.sh
new file mode 100755
index 0000000..c2fb79f
--- /dev/null
+++ b/bindings/python/generate_pypi_artifacts.sh
@@ -0,0 +1,134 @@
+#!/usr/bin/env sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2024 Vincent Fazio <vfazio@gmail.com>
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


