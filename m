Return-Path: <linux-gpio+bounces-16756-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C04BA491A1
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 07:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A063818934EF
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 06:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5C91C4A0A;
	Fri, 28 Feb 2025 06:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="kFYNaSKL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8361C1F05
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 06:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740724837; cv=none; b=K+/Y0QFhzxKAeEzkv8j4JHAUhyRuGtwFF7z1FKRl5halgmgj33FpQOXtNBOot9/rbJQs6KVZgxBCDsPh43Kjb3Pkl/pQHkzr/KKDmst6mJBSOMozcUaRbpgGze26vzIfcp7K0KN76vVMlGAWzu8Fk8xgpFMiU/ojpnzqE0tYoII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740724837; c=relaxed/simple;
	bh=pOGi7jAOx7IIiekjR5wZu0ltlTRIIfvScOqps2gRJ3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YEDyzZOemFe7EbHb7AOtTcdO4sHSJqGohP5MZKfYRtgT0TyAZMt0Epawwy/7v4ADtzQrxqK6q0Q0H0ya8uWb4qW7IVoyagjYFdEHsaeIhGXZvjix6amhemF+iT4IJZony3YXG7WnkJSW0YSUKav/Y7D1HS5fm9QhQD7ycVr0i/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=kFYNaSKL; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1740724834;
 bh=BBIs8NkJoffl42SoJLG5pPaO19rihcoiyN30/+HNeFU=;
 b=kFYNaSKLoFHCyHtIQqEM/a2v2QAveSZNQnExEAnJSG0FjELIhhQa+R5gmQQ6qtRGEREV6ZNvg
 vTHcXLBYNuZecEviKw/Ah5w2dmpIaF1C71ttcsjvkWBZ1aRniTfnikl+4LwuckfrXQIcy1J9O+e
 +YBopu4KeVZvqc+F/0KvckFUIf/Z32yk6yAc4Sha2zZ1ovM5T9j32wOwkZCYdS98iiATUUJhA3B
 tqWtrQRJ9nlSg43pVrfF0OdzHsN6KvWfnhpTLVhx3RRJ5GrqTQrJEPhG/3miOypitkvL1rNSB2O
 JvSK7M/3KtceSdMknBrZ2N1sJF0DL021+8y9HeDsMD5g==
X-Forward-Email-ID: 67c15a5ebcf1d1bd23db0191
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/7] rockchip: Add support for leds and user button on Radxa E20C
Date: Fri, 28 Feb 2025 06:40:06 +0000
Message-ID: <20250228064024.3200000-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Radxa E20C has three gpio leds and one gpio button.

This series adds dt-binding, driver support, DT node in SoC .dtsi and
gpio-keys and gpio-leds nodes in board DT to support the leds and user
button.

This series builds on top of the "rockchip: Add support for maskrom
button on Radxa E20C" series [1].

Board schematics for Radxa E20C can be found at [2].

[1] https://lore.kernel.org/r/20250227184058.2964204-1-jonas@kwiboo.se
[2] https://dl.radxa.com/e/e20c/v1.10/radxa_e20c_v1100_schematic.pdf

Jonas Karlman (6):
  dt-bindings: soc: rockchip: Add RK3528 ioc-grf syscon
  dt-bindings: pinctrl: Add pinctrl support for RK3528
  arm64: dts: rockchip: Add pinctrl and gpio nodes for RK3528
  arm64: dts: rockchip: Add uart0 pinctrl to Radxa E20C
  arm64: dts: rockchip: Add user button to Radxa E20C
  arm64: dts: rockchip: Add gpio-leds node to Radxa E20C

Steven Liu (1):
  pinctrl: rockchip: Add support for RK3528

 .../bindings/pinctrl/rockchip,pinctrl.yaml    |    1 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |    1 +
 .../boot/dts/rockchip/rk3528-pinctrl.dtsi     | 1397 +++++++++++++++++
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   |   68 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      |   82 +
 drivers/pinctrl/pinctrl-rockchip.c            |  160 +-
 drivers/pinctrl/pinctrl-rockchip.h            |    1 +
 7 files changed, 1709 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi

-- 
2.48.1


