Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F11DE595865
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Aug 2022 12:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234732AbiHPKdq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Aug 2022 06:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234757AbiHPKdV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Aug 2022 06:33:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5FB58B68
        for <linux-gpio@vger.kernel.org>; Tue, 16 Aug 2022 02:23:31 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id o2so14089700lfb.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Aug 2022 02:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=xqmZkTjqkBszJr4LKjJt2ehtVUvSW3sFkYgqkkGWDf4=;
        b=yj+1nFMppjyZXIpFnjKZvFDRpcKZwm+a4RWh+1tgO9xkQqZ5ouieOYtGDdckwPCLkD
         uFNRzJohXUEtJkdoEMQud0/N66NTYI0UV0uWL9W2sOWN2DPcWtt6PVdBw5MjNIDJIYgz
         7z1qS3BhvROOXNwNVdMCiNBn+hCwboOkqh+EliX/jOaVubo4IIFegvDhncPRP9id2YSy
         zJ2KMbORQuM3hcHWwWAxXLHMYeN11+ZOS0NSe132Auln0y3rEuRGL4zv++iOnJSGhjZc
         kbibfmoOvPb7P4Gyx7pJH4QHOwiW9cdScaGQsSqohEUl4AfB3xEzQnP61EQFQQFRh6Y2
         8OPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=xqmZkTjqkBszJr4LKjJt2ehtVUvSW3sFkYgqkkGWDf4=;
        b=paSyIcmwpEQGhSLBycvbWzDavFu/zuL/L+osN6yQRzF11TvMUPVGAF6P/O4S72L11b
         fBwvaMkuXCUPpsyjp/Ya/WnXgjz50tNDfEz7Ad120yqilW+gvs2FeqoSng327U5DUv1+
         zKxmH7TFAmSI/THJkcucpFx6tFkKQzqYvioh9ymT2uRTYCRTA3Pwc1u0vFT+I5R5DXOn
         xB+F5UEbHxpq+iR37uTGhDGRrTWyfqTIfz+PKWwOcPmrf8mzq4fNOAk4wMKjbWlnEEBj
         two76/6bR56g9Py+8HiNRfBfkV8XOTTdd2zMsKydIBSEIFrJf4hMrr3X8ILleWH72ibS
         eItQ==
X-Gm-Message-State: ACgBeo0mVdhOnYAAv7RSD3ONpngAFarMLmikrTzv33xJfd3bBniiDesI
        Rdc00l/B0eB5U2w8h5hXTrJYDw==
X-Google-Smtp-Source: AA6agR5+nNwI8d3IuOAHqLUOx1QI0JR8HQgP2AKO07DOADBkCQC3TdTrDgt0+LLhBk+z2F6rApxi6Q==
X-Received: by 2002:a19:5e02:0:b0:48b:1870:dc4 with SMTP id s2-20020a195e02000000b0048b18700dc4mr7462376lfb.4.1660641809597;
        Tue, 16 Aug 2022 02:23:29 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id x25-20020a056512131900b0048a0e948c34sm1325631lfu.195.2022.08.16.02.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 02:23:29 -0700 (PDT)
Message-ID: <b6a515bf-b1a3-02e5-ecda-d11753288fe2@linaro.org>
Date:   Tue, 16 Aug 2022 12:23:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1] pinctrl: samsung: Finish initializing the gpios before
 registering them
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Saravana Kannan <saravanak@google.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220727013349.3056826-1-saravanak@google.com>
 <49e4f45a-51da-ec4c-9ebb-dfa022bf8a88@linaro.org>
In-Reply-To: <49e4f45a-51da-ec4c-9ebb-dfa022bf8a88@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28/07/2022 11:32, Krzysztof Kozlowski wrote:
> On 27/07/2022 03:33, Saravana Kannan wrote:
>> As soon as a gpio is registered, it should be usable by a consumer. So,
>> do all the initialization before registering the gpios. Without this
>> change, a consumer can request a GPIO IRQ and have the gpio to IRQ
>> mapping fail.
>>
>> Signed-off-by: Saravana Kannan <saravanak@google.com>
> 
> Looks good.
> 
> Linus,
> It's too late for me to pick it up, so make you could grab it directly?
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Otherwise it will wait for merge window to finish.

Applied.

Best regards,
Krzysztof
