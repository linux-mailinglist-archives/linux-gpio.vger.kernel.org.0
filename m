Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E56047AF032
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Sep 2023 18:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235155AbjIZQDJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Sep 2023 12:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235107AbjIZQDI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2023 12:03:08 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A923194
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 09:03:01 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so1099395666b.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 09:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1695744179; x=1696348979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MYMcbgNdZdJAg/wlBeRETTfly0wLMXAdsUptQLiijU4=;
        b=FYKpupANHnEtEcLPfvQwwPO4rAmRxa2/GzHC9FOWnXa9XkOvqcK9C4hUe1NsnQvzWv
         KWq0MdkGrQXHcxu/dPlfPYb/ANzIOkImFY7YQNWYo4SsEv2LIoPFOduOoR8awKh6a7ji
         lBaIZ2IT4zyC9Bi0OtJTwAmgDLan+whLhqT6ybmDkabyNv4Luz8ub/S4cMK3UeZvvOpS
         mwaEXZbSBRKbNiYYTvjDjwmJPHY1QBHFXGHMJVXndibZ1zuErUp+nPE0J9pXQLMcI0/O
         ddkC7RcjQgbqgubr6Vu2JCT2OKK4zSGE1b/3ktIEcCUTf6U+RAn9YlTBYxZTkYah6JHd
         lHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695744179; x=1696348979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYMcbgNdZdJAg/wlBeRETTfly0wLMXAdsUptQLiijU4=;
        b=F3UdN/MJTDaF3G3AEhfZkVjS/rI48DuA3kneo7s5xd7tQfqpfnho1Gr+jOpUYC36Ts
         L9ZgCk5LIC4UP5iR5P7szkNRaD8LqbTijpvbppTxHg/KAUccnI+eK0iMYegXMVlpglbo
         wfRbfrqCHNcfPNP5lMd8BOioZ278TE6A2pXRTlDA+Bnc2Nfzab7w2qGqFmp+XBd/9ujV
         Q6W+FwyoaB0f4NkxMjwii2JCmiNPlY7sp0+GUqL51kFfCAL5U3ACyG4uLESeymgKEs2p
         35KcQEpnoZWQ6DHpZefmq69X69sfT3nfwCOqX336a0QydcS5OMdR4dBG+8IMFtPY0+1L
         /UpQ==
X-Gm-Message-State: AOJu0YytZZXZFRqlk22nf7tjxbuX78iudzaxItM2lq+7vaVr5AlF88Jh
        LYQY9p9bea+B2tpQtY3MCEcMCA==
X-Google-Smtp-Source: AGHT+IEb4Vf1eq+ig0a1Iw0VVVhYpHmBeCCC8UWxQ7E//iMPQBsAsI6z99sQrfaI3M0SuFC4M0N7Gg==
X-Received: by 2002:a17:906:e50:b0:9ae:7433:aec6 with SMTP id q16-20020a1709060e5000b009ae7433aec6mr8586774eji.60.1695744179436;
        Tue, 26 Sep 2023 09:02:59 -0700 (PDT)
Received: from fedora.. (dh207-99-138.xnet.hr. [88.207.99.138])
        by smtp.googlemail.com with ESMTPSA id d4-20020a170906370400b0099bd8c1f67esm7980174ejc.109.2023.09.26.09.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 09:02:58 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     wsa@kernel.org, codrin.ciubotariu@microchip.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@armlinux.org.uk, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH] i2c: core: dont change pinmux state to GPIO during recovery setup
Date:   Tue, 26 Sep 2023 18:01:20 +0200
Message-ID: <20230926160255.330417-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Ever since PXA I2C driver was moved to the generic I2C recovery, I2C has
stopped working completely on Armada 3720 if the pins are specified in DTS.

After a while it was traced down to the only difference being that PXA
driver did not change the pinmux state to GPIO before trying to acquire the
GPIO pins.
And indeed as soon as this call is removed I2C starts working.

To me it seems that this call is not required at all as devm_gpiod_get()
will result in the pinmux state being changed to GPIO via the pinmux
set_mux() op.

Fixes: 0b01392c18b9 ("i2c: pxa: move to generic GPIO recovery")
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/i2c/i2c-core-base.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 60746652fd52..b34d939078a1 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -359,13 +359,6 @@ static int i2c_gpio_init_generic_recovery(struct i2c_adapter *adap)
 	if (bri->recover_bus && bri->recover_bus != i2c_generic_scl_recovery)
 		return 0;
 
-	/*
-	 * pins might be taken as GPIO, so we should inform pinctrl about
-	 * this and move the state to GPIO
-	 */
-	if (bri->pinctrl)
-		pinctrl_select_state(bri->pinctrl, bri->pins_gpio);
-
 	/*
 	 * if there is incomplete or no recovery information, see if generic
 	 * GPIO recovery is available
-- 
2.41.0

