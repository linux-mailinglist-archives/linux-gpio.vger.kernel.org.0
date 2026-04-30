Return-Path: <linux-gpio+bounces-35854-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOdPC0gj82nIxQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35854-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 11:39:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE4349FF39
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 11:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCE54307729F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77903A5E80;
	Thu, 30 Apr 2026 09:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEW7Wnnz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C53C3A75AF
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 09:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541677; cv=none; b=gprKAao5z2GTU8zV0t5pGO+tzpcOYEp16jO5TVTmoVE3QCJ364jTCEe928li5Gkpaaw8j0YvmNI1C8Utcd51i7wb2CvDNEANly4+oUddfEVUUWY1OExl9t5J4H2tXbYz9uxl+WIFqKwQ2nAvLTUUg8KdfEtR+jhKwRPoRxS7ZCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541677; c=relaxed/simple;
	bh=0b0YbIkJoiTMpkr6mZYIFRRW4hxuI7AD8ktGdDTbmpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SkKpEoj3aL/Q+300dpegQ8LytdoxJ1ICm5v5ySGcGvefG5+Hpm8Gup6ryUUVSZPyef3eI/NMdJDhwIm0pU577dxt0GhMIWpA41HJdW7y3dDdpRJPuL5wHwmMj2ApSDJx0I3X8Yq2mNPiCQop7y0xXz8DfkvqRTgY6DAdgzrgoDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEW7Wnnz; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so396575f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 02:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777541673; x=1778146473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnlbIoDjWMXG99Bx7mpmmcasvbrTGnw2MOblCR/sYkk=;
        b=JEW7WnnzyH7R1KNz0DB44rXqWH1YzJ8aMYp3YWiqldNpm23nEmyebrMq8Ph5RzrumY
         Z4l77A1deIleI1+M+f06VCoZZEr+rYbtjto12As9EyQlr1t5LDF6mb8sapHoc2WPuFnl
         vB9yEsoCsl6dCd9q4xDZCLSMSeYev99s72Z3g91ScxpLl3Jt180XojavnmxTEwDROlHj
         qC6w0cR/+67mfnsmAaG51+WnDxSNnD8fwJHeWyqaW3J8b3rGoa6ELRvXifgENy7T4D1S
         +M128+nR1vs8hPQ00toH2QXomHmqGCxlAHkro8uWOq5S52LEHkdWtLwPPsdauHMaSc+q
         mIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777541673; x=1778146473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UnlbIoDjWMXG99Bx7mpmmcasvbrTGnw2MOblCR/sYkk=;
        b=QH7nNvIvG0kh2Z29br0lQ7YHdD3ueG30jmT+6jHwlhDG/eVjY3c6V0/dSYlOvgaix+
         c0ojVVNAnnAD2T1lIju8DOL2pVmlyBGq28JUiyLXR/i/7ZWKxxe13u1IHIono+tKAAri
         rKDS9fM6YEj5km6q1zrAHnqXiiooqqSmCO2x4sqf4/oemCUkaqU9ztnwjsBgJqnWR3pT
         vwbivrDpuFc0TEmX/T0c7HXn9n1PYP9McLbYrZEHDR1u7YsuBsNn634p9CzXySKMSi9D
         FtPFDcS2286la+Xg4nInrv9gh3z8i3ML74uOv+YyUQZZWzz7HkMJnnGl7y3Pwf+Cvl4s
         rgbA==
X-Forwarded-Encrypted: i=1; AFNElJ+uLYmHjpuz6ifRkFgPN9GmSrJ59y/43KXoMAFbz708n1tCtXCtKD4I5OLL+OQwU4//vdE0LC/yuJzg@vger.kernel.org
X-Gm-Message-State: AOJu0YyN8w+xKcD8ybVk2XWgnO8E8ksnIyvVdsl1LH/rsEkJzE5vRQqz
	Hkq8+8FveC+scblkjXKIx8E2JN/zUYgFGdOGENej19H9SjP4m0sVHdAK
X-Gm-Gg: AeBDievdKwqBQ7AlGOLEpRQ0v5jcMijNYu5+lmMiRUVf4DjEwITisF0mccuXMqcE7Jy
	oMYB37f3jkiji1IxBTzjfZ6mU+5CUd4hgRczxMKHRL+vp2Dk5vG1n3kUGrRQ1fPT8su/Sf3EygP
	nq9q2h1y7lrFvycgRDO8Mo7Ay+F3r8CCeJ1XEE0gRuuNJAJyr94RTDHDxKRP7LaIQOzrcPySgjB
	PsBxMFjeCxVQQUVwiBmbO7cf3Z0jzDYcFAxvP/BsKreBmaKWKEWs4hIMYS7C5OutVt+zPoPwZ+h
	LJmYG6SSuU9LI0q+OmR6x1wpeCpMcMoX8y5xx8Vi0usSBYq9kfJkg7Vrze34ULUi8ENKMIkNHM7
	W6kQ0uAArtCD0AtqAdWbFiDkmGhA5bUfe4JC6twjY8RwWIRfqLCGASMeSpoS6pefON5Vx01iPzS
	6XqZZ1/IExZSg/YB/0+y54iHrSg/fG5DXYR6MOf8GWaJTG8+NahAAhPOM5
X-Received: by 2002:a5d:5f56:0:b0:43d:7508:c9c9 with SMTP id ffacd0b85a97d-4493f42dab3mr3553467f8f.27.1777541672680;
        Thu, 30 Apr 2026 02:34:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c22sm11953913f8f.28.2026.04.30.02.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:34:32 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 7/7] pinctrl: renesas: rzg2l: Add support for clone channel control
Date: Thu, 30 Apr 2026 10:34:12 +0100
Message-ID: <20260430093422.74812-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BBE4349FF39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35854-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC has some IP such as I2C ch{2,3},SCIF ch{3,4,5},
RSPI ch{1,2} and RSCI ch{1,2,3} need to control the clone channel for
proper operation. As per the RZ/G3L hardware manual, the clone channel
setting is to be done before the mux setting.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Started using an 8-bit pin mask instead of start and end pin indices,
   and combined multiple entries with the same port number and config
   using ORed values of BIT() and GENMASK(), thereby reducing table size.
 * Started using an 8-bit function mask instead of a function index, and
   got rid of the shared pin bit. This also provides info about the
   possible functions.
 * Dropped RZG3L_CLONE_CHANNEL_{PACK,DTAT,SHARED_PIN_MASK} macros.
 * Replaced RZG3L_CLONE_CHANNEL_CFG_PIN_{START,END}_MASK macro with
   RZG3L_CLONE_CHANNEL_PIN_MASK.
 * Replaced RZG3L_CLONE_CHANNEL_CFG_PORT_MASK macro with
   RZG3L_CLONE_CHANNEL_PORT_MASK.
 * Updated kernel doc comment for clone register from 'registers' to
   'register'.
 * Dropped dynamic allocation for the clone register cache, instead using
   static allocation in struct rzg2l_pinctrl_reg_cache, as it is a single
   32-bit register.
 * Replaced the LUT and for loop in rzg2l_pinctrl_set_clone_mode() with a
   simple switch statement.
 * Dropped the complex check to find the func match in
   rzg2l_pinctrl_set_clone_mode() by using pin_func_mask & BIT(func).
 * Dropped the inner for loop for finding a pin match in
   rzg2l_pinctrl_set_clone_mode() by using pin_mask & BIT(pin).
 * Dropped field_prep with "val << bit" in rzg2l_pinctrl_set_clone_mode()
   as val is just 0 or 1.
 * In rzg2l_pinctrl_probe(), replaced the temporary variable offset with
   &pctrl->clone_offset.
 * Replaced RZG3L_CLONE_CHANNEL_PIN_CFG_PACK with RZG3L_CLONE_CHANNEL_DATA,
   and replaced clone_pin_configs, n_clone_pins,
   r9a08g046_clone_channel_pin_cfg with clone_channel_data,
   n_clone_channel_data, and r9a08g046_clone_channel_data.
v3:
 * New patch.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 181 ++++++++++++++++++++++++
 1 file changed, 181 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index eff5fc081ec8..bed551fe332d 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -11,12 +11,14 @@
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/regmap.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
 
@@ -152,6 +154,18 @@
 	 FIELD_PREP_CONST(VARIABLE_PIN_CFG_PORT_MASK, (port)) | \
 	 FIELD_PREP_CONST(PIN_CFG_MASK, (cfg)))
 
+#define RZG3L_CLONE_CHANNEL_PIN_MASK	GENMASK(31, 24)
+#define RZG3L_CLONE_CHANNEL_PORT_MASK	GENMASK(23, 19)
+#define RZG3L_CLONE_CHANNEL_BIT_MASK	GENMASK(12, 9)
+#define RZG3L_CLONE_CHANNEL_VAL_MASK	BIT(8)
+#define RZG3L_CLONE_CHANNEL_PFC_MASK	GENMASK(7, 0)
+#define RZG3L_CLONE_CHANNEL_DATA(port, pins, bit, val, pfc) \
+	(FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_PIN_MASK, (pins)) | \
+	 FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_PORT_MASK, (port)) | \
+	 FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_BIT_MASK, (bit)) | \
+	 FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_VAL_MASK, (val)) | \
+	 FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_PFC_MASK, (pfc)))
+
 #define P(off)			(0x0000 + (off))
 #define PM(off)			(0x0100 + (off) * 2)
 #define PMC(off)		(0x0200 + (off))
@@ -313,6 +327,8 @@ struct rzg2l_pinctrl_data {
 	const struct rzg2l_dedicated_configs *dedicated_pins;
 	unsigned int n_port_pins;
 	unsigned int n_dedicated_pins;
+	const u32 *clone_channel_data;
+	unsigned int n_clone_channel_data;
 	const struct rzg2l_hwcfg *hwcfg;
 	const u64 *variable_pin_cfg;
 	unsigned int n_variable_pin_cfg;
@@ -350,6 +366,7 @@ struct rzg2l_pinctrl_pin_settings {
  * @smt: SMT registers cache
  * @sr: SR registers cache
  * @nod: NOD registers cache
+ * @clone: Clone register cache
  * @sd_ch: SD_CH registers cache
  * @eth_poc: ET_POC registers cache
  * @other_poc: OTHER_POC register cache
@@ -367,6 +384,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u32	*smt[2];
 	u32	*sr[2];
 	u32	*nod[2];
+	u32	clone;
 	u8	sd_ch[2];
 	u8	eth_poc[2];
 	u8	oen;
@@ -385,6 +403,8 @@ struct rzg2l_pinctrl {
 
 	struct clk			*clk;
 
+	struct regmap			*syscon;
+
 	struct gpio_chip		gpio_chip;
 	struct pinctrl_gpio_range	gpio_range;
 	DECLARE_BITMAP(tint_slot, RZG2L_TINT_MAX_INTERRUPT);
@@ -398,6 +418,7 @@ struct rzg2l_pinctrl {
 	struct rzg2l_pinctrl_reg_cache	*cache;
 	struct rzg2l_pinctrl_reg_cache	*dedicated_cache;
 	atomic_t			wakeup_path;
+	u32				clone_offset;
 };
 
 static const u16 available_ps[] = { 1800, 2500, 3300 };
@@ -623,6 +644,45 @@ static int rzg2l_validate_pin(struct rzg2l_pinctrl *pctrl,
 	return 0;
 }
 
+static int rzg2l_pinctrl_set_clone_mode(struct rzg2l_pinctrl *pctrl,
+					u8 port, u8 pin, u8 func)
+{
+	unsigned int i;
+
+	if (!pctrl->data->clone_channel_data)
+		return 0;
+
+	switch (func) {
+	case 2:
+	case 4 ... 7:
+		break;
+	default:
+		return 0;
+	}
+
+	for (i = 0; i < pctrl->data->n_clone_channel_data; i++) {
+		unsigned int pin_data = pctrl->data->clone_channel_data[i];
+		unsigned int pin_func_mask = FIELD_GET(RZG3L_CLONE_CHANNEL_PFC_MASK, pin_data);
+		unsigned int pin_mask = FIELD_GET(RZG3L_CLONE_CHANNEL_PIN_MASK, pin_data);
+		u32 bit, val;
+
+		if (!(pin_func_mask & BIT(func)) ||
+		    FIELD_GET(RZG3L_CLONE_CHANNEL_PORT_MASK, pin_data) != port)
+			continue;
+
+		if (!(pin_mask & BIT(pin)))
+			continue;
+
+		bit = FIELD_GET(RZG3L_CLONE_CHANNEL_BIT_MASK, pin_data);
+		val = FIELD_GET(RZG3L_CLONE_CHANNEL_VAL_MASK, pin_data);
+
+		return regmap_update_bits(pctrl->syscon, pctrl->clone_offset,
+					  BIT(bit), val << bit);
+	}
+
+	return 0;
+}
+
 static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 				       u8 pin, u8 off, u8 func)
 {
@@ -698,6 +758,10 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 		func = psel_val[i] - hwcfg->func_base;
 		dev_dbg(pctrl->dev, "port:%u pin: %u off:%x PSEL:%u\n", port, pin, off, func);
 
+		ret = rzg2l_pinctrl_set_clone_mode(pctrl, port, pin, func);
+		if (ret)
+			return ret;
+
 		rzg2l_pinctrl_set_pfc_mode(pctrl, pin, off, func);
 	}
 
@@ -2636,6 +2700,97 @@ static const struct rzg2l_dedicated_configs rzg3l_dedicated_pins[] = {
 	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
 };
 
+static const u32 r9a08g046_clone_channel_data[] = {
+	/* I2C ch2 Bit:0 Value:0 PFC:4 */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PG, GENMASK(7, 6), 0, 0, BIT(4)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PH, GENMASK(3, 2), 0, 0, BIT(4)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PK, GENMASK(1, 0), 0, 0, BIT(4)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PA, GENMASK(5, 4) | GENMASK(1, 0), 0, 0, BIT(4)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PB, GENMASK(5, 4) | GENMASK(1, 0), 0, 0, BIT(4)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PC, GENMASK(1, 0), 0, 0, BIT(4)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PD, GENMASK(7, 6) | GENMASK(3, 2), 0, 0, BIT(4)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PE, GENMASK(7, 6) | GENMASK(3, 2), 0, 0, BIT(4)),
+	/* I2C ch2 Bit:0 Value:1 PFC:4 */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P5, GENMASK(5, 4) | GENMASK(1, 0), 0, 1, BIT(4)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P6, GENMASK(6, 5) | GENMASK(2, 1), 0, 1, BIT(4)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P8, GENMASK(5, 4) | GENMASK(1, 0), 0, 1, BIT(4)),
+	/* I2C ch3 Bit:1 Value:0 PFC:4 */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PF, GENMASK(1, 0), 1, 0, BIT(4)),
+	/* I2C ch3 Bit:1 Value:1 PFC:4 */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P2, GENMASK(1, 0), 1, 1, BIT(4)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P5, BIT(6) | GENMASK(3, 2), 1, 1, BIT(4)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P6, GENMASK(4, 3) | BIT(0), 1, 1, BIT(4)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P7, GENMASK(7, 6), 1, 1, BIT(4)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P8, GENMASK(3, 2), 1, 1, BIT(4)),
+	/* SCIF ch3 Bit:4 Value:0 PFC:{6,7} */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PG, GENMASK(6, 4), 4, 0, BIT(6)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PH, GENMASK(5, 3), 4, 0, BIT(7)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PA, GENMASK(4, 2), 4, 0, BIT(7)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PB, GENMASK(5, 3), 4, 0, BIT(7)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PD, GENMASK(2, 0), 4, 0, BIT(7)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PE, GENMASK(3, 1), 4, 0, BIT(7)),
+	/* SCIF ch3 Bit:4 Value:1 PFC:7 */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P5, GENMASK(2, 0), 4, 1, BIT(7)),
+	/* SCIF ch4 Bit:5 Value:0 PFC:7 */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PK, GENMASK(2, 0), 5, 0, BIT(7)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PA, GENMASK(7, 5), 5, 0, BIT(7)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PB, GENMASK(7, 6), 5, 0, BIT(7)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PC, BIT(0), 5, 0, BIT(7)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PD, GENMASK(5, 3), 5, 0, BIT(7)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PE, GENMASK(6, 4), 5, 0, BIT(7)),
+	/* SCIF ch4 Bit:5 Value:1 PFC:7 */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P5, GENMASK(5, 3), 5, 1, BIT(7)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P6, GENMASK(4, 2), 5, 1, BIT(7)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P7, GENMASK(7, 5), 5, 1, BIT(7)),
+	/* SCIF ch5 Bit:6 Value:0 PFC:7 */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PE, BIT(7), 6, 0, BIT(7)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PF, GENMASK(1, 0), 6, 0, BIT(7)),
+	/* SCIF ch5 Bit:6 Value:1 PFC:7 */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P5, BIT(6), 6, 1, BIT(7)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P6, GENMASK(6, 5) | GENMASK(1, 0), 6, 1, BIT(7)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P7, GENMASK(4, 2) | BIT(0), 6, 1, BIT(7)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P8, GENMASK(2, 0), 6, 1, BIT(7)),
+	/* RSPI ch1 Bit:8 Value:0 PFC:2 */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PH, GENMASK(5, 0), 8, 0, BIT(2)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PD, GENMASK(7, 5), 8, 0, BIT(2)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PE, GENMASK(3, 0), 8, 0, BIT(2)),
+	/* RSPI ch1 Bit:8 Value:1 PFC:2 */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P5, GENMASK(6, 0), 8, 1, BIT(2)),
+	/* RSPI ch2 Bit:9 Value:0 PFC:2 */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PE, GENMASK(7, 4), 9, 0, BIT(2)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PF, GENMASK(2, 0), 9, 0, BIT(2)),
+	/* RSPI ch2 Bit:9 Value:1 PFC:2 */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P6, GENMASK(6, 0), 9, 1, BIT(2)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P7, BIT(7), 9, 1, BIT(2)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P8, GENMASK(5, 0), 9, 1, BIT(2)),
+	/* RSCI ch1 Bit:12 Value:0 PFC:{5,6} shared pins based on RSCI mode */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PG, GENMASK(3, 0), 12, 0, GENMASK(6, 5)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PA, GENMASK(3, 0), 12, 0, GENMASK(6, 5)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PB, GENMASK(7, 6), 12, 0, GENMASK(6, 5)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PC, GENMASK(1, 0), 12, 0, GENMASK(6, 5)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PD, GENMASK(7, 4), 12, 0, GENMASK(6, 5)),
+	/* RSCI ch1 Bit:12 Value:1 PFC:{5,6} shared pins based on RSCI mode */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P5, GENMASK(3, 0), 12, 1, GENMASK(6, 5)),
+	/* RSCI ch2 Bit:13 Value:0 PFC:{5,6} shared pins based on RSCI mode */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PH, GENMASK(3, 0), 13, 0, GENMASK(6, 5)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PK, GENMASK(3, 0), 13, 0, GENMASK(6, 5)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PA, GENMASK(7, 4), 13, 0, GENMASK(6, 5)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PD, GENMASK(3, 0), 13, 0, GENMASK(6, 5)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PE, GENMASK(3, 0), 13, 0, GENMASK(6, 5)),
+	/* RSCI ch2 Bit:13 Value:1 PFC:{5,6} shared pins based on RSCI mode */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P5, GENMASK(6, 4), 13, 1, GENMASK(6, 5)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P6, GENMASK(6, 5) | BIT(0), 13, 1, GENMASK(6, 5)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P7, GENMASK(7, 6) | GENMASK(1, 0), 13, 1, GENMASK(6, 5)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P8, GENMASK(1, 0), 13, 1, GENMASK(6, 5)),
+	/* RSCI ch3 Bit:14 Value:0 PFC:{5,6} shared pins based on RSCI mode */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PE, GENMASK(7, 6), 14, 0, GENMASK(6, 5)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_PF, GENMASK(1, 0), 14, 0, GENMASK(6, 5)),
+	/* RSCI ch3 Bit:14 Value:1 PFC:{5,6} shared pins based on RSCI mode */
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P6, GENMASK(4, 1), 14, 1, GENMASK(6, 5)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P7, GENMASK(5, 2), 14, 1, GENMASK(6, 5)),
+	RZG3L_CLONE_CHANNEL_DATA(RZG3L_P8, GENMASK(5, 2), 14, 1, GENMASK(6, 5)),
+};
+
 static int rzg2l_gpio_get_gpioint(unsigned int virq, struct rzg2l_pinctrl *pctrl)
 {
 	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[virq];
@@ -3222,6 +3377,16 @@ static int rzg2l_pinctrl_probe(struct platform_device *pdev)
 				     "failed to enable GPIO clk\n");
 	}
 
+	if (pctrl->data->clone_channel_data) {
+		struct device_node *np = pctrl->dev->of_node;
+
+		pctrl->syscon = syscon_regmap_lookup_by_phandle_args(np, "renesas,clonech",
+								     1, &pctrl->clone_offset);
+		if (IS_ERR(pctrl->syscon))
+			return dev_err_probe(pctrl->dev, PTR_ERR(pctrl->syscon),
+					     "Failed to parse renesas,clonech\n");
+	}
+
 	raw_spin_lock_init(&pctrl->lock);
 	spin_lock_init(&pctrl->bitmap_lock);
 	mutex_init(&pctrl->mutex);
@@ -3511,6 +3676,14 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
 	if (regs->other_poc)
 		cache->other_poc = readb(pctrl->base + regs->other_poc);
 
+	if (pctrl->syscon) {
+		int ret;
+
+		ret = regmap_read(pctrl->syscon, pctrl->clone_offset, &cache->clone);
+		if (ret)
+			return ret;
+	}
+
 	if (!atomic_read(&pctrl->wakeup_path))
 		clk_disable_unprepare(pctrl->clk);
 	else
@@ -3528,6 +3701,12 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 	unsigned long flags;
 	int ret;
 
+	if (pctrl->syscon) {
+		ret = regmap_write(pctrl->syscon, pctrl->clone_offset, cache->clone);
+		if (ret)
+			return ret;
+	}
+
 	if (!atomic_read(&pctrl->wakeup_path)) {
 		ret = clk_prepare_enable(pctrl->clk);
 		if (ret)
@@ -3742,6 +3921,8 @@ static struct rzg2l_pinctrl_data r9a08g046_data = {
 	.dedicated_pins = rzg3l_dedicated_pins,
 	.n_port_pins = ARRAY_SIZE(r9a08g046_gpio_configs) * RZG2L_PINS_PER_PORT,
 	.n_dedicated_pins = ARRAY_SIZE(rzg3l_dedicated_pins),
+	.clone_channel_data = r9a08g046_clone_channel_data,
+	.n_clone_channel_data = ARRAY_SIZE(r9a08g046_clone_channel_data),
 	.hwcfg = &rzg3l_hwcfg,
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
-- 
2.43.0


