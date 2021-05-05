Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B12373C91
	for <lists+linux-gpio@lfdr.de>; Wed,  5 May 2021 15:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233657AbhEENln (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 May 2021 09:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233644AbhEENlm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 May 2021 09:41:42 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27AD8C061574;
        Wed,  5 May 2021 06:40:45 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id i24so2062750edy.8;
        Wed, 05 May 2021 06:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kKYG8ob0N102i49XdsyoJlNpypHz4XdicUmmY8YrBm8=;
        b=DHIVCAKkWeUunCskq1+3bVm1E0v7w2jTyRKFbXrYkBi+0XAwbkfLQrw7lnzuhXpu7A
         RSOUJLDo1/IS/Q+ic0Joc2DYtRIV1wr4xNdl0x0SBy1bZ995+/kxWnes0vxFJ0+/yeMq
         qDoEmwEs1LveHtvkafOP/u+pTxMDmJhD5jvfdFFp09p3EiKOI+5bOBsoS7JptF3YrTbW
         V4zlNHKXkW899vlrjWFjonXd6otvYsIELb7RcjocT/II12ZfrXmM8nzKFdIsHkdHidE8
         iq6QS4oetJufQR6UWBdGrrEknOZsitahKa2QlLeGlr8iAumpCOScRu9mqMGoPrYpgDLk
         B01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kKYG8ob0N102i49XdsyoJlNpypHz4XdicUmmY8YrBm8=;
        b=rUOVGv63HBpjC6QWHA4Wf0wVTNJR4GjUMwLUsfXRLFsQSQ2/cyfp0bipa+Lezht0vD
         jUgRfDXjV+mK5XOHA6gwOIfQ/Ewk5Y0KAMDPShd9dY0KuTi6+L4hnUMLBAontlPMnBeQ
         ZLO0razZieBfn76fDOWs4lDTWF7b0rmvbeD975v6VFRnkB1OMrVtRfSep2z2R7JHrAYw
         /7VQ5gca0eKJliwCmTq5GVib3a2HtcC7ZNDKAOqcdtUHAu2speb/VbcOTsJKLQl9g1qY
         b8W9+fDWyaUihMI8O2ttkl3DH+7UeJjEvfR6YDdvoLct0KpR/alZvYssPqEGf/PLbrai
         acJQ==
X-Gm-Message-State: AOAM533JLurYv5jar9/7B62XKSwoJhKCRUoyMyqK7VHM8ynXaw0fMzLY
        fOPgMVxB2iUJ0qYzwEi0z+A=
X-Google-Smtp-Source: ABdhPJx6LAIVhCq2oyLmgHpmAt93AxOxoW0vY9p9q6RtH0sJ5O/IMoWmwQibLVVq3x1ptjSXHXITqQ==
X-Received: by 2002:aa7:cdd8:: with SMTP id h24mr31096338edw.276.1620222043964;
        Wed, 05 May 2021 06:40:43 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id t7sm15397264eds.26.2021.05.05.06.40.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 06:40:43 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: rename grf-gpio nodename in rk3328.dtsi
Date:   Wed,  5 May 2021 15:40:28 +0200
Message-Id: <20210505134028.13431-5-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210505134028.13431-1-jbx6244@gmail.com>
References: <20210505134028.13431-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A test with the command below gives this error:

/arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml: syscon@ff100000:
grf-gpio: {'compatible': ['rockchip,rk3328-grf-gpio'],
'gpio-controller': True, '#gpio-cells': [[2]], 'phandle': [[68]]} is not
of type 'array'
From schema:
~/.local/lib/python3.5/site-packages/dtschema/schemas/gpio/gpio-consumer.yaml

Due to the regex "(?<!,nr)-gpios?$" anything that ends on
'-gpio', '-gpios' gives a match.

Rename 'grf-gpio' nodename to generic 'gpio'

make ARCH=arm64 dtbs_check
DT_SCHEMA_FILES=~/.local/lib/python3.5/site-packages/dtschema/
schemas/gpio/gpio-consumer.yaml

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 4ce49aae7..2e458fb87 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -291,7 +291,7 @@
 			status = "disabled";
 		};
 
-		grf_gpio: grf-gpio {
+		grf_gpio: gpio {
 			compatible = "rockchip,rk3328-grf-gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
-- 
2.11.0

