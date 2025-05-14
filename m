Return-Path: <linux-gpio+bounces-20117-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3086FAB63A0
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 09:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F23E188EEB1
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 07:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BC520A5DD;
	Wed, 14 May 2025 07:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHwvoObs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF87B204096;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206102; cv=none; b=P+EM+EfH/9WqiXuL6mw5cQYdhynY8e9Y1wbPe5c/5yHzlXS+3zTEcdVbA3Tf6igUL282uCCD2MnTxCEQMNikNFscS6WWiRkt2BKHBGWwT54nNoT45JclEjEOvdcvau0n/2mCSjAU1LznFnSk1qpWFfiGFHfrgVxNdQ36keDDor8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206102; c=relaxed/simple;
	bh=RhXaG6D10XuprrM2uwXZ+yryGaiW6qQjUHpNKKnNco4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FsbS1hTJumXwrbUnKbSxC0fNZkqObAD3vD2kdoEwLux2rigyyOVjhyZKHNv8No4E+GCyeJL30tbqAYIRESO0QVh7SiriCcRXQO2fj5PTcrZv0CtaiqxOJOU/hGJHEmqrXzPV80Z2e7NtuXYER+we5VbJUpx7bTIiFgjuRJNRXY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHwvoObs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C6A1C4CEEB;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747206102;
	bh=RhXaG6D10XuprrM2uwXZ+yryGaiW6qQjUHpNKKnNco4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eHwvoObsxQY3MpoRSkhPWgLKhUksDEdk1jl8Wa8VmcNU26EGdaEst84a7hA8auT8/
	 SYLGSnnKnCZhzRpf24kMjECzayANSmpWVojht96wWY1xJe8maAq9edikem9yB8vpVn
	 tgR9NxofW8wTLTeT64O4qACZNZZhg1r78MtvrCoWVQ3Q7PM3ELH+qvd/owQUIT7fo8
	 55OXG/SV6zpaIl+YnHCJyOm9L6Nsw1sTU3CiKkIlcXGK2Oiiy2napiGFGvrnH530UK
	 yqy9TrePmCrkTKCQPBfqmkko9YRzDnr4ZX1yPb3NIlAcv79HZm1lUMuoiAybuf/rQq
	 k37yTgs4Qhx5Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C497C3ABDE;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 14 May 2025 15:01:30 +0800
Subject: [PATCH 3/8] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for S6
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-s6-s7-pinctrl-v1-3-39d368cad250@amlogic.com>
References: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
In-Reply-To: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747206100; l=777;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=SGs48wURMjraERop2ENTKoLj76g7oJ3ublU0QekYvzE=;
 b=rEqYoaagVtWnwccz+GPoTSGpAh94WJcq+4gnR1fgKV7VHyJeoiV4IoNKYrTVI+RfssOUFjmUS
 xZt7xPptmWPBGTOn3Rauo5rXQh3GVD6b7ou5ya83Rk7YLBhUHLgUG2I
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Update dt-binding document for pinctrl of Amlogic S6 SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index 96a7c5646c13..61a4685f9748 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - enum:
           - amlogic,pinctrl-a4
+          - amlogic,pinctrl-s6
           - amlogic,pinctrl-s7
       - items:
           - enum:

-- 
2.37.1



