Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB907AFFDD
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 11:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjI0JZf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 05:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjI0JZe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 05:25:34 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1901E6
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 02:25:32 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50307acd445so16942730e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 02:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695806731; x=1696411531; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FL11vn92JSW/gte6QMDYC4P24LGOKiHH3kNcL8OX/Lc=;
        b=iEo5PnqTiY6/0I7HMzBNpiS665/QujPpFY6eXmBfQzS8WErj0MaRsLAHdVJUS2OikN
         F/3+yUBmThvVTW4hCv8HNP6/6eNYDFHu5UJ3y8HoyspljZbk+k+g+iNeTQJ9NLdtBQTF
         j9cVENLbNSvcemp0lNt04BTqwpwhJMCi20WN4awmcsF6+hl7bFF0Y7Q2oF27mddbrrPV
         6S299DGiQstZySngvDLNf1rrjv59uiZmPdLlxsBIEB9q08JKb5+jlA5LEJLEo63Yfb5S
         Gr4H+R3PrAqXjJhPJib3Ks9sFBUOHQ8dBe8NEQIkk0toBTrDlhwhMCYUWiQS2+c1w4Np
         y49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695806731; x=1696411531;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FL11vn92JSW/gte6QMDYC4P24LGOKiHH3kNcL8OX/Lc=;
        b=pCLyIre5PIOHHtJI2PMaMMeLXJ3MRxGIHwxZzNVP5vq0Yyn7PHnwqeryEc7+RcGmdz
         jE0rwwpbxsf5A2yD1OAVRp4IFiql8Sqm1kgBi9MN2YUz11hkMTvJWCs9AtRqnRYMuqEN
         kc6jqrJJtfbatDgfQPzlfmyGaojCCze8mIY9BmGH1XUQi0WhAAzNatfkwCu7/WmeSnm9
         adMItN2JHo9JPOpp1XoKFjRfgzmgPMxl3FpXENUfkImXktwdyQ2+CAbQR4sU6eapwXaF
         PWwfDO69CQDNclDEBLMUZW4Dj6gGa+WLVHVZm6EZipPUKqA4Z6kNcJ8Ho86ymaH1l7RG
         FkAg==
X-Gm-Message-State: AOJu0Yywl5+wjhWzZ7hmgnHGEInjldMtCnq7icRdwBtHwdRYb+3RoNC7
        wwKN7JavTjz3A8WNj+PJYzKARt8qxgb8Nh3epBk=
X-Google-Smtp-Source: AGHT+IHgD+F9jlZslj4a8Fg8dXvO7enrGDI9/eF6FYruTBvYvHYEx/BvqLp3EZlvUeFvcB2JcpjLYA==
X-Received: by 2002:ac2:5449:0:b0:503:2e6:6862 with SMTP id d9-20020ac25449000000b0050302e66862mr1096028lfn.32.1695806730664;
        Wed, 27 Sep 2023 02:25:30 -0700 (PDT)
Received: from [192.168.1.127] (i5C7438B3.versanet.de. [92.116.56.179])
        by smtp.gmail.com with ESMTPSA id c9-20020a05600c0ac900b0040646cf9fa7sm667861wmr.42.2023.09.27.02.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:25:30 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Subject: [libgpiod][PATCH 0/2] rust: bindings: drop unneeded Arc within
 Chip
Date:   Wed, 27 Sep 2023 11:25:22 +0200
Message-Id: <20230927-chip-drop-arc-v1-0-28013bf95948@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAL1E2UC/x3MTQqAIBBA4avErBswI6KuEi38mWogVEaIQLx70
 vJbvFcgkzBlWLsCQg9njqFh6DtwlwknIftm0EqPatEzuosTeokJjTicZk/W0kCTNtCaJHTw+/8
 2uNmeiaOHvdYPoyJq2GkAAAA=
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695806730; l=714;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=DY8BYFtHcSdqhkdS7zQ/17zmYVW40/XHIRq9mQ9Vz8A=;
 b=7sXytZfKKbreeCrwbSOzpnnY5nz9xcESP19igsjfMIRJtKJ9im5OCzGw0emioqjLKtBLv9+qL
 c0zmx5Ypl0eC617ASBO6/ecLtod51GND1gq00+U7ZtaHeF/L6rulFiY
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

While reviewing code for thread-safety. I realized that this structure
was a bit more complex than it should be...

To: Linux-GPIO <linux-gpio@vger.kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
Erik Schilling (2):
      bindings: rust: construct chip infos by reference
      bindings: rust: drop unneeded Arc within Chip

 bindings/rust/libgpiod/src/chip.rs | 83 +++++++++++++++-----------------------
 1 file changed, 33 insertions(+), 50 deletions(-)
---
base-commit: ced90e79217793957b11414f47f8aa8a77c7a2d5
change-id: 20230927-chip-drop-arc-57debbe1e52a

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

