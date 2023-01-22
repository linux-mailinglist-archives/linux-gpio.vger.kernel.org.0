Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78DA2676D49
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Jan 2023 14:53:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjAVNxO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 22 Jan 2023 08:53:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbjAVNxN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 22 Jan 2023 08:53:13 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4554B1A96A
        for <linux-gpio@vger.kernel.org>; Sun, 22 Jan 2023 05:53:12 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id y1so4102917wru.2
        for <linux-gpio@vger.kernel.org>; Sun, 22 Jan 2023 05:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3uz2hambBKLny/k/c/XNti8Jw4YcdQCQlmBD+jwVcBk=;
        b=im0FbK9Wffib+B7bORG4P13UYRAyZyp1no4g55k/all0Vq+yhRXlxv2tPSHemQfYHU
         kXkT2Mcfsephkho3xZWoUR8TXApQ7QUPOdNlAwxCICAfWBqXvY5I548WRlXqDDloXbRi
         quHu9BOObQpNOBG45Xflh9/8aN8hkZD9jCNdy7NeGAdvCY837WzuOHO6xcl0l98Y3KtT
         QQSuN0cYtNQbkaoYYfw0N7d7RKk3Cg/yRJY39GblJJYmyVZ2T+xDbrVF7NLmXwXDSAac
         gClk2nzoILKbEUksvkVncpo7CpYIaU1mIgjWeagoKIo0+rejOBRT4S2IgZKl4FJx2fT7
         0rvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3uz2hambBKLny/k/c/XNti8Jw4YcdQCQlmBD+jwVcBk=;
        b=ewADWa3lSeqPB1WDg2JqMLufpbf43reHVHe9iawv2f/66Vs/IVQo6ArE37WgyZQZEb
         HnavNHjyvPt7SkB1aiNh7mdDjQEi2JMQVIfv3LgZ5pID/g/Jo5F4F937u4fUeUyRO7+b
         2D2x+NlttqCQZkjPrMI5W30porNDWuirq7Gyf8/CC2jdA7UT9+VfmcJSuDORoWdRtr/9
         UsNbsKqSq7hyPuk6+0O6jnJH2/UDy44JT70z6gRgshB7w7Xybvi1XGYnFjV9CK2IGlXw
         aXijRdlrZPlSCF/eqYQwZGwrPmjKu+mwuYJbLqZE0lFQf2mTIzF7WWSsFwch9PElum5E
         ddJQ==
X-Gm-Message-State: AFqh2kr50Bm72drm5riDlo7fi+rmEbqw7nck6ptFflrnhh+QbNTjy6ea
        fyS7UpaA1bYMfqxs+04js3P9bA==
X-Google-Smtp-Source: AMrXdXshgTb0eYjX3WLoeDDjDTBa4r4aeJ+fgpVNN17aH0ELUdXHirup37RL7a9oBC55AR+KGOFzDg==
X-Received: by 2002:adf:fc4c:0:b0:2bd:dbbb:e7e2 with SMTP id e12-20020adffc4c000000b002bddbbbe7e2mr17629897wrs.60.1674395590842;
        Sun, 22 Jan 2023 05:53:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w4-20020adfee44000000b002ba2646fd30sm3247627wro.36.2023.01.22.05.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 05:53:10 -0800 (PST)
Message-ID: <d5d9cd96-d12a-9cd1-f49a-54c036174c8b@linaro.org>
Date:   Sun, 22 Jan 2023 14:53:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 2/8] dt-bindings: pinctrl: rockchip,pinctrl: mark gpio
 sub nodes of pinctrl as deprecated
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, linus.walleij@linaro.org,
        brgl@bgdev.pl
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        heiko@sntech.de, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kever.yang@rock-chips.com, sjg@chromium.org,
        philipp.tomsich@vrull.eu, john@metanate.com,
        quentin.schulz@theobroma-systems.com
References: <03627216-54b5-5d9b-f91d-adcd637819e3@gmail.com>
 <137b56f0-8e86-f705-4ba7-d5dfe3c0b477@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <137b56f0-8e86-f705-4ba7-d5dfe3c0b477@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21/01/2023 12:08, Johan Jonker wrote:
> Mark gpio sub nodes of pinctrl as deprecated.
> Gpio nodes are now placed in the root of the device tree.
> The relation to pinctrl is now described with the
> "gpio-ranges" property.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

