Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1F4E686978
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Feb 2023 16:03:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbjBAPDf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Feb 2023 10:03:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbjBAPDU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2023 10:03:20 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF63721C4
        for <linux-gpio@vger.kernel.org>; Wed,  1 Feb 2023 07:00:53 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso1593741wmp.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2023 07:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/K9COTcFlAS0U4RierMnuwuOF33gGwaSy7WkKbceLio=;
        b=p/mIW+z9sZEhKWaw1AJkTS2Zu7BhIw/LmqOCegv7o+hkHLMwxdO0ttGB735ElQUiP6
         OvDw5qlRmURo5VxVWJouTgJNAg/256p2jHe+RWbexnDLiexuDxYG66z8/gmqbacg16+E
         c7R7famAiPFfWTZIG43OUmCUmX1IluN/2c4frI54D+iP9aXOevp7rnJQM6cXHBCrvpD5
         oZg5Uw5jO8J3BN1cfp8HjchnjjQSB1rZaZQgv6YRNT4+S/xEotguQKe6ydILMjQ9DtAS
         kKRehybrLXynjzJrEu2Mv/UJ6zrKVwrblkPV1WSQ99YCxtSwPw3+huBfee8MQqfNPMof
         6flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/K9COTcFlAS0U4RierMnuwuOF33gGwaSy7WkKbceLio=;
        b=RH6afnR5rvQEvxcgAlL1/r/ke05qu3njc7VE9ujEa85laDRQiFrXN7nVeBwOh+RC3M
         AxSyKtZnpvqk45fgQzuC/IBAiqnc2LQkza7LmqsaDweVeHF8YcnzVUkndA8D1plMzAmW
         YRGW8idh/IYP9acXd7JX2EHoytO1i4X6aAtdf5E59bvUZAKOU+LPUmRMWmNdrV+Dt1RW
         jE5gE4IjGLcx3AFsLbph1jVXDS+fVLSLqwrgQI36FklzLA7U3ng7cP2/PvT4H7yVOF2V
         H7PtXbNZUxyR/n+qUdhOpzcdffJuI6FKqpbfUqNpoXq4SrYHgoHH6C73baNeeQG1+PPS
         pNow==
X-Gm-Message-State: AO0yUKWF79QokVRGEXLUyecDlgPbXeVZ96xVIvI8Kz08nFqyIBU8dBOt
        zQWmhN01HuenwEwQJKtbfbvfjQ==
X-Google-Smtp-Source: AK7set+cvxx+A6u/0XIDpmD66fIdcV03aPZBVGL7pbpgTOBCfVDRoPJBj2UYfsJh0iTd/FCBVR28dQ==
X-Received: by 2002:a7b:cd17:0:b0:3db:14d0:65be with SMTP id f23-20020a7bcd17000000b003db14d065bemr2277347wmj.34.1675263617793;
        Wed, 01 Feb 2023 07:00:17 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d64:a4e6:40a8:8e69])
        by smtp.gmail.com with ESMTPSA id f28-20020a5d58fc000000b002be5401ef5fsm18063754wrd.39.2023.02.01.07.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:00:17 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 0/2] pinctrl: qcom: add dt-bindings and driver for sa8775p-tlmm
Date:   Wed,  1 Feb 2023 16:00:09 +0100
Message-Id: <20230201150011.200613-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This series contains the device-tree bindings and the pinctrl driver for the
SA8775P platforms.

v2 -> v3 (Changes in DT bindings only)
- fix the gpio pattern property (platform has 148 GPIOs)
- add blank lines for better readability

v1 -> v2:
- squash several functions into bigger groups
- fixed the emacX_ptp functions (they were generated automatically and the
  script made two separate functions into one)
- fixed the compatible and DT bindings examples
- added missing DT properties
- made sure the bindings pass tests
- coding style fixes in the driver

Bartosz Golaszewski (1):
  dt-bindings: pinctrl: describe sa8775p-tlmm

Yadu MG (1):
  pinctrl: qcom: add the tlmm driver sa8775p platforms

 .../bindings/pinctrl/qcom,sa8775p-tlmm.yaml   |  138 ++
 drivers/pinctrl/qcom/Kconfig                  |    9 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-sa8775p.c        | 1537 +++++++++++++++++
 4 files changed, 1685 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sa8775p.c

-- 
2.37.2

