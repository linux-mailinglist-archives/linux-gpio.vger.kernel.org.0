Return-Path: <linux-gpio+bounces-33941-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJctL56JvWnQ+gIAu9opvQ
	(envelope-from <linux-gpio+bounces-33941-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 18:53:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1CF2DEF6F
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 18:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D327830048D9
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 17:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB5F3BAD99;
	Fri, 20 Mar 2026 17:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="BZ+x97hr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E02314D07;
	Fri, 20 Mar 2026 17:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029204; cv=none; b=Z5QCuFaFdeXk4tDrI62ka+ton9B66RaLYMZ3PyXSc3mFVH6XBJ9aOLFFQUwdTJBavh98XjuM57opHHwrh/gU9a5vneevhnsXduTaJoVjh7ykRY8uUZSjCbdjd3TVvgS4iEMx4VAIgOnZsbIUZhx7yW9o8wFpDC4XrDld3TmFp4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029204; c=relaxed/simple;
	bh=gEWOqy+sIeNcPjljvwLLn3I0yJZERiHS40iKFLFPDUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PjFBEDQBY4NA96ITYf/yP6lZUKMcy3f9Z1nP5mmEOv3A+TJy5kGLEbZwmTZjvORtaq0xzr8L18hHLxSsCKRzKEtHLmu6cMmRUA53Kj/ZZbvoTxKHB/wBNgZ9wUKdHcYkpf2y4NR4eMUlWPDSx8yQ6UMjpbaanmoaymb+CgMGASE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=BZ+x97hr; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IQ5DmSWbpEi6JV0hoLTshUA+7sqOlx1p8QemCOc4Jrk=; b=BZ+x97hrR4odN8AQiWs1lPtUnt
	teCg9uiv12OvkeVLqUXbl60h0OOupLkb8xSa0aSnR3fo/v8rQiWH1kyb1oeF0HMo6NuEPw5dCd1VT
	Hy4dpx+KW2/3/oKpvZ+u+2aavrMd+MaNm2FIUOZqBr3t4l1a5hEaP1DuaQ8akAfOGL5kP5x6R7m6U
	26XZuLGpvfL1rNqgo8DGarQij2ZmZmXejR8O+oWiqW2DHzgf3MJ8ucCwttXxJ0v6sBPGLpvJSEjS8
	Tl8wuYs4EW28nnLw/DG+1oRqAR0/Fz5XKSdZManGmwHONi9iD5LbC14uQXo8HFEQXH8BXTn63avCI
	CyZj1JMg==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w3e2A-00000005OlX-2ODM;
	Fri, 20 Mar 2026 18:53:18 +0100
From: michal.piekos@mmpsystems.pl
Date: Fri, 20 Mar 2026 18:52:30 +0100
Subject: [PATCH v6 1/2] pinctrl: sunxi: pass down flags to pinctrl routines
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-rc2-boot-hang-v6-1-74dca70dd60e@mmpsystems.pl>
References: <20260320-rc2-boot-hang-v6-0-74dca70dd60e@mmpsystems.pl>
In-Reply-To: <20260320-rc2-boot-hang-v6-0-74dca70dd60e@mmpsystems.pl>
To: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774029161; l=6004;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=SbDK8rvVfMawrpNEZaxW/K09ccUSRo97Vz7GT5bX7kA=;
 b=/1OQ3yCrz96HA7tlcQyBJ0QatKVtY8ojhYiUuIIU4D6rOZ6gxnuiavwDJjdrqDGwB2KqhEv/y
 IShshZNI7miB+HpTZ1xnsqo/RszA4fgkkIovRHFz+XBeKB5/BeyhiJQ
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[mmpsystems.pl:s=x];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[mmpsystems.pl : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[michal.piekos@mmpsystems.pl,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33941-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mmpsystems.pl:-];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.162];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mmpsystems.pl:email,mmpsystems.pl:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: 3D1CF2DEF6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Andre Przywara <andre.przywara@arm.com>

Recent changes in the Allwinner pinctrl/GPIO IP made us add some quirks,
which the new SoCs (A523 family) need to use. We now have a comfortable
"flags" field on the per-SoC setup side, to tag those quirks we need, but
were translating those flag bits into specific fields for runtime use, in
the init routine.
Now the newest Allwinner GPIO IP adds even more quirks and exceptions,
some of a boolean nature.
To avoid inventing various new boolean flags for the runtime struct
sunxi_pinctrl, let's just directly pass on the flags variable used by the
setup code, so runtime can check for those various quirk bits directly.

Rename the "variant" member to "flags", and directly copy the value from
the setup code into there. Move the variant masking from the init
routine to the functions which actually use the "variant" value.

This mostly paves the way for the new A733 IP generation, which needs
more quirks to be checked at runtime.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 23 ++++++++++++++---------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  2 +-
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index c990b6118172..685b79fc0bf8 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -157,6 +157,7 @@ sunxi_pinctrl_desc_find_function_by_name(struct sunxi_pinctrl *pctl,
 					 const char *pin_name,
 					 const char *func_name)
 {
+	unsigned long variant = pctl->flags & SUNXI_PINCTRL_VARIANT_MASK;
 	int i;
 
 	for (i = 0; i < pctl->desc->npins; i++) {
@@ -168,7 +169,7 @@ sunxi_pinctrl_desc_find_function_by_name(struct sunxi_pinctrl *pctl,
 			while (func->name) {
 				if (!strcmp(func->name, func_name) &&
 					(!func->variant ||
-					func->variant & pctl->variant))
+					func->variant & variant))
 					return func;
 
 				func++;
@@ -209,6 +210,8 @@ sunxi_pinctrl_desc_find_function_by_pin_and_mux(struct sunxi_pinctrl *pctl,
 						const u16 pin_num,
 						const u8 muxval)
 {
+	unsigned long variant = pctl->flags & SUNXI_PINCTRL_VARIANT_MASK;
+
 	for (unsigned int i = 0; i < pctl->desc->npins; i++) {
 		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
 		struct sunxi_desc_function *func = pin->functions;
@@ -216,7 +219,7 @@ sunxi_pinctrl_desc_find_function_by_pin_and_mux(struct sunxi_pinctrl *pctl,
 		if (pin->pin.number != pin_num)
 			continue;
 
-		if (pin->variant && !(pctl->variant & pin->variant))
+		if (pin->variant && !(variant & pin->variant))
 			continue;
 
 		while (func->name) {
@@ -1338,6 +1341,7 @@ static int sunxi_pinctrl_add_function(struct sunxi_pinctrl *pctl,
 static int sunxi_pinctrl_build_state(struct platform_device *pdev)
 {
 	struct sunxi_pinctrl *pctl = platform_get_drvdata(pdev);
+	unsigned long variant = pctl->flags & SUNXI_PINCTRL_VARIANT_MASK;
 	void *ptr;
 	int i;
 
@@ -1362,7 +1366,7 @@ static int sunxi_pinctrl_build_state(struct platform_device *pdev)
 		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
 		struct sunxi_pinctrl_group *group = pctl->groups + pctl->ngroups;
 
-		if (pin->variant && !(pctl->variant & pin->variant))
+		if (pin->variant && !(variant & pin->variant))
 			continue;
 
 		group->name = pin->pin.name;
@@ -1387,11 +1391,11 @@ static int sunxi_pinctrl_build_state(struct platform_device *pdev)
 		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
 		struct sunxi_desc_function *func;
 
-		if (pin->variant && !(pctl->variant & pin->variant))
+		if (pin->variant && !(variant & pin->variant))
 			continue;
 
 		for (func = pin->functions; func->name; func++) {
-			if (func->variant && !(pctl->variant & func->variant))
+			if (func->variant && !(variant & func->variant))
 				continue;
 
 			/* Create interrupt mapping while we're at it */
@@ -1419,14 +1423,14 @@ static int sunxi_pinctrl_build_state(struct platform_device *pdev)
 		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
 		struct sunxi_desc_function *func;
 
-		if (pin->variant && !(pctl->variant & pin->variant))
+		if (pin->variant && !(variant & pin->variant))
 			continue;
 
 		for (func = pin->functions; func->name; func++) {
 			struct sunxi_pinctrl_function *func_item;
 			const char **func_grp;
 
-			if (func->variant && !(pctl->variant & func->variant))
+			if (func->variant && !(variant & func->variant))
 				continue;
 
 			func_item = sunxi_pinctrl_find_function_by_name(pctl,
@@ -1568,7 +1572,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 
 	pctl->dev = &pdev->dev;
 	pctl->desc = desc;
-	pctl->variant = flags & SUNXI_PINCTRL_VARIANT_MASK;
+	pctl->flags = flags;
 	if (flags & SUNXI_PINCTRL_NEW_REG_LAYOUT) {
 		pctl->bank_mem_size = D1_BANK_MEM_SIZE;
 		pctl->pull_regs_offset = D1_PULL_REGS_OFFSET;
@@ -1604,8 +1608,9 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 
 	for (i = 0, pin_idx = 0; i < pctl->desc->npins; i++) {
 		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
+		unsigned long variant = pctl->flags & SUNXI_PINCTRL_VARIANT_MASK;
 
-		if (pin->variant && !(pctl->variant & pin->variant))
+		if (pin->variant && !(variant & pin->variant))
 			continue;
 
 		pins[pin_idx++] = pin->pin;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index ad26e4de16a8..22bffac1c3f0 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -174,7 +174,7 @@ struct sunxi_pinctrl {
 	unsigned			*irq_array;
 	raw_spinlock_t			lock;
 	struct pinctrl_dev		*pctl_dev;
-	unsigned long			variant;
+	unsigned long			flags;
 	u32				bank_mem_size;
 	u32				pull_regs_offset;
 	u32				dlevel_field_width;

-- 
2.43.0


