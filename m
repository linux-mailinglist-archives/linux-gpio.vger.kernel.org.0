Return-Path: <linux-gpio+bounces-29886-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E53CDDADF
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 11:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 672893001C0F
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 10:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A604031AF15;
	Thu, 25 Dec 2025 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kq1QTjvk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41233126A9;
	Thu, 25 Dec 2025 10:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766658987; cv=none; b=CuhJwt72VfyUjHYPD+rpvoPFI65WhjS9Xeok10B+yNAGMvTyq2carsi4m/zHWZ7DNZsLX8amX2R07jUGuAqghgkYTxuP6RFxncnehwUxOoD8GG/RDYrbEGYJ0lmhWatjDBnlACzbEXhmwzgA3FV7CX8KpV1QBog/8wkkc1Gtutk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766658987; c=relaxed/simple;
	bh=ubywY0Cd6f05tTAqgCRIM7FpmCrB3B8Rsio5nl4gyuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lnFwJFFdtFediGnFDNlntb3T9z28B/5XxUOIiCUEIPJknQvORLDpAXKcAoBHIH7oHKDoclRlFNacGQxXi4+rbeaTNPXs+3RWUXmuh9Pu00/Ag4IsqodjHt/lHbiTGPE+D1Q4tOWg7sszYp7gHSg2tzQqFRc+ZdGcZaAJwn0azHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kq1QTjvk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F97C4AF0C;
	Thu, 25 Dec 2025 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766658985;
	bh=ubywY0Cd6f05tTAqgCRIM7FpmCrB3B8Rsio5nl4gyuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kq1QTjvkZYgk/ImDvp5YiKcucNu6g05gsVwqUC3LdnhLrxiI/nfUgzKIvI/TRpPeT
	 6mqyUz5cOSTiwA1YuuRfJKkKbX8pz0x0oWhurq2FCb/4Yg9G787cjDvd8WeKTN1kJ5
	 nfCOQWshjvudaVTwpIKPqvXqd3bA5rlsNhSi2d4LAc/Jdj6Kp3S1PBJ987vZcqeEPG
	 h2/QFpGg7rS+krL/gjDEICEYhShK11jMLxe5rjpzV+8gA6zNbb9zrCS8PspIB2TmLl
	 xCaxf/A8OSme7k8wYxZftpap2foRuxo+/2TgFAjrHrIk5bbfrVb63PCNVuPFj4BG/T
	 cY4m6p3JJQ+3A==
Received: by wens.tw (Postfix, from userid 1000)
	id 661295FEC0; Thu, 25 Dec 2025 18:36:22 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 3/4] ARM: dts: allwinner: sun5i-a13-utoo-p66: delete "power-gpios" property
Date: Thu, 25 Dec 2025 18:36:14 +0800
Message-ID: <20251225103616.3203473-4-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251225103616.3203473-1-wens@kernel.org>
References: <20251225103616.3203473-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The P66's device tree includes the reference design dtsi files, which
defines a node and properties for the touchpanel in the common design.
The P66 dts file then overrides all the properties to match its own
design, but as the touchpanel model is different, a different schema
is matched. This other schema uses a different name for the GPIO.

The original submission added the correct GPIO property, but did not
delete the one inherited from the reference design, causing validation
errors.

Explicitly delete the incorrect GPIO property.

Fixes: 2a53aff27236 ("ARM: dts: sun5i: Enable touchscreen on Utoo P66")
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

---
Cc: Hans de Goede <hdegoede@redhat.com>
---
 arch/arm/boot/dts/allwinner/sun5i-a13-utoo-p66.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/allwinner/sun5i-a13-utoo-p66.dts b/arch/arm/boot/dts/allwinner/sun5i-a13-utoo-p66.dts
index be486d28d04f..428cab5a0e90 100644
--- a/arch/arm/boot/dts/allwinner/sun5i-a13-utoo-p66.dts
+++ b/arch/arm/boot/dts/allwinner/sun5i-a13-utoo-p66.dts
@@ -102,6 +102,7 @@ &touchscreen {
 	/* The P66 uses a different EINT then the reference design */
 	interrupts = <6 9 IRQ_TYPE_EDGE_FALLING>; /* EINT9 (PG9) */
 	/* The icn8318 binding expects wake-gpios instead of power-gpios */
+	/delete-property/ power-gpios;
 	wake-gpios = <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */
 	touchscreen-size-x = <800>;
 	touchscreen-size-y = <480>;
-- 
2.47.3


