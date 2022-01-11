Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E4C48B834
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 21:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243160AbiAKUSI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 15:18:08 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:38040
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242704AbiAKUSF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jan 2022 15:18:05 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 60ED93F17B
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 20:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641932284;
        bh=kDoTHutMEAOdfAvEQmMCvsGPLxW8/ktRUinuzsYc7Nc=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Wm5XntpCk5IBobGbuPbmeXRda6ohFd0+1HE2u5W4NnZYvR+X/DfklhdmTklOabCkf
         8fQftEMhd29Ah775GetIrjCkttjP3kBZAhWIOltFHv1Poc6JfYHP0aWQG+9jaJGMXl
         nVkUoxJMiWjHoAyZK0JJEl+ZZzmD8dLjxNRcNFzR5rtQPWXWnRHqK8ae/amDN3K5bu
         tjg6Fy4pKbykPbcZNK0DacvH9eFJTVE3Y//jMYVCvHGxW7cm6F/mdkiDXYAjB4Z/Pr
         dbuxzz6C74L1BBoxiyUR7jObGdTq1rCIuPn0rVGfwXcCX7daBWCsWdYclA9U2wFXgn
         bpBIHtgkzhWBw==
Received: by mail-ed1-f69.google.com with SMTP id v18-20020a056402349200b003f8d3b7ee8dso145848edc.23
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 12:18:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kDoTHutMEAOdfAvEQmMCvsGPLxW8/ktRUinuzsYc7Nc=;
        b=QmH7NnGSlmsszhXgrzrE6jLst4KAtpBVBsqy2JUJuznNuTDjLNon3BlC3xj7r9r8Qf
         w+IWAC8Tf+QfpxTJm3aP4ijl8KxO/f0UCHD1yaj9AkZ8udEdPGojgtvpTeIJ8euQD688
         l+dIgAUEE02hz6+y8/HPQ4RFOP9Xfiymg/eC7/c8N4zrccF9qSUkZm3IyeBLAnd1anVO
         8RQW5JfpQnZgbV29Vn4rVC75OISJkLxzUFznvqi/+tWlBveyHKutFb52FoZ0SeyHWMPH
         5rrFI4PLPb5LNCvyw7oxrruB1c4bZc7YlqUrdsiP//ATnHYIuPcKdjdNyLQbt1RQyOBc
         Ty8w==
X-Gm-Message-State: AOAM5324A7Wg+dc8lrC8/hpZDyR6scST2ZOyv4ZrgcAHf10EWvOfFG2v
        SwkSJ7skVyE55s+ycKXkLIeSc+Z+4z5wGnP6BIr8uyWdy4Wx74B3tdE16Wu/7xyuMC3GtAvEFVy
        XW4v97h88W/R3v7ss9N8o7U9VhmM6sYC1M/eXtS0=
X-Received: by 2002:a05:6402:2926:: with SMTP id ee38mr5851995edb.213.1641932282519;
        Tue, 11 Jan 2022 12:18:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsuhLrTEsItilqaRBXNonfCCsK7u7PWJtW46W8/0QM8Ys5Q4lSWFlZbTeB4QhKWwzSlFxGlQ==
X-Received: by 2002:a05:6402:2926:: with SMTP id ee38mr5851985edb.213.1641932282391;
        Tue, 11 Jan 2022 12:18:02 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e4sm4030881ejs.13.2022.01.11.12.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:18:01 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>
Subject: [PATCH v2 09/28] ARM: dts: s3c64xx: drop unneeded pinctrl wake-up interrupt mapping
Date:   Tue, 11 Jan 2022 21:17:03 +0100
Message-Id: <20220111201722.327219-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Simplify the nodes of S3C64xx pin controller with wake-up interrupts by
removing the artificial pinctrl-interrupt-map mapping node and use
interrupts-extended.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/s3c64xx.dtsi | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/s3c64xx.dtsi b/arch/arm/boot/dts/s3c64xx.dtsi
index cb11a87dbc42..67a7a66e11d5 100644
--- a/arch/arm/boot/dts/s3c64xx.dtsi
+++ b/arch/arm/boot/dts/s3c64xx.dtsi
@@ -178,20 +178,12 @@ pinctrl0: pinctrl@7f008000 {
 			interrupt-parent = <&vic1>;
 			interrupts = <21>;
 
-			pctrl_int_map: pinctrl-interrupt-map {
-				interrupt-map = <0 &vic0 0>,
-						<1 &vic0 1>,
-						<2 &vic1 0>,
-						<3 &vic1 1>;
-				#address-cells = <0>;
-				#size-cells = <0>;
-				#interrupt-cells = <1>;
-			};
-
 			wakeup-interrupt-controller {
 				compatible = "samsung,s3c64xx-wakeup-eint";
-				interrupts = <0>, <1>, <2>, <3>;
-				interrupt-parent = <&pctrl_int_map>;
+				interrupts-extended = <&vic0 0>,
+						      <&vic0 1>,
+						      <&vic1 0>,
+						      <&vic1 1>;
 			};
 		};
 	};
-- 
2.32.0

