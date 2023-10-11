Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAF617C49A8
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 08:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343923AbjJKGLB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 02:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344223AbjJKGK7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 02:10:59 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0CD39B
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 23:10:53 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5041cc983f9so7798705e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 23:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697004652; x=1697609452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rs18PpUTYGWS2Th+7r2apLAIVKCdnE29uQIUA8oLSLc=;
        b=IFS/XObEQu8N2atOHdejXRWDS0/5390hx78wtOwEkAf0xWTiX7pMl2cA/B+WrLGgH+
         /5O7Dd5XkTkNl5vqD7NZ2mMr+1N6Y5KchOcOuQSpIxCwe9Fxw3lDkIHft5yEwiX0XLbk
         efEUqB74Owv+jZlPljD4Z9WjfrrV8ZRqmIqMDjtKU8vjTN99Bek2ipbp72wto86743m6
         VghDbl6TDBDAiy5V6VsfOGfQW6+oFHM7YVMU4/lfFbzg5tex22tyIDpDqnCahHN6+GNf
         9JGAWlQdQB/W0DctVllr9VLMYXjF82E7ATj7C+xZ11NVMZRWZ+yJVyNKVWQEROefJAZE
         AFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697004652; x=1697609452;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rs18PpUTYGWS2Th+7r2apLAIVKCdnE29uQIUA8oLSLc=;
        b=KdRFd/sua6KLnjQjMhe3d3F8MB4d7myJ1On5mj3vIaTh6PWIaSE56IAaI/1OD+UTRB
         0exV9q9Pqi1DodELluWEj1P5yncxqK0QY5LJNMoLDz1shggNka1UqfluzMH/ryvD7DzB
         TEn8aH7pOUIGctpIHVpr0rZG01FBhuYlu8OSWyHLuYwRvVzH/8KdE67NdJEeS7aaqPN1
         nuE6sdi1T9/TPGvl144sX/NhhMtzuHDxFOlzBFNnYtwYIN/wry9S9BSUz2qXt6lWPBoD
         d814d+nMwEC0MeJmt1fnjkLoJ4gH0q91U+wkW7tX28OYFooxu5ACmGPbg7CryHAXjO2t
         HE7w==
X-Gm-Message-State: AOJu0YwBySPX74rwjNf/dq9dkYLce9Do+SNbejjcZAPjmCSE0exNUSK1
        RlUhdw/xb7ByOXbWGR1GgcpS+w==
X-Google-Smtp-Source: AGHT+IE89HVDFcFfC44P/nItl+VCGsnDCkj5yP8HJ1NhznNZ/lQEYkHEO99NParLo+oTfKlWtRa/Pg==
X-Received: by 2002:a19:7b03:0:b0:500:aed0:cb1b with SMTP id w3-20020a197b03000000b00500aed0cb1bmr16439849lfc.24.1697004651641;
        Tue, 10 Oct 2023 23:10:51 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.123])
        by smtp.gmail.com with ESMTPSA id q14-20020ac24a6e000000b00504211d2a73sm2102818lfp.230.2023.10.10.23.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 23:10:50 -0700 (PDT)
Message-ID: <92de302a-f6b5-465c-a5da-2a711861089e@linaro.org>
Date:   Wed, 11 Oct 2023 07:10:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
Content-Language: en-US
To:     Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com
Cc:     andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi, Peter,

On 10/10/23 23:49, Peter Griffin wrote:
> Note 3: In `dt-bindings: pinctrl: samsung: add google,gs101-pinctrl
> compatible` I tried to narrow the interrupts check to
> google,gs101-pinctrl but I still see a warning: gs101-oriole.dtb:
> pinctrl@174d0000: interrupts: [[0, 0, 4],[..] is too long If anyone can
> educate me on what I've done wrong here it would be most appreciated!

I guess the initial definition of the number of interrupts should
include the largest min/maxItems. I no longer see the warning with this
change:

diff --git
a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 2464bc43aacb..6dc648490668 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -59,7 +59,8 @@ properties:
   interrupts:
     description:
       Required for GPIO banks supporting external GPIO interrupts.
-    maxItems: 1
+    minItems: 1
+    maxItems: 50

   power-domains:
     maxItems: 1
