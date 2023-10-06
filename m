Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE4C7BC0E3
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 23:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233589AbjJFVEW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 17:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233541AbjJFVEV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 17:04:21 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C506BD
        for <linux-gpio@vger.kernel.org>; Fri,  6 Oct 2023 14:04:20 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40572aeb73cso23217205e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2023 14:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696626258; x=1697231058; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YQRexPV+8Vov0pv0hXh9flhYegE8FCFTJLg0B0fm1UU=;
        b=w5TrUncv9143goriUWgOma5iLtnXqrOTHjZG0R6ZcwSIvufqB1jXCEAI/T1nY2Nx4j
         ikKEvJBmIwihHBCNmARS5k4NJIUcYyCRepx/LlzqBCtld/UATmC7GeAcrm2ZwsGheAza
         orjNHwlwE0+qZ6OksHhYHZyk7n6vJxfRRfq3le45Hv9clGBcEWruBrsUZHF98ehOpUJF
         WSDnWd52ooK0ugz9X2kTmz0nDQ3JqqSUMbnkAijy+G2Nk4DBvCLJrxjdYy5k/UsXnUzg
         hDiT48Bbl8nZV2XDPO+YWwlPqEQ2XrN35ngUmpxM9BpoMYXusPY4zrFpguprNK99jP7o
         sgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696626258; x=1697231058;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQRexPV+8Vov0pv0hXh9flhYegE8FCFTJLg0B0fm1UU=;
        b=HGADBK98b72v0ZxutrpqZY994OqtFFD9/m91BkGUaQUOSdxGD9iZrcsY6SwJ3TZWCe
         bmO0hAQFmDwSCxpiLPCMCaEvQWpC+VAXYd079fXzRZ+AQrjq8rtdgzpYbcr8GjhSl5SP
         HdL9lBQehbhqADXqxdL57wXKAYxkfEecsL5QTRgpcrIKrU984RKW/2KQG2QaHV7uGszS
         tnHvKi52fkGjD5ORxDifHbfP3NApfHaDEDTt69Pa3Zg7J6S+Va6qrqU0+X0uE8r4wVCQ
         DlYzsguR2ppsAIqRHuuHne2MRLAdZHvNoYMgumNw5AIf4/it3wHSOHLbtdyWy9+ByZ9y
         bflg==
X-Gm-Message-State: AOJu0Yyn+jENzN3YYLLgaYGmLpLAmfAPWU90/Y75zxsZBn257iAxUCDW
        fBCuJzIyMj2XJ0cdFzjCTKQ8wA==
X-Google-Smtp-Source: AGHT+IFfVa55Z0k+xnzz6DmXmsyHHjRtKJosliwG8nh/znIKetArdy/zlpieRb8IVEp34SRLXRv2yA==
X-Received: by 2002:adf:fc09:0:b0:31c:7ada:5e05 with SMTP id i9-20020adffc09000000b0031c7ada5e05mr7459255wrr.51.1696626258538;
        Fri, 06 Oct 2023 14:04:18 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id d25-20020ac25459000000b00501ce28db76sm432993lfn.291.2023.10.06.14.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 14:04:18 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/2] Fix some realtek driver warnings
Date:   Fri, 06 Oct 2023 23:04:17 +0200
Message-Id: <20231006-fix-realtek-warnings-v1-0-09af253312ba@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFF2IGUC/x2MwQqDMBAFf0X27EJiTUV/RXoI+kyXSpSNaCH47
 w09DsxMpgQVJBqqTIpTkmyxgK0rmt4+BrDMhakxzcMa0/IiX1b49cCHL69RYkg82afzi0PfwVF
 Jd0Xx/tvxdd8/r8qLKmYAAAA=
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tzuyi Chang <tychang@realtek.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (2):
      pinctrl: realtek: Tag unused pins as __maybe_unused
      pinctrl: realtek: Fix some NULL dereference warnings

 drivers/pinctrl/realtek/pinctrl-rtd.c      | 10 +++++++++-
 drivers/pinctrl/realtek/pinctrl-rtd1315e.c |  3 ++-
 drivers/pinctrl/realtek/pinctrl-rtd1319d.c |  3 ++-
 3 files changed, 13 insertions(+), 3 deletions(-)
---
base-commit: e8b4ff6a856d02ee64a6023edf45e11827badeef
change-id: 20231004-fix-realtek-warnings-c165af5e97e5

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

