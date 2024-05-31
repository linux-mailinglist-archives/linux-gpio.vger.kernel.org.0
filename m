Return-Path: <linux-gpio+bounces-7022-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BD78D68B3
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 20:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 246851C210D5
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 18:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A16B16DEBD;
	Fri, 31 May 2024 18:07:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EDE7BB01
	for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 18:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717178843; cv=none; b=jAllPDK5mZHbGrdISs3GJ3UFomymPezlLiHTfB0+YHRPfBUntvFogd0MD8Y0WwsKaSoISpvBn5SvEuGCBrkp7UvG72qCv52YZJAX2KPsBRPwsr7VCNJIUE58GGf1Ro7ec2ZLSYVgTPb4y3q1pkJphcen035LHyFFwX34tDPwjlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717178843; c=relaxed/simple;
	bh=2SVrDkJWUq01ntYuzGCxEValwzNRAw1xU73exRs5cUE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZwJEn/yRJUGPQwtcnZWdyV2V9xFMC0Bog5MAs+TpJnmGy2RS35dZGIz1CL+6HfoP8/2es0tzGoenTOA9jjnRGzhFAevyySDesRcBSr0Qg2jyCogn2PgUbxtX4oFLZM5ATMRDgNOPA80lJPQNaU4L8fLe5gZg8wprMi7+OVkpZQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id CE7BD24725;
	Fri, 31 May 2024 13:00:42 -0500 (CDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: add script to generate sdist and wheels
Date: Fri, 31 May 2024 13:00:38 -0500
Message-Id: <20240531180038.1546933-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a simple shell script that generates an sdist tarball and
wheels following the PEP 600 naming convention.

The wheels are generated via cibuildwheel, a tool provided by the Python
Packaging Authority (PyPA) [0]. The tool leverages toolchains within
containers maintained by PyPA [1] to generate wheels that are runnable
on hosts that meet the requirements defined by the tag [2].

The script currently creates X86_64 and AArch64 CPython 3.9-3.12 wheels
for glibc and musl libc based systems.

These defaults can be overridden via CIBW_* environment variables [3].

[0]: https://cibuildwheel.pypa.io/en/stable/
[1]: https://github.com/pypa/manylinux/
[2]: https://packaging.python.org/en/latest/specifications/platform-compatibility-tags/
[3]: https://cibuildwheel.pypa.io/en/stable/options/#options-summary

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/generate_pypi_artifacts.sh | 145 +++++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100755 bindings/python/generate_pypi_artifacts.sh

diff --git a/bindings/python/generate_pypi_artifacts.sh b/bindings/python/generate_pypi_artifacts.sh
new file mode 100755
index 0000000..bedae0f
--- /dev/null
+++ b/bindings/python/generate_pypi_artifacts.sh
@@ -0,0 +1,145 @@
+#!/usr/bin/env sh
+#
+# This is a naive script to generate an sdist and wheels for publishing to PyPI.
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
+# Look specifically for `flags: F` for Fixed and that the binfmt entry is enabled.
+#
+# This script can be run in a Docker container generated by:
+#   docker build - <<EOF
+#   FROM docker:26.1.3-dind-alpine3.20@sha256:76ba10a4aed708c7b2db09d45740d711edf707f7368f6808bd32a53eaed33404
+#   RUN apk add python3 py3-pip
+#   ENV XDG_CACHE_HOME=/tmp/
+#   EOF
+#
+# An example invocation run out of a libgpiod checkout would be:
+#   docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock \
+#     -v `pwd`:/work -w /work -v `pwd`:/outputs \
+#     <hash or label for container> \
+#     ./bindings/python/generate_pypi_artifacts.sh -v 2.1 -o /outputs -s /work/bindings/python -c
+#
+
+usage()
+{
+    printf "\n"
+    printf "Usage: $0 -v <libgpiod_source_version> [-o <output_directory>] [-s <source_directory>] [-ch]\n"
+    printf "\t-v Version of libgpiod sources to bundle in sdist, overrides LIBGPIOD_VERSION\n"
+    printf "\t-o Directory to store outputs\n"
+    printf "\t-s Directory with python binding sources\n"
+    printf "\t-c Calculate checksums for generated outputs\n"
+    printf "\t-f Forcibly remove old files from output directory\n"
+    printf "\t-h Show this help output\n"
+    exit 1
+}
+
+src_version=${LIBGPIOD_VERSION} # Default to environment specified library version
+output_dir=$(pwd) # Default to putting outputs in the current directory
+source_dir=$(pwd) # Assume the current directory has the python binding sources
+calc_hash=0 # Do not calculate hashes by default
+force=0 # Do not forcibly remove files by default
+
+while getopts :hv:o:s:cf value; do
+    case $value in
+        c)
+            calc_hash=1
+            ;;
+        f)
+            force=1
+            ;;
+        o)
+            output_dir=${OPTARG}
+            ;;
+        s)
+            source_dir=${OPTARG}
+            ;;
+        v)
+            src_version=${OPTARG}
+            ;;
+        h | *)
+            usage
+            ;;
+    esac
+done
+
+if [ -z ${source_dir} ] || [ ! -d ${output_dir} ]; then
+    printf "Invalid source directory ${source_dir}.\n"
+    exit 1
+fi
+
+if [ -z ${output_dir} ] || [ ! -w ${output_dir} ]; then
+    printf "Output directory ${output_dir} is not writable.\n"
+    exit 1
+fi
+
+if [ -z ${src_version} ]; then
+    printf "The libgpiod source version must be specified.\n"
+    exit 1
+fi
+
+shift $((OPTIND-1))
+
+# We require Python3 for building artifacts
+if ! command -v python3 >/dev/null 2>&1; then
+    printf "Python3 is required to generate PyPI artifacts.\n"
+    exit 1
+fi
+
+# Pip is necessary for installing build dependencies
+if ! $(python3 -m pip -h >/dev/null 2>&1); then
+    printf "The pip module is required to generate wheels.\n"
+    exit 1
+fi
+
+# Check for a virtual environment tool to not pollute user installed packages
+has_venv=$(python3 -m venv -h >/dev/null 2>&1 && echo 1 || echo 0)
+has_virtualenv=$(python3 -m virtualenv -h >/dev/null 2>&1 && echo 1 || echo 0)
+
+if ! ([ $has_venv -eq 1 ] || [ $has_virtualenv -eq 1 ]); then
+    printf "A virtual environment module is required to generate wheels.\n"
+    exit 1
+fi
+
+venv_module=$([ $has_virtualenv -eq 1 ] && echo "virtualenv" || echo "venv" )
+
+# Stage the build in a temp directory. Note not all shells have pushd/popd
+cur_dir=$(pwd)
+temp_dir=$(mktemp -d)
+cd $temp_dir
+
+# Setup a virtual environment with necessary build dependencies
+python3 -m $venv_module .venv
+venv_python="${temp_dir}/.venv/bin/python"
+
+# cibuildwheel 2.18.1 pins the build containers to 2024-05-13-0983f6f
+# This is overridable via the CIBW_{MANY,MUSL}LINUX_*_IMAGE environment variables
+$venv_python -m pip install build==1.2.1 cibuildwheel==2.18.1
+
+LIBGPIOD_VERSION=${src_version} $venv_python -m build --sdist --outdir ./dist $source_dir
+sdist=$(find ./dist -name '*.tar.gz')
+
+# Target only CPython and X86_64 + AArch64 Linux wheels unless specified otherwise via environment variables
+CIBW_BUILD=${CIBW_BUILD:-"cp*"} CIBW_ARCHS=${CIBW_ARCHS:-"x86_64,aarch64"} \
+    $venv_python -m cibuildwheel --platform linux $sdist --output-dir dist/
+
+if [ $force -eq 1 ]; then
+    printf "\nRemoving files from ${output_dir}/dist/\n"
+    rm -rf ${output_dir}/dist/
+fi
+
+cp -fa dist/ ${output_dir}/
+
+if [ $calc_hash -eq 1 ]; then
+    printf "\nHashes for generated outputs:\n"
+    sha256sum ${output_dir}/dist/*
+fi
+
+cd $cur_dir
+rm -rf $temp_dir
-- 
2.34.1


