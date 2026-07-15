Return-Path: <linux-gpio+bounces-40119-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FyAsI8N+V2pTTQAAu9opvQ
	(envelope-from <linux-gpio+bounces-40119-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:36:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6BC75E36E
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:36:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=P6g554fH;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40119-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40119-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CB253167714
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 12:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBDA847D928;
	Wed, 15 Jul 2026 12:29:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57B3466B69
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 12:29:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118585; cv=none; b=O+XqpQQ9bf2AXYkwAlsI4Yt+d9CCxzYF86eoGFFmxcPQWfb+Cu5sSqqZgnjIUSnufVOaJbb73EhNlKDglg4YSJALZG567+DhGZp2FpMX1d83jHGMQkWj1gutBVPmNk02gaEWIWgvMHW5BNO49aRb9zbRNXFhwDLPG0jbQ7ALxAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118585; c=relaxed/simple;
	bh=tb6VVpndxV1WisXM8GvWuIHPq6saMoF/pm1lAK1wGqY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JOfgleNmSgSyWsAO/l07qerrzKpCYZY9NSlIsbuCjn8FP7d33KPm7PZKZKkS2BplTtFf3mw6EbOSF/aJg4oj8oHBPo+NDMV7tpFnXdfURW7hD5CJdxpv8VC92utiacGajH6rj1K27b3UZysCACbw6Hi2NH8y5otAefPPTsmZ9XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6g554fH; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493b27c7451so7622585e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 05:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118580; x=1784723380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTAx7TYBkRxSJa6QqLMtR87q/GzHDKuudoBFd1PCFdQ=;
        b=P6g554fHIjC54HIS57uTIlMSUJpJgxUf4GfqgnS2AyvZRs0ARLk64Q0bsLUPNDOMUj
         IYGj7cppKTTUPvUax4r9d+96P1QUQtFyCGukuIpZV+gglkXwSpct81lm92oaip/kd5gd
         6mzC0oBU68x8Zv3NK2P30ay4L1LNjpg0lUqWMeRIrryvrxFxJmiwRHQAcbuXN+gpJr0f
         yF6Kx6Aq73YXe8K8EP5ck7XBmptYPVpKm5jvC4YGTUBeM5ciNd6cd5iWTty1PpxLm4ZM
         JgJFB/igm0rqCo0YhrRMHfw6FxfB94v//5rR8bhnj3op6RNbWaOOaGlpGJqg4r651Z5v
         RQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118580; x=1784723380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PTAx7TYBkRxSJa6QqLMtR87q/GzHDKuudoBFd1PCFdQ=;
        b=avNM6zsOFs7U/gj8AgWXROpLQvlICF5Cqfpj7ukMzVu6YH2rRBIF75DH9jsbPoEt/Y
         0agOXKm4WYp0n57hQYZ+fsH2URPi3noFReyk1YvzN2g0CnYto/mS17aDH++JJ62RenD2
         lfrXDQGWEpIXkq8v/v4VhKwq09meJDV0qBc84nuTLeX/ThbJ2mXBHHgVvvFcawrCGbR4
         3V66MefYxvLQwNMY13hw9t05KjM6QJ2nG92+cwcMwjyK4MHleJBY1OT+W7e2EtHIoeEl
         uPugxfig29C3y19KwuUKoDuKZxcMLdvdUxTkS8IVbXbIavQCBPgm1xhECofpAS5/RT+R
         Qi8A==
X-Forwarded-Encrypted: i=1; AHgh+Rq8lrtlqCvsPuPh/vmbRBU0rXAfESVz7fxIhP0276PCTteE+tEtg0WYbITpwohQtCrl+qPwmfv3o6Bx@vger.kernel.org
X-Gm-Message-State: AOJu0YzCpUQaGLPWOE1k8hj/ohES9HWaleLQz76/2v8FBbF0F2rp1UKR
	7+AFL2/6UdaylHsioIhHe2qt++vv0GzZmjgxcg7VpyMZLdjzNwqPXMRO
X-Gm-Gg: AfdE7ck/SadqjfB8OhljSXejQxce3lSLcIhMEez07vVRtGEEUaSe3gQk0Xsvnui6RRE
	qxD7QqaG2H1UKGXfs+xDeE44JCMfqxNCYStyg/gU1YMpsH7nQH5/FMeM8wjefIcZuqnTtDisACO
	4e+7S3LKjH8HnuklUrI1pKNxAxvRIUALrCF12m4Bl89ZG3jKfpkY6WBj8/eBc20Awtg1LsOPjpx
	1kOAEITdWZN2JYs8IRQCZlUSzBdoOfih8I8Kb+QCVRIFO7MUkaoK9htP7K1QtnCFTT9wamA5oZh
	DjQIW+WHiAPZaHk3TqClx47UqDnp99LaYqev+e3Xl2KMq/mtOtUJRlsC0XpYarZVJEWfgiqbOw0
	4wTEiQ+mJ9J+AL+F4xcN9mGS3Ku6PCAjMPzRFKOJZ5qUrNvx8n/dUgQyzxLGOGj6YOLCoGYzze/
	ttr+Rc42t7mc40B58mS0reg04=
X-Received: by 2002:a05:600c:3b0e:b0:493:f806:fc4d with SMTP id 5b1f17b1804b1-493f88268e9mr161675915e9.0.1784118579463;
        Wed, 15 Jul 2026 05:29:39 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm216770715e9.12.2026.07.15.05.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:38 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org,
	brgl@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v1 4/8] pinctrl: npcm8xx: clear pending GPIO events during init
Date: Wed, 15 Jul 2026 15:29:19 +0300
Message-Id: <20260715122923.1938327-5-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715122923.1938327-1-tmaimon77@gmail.com>
References: <20260715122923.1938327-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,vger.kernel.org,gmail.com,google.com];
	TAGGED_FROM(0.00)[bounces-40119-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:linusw@kernel.org,m:brgl@kernel.org,m:openbmc@lists.ozlabs.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:taliperry1@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tmaimon77@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tmaimon77@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E6BC75E36E
X-Rspamd-Action: no action

A bank may retain pending event status across resets of the GPIO block.
If probe leaves the old state in place, the chained IRQ handler can see
spurious events as soon as the irqchip is registered.

Disable event generation and clear EVST before wiring each GPIO bank
into gpiolib so the driver starts from a known state.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 8d7dfb326..5dcb01923 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2471,6 +2471,9 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 		if (ret < 0)
 			return dev_err_probe(dev, ret, "Failed to retrieve IRQ for bank %u\n", id);
 
+		iowrite32(0, pctrl->gpio_bank[id].base + NPCM8XX_GP_N_EVEN);
+		iowrite32(0xffffffff, pctrl->gpio_bank[id].base + NPCM8XX_GP_N_EVST);
+
 		pctrl->gpio_bank[id].irq = ret;
 		pctrl->gpio_bank[id].irq_chip = npcmgpio_irqchip;
 		pctrl->gpio_bank[id].irqbase = id * NPCM8XX_GPIO_PER_BANK;
-- 
2.34.1


