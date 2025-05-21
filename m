Return-Path: <linux-gpio+bounces-20383-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3C3ABEA4F
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 05:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABDA81B61BC2
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 03:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FA622DFA7;
	Wed, 21 May 2025 03:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7eMC5vm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD1B1D8E07;
	Wed, 21 May 2025 03:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747797598; cv=none; b=B9G5yWybTk4huDHNbVcviarC0eLxMjwTJtmpM38Yo292s8ek+uOC/V+4SDGx+UN8jo2z8u1DlCHgR1J7M2ZrbrK+nA8hrhAYKMAsPpi8fK4kfDABvo8jF0/rcfkoUms7Bc+MVX8pzXo6raiLk5FfSUaaNEGu5B4OgMpXp8Wj90E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747797598; c=relaxed/simple;
	bh=byLh/bsiv/fh1hzyDOXgi4uR68X6jhJgLI5muBJNEqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nui+VMx4tBMzANwg3OA7bGbw0Q7xMG4EARkXs4Md0lWMnFN6UiD8Br8WWmML5zNHs3F3lnneOVqnaj5+W1DdazlbqWgdkG2PK5v8Q8pcZWZNbqxNqUTLjNlf9rq2FI8dv0z6tAwwnsi+tL4CDdn7LYil3llj66nbB1JGZxlowus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7eMC5vm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB36EC4CEEB;
	Wed, 21 May 2025 03:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747797597;
	bh=byLh/bsiv/fh1hzyDOXgi4uR68X6jhJgLI5muBJNEqE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=m7eMC5vmN1Vmf3n5thadvgyR6KUoa9sRoXHXFv+hySadnmPl4+/HU5w3W/UVIsxNV
	 B1gVT3+Pqp2v0xPDhNIQhmKbuJc0cFJQLfjt/5dDqkvoLcNXfZ4HtJURLJ0+azFo2W
	 3gIiNtmXmn5PMpgriFh8jGsJkvd7EXPpyQtuSIsecUVSRR47p9cF4HRdRixOkuGQex
	 okDu2IQRxqQjCXLKV6uONIyLKrDo+6CX2Z3VSuN8ySIacuCFvyG9YGSuWrC13CbZgW
	 v2YmZYCKFXOwvvXBagM2yi4Pfl+tR1Msehmsz47w4jc8Nc/yc12X180GzKC6F1HsYq
	 B2cRQJvrp885w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89CCC3ABC9;
	Wed, 21 May 2025 03:19:57 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 21 May 2025 11:19:55 +0800
Subject: [PATCH v2 1/8] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for S7
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-s6-s7-pinctrl-v2-1-0ce5e3728404@amlogic.com>
References: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
In-Reply-To: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747797595; l=857;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=GTxtiAQGmCYOsgbEQ6EOKgzNKF5l16qDKM+F3b/U1zI=;
 b=5AEbk6W4rLldJjUDa5G1M6bOgcp0jNU95UuGFwcssijnUcagojYY7KsK0iDWewtysBHF+wIt3
 RKOGBvOvBYWCmHTJRxbxt2FfTMb4njhfWQER3YvzACtEVLrwj6EEUs8
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Update dt-binding document for pinctrl of Amlogic S7.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index c36b6fe377ad..8a6981e9f873 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -15,7 +15,9 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: amlogic,pinctrl-a4
+      - enum:
+          - amlogic,pinctrl-a4
+          - amlogic,pinctrl-s7
       - items:
           - enum:
               - amlogic,pinctrl-a5

-- 
2.37.1



