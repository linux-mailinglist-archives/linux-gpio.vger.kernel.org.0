Return-Path: <linux-gpio+bounces-17275-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFD1A56EBC
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 18:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A32A3B76A5
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 17:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07BDB23FC55;
	Fri,  7 Mar 2025 17:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/9RcFCQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B648123FC42;
	Fri,  7 Mar 2025 17:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741367315; cv=none; b=ACZy3rpt4Mx+C1NjomiPg4eK/ekN39ZkPtEjiX5Za/QIXKgNBxCJBzVyykIn6GxRnEaB1SvaJfGR8e/x2IUmGT9SZ7M6FDIr+TME6l/gQcoSWeoQVs3XxI5/Yn0gfJRYQLED6fRiZfmlo57+YhfvyEKTzRHSiIDh6jzqt9uf6/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741367315; c=relaxed/simple;
	bh=cvtgK9VT8/U3Roc7Bs3rFCNiDVd+wMNboSlrG5w2o9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AW3SErXtjVc0CJ2xWsMv5K+9PoM+UdG/Cdh7bUC3iB2GjNRHFfdan2OjkScnTFJCzgDlzOANqOAHEM87QYmlHlofnQY+MSM/lpDJZ5ljexnE/y4w3GrEYmosmiPWfHiIi9cOHSAES3O4SKPYVx2KBUoIDh9JId7d4v1X6QE8muM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/9RcFCQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF32C4CED1;
	Fri,  7 Mar 2025 17:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741367315;
	bh=cvtgK9VT8/U3Roc7Bs3rFCNiDVd+wMNboSlrG5w2o9M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f/9RcFCQNII0DeXK5YPc1dlvfqTvI75EHnpQGbStJz0s5aTcrAYDlnNB7doSVpgjp
	 TIyvy4kItRT02AUsc8pWGnUQefBS1Ts1L5KB7pPuMRNoywqG5v579K+GWXNdWlcvTJ
	 ukN5PacuU41bSHTypXHx7KXN435cfHvOju7paA8gRCCoYmoQ3VJm8qM0QiI48QtK4H
	 wozmgzSz3HlNQu697MzilNViEXedrtZZ5XgsCTwwzEi+OjiFBb7ess4ChP0N/qaYSB
	 OHQOM9klkVHn01WnFgJTYEYtVj7qQFH8i+Xn4xZbqESSE1YNDCgi4a/kM17YxMNoc8
	 VwYJLqlL77pMQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 07 Mar 2025 18:08:19 +0100
Subject: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add missing gpio-ranges
 property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-en7581-gpio-range-v1-1-de1262105428@kernel.org>
References: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org>
In-Reply-To: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2

Introduce leftover gpio-ranges property for Airoha EN7581 pinctrl binding

Fixes: d0c15cb96b74 ("dt-bindings: pinctrl: airoha: Add EN7581 pinctrl")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
index b2601d698dcd41c3ef32af547ea41be0d6904ae6..21fd4f1ba78b05e5347b4ffe578656c8a4dc5636 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -24,6 +24,9 @@ properties:
   '#gpio-cells':
     const: 2
 
+  gpio-ranges:
+    maxItems: 1
+
   interrupt-controller: true
 
   '#interrupt-cells':

-- 
2.48.1


