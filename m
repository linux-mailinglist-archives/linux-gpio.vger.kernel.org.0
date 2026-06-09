Return-Path: <linux-gpio+bounces-38159-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c3qYMMHMJ2rF2QIAu9opvQ
	(envelope-from <linux-gpio+bounces-38159-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 10:20:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E9265DAE9
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 10:20:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=axerFYFb;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38159-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38159-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4CAF63099513
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 08:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD233EE1C4;
	Tue,  9 Jun 2026 08:13:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B8C3EBF02;
	Tue,  9 Jun 2026 08:13:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992836; cv=none; b=Y50Ya5arcPlZFKbenYSl8n1mdjrn+Q3OZy2KedMd2JxMh3UYcsBxhcZszHpf9eLs4cqbeFakkttT4EJnhwACgApdaJCjI2EDkWHFEl39430PepgtmuxKSHnXXWUTcp5T1pKdiv8vLMikG2+QvaCuCo/hIJlFyX+nsNqYPlOUCJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992836; c=relaxed/simple;
	bh=eK5KW5XaUhZgqtyPX8V2F4qYGjamjcNJA3BtmtkTQS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XB1nahkv0cWToBjxaEf5cRg9b5+vlX9Chfuz8majOTjYQMSu8UeG8P5jfj6LZ+yoVcpl13bo56o7DDqcsXScedQCzihBSRcCvjhUNravZ7VqjxjIXpLFUMU6xdS4W2nPC5C/Zz/3tWARkNtDt4bhU4+XsfvXVPDr9cLNSauXdNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axerFYFb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AFBCC4AF17;
	Tue,  9 Jun 2026 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780992836;
	bh=eK5KW5XaUhZgqtyPX8V2F4qYGjamjcNJA3BtmtkTQS8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=axerFYFb1yFaRZh1VhB/KrjnyFqOYsfDUSNnZcT3tAavh2gS1xc2Y7/ZRYzBwnuHi
	 8VXRH+vF+VFZRp5TGNNaV6bxA8HYR90LLRMYWh8N5wBDtPvH4kb2qoci/BOncdWaew
	 FkCkVfWqsZC+90m0raCN4STp7//qLCRGBcBmxRAVsDwYRw0FXUiZ0D/XRD3FbrsrbV
	 BiLanEwx5r/Yi4PZwiS3ryEh3wfA2HNyuyehkGVyI9pECUZFgdQ6DrelWE4GHYJYFr
	 852IgVufbYIwcAii8Y0NSo1WikYWjHiGqS2nX5CUNe8w70P2rY6WGwMVsn67MLqol5
	 q3oS7MEtco+xg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C426CD8CBD;
	Tue,  9 Jun 2026 08:13:56 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Tue, 09 Jun 2026 10:13:47 +0200
Subject: [PATCH v4 4/6] mfd: qcom-pm8xxx: register PM8921 USB ID extcon
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-mainline-send-v1-sending-v4-4-83768fbf404d@alex-min.fr>
References: <20260609-mainline-send-v1-sending-v4-0-83768fbf404d@alex-min.fr>
In-Reply-To: <20260609-mainline-send-v1-sending-v4-0-83768fbf404d@alex-min.fr>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Linus Walleij <linusw@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexandre MINETTE <contact@alex-min.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780992834; l=4481;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=wPc9N22m75KCBH5Mx8x+Rn9GxrIKl+3I5FlNe49Dud8=;
 b=IvoIuxNwisTPcXH+KYP8fWilf8j8ySunTiY75aoSMz0Yq0jEWEpw5NXD7p1Lt8W/7X557L0df
 2MGBMsieOQqBwsO9zMfmlrNRU2ayRoWAXANhf4ua+yuFZRocnIBI9f0
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38159-lists,linux-gpio=lfdr.de,contact.alex-min.fr];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:linux@gurudas.dev,m:linusw@kernel.org,m:robin.clark@oss.qualcomm.com,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:phone-devel@vger.kernel.org,m:contact@alex-min.fr,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[contact@alex-min.fr]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57E9265DAE9

From: Alexandre MINETTE <contact@alex-min.fr>

PM8921 reports the USB ID pin through interrupt 49 of its interrupt
controller. Unlike PM8941, this path has no separate addressable misc
block to represent as a devicetree child node.

Register a child platform device for the existing Qualcomm USB extcon
driver after creating the PMIC IRQ domain. Pass the USB ID interrupt as
a named resource and reuse the PM8921 firmware node, allowing consumers
to reference the PMIC node directly as their extcon provider.

Unregister the child device and dispose of the IRQ mapping when the
PMIC is removed or probing fails.

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
 drivers/mfd/qcom-pm8xxx.c | 78 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index 0cf374c015ce..884fc99a1488 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -7,6 +7,7 @@
 
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
+#include <linux/ioport.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
@@ -64,12 +65,15 @@
 
 struct pm_irq_data {
 	int num_irqs;
+	int usb_id_irq;
 	struct irq_chip *irq_chip;
 	irq_handler_t irq_handler;
 };
 
 struct pm_irq_chip {
 	struct regmap		*regmap;
+	struct platform_device	*usb_extcon;
+	unsigned int		usb_id_irq;
 	spinlock_t		pm_irq_lock;
 	struct irq_domain	*irqdomain;
 	unsigned int		num_blocks;
@@ -492,6 +496,13 @@ static const struct pm_irq_data pm8xxx_data = {
 	.irq_handler = pm8xxx_irq_handler,
 };
 
+static const struct pm_irq_data pm8921_data = {
+	.num_irqs = PM8XXX_NR_IRQS,
+	.usb_id_irq = 49,
+	.irq_chip = &pm8xxx_irq_chip,
+	.irq_handler = pm8xxx_irq_handler,
+};
+
 static const struct pm_irq_data pm8821_data = {
 	.num_irqs = PM8821_NR_IRQS,
 	.irq_chip = &pm8821_irq_chip,
@@ -501,11 +512,60 @@ static const struct pm_irq_data pm8821_data = {
 static const struct of_device_id pm8xxx_id_table[] = {
 	{ .compatible = "qcom,pm8058", .data = &pm8xxx_data},
 	{ .compatible = "qcom,pm8821", .data = &pm8821_data},
-	{ .compatible = "qcom,pm8921", .data = &pm8xxx_data},
+	{ .compatible = "qcom,pm8921", .data = &pm8921_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pm8xxx_id_table);
 
+static int pm8xxx_add_usb_extcon(struct platform_device *pdev,
+				 struct pm_irq_chip *chip,
+				 unsigned int hwirq)
+{
+	struct irq_fwspec fwspec = {
+		.fwnode = dev_fwnode(&pdev->dev),
+		.param_count = 2,
+		.param = { hwirq, IRQ_TYPE_EDGE_BOTH },
+	};
+	struct platform_device_info pdevinfo = {
+		.parent = &pdev->dev,
+		.fwnode = dev_fwnode(&pdev->dev),
+		.of_node_reused = true,
+		.name = "qcom-pm8xxx-usb-id",
+		.id = PLATFORM_DEVID_NONE,
+	};
+	struct resource resource;
+
+	chip->usb_id_irq = irq_create_fwspec_mapping(&fwspec);
+	if (!chip->usb_id_irq)
+		return -ENXIO;
+
+	resource = DEFINE_RES_IRQ_NAMED(chip->usb_id_irq, "usb_id");
+	pdevinfo.res = &resource;
+	pdevinfo.num_res = 1;
+
+	chip->usb_extcon = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(chip->usb_extcon)) {
+		int ret = PTR_ERR(chip->usb_extcon);
+
+		chip->usb_extcon = NULL;
+		irq_dispose_mapping(chip->usb_id_irq);
+		chip->usb_id_irq = 0;
+
+		return ret;
+	}
+
+	return 0;
+}
+
+static void pm8xxx_remove_usb_extcon(struct pm_irq_chip *chip)
+{
+	if (chip->usb_extcon)
+		platform_device_unregister(chip->usb_extcon);
+
+	if (chip->usb_id_irq)
+		irq_dispose_mapping(chip->usb_id_irq);
+}
+
 static int pm8xxx_probe(struct platform_device *pdev)
 {
 	const struct pm_irq_data *data;
@@ -570,9 +630,22 @@ static int pm8xxx_probe(struct platform_device *pdev)
 
 	irq_set_irq_wake(irq, 1);
 
+	if (data->usb_id_irq) {
+		rc = pm8xxx_add_usb_extcon(pdev, chip, data->usb_id_irq);
+		if (rc)
+			goto err_domain;
+	}
+
 	rc = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
 	if (rc)
-		irq_domain_remove(chip->irqdomain);
+		goto err_extcon;
+
+	return 0;
+
+err_extcon:
+	pm8xxx_remove_usb_extcon(chip);
+err_domain:
+	irq_domain_remove(chip->irqdomain);
 
 	return rc;
 }
@@ -582,6 +655,7 @@ static void pm8xxx_remove(struct platform_device *pdev)
 	struct pm_irq_chip *chip = platform_get_drvdata(pdev);
 
 	of_platform_depopulate(&pdev->dev);
+	pm8xxx_remove_usb_extcon(chip);
 	irq_domain_remove(chip->irqdomain);
 }
 

-- 
2.43.0



