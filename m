Return-Path: <linux-gpio+bounces-8041-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE7927845
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 16:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0347C28AE5F
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 14:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC3F1AEFFA;
	Thu,  4 Jul 2024 14:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Tujkjkj/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B460D1B010D
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jul 2024 14:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720103096; cv=none; b=lb8CyFBMghF0TEkCDRtIQY847pJBbzxc20zF1GD/6BoNPhjfIpLgGFM4EHa7Rzah4vOeQq9yk9uHPdwHYjxLVUS83oSY9napnrnIZwFhW/XRD/2elcFJD5noY95PNip2gb0+Hf0oz8ypCOwnsXUL+VujT3T1TH2VwT5trtmRg5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720103096; c=relaxed/simple;
	bh=EdqzLvAzG+05b9x2OXYwEgMQpLEexMyUgOSBXPx9il4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AZhLQa6aqeI2roX6tdzdD81/hI+8utBkTOBMsLK+SDNSi2pUKS/2ZbCTnq8xvc1FjrDA51URd19sBir8mMa/NM98MyFSp1V7gPNUwEZDVjEVnQUrK8nK/7IwV4k+f1LPnpvfR/SXlsx7v5f+hJdTOon9hfzANhigOaWLj/QKnEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Tujkjkj/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-367a081d1cdso339163f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2024 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720103093; x=1720707893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vH1hlXpE76jPIy2iFQ9ycICOUjgchFi5UE91pisZrdg=;
        b=Tujkjkj/84z4lfpTnFYcmtYO/CMAHGFHjSZo9AxIh10UruQX5APlFjtPxCYHcvSMX6
         dPetRzQW405TTSmknVssLCh2Ja3wZEe5ppeDUEPg8r+8J9G6edbboyKKVr+Bw1uXEMwA
         6D0/vp3oLJacUH4O8MwBW04c7Lu9dEP0LkvYIuqg+SEpusVP5fZatBXrwP/U5hbHReYf
         YWvKppNAnXuib2nN3pHDb4oMPVhNe4+SOEdslSc7bhHcdHCIqLRq/nNYNRCne8kdFjkB
         PxquqctShn1Y7dc1sJFQpTxJ7jImKM4AIt2YnsuUiVQyaHlh4s2CvE9g85eRyDKdh5wi
         3pbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720103093; x=1720707893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vH1hlXpE76jPIy2iFQ9ycICOUjgchFi5UE91pisZrdg=;
        b=THycjxXJC6wkAFqYkPdUMtdu+AtFg9En+pG7J77XsaQIkvDtUjnPwzD3zZjh7OKGHH
         2fvCz4HhnOXGgoWxdD+gaENU/q5yCHJJgc6HGyvUx3OnDTn4vr36PUOzargp+L9GqEIK
         EaIpHj84asz3RNSxT52chJcEeTgROkZGHMKIQlaVmuyHT2ttsYwhyVR/Uh/TUxkMcoH/
         9BiQuJwLQC5cRcrczvF4Y75++3qXOkXiD+HJX+oQNNOHSWSQ7sCGpHzb0yOnrwzMERpI
         rztXs+SA8cGB/uuMnIpJNxvh3TV45R9b19jjeWpNFfuJ/cmMeWfjKFyBPPeYqhuZXTcw
         PIog==
X-Gm-Message-State: AOJu0Yx1txZiA1BwGRRmGlWyG6F1rX4X/wWuZKpqs1zKMpTZIK7NeWvY
	fZSSJOTnI851DhGpi+bvCTm/fg0l7mos73CvZJq4QQGCXcxVGldjRQn625dQJ3k=
X-Google-Smtp-Source: AGHT+IEfADLCtQ1M4aHWRtb6aMQRVCQrT5rf1zlg/sm/HAfAYEmnmyLbCC26vQ8dmuWketVe8czF0g==
X-Received: by 2002:adf:f1ce:0:b0:367:923b:656b with SMTP id ffacd0b85a97d-3679dd65295mr1302205f8f.54.1720103092867;
        Thu, 04 Jul 2024 07:24:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a7bc:91b4:6b09:23cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679927d7aesm2511473f8f.30.2024.07.04.07.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 07:24:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] README: list the development packages required to build the library
Date: Thu,  4 Jul 2024 16:24:51 +0200
Message-ID: <20240704142451.28400-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The error messages emitted by configure when either libtool, pkg-config
or autoconf-archive packages are missing on the host are not very clear
and seem to cause confusion among users building the project from
sources. List the required packages in the README.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 README | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/README b/README
index a6f24d1..a20e801 100644
--- a/README
+++ b/README
@@ -34,6 +34,11 @@ BUILDING
 This is a pretty standard autotools project. The core C library does not have
 any external dependencies other than the standard C library with GNU extensions.
 
+The build system requires autotools, autoconf-archive, libtool and pkg-config
+to be installed on the host system for the basic build. Development files for
+additional libraries may be required depending on selected options. The
+configure script will typically prompt the user for them clearly when missing.
+
 The command-line tools optionally depend on libedit for the interactive feature.
 
 To build the project (including command-line utilities) run:
-- 
2.43.0


