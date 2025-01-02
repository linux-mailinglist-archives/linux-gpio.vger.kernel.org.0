Return-Path: <linux-gpio+bounces-14425-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB8C9FFE45
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 19:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 637D61883954
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 18:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3CD1B4F0D;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I+5A8Ctr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C75D1B412F;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842742; cv=none; b=dOdFD9Y31v0FhAfZ+WyraE8+pObLEqct/yzRwIJhimSDhr0yGVYZ/GEZQVrr+wlLIYzbPMpLAL4k0yHFQqAcherobrKzcoEez1zak6Qo5ye77wnLjI6rnPCORKtZcGKfe1WAnikUKkHuOFxP25rwRywpLVkqeXiMwrHx9EtTZPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842742; c=relaxed/simple;
	bh=2srrLyTRgX4m7OtpfeP/Huz2CwE+YlrW2T3rwErpCgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hVAbudHRKSA8yzYRjVNJbCr4Y7otoYlGgs2NNAt/bip9U3nsmmKXZufWqf1hCOEYqvk392AivIdF8Jbuyb1VZRMGk+FMEDLEdHaZeSoqymeS3KdsePh6cb/Csyy6ozApNjsnLrGLjXK02In5sa32keqOTAsyAZ9LfVXcfWMVnNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I+5A8Ctr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF02DC4CEEA;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=2srrLyTRgX4m7OtpfeP/Huz2CwE+YlrW2T3rwErpCgc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I+5A8CtrF27j5RARWMbgi2VYd1BTVqmE5vvAJcdIugqpkKpd37tyYui7KvQUybgMe
	 0g2fvsB5LduhL9VwYfUmWIr21hkn5YHu0MHbYJTR7c+stApTVuWDk9J1uqRKs0S75h
	 aTZLxx5W9NNJnNWRBu7YB15oW8bGvnN+mJ+Pm9GyaqZmCUveBTkwHjbr9CUUsKCU6U
	 nt2m9hapAmARyrq7Vn8AXhePe/fxl2uWLmvZ544p4gcw74G4sxSVbnUO7VTl82IVGM
	 MdMpQYGZ+97dpahwpV4yx38PYXiBYMN7aF61LIFzMr+0bsBoegCl+MGDrfaqqPdMeH
	 LukduV139/I+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6216E7718B;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:47 +0100
Subject: [PATCH 06/19] powerpc: dts: mpc8315e: Add missing #cells
 properties to SPI bus
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-6-86f78ba2a7af@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=702;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=NGog7jJ8LoqfdQSewm8qpRr6JKendRjgTEchw06j2Sw=;
 b=VOECrtBjonUvDKztCwI/1P6FQh2InQlLhaxoEBEYIKZcGT00WtzybtKWtCEnhdX7KgjqGFrAP
 JbaC+XNS25pC+3bOX5AhFZt5TTtAa07uaLS/EQIa010kRMx7bqkY4vo
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

These properties are required by the spi-controller binding.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/mpc8315e.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/boot/dts/mpc8315e.dtsi b/arch/powerpc/boot/dts/mpc8315e.dtsi
index 7e61a78850433fa43795a2a5fb06ce6a148bb11d..f9d1b48b08799822d33f5e7606030019a19b4743 100644
--- a/arch/powerpc/boot/dts/mpc8315e.dtsi
+++ b/arch/powerpc/boot/dts/mpc8315e.dtsi
@@ -88,6 +88,8 @@ spi: spi@7000 {
 			interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			mode = "cpu";
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 		};
 

-- 
2.45.2



