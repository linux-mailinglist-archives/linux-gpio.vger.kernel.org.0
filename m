Return-Path: <linux-gpio+bounces-32335-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K0+NDgTomnQywQAu9opvQ
	(envelope-from <linux-gpio+bounces-32335-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 22:57:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8CF1BE54F
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 22:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF9043043DBD
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 21:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2032A47AF40;
	Fri, 27 Feb 2026 21:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYcDo7Ze"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EE8472792
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 21:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229409; cv=none; b=VilePfDOem4PdXbN4nf+4AUYYP6aMzx2a4mlokIxZY60Yq49PDJUOvrna0G5vhlDMfbvZWoXZnhrLxZOcQ+vqhxAU49dXaen5VUVQNLzBKnSoO5kgjVOvWLdpc9HM1Ro4AOMrETb4ymWFx6O3ONn9dQxChYU87TtW9hUkxFKsK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229409; c=relaxed/simple;
	bh=jAdRiOc6eHNnrcaLppBpsAksw3gqq4WhjHpdzYZdmkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H5njbypsVPvqF2mpp4pXf0nYHZD3rOaV+NlwVw1/8mbQkkPxqfwJQSUftK3BmEizygfRBcwn3dJpZzDJzcOLJh1pF9vIKfvsn6aokpYVh3euznYhrrxC1W7u3NaPfhT431xO7C0xPmdmHZ8kcYkQ9u10kH+oUDPjEUMi8DTZcgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYcDo7Ze; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64acd19e1dfso2452669d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 13:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772229408; x=1772834208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICpWNGc9t/1ds7tN5GBFPqCGmQCh607eDV5V6BgRP2o=;
        b=BYcDo7ZeAq7JxJW+8g8uGxJM7/n8fYRKAeQJFoZp1l8mazQtQ+/GzvXgAezRrq5cgw
         ljgVSq4ucBgmAVK85e5iKTqhE3igQhosI3+Ce5AoxdDutHW/sHacka5SyNFhsn33v5QD
         zq/7pokGBV0EEQ1pDUKmRGRt48Z25jXJvkUxslUusnAmXVApGfxqYKS1UPg304lQphrF
         P7i+f/VG2HOj0hDPo3Ns801a3+KvYJDxBWHhrB1Cz+4v1FtoXzNcwp9gb/2ekv55hHr5
         2gnVJV8Y71r+5m+G/2VbofkRg0PRep+3vTRIuaxyb6PUymX7XHOnYfAc3sv6HzZ8nyGJ
         1QJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229408; x=1772834208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ICpWNGc9t/1ds7tN5GBFPqCGmQCh607eDV5V6BgRP2o=;
        b=E0ex8mcRBe9u4o30ignvebQGVeu36S6y8DoETsrgGnQRsm6FodwuF0ngOk/2IOrGVY
         eJW2Fpcmv343lSyVZKDjibXaIrj/RN5+GNPNr54kAGnS1Rkd8zJy1ahVPO/TXr1twX4q
         7s2Iawm3PpajsvhaOviqOGSGS1V/0oZlUPQbj1oczFQWBYiyBZ4syfN2HT0DGUlryMY9
         AMw/n1zyd9RzB8P/OVFkKPajAMk9L4bKQ/+WBc8KS0wEOoKQo0NSTqOSXvQT3tS19inP
         NWo3+NeNbkP2xJh8REm1EeM5vJQzH0zw59blgaqW16eBxB04LE2hIHbist7mba2gB8lx
         TxzA==
X-Forwarded-Encrypted: i=1; AJvYcCX+fMHKV/tdtzs5WgYnEufKwUrrDa8e5+5gUpO1AGYoy5/RqzXAcQqxZcyHYy6YYruxTbw5+TN99vGf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk5wkCUSVLw5oGkrLbMPNTqlSFMQ4n2RoW5E2k5kLVoZeEIdEo
	UwUJHZugqMbLsCGT9czSNoksAQBuiq3kiOrBeFp2LpevJQ6QM1dgt+70dxN2UAjDp90=
X-Gm-Gg: ATEYQzzaPtPJendfcfhCe672bhjCrO+7kD1c77DtoZsuI9IcmcyT2x4DetqLOLrm/9x
	IJaPtc+GmUJ8/Sqsfh0KMnWqqDc0OSPztzKdcGT01EcZPg/0fcRFw2ILj7e1NOmRrl1AlDHuFq5
	ejYS0RIycv4X7b7L7B6PkZ6cULKEMeIjLPGt5dLlYzoRWvm9eca7iKiWDmGJC+7SWeDL+Gxu+vg
	/aw+UFqgvJxASuw7p7mylOfVkNiSpiCx/PKZ/gJOwENsVYKn9samjvb277ucIu6RVNM/NcjaxjT
	KCBKCaeMPdhfLji7EnKyI4DP9Ks2e/3b1FN4uSK62SRhXUo4NspeeyQfjUCUYfg1Nq8YsV+7sze
	xf4eWW7s9HanCUP0noSm61x5Pxw5/QnMEv1T0+uFmMOEMkX8VPqIUeod1Z+fQ/3TF/e+YLweQLU
	9yN12ehys2U60iuGpb8W6q+5G9u4YdCQTdiaTjGQ5j9Rj8teLapcCAQIr0mF2RHYg9ALpEH+TeV
	aH+upUC1icy0ecXRqXkPlQQ
X-Received: by 2002:a53:c943:0:b0:64a:e222:d3fa with SMTP id 956f58d0204a3-64cc22107a1mr3305068d50.58.1772229407863;
        Fri, 27 Feb 2026 13:56:47 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb75a1157sm2948509d50.6.2026.02.27.13.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 13:56:47 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Joshua Henderson <joshua.henderson@microchip.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2 2/2] pinctrl: pinctrl-pic32: Use devres version of gpiochip_add_data()
Date: Fri, 27 Feb 2026 15:56:24 -0600
Message-ID: <20260227215624.1094832-3-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227215624.1094832-1-ethantidmore06@gmail.com>
References: <20260227215624.1094832-1-ethantidmore06@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-32335-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2F8CF1BE54F
X-Rspamd-Action: no action

Convert gpiochip_add_data() to devm_gpiochip_add_data() to use devres
style cleanup across entire driver.

Suggested-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
v2:
- Made this a series, added this patch.

 drivers/pinctrl/pinctrl-pic32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index d185fe48dc0d..07a24e17d35b 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -2253,7 +2253,7 @@ static int pic32_gpio_probe(struct platform_device *pdev)
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
 	girq->parents[0] = irq;
-	ret = gpiochip_add_data(&bank->gpio_chip, bank);
+	ret = devm_gpiochip_add_data(&pdev->dev, &bank->gpio_chip, bank);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to add GPIO chip %u: %d\n",
 			id, ret);
-- 
2.53.0


