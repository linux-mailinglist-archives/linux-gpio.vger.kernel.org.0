Return-Path: <linux-gpio+bounces-14485-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E76A2A00F27
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 21:51:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A51933A477C
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 20:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98761C3BF0;
	Fri,  3 Jan 2025 20:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="N9u4nmbX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E921C173F;
	Fri,  3 Jan 2025 20:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735937385; cv=none; b=Za8JW2Ng3X4n/+8WeX0USEF7CFxxAwoE5DV0RdoK0aReAyYX2tgyNyUXUgzopvgQtGbltXJF5KH494a0Q/187xmEi85DfmfBa2enUYKQabRNEvJ3Ff+mWzBLAyxmHMKd/JkGeyaG1XKG1aqajPbc1S/BJPhGzzHFuj0b3k+Dn8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735937385; c=relaxed/simple;
	bh=p5x8adSqxae4D+ZER/FeQ39Dc11jNJSsQzspvTApoqE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uhi6mw/68pz6rVinGI3ZCFGW/1lgH6+N4Jl4jmeKhWouRWeYG2JqgJ0CDiy+jRMYLI6OUQSqGnAdCCxzlU6qiaH9FwE6b7h8kFVnvQTzkqJlD6Z/Sb0girSOSWc+ryKMNGLT92KVgu6nhLWIWoONgbldRXKOSkpZpZc3RmGDLmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=N9u4nmbX; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=lEMf3CP8j22OLEYK0x3+BkPmy31vySZlkgdmHbiAhtc=;
	b=N9u4nmbX4v2PvzZiNuwjtV4sAy71mMlALBjT6XYkHBpg7HQF0xsdfRnNjZSmG+B9kQ8OCgjaNOCuD76uDReRUT6sRA3W8dmkUmVzt2Fg+r6y58VpEB7HrH7AIpSJ3Vl5QjFgd7XAGmXo0W4v3PZTMFLoXfUDpRmkgIhA0O3pMNo=
Received: from 854af3ed5e24.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Fri, 3 Jan 2025 21:49:16 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 0/4] Add support for NetCube Systems Kumquat
Date: Fri,  3 Jan 2025 20:45:16 +0000
Message-Id: <20250103204523.3779-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds dt-bindings and dts for the NetCube Systems Kumquat board.

Changes in v2:
  Fix the devicetrees according to the "dt-schema" and "make dtbs_check W=1"
  Fix the License of the devicetree as requested
  Create a cover letter for the patch series

Changes in v3:
  Disable rtc inside the SoC again, as the rtc does not work
  Add the gpio-reserved-ranges property to the pinctrl bindings
  Reorder the nodes in the devicetree to match the order of the nodes in the
  sun8i-v3s.dtsi file

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
Lukas Schmid (4):
  dt-bindings: vendor-prefixes: Add NetCube Systems Austria name
  dt-bindings: arm: sunxi: Add NetCube Systems Kumquat board
  dt-bindings: pinctrl: sunxi: Add gpio-reserved-ranges property
  ARM: dts: sunxi: add support for NetCube Systems Kumquat

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/allwinner/Makefile          |   2 +
 .../allwinner/sun8i-v3s-netcube-kumquat.dts   | 290 ++++++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    |   6 +
 6 files changed, 310 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts

-- 
2.47.1



