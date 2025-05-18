Return-Path: <linux-gpio+bounces-20268-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB2FABB206
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 00:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66B0D1895E77
	for <lists+linux-gpio@lfdr.de>; Sun, 18 May 2025 22:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A61208961;
	Sun, 18 May 2025 22:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="S7F9qNzU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4AC207DFE
	for <linux-gpio@vger.kernel.org>; Sun, 18 May 2025 22:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747606067; cv=none; b=CJd7qpqxFbxetbZEIbTd8x5LRDA83T9WpKdmVU7VJkChlhzRRKcwbqeCv5xR6Fva1HUbTPEK88xMqzDP/NxwF2GkicNmh9q/SJbTMp45GKZJiEcbNZz1PfGELsHFuSiJYbxq9r3SsH6+SPWF/HyVYqCZm3dJNuIFBySiRVmzyLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747606067; c=relaxed/simple;
	bh=IaouxIHOdXcJtAHSznf8PEqezOyP8PmUvFtKqQi5Vbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o2HmE7V03GTTuzZE2V9AlukOp0YiFUl+l46obU2SoXqSMYeybFhsPRzueIgMe9DjvsxIGnAw/g90En4UMEl6cxlGYblUAm5Uu2yrEHOfI2N5FP2eau21jUNBvZzPt0H0JuDXauX9ifCxbiUz3ufypeflLwMlrbo8p4nTfuXaX1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=S7F9qNzU; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1747606065; bh=JlFCAc4M4tsY005AhENFwugyMYaX2j/qB+dCiJDYFXQ=;
 b=S7F9qNzU4YdYULblVzzvOlx+rNEAkwx9oQWJXuhCUkq/YGCoqxxMjh5fawGjapp3ZLshluBaB
 2tqNJtt1Js2Li/PjeOhrQAamv/A4koDXoxVtTDq2EEAzWwtdC+8F5HuVw4IJK9AnGVOVg5gVjOk
 mPFCrxeMJ8W/zXzsjnldVBHa80FhanVuM8P7m4MyEj1qb+p1AwX8N1J7GABX/icGYlhJlWY/Aoh
 JOKIjyGJANilSIXiClGE5i8bKbOeWiB7iqt6PWFKuNmqgLWEZ+JU/I72ZWMK82/UAfkliMVDqOW
 VlIXvKle6IGYdx0TSK/jrbRkgjsbsHnPZy14WzHl2Edw==
X-Forward-Email-ID: 682a5a2a78cae75fbd8d46ef
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] dt-bindings: gpio: rockchip: Allow use of a power-domain
Date: Sun, 18 May 2025 22:06:53 +0000
Message-ID: <20250518220707.669515-7-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518220707.669515-1-jonas@kwiboo.se>
References: <20250518220707.669515-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO controllers in most Rockchip SoCs are part or power domains
that are always powered on, i.e. PD_BUS or PD_PMU.

On RK3528 the GPIO controllers are spread out among the PD_RKVENC, PD_VO
and PD_VPU power domains.

Add support to describe power-domains for the GPIO controllers.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
index d76987ce8e50..bdd83f42615c 100644
--- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
+++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
@@ -41,6 +41,9 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  power-domains:
+    maxItems: 1
+
 patternProperties:
   "^.+-hog(-[0-9]+)?$":
     type: object
-- 
2.49.0


