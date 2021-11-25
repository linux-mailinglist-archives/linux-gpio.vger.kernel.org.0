Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9A245E2BB
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 22:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244309AbhKYVwl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 16:52:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351714AbhKYVuk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 16:50:40 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 685B5C06179E;
        Thu, 25 Nov 2021 13:35:34 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 207so14790680ljf.10;
        Thu, 25 Nov 2021 13:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lBUP8sB2aI1FUk/vnaXhsK1BHbgXbVg30dlWrCLTWIs=;
        b=D0huGNvruLhANQVyQUxLJm8yi5e65QWLmAstbFw8hg2z5ysyXHpTAaGnpWiruYC3jA
         /o2lMcaSBhyRsp62PXsP36HB6M5nq2d52h/7BmXDIlHzx5PXO+aiICoPAkxSb+UsUuHX
         uFkFCR5q/7UPuk/UaaI/MEU3lDXD9nU8Z8IL2MviL1W2Of+Ors2TawTCtEZUqMmJ95zj
         U85FZyn43khUBvngVyXrqgGigsuAEMrGfZ4RwEDbNm+ouVv7WYBuXbsDub1Y/TDeD7iU
         S7eOSm3mQEPrOMPowkHGnExf0sXckFUCuRPJqmtLGGkId4BTo88ORk+nvi4wH3O8j1qo
         nE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lBUP8sB2aI1FUk/vnaXhsK1BHbgXbVg30dlWrCLTWIs=;
        b=PEdGoJ9QgVCkbym1vY/5pTTQ3tRLaN0gA7ao4EDU1cvJ/W2SEivMo0/oM2fLfNZ3PC
         dI9tItXjgsNvEVOsXMwLQglnEXHEDl3E24N57mFVZUcKFiE/ldA7HSsiwZJkVEoTBESm
         JIbUj9UfYBvcWDaenjXGPJQwRhrkbKxjrabs7sSVxOB7Aa7aqPrFGD8B2ns9QW88wJed
         J3SHUwwb7Y+UPA+hKAUS19SNbeV1fEZiD+xx0R0v3a3NqMnfXc+F4EeB16NZS7HYzU3+
         tFC+DaMusnrXB16iwK50qUgKXHbQs6n4AxM7W/JZZ95zL+TWdDXO/0HEqvbFvSwFzzAn
         tMxQ==
X-Gm-Message-State: AOAM532c6JCF12mIsnL4hXxINgk7TgJCMbLRSQu4iYLsqQOEShIyNcCp
        xRQkKExgCAPpUIhxgOgXBco=
X-Google-Smtp-Source: ABdhPJw2P+YDrYLtFq/v5NC7HQsvt9vt1z9mU9XNVKJTWw421HTxtK3SrGLPyDoW9ODVvF3GnC/ruQ==
X-Received: by 2002:a2e:a706:: with SMTP id s6mr27876441lje.370.1637876132757;
        Thu, 25 Nov 2021 13:35:32 -0800 (PST)
Received: from localhost.localdomain (public-gprs212807.centertel.pl. [46.134.170.136])
        by smtp.googlemail.com with ESMTPSA id 76sm318014ljj.69.2021.11.25.13.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:35:32 -0800 (PST)
From:   Dominik Kobinski <dominikkobinski314@gmail.com>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>
Subject: [PATCH v2,0/5] Add pm8226 SPMI regulators
Date:   Thu, 25 Nov 2021 22:34:51 +0100
Message-Id: <20211125213451.62010-1-dominikkobinski314@gmail.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series enables pm8226 SPMI regulators commonly used on msm8x26 platforms.
It is a v2 of this series : https://patchwork.kernel.org/project/linux-arm-msm/list/?series=584741

Changes since v1:
 - Add spmi regulators node in qcom-pm8226.dtsi to enable probing them.

Dominik Kobinski (5):
  pinctrl: qcom: spmi-gpio: Add pm8226 compatibility
  dt-bindings: pinctrl: qcom: pmic-gpio: Document pm8226 compatible
  dt-bindings: regulator: qcom: spmi-regulator: Document pm8226
    compatible
  regulator: qcom_spmi: Add pm8226 regulators
  arm: dts: qcom: pm8226: Support SPMI regulators on PMIC sid 1

 .../bindings/pinctrl/qcom,pmic-gpio.yaml      |  1 +
 .../regulator/qcom,spmi-regulator.txt         |  1 +
 arch/arm/boot/dts/qcom-pm8226.dtsi            |  4 ++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      |  1 +
 drivers/regulator/qcom_spmi-regulator.c       | 39 +++++++++++++++++++
 5 files changed, 46 insertions(+)

-- 
2.34.0

