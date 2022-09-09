Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB925B33BC
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Sep 2022 11:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiIIJYq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Sep 2022 05:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231302AbiIIJYL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2022 05:24:11 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343D3131EC4
        for <linux-gpio@vger.kernel.org>; Fri,  9 Sep 2022 02:23:20 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id s10so465837ljp.5
        for <linux-gpio@vger.kernel.org>; Fri, 09 Sep 2022 02:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=oUAKSCEAR1eaSoD5ZbdisQXgEBDGloX5ti1fePK4Ba4=;
        b=jep4mNoJlbxhCd+mLgOe4PyTlbpu8BYoa5rAISeZqUWtFPFENWIa7c1us/ckeMKC2m
         FxmBrFsFUNd61Vz5G3jAVWg4yK8sLHHv9R8iCCI9eCAt/rdqeuCTh86valkGqUY0bu8I
         +wSZykUg/NUE9XF+5aAB0hwAUa2Q82Litq6PqJWxPxMt+4bgq6bnSpWSssDAStcnifFr
         yuokLGJkPLKl91lfchhv6kyQfrPBCzZEMgfzx7md5fB96b1QdyPi7xWIUEJPXFcx4aY1
         wh8v8za8ATE7QBP+0gojpeONcH6ZfLLdbLoL9tZl7As3v0BsEPpiun5EorsJAMMCaYmX
         wwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=oUAKSCEAR1eaSoD5ZbdisQXgEBDGloX5ti1fePK4Ba4=;
        b=y5qK5lu7qkF4+HLvxejFhNAhoLYPUIpGrBBWPKIjLuzftjHOqKYx22UNPFBRzhY5O0
         kxNAOrmnf5gL1bPwgFJMrGqafv9IzydV/ajTd9a3vzZBBD8+bhSP/oHarSISyI62HxP9
         ygNnql1iTJ2/tSTdWth5eE/Q6miRkWUD1JObXm/hH2PGbcS9qwrDEW7mk/zlEGXKW0kD
         eA9CMjudie0dVY37EUZf4nZj/wmyPUHZuPsI8GJtvsQaoLjF7rfUjpZpCldIBFHKtLUF
         uOm7C+2YFCeWPQgh3aJLKJDQFpGE5bpTa8MDAgVGxGAiGsv7hWk6RzaWxSR9ZyMlWp5c
         v2Ng==
X-Gm-Message-State: ACgBeo3E4E/0wOIbnHJiUi4c/P89YD+KoWHVI2Ksj9HsDxgLsNAtigu3
        me5ya7CLWEkwrDgkEvqBgvVEK8imPWFMuA==
X-Google-Smtp-Source: AA6agR4A9YrAmvQD6OUos5jMjZUxELC1j8MMbUygpSXxYIg3DRmIaF/QtRGzpV+mMaHN1kBTihAuQA==
X-Received: by 2002:a2e:9e11:0:b0:268:c7d0:9662 with SMTP id e17-20020a2e9e11000000b00268c7d09662mr3462146ljk.309.1662715387840;
        Fri, 09 Sep 2022 02:23:07 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w5-20020ac25d45000000b004979df1c1fasm10096lfd.61.2022.09.09.02.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 02:23:07 -0700 (PDT)
Message-ID: <88d9918a-7efd-cd3a-253b-eb11c4f86b6b@linaro.org>
Date:   Fri, 9 Sep 2022 11:23:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: gpio: renesas,rcar-gpio: Add r8a779g0
 support
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <649e875962b486e0bf849aba8f386eb6290a433a.1662714555.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <649e875962b486e0bf849aba8f386eb6290a433a.1662714555.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/09/2022 11:09, Geert Uytterhoeven wrote:
> Document support for the GPIO controller blocks in the Renesas R-Car
> V4H (R8A779G0) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
