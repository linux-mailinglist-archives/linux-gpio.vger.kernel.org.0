Return-Path: <linux-gpio+bounces-31693-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KOHEVMnkmnDrQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31693-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Feb 2026 21:06:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8D013F960
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Feb 2026 21:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FE1E301411F
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Feb 2026 20:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3C02690C0;
	Sun, 15 Feb 2026 20:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XJ4Mrc3T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBD1246774
	for <linux-gpio@vger.kernel.org>; Sun, 15 Feb 2026 20:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771185999; cv=none; b=OzU1/3atViOpA+WLsfbG8GCwDJjHS8QLoxfE4T5YICHh/OFiGLievlu8+9AySlgHWnLkJTrlFyP5CUYfH9DlSkO+VxNdOv3WUY+6sSgSqisFD65c42kyrZLpisTNd1JnK8j2ZdrGQKz5VErfO1T2nX8CJeB1OXIG/feQXOzKiJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771185999; c=relaxed/simple;
	bh=DZxBctGHQ8YK2uZhVlc5yIy9LV6Le4CnXmSL/0tvMfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OBJDvi/MILXKmLuex4x9wYLPGMkJA0rTGYX45D9TsEeq3/BaBu88jktPYpdVjFXe4AyPmX70xuwv0sq79mpHTpS2HM21+MMnxXgmtowvUfloDlFfmQcePuQO45C8b1etb64AZdE/DehnHnzl+sM0cKjn+jMBDuVvdptMvmKJK34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XJ4Mrc3T; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1271257ae53so2540960c88.1
        for <linux-gpio@vger.kernel.org>; Sun, 15 Feb 2026 12:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771185997; x=1771790797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=16om0dKffWd/jiAsOCQqAqNAh+Z+U1swvD/OzEUaow4=;
        b=XJ4Mrc3TT2gRLKkB8y9LicHhoTVGqCYVhFusBjKcikmnCuV+52KIB25jph+tKQw29V
         i5qN/fGoH1geIEtKPmnPvqNBx4vt6d87OBuuq0LvVn9arbZnh27YI15wgfbM0UmX/Y4U
         bG5mLeaFu4kj8LrVcBpHUEe9u0Zlp/CT5QotM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771185997; x=1771790797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16om0dKffWd/jiAsOCQqAqNAh+Z+U1swvD/OzEUaow4=;
        b=an7kDDDbnRAvXVyJ1Waw+CEBVRPOILgJegKT42bWqh/LebV5jAMEy67Y5WKQB9MDtV
         UQv9Wl9RYI7s/X1wrqI4/MRmMvj9S0z6n7qr5flkh5+HdcZRYV4RJEwqmb+4sQIt3Tqz
         BRblt1X6EUNILN1LkIxjjS8T+1SSvDKhXeffK7R4iDfXjuf3sJCD5228b2WPwBTF/a1q
         MmJ78mDXZt6uCp1skNHJ5QCH6xUqPp523QfA/ZuoBnpCmjrPuHvG6/1TdVqaz1zT8now
         CuOA+jaxKtOCr1pEhMPqZ9Xg/DMy6VD0nkiit8Ym6iEVsttA0js0COOWOXBVzfmo8eBu
         eQug==
X-Forwarded-Encrypted: i=1; AJvYcCXnuuOIgBT2bQ0nvsPLSaCQkaziS2Zn3whqZiuQ8Os45BVaLH9hvHXwcdK1z4aJ8kMI0843ukwTYWjP@vger.kernel.org
X-Gm-Message-State: AOJu0YwYd68bJds3qbaXOXufs8u6r9DTtfZQWwvaLhycSh5QEFLMsYY6
	ljmrP45pABt1YZrl7n0egges4OEyYcsGwyIiXVnliTOZ0c4b9cTUXt5dxexxzhLA0A==
X-Gm-Gg: AZuq6aJS0lkzjlW19r7qZEZhopFvlvusp0FU44bcKPSVul/uuTtq/LuHW/uPCmvsOsc
	3Zp4a/09o5Bx2E9puMG2Hr3M6AMbmLiw+SqvUr9IZA03XNwFs5HMxayjmVsdErS9BqmtNBkQ997
	bHtJRmIvLEBr9Gm93E0QezSVC+8ZF6v83Tbwt9LVs3OjeB2LCHHHDFkdGzxlx6g7hGYhF7kMvX8
	VyeWfmBAcGSSK2pnU5768b0aJVcrF1rQKeVdeuMhSFPo+a3NSqEBcRT5B7P5g3y3XAS00yUzEZ4
	UOD3OFQZxniui5hcVmojSisFyMDr2eyU9fmQBIuieZ484TMVLEyNpbq24uiMRvoLvvUTHQX33Di
	a1HZvlOPjVbg7YNxzn6GggBtjcQq2k+c2Txe0sVcJhYxWXhOa2cp8OwwLKOpRj9SWF4TMtXxO++
	Z0knWpjYIvwbv1NbfIyGlxA76oCaBLO/LNL9KDuAtpMPmfX6mgQXcVCQT8CbOoPaR4g3hIues6a
	96CYATsjw==
X-Received: by 2002:a05:7022:f102:b0:11b:9386:a38d with SMTP id a92af1059eb24-1273ae81364mr3683409c88.48.1771185997008;
        Sun, 15 Feb 2026 12:06:37 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d1b:eb8c:16f:1964])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cad9desm6896092c88.11.2026.02.15.12.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 12:06:35 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Linus Walleij <linusw@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] gpio: Avoid NULL dereference in linehandle_create()
Date: Sun, 15 Feb 2026 12:05:55 -0800
Message-ID: <20260215120555.v2.1.I77c3eb563271c21870379eefd16ebbc4e09635bb@changeid>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31693-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim]
X-Rspamd-Queue-Id: 9D8D013F960
X-Rspamd-Action: no action

In linehandle_create(), there is a statement like this:
  retain_and_null_ptr(lh);

Soon after, there is a debug printout that dereferences "lh", which
will crash things.

Avoid the crash by using handlereq.lines, which is the same value.

Fixes: da7e394bf58f ("gpio: convert linehandle_create() to FD_PREPARE()")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Use handlereq.lines rather than creating another local shadow.

 drivers/gpio/gpiolib-cdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 2adc3c070908..189127721e38 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -388,7 +388,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	fd_publish(fdf);
 
 	dev_dbg(&gdev->dev, "registered chardev handle for %d lines\n",
-		lh->num_descs);
+		handlereq.lines);
 
 	return 0;
 }
-- 
2.53.0.273.g2a3d683680-goog


