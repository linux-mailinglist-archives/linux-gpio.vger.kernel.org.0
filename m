Return-Path: <linux-gpio+bounces-11378-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ECB99F899
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 23:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35BD5281A29
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 21:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5170E1FAF1F;
	Tue, 15 Oct 2024 21:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="meJd2q7r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8644E1CBE8A;
	Tue, 15 Oct 2024 21:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729026307; cv=none; b=BbDXxMz2cLduN2z4YJqwHse5cqTEGkgndXChYCochDRl+n/n4MBPlPx9HHbjWXd5deZZapmwqlZqreXLK+VbMHxhzCyJVIcbXBym3VqfkH6Gv1rYDCMQHO7b1Kaa2Lj8EgldAHlg9uqkznrB4TAmI/dUl0phi3b9qrzhTBwqZiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729026307; c=relaxed/simple;
	bh=bddsUPMT8EfofxAtkov5RMslED/8sk7QJjEjhVwY9g0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P7zfn5xLhpcztNmUf7ySs8wIpuRQ3j7Bvs5fUyzPpIGlWF0ttoju+AjvRcmOmSi+Nh4EnfVi4xe0VCtrxt85O9Syrq2eOVWWiJgEafLWca/WhJtMdOuHKXLBNPX4KNFIZiW6Uvp+VVhg8/cxMghVpw2RClvfOvI1hLhf/DLT184=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=meJd2q7r; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSmnq63htz4w5K;
	Tue, 15 Oct 2024 21:05:03 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSmnh08Nbz8sWP;
	Tue, 15 Oct 2024 21:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729026298;
	bh=bddsUPMT8EfofxAtkov5RMslED/8sk7QJjEjhVwY9g0=;
	h=From:To:Cc:Subject:Date:From;
	b=meJd2q7r0+Bv6jFY2P1JS+H4aMSNaTDNParY0Xo8fuvJgsmP4xmSl/GOYotUXiDnw
	 8/ruouuRf8AT7OHiqB1VT6HUDA1rMijb2CkIjtKJdBtiY7Hg6Cite7pMIRM2uR9MA0
	 HNLWYJ2lZAuGpIbURB13t1eJkezbmYC0VR63fnLexqHcIYj4OMW8sY0cPbCdD1BIzR
	 x0c9TEZb0yZVbSB2yEuRcDbk37CV9B6HvfBIUphA7W9iCJWrTvH2Rg49B3koEnBLcU
	 lIXbqrHR549w6jLPXlZbyUbC6HQtCpX+p9diz2AzEkOBIeVkehiG0E2AxxQXppxtbv
	 +0cGccSz9Fv7A==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Add Exynos990 pinctrl and chipid drivers
Date: Tue, 15 Oct 2024 23:04:45 +0200
Message-ID: <20241015210450.964093-1-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series adds support for the drivers for the Exynos 990 SoC. It
consists of the pinctrl driver and the chipid driver. The product ID
of this chip for chipid is 0xe9830000. The pinctrl bank types are the
same as in the Exynos 850 chip.

Changes in v2:
 - Moved bindings from SoC bringup commit
 - Moved device tree changes from SoC bringup commit
 - Ordered pinctrl nodes by unit address in SoC DT
 - Moved the exynos990-wakeup-eint binding to the correct if.
 - Added pinctrl aliases to SoC DT.

Kind regards,
Igor

Igor Belwon (5):
  dt-bindings: pinctrl: samsung: Add exynos990-pinctrl compatible
  dt-bindings: pinctrl: samsung: add exynos990-wakeup-eint compatible
  pinctrl: samsung: Add Exynos 990 SoC pinctrl configuration
  arm64: dts: exynos: Add Exynos 990 pinctrl nodes
  arm64: dts: exynos: Add button support for c1s

 .../samsung,pinctrl-wakeup-interrupt.yaml     |    1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml     |    1 +
 arch/arm64/boot/dts/exynos/exynos990-c1s.dts  |   49 +
 .../boot/dts/exynos/exynos990-pinctrl.dtsi    | 2195 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos990.dtsi     |   57 +
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  140 ++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |    1 +
 8 files changed, 2446 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-pinctrl.dtsi

-- 
2.45.2


