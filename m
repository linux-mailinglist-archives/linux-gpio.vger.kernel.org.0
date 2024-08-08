Return-Path: <linux-gpio+bounces-8674-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBBC94C2DF
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2024 18:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4696283AF5
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2024 16:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C77191487;
	Thu,  8 Aug 2024 16:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="Zb4NWeO0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C91190693;
	Thu,  8 Aug 2024 16:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723135234; cv=pass; b=MU+J4BZQmM/dkysN6qb40QQ25Ql8pGlq6EqNGFHF9PDJWUN8xZ1anbO+8umEebAFXNsi3269ZxoVATkdF9mOf9WhwKh8ZtZsQAqlBUGcUb9b7OPM2lKLbam59KM76p6xk/ZhevwtF5gSKNN8xy+ANvHVtMaStQYK0+BEz9V546k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723135234; c=relaxed/simple;
	bh=3JtDT6eMg5AEW4zeoAr1ShqInLYRhQEw4K8g2nT+8eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tZI+j5UMWpaVPqSkAwE/lTIbjJH2c494Q/uw2+1MlpxbnKZitJE3C2XifXiaNY3sIUPfC5WeQnGOaeUy8v9zZNYj36HEtHWQ9DGgyrtXdKwwjlJCb5gjE9jLlXBtr7TuTTVUNhBwqY153lmFOZsNpIxwJaw4uxW9TJDPS86PpQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=Zb4NWeO0; arc=pass smtp.client-ip=136.143.188.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723135219; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AnEjyg3ggxwShStkquPsrgDgsnpQacjFtJjrcEE6qhGiIrWHjJCwE+/YndTsDtbUIYR3T3QYZI8B79rTFTHNLyHFV/njdpcpV4lyBcBJd8O6o/EuGSzVXVhUvV0RiJH0ymXkc+thnqkRUuYTHRs+QNCO/5EAOcsI2ASbNIxfXNw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723135219; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bdUzFuKbic7rPYPLWkIazMcJN2hRSQB+Ihi+XRM/cZs=; 
	b=US+LJSCGxkKpCPQcgApNc1kzmOMdo9/xV9ktqgbmFkCU0+aTKS96h4RCXWtCOaDvSJKZuSZy6heS/d9p7JCJzjj/tDgJiPhznoaYf2LNgep5UFKMYl4dPe7O/D547lOjDBnivpXAhJ6e6aKHioZM8+AUrlNcWJz2QD9TExzExog=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723135219;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=bdUzFuKbic7rPYPLWkIazMcJN2hRSQB+Ihi+XRM/cZs=;
	b=Zb4NWeO0+org2FS7j+yPvz292dmN8s1TJItCEXkvC7/+R12pZuQ13s9zFaEYm708
	sH1hKBKFPg6nwFmDhOkRSSDCRSwJkXegvoUnuILs6jvWdJWPR3WCc4LKc+jO7SqvV8s
	fuFRlTSB1EI8wHhcjF+ANpR5kHRfPppwyKhrNt5o=
Received: by mx.zohomail.com with SMTPS id 1723135217645171.9916187293254;
	Thu, 8 Aug 2024 09:40:17 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: Add rk3576 pinctrl bindings
Date: Thu,  8 Aug 2024 12:39:55 -0400
Message-ID: <20240808164132.81306-2-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240808164132.81306-1-detlev.casanova@collabora.com>
References: <20240808164132.81306-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add the compatible string as well as the optional rockchip,sys-grf field.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../devicetree/bindings/pinctrl/rockchip,pinctrl.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 20e806dce1ecb..cd527ccc9e6bf 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -45,6 +45,7 @@ properties:
       - rockchip,rk3368-pinctrl
       - rockchip,rk3399-pinctrl
       - rockchip,rk3568-pinctrl
+      - rockchip,rk3576-pinctrl
       - rockchip,rk3588-pinctrl
       - rockchip,rv1108-pinctrl
       - rockchip,rv1126-pinctrl
@@ -54,6 +55,12 @@ properties:
     description:
       The phandle of the syscon node for the GRF registers.
 
+  rockchip,sys-grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node for the SYS GRF registers.
+      It is used for i3c software controlled weak pull-up.
+
   rockchip,pmu:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-- 
2.46.0


