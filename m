Return-Path: <linux-gpio+bounces-31672-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGHIN6hfj2nNQgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31672-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 18:30:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 059CB138A45
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 18:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 51DC93004D8B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 17:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D13F364EAF;
	Fri, 13 Feb 2026 17:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dTWwyw7s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB2226FA77
	for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 17:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771003812; cv=none; b=e+b8d56LLbW1rbSSzeBilz9SFau/AeZz5GFmpq3LDspSAetveDGzAjKaMMXqwkn9Gd96Br7nLYD998h1x2IoFsVikLzjG0m0kokkrDGkizq+wYw8J6gaFwZ3SmsMCQkdL32mnCC06sPaVujZxCBMZgjKvuT0AgTHvn8lGBdoUoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771003812; c=relaxed/simple;
	bh=WDpgVOjoeYeHT6XPv+D0d1AKL30ZR6kb6R6gZTPOiTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VppnfcZLFkfwEkeKodw7erRsiBeO0jqhpf7XUSvQGgHV6HYuPfCxRcelPjLcKaz18ojXQmhVBx1/gmIW0qVcqm5vTdvVyGLHCzU8JLdu4Rb1jYP6ZleJyg0V+tD4yQ+FQoq8ARWwC3Hg6fr3xStvLvJzo3N5phRj+6wFlPuiLjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dTWwyw7s; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-126ea4b77adso1564063c88.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 09:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771003810; x=1771608610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f3h5s84pc9sdsF/HPUvnkVB8yJ6ZEzaEy6blo4kvSbk=;
        b=dTWwyw7sT00yQO6kk/rYMOU323g0Br3kSZm5dlzdLaKbC/ybFMgzLjOfaITiJ7H1T6
         fq/2dBKCz72xAyWXOCTnTXvjf2WYvKk5o6+bpudN1D1zm8ev10oA4HZghPfNBZmbXlHa
         3xJpauiKbKXIgG4POuZ0yWx8dWaMPXNuElyhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771003810; x=1771608610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3h5s84pc9sdsF/HPUvnkVB8yJ6ZEzaEy6blo4kvSbk=;
        b=jaiq0co+lQCNvHjIulBXXHxhfi7mrB/d7V/vcRt9VpEbtIqmOS+DmCSqueIXd+/2Iu
         xOFEOxulNgGyXRB3Lw26v/TJ2rmMgkRWSNbjsekLOsTnShGojmMzeos71ohseRz89gsr
         Pa6RoENIqkrEH/NBqwTMQe9jCo5goukxmlWbEPnkeeEfbLIp1OR0ja+40ySrj1KMl5bW
         5ksNYJjpe+VGuk3G7ro68WjRSGiia2Vw4AtLaiVbxR4YqkYRjkLGNZ0w3EE+wT7gsori
         Y1EFuep18frowtO6RmIxWSkFPfAiA2J6z3Vao2uaPbNoGudniJdzb2Ffns7IEsExbdZx
         Dgng==
X-Forwarded-Encrypted: i=1; AJvYcCX/2n80Gi2U2il5dchs3v+xFHtQS45CurCQ4B6mUI1r71b+sJQDkt1535d2dRsnUbOvHOrQBzsmZOTd@vger.kernel.org
X-Gm-Message-State: AOJu0YzYxFzMVeqe4Eo1OIRZMEOmuqOHCeYpzU3ZLpnpQQKbkA4/bFWq
	toJsILj7o2oabio27IiToLw1lLpqX531WTIvUkVk/yIx2oEcm54t91lGVo/gcwOqHA==
X-Gm-Gg: AZuq6aKr42ft5woYb03P+8FFhMFZiVrVSkUlAB+1GPeGedZjsj6y/DtI3lKnqfekGKM
	cDIZO6UEkAIGDpeRwKaAizy/E1xbOo4h3d8hyjAVdIjCEqjRrpC1KkmghjmmQ3Bc00mlVC88rqq
	5dNR9HS6HokhN7HuWlxanoOLk9Xcvpgl6NZcDmKgMbMVvk9FCqes4c5Xg9PYdPM491X7hU52DRX
	YhGpNnRnLnRAWWpTj+6hZVZgrUMQqxXhIg6KKaDNG0jjWlcPpcOa/As62KvkC+MIV5PBGc2YXRX
	AHmOjkuxNThv8CdA8nFB+mE0BfjXGPcCfc+sJziUPFEpIFXKqBES+PuRoGH1pxkgz20cfa734Tp
	8oMI0DDavWLRVPUGXBya9yOCeKt7/0WmZWBbxUOcg44zVSTrENuDtBYene4GPhlnbE6DC/u8eaa
	N2iGcsXsRFdY5nFKHuul3zRxsgq2F8wfokVlgu05dQoW2PnC1SB5sBQnQy0C2oGOvprBagX6zy+
	bLb42yjiA==
X-Received: by 2002:a05:7022:62a0:b0:11f:2c69:31 with SMTP id a92af1059eb24-12739850ed5mr1526056c88.46.1771003810033;
        Fri, 13 Feb 2026 09:30:10 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:d300:8e6:51e6:35df])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1272a6f3279sm6371734c88.13.2026.02.13.09.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:30:09 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Linus Walleij <linusw@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: Avoid NULL dereference in linehandle_create()
Date: Fri, 13 Feb 2026 09:29:31 -0800
Message-ID: <20260213092930.1.I77c3eb563271c21870379eefd16ebbc4e09635bb@changeid>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31672-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 059CB138A45
X-Rspamd-Action: no action

In linehandle_create(), there is a statement like this:
  retain_and_null_ptr(lh);

Soon after, there is a debug printout that dereferences "lh", which
will crash things.

Avoid the crash by reading value needed by the printout before making
"lh" NULL.

Fixes: da7e394bf58f ("gpio: convert linehandle_create() to FD_PREPARE()")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpio/gpiolib-cdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 2adc3c070908..13ab6a5ebb76 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -304,6 +304,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 {
 	struct gpiohandle_request handlereq;
 	struct linehandle_state *lh __free(linehandle_free) = NULL;
+	u32 num_descs;
 	int i, ret;
 	u32 lflags;
 
@@ -379,6 +380,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 				      lh, O_RDONLY | O_CLOEXEC));
 	if (fdf.err)
 		return fdf.err;
+	num_descs = lh->num_descs;
 	retain_and_null_ptr(lh);
 
 	handlereq.fd = fd_prepare_fd(fdf);
@@ -388,7 +390,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	fd_publish(fdf);
 
 	dev_dbg(&gdev->dev, "registered chardev handle for %d lines\n",
-		lh->num_descs);
+		num_descs);
 
 	return 0;
 }
-- 
2.53.0.273.g2a3d683680-goog


