Return-Path: <linux-gpio+bounces-15292-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36286A2614F
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 18:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F42381883F53
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 17:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4D420B807;
	Mon,  3 Feb 2025 17:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="flSIZfhh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA49D20C46A
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 17:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603242; cv=none; b=Y2aJBtnEDMj3k2l6fLnjO5A/BsoxDPCVrPN2+EHKXfRxTd0DyEHMMn0yZk+ThIr1XELb8TCKCJoC64lVhtLmsdthCPZC34n4RG4IGHKzmuH2ccM2yU2CUejkkOjl6FlTpER1a7ar3lqzHtSF4eaSg8a+QC4L6SORlCcze0LQ7Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603242; c=relaxed/simple;
	bh=WKM8Xl2YJm9lSGeWpKICpjBYGuMgPiOjmjIMO2jIpUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XeMoiYAdTXbbeuYwxGHYL8Ica885zN1x0ThVglj9wZOfU9yRUrwi+5JOxCH0VHP7QfXkm+lp/gWLN5ZT0tPEESebv6EKM2ZV0OSIrSPnGQxlVinMRi1teXxkqf5FLCHN1WidWq3zcY638U9GgHCmQo0ffgIpSwxQwmBE6Ry7+fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=flSIZfhh; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso3707802f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2025 09:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738603238; x=1739208038; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yooZZwhM+k4ztx6Gy6sHU7tFSm5CVfUBvdP7kZBzJ0s=;
        b=flSIZfhhUKbZztiezYLLUPWZAVpPNyv6SF08SF1fnWqkHx2iLvXa39MV3pt/SoS/63
         L1X5iEYSmWznjJUpPLLR5wy5f+wG0nncF7yJxYhFpPTqYfx8wJLa8ZaAYfq27AAo0ayj
         2ZS0uQRJnT+hyl+R+1qFonj8M2dFraNa3uzt8iL9UBY5nSYAv0N1mBtv4f77jXS3zQ8G
         S6AJLz/q0fEZw/6Lh287cNRCAr25CZdceziWNB6KxYM+4Kvdd1w1d1gEj1UOipLeObRE
         K5mRrmvMLn094T4eny+aj8GSG2gt0QdTBuTOpxt2At5ERERns4OMp7iIh4miu6GtsaVW
         RZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603238; x=1739208038;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yooZZwhM+k4ztx6Gy6sHU7tFSm5CVfUBvdP7kZBzJ0s=;
        b=nPjnkkMzQo0vcbeaRErMDHZpMUy+UahwgSXuyV8dspVHcYtPa709FbGFNQSZ9/Kjk3
         SNmRQ2vPtxB43rUrcvBpy2Ed4WBIvDWwCnNELeSe+RA3aDjVMUsuL6IGGKUjST1y1vpi
         V29UHzN18zsQx0KESr6UJGg9zZwZeByAX7Tmadv4U74CNMfMQAjXRjcSA/+kR6YlUEnF
         RypBN8QsYdOYgjYftASGsQrLgiEiLTynLTP36FL0loSHHl92Tudi3hxFFOIn8+sa3hyI
         qBTsVQIp5lr2Mn0V59yhzF7cjEy+dTl1gKDy6hGTbn7IG0DODuWGWxxgHxKSR2ODmZpE
         yJUg==
X-Gm-Message-State: AOJu0Yy1oI6qRLRvvoOA3ub0LrvAYtPmhICDKZUuj+5heY8pLwk3FtMN
	v03/40QjUzsX/Fra8SCk2VoCwpBvV2LNjwMoWdPnl4mDJgMNIjVt5C7q3lcD6tI=
X-Gm-Gg: ASbGncvQ9el1o2LNvMBDO+0KjXktWDnTy+3tQIjf+BM4U0628JiCSiI/7jibRx+zXS9
	GkXkYi2Thn56qtMYW331wccaE849DZrDeR+86iqWJMiiWXqw1a9w0Laow/7WC1niLbEQq+EyVdw
	lacsVl0TpE8Tj1ZVmVu543kMR2URCXp5ZCmN1pZ7TFzniyRIUVqtq74JNIU/DCaGi2XwvzoLkQO
	ijb8QGu9dDY2HVOhrK+KsngOV9tXOBoCVcMLUJdsf2BqQK2pzzBgfskvRqM4XeNafz3NS48bAhj
	fQzwYcs=
X-Google-Smtp-Source: AGHT+IF2Nfk7tfw6hP8j8Qb13diZMOQNa7IzSmAly6YZUZMwPvkopTtvpv2NwazX3VQmF7oAwqa9aA==
X-Received: by 2002:adf:e6cf:0:b0:38b:f04c:25e6 with SMTP id ffacd0b85a97d-38c519447bdmr14817122f8f.14.1738603237334;
        Mon, 03 Feb 2025 09:20:37 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:62d7:938e:c76:df44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23d4f9esm168000045e9.2.2025.02.03.09.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:20:37 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Feb 2025 18:20:27 +0100
Subject: [PATCH libgpiod] dbus: client: tests: fix the way we wait for
 simulated chips to appear
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-fix-dbus-wait-for-chip-v1-1-563f7132c04f@linaro.org>
X-B4-Tracking: v=1; b=H4sIANr6oGcC/x2MQQqDMBQFryJ/7YcYTWm9inQRzY8+KCYkVgvi3
 RtcDszMSVkSJFNfnZRkR0ZYCzR1RdNi11kYrjBppY3SqmWPH7vxm/mw2NiHxNOCyN1L2od15im
 iqcQxSTHv8UAfjHNEcPS+rj+a+JFFcgAAAA==
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
 Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=0JHgpdKpjShEk0huPvSNVFzKVOyUbSccRDpH4PxJivU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnoPrgXFbHxGbsUhnqUS94ht8jnR8qcD1Hbo/KK
 kI+ikStGCeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6D64AAKCRARpy6gFHHX
 ciUiD/9iqiddaLS+w1C08EX1aE2JRwr50ykq94LXzGBssRqVcEePIYiTzCn6dNYmgMDdwyVntL6
 wMvzSHkKI3xKvtOEE5jYHcf36BYd3caw1s0XpPDWxYkR9Vo+lwS8BSd/4Z1yYYxV9p5SfBTIG2r
 AvccfT4Sjb/yaWhWld8A341dhiBrjfdM5Wu/tEdGNcVxy5avLo0/hjcIKQ02XTK5ec3X4Eq5dLM
 L9wE1CgJn81HDo86Fh8hwDzNYRdOM70bVjTcjB/BZz82V+6zhQ5glCtHQ49grJzIR/wQSvY/2Sl
 9N1uYAd0rw/NXQjEYLgpL4z4RZvi7IaxDGTyT/r8mSO4PHB3pQXtNPwd1akSFq35CzqCljpI9Mq
 XNpzgA41A445ldWQI0csdZ6dKl8cACWe10YE1jPQ0WFqAWtXnaaFFHHlq8tPAfeNuDYh/noPdrR
 2asSKV5S3+B9HwG7MW60LPlbrj1sHu4YLTs1xy+USCPItz0p6pyqb4QUf5k+NQf+tNtouLvsjXA
 dmX8yTiLrlV+iVr39ud4X9SVN07Tu1xuS4DFZRdfhxSXq+OrZpQODs8gWYP5K56T1uF1E97KjiT
 N3MppzzuuwRywOW0pOB7Rr20crhNeojBJehWkNVPrLBKVfW32jbJ4pCHKv4kWcizIHrKJ3tfrOE
 vAHe7I46Owsjo7g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The org.freedesktop.DBus.Peer.Ping() method isn't correct for checking
if a given object is exposed by a service. It only lets us know if the
service is available no matter the object on which it's called (in fact:
it will not return an error even if it's called on a nonexistent object).

While this has worked for most part by accident, if the timing isn't
right, we may start calling methods in chips which are not yet fully
registered. We should try to read the chip's property instead and keep
on waiting for as long as org.freedesktop.DBus.Properties.Get() returns
an error.

While at it: fix the counter increment as its syntax is invalid.

Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client and tests")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/client/gpiocli-test.bash | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/dbus/client/gpiocli-test.bash b/dbus/client/gpiocli-test.bash
index f210183..1d2337d 100755
--- a/dbus/client/gpiocli-test.bash
+++ b/dbus/client/gpiocli-test.bash
@@ -14,11 +14,11 @@ wait_for_sim() {
 
 	while true
 	do
-		gdbus call --system --dest io.gpiod1 \
-			--object-path /io/gpiod1/chips/"$1" \
-			--method org.freedesktop.DBus.Peer.Ping > /dev/null 2>&1 && break
+		gdbus call --system --dest io.gpiod1 --object-path /io/gpiod1/chips/"$1" \
+			--method org.freedesktop.DBus.Properties.Get \
+			io.gpiod1.Chip Label > /dev/null 2>&1 && break
 		sleep 0.01
-		COUNTER=$($COUNTER - 1)
+		COUNTER=$(expr $COUNTER - 1)
 		if [ "$COUNTER" -eq 0 ]
 		then
 			fail "error waiting for the GPIO sim chip to be exported on the bus"

---
base-commit: d6457b28e29a8edadcb619d389878ea99cd4bab4
change-id: 20250203-fix-dbus-wait-for-chip-49e36ad58ee2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


