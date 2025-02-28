Return-Path: <linux-gpio+bounces-16758-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E495A491A8
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 07:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F2983B7DD5
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 06:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6871C5496;
	Fri, 28 Feb 2025 06:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="uh7G+/Ch"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5AB1C4A2D
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 06:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740724845; cv=none; b=WD4Wv7O09gSGwnR8QYoW3CBl+9S8Hk1cf0ABNN18bKOPtVslaMvIjV8lBB/HOo879SxBhAhOY9V64bmsAH+t0sQToLZ+uP4yoeweLjvdJdIRRiq8/gycshzyu59tYLJjua0dtLEzpkV4Nvjovccye2MIHVgUrrLV2SGM2i1NbfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740724845; c=relaxed/simple;
	bh=9unGMfyYDtzHZ63692K7MQXYmRpomYSLbz4nQ6x6ZSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FAFkcFR3ppjFm5OdAjJJmMAK1aNWFsLZd3speFCh+P96PfgPPbXDpGNb1P3oRVOOownKO4agDeRQmzpGDE6QiJh34y+54yOrxFOj02qvUH87j5hhMbg98gC7laPolWvszEHSmbuSq4lb/ieQ1lI1OqAbk8buGnJ4HIuQbNBQFcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=uh7G+/Ch; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1740724843; bh=7NB3P0f6RdiFdh3drg6WLnXPDL2oA0XzIxfpKl6Tzgc=;
 b=uh7G+/Ch4QINZxAeggR8yk6Pqk9ygO39muCS+U2qykR43YFYQC3Boy7jaHjNLFYUFVMhIYlCa
 x26cT8VRgHk2bHEv2k0hfNoqyR4H7Kd4ZKoWKe24QIAitoVh3ZfZ4S4YqUo7S7+mUzAMxuhky2u
 i3FGtdfaTvOnH46xP2nuv4K6l9nTNj0vWk598QUJA8iKpctPiUqBCszr6LcUsZJqJTnxqtljqCV
 ExW7Lgx1B7af2WVzYvJMTNr05UL6kqhCjxSHuAtKBfpA/ABP5Ov5xz9riWCrt0cPPpS/jUdfK8+
 bEqEedjQUMucCepd9QdJLQbCZHROxgi8dS7iXFbnhxQg==
X-Forward-Email-ID: 67c15a66bcf1d1bd23db01bb
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 2/7] dt-bindings: pinctrl: Add pinctrl support for RK3528
Date: Fri, 28 Feb 2025 06:40:08 +0000
Message-ID: <20250228064024.3200000-3-jonas@kwiboo.se>
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

Add compatible string for RK3528 pin controller.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 80a2b1934849..960758dc417f 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -44,6 +44,7 @@ properties:
       - rockchip,rk3328-pinctrl
       - rockchip,rk3368-pinctrl
       - rockchip,rk3399-pinctrl
+      - rockchip,rk3528-pinctrl
       - rockchip,rk3562-pinctrl
       - rockchip,rk3568-pinctrl
       - rockchip,rk3576-pinctrl
-- 
2.48.1


