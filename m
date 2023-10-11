Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5017A7C5C20
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 20:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235265AbjJKSu3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 14:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346743AbjJKStq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 14:49:46 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A60D6
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 11:49:43 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-323168869daso142969f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 11:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050181; x=1697654981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdsParCuymjlmImw/5r7LgWUbKh/XK9/vZ2/JG1KUVA=;
        b=PaOvRb7Yvxi9w0f130SZo7wgZgVYlMfMs9rE9c9DryFw+3X2d+lptCDYcALdt2Ee5F
         D4s4vYsNGAoTPnhrPEa+YQxR6B8Lpl6uHXEw/To6+eVlU4gI+jXDRhSQPlnodLQ+2nhQ
         qwYxKPAMISEWs0jFpsQtaHDKdM4Ka1LSePSgrRgoqzce2/C/SFndM6CRDbPkPFvO8RVc
         um38ESEhpBQ/7bdIGjCLI85xP8SbsT9selN0/6jIg2QNX4RepA31SrypwN+hyj6MAZA1
         qQxFlRFH+dVALR+AVm2XgvqjqkzXVV44w1elrPZ09I4FvZg08OFd7hDtgFUxkPGbCRBS
         0GXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050181; x=1697654981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdsParCuymjlmImw/5r7LgWUbKh/XK9/vZ2/JG1KUVA=;
        b=WvP88Njot5b92zRrtKTfJ8xlwZviLYDRrglxCjvuuFnr+JqaZvGzOJENa0OvHppod0
         W6EWLbLpAJ5GEDN8n8beMomzRf/lAmejEggHWzl5xEneg7PlLdoXhQU5avokjIKimUg8
         3ljJ2GwOE2FMHpV1K5GVRgONpBMPMxgd5zBvRdmCekHFhCTPh6xbTI7ZmZM9WdtxDKpe
         wHLULKmphazMs7xUSOtFhGyu/aLATGhSUffmWjeve3/Ff0E+Szv3bnHsOUSIms+v7Rh3
         0dITP+k+W3GerkaXzB0GGRYMoE4oBvyd59txALzxS6+spwb6DKi+6ahW0IJQW3l9Gl+Q
         gEHQ==
X-Gm-Message-State: AOJu0YxxL05ormikrCzIYQ1Hg03TDjMyMVcXQgNxuVq30qALFz3S1xT6
        E64Wd80NChZwEuPK4ESvV82Hlw==
X-Google-Smtp-Source: AGHT+IFBklXaphM/CWCVEBadRe6eZJrH2hObJzvWcKnrEkFzR9HfnZ6RvER0PV3n72K21bArq7jmlA==
X-Received: by 2002:a5d:4cc1:0:b0:324:885f:f7fd with SMTP id c1-20020a5d4cc1000000b00324885ff7fdmr19347507wrt.15.1697050181726;
        Wed, 11 Oct 2023 11:49:41 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:41 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v3 20/20] MAINTAINERS: add entry for Google Tensor SoC
Date:   Wed, 11 Oct 2023 19:48:23 +0100
Message-ID: <20231011184823.443959-21-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add maintainers entry for the Google tensor SoC based
platforms.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..149a0c364309 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8836,6 +8836,16 @@ S:	Maintained
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
+F:	include/dt-bindings/clock/google,clk-gs101.h
+
 GPD POCKET FAN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.42.0.655.g421f12c284-goog

