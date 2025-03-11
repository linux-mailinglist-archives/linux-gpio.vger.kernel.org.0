Return-Path: <linux-gpio+bounces-17429-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5064A5C330
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 15:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3813C1892DFB
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 14:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0453F25A642;
	Tue, 11 Mar 2025 14:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AcK2GK8d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BFE25B67F
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 14:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741701753; cv=none; b=T1rqPpX5Jx5ZVvU0tejooJprkVBo2vdZChvleQL/+c4EruXrX9q/5x0wMBZnO7sBrC20gyW3WKJhOxcEpq4rZsr1auHrAqBs4+txehlmoc5GyAG45VLHsVaD+wQ5rscsOqd3brOZg39xZRsrvbJ5jrA1Ksh0/VGx3XzDp9z0WwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741701753; c=relaxed/simple;
	bh=wovlUknCbjLtJ7E0dYTE6d0SdIAz+QQhU7+RXFbLgyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dFSt4WjTv3ryo7MA/ix8aGNaqfSaF9+OEeo9Ya5fQwjEkXeKnPBYeivVUZO5cRhdGft7eCjDbOc/61CresN4jG1+vETX797Zr/sJ6CpqB/fx9SsVVkypWY7QvIT4AC/Mlc2jKWtpH60q/IyUmojpNT3cv8BDflD8+uzM1yTpAoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AcK2GK8d; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-390f5f48eafso2722588f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 07:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741701750; x=1742306550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXwjAuPml5bkPhhDdkMy+BAtbFG+Kreb/9IQjZLjvtI=;
        b=AcK2GK8dFnA1XNlQW+NS9gEuOIoLKvYsbnx3MM0Jcfv9oyfuVyWovYkLIwTBwuVOqF
         N27rQ5WACofk2v/WkFgreovJ6fnki2gPmmOAwoftA8B7d7kAq9VCetgVW1sFTwQ3EEhQ
         Y3uvDODb/Vjy1gkwD0CvHYZv9ADcTwH/YknNhclBuNEjZxj5g8R51PPSqPes+kcvoxaF
         mdYJWkDWO8Tuwvv3rO36lhre9xsYJK2id1v8nrtd0Zl71IXGrjePBxbfWHDtOwNCeech
         vlIxR1L6V3W6jaitNTRLHR2UsptqSvGvihR1BYqhbR7WpbwND9BxSff9jqf+iwP64efH
         2sBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741701750; x=1742306550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXwjAuPml5bkPhhDdkMy+BAtbFG+Kreb/9IQjZLjvtI=;
        b=fn5Zl7P5EkL1AmHzRq6T0qOSpQ92MxizLE4aMUCv8NGrYAku0io2v3JWBCAYSdS77n
         VetFMG1ue8rhIboIKEgLXkWfaMz4GDq9hJSFBHZKY4loP8Dierlx/nltleYVRTGup6Ph
         6P1iP09LhIu0DOiP/knkORjDy9mCn3fF+a80CrIJ4i7qzW2/1nTLmn59EbnUvh7U5spU
         1ttKY8yWyaTqFNPwukhl6ZSsla9MpgmvOq6SoawBtCT8EnyQJmFyJi28ux44w9o1BAK3
         98wLrsqvogV/b1QPPimE2BMwHLoFR17bASG9HqmFiUbqO1nWfA7JxKwXVX2rHuwWaufH
         sJFQ==
X-Gm-Message-State: AOJu0Yyx7fC1/v4OPyb22ZIrTfGuucwjO3L8NOHwoiJXMpov5eHlhL7K
	XebWtd4NArBPXKne92ryArJt/V5UAz/pUHr2wGDDcw0l1kG/BwdOhivMebHsuCk=
X-Gm-Gg: ASbGncseYGZWBrxIkQKc3G9SPNUJxR8YcC/K2vpKd+6lBeSPqC9g/gt80XVgcNNvBFi
	XrfVehdSkte86TfnrOEYuv+JpNGFxLpgRa+eaMhl6AYkJLykvezDzSfJV+Ro1hIwwN+VRGny1wR
	x6F6FxJ2HSFS0EDuLbkfyTHC1INpwCGklJ//TL0hEWxXmbUcsEo5J4rgVujtOfcikSEYKyVRG5w
	SohVbp0YO/dZXuhAv+v8MQXeiZSijRZVvmvEES/FdENTG2wd4782eCQnK1iSdNUVE+CVgh2LjZu
	Yz25t8jnY+6btLdnPGS0W2DUyTnO+Nf0Yj1zb8NkzKq00yOUAVzq6Q==
X-Google-Smtp-Source: AGHT+IGAgWjbNLs8CQJ0RZHn3qMqf88yC5Wtucbjza0pbfUhvsqFko7Sn64/I/LH5vZt54IyKKQt9g==
X-Received: by 2002:a5d:47c7:0:b0:391:481a:5e75 with SMTP id ffacd0b85a97d-391481a8d7amr8470519f8f.22.1741701749747;
        Tue, 11 Mar 2025 07:02:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5946:3143:114d:3f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c106a1asm18146297f8f.100.2025.03.11.07.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 07:02:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vincent Fazio <vfazio@xes-inc.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] doc: clarify the differences between building from git and tarballs
Date: Tue, 11 Mar 2025 15:01:47 +0100
Message-ID: <20250311140147.66484-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Several users reported having trouble understanding the "building"
section of the docs and being confused on whether they should use
autogen.sh or configure. Clarify these bits in the docs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 docs/building.rst | 46 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/docs/building.rst b/docs/building.rst
index 958c6fb..aae07d4 100644
--- a/docs/building.rst
+++ b/docs/building.rst
@@ -21,8 +21,21 @@ together with
 Building
 --------
 
-This is a pretty standard autotools project. The core C library does not have
-any external dependencies other than the standard C library with GNU extensions.
+The core C library does not have any external dependencies other than the
+standard C library with GNU extensions.
+
+The project is built using GNU autotools. In the general case, the steps needed
+to download a source tarball, unpack it, build the library together with the
+command-line tools and install the resulting binaries are as follows:
+
+.. code-block:: none
+
+   wget https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/libgpiod-x.y.z.tar.xz
+   tar -xvf ./libgpiod-x.y.z.tar.xz
+   cd ./libgpiod-x.y.z/
+   ./configure --enable-tools
+   make
+   sudo make install
 
 The build system requires the following packages to be installed on the host
 system for the basic build:
@@ -37,23 +50,30 @@ system for the basic build:
    selected options. The configure script will report any missing additional
    required dependencies.
 
-To build the project (including command-line utilities) run:
-
-.. code-block:: none
-
-   ./autogen.sh --enable-tools=yes
-   make
-
 .. note::
    The command-line tools optionally depend on libedit for the interactive
    feature.
 
-The autogen script will execute ``./configure`` and pass all the command-line
-arguments to it.
+The project can also be built directly from the git repository. However in this
+case the configure script does not exist and must be created first - either by
+calling ``autoreconf``:
+
+.. code-block:: none
+
+   autoreconf -ifv
+   ./configure --enable-tools
+   make
+
+Or by executing the provided ``autogen.sh`` script directly from the git tree:
+
+.. code-block:: none
+
+   ./autogen.sh --enable-tools
+   make
 
 .. note::
-   If building from release tarballs, the configure script is already provided
-   and there's no need to invoke autogen.sh.
+   The autogen script will execute ``./configure`` and pass all the
+   command-line arguments to it.
 
 For all configure features, see: ``./configure --help``.
 
-- 
2.45.2


