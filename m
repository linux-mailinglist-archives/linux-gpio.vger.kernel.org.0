Return-Path: <linux-gpio+bounces-11330-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F079399DE85
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4146628440B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 06:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217A918B47B;
	Tue, 15 Oct 2024 06:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="cklBz734"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C35189F32;
	Tue, 15 Oct 2024 06:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728974102; cv=none; b=HhHAyraCtJOFSKsyNtsBMjtmFL0YAqLUBYIF9V8C0OqujqE98krscBBVvOykaJ+/8O95fdzuk0IB5rRDzmWUOEPoFeGLfyyiR5NTQnSBeZvvMmOqsWbXSzxsnp7s2ykF/B7bBHAg/HurxxsQFBkzGxdtaC2w5PNZTpNME4g2Hc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728974102; c=relaxed/simple;
	bh=8RyzPsxrc81SaaR22TiyjUyYAHHalzKa1iaFskZgqSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XuAyE/JK4W7yikotcm23EoW40jTIFxnxSwVxaMAaWg1kMf6YnpruGMfj3C0TFH5AVs4lD1sCccDHZOKuLjwZSRu1MqUz36AcxV0hor0o4syrreomzBBrsm1xBWddkgQASsU0Cwt4Rnc8tQHP61Bh/dV02uO7dyAdE2dW9guBYAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=cklBz734; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSPLM0Xkdz4wYc;
	Tue, 15 Oct 2024 06:28:27 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSPLC0vsmz2x9B;
	Tue, 15 Oct 2024 06:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1728973701;
	bh=8RyzPsxrc81SaaR22TiyjUyYAHHalzKa1iaFskZgqSM=;
	h=From:To:Cc:Subject:Date:From;
	b=cklBz734sU+ThjU67y0GY0hZh9vTfz5RC0YCSDygMARoR/feJqcgXSPDGB5AoBA5h
	 brY3vcszXWPPn7OSPZ4R7o+bXqa/0D4j8zmAfQxkMWvlciUQnxCaUalF3iVMw1lTFj
	 w+silLtSbfh21KiUgY+9p2JL1KD8yLG3wPNzV2A7QQNCC+leypOrmm8wbni4nfvMQI
	 +fE659Bu/jgq8MvDFTgMr/SJrrhf+6LHOGOF4gwVi/j08Z6jACJ58r3Vmq/WZdTtBH
	 YnY/7DMPj3f8Ex/nlM04FSVGvmtBMm/nOneMM914hsnivzbtgQRchd/f1lsxIuKcV7
	 Jqn3qhRIawGrw==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	david@mainlining.org
Subject: [PATCH v1 0/7] Add minimal Exynos990 SoC and SM-N981B support
Date: Tue, 15 Oct 2024 08:27:39 +0200
Message-ID: <20241015062746.713245-1-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series adds initial support for the Exynos 990 SoC and also
initial board support for the Samsung Galaxy Note20 5G (SM-N981B)
codenamed c1s.

The Exynos 990 SoC is also used in the S20 series, as well as in the
Note 20 Ultra phones. Currently the device trees added are for the
Exynos 990 SoC and c1s. The device tree has been tested with 
dtbs_check W=1 and results in no warnings.

This initial bringup consists of:
 * cpus
 * pinctrl
 * gpio-keys
 * simple-framebuffer
 
This is enough to reach a shell in an initramfs. More platform support
will be added in the future.

The preferred way to boot the upstream kernel is by using a shim
bootloader, called uniLoader [1], which works around some issues with
the stock, non-replacable Samsung S-LK bootloader. For example, the
stock bootloader leaves the decon trigger control unset, which causes
the framebuffer not to refresh.

Device functionality depends on the 2nd patch series:
"Add Exynos990 pinctrl and chipid drivers"

Kind regards,
Igor

[1] https://github.com/ivoszbg/uniLoader

Igor Belwon (7):
  dt-bindings: arm: cpus: Add Samsung Mongoose M5
  dt-bindings: hwinfo: exynos-chipid: Add compatible for Exynos 990
    chipid
  dt-bindings: arm: samsung: samsung-boards: Add bindings for Exynos 990
    boards.
  dt-bindings: pinctrl: samsung: Add exynos990-pinctrl compatible
  dt-bindings: pinctrl: samsung: add exynos990-wakeup-eint compatible
  arm64: dts: exynos: Add initial support for the Exynos 990 SoC
  arm64: boot: dts: Add initial support for Samsung Galaxy Note20 5G
    (c1s)

 .../devicetree/bindings/arm/cpus.yaml         |    1 +
 .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
 .../hwinfo/samsung,exynos-chipid.yaml         |    1 +
 .../samsung,pinctrl-wakeup-interrupt.yaml     |    1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml     |    1 +
 arch/arm64/boot/dts/exynos/Makefile           |    1 +
 arch/arm64/boot/dts/exynos/exynos990-c1s.dts  |  111 +
 .../boot/dts/exynos/exynos990-pinctrl.dtsi    | 2195 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos990.dtsi     |  241 ++
 9 files changed, 2558 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-c1s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990.dtsi

-- 
2.45.2


