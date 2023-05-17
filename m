Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1CC7062A7
	for <lists+linux-gpio@lfdr.de>; Wed, 17 May 2023 10:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbjEQIX2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 May 2023 04:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjEQIX1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 May 2023 04:23:27 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F0C0358B
        for <linux-gpio@vger.kernel.org>; Wed, 17 May 2023 01:23:25 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-50db7f0a1b4so679332a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 17 May 2023 01:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684311804; x=1686903804;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VR2jfajr26cG/YApeT5pY3jRbsiY+CXBZfhTzJEJfWU=;
        b=l62nDDBoVdjO0xBIaaa5jMo+gkprVz9kbwSnOaOpBP//VfXKkS5LsrONqvWcIUAU2V
         j3EHPmXp31+f+ZqShBnpArli88LycHa/JE4P1z38cVIbnavVDBKtzbFtY6OdtozL28rF
         0eFAU5FNXCQW7f9ux+i/EcqvaQeva39/GPftBxtHhY9MviD6OU4hJUPRSFuUPyBtGqIW
         JYuSk6zUzKTJoEWvtuoxS+zJ5BFxRWxjbJltcISyT+3ihlsxDg9WI1BZ+mQNoBmwNVic
         bGlFODjbPWTqaLOe4ZsKjxux9K6x6GSebz3DblCxc94P3IC47PROg9L1l8t0OhxLHvwJ
         inGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684311804; x=1686903804;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VR2jfajr26cG/YApeT5pY3jRbsiY+CXBZfhTzJEJfWU=;
        b=KQO1+c4WXXB10aHBPUeOfS5m2TOfVdtS1Y+6jnhrVZrGJL0o5c/ejvvwQ+6WXts4fv
         qM7RGfj4TM9V7s9HtdrWB9EUlLjBe8T9hhMRzK+5cihQ+vhum4XUN8u65r2k26tDzAR3
         QiasstolCIl10lPyAwmgs+3ZqIxX25quNSo/zhC9hha1RCKmSopndYnS7WsQPaRf03bW
         xP20MdFCKfpnPiKkRuUOFFUvscbbrB1RhfG3Wy9BDpMiipFDt8jqmaNaMF+eSKgRuOX4
         NnkHOqM81pArtW9kwU9vyr1Tm1L2J/1ltD9r+cb/z0orcOLCfyDhazYvl2JbpnGPG7Fd
         54JQ==
X-Gm-Message-State: AC+VfDzOaPeFFhWwRWkqnTI+tCwGOLPDjv3Ot3STDaiIDbKhIfl+9mMz
        fKl0Ms4Kq0KTA8pOGra5EhQjUg==
X-Google-Smtp-Source: ACHHUZ7xmvHITHIhD1saUGCWp9Pq0b4l27RVs0DOuEVbljCbWGZivsu081/R2nL1/R1GyXMR3woklw==
X-Received: by 2002:a17:907:97d0:b0:969:7739:2eb7 with SMTP id js16-20020a17090797d000b0096977392eb7mr30473736ejc.4.1684311803616;
        Wed, 17 May 2023 01:23:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d? ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id n17-20020a170906725100b0096a6bf89259sm8479155ejk.167.2023.05.17.01.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 01:23:23 -0700 (PDT)
Message-ID: <6e8ab385-8d4f-b1fc-e964-64149c085dd9@linaro.org>
Date:   Wed, 17 May 2023 10:23:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 2/2] dt-bindings: pinctrl: Update pinctrl-single to use
 yaml
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nishanth Menon <nm@ti.com>,
        linux-arm-kernel@lists.infradead.org,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org
References: <20230510095330.30742-1-tony@atomide.com>
 <20230510095330.30742-2-tony@atomide.com>
 <20230510124836.thqtol6qac762ggx@krzk-bin>
 <20230517080013.GS14287@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517080013.GS14287@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17/05/2023 10:00, Tony Lindgren wrote:
> Hi,
> 
> * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [230510 12:48]:
>> On Wed, 10 May 2023 12:53:29 +0300, Tony Lindgren wrote:
>>> Update binding for yaml and remove the old related txt bindings. Note that
>>> we are also adding the undocumented pinctrl-single,slew-rate property. And
>>> we only use the first example from the old binding.
> ...
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: #pinctrl-cells: [[2]] is not of type 'object'
>> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: #pinctrl-cells: [[2]] is not of type 'object'
>> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: pinctrl-single,register-width: [[16]] is not of type 'object'
>> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: pinctrl-single,register-width: [[16]] is not of type 'object'
>> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: pinctrl-single,function-mask: [[65535]] is not of type 'object'
>> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: pinctrl-single,function-mask: [[65535]] is not of type 'object'
>> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: pinctrl-single,gpio-range: [[1, 0, 3, 0]] is not of type 'object'
>> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: pinctrl-single,gpio-range: [[1, 0, 3, 0]] is not of type 'object'
>> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
> 
> Looks like these are happening because of the patternProperties match for
> pin, will need to add more patterns like like -pin|_pin instead.

It would be great if you can change _pin to -pin in all DTS. Underscores
are unwelcome.

Best regards,
Krzysztof

