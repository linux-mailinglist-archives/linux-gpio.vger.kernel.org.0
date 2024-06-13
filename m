Return-Path: <linux-gpio+bounces-7429-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B1C90747E
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 16:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A25628516F
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 14:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D11273FC;
	Thu, 13 Jun 2024 14:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yImyc6Ld"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346C0ECC
	for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 14:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718287284; cv=none; b=h/hc0s97EiWuTHM2aO4lVvNzHOM5W2c4NpKR4+PYCxm1CsCNDdkiwZRJsvIUtsgiKFVaJtpb7LQLCQJs3el1ruPsahcZNi1D8/EeXsmQ1broXkbtpFWPizpT4QX/VR3/GqfB2Gh8xqNW+igFodmdiyBJ8axeEN+KNVVKR8Zt+KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718287284; c=relaxed/simple;
	bh=by8Xwx8UcUqeJO640qsAzMJcMky+jPAd5JWuChsdINg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XCtrqDwyLAoyRagKJPUegiqLiPMZ8jqQSjAJkZFEqwxyHdBEBAL45t6BotsJ9m63NpFwqpjx0vielf3ohBMhtyrEWKWod5pncddlcm2FTScKkqxMxIyyxwVO/EIhi3f6XVofUekmk8616KuySnwgxIchO707OeJ+g1KOE0jfDaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yImyc6Ld; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e724bc466fso11630911fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 07:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718287280; x=1718892080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d56pDegUDledTaRRJ2Dci64L2O7V0m4uOemE0vUQxU8=;
        b=yImyc6LdOmxj5flzY9nDCxSQnPXZeiewepYK1Lom3KhEMez0ZY82zOMUwOl97L3GGz
         wd27FlXgGSanGA/1sTQfwZjCE/Gw+Tm7f0ZeHYlAfnX8r738U5AaAdSMADBWCbTkexXg
         P0Apx+SRSlwt9eesI1Dn+X9Yp5DZaesRQRazuUeMG+SD26hKHY8gTSbl10zZPU1KAHQW
         zt+et6MFAmNDxJoU72D1erZjbgkbo2KdbUs/hJpfApjrGJA6Tco8RZXllQTJQMR9v2Rs
         690THGM2IpEosjcU7r1pYHS5VAJ+3yjPPPjh/+WQKDS+fL3PhHpVAgF8JxKaO8241BSL
         D+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718287280; x=1718892080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d56pDegUDledTaRRJ2Dci64L2O7V0m4uOemE0vUQxU8=;
        b=eYc5TpQSW9UWAbG9rV6ys4wC0l2L/7+p13xpHNVE7ktmOgJTbwUscb3yK+4tcVyFeF
         nWIW452VWrI4kPJaOa0dbuF3oT0v2mHr3pNNrjDi8VRxeFGeTcFeEzRBmPZbJDALFf9Y
         pxbhmDZq4BvraUz5CrBUHVUUQfd7Vx3nlLqe5kRloNiGRN4BGHzZg8W4YQZ+R9B32zks
         Z9uBOGbdV58YThxV66hU9aX9g+4sYXOZiDxQlorBDdImGB2eB1ESp7GpljD9hWV48kwj
         W+doU5lnP9hy03Ogv41sC/givWFFwgRJxxxXWzU/jqxfoknalYLiDhSGjYB1wyLXTqlp
         Zjrw==
X-Gm-Message-State: AOJu0YyQcw5ySLbhoKW5zStrQRKNfBDdT8bVsM8ldsmHGoQUKbtFJ5Z5
	N3Ffsagc+1BAoS70iACbjHb31P0uEWpmVB35Mr6Dd0t58elr00ucHdj4fh3KI5zGuxcldxQK8Wx
	3
X-Google-Smtp-Source: AGHT+IGC1PmbRw3ue0Nl1jK7MXX/HtQNPN5r7oWKzR9bXvFIm84k4dMY2Wf1miHuEP3j88YiqbexLQ==
X-Received: by 2002:a2e:b6ce:0:b0:2eb:daae:65dc with SMTP id 38308e7fff4ca-2ebfc99f5eemr41425881fa.48.1718287280364;
        Thu, 13 Jun 2024 07:01:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:8d3:3800:875c:e292:3280:ccac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de5d5sm63303585e9.33.2024.06.13.07.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:01:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vincent Fazio <vfazio@gmail.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] README: add mentions on shellcheck and reuse
Date: Thu, 13 Jun 2024 16:01:17 +0200
Message-ID: <20240613140117.39048-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the "Contributing" section of the README to include mentions of
shell scripts having to pass the `shellcheck` test and the entire tree
having to conform to `reuse lint` requirements.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 README | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/README b/README
index 7a92a49..a6f24d1 100644
--- a/README
+++ b/README
@@ -284,7 +284,9 @@ to send plain text[3].
 
 Code submissions should stick to the linux kernel coding style[4] and
 follow the kernel patch submission process[5] as applied to the libgpiod
-source tree.
+source tree. All shell scripts must pass `shellcheck` tests[9]. All files
+must have a license and copyright SPDX headers and the repo is expected to
+pass the `reuse lint` check[10].
 
 The mailing list archive[6] contains all the historical mails to the list,
 and is the place to check to ensure your e-mail has been received.
@@ -300,11 +302,13 @@ tarballs should be fetched from kernel.org[8].
 
 For more information, refer to CONTRIBUTING.md in this repository.
 
-[1] https://github.com/kward/shunit2
-[2] http://vger.kernel.org/vger-lists.html#linux-gpio
-[3] https://docs.kernel.org/process/email-clients.html
-[4] https://docs.kernel.org/process/coding-style.html
-[5] https://docs.kernel.org/process/submitting-patches.html
-[6] https://lore.kernel.org/linux-gpio/
-[7] https://github.com/brgl/libgpiod
-[8] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
+[1]  https://github.com/kward/shunit2
+[2]  http://vger.kernel.org/vger-lists.html#linux-gpio
+[3]  https://docs.kernel.org/process/email-clients.html
+[4]  https://docs.kernel.org/process/coding-style.html
+[5]  https://docs.kernel.org/process/submitting-patches.html
+[6]  https://lore.kernel.org/linux-gpio/
+[7]  https://github.com/brgl/libgpiod
+[8]  https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
+[9]  https://www.shellcheck.net/
+[10] https://reuse.software/
-- 
2.43.0


