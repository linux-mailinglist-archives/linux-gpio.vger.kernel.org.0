Return-Path: <linux-gpio+bounces-33844-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BnsKSAyvGnxuQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33844-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 18:28:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 291E52CFFBC
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 18:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0459A30C69E5
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8B730FC34;
	Thu, 19 Mar 2026 17:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="TXJJbwx6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4492DFA5B;
	Thu, 19 Mar 2026 17:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773940750; cv=none; b=MVjPYVYx2ZIMisvoYIoWqa7I7UHUidubvQX73pDnAiNFZqgTzNPSeKFuD13DGmxw5ncPT9N27ikBB+myiQ3sI6+jvq4n41m0M04t2kseiEztXEZLKSpqM5J1noWWK7wFjkJCP01veHHtbEFeK/PNwMDFVxwW2oHYcDWO/sLxo5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773940750; c=relaxed/simple;
	bh=HIn/7AWM4rxYQ9Wt1cYh0+dNNUA4CpEdu/C69TAeiWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CvUd+wr+Blek3X2zF0DPl2sdOB+LKvMqQ/jRgJE4kba4AYJnlVIyBsKMCdmn3jcazKyozB3ATnh4AB7rbOix31Zs0Gc9nMxqQ0WlCVvR4VDV+Fxeaa6CGKPzGRp1W8W/dAOz5uBB8I2KirPXy62G036ywSOapJUkB6qYgJPVs1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=TXJJbwx6; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rzsVAb42s53WXqAjWUga9OZyG9wFBa2wXJBkO6CnKoM=; b=TXJJbwx6ioPQR5/dL6m2CYRgRZ
	hvxRx4jj9bEmteiuRHbufbKeXnccBQjGQHFZpmETN5QAMc3TUX0DDBc5sBWkkQ5v4eUYVrIVYbfkx
	ptYZtQVwKQRUfG3GzE1vi+QDieArbJ324rFHCvQkuhnoJHOb/JovJBqLS4oqiSR0AVAHvuMT0ZcnX
	qRlhG2rCPh1MP/PZLX27gLWk8hTSR4eKKmdzLc2o+7tIUkFQdQjm26d58sp9F5frq+iU9InGNvEDo
	wCxsMdhoZlg7dxW9OeEgYoVm70CpKggZlTZTH0oU91px3UoQy6Z46xGTQzXbN4EFW9x3DPOAVeLRg
	ZSUq2GJg==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w3H1W-0000000HM7W-1kVr;
	Thu, 19 Mar 2026 18:19:06 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Thu, 19 Mar 2026 18:19:03 +0100
Subject: [PATCH v5 2/2] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-rc2-boot-hang-v5-2-092834a882b1@mmpsystems.pl>
References: <20260319-rc2-boot-hang-v5-0-092834a882b1@mmpsystems.pl>
In-Reply-To: <20260319-rc2-boot-hang-v5-0-092834a882b1@mmpsystems.pl>
To: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773940742; l=2608;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=HIn/7AWM4rxYQ9Wt1cYh0+dNNUA4CpEdu/C69TAeiWk=;
 b=AjQ/09Qp3ksyJFRwDYdrVSUFgYf8UcWCYAKSUaNcpqjfPUetEc2pz58OOifBQzbZ9wyTf2nn8
 /rrDy4WJ1gzBPpvZH/zGNcXR/asjl6OMZhWpApxGRtcqzk21kCGSU1N
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[mmpsystems.pl:s=x];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[mmpsystems.pl : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33844-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mmpsystems.pl:-];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.159];
	FROM_NEQ_ENVFROM(0.00)[michal.piekos@mmpsystems.pl,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mmpsystems.pl:email,mmpsystems.pl:mid]
X-Rspamd-Queue-Id: 291E52CFFBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.

The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
is in uninitialized state.

Solution is to set pinmux to GPIO INPUT in
sunxi_pinctrl_irq_request_resources() if it wasn't initialized
earlier.

Tested on Orange Pi Zero 3.

Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()")
Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 21 +++++++++++++++++++--
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  2 ++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 685b79fc0bf8..e3aa2b70aa7d 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1092,15 +1092,32 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
 	struct sunxi_desc_function *func;
+	unsigned int offset;
+	u32 reg, shift, mask;
+	u8 muxval;
 	int ret;
+	u8 disabled_mux;
 
 	func = sunxi_pinctrl_desc_find_function_by_pin(pctl,
 					pctl->irq_array[d->hwirq], "irq");
 	if (!func)
 		return -EINVAL;
 
-	ret = gpiochip_lock_as_irq(pctl->chip,
-			pctl->irq_array[d->hwirq] - pctl->desc->pin_base);
+	offset = pctl->irq_array[d->hwirq] - pctl->desc->pin_base;
+	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
+	muxval = (readl(pctl->membase + reg) & mask) >> shift;
+
+	/* Change muxing to GPIO INPUT mode if at reset value */
+	if (pctl->flags & SUNXI_PINCTRL_NEW_REG_LAYOUT)
+		disabled_mux = SUN4I_FUNC_DISABLED_NEW;
+	else                                           
+		disabled_mux = SUN4I_FUNC_DISABLED_OLD;
+	
+	if (muxval == disabled_mux)                    
+		sunxi_pmx_set(pctl->pctl_dev, pctl->irq_array[d->hwirq],
+			      SUN4I_FUNC_INPUT);
+
+	ret = gpiochip_lock_as_irq(pctl->chip, offset);
 	if (ret) {
 		dev_err(pctl->dev, "unable to lock HW IRQ %lu for IRQ\n",
 			irqd_to_hwirq(d));
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


