Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD4B768EE58
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Feb 2023 12:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbjBHL54 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Feb 2023 06:57:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbjBHL5z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Feb 2023 06:57:55 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D8B485AB
        for <linux-gpio@vger.kernel.org>; Wed,  8 Feb 2023 03:57:53 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id q8so13145225wmo.5
        for <linux-gpio@vger.kernel.org>; Wed, 08 Feb 2023 03:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Os5EeAhOwAZRzentDp9ToOzfsCfsH4W7jIuEYSHVgak=;
        b=y0KiKEAwymREB5G/oHcJbBjDEJTOmrJHi6PAYsrniCHSA8HuQ6Hgn660IKAQhdPKag
         wsIHNpH1I9ybpgaFbHTqNWDCne0XkDM9IAqrv2toi9mc1vroSeQwML80fHgjIcPHuQb9
         lVRLnuofn0LZAaxho0ebZDd1AWIjanb/qRmSCKF8MYakyPy9cTPVteIJbwfrX1xzJFT2
         ZL5JIoMe6JFHMedH6McYBF17gCmOfvk8kG1LMEIQ766wS/Hyus31/3RZ85CjC7gXIEzJ
         OfIFJ7Wfcx7lsk17BOv7No9/0m/edxLCw88rKhmrbKA6IUpdZO34VqiS89HT7em86dZR
         8NBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Os5EeAhOwAZRzentDp9ToOzfsCfsH4W7jIuEYSHVgak=;
        b=yjTBEFzbqzJFsUiJluWsV7sIJo8+1hnI+upHrSZVX+VTfeqDy6UK6ODEmywSgOc29t
         qiMS4b708+O3zvJWVsOy52UPvZJOqGoSQ6VxN054JIMuRJ3haNrL6CR+XknN618rNWJ3
         pea/QNYg/B5cns57XiD3Q/avAzuJkZP5MOiJMI8k4fCeDUc07cYHL+VROZQeBpH8QEp5
         Efhw7OGb/5tMONmgw0VwCAeVbFAA0avlvQ6g8xcFwHQYrr4QzQIFXpK2F25A+XM+7AAx
         dF5fsyGmD0PmPavh+zOliJ/ISr0Bvh9erNvfJj4BLoTjQ3pE7S0b9jtbVUUI3FZu4BwI
         oQjA==
X-Gm-Message-State: AO0yUKUIU65z4cnt7bU9afEQVkwEBOHEiH0xH7U7k/lRWbSDJqLDwtcL
        QK+/5UhSO4XlOklnpSKawj9S0w==
X-Google-Smtp-Source: AK7set/ooFp2421xqMkR0fa63StmM5ni5yPRn4jighJqF3WIg0OE06QgA+hnr5NJpVuBQ9Rm6ayz6w==
X-Received: by 2002:a05:600c:4496:b0:3dc:de85:5007 with SMTP id e22-20020a05600c449600b003dcde855007mr6258599wmo.21.1675857471998;
        Wed, 08 Feb 2023 03:57:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003dc43a10fa5sm1819426wms.13.2023.02.08.03.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 03:57:51 -0800 (PST)
Message-ID: <9e7e1762-1c2e-28cd-c7a7-b0577addf51e@linaro.org>
Date:   Wed, 8 Feb 2023 12:57:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: tegra234: Add DT binding doc
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Prathamesh Shete <pshete@nvidia.com>, jonathanh@nvidia.com,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        smangipudi@nvidia.com
References: <20230207115617.12088-1-pshete@nvidia.com>
 <a1395eb2-da3a-e080-fa6b-50f20d879655@linaro.org> <Y+OGdMFQkL9Dtaq/@orome>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y+OGdMFQkL9Dtaq/@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08/02/2023 12:24, Thierry Reding wrote:
> On Tue, Feb 07, 2023 at 04:33:08PM +0100, Krzysztof Kozlowski wrote:


>>> +          type: object
>>> +          additionalProperties:
>>> +            properties:
>>> +              nvidia,pins:
>>> +                description: An array of strings. Each string contains the name
>>> +                  of a pin or group. Valid values for these names are listed
>>> +                  below.
>>
>> Define properties in top level, which points to the complexity of your
>> if-else, thus probably this should be split into two bindings. Dunno,
>> your other bindings repeat this pattern :(
> 
> The property itself is already defined in the common schema found in
> nvidia,tegra-pinmux-common.yaml and we're overriding this here for each
> instance since each has its own set of pins.
> 
> This was a compromise to avoid too many bindings. Originally I attempted
> to roll all Tegra pinctrl bindings into a single dt-schema, but that
> turned out truly horrible =) Splitting this into per-SoC bindings is
> already causing a lot of duplication in these files, 

What would be duplicated? Almost eveerything should be coming from
shared binding, so you will have only compatible,
patternProperties(pinmux) and nvidia,pins. And an example. Maybe I miss
something but I would say this would create many but very easy to read
bindings, referencing common pieces.

> though splitting
> off the common bits into nvidi,tegra-pinmux-common.yaml helps a bit with
> that already. Splitting this into per-instance bindings would
> effectively duplicate everything but the pin array here, so we kind of
> settled on this compromise for Tegra194.

OK, but are you sure it is now readable? You have if:then: with
patternProperties: with additionalProperties: with properties: with
nvidia,pins.

> 
> We're taking a bit of a shortcut here already, since technically not all
> pins support all the functions listed above. On the other hand, fully
> accurately describing per-pin functions would make this a total mess, so
> again, we use this simplified representation as a compromise.

That's okay, many platforms do the same way.

(...)

>>> +
>>> +        pex_rst_c5_out_state: pinmux-pex-rst-c5-out {
>>> +            pex_rst {
>>
>> Underscores are not valid in node names.
> 
> We have supported underscore in older bindings for historical reasons.
> But I suppose for these newer bindings we could disallow them.
> 
> Some of the older DTs have a large number of underscores, so I'm not
> sure it makes sense to go back and fix those. Maybe something to keep in
> mind for when we're done with all the conversions...

I understand, up to you. I think that if such older platform is still
supported/maintained/used, then such cleanups are positive. Underscores
are reported by dtc at W=2, so it is not that critical. But many other
nits like generic node names are being enforced by dtschema, thus if you
want to achieve 0-warning state, at some point you will need to address
these. Of course different question is on what tasks you want to spend
your time. :)

Best regards,
Krzysztof

