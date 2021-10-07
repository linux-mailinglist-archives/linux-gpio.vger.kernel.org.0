Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0E67425EC0
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Oct 2021 23:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232813AbhJGV1Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 17:27:24 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:58950 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241283AbhJGV1U (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Oct 2021 17:27:20 -0400
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net [213.127.63.121])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 945B4C91C4;
        Thu,  7 Oct 2021 21:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1633641924; bh=QweKY5MA+C4H7ytFhPQeyJb1i/Tq++4mbxAZu/ezFn4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=h5Tzl+78Ilko3NcbyMuaUopUMuIIlGmmqwMDMTGIOjfmg05dvTe8NIQ3Mm2aK95iw
         XoF1Q9azjusb5xXJhcCUVQ/kklZzxlw0F6OlwdaDOPQvqJ3ebmpUZD6yjeahnxtL2Z
         OW1M/n4qtAzAh5fwqJAnV7RRI7yPKf/GWTpaUdNM=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/11] dt-bindings: pinctrl: qcom,pmic-gpio: Add compatible for PM6350
Date:   Thu,  7 Oct 2021 23:24:31 +0200
Message-Id: <20211007212444.328034-5-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007212444.328034-1-luca@z3ntu.xyz>
References: <20211007212444.328034-1-luca@z3ntu.xyz>
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

