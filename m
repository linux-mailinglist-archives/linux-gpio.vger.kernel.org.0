Return-Path: <linux-gpio+bounces-29887-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95400CDDAF7
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 11:37:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F02B0301CEA0
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 10:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E0931A801;
	Thu, 25 Dec 2025 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lzqox1NV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52A9316909;
	Thu, 25 Dec 2025 10:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766658987; cv=none; b=E2Sw24KHDZzX0TJTd4ZlBmKw+rCtnMM4Kw/3B7hqpnEeeBoED8LWUdq/cnww7pEqHOp2n32ZywGwFsM9UFrDrYMM8fO7EmhlVO+6yl6Sw0Ts3jDO9qzS85FJWXzUuAxIEQs03iw4kGkoSy0RGzTGA6Y/P7d8am4ak7uffNY5Ebg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766658987; c=relaxed/simple;
	bh=cBSuHQovsHdrJ5dq2OCwejhhgDoCJeLmPn38lFCy5dU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TE3j7PJd2fGKTFF+pJwSa6ieMJmLfNWKcXKpQ3BlNG5r5qTSeGagePTPKf92Vh41WT6YUoqfV8BQvhAQlghCZQal8QaqibeY9tljwibGLxpaaHo/w2OA77CcFgzo/783cIoaSCE7393mHuHoteVw5LtHWaoCt3VYUcz7Ad8/OXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lzqox1NV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03729C4CEFB;
	Thu, 25 Dec 2025 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766658985;
	bh=cBSuHQovsHdrJ5dq2OCwejhhgDoCJeLmPn38lFCy5dU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lzqox1NVgfmw8yBz0Zdtv9ZUwJeLXfoLdNlkjKHsBqj7ffVC/KpYbA/W7gNUw4aNU
	 nZMIfxe7+LZUj2DpwBCcq3vd9EplRmVWrx+qJxsURa9dPJWhAryAQevQLAFr1p0d0L
	 kLrnN7F9mBBxYf2DtX64A2mpGTtu4EWF2iOk4ho0mY4p/UOU96F+PhR2XP6ju8baDD
	 WhfZ7uvBEU86qDk9XhGNVlLWDIUBWsPrU0DSOzg2I2ES7L9FE4sDTy61zIueqMNVCB
	 GqG1Ge5CWg3YMACLkIXYdK6Tdj7VJOgn4cPIRYI/WsIf/2tCk8p/7z0EwDOchp348A
	 4lv4jrgdx4rtQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 5FB4A5FE52; Thu, 25 Dec 2025 18:36:22 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: pinctrl: sunxi: Allow pinmux sub-pattern with leading numbers
Date: Thu, 25 Dec 2025 18:36:13 +0800
Message-ID: <20251225103616.3203473-3-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251225103616.3203473-1-wens@kernel.org>
References: <20251225103616.3203473-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pattern for pinmux node names is typically the peripheral name and
instance number, followed by pingroup name if there are multiple options.

Normally the instance number is directly appended to the peripheral
name, like "mmc0" or "i2c2". But if the peripheral name ends with a
number, then it becomes confusing.

On the A20, the PS2 interface controller has two instances. This
produces pinmux node names like "ps2-0-pins". Make the sub-pattern
"[0-9]-" valid to fit this pattern. Avoid having to confusing "ps20-pins"
name.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 990b78765427..45b7a0b6c626 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -106,7 +106,7 @@ patternProperties:
   #     the pin numbers then,
   #   - Finally, the name will end with either -pin or pins.
 
-  "^([rs]-)?(([a-z0-9]{3,}|[a-oq-z][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$":
+  "^([rs]-)?(([a-z0-9]{3,}|[a-oq-z0-9][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$":
     type: object
 
     properties:
-- 
2.47.3


