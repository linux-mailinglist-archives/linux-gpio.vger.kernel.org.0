Return-Path: <linux-gpio+bounces-32140-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOupAVzRnWn4SAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32140-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 17:27:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA68189C9B
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 17:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 687353046090
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 16:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712773A7834;
	Tue, 24 Feb 2026 16:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMOg/b0S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3B01799F
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 16:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771950423; cv=none; b=D9d/Rp0Wgqv8V3WgPht3pwDFH7GLT0ZYmVHlg+/YBz63FwOaCfxlZ8nl0oh3sLzgfEyqAFYqcdAR1QieZJgA6nQMYm4Ya4uwEXDF7dKBfZOJ4C7664qUp4y6iCbORTb8hqN3tSLzQ9MfttgaQVMf7zetTIj/RX+SrPbaZMG3WMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771950423; c=relaxed/simple;
	bh=YS/sXiuj2czShLDQXAAPbRvZRuP6Pa4lzIjqWXq2+0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BakKQar8yXjw3YZYU8efj3iKld/AuVQ7Y0r7u2HtyZxP63iBSY8QSzaVoduuK8G8Pqg/tn71/FQb3tg9c2r3axXgcAclIfcq8DVFjAAUVl2Bt7d58pbeaWy/bQAxmQJ80JbcdMxhFNc2o8slOohFW6U/aDNhPmNPWLX9ohO2ztg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMOg/b0S; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2aaf43014d0so39366565ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771950421; x=1772555221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8MyfCwShsdn38owSIBBapSosmGxnp1Wb39JER6IFqU=;
        b=WMOg/b0SY2ozb+reowOKhegALN6K3sc+iPqaYRe5Kl3b3gTUDotbNoNEp4EIZEl9e/
         SpYzifGrIXZu1sMMqYJxgojVMzJJvzojOwNZJM7R2Pw9YdygzULvCkPRb4/AQsWmSR9p
         ot4oIcsMvtjOihvmUS3loWtjNNIVsAcHtk/N8p0xtjyLd0Qdqyf9p6gkukWFu8Ojpd9H
         J73cvM5D1mMenNsbCXH1Sjsf6SLcFhvp8UKmnWjFjbfbyFJmuEljVURfINUy4JS97LWR
         L77VTPXeNGi2L3yLcxDnl6ulcHFT3bMR71W7dEkPVsZIc6k/kYiBMGl/q/KIN0WTOhI0
         u3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771950421; x=1772555221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8MyfCwShsdn38owSIBBapSosmGxnp1Wb39JER6IFqU=;
        b=niRUdJ6ItqdWsulOsjF1Fnabqueky5n0wZXMhW8NM15bWelbpJLBG3M/E98Q29qcE+
         ObhJ14rh5nprXfVZg5EKwMX4uXtykRh6G3Qt+nC3eybIfDqoubDC37kIMA4Zv4m4gnJN
         HVo3vwSuITKh7YLpn5M62ui4yEYyCvGeTUtUUlIR7k+OJLGgPWtZOHBLMQ/wfI/58Bz7
         KHqy8e2q/9RVdiQt7j2ApGh5bnlHBk4z1IhO2PvMOYfZQ4oZFAJX7rRhSW5fZlqBpggZ
         sWd4C7Kr1xHatEOm25xFxVod5u0AffTRb24s0AgPqjbvNIGvLxoRAVAppPQOhPWn+hZJ
         w+IA==
X-Gm-Message-State: AOJu0Yww28Rs9zgI185ti3lLfMv5p1xpscVHkO5ZZ7e2NtcIw3D1X7xW
	8XeHGqsoEyNMxktItYbkB+Xxnc08ikAnqBQCvkyQDXsT46lNfNABqwaL
X-Gm-Gg: ATEYQzzRLFQB5aVtTU4XMHEQmDlaRl1hEg1ohsiG/wXvw0rNyFFhpqLeQwOmrNW379v
	4efICLSiv9N04Wujc78lddyuupLMyTpcse0Df7BFI6b5on4iD2ML6e8P2Z4yKiLbwxhP5cAcvIb
	tRx6GoXXCi7gMIk+HyNnfY203J/blBNAD5qHsWiKIPoLlTlVYTrYGlQqEHQazCdQzQeM7MEXr4Q
	iALZ8i8eBTgA4isUvC+9vXe/j+6n0DxYSSUTiMV/MPm9G0Xu0HHS2Enujzb3rPsvQgv5eYZbPyA
	bY6L8nziAPdm+91q8Qv4SumxIYyxxcVpkWex32NlAavcVT1ECr5S4runRSD0iceJIumHNUJFy/y
	iHyY9FzTg5BF7f624Iz/XipLKl2HlK9un8FB+POC6mejvku/+NRv+8190kVty4gfNhbWNj3aFNB
	povfhozWb7jCtj0+3aWnV+rvBiqhfUFrNOwLrPlfn2TqbmdI6wpBiLSvr3wUMvIsGjm5Fsbum9N
	IBNpREyjA1XIUWkpAjMI0mp
X-Received: by 2002:a17:902:d2d2:b0:2ad:ad65:7df1 with SMTP id d9443c01a7336-2adad658681mr15815115ad.19.1771950421329;
        Tue, 24 Feb 2026 08:27:01 -0800 (PST)
Received: from pranav.. ([223.228.39.154])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f5ee0asm111721345ad.34.2026.02.24.08.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:27:00 -0800 (PST)
From: Pranav Kharche <pranavkharche7@gmail.com>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org,
	Pranav Kharche <pranavkharche7@gmail.com>
Subject: [PATCH] gpio: gpiolib-swnode: Remove deprecated label fallback for GPIO device lookup
Date: Tue, 24 Feb 2026 21:56:06 +0530
Message-Id: <20260224162606.645147-1-pranavkharche7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32140-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pranavkharche7@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7BA68189C9B
X-Rspamd-Action: no action

Signed-off-by: Pranav Kharche <pranavkharche7@gmail.com>
---
 drivers/gpio/gpiolib-swnode.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index 0d7f3f09a0b4..d6ab5bf0d2f1 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -43,23 +43,7 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
 fwnode_lookup:
 	gdev = gpio_device_find_by_fwnode(fwnode);
 	if (!gdev && gdev_node && gdev_node->name)
-		/*
-		 * FIXME: We shouldn't need to compare the GPIO controller's
-		 * label against the software node that is supposedly attached
-		 * to it. However there are currently GPIO users that - knowing
-		 * the expected label of the GPIO chip whose pins they want to
-		 * control - set up dummy software nodes named after those GPIO
-		 * controllers, which aren't actually attached to them. In this
-		 * case gpio_device_find_by_fwnode() will fail as no device on
-		 * the GPIO bus is actually associated with the fwnode we're
-		 * looking for.
-		 *
-		 * As a fallback: continue checking the label if we have no
-		 * match. However, the situation described above is an abuse
-		 * of the software node API and should be phased out and the
-		 * following line - eventually removed.
-		 */
-		gdev = gpio_device_find_by_label(gdev_node->name);
+		
 
 	return gdev ?: ERR_PTR(-EPROBE_DEFER);
 }
-- 
2.34.1


