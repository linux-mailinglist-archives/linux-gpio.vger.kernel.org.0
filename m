Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1796A5B3BA6
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Sep 2022 17:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbiIIPQU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Sep 2022 11:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbiIIPQS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2022 11:16:18 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD371451DD
        for <linux-gpio@vger.kernel.org>; Fri,  9 Sep 2022 08:16:11 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id q21so3304557lfo.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Sep 2022 08:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=NUa3V8LEZ2/vDPoZ3wTXU0JCjw5IK+/h0qXIj+ixXts=;
        b=a7qBUwihziETQrL53Oy5msDh5lUbMPy/QjR7otB9c8m6nhptuhNxdYBJOxQlaP2eCg
         6zBOOtrFsr6VmX2fBJOatYS6fR+zDD+7wkfMagpqCBYXY/LKrazuI0O5Nl+D5HSaYFOg
         xJjaynjUCssmoMMUsJfIQu412Cp2EsUeJJFCiF9LhjyeXApL9yD1HP8TTHNzkQhX3Gw1
         t9IHi3+ZC5rfByIedRqouGbcKO3T2GJxL7ky9tth7zd6dwWDAiPBoEdQihPbpH/L8jA2
         H6Bh7iXAXzMegQzstgeVbAVextLad3hgUF7D5mpDROJZni7gXUwhm1C+dgaFVsaAuwbJ
         DXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=NUa3V8LEZ2/vDPoZ3wTXU0JCjw5IK+/h0qXIj+ixXts=;
        b=rsWutKIGbgWK6CfW5c6VcHaEXt3EJ49sAeUcMN0C8eamy4M637suqDgYJNBxLfNMug
         StEUkioQXXV3sp85ZVBbZfD0D4DgGwDCPUJfVBM5IL/M1yE5D3To95W/UD/MBucZ71QO
         OzWkNbGkaTfrbVIPaPO9aDQ+vlDmLTDTX5nppaiJlKd4xrSFRMtXJY2Sg8GUCjTRbOsB
         qz4g5vUfw3GMjE2aGG7kVRJ7bs9tkuv6Jk5SEE3zhAWWyh2hmikNucqoZr8YbAqURdD7
         N6hdRJp1BmLrje37LsaMnUBYxK6J5qU2GrHd2sbepivjqIt1uY0J+8nX3V2rbsX/au9G
         JIWw==
X-Gm-Message-State: ACgBeo1hpCpYX42rj4GR5mumVr4tiwTk+74lYDeo7V7EkDjE6j5eXf4G
        klAadO8hs0hsmsB7G3wR6FwPfA==
X-Google-Smtp-Source: AA6agR7v3BDcGAoPMFNRMOvrkFPYNQRBRmlEmUWVN3rQwS8Eb81UspLe2vlpgEFNc23LuS2zvoQQMg==
X-Received: by 2002:a05:6512:681:b0:489:d509:e076 with SMTP id t1-20020a056512068100b00489d509e076mr5084997lfe.618.1662736569815;
        Fri, 09 Sep 2022 08:16:09 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id i17-20020a2ea371000000b0025d5eb5dde7sm107674ljn.104.2022.09.09.08.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 08:16:09 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: samsung: for v6.1
Date:   Fri,  9 Sep 2022 17:16:05 +0200
Message-Id: <20220909151605.821685-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.1

for you to fetch changes up to 9d9292576810d0b36897718c24dfbc1a2835314b:

  dt-bindings: pinctrl: samsung: deprecate header with register constants (2022-08-19 16:54:10 +0300)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.1

1. Minor fix in order of initializing pinctrl driver - GPIOs should be
   configured before registering gpiolib.
2. Final steps to deprecated bindings headers with register constants.
   The constants were moved to include files in DTS directories, because
   these are not suitable for bindings.  Remove final references and
   mark binding header as deprecated to warn any users.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      dt-bindings: pinctrl: samsung: stop using bindings header with constants
      dt-bindings: pinctrl: samsung: deprecate header with register constants

Saravana Kannan (1):
      pinctrl: samsung: Finish initializing the gpios before registering them

 .../bindings/pinctrl/samsung,pinctrl-pins-cfg.yaml |  1 -
 .../bindings/pinctrl/samsung,pinctrl.yaml          | 63 ++++++++++------------
 drivers/pinctrl/samsung/pinctrl-samsung.c          |  8 +--
 include/dt-bindings/pinctrl/samsung.h              |  7 +++
 4 files changed, 38 insertions(+), 41 deletions(-)
