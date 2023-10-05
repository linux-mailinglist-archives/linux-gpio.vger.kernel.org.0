Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 021A17B9F27
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 16:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233691AbjJEOS2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 10:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244410AbjJENxc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 09:53:32 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 164FC180
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 19:59:16 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-69361132a60so87380b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 19:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696474755; x=1697079555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ids3/+45hUvtPMVAGYEAW18IR7eG26OSuvk1q0KIeuI=;
        b=FGMGqy6NdreEQmknJnTxdfzb0g7+R+QZ5XXvrcschnSESAUJkX0aQRSl3gb8wuJfJj
         uxm6N9mGTpvXb4QH/5JaK1FWkBiyhRp5oOUR+51TjHDxy+9S0xRwccVLfLuPLCc0A2oc
         /MKDOrmBx3amZtSWFZds+tpLV1BM+Iqmu5e2euCYLNSVxhP6xm9WbykXc4QIJcLqlECX
         NBTQ5E6HmpAjYDNxtQ9KqNiYj9VV6mzorahh8ih8tnjAKusLG5jBOs+Kj/OY8SeoUyP/
         6R2fjghUlJlNMtFeh27+Wi9+jnvKDzUnH7J2LQaHIFcay96/njsWCWjL8PfcZFFAsw9Z
         Yo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696474755; x=1697079555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ids3/+45hUvtPMVAGYEAW18IR7eG26OSuvk1q0KIeuI=;
        b=iFA3JCXK0eVLC0XACX4hIwjYPebckitNKF7xwlvdaxrlQfueIElnMQvoVOO3gNpNHx
         fBir9Z1ONM2zdIbxW4Mc6AP1P7Ud2ypABUVuhLecyLo24SrWYeE7WdgV0GNI7r3ZHuK0
         njpHi7LFvc111FCaeemA1h+jkPfrg1tju+3Mew+9/6ZW+cAf3o0UzWyw5DCBhOSpRmuD
         OPkP/FuaGDhY+zAi30RH7l8QiD9twNwDtLdfti0BuY/TBbqsawo8Hz5Ix3SOXqjKA0pV
         KjzKEs7CcTcJnIPuxjHvysvNfyiEup2WZw4gsS5XrYygK4MHrs0piSdtI7IR0Kzg/SFh
         0l7A==
X-Gm-Message-State: AOJu0YwhvSNDiUuh8bM0895zGD8zpqatx/D6L3i78fErTb2Zntcq6hMr
        GKCfw581xSH3hLPSPARRXgimgA==
X-Google-Smtp-Source: AGHT+IHhyPq2bAIXq1Er7nrpaR11YBXxhlcU8ii3pCisXRHmjRUTM4omwHgQA+YxqvflG1dDFWM5wA==
X-Received: by 2002:a05:6a21:a587:b0:163:c167:964a with SMTP id gd7-20020a056a21a58700b00163c167964amr4845452pzc.1.1696474755450;
        Wed, 04 Oct 2023 19:59:15 -0700 (PDT)
Received: from octopus.. ([2400:4050:c3e1:100:a16d:fce2:497:afb7])
        by smtp.gmail.com with ESMTPSA id b18-20020a637152000000b005782ad723casm269265pgn.27.2023.10.04.19.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 19:59:15 -0700 (PDT)
From:   AKASHI Takahiro <takahiro.akashi@linaro.org>
To:     sudeep.holla@arm.com, cristian.marussi@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linus.walleij@linaro.org
Cc:     Oleksii_Moisieiev@epam.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        AKASHI Takahiro <takahiro.akashi@linaro.org>
Subject: [RFC v2 0/5] gpio: add pinctrl based generic gpio driver
Date:   Thu,  5 Oct 2023 11:58:38 +0900
Message-Id: <20231005025843.508689-1-takahiro.akashi@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a revised version of my previous RFC[1]. Although I modified
the commits to make them look SCMI-independent, they are still posted
as RFC because I have never tested them on real hardware.

(background)
I'm currently working on implementing SCMI pinctrl/gpio drivers
on U-Boot[2]. Although the pinctrl driver for the kernel[3] was submitted
by EPAM, it doesn't contain the gpio driver and I believe that we should
discuss a couple of points on the kernel side to finalize my design for
U-Boot. 

So this RFC is intended for reviews, especially to raise some issues.

1) how to obtain a value on an input pin
   All the existing gpio drivers are set to obtain a value on an input
   pin by accessing the hardware directly. In SCMI case, however, this is
   just impossible in its nature and must be supported via a protocol
   using "Input-value" configuration type. (See the spec[4], table-23.)

   The current pinconf framework is missing the feature (the pinconf
   parameter and a helper function). See patch#1, #2 and #3.

   Please note that there is an issue around the pin configuration in
   EPAM's current pinctrl driver as I commented[5].

2) DT bindings
   I would like to propose a generic binding for pinctrl based gpio driver.
   This allows a "consumer" driver to handle gpio pins like as other
   normal gpio controllers support. (patch#5)

3) generic GPIO driver
   Based on (2), I tried to prototype a generic driver in patch#4.
   Thanks to a set of existing pinctrl_gpio helper functions, except (1),
   It seems that the driver can be implemented not relying on pin controller
   specific code, at least for SCMI pinctrl.

I will appreciate any comments.

-Takahiro Akashi

[1] https://lkml.iu.edu//hypermail/linux/kernel/2310.0/00362.html
[2] https://lists.denx.de/pipermail/u-boot/2023-September/529765.html
[3] https://lkml.iu.edu/hypermail/linux/kernel/2308.1/01082.html
[4] https://developer.arm.com/documentation/den0056/
[5] https://lkml.iu.edu/hypermail/linux/kernel/2308.2/07483.html

AKASHI Takahiro (5):
  pinctrl: define PIN_CONFIG_INPUT
  pinctrl: always export pin_config_get_for_pin()
  pinctrl: add pinctrl_gpio_get_config()
  gpio: add pinctrl based generic gpio driver
  dt-bindings: gpio: Add bindings for pinctrl based generic gpio driver

 .../bindings/gpio/pin-control-gpio.yaml       |  55 ++++++
 drivers/gpio/Kconfig                          |   7 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-by-pinctrl.c                | 165 ++++++++++++++++++
 drivers/pinctrl/core.c                        |  19 ++
 drivers/pinctrl/pinconf.h                     |  10 +-
 include/linux/pinctrl/consumer.h              |   8 +
 include/linux/pinctrl/pinconf-generic.h       |   5 +
 8 files changed, 268 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
 create mode 100644 drivers/gpio/gpio-by-pinctrl.c

-- 
2.34.1

