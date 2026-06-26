Return-Path: <linux-gpio+bounces-39013-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J3/eNdwVPmqo/ggAu9opvQ
	(envelope-from <linux-gpio+bounces-39013-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 08:02:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B3C6CA893
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 08:02:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=U1dHtOJn;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39013-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39013-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB28F305F58B
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 06:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA6D3D349A;
	Fri, 26 Jun 2026 06:01:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FA53AA19B
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 06:01:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782453680; cv=none; b=qHgz/BlxV2aDcSVgs8EABeBoMGXElh6gD1AVkVmkbitkZW1euI+wOxhJ+pSoFGtArXXYQd+xZvuHxG9xaSEc9L2F7oeDdF/h+L5g0/Ivh4VT4+Eivj1hBAOAgw/xMfhL5ZMoGw194gX1OURUs8J0r/x44CZafU4p/p1jP4KW84I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782453680; c=relaxed/simple;
	bh=iSwEpx/CUEGfLuiQrFoaRk79VbQrqojiYQTMnyvUGk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLqgX+ycw7JdrHdewt8WvTsMFRigGJBgFPSJ4wV/WyDsbBYi5CFZ2GtP7pp8i2Z2/PbOjjitsvnojjlj1uDTj339QisFsNrRQx3HojzOesySWVkC720T6sRTE+ntgnKepjGNpqy40nEkR7hkorH9KZYe+LEAbUuBhj1w4SVDe/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1dHtOJn; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4924e6fda5dso2608575e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 23:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782453678; x=1783058478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QF3w2+PI3g3PecGuSaGiNiP4orJyCN+FZOEsoFgdgU8=;
        b=U1dHtOJnbZME7eLBauxP7F+tJarty+gYWBJtW6BvUPSye1KLI/00uNdhJapHLtNbPD
         3fLA7byDDmNzpz7otgPJogHSS1yrzI09jWVykICd7HSHh2hkzoA8RMoXk/NjVJjR8xT/
         jBfjrylAqYsg6XtVv4vpSWdRO0YwDWGi7TgN1j4Rz6qx2Q2FqXzMN/IB+PihowU6cM5c
         zCzEwBFuFbDFO60JR48VvZFq97MxbyX6rvB1bdHJKqD3HguWCag9UMd9YuUMmzdbs+dc
         Zv+hwTeLGv9Wf+OahWiJJGv070X7RBY+/OmN4I/QQ8pM8zR5EN2fh9yo/MKjS5fZNGcT
         wR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782453678; x=1783058478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QF3w2+PI3g3PecGuSaGiNiP4orJyCN+FZOEsoFgdgU8=;
        b=diMfMAWGGp9E5GSrtuKiYVIj2ltmyZ9eaqz0I3RlI9aTwPjI5o5vtE8uHraQ9o5UUv
         hwN3sklBnIEVN9g9TgOUtHS2wzizXjLCB1QUHQh9bRDbUYIaGAjZ/a0Nc5HbfwhOXUNn
         BprZIC43ES6+HcYbq3KktMrDvxOOVm9/mHAY4Oc2PjexMERN8Pg1ZZkafJgK+ZPfuyuO
         j+zcl5/wlnK1U+G3TANFuMk010JJBA//HGEzDEPkOLD8CWtMtwzGt44Ypw+N88WwWpK3
         Zc4DkL/Zxde4a/Iw9EskSaqDpb9/c3gtFP3XUb/qpTmHqXV1bLbz9DmyrNcTSeJxc+qT
         Yd8Q==
X-Gm-Message-State: AOJu0YwXHY6SAgFknoOCtF9is+My0YV/U6d0AMV87si6T8ExY97s0ow4
	joVkoqVJo1Tml/UzeO8TmYIgkt1qonQV6HXDPv5+6008BTWC+JHa+I2vkbUB3A==
X-Gm-Gg: AfdE7cmkS61Yo/mP8ZvHmN7mTViyup44mcjUvm8bDidKdTttxYtU6GA4YkH1RfQkfsL
	lQPVueszqLOzI3CQar2NU5Wy7FFsIL790zSVa93820GgVCqqOAOO8x5YNlIgEodPKKrzYq2idjR
	D1zYuLlQyt7jbWJE3kELccHeVnu6FBfYcYA+CuQ9pI1kYJy7+91SMJbbk+pfHM5VroqLJNOdpIP
	c4ykZrB99em/3ZkhMReN5V2PjohcYh62lIGIA1c4SSrkwsGU61G0Uv/BkPCFdNImesj+EACeZ8J
	H3Wx6XDrbf/jYIOTInUD5FDwOgwbDXlEBubVeb7j/hieHv6Gqe1DBLU1U7ARvKt6v8bq5BGGvHJ
	r3cOkY5RgWtDb9WLFosoxw8JGx4ktcHZaOtT/qHBym6TkphzaD4yMigdnpbMy2gMeuSQzZ3FfDR
	xK7n0wfOrHM0C+cZ3OdPh7J7H2xTbGOMAKhQCGis5vyixHdEO/ok0hrnwYAcc=
X-Received: by 2002:a05:600c:1d86:b0:490:be1e:6ce6 with SMTP id 5b1f17b1804b1-4926686d388mr70772295e9.9.1782453677684;
        Thu, 25 Jun 2026 23:01:17 -0700 (PDT)
Received: from camaron.. (147.red-88-9-50.dynamicip.rima-tde.net. [88.9.50.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f0db007b3sm2767936f8f.2.2026.06.25.23.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:01:16 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linusw@kernel.org,
	brgl@kernel.org,
	vicencb@gmail.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 1/4] gpio: mt7621: avoid corruption of shared interrupt trigger state
Date: Fri, 26 Jun 2026 08:01:09 +0200
Message-ID: <20260626060112.2498324-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626060112.2498324-1-sergio.paracuellos@gmail.com>
References: <20260626060112.2498324-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39013-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:sashiko-bot@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45B3C6CA893

The bank-shared fields like 'rising' and 'falling' are modified using
non-atomic read-modify-write operations. Since every gpio chip instance
represents an entire bank of 32 pins, if 'mediatek_gpio_irq_type()' is
called concurrently for different IRQs on the same bank a possible overwrite
of each other's configuration is possible. Thus, protect this state with
'gpio_generic_lock_irqsave' lock in the same way it is handled in irp_chip
'mediatek_gpio_irq_mask()' and 'mediatek_gpio_irq_unmask()' callbacks.

Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 4ba9c3afda41 ("gpio: mt7621: Add a driver for MT7621")
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/gpio/gpio-mt7621.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index a814885ccd5d..ceb99641baee 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -187,6 +187,8 @@ mediatek_gpio_irq_type(struct irq_data *d, unsigned int type)
 	struct mtk_gc *rg = gpiochip_get_data(gc);
 	u32 mask = BIT(mt7621_gpio_hwirq_to_offset(d->hwirq, rg));
 
+	guard(gpio_generic_lock_irqsave)(&rg->chip);
+
 	if (type == IRQ_TYPE_PROBE) {
 		if ((rg->rising | rg->falling |
 		     rg->hlevel | rg->llevel) & mask)
-- 
2.43.0


