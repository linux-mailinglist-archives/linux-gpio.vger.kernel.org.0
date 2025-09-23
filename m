Return-Path: <linux-gpio+bounces-26530-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAEFB97731
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 22:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A40B417D88F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 20:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D274301716;
	Tue, 23 Sep 2025 20:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKtjZSg3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63792EBDE0
	for <linux-gpio@vger.kernel.org>; Tue, 23 Sep 2025 20:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758658073; cv=none; b=NyBXfIAlNZi24MFwUjXlnxJPpAlulAdfySbzCL9H5XGeQHuF56l9JZLSCri3R9g66jJedlZo6+Bjwjm5u1C4B+8EMoWvMlGanTtzIMXiJczJcyvsfOh5xIUiV6j/xCtnPF9M2yNnGMRtcUMUvzsrjLsuirBUj3pkhRjGodcSdFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758658073; c=relaxed/simple;
	bh=nzaKuqsMqLk0KaI+44dGF9OBhPL2+uKhnAeHRpKUN7o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KAso9opJj4ZOpljoVue88QGT1tySLo8j+csEfRzYMPJydwMB/o4pUcZ9QTiWOLzUetwOKl8tqb6V2KDHMmJG4C2I+Udj5soCuACLScOogu++dXnKIwiw0ljmSx0+uA5oYV3j53J1NaVJRD3vpWTOeTLdDCP4qBY9ctTSirpKHsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKtjZSg3; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-4257f2b59ffso1495305ab.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 Sep 2025 13:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758658070; x=1759262870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JntGQxmTraCNs5OrsUIV5JQo1eR5sot8ORA2vuz4yOY=;
        b=cKtjZSg3ekFzarxMwZtpp2vAAV/VzhFxinYwyabX0dR97DNAH9urvWpqjs6QNAJjHK
         uppkZ8eyK92KbNXlr5txpA2c3tZ1fC2jDQHBvgM7u76Hy1x7D2BTL8pCoZVeMyZt6WIx
         Z1M6MC8WcEmTGkZVG4KuW0fWsP9Ss7rU4dH3uWcO3sQUREJc+3oUWFK5EM89PRepl365
         0NILiXBVHL8++gixXq43lnR492mC0j7zN/AZ8emVlv6HzvBXX4ePNdlaUd3VLPwFJXJ3
         p8gQ4fFMIlorekA6w7BQdTAA4goBlEKCuDcaR6JNJ8Znzz+2BmivcF7SB0E0NkvH5Qk6
         ufKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758658070; x=1759262870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JntGQxmTraCNs5OrsUIV5JQo1eR5sot8ORA2vuz4yOY=;
        b=K63ummGeNzhaAz8hyy0HqUA2IjNyx91pxWd1lJZ84ewvaYeMaOFYuD3PsPhPdHtblZ
         cC0mUq/j4Ppi/a+K4hD4U2VGL/UJhGydncBaUDoNseWbxhP6woAMN4ghEtOcRRqvfzPm
         a5UjINvtUCLbSZttU7UuHgOqmh94pKFMXFzQxYCuMPZ2+CK5aTdybt+TpP9krwBuEWll
         dYispce8Aek8IhEwL75HxmNo1ElmcRQYd9qubtKehIxBnb2gOGYX1/UdXs/k9RQbZsjS
         h8KLTpJ+6NjINp0NcSsqChID/b+6HjBAssaIzrBzvDqyW8dyXv4SfBF0bvR4c4c+NGim
         Gw4w==
X-Gm-Message-State: AOJu0Yw5E9/J3/4lBBXp80UgEth+SxJIZ76MilYI7PtsT+H1E9eIrq4X
	ekZXGBZrd9o662XHh78l9REhVFm5zktvCgMXHBBqbfpImYwr1mP+F/Nf1uG/kA==
X-Gm-Gg: ASbGncva1ski4Ti7ss5JwyUHGlFWKlDIjECDlgUS2uTyUbJUrAu8LM5lLBRUS5MSRIG
	AsL7l/8AAdvbd+Q8nOhwdxDw2eEhIAdLGPedLDDoQnnjL2qiEYtQXpR+55sOGnRFrJldk8hCpE6
	+3ULqf+vtfA/gIRcAlBi/Tp4A8IHN0T6/V60I3xAUobyosPZ1s3fQq+fc6YKCd8BxnOIbNOtWPS
	NmNAeHeCTLovw36NMWwVdZsLrl9zn3cuIPyo192wS2aEneJpnnfikEVJNyidZhbqjmSTyUoJYYw
	ZJHibk5Ysk53KzdiPsutUymkBS1/WmmsOll/EnhtN8TvAMsBXkPBHKS19K9PhcQF6S3OfjXlMEW
	A3KcIpHzMyM8v0oI+Tj0CBvlOuj4KtT+DjlXziUkG5ekjW+Tn7wO+Ufrjfq8Wu6XJyXIk
X-Google-Smtp-Source: AGHT+IGtMuvF6gMX/ZK7myVxXqm5z1feRe7uJdaBagVwspalYsnZ3BsOhvLfFvYe562lJgB2AjtPiA==
X-Received: by 2002:a05:6e02:1a26:b0:424:805a:be98 with SMTP id e9e14a558f8ab-425823160ecmr54412245ab.9.1758658070484;
        Tue, 23 Sep 2025 13:07:50 -0700 (PDT)
Received: from vfazio4.xes-mad.com (syn-024-177-130-178.biz.spectrum.com. [24.177.130.178])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42449436acesm72976515ab.0.2025.09.23.13.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 13:07:50 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@xes-inc.com,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: generate wheels for CPython 3.14
Date: Tue, 23 Sep 2025 15:07:37 -0500
Message-ID: <20250923200737.3177136-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update cibuildwheel to add support for generating 3.14 wheels.

Configuration options for cibuildwheel have been moved to pyproject.toml
to keep it in line with other tools used by the bindings.

The configuration has been updated to skip generating free-threaded
wheels since the bindings do not support free-threaded builds [0] and
cibuildwheel generates them by default starting with CPython3.14 [1].

[0]: https://github.com/brgl/libgpiod/issues/117
[1]: https://github.com/pypa/cibuildwheel/pull/2503

Closes: https://github.com/brgl/libgpiod/issues/138
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
Testing was performed on CPython 3.14.0-rc2 for manylinux wheels and rc3
for musllinux wheels. Some test evidence is in the closing issue [0].

[0]: https://github.com/brgl/libgpiod/issues/138#issuecomment-3320487586
---
 bindings/python/generate_pypi_artifacts.sh | 6 ++----
 bindings/python/pyproject.toml             | 6 ++++++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/bindings/python/generate_pypi_artifacts.sh b/bindings/python/generate_pypi_artifacts.sh
index d5dbd31..d36c606 100755
--- a/bindings/python/generate_pypi_artifacts.sh
+++ b/bindings/python/generate_pypi_artifacts.sh
@@ -108,14 +108,12 @@ python3 -m "${venv_module}" .venv
 venv_python="${temp_dir}/.venv/bin/python"
 
 # Install build dependencies
-${venv_python} -m pip install build==1.2.2.post1 cibuildwheel==2.21.3
+${venv_python} -m pip install build==1.3.0 cibuildwheel==3.2.0
 
 LIBGPIOD_VERSION=${src_version} ${venv_python} -m build --sdist --outdir ./dist "${source_dir}"
 sdist=$(find ./dist -name '*.tar.gz')
 
-# Target only CPython and X86_64 + AArch64 Linux wheels unless specified otherwise via environment variables
-CIBW_BUILD=${CIBW_BUILD:-"cp*"} CIBW_ARCHS=${CIBW_ARCHS:-"x86_64,aarch64"} \
-	${venv_python} -m cibuildwheel --platform linux "${sdist}" --output-dir dist/
+${venv_python} -m cibuildwheel --platform linux "${sdist}" --output-dir dist/
 
 if [ "${force}" -eq 1 ]; then
 	printf "\nRemoving files from %s/dist/\n" "${output_dir}"
diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
index 3217412..45d50ae 100644
--- a/bindings/python/pyproject.toml
+++ b/bindings/python/pyproject.toml
@@ -27,6 +27,7 @@ classifiers = [
   "Programming Language :: Python :: 3.11",
   "Programming Language :: Python :: 3.12",
   "Programming Language :: Python :: 3.13",
+  "Programming Language :: Python :: 3.14",
 ]
 
 [project.urls]
@@ -80,3 +81,8 @@ ignore=[
 "gpiod/__init__.py" = ["F403", "F405"]  # ignore warnings about star imports
 "tests/__main__.py" = ["F403"]
 "tests/**.py" = ["F841"]  # ignore warnings about unused variables
+
+[tool.cibuildwheel]
+build = "cp*"
+skip = "cp31?t-*"  # Do not build free-threaded wheels
+archs = ["x86_64", "aarch64"]
-- 
2.43.0


