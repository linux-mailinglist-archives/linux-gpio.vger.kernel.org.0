Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6961B7B9F1E
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 16:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbjJEOS3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 10:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244373AbjJENxR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 09:53:17 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DA213A
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 19:59:24 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6c61dd1c229so94833a34.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 19:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696474763; x=1697079563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C71OcQAzBT261vJLaVS0ZLT3a6uuXRpHLmHkJwsnefw=;
        b=P8CD0HukQ+P5Uo9B8X121NvvGG8A+1PT8xI9Ob5+8tDdJ1mW69fs375RdP0e3MlFzu
         p8H2kuzDbPhyhcIgBO6wsL8SCE/1Bu9HFZexj6nv9jIxBqALBcSu+57SnSVPNBo4z6AR
         QnxJwhsQwl8zIV0dn6aZ/aYtU5lU/73VhWm2+RIFEgsKqWKtFbaeOzamvCHUNyytPamo
         MqWZCAqOC/NtP6wSTm81Eiakp73JcqO2F7br4dCJlZk7t/XO2fpBj5S55ZzDWo7BZlRE
         PwQK1TXWlArdbfCAmQa5AR07wwNq5UeQ4sV2etlQQ3UNpOeQpF15B0Uyg7QPbNhagzn1
         r3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696474763; x=1697079563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C71OcQAzBT261vJLaVS0ZLT3a6uuXRpHLmHkJwsnefw=;
        b=KtInm9q1qvODpb6n44M+A31nwPw4DMgOQG3SXfCB40SiuXynrh65keaLh3wqkz9B3e
         Vjspv3xmUNjjRNBsd8G1+imEOH2qxLsS6H+m/xDXgVc/ChHb7YlmOr8dq82bkBPKop/l
         xVy2PhYeoCKb3uoP7Hjwy/Kp6JRoRzF1HyXD9nHpmIg+QWC1azlgoNeCmANxBOyyvvje
         j4hZ4Oxnz/g2mf2Mnowstp5fRnKgEcrq0mJzY371i9DPenPuNEmEM5wkSRh7yy6HZB2P
         KNyWsFfKFZmdVOb8d4OS2pmEEdTHi3cfzcO7kTUC4wKDBWYQHbvSS/sW9wtjTf66d4Ey
         RJnw==
X-Gm-Message-State: AOJu0YzhYDdzp0yO2EOpmyqO9WYkft4TdjwfiqO2pN9nHCQW7AdoSdcT
        Im/d7Ihh27azgI+WW8pbt9iAXw==
X-Google-Smtp-Source: AGHT+IFLE3a+7Vp/OvWCFi9446MZ5SR2US5WlY9g/kRa6BRPFqm4JfQA8hECuQL2KLgO1V/YM25PiQ==
X-Received: by 2002:a05:6830:4867:b0:6bf:500f:b570 with SMTP id dx7-20020a056830486700b006bf500fb570mr3559438otb.3.1696474763244;
        Wed, 04 Oct 2023 19:59:23 -0700 (PDT)
Received: from octopus.. ([2400:4050:c3e1:100:a16d:fce2:497:afb7])
        by smtp.gmail.com with ESMTPSA id b18-20020a637152000000b005782ad723casm269265pgn.27.2023.10.04.19.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 19:59:22 -0700 (PDT)
From:   AKASHI Takahiro <takahiro.akashi@linaro.org>
To:     sudeep.holla@arm.com, cristian.marussi@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linus.walleij@linaro.org
Cc:     Oleksii_Moisieiev@epam.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        AKASHI Takahiro <takahiro.akashi@linaro.org>
Subject: [RFC v2 1/5] pinctrl: define PIN_CONFIG_INPUT
Date:   Thu,  5 Oct 2023 11:58:39 +0900
Message-Id: <20231005025843.508689-2-takahiro.akashi@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231005025843.508689-1-takahiro.akashi@linaro.org>
References: <20231005025843.508689-1-takahiro.akashi@linaro.org>
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

This configuration is intended to be used to allow a pin controller based
GPIO driver to obtain a value at a gpio input pin.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
---
RFC v2 (Oct 5, 2023)
* improve a comment against @PIN_CONFIG_INPUT as per Linus
RFC(Oct 2, 2023)
---
 include/linux/pinctrl/pinconf-generic.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index d74b7a4ea154..da0d80aa532d 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -67,6 +67,10 @@ struct pinctrl_map;
  *	passed as argument. The argument is in mA.
  * @PIN_CONFIG_DRIVE_STRENGTH_UA: the pin will sink or source at most the current
  *	passed as argument. The argument is in uA.
+ * @PIN_CONFIG_INPUT: This will obtain a value on an input pin. To put a line
+ *	into input mode, @PIN_CONFIG_INPUT_ENABLE must be used. Otherwise,
+ *	an error will be returned. The returned argument is 1 for logic high
+ *	and 0 for logic low.
  * @PIN_CONFIG_INPUT_DEBOUNCE: this will configure the pin to debounce mode,
  *	which means it will wait for signals to settle when reading inputs. The
  *	argument gives the debounce time in usecs. Setting the
@@ -128,6 +132,7 @@ enum pin_config_param {
 	PIN_CONFIG_DRIVE_PUSH_PULL,
 	PIN_CONFIG_DRIVE_STRENGTH,
 	PIN_CONFIG_DRIVE_STRENGTH_UA,
+	PIN_CONFIG_INPUT,
 	PIN_CONFIG_INPUT_DEBOUNCE,
 	PIN_CONFIG_INPUT_ENABLE,
 	PIN_CONFIG_INPUT_SCHMITT,
-- 
2.34.1

