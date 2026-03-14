Return-Path: <linux-gpio+bounces-33414-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BfdAiEYtWkBwgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33414-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 09:11:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A75628C11F
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 09:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A7043013715
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 08:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9F0320CCF;
	Sat, 14 Mar 2026 08:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="IZLtkubN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3C631F9A2;
	Sat, 14 Mar 2026 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773475827; cv=none; b=gwq1QLEtjXF5x2dapkwMCIgP7kNkNtqRnSvvhNyklDpROpWafb+XV3GmuY7qaF15QlQSTKbA/cdQDs2gSHACJfCyXJekzOYCup9FWZx2ASkirwOEieDHeqRClmbNphM6J4uJ0Sa8qoPxI7SEVOW3pgKQuv0ThP3+BW1EjTTSzEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773475827; c=relaxed/simple;
	bh=y0wrpgVe/vD8Ky8xVZLpP7/JzoI0TuJV77u/VjXtN84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SpML8XOSBh8m/bmcGzs1yScpUkJxdXb0KeBfuAHUD6Wp3ShmCN1ArsuLH3ixdcxrFrU3vEsTUcFVtuWbBqVy3lmVf4C34OG17aZr+J/Jh3Bx1n0KG3YBvCtYCt+sJjE1atkS9C3hCTM9MVI/iMIXL/h6BX+pf79QttBechJxgro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=IZLtkubN; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JuFP5+poEMd2cToki9o4QuDkVVwl7kDDGFz3csvEi6w=; b=IZLtkubNjEZUCIBj6UwzWWro5S
	dwTm4Jf8RTX7OSZoOe49Ri44sNKA1TFOZ4DhkPQx6dRnTuTpAOvLY1IXeBEvtHvMxuYnC5DU2+STl
	+FS+Bq9Z8+bBQmBHkuATFGEfwSxD4qIJR1dqiLIx+9VyVpfJRWRA4xFzfdmUJepqDsFigSguKLK5U
	HFGS3pxKmFq6rEmQ9iTMxVzuqHbQZwYLoESpXtsMCGg9seJMoLMuFiBEyq5DTFNXvy0UWk614fW2i
	QsQma/+/A+RmQdM3t9kDkX+Df2ayBVrLo/QgynyICasHW7Gkd+6iAoLTdPQkfMdVkp1iFFAFxRfST
	dDBE6GMg==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w1K4b-0000000E3Ib-4AB0;
	Sat, 14 Mar 2026 09:10:14 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sat, 14 Mar 2026 09:09:19 +0100
Subject: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure when
 pinmux is unknown
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
X-B4-Tracking: v=1; b=H4sIAK4XtWkC/33MQQ6DIBCF4asY1p0GhoLYVe/RdKGClaSKYQypM
 d696LJJu/xn8r6VkYveEbsWK4suefJhzCFPBWv7enw68DY3Q46aS24gtghNCDPsX0BdOaMuWkv
 VsLyZouv8+/Duj9y9pznE5eCT2K+/pCSAgy0rtKIuje3sbRgmWmh2A52nF9u1hH8FBAFK6M42B
 nml5LewbdsHLf6t5fAAAAA=
To: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773475781; l=3045;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=y0wrpgVe/vD8Ky8xVZLpP7/JzoI0TuJV77u/VjXtN84=;
 b=s1x0bAnmDtenjQITLEDVg8xReKC/2t2syyyFbqEyqOMA9aeL/KR817X65YV8fX7Cg0xHjLI/4
 YNoEt44iQrCAGcIsGfxu9YpSYQQsAm8HFpFZVMlFXrkTNk+fGaMV69z
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[mmpsystems.pl:s=x];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[mmpsystems.pl : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33414-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mmpsystems.pl:-];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.140];
	FROM_NEQ_ENVFROM(0.00)[michal.piekos@mmpsystems.pl,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mmpsystems.pl:email,mmpsystems.pl:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A75628C11F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.

The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
is in unitialized state.

Solution is to set pinmux to GPIO INPUT in
sunxi_pinctrl_irq_request_resources() if it wasn't initialized
earlier.

Tested on Orange Pi Zero 3.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
Suggested-by: Chen-Yu Tsai <wens@kernel.org>
---
Changes in v3:
- Drop v2 solution which was returning input instead of error when pin
  is not initialized.
- Add checking pinmux configuration in
  sunxi_pinctrl_irq_request_resources() and set pin to input if
  uninitialized
- Link to v2: https://lore.kernel.org/r/20260308-rc2-boot-hang-v2-1-516fdb820953@mmpsystems.pl

Changes in v2:
- Dropped the previous faulty solution which was forcing the axp313 to
  use r_pio as interrupt controller as pointed out by Jernej Škrabec.
- Implemented suggestion from Andrey Skvortsov to return default
  direction as input
- Link to v1: https://lore.kernel.org/r/20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 13 +++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index c990b6118172..7d46f7613672 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1089,6 +1089,9 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
 	struct sunxi_desc_function *func;
+	unsigned int offset;
+	u32 reg, shift, mask;
+	u8 muxval;
 	int ret;
 
 	func = sunxi_pinctrl_desc_find_function_by_pin(pctl,
@@ -1096,6 +1099,16 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
 	if (!func)
 		return -EINVAL;
 
+	offset = pctl->irq_array[d->hwirq] - pctl->desc->pin_base;
+	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
+	muxval = (readl(pctl->membase + reg) & mask) >> shift;
+
+	/* Change muxing to GPIO INPUT mode if at reset value */
+	if (muxval == SUN4I_FUNC_IO_DISABLE) {
+		sunxi_pmx_set(pctl->pctl_dev, pctl->irq_array[d->hwirq],
+			      SUN4I_FUNC_INPUT);
+	}
+
 	ret = gpiochip_lock_as_irq(pctl->chip,
 			pctl->irq_array[d->hwirq] - pctl->desc->pin_base);
 	if (ret) {
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index ad26e4de16a8..22c527fc6ae2 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -86,6 +86,7 @@
 
 #define SUN4I_FUNC_INPUT	0
 #define SUN4I_FUNC_IRQ		6
+#define SUN4I_FUNC_IO_DISABLE	7
 
 #define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
 #define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)

---
base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
change-id: 20260308-rc2-boot-hang-269e8546635b

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>


