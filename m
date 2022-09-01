Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACCFF5A9D04
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 18:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234975AbiIAQZO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 12:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233101AbiIAQZM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 12:25:12 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98FC41E3E2
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 09:25:07 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id z23so15581281ljk.1
        for <linux-gpio@vger.kernel.org>; Thu, 01 Sep 2022 09:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Z2p2qpeENY/bfLp1CRaMnL2NjhMX1TdPvMFYupAAiu4=;
        b=aRiHGqAVishB//yXk4AeOM7oaXDHuVe5bJ3jfBaYaM2rAZ9httqN5u9zGgSHZLrW44
         TXYosKhUZWsqT70C1o8PKlJB+LEkcV7w2BAgr902JUe6QROqauReVvGwyG1kcd0gNpBa
         n2VKUGikEcwBLMVfzOEPQVt+0jEiEjtsBWlkvygz2gxxRfrbWUYan3pt3wkj5s4JouG+
         lg92jn0SadFM05Qnvb7gygBHFpEEBltx4dpUnQoQoZUy+0uKRwdst0oox3+QI9voI50F
         kJywC2TChygY/oOr2Hdj5XKiE+YMW4aH6MSpecFLZ3dia3IDKlcmAavWH2HORoTIsgWp
         7dPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Z2p2qpeENY/bfLp1CRaMnL2NjhMX1TdPvMFYupAAiu4=;
        b=zr1aHttkTxjzvVrH47YlHqIEKn9wW+SAG56AtaELWUdtdMDZhB1nVQ4eqJaSqS31I9
         ffTU6e8Rdz3eeS14oLA3ab09pOUj4I198vTHIDhS3Zx1iAPV2NeayayHXS9IO7pxjZP0
         TWcO+Y/xA7VzXLx/ZUC5JWGuY9Kv8gkBSG/5bRwfBDz69Q00+NhYYLAlfk26fYIBxV41
         yTLLmDhH6k//5CIX13viIgRz1XvQ1hQjHIgYaxi+6EzqD0hf3WNaVTdjaqvgQZsvvOT6
         9Y7DDI2GmqVHVjb9+1A/SzkWQsX2Ba2JPD3etI+odm1emOxDEotcM2KBGU970FRhJj0D
         PkWg==
X-Gm-Message-State: ACgBeo2qR6le3mbbw8hK1FbiatmLQ6ex27oHoESu9n2tpHMisYaJrlto
        r0cHTXIShqkYWHZSO9FXqSVBUlB1L3Rqd2E9
X-Google-Smtp-Source: AA6agR6weCHVEDSehESWY6ZEw5fnjk/M+7jfqaVj7HH4Qunmhzek/56LXlLukCpUJlJl6fQWSyn32g==
X-Received: by 2002:a05:651c:a12:b0:268:c715:910f with SMTP id k18-20020a05651c0a1200b00268c715910fmr857174ljq.484.1662049505589;
        Thu, 01 Sep 2022 09:25:05 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id u7-20020a05651220c700b00494978b0caesm460174lfr.276.2022.09.01.09.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 09:25:04 -0700 (PDT)
Message-ID: <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org>
Date:   Thu, 1 Sep 2022 19:25:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Content-Language: en-US
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeH-003t9A-3K@rmk-PC.armlinux.org.uk>
 <426469c1-13cc-178b-4904-09439d7788e8@linaro.org>
 <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
 <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
 <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk>
 <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
 <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 01/09/2022 18:56, Russell King (Oracle) wrote:
> 
> 8<===
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> Subject: [PATCH] dt-bindings: mfd: add binding for Apple Mac System Management
>  Controller
> 
> Add a DT binding for the Apple Mac System Management Controller.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Yes, looks good.

I won't add Reviewed-by tag, because I think it would confuse Patchwork,
so please send a v2 at some point.

Best regards,
Krzysztof
