Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7E7591190
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Aug 2022 15:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238931AbiHLNdv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Aug 2022 09:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236938AbiHLNdv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Aug 2022 09:33:51 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2922C9C8FB
        for <linux-gpio@vger.kernel.org>; Fri, 12 Aug 2022 06:33:50 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id f20so1353844lfc.10
        for <linux-gpio@vger.kernel.org>; Fri, 12 Aug 2022 06:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=z4AiGXr3REDL7GqtsJx8F6rnRjSDdT6RG1gWREQhBcU=;
        b=LNiDUfWcQ1zJEDigf9MHidZGHQZEF9w2jrTfHHie35FEIQd7SFr6eKZDbUV9Fd028I
         HoPige8CFELxe298FMaQQRHvmZIjIDTLdss/3Vk8Rk+D749uIJVDR5Tb5C+sich3ipPI
         J37PHl1IJYaNBCQsCJMpr3ilGc4JgWQMW84RKhUq/633snvu1oBjVpbXypMdOyfZOmPL
         I9F9+jK164lpYZjdJg5TrLawHtxvDZWWvSoYoCp9VMTZjwcJeJR/DB7fzSoHIFvBT8os
         vptZ+TkErC2Jx5lPe0+Fkg96I4aDLZYlKZwIj63Ib0Dv9PE7cUxHu/YrGjpVQShdl0OE
         ordg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=z4AiGXr3REDL7GqtsJx8F6rnRjSDdT6RG1gWREQhBcU=;
        b=lEn5WF+dmOpxwxdYuqPG34+XSAmbIzqgvrO3NcdnwpfuVCZ3em3lMmiG9WrrYhNpIH
         TyzlXNa/ekQc1msyXWfE2L6kFajVZ/6GwWrQwFEG1tclY7Mb69nvZffCajGVt12/KyHJ
         w6ASsLCPV+MuXyBZvz3s/UPC5Hz1V6RtVLH07n61IOSVENeInz/6mYakBQC2eQNGveUu
         Fe9g3TivS/Gv72LT1xqCwPmaAQcg24XXe0nKhltev5ytA90eXGeErcuBMctlw1Cr6Znd
         7HizQPU5xRi2S4mS5YIBod3JPARKACnd23+cPnl5TZTPt7dkSfn85fItUHDgXRtFiytb
         fqmQ==
X-Gm-Message-State: ACgBeo0R+OnpZHloEF8UYPR8oD24/rTIAp+blqqO6Cqm7FReEdDjc6ze
        cwxhDg5JMslUObf6m4u47NfT4w==
X-Google-Smtp-Source: AA6agR6dcnjIyMjXY7sw25RY0+ACHWmwCBnp0P8UXC5ActW0pLzPbQcX4BL0V9dI83AkFguHOGga/Q==
X-Received: by 2002:a05:6512:ba4:b0:48a:f185:db17 with SMTP id b36-20020a0565120ba400b0048af185db17mr1191578lfv.107.1660311228578;
        Fri, 12 Aug 2022 06:33:48 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id bg25-20020a05651c0b9900b0025e4e2a5bbesm365108ljb.1.2022.08.12.06.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 06:33:47 -0700 (PDT)
Message-ID: <fc1fa817-d17b-2cb1-cd9d-b31f79753e70@linaro.org>
Date:   Fri, 12 Aug 2022 16:33:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 1/3] dt-bindings: gpio: Add imx scu gpio driver
 bindings
Content-Language: en-US
To:     Shenwei Wang <shenwei.wang@nxp.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org,
        brgl@bgdev.pl, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev
References: <20220812133012.7283-1-shenwei.wang@nxp.com>
 <20220812133012.7283-2-shenwei.wang@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220812133012.7283-2-shenwei.wang@nxp.com>
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

On 12/08/2022 16:30, Shenwei Wang wrote:
> Add binding document for the imx scu gpio driver.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
