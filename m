Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC1705A100E
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Aug 2022 14:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239938AbiHYML6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Aug 2022 08:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239754AbiHYML5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Aug 2022 08:11:57 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E96A61C5
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 05:11:55 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id bx38so19208647ljb.10
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 05:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=3jrVz94JeKsDPhrjsPL9t/CAaLqOh9I2BzC2SIj45MQ=;
        b=NWwcztVUq9UHiIUbxUdpSJiCHvwqmSWTI6qwmDGV/OoFrszYkkSViQlvblRoi8lRVs
         aHQX8+A3lObNm44aPIxKJdDY8jdvFO6oMakWDJxiRd3/6n3TW1EhEXGEi5aIJ/EjcqOH
         7ZjPbl3CnRLbNkKeL6/cA8SkcAkI0W67t/i9BYfLXl7W+gvFDHiQZPSXs5doatEqA1mw
         DPTRX3beFgpf+LpeIWzDikpxIxIZX07/QpEKYWej5k1VbTUBP/e/UHzXO5PJxmaqsNII
         OcMwtXQl28EQBsQUGBMQUwU+xcZ+bTXplz3D3tp6SUKTIbOBT2pZlYTFPSZeye+oqsjj
         0wEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=3jrVz94JeKsDPhrjsPL9t/CAaLqOh9I2BzC2SIj45MQ=;
        b=WoVtrSw5CmB0rS3nQ5Ucut9D93x7j0O+lVTsYWF6rH6mQ+ovD5I4FEr3ssOAzHi+MU
         kowHc9CPiGH5A8wCfzAV3S3oSOMFcFv/Gg1r/1bozbgGlNUNVINrqQnKX8GB5UvGeNsM
         vx4O9gi+mPPRbcrrNWr0j3CTimlPNDtxSo0d1lj+BjBpbNGpMY1j4hIuNDDnnnwi6Vyr
         4QAW/7G6DRKH6JD3MoEpCkvFwbfjaKQQq3VAPY2HBQWx1v+sL4S8x3Az3wqVgQxM4LHo
         cxxn+8LiqxvpfuW8IZlAU87t3qEYdYE1iUBXtUauhf0LQZi+7IfAnIvEd78SiZvmeRJr
         KQCQ==
X-Gm-Message-State: ACgBeo3Ox0YPDXDAo3pTvlWXu5JevNGjAw8L/prxAHWwb3gEdGT9bPI2
        v76pauVa1ywSPClPkRR8C4swBg==
X-Google-Smtp-Source: AA6agR4gw2eloZ4Nh2rM/L7T2AOUwLy6E9ahfrjRoJvFJWjTWDiNX4Rd2OKV2NuFBC/Cqv51GDxzDw==
X-Received: by 2002:a2e:910f:0:b0:261:ce88:76d2 with SMTP id m15-20020a2e910f000000b00261ce8876d2mr967168ljg.410.1661429513865;
        Thu, 25 Aug 2022 05:11:53 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id t21-20020ac243b5000000b0048b003c4bf7sm464423lfl.169.2022.08.25.05.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 05:11:53 -0700 (PDT)
Message-ID: <13dde9ca-35de-bd8a-ec47-87fe1f844308@linaro.org>
Date:   Thu, 25 Aug 2022 15:11:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1] pinctrl: samsung: Finish initializing the gpios before
 registering them
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220727013349.3056826-1-saravanak@google.com>
 <49e4f45a-51da-ec4c-9ebb-dfa022bf8a88@linaro.org>
 <CACRpkdbS2SGUMktB4a8T-cMW5d=s_BiygrSmAbOix=BUg0JOSw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkdbS2SGUMktB4a8T-cMW5d=s_BiygrSmAbOix=BUg0JOSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25/08/2022 15:08, Linus Walleij wrote:
> On Thu, Jul 28, 2022 at 10:32 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 27/07/2022 03:33, Saravana Kannan wrote:
> 
>>> As soon as a gpio is registered, it should be usable by a consumer. So,
>>> do all the initialization before registering the gpios. Without this
>>> change, a consumer can request a GPIO IRQ and have the gpio to IRQ
>>> mapping fail.
>>>
>>> Signed-off-by: Saravana Kannan <saravanak@google.com>
>>
>> Looks good.
>>
>> Linus,
>> It's too late for me to pick it up, so make you could grab it directly?
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Otherwise it will wait for merge window to finish.
> 
> I sadly missed this during the merge window, as the commit message didn't
> make it look like a fix or something urgent. (I don't know if it is?)
> Just send me the patch as fix or for -next, I let you decide.

I understood, so I already picked it up after merge window. I'll send
you this in a pull.

Best regards,
Krzysztof
