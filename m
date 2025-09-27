Return-Path: <linux-gpio+bounces-26642-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 104A9BA5931
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Sep 2025 07:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E863432397D
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Sep 2025 05:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A71122B5A3;
	Sat, 27 Sep 2025 05:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="KU3bfiRD";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="7CAWdH0n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E9422A4F4;
	Sat, 27 Sep 2025 05:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758949352; cv=none; b=f8LMBd8wEOGEPOefDOd1VpAlm/6+OLe0m+tGCKXA/sJI3F7QoRfNgs0aKBH4KTeJRRoNWzCtNvebEXbH96cLnwb5q6FMqMGCRs8cdSl8/pEOdtW6qwzHNofdhNyIhB1h8VRdurZUjYa2uv1vfu1zYTXC2sabj21j8a8cKAJ6Y+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758949352; c=relaxed/simple;
	bh=2bdyJSmNfA84cD9RwcJK/nl1FiNGvBo/u1np6F84KKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mbD3cx/HcC/YUj3nqb9Y8jILKwi4BzriZV352sW+zBk5hmvzMkGaJTqjipiY5+WRmjrjGQkzXW0tlC7w6T1vB4JEdgynG3idUndZgW5UhU4STopjmfwWzHTJ6xcuZeFeqHX527PoEzNbwpGxN+GxuR7kScXIJJ8eAzrs5QfoRWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=KU3bfiRD; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=7CAWdH0n; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758949153; bh=c18qqKgWjk5aiDXdC9o8HGK
	jorA6BtduRucu/rNzeDw=; b=KU3bfiRDXJVcsJii/saVSictpZ2Uz2F8/TkU+jR6trsb6tu68B
	X6ho1FdRQh8hI+VonUi7b/9JcRoGNRtrDF2kbvTAKuNvTsnx5lnOEKTTBQv/wJZhfieIiOJugNC
	2pEU0sN8evuGn581Nr59Y+B7s2K5Mqjd4dPjcmz0THy1F/L5uSYCzokfWgMSqfBZJ8ojOWplmem
	HcU9ksBzKAu/zU+Tym/8cR/9srpD3/mgppqu4Z0+XLS0GofsGmUTEf2Pdpz2BaV6f+qrh+uv+n6
	7At3hPJJnwOxWOCJDi4OG+iWuTwiMD55SRZbH7LbV0rKpq19CZV6P/evRy65r7gclew==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758949153; bh=c18qqKgWjk5aiDXdC9o8HGK
	jorA6BtduRucu/rNzeDw=; b=7CAWdH0n9zArBrqedy1Ccxmiay/4i7xMM/1GSS537Og2ARDj34
	dYiWZUHJpzGq6kLrbcHE2stxG+uYUmcLXpCQ==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Sat, 27 Sep 2025 11:59:06 +0700
Subject: [PATCH v3 1/3] dt-bindings: gpio: rda: Make interrupts optional
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-rda8810pl-gpio-fix-v3-1-3641cdcf6c1e@mainlining.org>
References: <20250927-rda8810pl-gpio-fix-v3-0-3641cdcf6c1e@mainlining.org>
In-Reply-To: <20250927-rda8810pl-gpio-fix-v3-0-3641cdcf6c1e@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758949147; l=820;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=2bdyJSmNfA84cD9RwcJK/nl1FiNGvBo/u1np6F84KKc=;
 b=/pETpb90BR9sxZwYvfrWFybr1R2zT8RGeGRPqw3DI+yfzFsPZK7Z6Qe5ZOhhVDkT2izhuYnop
 WKcAw9HFDHQC9Xs6P47SEXF/2JWiS4/XEp4puuT6y72vjYeKEfXfT94
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=

The GPIO controller from the modem does not have an interrupt.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 Documentation/devicetree/bindings/gpio/gpio-rda.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-rda.yaml b/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
index 6ece555f074f84b396537917d7149d4061724dcc..dbb73b4d33ed39aa65024376b1af0c4e2fb896db 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
@@ -41,9 +41,6 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - ngpios
-  - interrupt-controller
-  - "#interrupt-cells"
-  - interrupts
 
 additionalProperties: false
 

-- 
2.51.0


