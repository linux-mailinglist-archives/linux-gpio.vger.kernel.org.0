Return-Path: <linux-gpio+bounces-5996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8016B8B8BD8
	for <lists+linux-gpio@lfdr.de>; Wed,  1 May 2024 16:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FCB61F223F4
	for <lists+linux-gpio@lfdr.de>; Wed,  1 May 2024 14:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F73512F383;
	Wed,  1 May 2024 14:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEGApENE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE99A12E1D5;
	Wed,  1 May 2024 14:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714573589; cv=none; b=k7VnVEPZl3E/U+ou97pYR48Ev5c6Q/ePShP+BCNiUNYSUHA2vl/Q05RFmCurRAl50GkHEiPoUCJNOlhtorMomfNOPkFF+Ex9MvUrvdAKFqCJtXrZhpTS+hQ/vd29V+5TXTBwS0RpvLgm7OH3S+AELMbMRapN7aPwtIadMERADnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714573589; c=relaxed/simple;
	bh=gvjcuw/DNw3vvMUAeKkw8TDIEbg1vf9BJ6FzQ8Vh0bg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NUozUC979MdN+3sUTxreiFXqTTrDxrb38lEPXGcXiIxrdXeVfWFxzCt2nAtOmtGT7BfmbP7+wmXkQQG2Ybgp5Nf91Bv9FdEujUPIVvRo7GjSio8/NB0ZsCn7f1RAWuYHBNJldzYtlB/7a7DIdf5Fl6zSIFMYpDtPlBytTtIBdik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEGApENE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5BF9C072AA;
	Wed,  1 May 2024 14:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714573588;
	bh=gvjcuw/DNw3vvMUAeKkw8TDIEbg1vf9BJ6FzQ8Vh0bg=;
	h=From:To:Cc:Subject:Date:From;
	b=GEGApENEN48MwbICDHhHvgqTEZTBOF/ujvWWeRXa4b2Fww4CW2kbHg9q2/fom2lnl
	 dJ/9Peu44EhWyEABpUHR0PCVeRrVrI1HpPTmSs96Aj3EjGODFg5RFII0OlzUWuFxdO
	 RBUaSpuFxNF7bQvUy8GUJKZV7DP30eznSzRYklJ2hmdlNFr+RWXwaa8UtLQNffo8aE
	 slXZ0kd0PQAj65pB2JgisJz1ART6cVGFuJOWTaMhnsU6vAc3KYeVG2hbOAP+UG8Dgf
	 Go9Y2hbB/uajp7MGSclfxiD/fqgNtBMi2MdrA8cnpNiM8aHFrGyLdJv/NE07TeiUIv
	 r0OU51IVe1gsw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	nbd@nbd.name,
	john@phrozen.org,
	devicetree@vger.kernel.org,
	dd@embedd.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	upstream@airoha.com,
	lorenzo.bianconi83@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH] arm64: dts: airoha: en7581: Add gpio controller nodes
Date: Wed,  1 May 2024 16:25:54 +0200
Message-ID: <2d27e1ad360dec2c3d78d9800bc93ecb6f9b50c5.1714573214.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the Airoha EN7581 gpio nodes in Airoha EN7581 dtsi

Tested-by: Rajeev Kumar <Rajeev.Kumar@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
This patch is based on the following pending patch:
https://patchwork.kernel.org/project/spi-devel-general/patch/189790802f3ba1a80c4ab5e064b2425e5a360098.1714571980.git.lorenzo@kernel.org/
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 98c2a86086e1..5d0d76cecfe0 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -178,5 +178,25 @@ spi_nand: nand@0 {
 				spi-rx-bus-width = <2>;
 			};
 		};
+
+		gpio0: gpio@1fbf0200 {
+			compatible = "airoha,en7523-gpio";
+			reg = <0 0x1fbf0204 0 0x4>,
+			      <0 0x1fbf0200 0 0x4>,
+			      <0 0x1fbf0220 0 0x4>,
+			      <0 0x1fbf0214 0 0x4>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		gpio1: gpio@1fbf0270 {
+			compatible = "airoha,en7523-gpio";
+			reg = <0 0x1fbf0270 0 0x4>,
+			      <0 0x1fbf0260 0 0x4>,
+			      <0 0x1fbf0264 0 0x4>,
+			      <0 0x1fbf0278 0 0x4>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
 	};
 };
-- 
2.44.0


