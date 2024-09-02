Return-Path: <linux-gpio+bounces-9594-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A772A968C8A
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 18:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 623EB283C71
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 16:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263A819E96F;
	Mon,  2 Sep 2024 16:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ni83wkt8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9961AB6EE
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 16:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725296210; cv=none; b=PCj5yohHxvmVUbknC3uFGuGdDaVuBvNUYbQ1QDK4SFqcpEDMi23SAIuostUfvEN/hYxRipnYGiDExSbc8Q5Cz4kIP+APP6MuprZzAbWAqOpvXZPM6zVm5ZPiWnRhfudiZL1icu3CGi/98pXBWP2gzG9Z1A8F6w3bgfElaq0TgGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725296210; c=relaxed/simple;
	bh=7OWdNFTLbMVkUie3btnV64eYXxx1lrWgjL2/dfu+7N0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cBzh+zh/jv5nWjLJg1kNVDjdb35FCuKLk8dUzZqxcKjOLruD+OuJaXJYT0mHt/JYakP0HE74PqROc+RusBofQgKBX5VEL9OTSnQyXr1CxtVDclYetcV9dsufypXCaT1pktBhqd9pVLv4QytSN4dll072sh9WvtBE4micenk8ilA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ni83wkt8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42bc19e94bdso21579425e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725296207; x=1725901007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=loZSzETItOqrzhYXverPtWb/RqyszfLPekeF73Htq/o=;
        b=ni83wkt8QG+IN2i1ieh7uTD7LpyUOyMTDapm8FtWNrz0IXYqwSsPoZuRJmRNpZXx1u
         D/VMG3l/LVk4AHi5UsRnvnSbTg9sOyF1OscT5ggDfIFA7Ean4ciP+RT11m/dv3pQyKQy
         NWr036nc5GDiz7VjhadFqTswQvrNShKFIS/pN08oFm+pMcaVtRXYqXX/r6f2cl2IcLEZ
         Nw6Ty0jmmqCqdkImeBmRdbVCsL+yW/yyJvEc9UfElyPbILW2Bt6XoHpuPq+/Wo5pmNd9
         kN5Q14rLiLzNW6vq9WfrtgGv4tq6IXGUqQok/fO0PLK6rlXMqIPYECjXQKqFFFVV3oB8
         gwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725296207; x=1725901007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loZSzETItOqrzhYXverPtWb/RqyszfLPekeF73Htq/o=;
        b=KKqu++4uo1fc8hrBQ0s7jGFd9FEjVo6rqcLaaf9cwkjzEUDvNQdx+y8IX9u3wKJ1AT
         mNB7msAIU/sjbF7DWKdua1l7H1qiWiRiKvoEmmYR4vnueV027zStsRaX9ionS1SmeVjK
         n5HklQpOefLbycEYxjvrtvPyV1QfgsasrJO0DbNBI2tgKFHZeMb43ZRRmZ+F9FLjxR6g
         39fKVY7RaewhnOWCF/VZ0Y79+QAc2ToQgaG3//i038JSmQaB9QrCbeNsPPV+YZZuNa6I
         /rVN4cBhqaoYN2WtPhoMx/wiKDrPQuYtGHOoAPSkVAO0Il7Jd615i89rQoyTexN+ewVo
         CHPA==
X-Gm-Message-State: AOJu0YwRiUt7ExOwFNoqOpkbWiTpH7HSAYaRmVrR1TuDEldBJvcUFT+k
	bFnitmU2Un44kRl5NBZGA+j2ZxpAADPq5jcnD2CNfAQVcwaeT4BoaZMf8KH1wgMrj9c47yLE/dh
	6
X-Google-Smtp-Source: AGHT+IH9T9qC4ZEWV+1EGUg7SKMiysJ8G/5Lnd3sUYf47dKbcNvpFRM6qjvHcvwcUMS3IvoTVLPRDg==
X-Received: by 2002:a05:600c:a05:b0:428:29d:4b59 with SMTP id 5b1f17b1804b1-42bb01c2271mr120369465e9.20.1725296206430;
        Mon, 02 Sep 2024 09:56:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df84b9sm143896855e9.24.2024.09.02.09.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 09:56:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Douglas Silva <doug.hs@proton.me>
Subject: [libgpiod][PATCH] README: add --enable-bindings-glib as required argument to build D-Bus
Date: Mon,  2 Sep 2024 18:56:36 +0200
Message-ID: <20240902165636.43268-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GLib bindings to libgpiod are required to build D-Bus and both
--enable-dbus and --enable-bindings-glib options must be passed to
configure so make it clear in the README.

Suggested-by: Douglas Silva <doug.hs@proton.me>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 README | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/README b/README
index 80ad939..e325f5f 100644
--- a/README
+++ b/README
@@ -241,10 +241,11 @@ majority of the GPIO chardev's functionality and implement it from both the
 server and client sides in the form of the gpio-manager daemon and the gpiocli
 command-line utility for talking to the manager.
 
-DBus support can be built by passing --enable-dbus to configure. The daemon
-is bundled with a systemd unit file and an example configuration file for the
-io.gpiod1 interface that allows all users to access basic information about the
-GPIOs in the system but only root to request lines or change their values.
+DBus support can be built by passing --enable-dbus and --enable-bindings-glib
+to configure. The daemon is bundled with a systemd unit file and an example
+configuration file for the io.gpiod1 interface that allows all users to access
+basic information about the GPIOs in the system but only root to request lines
+or change their values.
 
 With the manager running the user can run gpiocli to control GPIOs by asking
 gpio-manager to act on their behalf:
-- 
2.43.0


