Return-Path: <linux-gpio+bounces-23188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56872B02BB2
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jul 2025 17:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B44C23AC771
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jul 2025 15:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F37287247;
	Sat, 12 Jul 2025 15:25:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5097A17548;
	Sat, 12 Jul 2025 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752333945; cv=none; b=C9wx9IPUu6CsLQZtzpqVj9UL9/OhwBeKKonyzg0V9cY9/pv61Z+GOqgz84FXZkN/AppiJ/IdjbSvNochwDFA+R2JdXCXpvdS7MqC8J/smsGoqTQBcFPaeXsZGD4+Ge0ImTyXFT15h1eNbv2p+EDphyxqaohOx56RQ2a2/Kl1Jq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752333945; c=relaxed/simple;
	bh=dVCJf2k1OWqbqdPrRoNsq+l8ijSLfkITsUaUape0i5k=;
	h=From:To:Cc:Date:Message-Id:Subject; b=Hj57pnU8cBvFQ13SQXVvI0rp1TXJAWdZAIbD34zTrkvwENCBGxxrk3DaVpYmzPPRuz5J2TIdNVUokmDwlmJ61iXoumA6mfEpYwVcY0V1fUVRS4QBFgkuCn/zPnhcbBmhGYml99hAWdoOBe92r4K2OGvT4gKzN8T0D2wvt6axc5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d467a1d9e4so365605085a.0;
        Sat, 12 Jul 2025 08:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752333942; x=1752938742;
        h=subject:message-id:date:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+N5KD6QaMsdoeJ3b0BLrO/WgyuCz2gEah52R6qWS/Q=;
        b=pU8bZD/Cc2sb6V9DLQ6+dU37W3fAdmEmFVkHov5gWau07tyFStn1RBhNSGN8rdFL8g
         ibN7EhRnzhHM032fX8YLBhyexOxp2Q/biXMp4+E7u9VK7tvufTQE+ko1VmlP5ALg1r0S
         COKKSqQ3V7FK6qDHx79PPB8CfL0ZxCf/aLNiBlNDDdl8kgKo1scv+IuCYv+EVvCE7mSd
         HcyYFIacRWKom35cFisPQX+CGrI9glAAzQIP+zrM6z5wq6VKGuoI2nozHEmXRUA2kR3z
         4XNfQjp0E87HjmSp62QqYFIB6yNtyEwpXfUPsaT2Nr8goUn7vZU09cM+tdEmilK6JK3e
         MC5A==
X-Forwarded-Encrypted: i=1; AJvYcCUemL0TPdMY/epzh2+bYO46tKM4peL1D1bdXOzM3FycMEsFk8wemkt1o9FsDV0Ni6sgAUoMyeeezNKj@vger.kernel.org, AJvYcCXSYm3oO+sZSzZOTZ/ulALh+BKU9jJNQsu3VC7oNh4+zpuONYm9jEgTgGzao0LyuDAGFj0lF1hyqJSx2MlI@vger.kernel.org
X-Gm-Message-State: AOJu0YyWdihw0l9RvSIbd99jIofVcqviI6gLkxnvQU/fp2z6yYTqpLgR
	6Ld1ofl+sS/k1vV4y+jDgQqNZASsRBs5oAqJ8nZyRmVY9ocETaItbpjqyIbxdNy7
X-Gm-Gg: ASbGncvLiX78uvAUzOQtlcKuwQv+Ae2oElsIJtuNF77OYI/eUXAorxtumsF3Ma7Bbja
	vdsREQbI7IfBZJnI15f1hnmo1YJ1NYVBnjdUBnQD8Zl4XOavpzuKkf0bqf2UFw5+fkBvocQiNqm
	HanDmoDC95Q/juem6rvtz2qKdQwo5Vgkn6LZBpjGQAwYapE9xOFueAroptRslREXBlcsMA0jgVs
	1eOOPB6/QvFnwLyoOFJeNECrcXLp3aZiVim8AMO2vzmqUDkCxcdbLxBFgLwfwX9HhUiOhh7dOCQ
	KN7QEFJ7g9tJFB6C3DryyIIXZfwgXePp8uY7WIlzvDxhKXs9O9RjkdNobvcSTYP3jAAq3a2FrDy
	KbcJDOMEz24yqtjw7uYnmEcpQCvmFs+7hRjAvSahggt6Uo4TSkkHQXNbg
X-Google-Smtp-Source: AGHT+IHdE5MYH3wYQll8797nHXVKbS8a1g4vZDFCSVd85ewT/EWohjE4SOpqHO46LVPiylee35kfjA==
X-Received: by 2002:a05:620a:ac14:b0:7e0:136f:db91 with SMTP id af79cd13be357-7e0136fdfccmr622808485a.19.1752333941843;
        Sat, 12 Jul 2025 08:25:41 -0700 (PDT)
Received: from Bjoern-Magnuss-MacBook-Pro.local ([167.99.4.198])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc000d6esm328240685a.27.2025.07.12.08.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 08:25:41 -0700 (PDT)
From: Magnus Damm <damm@opensource.se>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <damm@opensource.se>,geert+renesas@glider.be,linux-gpio@vger.kernel.org,linus.walleij@linaro.org,linux-kernel@vger.kernel.org,wsa+renesas@sang-engineering.com
Date: Sat, 12 Jul 2025 17:25:38 +0200
Message-Id: <175233393885.19419.10468322450742766513.sendpatchset@Bjoern-Magnuss-MacBook-Pro.local>
Subject: [PATCH] pinctrl: renesas: rza1: Check pin state before configuring
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Add code to the RZ/A1 pinctrl driver to check the state of the pin before
writing any registers. As it is without this patch, resetting the pin state
for every pin regardless of preious state might negatively be affecting
certain shared pins like for instance address and data bus pins.

Signed-off-by: Magnus Damm <damm@opensource.se>
---

  This makes the following patch work with Linux:
  [PATCH] Update r7s72100 Genmai DTS to include NOR Flash pinctrl

  In U-Boot the above DTS change works without any changes most likely
  because the external SDRAM is not in use and on-chip RAM is used instead.

  For the Linux case the SDRAM has been setup and reconfiguring shared
  pins will mess with the memory bus pins and cause the system to lock up.

  Did I get the MUX_FLAGS_SWIO_INPUT | MUX_FLAGS_SWIO_OUTPUT handling right?

  After enabling DEBUG and checking the "Genmai DTS NOR Flash pinctrl" patch
  above it becomes obvious that most pins are skipped however the following
  pins still seem to get configured:
  
   pinctrl-rza1 fcfe3000.pinctrl: Configuring pinmux port pin 8 8
   pinctrl-rza1 fcfe3000.pinctrl: Configuring pinmux port pin 8 9
   pinctrl-rza1 fcfe3000.pinctrl: Configuring pinmux port pin 8 10
   pinctrl-rza1 fcfe3000.pinctrl: Configuring pinmux port pin 8 11
   pinctrl-rza1 fcfe3000.pinctrl: Configuring pinmux port pin 8 12
   pinctrl-rza1 fcfe3000.pinctrl: Configuring pinmux port pin 7 8
   pinctrl-rza1 fcfe3000.pinctrl: Configuring pinmux port pin 7 0

 That translates to A16, A17, A18, A19, A20, RD and CS0.
 The CFI detection is still working on both CS0 and CS1 NOR flash banks.

 drivers/pinctrl/renesas/pinctrl-rza1.c |   83 ++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

--- 0001/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ work/drivers/pinctrl/renesas/pinctrl-rza1.c	2025-07-12 23:51:15.000275500 +0900
@@ -663,6 +663,75 @@ static inline int rza1_pin_get(struct rz
 }
 
 /**
+ * rza1_pin_mux_needs_update() - check pin multiplexing on a single pin
+ *
+ * @rza1_pctl: RZ/A1 pin controller device
+ * @mux_conf: pin multiplexing descriptor
+ */
+static int rza1_pin_mux_needs_update(struct rza1_pinctrl *rza1_pctl,
+				     struct rza1_mux_conf *mux_conf)
+{
+	struct rza1_port *port = &rza1_pctl->ports[mux_conf->port];
+	unsigned int pin = mux_conf->pin;
+	u8 mux_func = mux_conf->mux_func;
+	u8 mux_flags = mux_conf->mux_flags;
+	u8 mux_flags_from_table;
+
+	/* follow register write logic from rza1_pin_mux_single()
+	 * but instead of programming the hardware check if the
+	 * pin actually needs to be configured or not
+	 *
+	 * we read the register settings and in case it does not
+	 * match the expected value we return 1 right away
+	 *
+	 * return value 0 means all registers are matching
+	 * and no need to perform any register update
+	 */
+
+	/* SWIO pinmux flags coming from DT are high precedence */
+	mux_flags_from_table = rza1_pinmux_get_flags(port->id, pin, mux_func,
+						     rza1_pctl);
+	if (mux_flags)
+		mux_flags |= (mux_flags_from_table & MUX_FLAGS_BIDIR);
+	else
+		mux_flags = mux_flags_from_table;
+
+	mux_func -= 1;
+
+	/* return 1 in case register bit does not match MUX_FLAGS/FUNC */
+
+	if (!!(mux_flags & MUX_FLAGS_BIDIR) !=
+	  !!rza1_get_bit(port, RZA1_PBDC_REG, pin))
+		return 1;
+
+	if (!!(mux_func & MUX_FUNC_PFC_MASK) !=
+	    !!rza1_get_bit(port, RZA1_PFC_REG, pin))
+		return 1;
+
+	if (!!(mux_func & MUX_FUNC_PFCE_MASK) !=
+	    !!rza1_get_bit(port, RZA1_PFCE_REG, pin))
+		return 1;
+
+	if (!!(mux_func & MUX_FUNC_PFCEA_MASK) !=
+	    !!rza1_get_bit(port, RZA1_PFCEA_REG, pin))
+		return 1;
+
+	if (mux_flags & (MUX_FLAGS_SWIO_INPUT | MUX_FLAGS_SWIO_OUTPUT)) {
+		if (!!(mux_func & MUX_FLAGS_SWIO_INPUT) !=
+		    !!rza1_get_bit(port, RZA1_PM_REG, pin))
+			return 1;
+	} else {
+		if (!rza1_get_bit(port, RZA1_PIPC_REG, pin))
+			return 1;
+	}
+
+	if (!rza1_get_bit(port, RZA1_PMC_REG, pin))
+		return 1;
+
+	return 0;
+}
+
+/**
  * rza1_pin_mux_single() - configure pin multiplexing on a single pin
  *
  * @rza1_pctl: RZ/A1 pin controller device
@@ -677,6 +746,20 @@ static int rza1_pin_mux_single(struct rz
 	u8 mux_flags = mux_conf->mux_flags;
 	u8 mux_flags_from_table;
 
+	/* Before touching the hardware check if it is actually needed.
+	 * The reason for doing this is that some pins may be used
+	 * already while the driver operates, for instance address bus
+	 * for a NOR flash might be shared with SDRAM or similar.
+	 * Reconfiguring such a pin might cause the system to lock up.
+	 */
+	if (!rza1_pin_mux_needs_update(rza1_pctl, mux_conf)) {
+		dev_dbg(rza1_pctl->dev, "Skipping pinmux port pin %d %d\n",
+			mux_conf->port, pin);
+		return 0;
+	}
+	dev_dbg(rza1_pctl->dev, "Configuring pinmux port pin %d %d\n",
+		mux_conf->port, pin);
+
 	rza1_pin_reset(port, pin);
 
 	/* SWIO pinmux flags coming from DT are high precedence */

