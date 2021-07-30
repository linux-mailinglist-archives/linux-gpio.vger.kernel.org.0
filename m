Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE4693DBB40
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 16:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239605AbhG3OuH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 10:50:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239574AbhG3Ot5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 10:49:57 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76115C061369
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:49:37 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id y12so13556837edo.6
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kHxnIKoGMj+viA9SkCXyUhvwBThKkIIkNV1jgxaZB7A=;
        b=p2s7e7IGzpFpnksHeTsdi3WVo56e16ft+NwBT7ci/aAghxjETLx0uo5rRAq9yguHHc
         6hqtVwzZpWPc1zCVCc7SYA6fBMGigy1WPXfoL0LmUGhb0jS7QZtFNNv3dDwV1P7G5NGx
         d+FTjh2Yna4S5hLGmA53sW4CACka+Zz5ys+FuEITUi7yBc2Nzom1IQ+rIm2xh/E31bi2
         uP3qdxBMYnqItJGFfMJqFmcQyIaxeQqGqYWAKXaJtgwkQRxFGhzQN6IYEIQRby79tPSM
         QfWBPu+A5lOiOydjjeiDmcesTjL2P2/5NHXSk9W5fsfUzc7pVKvH9IirVIo07nKu/ZnO
         RRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kHxnIKoGMj+viA9SkCXyUhvwBThKkIIkNV1jgxaZB7A=;
        b=VoRFdX82F0u6psMcu252IWA/grMmfsgYTfwnKySGj1AkR4ru5pCBZXRuMTQJYW75II
         hNSB0kglk8ezCQtkmMSGGd3vt6j3MQcv92jqtiChosTQw72HBF2k3zMSwPZRV3pYiOen
         xJbHf9ux9oektRKtjZyRwrPvqtthdoYDfHgXRgboCC1MF2UX42cDMzO1mpCcgBvXa69c
         2flOVJUav+b7W055v1wclRrkVHcj8BP4sqN699bLiV9JkOcNYfpaAVGBJI0/fp1d3zSE
         et+fGN0p6J8VypsMiwdrQsedzQ37UynAijj5FeNGqpOu+xfGcf8c0kOdhUQnpaIbL1IR
         56QA==
X-Gm-Message-State: AOAM530FSaRcJHCbeHodeRPqwiPfaP4rC4NI05SD8tWQCHgHUsw4R3jV
        tGk/FPpc5LyeN8mdk7Vu8JuTWw==
X-Google-Smtp-Source: ABdhPJxeVxIYWunZ0Q7rzXbRnDubJU2cx6qLTylTgDIb+MRFWKXgpEQNC/HuHomqN/perHrDk0gEbg==
X-Received: by 2002:a05:6402:1c83:: with SMTP id cy3mr3478479edb.231.1627656576069;
        Fri, 30 Jul 2021 07:49:36 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id g3sm634964ejp.2.2021.07.30.07.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:49:35 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
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
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 08/12] MAINTAINERS: Cover Samsung clock YAML bindings
Date:   Fri, 30 Jul 2021 17:49:18 +0300
Message-Id: <20210730144922.29111-9-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210730144922.29111-1-semen.protsenko@linaro.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

New device tree bindings are usually added in YAML format. Fix "SAMSUNG
SOC CLOCK DRIVERS" entry to cover both txt and yaml docs for Exynos
clock drivers.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 056966c9aac9..4483ccb46883 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16404,7 +16404,7 @@ M:	Chanwoo Choi <cw00.choi@samsung.com>
 L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git
-F:	Documentation/devicetree/bindings/clock/exynos*.txt
+F:	Documentation/devicetree/bindings/clock/exynos*
 F:	Documentation/devicetree/bindings/clock/samsung,s3c*
 F:	Documentation/devicetree/bindings/clock/samsung,s5p*
 F:	drivers/clk/samsung/
-- 
2.30.2

