Return-Path: <linux-gpio+bounces-20568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 978ADAC42F9
	for <lists+linux-gpio@lfdr.de>; Mon, 26 May 2025 18:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4327117A6B1
	for <lists+linux-gpio@lfdr.de>; Mon, 26 May 2025 16:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6DF23D2BF;
	Mon, 26 May 2025 16:23:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9506820299E;
	Mon, 26 May 2025 16:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748276631; cv=none; b=EYexVKprqDh1iI+8YBWbceGvoFRIfSLuJztQzUdrd8oIGDhV9DHVI0AaQwfnk32xAKraWH3d+J2X7nMiS9slGUYIuM8TNFdWfKaRLcI4V62tFNpQUDpcf6DbWsmlxLTYH+Ly8xOI8ZMsZIKMd6jNw2NoW+WwrPV4i2EbkG1UjvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748276631; c=relaxed/simple;
	bh=3rKM3t8ghJaT33UAt7ML5cI5/HQFX7a1T3aoNNJ6cRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dSUjb/PBPmvcFEls14IXxigglx9qJHuZ7dQqsAO427paZFqfdbIHqvszSKq/5SEe1v5RHeM2Xf/pvpcAK8nvLiH5ntQDcDQkuhDYsObJOKIG+Ftki5/nDXZcSEDVKRjTDz0rbSDJzcrDKbNXgyvvsJwUyu9/63ZsKIJ2OB/CUFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16718efe6;
	Tue, 27 May 2025 00:23:41 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Tue, 27 May 2025 00:23:35 +0800
Subject: [PATCH] dt-bindings: pinctrl: k230: fix child node name patterns
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-k230-binding-fix-v1-1-3c18ae5221ab@whut.edu.cn>
X-B4-Tracking: v=1; b=H4sIAIaVNGgC/yWMywqDMBAAfyXsuVuSTSPUXykefGzsUoxtolIQ/
 71LPc7AzA6Fs3CB2uyQeZMic1JwFwP9s00jowzKQJaCDVThi7zFTtIgacQoX/SOQow3H+/egmb
 vzKr/y0dzcubPqufllNC1hbGfp0mW2mzV1QVojuMHOm41f4sAAAA=
X-Change-ID: 20250526-k230-binding-fix-3125ff43f930
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 Ze Huang <huangze@whut.edu.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748276621; l=1885;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=3rKM3t8ghJaT33UAt7ML5cI5/HQFX7a1T3aoNNJ6cRI=;
 b=s92TgKISQNeKR5510+Ky6wgaq4zbHjoGIaAAXPtBHjdq+sk3UaYAjX/xh7VS/BQA3ayAcvpcs
 Yjw8lrnp/GZDN7mFZcx6qqPGEY7iYYibLZggADmf+H0MSZIA1Z0Gwq5
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHkxCVhoaGB9PGUhNQk4aQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSkJLS1
	kG
X-HM-Tid: 0a970d6831a803a1kunm4c5611af1d643
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mxw6Kyo6EjEzCAxITSsxSyMD
	TTdPCjFVSlVKTE9DSUxNTUlNT0hCVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFISUJMNwY+

Rename child node name patterns to align with conventions.

    uart0-pins      =>   uart0-cfg
        uart0-cfg            uart0-pins

This avoids potential confusion and improves consistency with existing
bindings like sophgo,sg2042-pinctrl and starfive,jh7110-aon-pinctrl.

Fixes: 561f3e9d21a1 ("dt-bindings: pinctrl: Add support for canaan,k230 SoC")
Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 .../devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml          | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
index 0b462eb6dfe169a292bf716503c03d029f1ac7ee..f4e0da0bf7fa30af5132644109dbd371ddfc0228 100644
--- a/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
@@ -22,7 +22,7 @@ properties:
     maxItems: 1
 
 patternProperties:
-  '-pins$':
+  '-cfg$':
     type: object
     additionalProperties: false
     description:
@@ -30,7 +30,7 @@ patternProperties:
       pinctrl groups available on the machine.
 
     patternProperties:
-      '-cfg$':
+      '-pins$':
         type: object
         allOf:
           - $ref: /schemas/pinctrl/pincfg-node.yaml
@@ -112,8 +112,8 @@ examples:
         compatible = "canaan,k230-pinctrl";
         reg = <0x91105000 0x100>;
 
-        uart2-pins {
-            uart2-pins-cfg {
+        uart2-cfg {
+            uart2-pins {
                 pinmux = <0x503>, /* uart2 txd */
                          <0x603>; /* uart2 rxd */
                 slew-rate = <0>;

---
base-commit: 0a4b866d08c6adaea2f4592d31edac6deeb4dcbd
change-id: 20250526-k230-binding-fix-3125ff43f930

Best regards,
-- 
Ze Huang <huangze@whut.edu.cn>


