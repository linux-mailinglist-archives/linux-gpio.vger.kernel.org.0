Return-Path: <linux-gpio+bounces-38686-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qim2FwwXNGrwOAYAu9opvQ
	(envelope-from <linux-gpio+bounces-38686-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 18:04:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E9B6A1750
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 18:04:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IHJkx6CD;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38686-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38686-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E28430F2274
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 15:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB38341057;
	Thu, 18 Jun 2026 15:56:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8126322527
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 15:56:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781798210; cv=none; b=CB73FllpTr4oHplpVeDW5y1ScSGWOnqf+8X95L7tt0+OtWXi0HEWvIjlMqDxij3FCRW+siZ9mum3A98VrxQG+Y6WvgYJJ1auc5PcOTvPl7vydIKmEOkxf9FwRtzNhcZL56+BIR5Hy7UKNZz9sHAEZCWqlwjNSdtu1q4CjpqbMMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781798210; c=relaxed/simple;
	bh=DHivj37iFx95kTFq7ht5QR0y/qP7ttsfQ/l2NwWTboA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WQ5TqtTS/o2uCzwSK9whYinGlcpxW5ktCuIdZA7NVB/KTZla1ZYglD7GwSKblBTI4xuThb0a+BBLVyaySkJbgywG2AJ7i5TiR4kf21JILjQxtCnBJOjKwWgftjV6UIdXdKgT6t/b/yga0enYmfJvFO3Zv4SWEnQgUg93FxCqNZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHJkx6CD; arc=none smtp.client-ip=209.85.167.47
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa2c25c632so1188476e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 08:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781798206; x=1782403006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mmq6+nYdDCug34pzJTL7812QinTxVra7/PVlEDkkRW8=;
        b=IHJkx6CDbTzX0bLLOK6NI/UDcPfXx0TmjEmn49kldJj31tmw5WSP66L2KLqRpBYM+8
         G2yqfwdZ59TfeQ/SWhoCapbqAbYcuS+3Dycg+JKYMx+Y6usZnWFKISNhUXA3Gm1ud/ST
         dFLjDc9anhMbKni4/5fQ4kYPH7SeY+2jU4E3JUbPj6Zg08fDrEujH+k0xnfzcQG/yRtd
         l8jEaY6rHDHt/DiOuDqiSzrxLrXJ1J+JXm9eTp5gYq6P+betCkvgA28ses0yfdfQfZVF
         eY7LqRtWiVFCV7uex438icIdry4k93oGGAuyPrugZ8BBKy7DiA0PovFjtgpOu65CwMUW
         uP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781798206; x=1782403006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mmq6+nYdDCug34pzJTL7812QinTxVra7/PVlEDkkRW8=;
        b=eFVQaM72RjxIMoaw5wkm+MnRSggvqiFDcjUEM+kk07xEX+uGelJp7NOB16b3tDYQPd
         hKAvrAyM2pBi/hl3sIaSmOn6w+VPSKg+ZDOl2HC10fwV9Ko1sBkmmJevVFWD6d8pqz0r
         sH/+bA9AgQCW8KGhTT//aoypKMc/4cwT7BXqhDoZIMziFVng7haZaWsNJAxyJjKo1bZp
         asIR/0a/Uu+ZysMDLNeJVgu6XAEozvBZ/aP/5gs24YQdKMXagH+ChKW0MeW5SXCCbb+/
         CO5yd+zAdPDqSXtCAOJImBl8XN+pMhpPxz/j7iNWw5W7qj5Jl6jxcMHFb0wC9TH17VjZ
         IDmw==
X-Gm-Message-State: AOJu0Yy5mBeuxbNCXYXiLZvVCmhgE5l5isRif48ob868xu0iW2SAOSwi
	v5cWKZMutuOay3Sps6Qavk2hSXNByig4dN/TKcwwIECChdy6j9k7RXpS
X-Gm-Gg: AfdE7ckBA5WeZjpSxYKHKYekH6Fb1iTc9WFQc6tZSTfEXv+VrxbEXHop9iM+7VeY9Z3
	p12glD3UhTPKrwq6rUhLHmN7Wsf36zBVQ/bYdPV4pYxOQUfXNBoH6Kh0jXRXcIl5LeXfPWkf7o/
	B+oTzCq21YGo1E5ljZ1gSu6uOtySwFXLlv+tMfF1Zoo+3LH0gjJPTl8SQZ8qlwNKEz9vme50Bkw
	eYTKirXoDVjWajgVsNIK70sV9w7Nm5ELMXqgpWyjSukNEig74fuBm+kBW8tMFhe9gvWYP0zAy6N
	8xzbQWJ5TJ5jAtTflDKj4vdj8MMVzUPasiY5zXZyYxx3diow6ai39+FkRvVZJRWOCmhe8I63Gi2
	goiaaZ47DNNWd91JezKCKtJPGppYofgrXNUBnueqEPaBiVctp5O+fioVMksVtyFo25PuQM8SGR1
	E0zO7qZryppjxJiMYijuULhUSR9u29mqSfA8B8ICkZY5nKnzGCsyT+UfXBYWVFsemnJecQ+iqVT
	yN4R2r/kCw=
X-Received: by 2002:a05:6512:22d9:b0:5aa:5ef9:a33 with SMTP id 2adb3069b0e04-5ad562cb76emr42956e87.25.1781798205753;
        Thu, 18 Jun 2026 08:56:45 -0700 (PDT)
Received: from g.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad56375f38sm13217e87.17.2026.06.18.08.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:56:44 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH 1/3] gpio: tb10x: fix struct tb10x_gpio kernel-doc
Date: Thu, 18 Jun 2026 18:56:24 +0300
Message-Id: <20260618155626.18751-2-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618155626.18751-1-igorpetindev@gmail.com>
References: <20260618155626.18751-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-38686-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:igorpetindev@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[igorpetindev@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[igorpetindev@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6E9B6A1750

Fix build warning by adding the missing structure name and
description to the kernel-doc comment block.

Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 drivers/gpio/gpio-tb10x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 3c8fd322a713..705bfd80a8d0 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -33,6 +33,7 @@
 
 
 /**
+ * struct tb10x_gpio - TB10x GPIO controller structure
  * @base: register base address
  * @domain: IRQ domain of GPIO generated interrupts managed by this controller
  * @irq: Interrupt line of parent interrupt controller
-- 
2.34.1


