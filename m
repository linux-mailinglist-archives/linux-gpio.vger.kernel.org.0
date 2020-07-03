Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE9F2135C7
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2020 10:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbgGCIG5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jul 2020 04:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgGCIG5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jul 2020 04:06:57 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A694C08C5C1;
        Fri,  3 Jul 2020 01:06:57 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id z5so14751045pgb.6;
        Fri, 03 Jul 2020 01:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hbdht3tEGEWddsRIflxInoYIWh0AhdVrNIxl0dEAaKY=;
        b=kzYyDn77cRq6f6x+fxP0JMUUDlJkiChejKT8rq7z+dYp7BHWfSf0mFeXBwKGI3i9yO
         QWOf+VVmpwT0t3GkRD13K2EuHm6okLZQHFpvtU+wnVK3/zR3fWXmBGSDnGI33xR3q28Q
         Iudc/xptr/3K7nxPY6L1k7PH4hHI8LHajlm6u4yT4verw8tnlUm8EN5FLUS61df7nFVV
         TyRaBDGSUH5gaI75degzhB/2AQkn0GO4pxyUzAL/WEgidvkeUvnui/mTehyPueKpbjy1
         sWRsdyHDI0wQJypvTJru/1fbiZV1SMedMURrL75nas0MVH0k0TIkZ0s+Sy1kkJQz66o6
         c1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hbdht3tEGEWddsRIflxInoYIWh0AhdVrNIxl0dEAaKY=;
        b=JbTJXoSFBPcJRx7c4p7cC0aT8vL5XaUsT+J1+ZW60KPjpCGdvWITPJb/XDWxQi6aXx
         QBvbPxz1eJgCGcpJ/MPAmkbhkhdC+ncSkWIo5zUobKqpHK2u466Iji9eVJ0dkV4nM+ex
         CtyUcG22kjCJuHhJYs2XJOToZQ9C1d1BF/cvSWv+fqSWdg1oCiMeqlAkSJ5pWZYKTAih
         9EsxeCZtpULgVm9baWs9b/CrAp5DOmc4fb2IpWzcxYJxRoH6RXbSsMuLOtmVyh2DxVMD
         BW+DnVTp++LtlIKYTuZ/0BYz8CaGGrWYNCurg+pes+YtS84eSbVgLzbTYQ+pxqt8JWrR
         UtoQ==
X-Gm-Message-State: AOAM530OjOugsUzkliLXSXBiTKBtF6sRS/vXd24cyD39pY0mMrm9f7ZR
        1+eZU549obZ9MFuEuKQE/dI=
X-Google-Smtp-Source: ABdhPJxXkRFkwwPoLMesU/W3BU7l2AfYA2AHjMpMozOrXziz4w4C81fzaq/abvvNGvewQqQ914WnVw==
X-Received: by 2002:a63:5952:: with SMTP id j18mr27347519pgm.371.1593763616782;
        Fri, 03 Jul 2020 01:06:56 -0700 (PDT)
Received: from brian-ubuntu.lan ([2601:647:5800:8d47:15f1:d2b6:764f:b105])
        by smtp.gmail.com with ESMTPSA id x10sm11080992pfp.80.2020.07.03.01.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 01:06:56 -0700 (PDT)
From:   Brian Norris <computersforpeace@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.or>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 2/2] dt-bindings: pinctrl: qcom: add drive-open-drain to ipq4019
Date:   Fri,  3 Jul 2020 01:06:46 -0700
Message-Id: <20200703080646.23233-2-computersforpeace@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703080646.23233-1-computersforpeace@gmail.com>
References: <20200703080646.23233-1-computersforpeace@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We've added drive-open-drain support, so note it in the DT binding.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 .../devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
index 84be0f2c6f3b..0861afeccfc9 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
@@ -44,7 +44,8 @@ information about e.g. the mux function.
 
 The following generic properties as defined in pinctrl-bindings.txt are valid
 to specify in a pin configuration subnode:
- pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-strength.
+ pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-open-drain,
+ drive-strength.
 
 Non-empty subnodes must specify the 'pins' property.
 Note that not all properties are valid for all pins.
-- 
2.17.1

