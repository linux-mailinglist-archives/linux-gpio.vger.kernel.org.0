Return-Path: <linux-gpio+bounces-33830-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEIzNrYivGnQswIAu9opvQ
	(envelope-from <linux-gpio+bounces-33830-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:22:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7EB2CEB3E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5733D333A4DF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 16:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0373E9F97;
	Thu, 19 Mar 2026 16:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="j8gh51Fn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654BA38A292;
	Thu, 19 Mar 2026 16:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773936615; cv=none; b=IjKrTCEi/8K/2iA/7GUGmpar30CCZxrj51jSbQi4bnbMwYqk4r1VXkN5k5xBn8KDAtXYZAW0DB9+wyeDPI4XEOrcN88qs8IMkh+JBW563nU0h1GRgQdfGSF2dAfjAphyqb4ugstn0pO5Q1DmgzOtgzSCMGS7FJlSQnSDG6VHLe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773936615; c=relaxed/simple;
	bh=/HFuwOyepZBcoKn4qdROtpBfFPXhQv03vCmHiEIqhrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SwOLphJckluWo+t6bpZH00mYRjJ2UzMTu/l+XRkc2OngLdcZbDE6bjsJI8QX242/GoPAGrgwnCDHTO+NLEht673itn/ceVocdKNFwoidas00SXzB6+Ijffjt0DZOQ7uhLvECToha0Z9LUCLZ535FcoZRI0gcV1lovxiTZ0wPanI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=j8gh51Fn; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=A4Fkq0BpRh/daBqnf+0j3WwUVTWZQZIYHKaumJ6a8Wc=; b=j8gh51Fnt3ugvEg0v58zAFHwat
	1QqmTI54sPEnCirz41zxi/VTubbrcpjBYsnCO2Yf4ng4tyrCcDZ93VIVzkwkA/aJ6NJONWkJdlbl2
	wLH3UhYfMb8HTyfNZ5LoTmT0RzwHCRZc7kgf8VfTBI0LZkxu6WzBOt0pu1TrxNbIg3IVPIwiqwmfI
	k5fYhgEh07VR+e+1dz4WaWdSqD4cOBAk729zn8WkPOdgHWi3jDsLdB4qXCKB5ltqFL1AP3zbYF/AQ
	iNO1WVD9Kj+DaurIqK1u2HkEBMjMZqUVspc4vNr38qhwDiUulzwkZGiH80cYF7ryL8FLlzd1qsNak
	bfSA97KQ==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w3Fwo-0000000FeUM-0BVY;
	Thu, 19 Mar 2026 17:10:10 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Thu, 19 Mar 2026 17:09:55 +0100
Subject: [PATCH v4 2/2] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-rc2-boot-hang-v4-2-4372f47cb6b8@mmpsystems.pl>
References: <20260319-rc2-boot-hang-v4-0-4372f47cb6b8@mmpsystems.pl>
In-Reply-To: <20260319-rc2-boot-hang-v4-0-4372f47cb6b8@mmpsystems.pl>
To: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773936605; l=2466;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=/HFuwOyepZBcoKn4qdROtpBfFPXhQv03vCmHiEIqhrc=;
 b=6hdF4CYJBWZwR/0NIfa0VSmV4DSB6Nn2VI7kon8NEWAVLcyHTWoH+QwDJ9TGmRBTM5qCCDJmu
 XZcxF7ijXknALkyMbhT4W2z24DD2NeBSCO/JTP5dabYocddLvH9j4B+
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[mmpsystems.pl:s=x];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[mmpsystems.pl : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33830-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mmpsystems.pl:-];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.276];
	FROM_NEQ_ENVFROM(0.00)[michal.piekos@mmpsystems.pl,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mmpsystems.pl:email,mmpsystems.pl:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7C7EB2CEB3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.

The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
is in unitialized state.

Solution is to set pinmux to GPIO INPUT in
sunxi_pinctrl_irq_request_resources() if it wasn't initialized
earlier.

Tested on Orange Pi Zero 3.

Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()")
Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 19 +++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 685b79fc0bf8..321ee97f5745 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1092,13 +1092,32 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
 	struct sunxi_desc_function *func;
+	unsigned int offset;
+	u32 reg, shift, mask;
+	u8 muxval;
 	int ret;
+	bool is_new_layout;
+	bool is_reset_mux;
 
 	func = sunxi_pinctrl_desc_find_function_by_pin(pctl,
 					pctl->irq_array[d->hwirq], "irq");
 	if (!func)
 		return -EINVAL;
 
+	offset = pctl->irq_array[d->hwirq] - pctl->desc->pin_base;
+	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
+	muxval = (readl(pctl->membase + reg) & mask) >> shift;
+
+	/* Change muxing to GPIO INPUT mode if at reset value */
+	is_new_layout = pctl->flags & SUNXI_PINCTRL_NEW_REG_LAYOUT;
+	is_reset_mux = (!is_new_layout && muxval == SUN4I_FUNC_DISABLED_OLD) ||
+		       (is_new_layout && muxval == SUN4I_FUNC_DISABLED_NEW); 
+
+	if (is_reset_mux) {
+		sunxi_pmx_set(pctl->pctl_dev, pctl->irq_array[d->hwirq],
+			      SUN4I_FUNC_INPUT);
+	}
+
 	ret = gpiochip_lock_as_irq(pctl->chip,
 			pctl->irq_array[d->hwirq] - pctl->desc->pin_base);
 	if (ret) {
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 22bffac1c3f0..0daf7600e2fb 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -86,6 +86,8 @@
 
 #define SUN4I_FUNC_INPUT	0
 #define SUN4I_FUNC_IRQ		6
+#define SUN4I_FUNC_DISABLED_OLD 7
+#define SUN4I_FUNC_DISABLED_NEW 15
 
 #define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
 #define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)

-- 
2.43.0


