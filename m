Return-Path: <linux-gpio+bounces-16757-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3875EA491A4
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 07:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9415F16F7A0
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 06:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56441C5D48;
	Fri, 28 Feb 2025 06:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Wy1kafNt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD54B1C4A13
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 06:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740724840; cv=none; b=VLcoEtSxtFX7Vc7d3KUujXbUthiJLwg07Nq4VcxcqIH+ztxjwp5svZ/PUXk4xZUkzyb0FqCoqYK8XQubko2qsQdPL3Dmh1yeFRN4CWd2tfiOX0+RxxjWLPSEqazeS0VT8/xyLJqmR5vqi851VC7RSM+ItU4ekGLGhHNwcUvFDuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740724840; c=relaxed/simple;
	bh=94pjZyH56eBnSFGYvvAmA5PRgRUZ8D7AP6sgwVR/rY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XLivwnV/e23KGtrIv/yr4J8CTW4/2O+1YjbHeP7YUOqyY9znwdpDLpEgRFbPUh4i9x6VfYdzP93yyziMT3LsWsHXQPSkjEYcZo5ldAzLD880AjfDPXsy/rBn2NKQyB+NIRPFto1CsDcdfBhceC+Qi3xaqm1xX+wAhd2DjSFnn7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Wy1kafNt; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1740724838; bh=eKK5gcU7iw9sg/whyDQpOqDhR8eB9S7j3gxl7nSXvtc=;
 b=Wy1kafNtaP/ffQPWrNJWJlHC8E2K6Sjo6HaNCUuur5B6/NWoDuDCcZG9bdunsTu1ZxBKrWsGY
 vhCgLWRl0h+pQS9SSxvEeKe6KF9n/kIpL/OZuCFofkJhwyMWK6Ow8INACK9Bdp4OoMrKwI8U62q
 r3lh0DWe7RHmj2/Ul38gJHwPxXVScf+NOiIZZ4j/G4Nwwjtf+/zra0XJxQKoxtJX0ZimcVXq9X9
 XkoDTf8hMPppUea9l9D4iAuDJ/n9xoj3Cw2sTM5HIHGg40CCRdkhOTvyU8DPkPBN1j+vUNGKHRc
 8jeeEREfXHzpqoV3sOjFS17YSUjGWAIF8PEtJg/hsAgg==
X-Forward-Email-ID: 67c15a62bcf1d1bd23db01a6
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 1/7] dt-bindings: soc: rockchip: Add RK3528 ioc grf syscon
Date: Fri, 28 Feb 2025 06:40:07 +0000
Message-ID: <20250228064024.3200000-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228064024.3200000-1-jonas@kwiboo.se>
References: <20250228064024.3200000-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO is accessible via ioc grf syscon registers on RK3528.

Add compatible string for RK3528 ioc grf syscon.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 61f38b68a4a3..b4ed4cb555bd 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - rockchip,rk3288-sgrf
+              - rockchip,rk3528-ioc-grf
               - rockchip,rk3566-pipe-grf
               - rockchip,rk3568-pcie3-phy-grf
               - rockchip,rk3568-pipe-grf
-- 
2.48.1


