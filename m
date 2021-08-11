Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB5443E8FB0
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 13:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237419AbhHKLs5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 07:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237407AbhHKLs4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 07:48:56 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BFD5C0613D3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 04:48:32 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id t1so3282204edd.6
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 04:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XqDR8o25I9iZ0astV4MjqX8UHWoiuFZZ1Xjx/J4Frsw=;
        b=CjpV2FHaTieFaab7z65Ddlq+e/euf14JUs8OuIRGO0rjskWhkNfmnkaUSqUCSvjDOW
         E+5XwPWpnADC+Cg7yE4vRXSfwCXE1EUjP/5PvskRI3sUZo2N4FC+POGxIvJtQARNtrF4
         EjlyZ4LG1sXaQlE7uS71SW0LhNOHOmXCPRdnKbRrlLLmRdVmjjiqVi6tyDer51e+M5nc
         Bl9T8J/TTFCbip4kI23JRoV3MTooNsesJdQ3ycHMX+8qie/XqmMMDgkR5ylzrQmaJWkL
         D1xmzdPntg2TDUQhmXs0Vjpl6Asng9pZ5lJ28NRkJ0SHtGWg7N0jitlWn4CY3MIKLf26
         noQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XqDR8o25I9iZ0astV4MjqX8UHWoiuFZZ1Xjx/J4Frsw=;
        b=rQy9/UG2vhDD5UWE0+nx1/wYfoGfFw3rNgIKAjVq4laW3aLC8j31CpYq1ux2HrVle0
         uH27cHib8soxdwtU37lJRVicvZYPMyJ5Nfvb2/x6dGkUNLqJkm+sxUbhvv9aOHEFqqmN
         E4sTfKyfdAuFSl4JIpcjTr1rp8hd02fXpbF1zoQCVe8Wb3eoRVNOKwePSvCCIwHd6Rh4
         HrcQ5aoU5o46Wi5TNFcGjUzRnrrG0PDnxGkuWmFPMT5Jscl8962uuyiP3UEOhi2xxkJl
         kX7Fg46wCs8t9mdgBboWjnd5MCbLx1k/4v9teLtWL3toiNstofVL0CRgxkCxBN8+uYR7
         gmpA==
X-Gm-Message-State: AOAM533/yrqcnkisgWh1UHVyASMY9+32Qzn5OorwRv+gxZDMxw4mQiT/
        UaGzcc/ThWBNwpKl/OYzEa28bw==
X-Google-Smtp-Source: ABdhPJxPBr/lOttW3KXHEiYkxvP2K+24XoIasoO/NkyDAIWnHAl0QvjC9nJL3wA9vLAPNR8U2zYf+g==
X-Received: by 2002:a50:d4cf:: with SMTP id e15mr10933562edj.2.1628682510972;
        Wed, 11 Aug 2021 04:48:30 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id m25sm5446793edv.81.2021.08.11.04.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 04:48:30 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH v3 1/7] dt-bindings: pinctrl: samsung: Add Exynos850 doc
Date:   Wed, 11 Aug 2021 14:48:21 +0300
Message-Id: <20210811114827.27322-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210811114827.27322-1-semen.protsenko@linaro.org>
References: <20210811114827.27322-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document compatible string for Exynos850 SoC. Nothing else is changed,
as Exynos850 SoC uses already existing samsung pinctrl driver.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
  - None

Changes in v2:
  - This patch was made the first in the series

 Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
index 38a1416fd2cd..e7a1b1880375 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
@@ -22,6 +22,7 @@ Required Properties:
   - "samsung,exynos5420-pinctrl": for Exynos5420 compatible pin-controller.
   - "samsung,exynos5433-pinctrl": for Exynos5433 compatible pin-controller.
   - "samsung,exynos7-pinctrl": for Exynos7 compatible pin-controller.
+  - "samsung,exynos850-pinctrl": for Exynos850 compatible pin-controller.
 
 - reg: Base address of the pin controller hardware module and length of
   the address space it occupies.
-- 
2.30.2

