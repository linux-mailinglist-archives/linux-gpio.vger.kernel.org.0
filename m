Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6393E7BA42C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 18:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237489AbjJEQFD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 12:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235303AbjJEQED (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 12:04:03 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80DCBB2B0
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 08:57:53 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3247cefa13aso1122512f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 08:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521472; x=1697126272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZcQdif16KIsV/1ocyIAmtjZ1yEW/jfAGT5DH5ZGevU=;
        b=ydfAtw60OWL+MeRlKNROR1ncikbGd18YQDLHq8VqCl0/mgP9xq9u1/kUFAcACinLyu
         Dv0SJp8uqDPzbRuPO4oxImaFN+fVg0mU3WQXCC8Q6ozSh9Ci5ah7inxI6928b4TRyC1Y
         xqiOUkEcYhbRsZMMzsThmEvldu23ufg0ykUg3ijrIWLcdQ1hdysyufsCAgJGfbbQjLap
         RvCY+RfgJRRQrMi7Zvz3G1M63nAEA/a4t8jsatmPap9u0d1sJzBt7q1votYjDlpCoVSP
         lVm+j4YYERYkFLUee53glOWD1yJwzk9Ko3NC7YLVCsJipvWmYKuXvFemee+o12lMvSWz
         wp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521472; x=1697126272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZcQdif16KIsV/1ocyIAmtjZ1yEW/jfAGT5DH5ZGevU=;
        b=jwbNWN++AbnWBhXIcHzXHHahJOaSGFbaILMI667kxaNESKY1rrW70z402C3dCat3GJ
         AXPUyGLe7yS5iblSZPYZFeALXP8BKPFCAN2xj1PyFWQDKhz6ktk1Dq4g4TpPnRZxsZuw
         iH3rf26/a0mpBKbS0/46bJrkdSZwRwQjC0Nuwf9l9LUTqjkWYNSTOHvexf8wI9gB8ssC
         f80653Gujd50fQWLsKA2PU+qzPS0T4OmPwRBYhZkOvvTYUzqy4utu0xSptDq/yLjX+Ac
         6SdMrDIc102eNn2cbUVrjAIo18kC4PWCdxS+XwfZS0cK5uko6GZGXkILGXfcDQK+no/x
         XzNQ==
X-Gm-Message-State: AOJu0Yx8CyVqmD75ngeDpgW9HKCYB0sFRhk0E8JXGmzU4gP0io+bW3Uf
        YBgs9K0FmaAD5iryn+EOZJ1/tA==
X-Google-Smtp-Source: AGHT+IHj3KgFg4X3Xr+ezMStBQo1fMmV89Ktlr/kyhx9iyz1eOIitC1QjlqKnhb/zdCiKAYFtNDLWg==
X-Received: by 2002:adf:e9d0:0:b0:31f:f432:b541 with SMTP id l16-20020adfe9d0000000b0031ff432b541mr5241309wrn.69.1696521471952;
        Thu, 05 Oct 2023 08:57:51 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:51 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 21/21] MAINTAINERS: add entry for Google Tensor SoC
Date:   Thu,  5 Oct 2023 16:56:18 +0100
Message-ID: <20231005155618.700312-22-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add maintainers entry for the Google tensor SoC based
platforms.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..23cfc0799c04 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8836,6 +8836,17 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
 F:	drivers/firmware/google/
 
+GOOGLE TENSOR SoC SUPPORT
+M:	Peter Griffin <peter.griffin@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	arch/arm64/boot/dts/google/
+F:	drivers/clk/samsung/clk-gs101.c
+F:	include/dt-bindings/clock/clk-gs101.h
+F:	include/dt-bindings/interrupt-controller/gs101.h
+
 GPD POCKET FAN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.42.0.582.g8ccd20d70d-goog

