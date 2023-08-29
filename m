Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC73078BF57
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Aug 2023 09:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjH2Hkz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Aug 2023 03:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233734AbjH2Hkj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Aug 2023 03:40:39 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD92D1A1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Aug 2023 00:40:35 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so519713566b.3
        for <linux-gpio@vger.kernel.org>; Tue, 29 Aug 2023 00:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693294834; x=1693899634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=85oIlwOjnmhaZMSJhN62Phro7f83cmUVna4DEevhvGQ=;
        b=FmVoBL3BK/odNCW/bZ/ThcyfHTQKAHmQYTAdJw8yuTRur1gd9XcWu/sO432SR9x+zj
         IuhxR0pWgQRO9iIsmXYHje1KRMLauX55VdQX7XuhQSiv1yI3BY097g9B0O0NTBfIHJU2
         3imWPhb1TK0airY7UjhLRdjIK9KJAMrhJUvH9VAxUWvZuYK9oca5TuW4LMk5Qfvqw9ON
         nsPCbRA3gHQn5bQlQOxBI3xqxmGT690uVFL/Ji7RYIiRKZDRT/we1+lz3AzNtFydzxfW
         +Ri0zAOwKNVs6aUTpwdGztU5TA9FogrTQCDwiimVNEGvxhYHwk2cR9kzEKMo/qvbw743
         lhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693294834; x=1693899634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=85oIlwOjnmhaZMSJhN62Phro7f83cmUVna4DEevhvGQ=;
        b=FFjnqUAtckM714CLpC9Ca9JxXMj+x2JPrsDpjY0Ey50yXjKxOtFxJ7thAfk7TjJsIy
         rlrqQjykupfuE0K4hYON3jqHeEqC2s3Z8WhoK9D1A943zgWHGIOs5VldckpENELVhWCO
         oGP/C8EAYKCsGMmtf8xuVDMkBcF45ZV30D52RaCXJ532e8iBz2fsrFOwQgnpWy5AClgX
         OMazCjEguwtHLEaVEzuUb9zWOfLnhbZaSvuQfQFh1ezP4pbmjNoFf0cAi6NjClLKHJPj
         7lvRDVGzEsv398+MG0VIfkEriBRNMqrp6rdvKBcPbYw1h52hlkZx4vCF0ElRiRobcVLh
         54bA==
X-Gm-Message-State: AOJu0Yy21yQ+s4NCdfgt0tH2cHtuR8qFvYEP+s48D6maB0y3AcNoz1Wj
        kteSMc/oePN7+TNa1lajS1Yu0g==
X-Google-Smtp-Source: AGHT+IHRrDeqEvG2xyfCqaM+EsruiD5GnJ6fqMycCsb0Aps55szv5dZpjTBxUGTr3a9TO9VF/93oIg==
X-Received: by 2002:a17:907:d40d:b0:9a5:b8c1:8bfa with SMTP id vi13-20020a170907d40d00b009a5b8c18bfamr2542110ejc.28.1693294833734;
        Tue, 29 Aug 2023 00:40:33 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id a3-20020a17090680c300b009888aa1da11sm5627217ejx.188.2023.08.29.00.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 00:40:33 -0700 (PDT)
Message-ID: <9e22cc04-a153-4aff-2783-2e6cbc7cc9c1@linaro.org>
Date:   Tue, 29 Aug 2023 09:40:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 5/7] dt-bindings: pinctrl: realtek: add RTD1315E
 pinctrl binding
To:     =?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>,
        Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230824105703.19612-1-tychang@realtek.com>
 <20230824105703.19612-6-tychang@realtek.com>
 <20230824211121.GA1388146-robh@kernel.org>
 <14b8a56d55af4b689cf06f9ff0fab30b@realtek.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <14b8a56d55af4b689cf06f9ff0fab30b@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29/08/2023 09:22, TY_Chang[張子逸] wrote:

...

>>> +
>>> +         i2c-0-pins {
>>> +             pins = "gpio_12",
>>> +                    "gpio_13";
>>> +             function = "i2c0";
>>> +             drive-strength = <4>;
>>> +         };
>>> +     };
>>> --
>>> 2.41.0
>>>
> 
> Thanks,
> Tzuyi Chang
> 

Trim unrelevant parts of the quote, so we do not need to scroll entire
message to find that you did not want to say anything more.

Best regards,
Krzysztof

