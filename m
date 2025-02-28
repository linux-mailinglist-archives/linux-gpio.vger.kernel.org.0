Return-Path: <linux-gpio+bounces-16845-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BB0A4A2AD
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 20:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5EC83B2E35
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 19:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F971F874A;
	Fri, 28 Feb 2025 19:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="BKWef5Rc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDB11C3BE6;
	Fri, 28 Feb 2025 19:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740771353; cv=none; b=DWrKRBmjQHhM4Fh5CdNpPpNmcCQV0UOUa64f73bLUB2z1lMuS8efJYa+hdmgGHpw4cb+fY7JpP7AmYaZUH7PtjkK/Gw78MNKkjVj288JD2dBd7qtNkhi/ttE694QppPyyBfSUyAA4SxV74s4bIcrS29+94suRYPnl9tCI7ymV7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740771353; c=relaxed/simple;
	bh=BeszhtQQ7PFRGkbfedM7GhE2NFsytj/yeq40sd83H64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q4yiiAccuhJZotWfgk8VPTobQZrzSQbmo59/vRapEGw9ofW2PcUQE+A6rZ0o8NbjznRtwAiZXXC14/wM4NEz/HVx9mL1EadMTthz0i14+9YK1rPLUEx5/v3UvisI++BmgLTwhO0TSFSS/qN18AkfURZX/FcyW/RlWvvoFlkalfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=BKWef5Rc; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D248325E67;
	Fri, 28 Feb 2025 20:35:43 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Th-yGmHraEZK; Fri, 28 Feb 2025 20:35:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740771343; bh=BeszhtQQ7PFRGkbfedM7GhE2NFsytj/yeq40sd83H64=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BKWef5RcSg+e8EYHkT8o6EWqs/WurAw3cKOuilf9oleGaygFR+5f2PGste1YyJDpg
	 yZKx4ZuXBtisqKbYaw7PgpzkuHoMTFSnmoC2k4Dz0XemVrkYkhXBQW/N2YzZ1TkOFZ
	 4/aU9aVxd7lIuPFzt2hZKvgynthSw6vTS2TDt91F86uJPPt/t2sQ1BmNHrhAunErSE
	 4z86rM/Dcx9BYTwPMioOOj9TcFoLBiKOMJb0WnAmyccXRWNJmCWxk/Y6QW9I5tNC2H
	 BfM6buSHZVDbbwpFvV+Q/LX7vGXcBAqSs1bjIGYB5lkRWvU6sZLOdr7Nd3ZYHVjxUL
	 k2souvkSe769w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 01 Mar 2025 01:05:17 +0530
Subject: [PATCH v3 1/3] dt-bindings: pinctrl: samsung: add
 exynos7870-pinctrl compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-exynos7870-pinctrl-v3-1-ba1da9d3cd2f@disroot.org>
References: <20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org>
In-Reply-To: <20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740771331; l=955;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=BeszhtQQ7PFRGkbfedM7GhE2NFsytj/yeq40sd83H64=;
 b=p3GEkUgn6LemQaHjNvwSFfcwE3hUGBBcxEiADrw1aIsCJw1HlJbbnUCEFsNOmzXMozlYL2t1T
 Op3GqwKHoWRAVpCTK9yeigYmwW74gdQtqaPmWvaNlp//WA3v+VWgL66
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Document a dedicated compatible string for Exynos7870's pin controllers,
having 8 GPIO pin banks.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index c3b82da0c4671aaa411540b13d861f4c4a9b81bc..de846085614166087ef9046cf5d154fb9dad8309 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -52,6 +52,7 @@ properties:
       - samsung,exynos5420-pinctrl
       - samsung,exynos5433-pinctrl
       - samsung,exynos7-pinctrl
+      - samsung,exynos7870-pinctrl
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
       - samsung,exynos8895-pinctrl

-- 
2.48.1


