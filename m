Return-Path: <linux-gpio+bounces-38160-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pIZGEhbNJ2rv2QIAu9opvQ
	(envelope-from <linux-gpio+bounces-38160-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 10:21:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C9165DB4B
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 10:21:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=WEuLlFcP;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38160-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38160-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92E353058B84
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 08:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5183A3EE1EA;
	Tue,  9 Jun 2026 08:13:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48463EC2F6;
	Tue,  9 Jun 2026 08:13:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992836; cv=none; b=lHxHYmWgkpXRZY4B5fOuIw2vHEbuPGmtgQrAE+jUHRCH3zsLkKu8SlKlXSNt4dZZ2bpwuHn5GllQBmVJFSY3G38UQT1DsXymHJt5n/z+ZZg8t2MR9tksjjs11MOakX4PnK6jEOASAA/6AsOr1WctZyGPQ8WTdefg2AU+ejEkYHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992836; c=relaxed/simple;
	bh=ho6QcQ1LKbLfIoHgvQi0DuiBjdbVeMQkcjFmCfEHeC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ci8u3V/uDUH4yYOv+5CdBf+wOr/icj4g+78r7CqrLTitRWfX9grDpn+s9UEs5QsboP2CxGsbzbfP0hh3pZ0mqYkN05u3/znUJnwne5opg0zrNYmZazpbZmznHCO6tNlEsxvCE665FqfQj/nNoaP1WxFNz+xTlL4nM96WEtVLWeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEuLlFcP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AADD2C4AF16;
	Tue,  9 Jun 2026 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780992836;
	bh=ho6QcQ1LKbLfIoHgvQi0DuiBjdbVeMQkcjFmCfEHeC0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WEuLlFcPD25pD1JsFV5F98hDxGKGT6tMS4pT/0ANjYGVxdL4e+hkbs7CTnzIQkYhB
	 kvNPRc1le3wzi0oL5g+A34e+eoX9+cxzXfUgEeZuMGdNID+ZRDgQu0zTuPWT26ILGa
	 qt9IGWARDJ215xsRnSHt5P5a49mt80ALuOKXTyv50csU3qlnbxwtGpA7i0XOP6vnxw
	 vlvHHWy7AdZgG4DBlxlFLLssDJI/TI9eJZ26xMQjBfvyY5znZ2bp8sfome8NL0QuLp
	 E4PePC96dC1/sueLQmx5Qbk9O3q2e0weEmjBpp+qosef33ru/3R26jAmer6tS/JApH
	 fZy4s2k56oH5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13D2CD8CAD;
	Tue,  9 Jun 2026 08:13:56 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Tue, 09 Jun 2026 10:13:48 +0200
Subject: [PATCH v4 5/6] extcon: qcom-spmi-misc: match PM8xxx USB ID
 platform device
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-mainline-send-v1-sending-v4-5-83768fbf404d@alex-min.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780992834; l=1259;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=GY8HHAKQAe9p+CGliq7ltiYrSns53pS1wL6cDILgUI0=;
 b=skemK+Zp/FmuoQmJTzt7VfdYD823Gi0WCTalR2GX7d3y38xUZRqrR9AZpe+wvZAZS/XnugA1d
 D5sU4RPm8MIBfTjpY9nRbB9vvdbLJD9af3l0BIZLQ3phHRKqAdRUHFA
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38160-lists,linux-gpio=lfdr.de,contact.alex-min.fr];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[contact@alex-min.fr]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A4C9165DB4B

From: Alexandre MINETTE <contact@alex-min.fr>

The PM8xxx MFD registers the PM8921 USB ID detector as a platform device
named "qcom-pm8xxx-usb-id". Its reused firmware node remains compatible
with "qcom,pm8921", so it does not match the extcon driver's OF table.

Add a platform device ID so the existing extcon driver binds to this
device and consumes its named USB ID interrupt.

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
 drivers/extcon/extcon-qcom-spmi-misc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/extcon/extcon-qcom-spmi-misc.c b/drivers/extcon/extcon-qcom-spmi-misc.c
index afaba5685c3d..e16c109b553e 100644
--- a/drivers/extcon/extcon-qcom-spmi-misc.c
+++ b/drivers/extcon/extcon-qcom-spmi-misc.c
@@ -204,8 +204,15 @@ static const struct of_device_id qcom_usb_extcon_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, qcom_usb_extcon_dt_match);
 
+static const struct platform_device_id qcom_usb_extcon_id[] = {
+	{ "qcom-pm8xxx-usb-id" },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, qcom_usb_extcon_id);
+
 static struct platform_driver qcom_usb_extcon_driver = {
 	.probe		= qcom_usb_extcon_probe,
+	.id_table	= qcom_usb_extcon_id,
 	.driver		= {
 		.name	= "extcon-pm8941-misc",
 		.pm	= &qcom_usb_extcon_pm_ops,

-- 
2.43.0



