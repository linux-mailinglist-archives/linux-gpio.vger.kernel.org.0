Return-Path: <linux-gpio+bounces-12856-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B04F09C5587
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 12:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE164B342C9
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 10:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EFE32144B3;
	Tue, 12 Nov 2024 10:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yenou9Mp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113622141C5;
	Tue, 12 Nov 2024 10:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731407222; cv=none; b=dZTu3X3K3S/0tp1fnywwradRVMN99Ke3SRlouiRiFWnl7FY0EYtVXw7gw5rp7RRPNUKKxhMnuOqorRZK63tFZh4rOWYL43fL+xQ+voN1Bxq5GfwgfYf94WJ/Wd+KpsoyHgANUa2Alr1C8ON44CCWf4jS9G9fWFd07HbKD+oXJW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731407222; c=relaxed/simple;
	bh=pWVUou38JVsKCBaDMii9eHLeGckCyzdJUiFfL65PTUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uAQW4xCHehQt5o9EKDNrenWlEkxEPsx+7A9ylZW4DyNkCqkPGb1ZpFmRsmSYT7nHrel5I/By2QM2fSqFTt4WIb9USkGiZ6gO3pINadGtrsnavyhXw2Xz5taCj800wndvaJO9lwHmXXG5QfoYkkZ4otzXbvc3g4fDNe/glUhceYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yenou9Mp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4BC9C4CECD;
	Tue, 12 Nov 2024 10:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407221;
	bh=pWVUou38JVsKCBaDMii9eHLeGckCyzdJUiFfL65PTUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Yenou9MptzFZF5YpRekidDbVw9UM3Om+C7iqD83ooYIYo6N1ncFXC77fyWN2cKpPY
	 VrY+aL+6Veevv7fwlf9NiT/7YLHYn7ickctX8P/z9QbtL8SkZ3GFwMTXXlU8u+1/xW
	 L1CVZK0lAhehjNHE4ARvY2y7Ghx+Mdx+zGOW4Zc56+c5RXf02zrSOGyqPC0MDyqneg
	 an/Xq5f8DwHZGG/ZhTTHQe44QmttW6Hnb+FCGakbY29dYgfY2i5ktl7bCW0lilY/n/
	 nebFAP9wnvaFxmajWj5JcAwMBQ+PSD9CMWOxRRkZcAmwGTrLFixk9oFS/BrYrRTht0
	 r8PhmAMeDUW5Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964C6D32D8B;
	Tue, 12 Nov 2024 10:27:01 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 12 Nov 2024 18:26:55 +0800
Subject: [PATCH v5 1/5] dt-bindings: pinctrl: modify gpio-cells property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-a4_pinctrl-v5-1-3460ce10c480@amlogic.com>
References: <20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com>
In-Reply-To: <20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731407219; l=972;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=vZqjjnCO3zwPWuTy0qDsSgOCsxCV7fM7PewSW3T9rgc=;
 b=vcZvhifPHORlWOS0LP5dmR4xmjVZApG64++PFcGo9B8LlLDz+aPXv1CK9UdzrxNjozCr6v3/S
 tMKjBWTbJL1BDcc3W6TDDy84l6vUVuKboaEkrAnonuxhKjQFb/yba6X
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Extend the value range of #gpio-cells property, including [2, 3],
to compatible with Amlogic A4 SoC and later chips's pinctrl module.
The early GPIO parameter number is 2, and the later GPIO parameter
number is 3.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
index e707c222a07f..6b53577dea59 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
@@ -36,7 +36,7 @@ $defs:
       gpio-controller: true
 
       "#gpio-cells":
-        const: 2
+        enum: [2, 3]
 
       gpio-ranges:
         maxItems: 1

-- 
2.37.1



