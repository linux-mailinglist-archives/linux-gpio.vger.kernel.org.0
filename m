Return-Path: <linux-gpio+bounces-7175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B43818FD0EC
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 16:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51531285C13
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 14:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF19919D8B0;
	Wed,  5 Jun 2024 14:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="r0moTM2y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF50419D889
	for <linux-gpio@vger.kernel.org>; Wed,  5 Jun 2024 14:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717598130; cv=none; b=aTtdY9+9MkYcxVpkmiBPjHuLU2UvCioc1+mY48LxD/TbqAth4WBf+kJMaf7fiY0tywuFK7d9Px8MoQMui4F8MRJkt6maWUXcOajD9QmP3C0eScvSHKMpOVouIsm5OZXoMPqaL0B1VN03gtioBdRWNGgVTmYWRj5b2ip+kMLET9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717598130; c=relaxed/simple;
	bh=Ziezn14VBhduXA2dYyMjSwYhTDWGBmOvNT7yXfHsStQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4Zl9j0dUJlGoUylAJyy1/6QAzBqX4VlJ6OXcKmBtvE0OStNLfwuFSUw9h3mi/fDG36rem2TzNRhE9lv9SbnxVam+CaGUIK2ej2eT9UUrove8QlvxKsLg4kNBeM/zvkhscR6f4quxcNnCS2TGoDrneexKA11uMTHgRVohFUUMGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=r0moTM2y; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e73441edf7so73630751fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jun 2024 07:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717598127; x=1718202927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GOZBKguXfCAbMVvZCBXkmhzqz5OuM26mmurN74RAQ8=;
        b=r0moTM2y8FXSL6KuW2QEVyUG/tv884mUrFbJnFgzkZN0t1MgB5MSyPgLMYkCwFRara
         qvZDEKmlaGogwE5shTD22S29sB9Yu5yNYPIKifFltBataXm/YUuq/fqyb6m2TF+CXrDE
         1IQUl3HXvdxY/mTPU79Ms2hnQ/tNO4gML7EOG+5rQFuEkoeKUNzKRtSeTtANMt7mq+UE
         6cezKSF6pkjlXRQdWfA78GvYgXfDmNzWKeg3AGlSMm25WcL8WdvoZWnykeVq29AozpN5
         QqP9MGRDWy7pkAGJ6CRJA1XnwfR2QoKFlqswRoyGuwoS4S1tybXX2xEAGegqnbemfnuu
         XLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717598127; x=1718202927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GOZBKguXfCAbMVvZCBXkmhzqz5OuM26mmurN74RAQ8=;
        b=lZAsNBo1Zqqj8Ix/IXLcqskD/kQSz+ZBkRmESoX4LIASIhNeNOQIl1VWnGc5kg/a2S
         /N9X8sLBmWv0bmKW6NvOph2VcAk2ApXexpgwTqmj24on48U0R+8HHoz/Z60utbuaUgX2
         LEoyHPSoneugoj4LYO61dK5bRM2dRZyhrYuooJpaFOK7nZnUAO+tLfFJ/TUjr6Pt4/lB
         qndFSfwCCTj6ynn4PdJGacK4e8/J4Uo+VEy+XvzLw9o9+To2u55awd9nJV27W2PkRE+u
         jYEjggc0vY34CDTkN6yAL4GfkH0/bLEhgR9BmB9KakTq8m7mWw5E7g1aXtItBWaQXpaC
         KcAg==
X-Gm-Message-State: AOJu0YzDNy7prR+Ce3I7BGUtvhZR480lBxdVk1kFje/nxGfJmQwtEVAo
	lc7K8oV31D7y+BbCPZz4WcZPCRLMO6lNMlNXPxoyE5zY/JwjhLwJ2NdTYEf0PKF+xT/EOffowUL
	ycxRS8FJKqUfghr6JHV7vpNfo81/8dCSOwwvAXpByeay0wB/x
X-Google-Smtp-Source: AGHT+IEt+ls8TTTI3mWkrpoEm8Ubp79xyev/GsaZYh9SQMgzY33Vyx/bNLudHJFegXQCVULzt8Opq56CK3aEU+Nh4xc=
X-Received: by 2002:a2e:9842:0:b0:2ea:7a06:3a80 with SMTP id
 38308e7fff4ca-2eac7a72b78mr12917231fa.32.1717598126745; Wed, 05 Jun 2024
 07:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531180038.1546933-1-vfazio@gmail.com>
In-Reply-To: <20240531180038.1546933-1-vfazio@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 5 Jun 2024 16:35:15 +0200
Message-ID: <CAMRc=MdOanga0caQuXCt9SPupYaMxsn7YDx7Qofup+W1kJFgPg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: add script to generate sdist
 and wheels
To: Vincent Fazio <vfazio@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 8:07=E2=80=AFPM Vincent Fazio <vfazio@gmail.com> wr=
ote:
>
> Introduce a simple shell script that generates an sdist tarball and
> wheels following the PEP 600 naming convention.
>
> The wheels are generated via cibuildwheel, a tool provided by the Python
> Packaging Authority (PyPA) [0]. The tool leverages toolchains within
> containers maintained by PyPA [1] to generate wheels that are runnable
> on hosts that meet the requirements defined by the tag [2].
>
> The script currently creates X86_64 and AArch64 CPython 3.9-3.12 wheels
> for glibc and musl libc based systems.
>
> These defaults can be overridden via CIBW_* environment variables [3].
>
> [0]: https://cibuildwheel.pypa.io/en/stable/
> [1]: https://github.com/pypa/manylinux/
> [2]: https://packaging.python.org/en/latest/specifications/platform-compa=
tibility-tags/
> [3]: https://cibuildwheel.pypa.io/en/stable/options/#options-summary
>
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>  bindings/python/generate_pypi_artifacts.sh | 145 +++++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100755 bindings/python/generate_pypi_artifacts.sh
>
> diff --git a/bindings/python/generate_pypi_artifacts.sh b/bindings/python=
/generate_pypi_artifacts.sh
> new file mode 100755
> index 0000000..bedae0f
> --- /dev/null
> +++ b/bindings/python/generate_pypi_artifacts.sh
> @@ -0,0 +1,145 @@
> +#!/usr/bin/env sh
> +#
> +# This is a naive script to generate an sdist and wheels for publishing =
to PyPI.

It's not naive, it works fine so let's not exaggerate.

> +#
> +# This script requires:
> +#   * Python3 + venv or virtualenv + pip
> +#   * Docker or Podman (https://cibuildwheel.pypa.io/en/stable/options/#=
container-engine)
> +#   * binfmt support and qemu-user-static for AArch64 registered as Fixe=
d
> +#     (https://docs.kernel.org/admin-guide/binfmt-misc.html)
> +#
> +# On Debian based systems, AArch64 binfmt support can be checked via:
> +#   cat /proc/sys/fs/binfmt_misc/qemu-aarch64
> +#
> +# Look specifically for `flags: F` for Fixed and that the binfmt entry i=
s enabled.
> +#
> +# This script can be run in a Docker container generated by:
> +#   docker build - <<EOF
> +#   FROM docker:26.1.3-dind-alpine3.20@sha256:76ba10a4aed708c7b2db09d457=
40d711edf707f7368f6808bd32a53eaed33404
> +#   RUN apk add python3 py3-pip
> +#   ENV XDG_CACHE_HOME=3D/tmp/
> +#   EOF
> +#
> +# An example invocation run out of a libgpiod checkout would be:
> +#   docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock \
> +#     -v `pwd`:/work -w /work -v `pwd`:/outputs \
> +#     <hash or label for container> \
> +#     ./bindings/python/generate_pypi_artifacts.sh -v 2.1 -o /outputs -s=
 /work/bindings/python -c
> +#

I ran it directly and it generated the wheels, is it not recommended?

> +
> +usage()
> +{
> +    printf "\n"
> +    printf "Usage: $0 -v <libgpiod_source_version> [-o <output_directory=
>] [-s <source_directory>] [-ch]\n"
> +    printf "\t-v Version of libgpiod sources to bundle in sdist, overrid=
es LIBGPIOD_VERSION\n"
> +    printf "\t-o Directory to store outputs\n"
> +    printf "\t-s Directory with python binding sources\n"
> +    printf "\t-c Calculate checksums for generated outputs\n"
> +    printf "\t-f Forcibly remove old files from output directory\n"
> +    printf "\t-h Show this help output\n"
> +    exit 1
> +}
> +
> +src_version=3D${LIBGPIOD_VERSION} # Default to environment specified lib=
rary version
> +output_dir=3D$(pwd) # Default to putting outputs in the current director=
y
> +source_dir=3D$(pwd) # Assume the current directory has the python bindin=
g sources
> +calc_hash=3D0 # Do not calculate hashes by default
> +force=3D0 # Do not forcibly remove files by default
> +
> +while getopts :hv:o:s:cf value; do
> +    case $value in
> +        c)
> +            calc_hash=3D1
> +            ;;
> +        f)
> +            force=3D1
> +            ;;
> +        o)
> +            output_dir=3D${OPTARG}
> +            ;;
> +        s)
> +            source_dir=3D${OPTARG}
> +            ;;
> +        v)
> +            src_version=3D${OPTARG}
> +            ;;
> +        h | *)
> +            usage
> +            ;;
> +    esac
> +done
> +
> +if [ -z ${source_dir} ] || [ ! -d ${output_dir} ]; then
> +    printf "Invalid source directory ${source_dir}.\n"
> +    exit 1
> +fi
> +
> +if [ -z ${output_dir} ] || [ ! -w ${output_dir} ]; then
> +    printf "Output directory ${output_dir} is not writable.\n"
> +    exit 1
> +fi
> +
> +if [ -z ${src_version} ]; then
> +    printf "The libgpiod source version must be specified.\n"
> +    exit 1
> +fi
> +
> +shift $((OPTIND-1))
> +
> +# We require Python3 for building artifacts
> +if ! command -v python3 >/dev/null 2>&1; then
> +    printf "Python3 is required to generate PyPI artifacts.\n"
> +    exit 1
> +fi
> +
> +# Pip is necessary for installing build dependencies
> +if ! $(python3 -m pip -h >/dev/null 2>&1); then
> +    printf "The pip module is required to generate wheels.\n"
> +    exit 1
> +fi
> +
> +# Check for a virtual environment tool to not pollute user installed pac=
kages
> +has_venv=3D$(python3 -m venv -h >/dev/null 2>&1 && echo 1 || echo 0)
> +has_virtualenv=3D$(python3 -m virtualenv -h >/dev/null 2>&1 && echo 1 ||=
 echo 0)
> +
> +if ! ([ $has_venv -eq 1 ] || [ $has_virtualenv -eq 1 ]); then
> +    printf "A virtual environment module is required to generate wheels.=
\n"
> +    exit 1
> +fi
> +
> +venv_module=3D$([ $has_virtualenv -eq 1 ] && echo "virtualenv" || echo "=
venv" )
> +
> +# Stage the build in a temp directory. Note not all shells have pushd/po=
pd
> +cur_dir=3D$(pwd)
> +temp_dir=3D$(mktemp -d)
> +cd $temp_dir
> +
> +# Setup a virtual environment with necessary build dependencies
> +python3 -m $venv_module .venv
> +venv_python=3D"${temp_dir}/.venv/bin/python"
> +
> +# cibuildwheel 2.18.1 pins the build containers to 2024-05-13-0983f6f
> +# This is overridable via the CIBW_{MANY,MUSL}LINUX_*_IMAGE environment =
variables
> +$venv_python -m pip install build=3D=3D1.2.1 cibuildwheel=3D=3D2.18.1
> +
> +LIBGPIOD_VERSION=3D${src_version} $venv_python -m build --sdist --outdir=
 ./dist $source_dir
> +sdist=3D$(find ./dist -name '*.tar.gz')
> +
> +# Target only CPython and X86_64 + AArch64 Linux wheels unless specified=
 otherwise via environment variables
> +CIBW_BUILD=3D${CIBW_BUILD:-"cp*"} CIBW_ARCHS=3D${CIBW_ARCHS:-"x86_64,aar=
ch64"} \
> +    $venv_python -m cibuildwheel --platform linux $sdist --output-dir di=
st/
> +
> +if [ $force -eq 1 ]; then
> +    printf "\nRemoving files from ${output_dir}/dist/\n"
> +    rm -rf ${output_dir}/dist/
> +fi
> +
> +cp -fa dist/ ${output_dir}/
> +
> +if [ $calc_hash -eq 1 ]; then
> +    printf "\nHashes for generated outputs:\n"
> +    sha256sum ${output_dir}/dist/*
> +fi
> +
> +cd $cur_dir
> +rm -rf $temp_dir
> --
> 2.34.1
>
>

We use tabs for indentation in all other scripts, can you please do it
for consistency. Also: please make sure the script passes shellcheck
as we now use it to keep the scripts at least somewhat correct and
consistent.

Bart

