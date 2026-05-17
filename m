Return-Path: <linux-gpio+bounces-36997-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHHYHYH3CWrivgQAu9opvQ
	(envelope-from <linux-gpio+bounces-36997-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 19:14:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F48F5626FD
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 19:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7DA51300360D
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 17:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0EF3C2BA8;
	Sun, 17 May 2026 17:14:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA19327C09;
	Sun, 17 May 2026 17:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779038079; cv=none; b=PboJn6B7IxLlqMvQkaOvbH2OTC9JtKD7kY0CHusyKHxMCaUsaPRPJ9SGszV0w/5rL4teFbRS1mF9R09EwsSloXBplKTBl4+9KO9ZfZ2iyJabB+yzmmdTyKhq9gSCyFE/DBqA6qXSuU27XJAXsp7iFjCxbNdm6J4CT8RCydl2txA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779038079; c=relaxed/simple;
	bh=w5oEMeftLT6dpjH4N6NKR2mi8NlY8HlAmFv9o+3dyb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tbydnxgFksOuK8cQtGBtM1WvfgMvAb8lKMxhVkxnC3Rqdo/PoLMr+aWnv6G16x7jrSw4bF7MgUytH6NkMl8QFquHdMXgREjay2vYLms1u9dV2a+GGPM32Ecp+c2eFM24WLoesc2AsaTLEcwSa5AgzQ0pasxSQahLl8jUIL9Tpxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 069D61F8004F;
	Sun, 17 May 2026 17:14:33 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 35F9BB4079C; Sun, 17 May 2026 17:14:33 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id CB7A8B4079C;
	Sun, 17 May 2026 17:14:06 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH] pinctrl: sunxi: Implement function_is_gpio
Date: Sun, 17 May 2026 19:14:05 +0200
Message-ID: <20260517171405.3697469-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1F48F5626FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36997-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,gmail.com,sholland.org,sys-base.io];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sys-base.io:email,sys-base.io:mid]
X-Rspamd-Action: no action

The function_is_gpio pinmux op allows the core to find out whether a
GPIO can be safely requested from a pinctrl property and requested as a
GPIO at the same time.

This is especially useful to request a GPIO with a particular drive
strength, which would otherwise not be possible.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index d3042e0c9712..6162f2d86723 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -821,6 +821,17 @@ static int sunxi_pmx_get_func_groups(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static bool sunxi_pmx_function_is_gpio(struct pinctrl_dev *pctldev,
+				       unsigned function)
+{
+	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	if (!strncmp(pctl->functions[function].name, "gpio", 4))
+		return true;
+
+	return false;
+}
+
 static void sunxi_pmx_set(struct pinctrl_dev *pctldev,
 				 unsigned pin,
 				 u8 config)
@@ -952,6 +963,7 @@ static const struct pinmux_ops sunxi_pmx_ops = {
 	.get_functions_count	= sunxi_pmx_get_funcs_cnt,
 	.get_function_name	= sunxi_pmx_get_func_name,
 	.get_function_groups	= sunxi_pmx_get_func_groups,
+	.function_is_gpio	= sunxi_pmx_function_is_gpio,
 	.set_mux		= sunxi_pmx_set_mux,
 	.gpio_set_direction	= sunxi_pmx_gpio_set_direction,
 	.request		= sunxi_pmx_request,
-- 
2.54.0


