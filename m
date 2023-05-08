Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1AD6FA37C
	for <lists+linux-gpio@lfdr.de>; Mon,  8 May 2023 11:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233769AbjEHJjY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 May 2023 05:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232854AbjEHJjW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 May 2023 05:39:22 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F1721721
        for <linux-gpio@vger.kernel.org>; Mon,  8 May 2023 02:39:21 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-50bc394919cso6504623a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 May 2023 02:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683538760; x=1686130760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZmptdmWS7uTkEU8fh40xpc7xUHUTR53ITknLtuVQiB0=;
        b=NuRDzAD1ygyhZBZz7Bp+NMxpuUS2wUhDMEhCbJffC4hZksr0PvoLy7nvxNu4mjxS0+
         rPLAEP9rodeT6m5jnfKbHOFBfJFHF2lyQ4qr7s+zOciO4YqeTRT59meoJLjhavkd+NuW
         /F30LR5FaaqEykcc7QSX4AWJ4jpPiKvZw0XfC18GWfWQgAgsEIEABm16KwOMksbJ0Zpb
         IIGyIykAIipA2XVykVWpsP6VvcP8z6tYKFr9Hyd4XKYQK/EDP8eC8/zvIvmJcUr340H1
         fUjM6+UpswMBXg0vuCr6RtEYjm179PzIJrf0RaXCjmq4JDO4XriJZZ50LcQ0p6eujtF5
         k+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683538760; x=1686130760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmptdmWS7uTkEU8fh40xpc7xUHUTR53ITknLtuVQiB0=;
        b=UDxTsNOjWZEDfqscZoYzPpkuTO0V2CIK9RD46wmrXTDM2BS5OazBjx9UavCxFh9koD
         03jK5RD7lH8kblychQpxvAoSP7gJn2DyOq3H2vGaV/G7D9+r25ihLAh0KwYLVuZDFUTj
         UZY23CEEUe3khirLXaTbdTAjD4bbFSKtFsj1kH/9wEvV2c9y2Q03HCSj4RhyF5ExsyDz
         kJ22sjGIa8wZyU94OHzrWkEKn9Uhs1MDldnfppQjUFbZR0GeIuGN3w8btHVULDy7rjCb
         QXVWseq2qDBotBJjlRDm1FQcdrP4UKKcY2Jz5Jfc/KS6lYNR/qC2fHruzJ79g3ixExe6
         O7PA==
X-Gm-Message-State: AC+VfDyCyT+2Qk7Ti6Ly1L0o+bbJ/V9aZE+KJQ/juJaFjHCmtTAIG3gZ
        QwCBeoKh7hc6uets0bBTjmL64A==
X-Google-Smtp-Source: ACHHUZ7YjGBPSw63wEkXpDGE0keBJD1105dLULq1Q0SKPwXRtl6KRdeWwIeeqmypOi9r4q8YuWEJEg==
X-Received: by 2002:a17:907:3d86:b0:967:5c5f:e45c with SMTP id he6-20020a1709073d8600b009675c5fe45cmr1640816ejc.0.1683538759858;
        Mon, 08 May 2023 02:39:19 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:50e0:ebdf:b755:b300? ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id d12-20020a056402516c00b0050bd2f16ef5sm6019815ede.84.2023.05.08.02.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 02:39:19 -0700 (PDT)
Message-ID: <a34b7181-e635-7fcc-2684-e1ee2efe7096@linaro.org>
Date:   Mon, 8 May 2023 11:39:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 0/2] STMPE device tree bindings
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Stefan Agner <stefan@agner.ch>, Marek Vasut <marex@denx.de>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20230426-stmpe-dt-bindings-v3-0-eac1d736e488@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230426-stmpe-dt-bindings-v3-0-eac1d736e488@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07/05/2023 23:19, Linus Walleij wrote:
> This adds the missing GPIO bindings for the STMPE port expander
> and converts the existing MFD binding to YAML.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes in v3:
> - Update to review feedback
> - Collected some ack/review tags
> - I guess Bartosz should apply 1/2 and Lee should apply 2/2.
> - Link to v2: https://lore.kernel.org/r/20230426-stmpe-dt-bindings-v2-0-2f85a1fffcda@linaro.org

2/2 depends on 1/2, so it must go via one tree.


Best regards,
Krzysztof

