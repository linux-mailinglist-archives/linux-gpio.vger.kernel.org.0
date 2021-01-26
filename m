Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58EC2303EEB
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 14:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391754AbhAZNfs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 08:35:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392543AbhAZN07 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 08:26:59 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C806AC061A31
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 05:26:17 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id d2so16168224edz.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 05:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g1bWSW2j2AzUWAFhSJZFlC66uupPeLjnhszVJrACnuw=;
        b=hlqR1UTITl2IrZgG52KTylgq694xBqCbP2uOK7UZErWX5UjUpEj26bNjp5I2ASQBcy
         NrcqZa4u3g3cCNc8N7TLmoBGqiGH1+bGVporc+AfMztQJ2p1PPcDWUiv4yVhdV71ynt9
         zhO8mtfBn0jWkMcGdvAqEUX+KRg6J9KBy1ZSV3aMTJP5RVUM6LWrbv2CAqkDK7igHTDp
         idIAgBkeXHS44OaKJttLbc8GPjeNt/E5oIbJIOcphXtf9MVQIccRPRnvfI+7Y2FzJtkg
         jpkaaIpJ+ImQuaKCAhoaxVAO8rv1G/1pXNAo8p5YkzVm1v5vv6lH49uXzdSUhLIgMh8Q
         G9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g1bWSW2j2AzUWAFhSJZFlC66uupPeLjnhszVJrACnuw=;
        b=M9c+BnTLhGbifZlrEoKwgD0dASghsCHl21IpvOJug0LBgIfvQ3BDyJaFa88gqtGXYI
         s89KVnejl/wYCcPFJyhHEnBr6KRwCHsVTL/F7BWrORK27NxuDsOiUV45AIsVUsbJVuTr
         XUfMV+KiX/2jl0vAY4uZI1Fd6QzxTFy7gruhgqYgTlqAzGukMVmNLAuxX5tUdJOlf4pA
         ACgNk5229yHDCJImRx5drc15c7sfDWNAOBZHTVyvNC1/kInDR4gRXgG/mXu2J6LhJKEu
         fBIltlpeli78u7K+Cxyvoagv6pXpkO98ozJFwSAe/NLAgfhDKEdeQeHYqO/ULTaBXJsw
         LlPA==
X-Gm-Message-State: AOAM53039POLWbMpB+grgt7P49m2NWdgQ+PHOfZgoVPqCHENtqeuK9w5
        UFnlrLPMX66qSwxAnHm+lypCMQ==
X-Google-Smtp-Source: ABdhPJxYoOhqu0uVmrPjAm/2q9G4E+XPc6EQ2qooE1FG/uuK4u7WYvLoeIqvmMnqRM5oH2BRxbWCfg==
X-Received: by 2002:aa7:c981:: with SMTP id c1mr4786033edt.90.1611667576505;
        Tue, 26 Jan 2021 05:26:16 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:65c9:91eb:731f:f2c8])
        by smtp.gmail.com with ESMTPSA id dh14sm12236010edb.11.2021.01.26.05.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 05:26:15 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     linus.walleij@linaro.org, robh+dt@kernel.org,
        lars.povlsen@microchip.com, Steen.Hegelund@microchip.com,
        UNGLinuxDriver@microchip.com, lgirdwood@gmail.com,
        broonie@kernel.org, matthias.bgg@gmail.com, jiaxin.yu@mediatek.com,
        shane.chien@mediatek.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-mediatek@lists.infradead.org
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v1 1/2] dt-bindings: pinctrl: pinctrl-microchip-sgpio: Fix dt_binding_check warning
Date:   Tue, 26 Jan 2021 14:25:30 +0100
Message-Id: <20210126132531.2084711-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Silence indentation level warning reported by dt_binding_check in
order to reduce noise during routine checks.

$ make dt_binding_check
mt8192-mt6359-rt1015-rt5682.yaml:10:4: [warning] wrong indentation:
expected 2 but found 3 (indentation)

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 .../devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
index df0c83cb1c6e..4fe35e650909 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -99,8 +99,8 @@ patternProperties:
 
       '#interrupt-cells':
         description:
-         Specifies the pin (port and bit) and flags, as defined in
-         defined in include/dt-bindings/interrupt-controller/irq.h
+          Specifies the pin (port and bit) and flags, as defined in
+          defined in include/dt-bindings/interrupt-controller/irq.h
         const: 3
 
       ngpios:
-- 
2.27.0

