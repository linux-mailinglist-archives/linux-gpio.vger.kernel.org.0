Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3424879FD24
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Sep 2023 09:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232614AbjINHTk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Sep 2023 03:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232484AbjINHTi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Sep 2023 03:19:38 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BDBECF1
        for <linux-gpio@vger.kernel.org>; Thu, 14 Sep 2023 00:19:34 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-317c3ac7339so523813f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 Sep 2023 00:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694675972; x=1695280772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EuhVNGrFW68jxe2JJJtLZHWfPCfJOHNfdRCfgAWkxb8=;
        b=v5wSoZSu1jJd8OnF4/bmqv7oaCKoSLtlHLYvOFmwd8AL7+aiwlmtL/2xBSfr+GnFTc
         5Tz80xFJJtUO7PZSoFDzqaozXWyl4drdG+zhPVxtF1+J2tIX3SxtzuyRHtoQQtnsZwpa
         XFy7b+Poo9CO/eK7RQIRfirKRDgiC6RoBdlOjYFmYDNku1gE1JHV1fFCeQZPsLjDAIW2
         06IU04I1KaSv6HUU5PVjwhBmWGzsTwq5LmcXtxsmXOod3qOLxbM9Y82Aiv9j5N8ttDW2
         GcoLUsvhV70QofjI8j8WBctBnPpC5q72MimW9774QsLotPdKB5lfZ3sH5Ef909OYGQqs
         RMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694675972; x=1695280772;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EuhVNGrFW68jxe2JJJtLZHWfPCfJOHNfdRCfgAWkxb8=;
        b=i4S1a8QITZASAeCc4AKc0fWph1ScMac3G7gio8Psk3E+7GCRSA1weUVFKYSYTI/OIu
         jygr4xgJZKB0EgdwO9JebnkSySKs6d/kQh8X+/7eP1Uqxfh0rhW03UysAVsiHm+i4+Ke
         uYKefrWFE8qnMcTJpBXwwVcwyTItatH+7HeujJGcu9tqwf86fsAm73PRHGCbUeBRNIqH
         Pk+pexudnM5wFK8pj/Tz72N3XZSS62AeBm8T0/rUbYnNEehlaSwShIo77ChwCZ1NlkMC
         hTJnIQxbBUJMYWf6kraPoBy0iQkdJYTYRx9ztLbp32GZXt9WS1tjYguP4poXxzHMAvvw
         QJRw==
X-Gm-Message-State: AOJu0YyvjbK/fyNKXK35Wm3aoHbDsIfQs0J2zgWeMS+djZtbImPPOJbO
        Chrr115oC7NIptSpMkB2vZxi6A==
X-Google-Smtp-Source: AGHT+IH3nxwuXTTFge+SiA2fbG0x1vjEZPiN16+NTWzo1snCwvJ/WSzxrpwYFfBLDjDyKeinWZOfNA==
X-Received: by 2002:a5d:4944:0:b0:31a:d6cb:7f9d with SMTP id r4-20020a5d4944000000b0031ad6cb7f9dmr4216926wrs.24.1694675972548;
        Thu, 14 Sep 2023 00:19:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d484b000000b00317ddccb0d1sm935246wrs.24.2023.09.14.00.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 00:19:32 -0700 (PDT)
Message-ID: <ff4f2b93-7e22-8b15-aaad-b7d6f8b5517d@linaro.org>
Date:   Thu, 14 Sep 2023 09:19:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add compatibles for Amlogic T7
 SoCs
Content-Language: en-US
To:     Huqiang Qin <huqiang.qin@amlogic.com>, linus.walleij@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, brgl@bgdev.pl, andy@kernel.org
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230914054525.1180595-1-huqiang.qin@amlogic.com>
 <20230914054525.1180595-2-huqiang.qin@amlogic.com>
 <45637012-0972-fc7b-1276-163da363b962@linaro.org>
 <cde944c4-acfe-b3fb-32b8-072740475e35@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cde944c4-acfe-b3fb-32b8-072740475e35@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14/09/2023 09:00, Huqiang Qin wrote:
> Hi Krzysztof,
> 
> On 2023/9/14 14:16, Krzysztof Kozlowski wrote:
> ...
>>> diff --git a/include/dt-bindings/gpio/amlogic-t7-gpio.h b/include/dt-bindings/gpio/amlogic-t7-gpio.h
>>> new file mode 100644
>>> index 000000000000..2bab9a99501a
>>> --- /dev/null
>>> +++ b/include/dt-bindings/gpio/amlogic-t7-gpio.h
>>
>> Use compatible syntax.
> 
> The amlogic-t7-gpio.h is not a file in the dt-bindings/pinctrl/ directory.
> Does it also need to be named according to the compatible name of pinctrl?

The convention, which we introduced since ~1-2 years, is to use the
device compatible or binding filename as the headers filename. Now,
where you put what does not affect it.



Best regards,
Krzysztof

