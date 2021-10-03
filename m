Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD7E24200C2
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Oct 2021 10:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbhJCIdw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Oct 2021 04:33:52 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:37948 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229809AbhJCIdv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 3 Oct 2021 04:33:51 -0400
Received: from g550jk.portal.nstrein.ns.nl (unknown [145.15.244.215])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 7371AC910E;
        Sun,  3 Oct 2021 08:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1633249923; bh=QweKY5MA+C4H7ytFhPQeyJb1i/Tq++4mbxAZu/ezFn4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Oo0/wB+xOkfYuocKVMuAWwWM+FyVtN7AWqOtAbZ8KRs3xGiMGOr8vPce5kmPO4Pft
         DWXqgJyy7Bm/oAI59iePjXnhG0gpkJzXOOc1o5YOPqhLeDcDA4AtClS6ZLJJsmAGNF
         ln3A7UePE+rYr4iajuF2z2juEbeV9SeLZ6uI0IOY=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] dt-bindings: pinctrl: qcom,pmic-gpio: Add compatible for PM6350
Date:   Sun,  3 Oct 2021 10:31:27 +0200
Message-Id: <20211003083141.613509-5-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003083141.613509-1-luca@z3ntu.xyz>
References: <20211003083141.613509-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pmic-gpio compatible string for pm6350 pmic.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 9bd01db37dcd..1e5153f10ca1 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,pm660l-gpio
           - qcom,pm6150-gpio
           - qcom,pm6150l-gpio
+          - qcom,pm6350-gpio
           - qcom,pm7325-gpio
           - qcom,pm8005-gpio
           - qcom,pm8008-gpio
@@ -103,6 +104,7 @@ $defs:
           this subnode.  Valid pins are
                  - gpio1-gpio10 for pm6150
                  - gpio1-gpio12 for pm6150l
+                 - gpio1-gpio9 for pm6350
                  - gpio1-gpio10 for pm7325
                  - gpio1-gpio4 for pm8005
                  - gpio1-gpio2 for pm8008
-- 
2.33.0

