Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F19C8789D36
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Aug 2023 13:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjH0LOP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Aug 2023 07:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbjH0LN5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Aug 2023 07:13:57 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A24109
        for <linux-gpio@vger.kernel.org>; Sun, 27 Aug 2023 04:13:54 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-52a4737a08fso3037441a12.3
        for <linux-gpio@vger.kernel.org>; Sun, 27 Aug 2023 04:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693134833; x=1693739633;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ipcdNcF1O55wKKATQ+DbIVwlIv3Inh0Eycsv10ZWXYg=;
        b=gG9WbV5hN7OFM7FC443031tdRNkobrrlmaBIZ/5CFo+ExWNgvBnpSH96OZgSABt5vC
         MWptChLk1/ctM4SbD75j1YNZ045ku5etfd75BkuYo7+PoyaZGXCFvGZ8ypTbgxhkfmRm
         1BbDvcCubU85k52Lms4cWHEgDmG1Bu1cT0aszEIcAD/brQsAIOEo1uIfZjGUY0nqxfsJ
         IItq0HcpvG4zG+XsYnF0DGVsvP0l7Ub7qi6ElygdzONybYF893QWxuOxkgMeP1EebSZE
         wBwmH9NW9Ru+8f2I4Ajxnp360+gQjDqGirTZUBDtBsDj5lu9hgCwO4cEtj7heIL27u8P
         vXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693134833; x=1693739633;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ipcdNcF1O55wKKATQ+DbIVwlIv3Inh0Eycsv10ZWXYg=;
        b=a9IeYK6mrz3XXrl0sRkRs3hJnGw4OLP3vR/3jxsrEGSDgUalxjBQnYz3e1iBpjMjnf
         FN682SfQER1e2CUzJY1E/R4EjKvakuEsovCuXEU5IqFojftsmqKxxrrG/CXXMPICRK01
         FIKh2yCgJdDjGZlZGnZVerxrxgxvnFzaIEgGdRjAUHVa0qiwLQbkGiJ1cd1HtP6o8+xA
         11HsrmfRwYNz65QIj1p7oQsgKfHq6smw5aUrDvm3QONjxb9aPLtm4mlwC2LCeN8IbW4W
         rhy9oQ2pIBdxfNmXHddyPA8FP+eS0ZIxyEPZzF5clZ8RQeVvI8mUAQSsAgrORIxQ8Mwg
         migg==
X-Gm-Message-State: AOJu0Yw1IuBec+KkNf9vfTJfvUK3RfmRx6MBYPrXuGQVTndv49w2biGz
        430cst7KKa8n8OQ10uYjv1pE/A==
X-Google-Smtp-Source: AGHT+IGepecW51Ioli3tongSTkDykLHgwpMsDI776z4B2Hit96uxsmBnKFHoQEoPv9JG8lMBVHSBEQ==
X-Received: by 2002:a05:6402:398:b0:525:6e47:10f6 with SMTP id o24-20020a056402039800b005256e4710f6mr17581438edv.22.1693134833535;
        Sun, 27 Aug 2023 04:13:53 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id h11-20020aa7c60b000000b005227e53cec2sm3207882edq.50.2023.08.27.04.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 04:13:53 -0700 (PDT)
Message-ID: <53987f0f-dfda-3572-1545-755072328be4@linaro.org>
Date:   Sun, 27 Aug 2023 13:13:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH RESEND v5 1/2] dt-binding: pinctrl: Add NPCM8XX pinctrl
 and GPIO documentation
Content-Language: en-US
To:     Tomer Maimon <tmaimon77@gmail.com>, Rob Herring <robh@kernel.org>
Cc:     linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, avifishman70@gmail.com, tali.perry1@gmail.com,
        joel@jms.id.au, venture@google.com, yuenn@google.com,
        benjaminfair@google.com, j.neuschaefer@gmx.net,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230809185722.248787-1-tmaimon77@gmail.com>
 <20230809185722.248787-2-tmaimon77@gmail.com>
 <20230821170941.GA1915730-robh@kernel.org>
 <CAP6Zq1i+P8Jh2_G9gJMdtCKcVF6m9vkWAP5rJXBCJ1aNfc2Bvw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAP6Zq1i+P8Jh2_G9gJMdtCKcVF6m9vkWAP5rJXBCJ1aNfc2Bvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27/08/2023 11:44, Tomer Maimon wrote:
>>> +      pinctrl: pinctrl@f0800260 {
>>> +        compatible = "nuvoton,npcm845-pinctrl";
>>> +        ranges = <0x0 0x0 0xf0010000 0x8000>;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +        nuvoton,sysgcr = <&gcr>;
>>> +
>>> +        gpio0: gpio@f0010000 {
>>
>> unit-address should be 0.
>>
>> Otherwise,
> The unit-address is correct f0010000

Then how does it pass W=1 builds? How unit address can be f0010000 but
reg is 0? Really...

>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
>>> +          gpio-controller;
>>> +          #gpio-cells = <2>;
>>> +          reg = <0x0 0xB0>;
> 
> Thanks,
> 
> Tomer

Best regards,
Krzysztof

