Return-Path: <linux-gpio+bounces-10992-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 404C399375C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 21:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC09CB2289D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 19:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94ECD1DE3C1;
	Mon,  7 Oct 2024 19:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rCMCCDXJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F981DE3B7
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 19:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728329438; cv=none; b=c6BloTMvy1naLHfpsEAzxFa3tsCfqkIQ1Y+pUdGYUp2PoKuDjgjqCSgOXwX9kPd7FLXNBCbOKDDg9vR1KF/C4B8KBTLV5vRBv/tOFErFhRXihTD8DzoOU5P7WGzs5RverZJl0HnIb4rggGZSCiPSjQvPNOszwmYrw/6icaFa92A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728329438; c=relaxed/simple;
	bh=63sLWxcYmXRF+WAepF+x36n+IhH+6N4LlffRri+/Pcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oXsOWsLOdZXEAFTOT8PW+H20RkbXrB9IS7iC8tObaWXRIsOAmgQLtFaby3SgzWAszaFSwxB5wfXnkLO2XVDKVpzuEFRrHShcRNVDhfdLpdEZWOGoSngGBBLRk/5PCVIHTqSRtRDlPXufFzJp5DHyq51aqv7+D/31OM5Unl6smdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rCMCCDXJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42cafda818aso50006165e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 12:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728329434; x=1728934234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25YUxsb9akY7PvWr8m/wSGkMFRJg5/KsPfOZBQb4y7k=;
        b=rCMCCDXJNdxseBwOjKU2Xro40+F1Yam2sfEFD1P20ZBveRKLyHTg5PvyO1xL+wZcDX
         AZQsIcuQ+iq7b55IJyTl3ymUDq68ElG2uP/0DML9S11M2gqDp4kVrvHVyjbKebkB8lT/
         SClomeBRAuEedeXm6egugBcjt+A+yZ64+T6LT3bazDU9c715+dbZvHzXkR6NUYScvZb3
         yAOlHF0/b/WqbtjJj8WVvjHMp/Zo2Rr8BTOUNb685cV0aIJ6jVTdnsl2qQ0+I/pF6LR1
         q8SPvCx1xwKnB1bJkBjXAiH3bRVHSvjAtyeUa0fYCqfhZvJW8WXF6dUDR88btsUwn7XY
         hBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728329434; x=1728934234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25YUxsb9akY7PvWr8m/wSGkMFRJg5/KsPfOZBQb4y7k=;
        b=OuEMJt2qoG3xfbysKV4BmjX73nkwgpbtETJW0ttRTi7sLFt5g3Hus7rrdDmqJwlHkv
         eQkxkRSMtJDDXD2z4RDXF2YoWaYdJaQZwbthkJZnQP3PIIxvaPzyQ7fB1BxI1v1DDi2e
         mwPBqNMSG3fXiKAPLR+x21NJINX/4WymYUo6kkAj3zO/IknVwsPRvpNj5VjmJ7A6+9h+
         OsTmj17bUotoZOTf3890eNS5TsyaGtxEbdnGjtmE/t4IO7Y/cTZ8GKXV5W1Hfw156rmR
         HtWBy2GdZgaWTULWb4AQu4wIpb6GBg2QAng+jlyR6GeSzX1nZjL2vZID8Qh+bvfpdCXj
         smJw==
X-Forwarded-Encrypted: i=1; AJvYcCUEWs4qif7cHHOdhJyBEVnM45T/42S7JDTDDpPs9i8r+PpBAeMj/z6i6XVt3HL7dS59fJY+XjKFkUcf@vger.kernel.org
X-Gm-Message-State: AOJu0YyvdTRcgICqMMw6hEmeYnscucay/wtGnOsPTcSVj1qRuhGwb8p0
	jq78/gTp2aVYVBmvcWZEg1azdBvwlUTg+bA1hu2yWxFunbYKobfZRorfwWxGrLQ=
X-Google-Smtp-Source: AGHT+IHcJgLYymhs74g21d2IgKl93DtqiklSroOmPHhbArAYvA71H+bdbq4g6x3BkluabgoalNDt6Q==
X-Received: by 2002:a05:600c:1d0e:b0:42c:b995:2100 with SMTP id 5b1f17b1804b1-42f85a6d722mr81139395e9.6.1728329434397;
        Mon, 07 Oct 2024 12:30:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6100:637:cbe9:f3bc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a2052asm101321905e9.18.2024.10.07.12.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 12:30:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Oct 2024 21:30:23 +0200
Subject: [PATCH libgpiod 2/3] dbus: client: notify: free chip and line
 lists at exit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-dbus-memory-fixes-v1-2-0d56d1aa032d@linaro.org>
References: <20241007-dbus-memory-fixes-v1-0-0d56d1aa032d@linaro.org>
In-Reply-To: <20241007-dbus-memory-fixes-v1-0-0d56d1aa032d@linaro.org>
To: Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=824;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MJ2k/ebiUib5arRMg4oghZtEGHdH87fRjj6Uq1GmkYk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnBDbXjioMxudb9CuUsPS2LtzIsbYFDueZNHWfH
 WUysYAWSgaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZwQ21wAKCRARpy6gFHHX
 cn3UEACnQl2Xp5Y1GVllV1lqwq+yYDMUbK/oHOOU40cSWQtL95mpY+uzLUlJm7gDU2c3sUEy2S2
 Q1wc0KDL6CwSk4vz2rxgG1t8A0/d5TqAtGzsAbIo5/CEFfyDuAVzXtIecbPL9DUQ57f5OmdEfir
 3MQzcAqoEalkDP+STpUfVXZ5iLnjjfh3Vh4oVbauVUNXo1LKdPuDtpCqbtGQ0z+cEU2RibO+IXE
 lqwQriZgKV4QzAkg2IGQ7UL0Vh/cnOQMFN0JMbXtJ1ML9i4jC6m/0TV77KGIHTfPzkpmr25RMjt
 gNFpqPGuteyZ3CQfjP48/LNKOKixL4f56/U4CJW+Nlyj8lPORAI0OffGAORRiM5p6qhEKFrt/Ks
 4tCfbclUBZaBNKZTWNtACiJtqO5PPj/SAbEe/UmHcWfQVTi6G7KtzC6zRMcXJn7PC+ymHdmzpuX
 2Lel0O5AQj+GwvdgOIX5eoRS5W1p46loMGqG+g0YjX9T9c0ljd46XyA0wjTSkendGWT5AH9T9vo
 jB4XgokXrQ6O+JOpaDcbZqHuvxuVgEo+wzNZ9vYfVBAIworYWHJG/jv54aS3rHaCXFX1q2+YBBe
 Eby2D+fKPn7dUVgY7DsCQznTgdpmO2Dat4XsaANwspBE+WKxr0rScmIOELpAHAtaC1xlfN0dbFe
 fRlH4PiLQHxUfaQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We don't free the lists storing line and chip objects for the duration
of the program when exiting. Fix it.

Note: these objects need to be kept alive for D-Bus events to work.

Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client and tests")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/client/notify.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/dbus/client/notify.c b/dbus/client/notify.c
index 6d51a6f..800dd24 100644
--- a/dbus/client/notify.c
+++ b/dbus/client/notify.c
@@ -289,6 +289,8 @@ int gpiocli_notify_main(int argc, char **argv)
 
 	g_main_loop_run(loop);
 
+	g_list_free_full(data.lines, g_object_unref);
+	g_list_free_full(data.chips, g_object_unref);
 	g_bus_unwatch_name(watch_id);
 
 	return EXIT_SUCCESS;

-- 
2.43.0


