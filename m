Return-Path: <linux-gpio+bounces-14428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B57619FFE4F
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 19:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7CD43A1FDA
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 18:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85231B6525;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qhpM50aC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902371B415A;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842742; cv=none; b=WAGfdxsd2wKnj6ByToEoGH3Sb5MMXGUX7N520ScJR7sofSp3aR8f2BEjMOhctRlnVgppEEnuIfDPBeJNdq0lp98NVSqw1oZZMd1BhvWZ7S7ZJcJQwyTaEMBvozhF1URPGH3OjtGz/ClF2D/YekQJyj3HWctEicoFX//NwUGlLBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842742; c=relaxed/simple;
	bh=N9t8aAgpI8PU3Jfgn2dC8EX23k9PWRvKXnQA/lsH/3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rcGnvd7GXkurid2gM45lgb6oK9yi/7TC8Rg5IqEZhE0XHo0Oh/k8anLtQu72KN0CH6rSt+oi2FwjIGijmD92tWiXp5bPXYnAqGWN59MkbJHscDd2bP3Eo6FuVSNIqMGS9ucGAjp6+fwqlWiFzXJcTIGYcyNWQqJoEFj85a+Lhqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qhpM50aC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61F68C4CEDD;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=N9t8aAgpI8PU3Jfgn2dC8EX23k9PWRvKXnQA/lsH/3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qhpM50aCPBwNI13gJd+k7lW7C9YqwsPrTPnx/zCNeDIwsiBh09I6zrtgfRjj5gmoL
	 xjW96fGK/Ex8zfYiN/sytPOaRsxslSC1mRWPGEEWlEfdP7sY1ElVI9HyAw3xLF3cWu
	 ddzSuc9mm22QvnfI03E0silU/BiHB2yhYEghWOyOhTOu6vux5r2k9ZUkMT9awQp3MU
	 UprO7T9Av2QsxT97QLl67XnoTm/5Eq2mC61Jlu4EU+nYt7kjNWu2kvbK/97CajZl1P
	 lK1RRhduXpycsMCDeqf1G9Jmincqt6ekj6DmNINNrJZtkBc5xeIuIB4Oi0yRdceRyY
	 nk+FMbJxC+Pkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D94E77197;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:53 +0100
Subject: [PATCH 12/19] powerpc: dts: mpc8315e: Add GPIO controller node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-12-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=867;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=53IPkv/+qKgm0/DViEM4D8nVx9tPgdRG/PC4lnN6+fc=;
 b=grga97ENyMGY97nIZwfxEfbacZt96cEOsFzwdrvwrUslDs8ieVW4MRzpzYExkcZ8F3W/eVin6
 JigBllwbn/YDXqHVrrZjnesI72P8Hf5rc+QgiKZ0KM9ibGG5RuJEr76
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

This node das previously missing from the device tree.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/mpc8315e.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/boot/dts/mpc8315e.dtsi b/arch/powerpc/boot/dts/mpc8315e.dtsi
index f9d1b48b08799822d33f5e7606030019a19b4743..ad6131d913fd45ec5b693d85e031ec520fb28b2f 100644
--- a/arch/powerpc/boot/dts/mpc8315e.dtsi
+++ b/arch/powerpc/boot/dts/mpc8315e.dtsi
@@ -302,6 +302,15 @@ pmc: power@b00 {
 			interrupt-parent = <&ipic>;
 			fsl,mpc8313-wakeup-timer = <&gtm1>;
 		};
+
+		gpio: gpio-controller@c00 {
+			compatible = "fsl,mpc8314-gpio";
+			reg = <0xc00 0x100>;
+			interrupts = <74 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-parent = <&ipic>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
 	};
 
 	pci0: pci@e0008500 {

-- 
2.45.2



