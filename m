Return-Path: <linux-gpio+bounces-15797-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D02A31DE4
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 06:24:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 172ED166871
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 05:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FB21FAC4F;
	Wed, 12 Feb 2025 05:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDzuMOAi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248FE1F9EC1;
	Wed, 12 Feb 2025 05:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739337847; cv=none; b=By0XqNF4ch/HLWLbge2/6OjRUJNHTfL9IJqIFBDaxJ8x2Zxz2jCozzIBacdNDsHmXQ2bzooEXCLg9S/RPmM15KavSD54JCuuS6X+/Zwft4wCtF0mWkqDGTl1DmBcbcelZ0uCqTiUh/yxhcQ7NgWysn8H88Bdq+EG2MIz9laHZ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739337847; c=relaxed/simple;
	bh=vSXb+2ggUZ/x16ojZ2sI7MJhVmux4rbJ1k+Dt5LPLv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UnsPHZ+Foq6TJZ1PnV1UE6RDEaM40K0nfxa0oasLetZCq0ZACh6uOiGAeFHwWeoBrMM9mXDYWEQnihHaGSLI6VaXzVTq5uGGK9DCC9nFYYR75YK/HYShXJblSUC3SuvY6mLVY4ObzS+/fXNrEezCkHF2VgphBkqdU9dcQLTbFnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDzuMOAi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E441C4CEDF;
	Wed, 12 Feb 2025 05:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739337846;
	bh=vSXb+2ggUZ/x16ojZ2sI7MJhVmux4rbJ1k+Dt5LPLv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NDzuMOAit2fC+1XlEQc0nRuQ50/d53IZdy97MMV3CTlmobdVAMjzjX0/qwrQJfYzx
	 GY2xRaL/RJfKcpm/+LAgF6hZM7oWj1N0Ew9p+9ScNYPPa+vZ5hwzUYbfwWyd96Tf8Y
	 FTQLqUXraZsQLdc0MCK1UWQKYACwi9PJJRGemm8wny+eZAZ+PquxekGKZPbXWOYEyL
	 tJpgEavvDko+lEmpAmYGKY4ZvQm01u92er8Qycl6epdF2YksidMTZi3je1SXetjGXN
	 Aa8W9GDHaxsoK/vDY9fWxcJKJIVf4RKTytXNhfqcUSPZxCjy9EDFqL+yXvwf1MJUq4
	 2wcjuIocjc/6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC93C021A4;
	Wed, 12 Feb 2025 05:24:06 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 12 Feb 2025 13:20:54 +0800
Subject: [PATCH v5 5/5] MAINTAINERS: Add an entry for Amlogic pinctrl
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-amlogic-pinctrl-v5-5-282bc2516804@amlogic.com>
References: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
In-Reply-To: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739337841; l=865;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=nBXqe1tXYGfdmglaQs6qWtScD9N64VHa3kQ6UO7Q5xQ=;
 b=jwNdMCdgfLrMjGjYwYUFjVTMM5Bv9t0hCQWWUpKJORngppCG4bYoD2uCgtfqk1Y2CFYzVs2eL
 VlrSg2BJj96C9y+r6UR8oJOnfIXC8XX3GKNF8EA10cFgyguEJyapr2l
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add Amlogic pinctrl entry to MAINTAINERS to clarify the maintainers.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..c73d7ed5aa8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1218,6 +1218,14 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
+AMLOGIC PINCTRL DRIVER
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+F:	drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+
 AMLOGIC RTC DRIVER
 M:	Yiting Deng <yiting.deng@amlogic.com>
 M:	Xianwei Zhao <xianwei.zhao@amlogic.com>

-- 
2.37.1



