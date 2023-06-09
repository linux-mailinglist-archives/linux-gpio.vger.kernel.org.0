Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35EF4729B2C
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 15:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbjFINM0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 09:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231863AbjFINMZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 09:12:25 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67EB530CD
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 06:12:22 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9745ba45cd1so269827666b.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 06:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686316341; x=1688908341;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TlD8Kkk6AaX/8ETe6xUXUSTWoTyIrkycVvkFoL2aa8k=;
        b=m9pB56YCADf4dWbR8c4jIyaxQk3+EbzAwe2K6tO0g1nzYPSHxBjPkvujwuRufUQnp6
         OOhGjTAtNK88F2GbwwzHGdipky8RF0Noxlyl1MI+ZfXLwAaysrlYWt9+GR6A2sn7SHBv
         tNomqThWiCwihCw4ztxVpu/AcErtSgc0bQ4jFfPR6JCu+hz8GElkNO8/UN+jImMMPbT/
         3Xcvzw1aVq6QZ9McI8Nemv63puea3CYedM6wQ8NjeKXh+VXh5TB08BA1p/VRVHu3c6eV
         mpoJMcd8rBUB6qL+omO1apRYSZ3UDsT7Hp+EmTGPIGEydg4F09xwn33K+u/5sQbvU/Wm
         c7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686316341; x=1688908341;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TlD8Kkk6AaX/8ETe6xUXUSTWoTyIrkycVvkFoL2aa8k=;
        b=lI4CTHgP5DJhSZQlvdvVrwEp4hI2wE+fjCzGNIapdlwvYYAH+ml0TkiyrDZi6JbbGX
         1sYOXXgEtvQE67i2kmwIFtB3qsX/NoTVXqN7022EX4pJnzGLgqncBlaMhHw+VSLOK71m
         L5aMvFXi0619hE1/19lWraZJL8LpI6ZxPpfMThDpF1A/rAJ/rgceup64LXedWCnur6ZB
         EI+N9TTk1e10CO5j4qXRzbe93XtfwPGOfHXObFOZ5fznp1iYBsZYN+gyjrb/wZ+lyeSB
         /jgtzLtQmQHH+0UImoI+zMhqbqDDlsiZ4IuYfxKbA8po8RUZwxaphJGFv+0qTDJxBzKY
         wkpQ==
X-Gm-Message-State: AC+VfDwYWZ79bJfdgF31MB/G6ak473VMti/zm0VXfPYk8KSbOj0SqSZM
        qWa3wt7FpM28tavewLeBE5CM6A==
X-Google-Smtp-Source: ACHHUZ7i1avRM1DcPKO7IC1z7NbS4U58UXa3nJjlKYNBfYlfz2+hKHAq/aqgpV6FXUDr9q9eH8XPqg==
X-Received: by 2002:a17:907:a40f:b0:978:ae78:a77f with SMTP id sg15-20020a170907a40f00b00978ae78a77fmr1748461ejc.21.1686316340902;
        Fri, 09 Jun 2023 06:12:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id s8-20020a170906500800b009663582a90bsm1315307ejj.19.2023.06.09.06.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 06:12:20 -0700 (PDT)
Message-ID: <a305a727-e1e1-00a5-5e1c-a04592ad45dd@linaro.org>
Date:   Fri, 9 Jun 2023 15:12:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/1] dt-bindings: gpio: gpio-vf610: Add parsing of hogs
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20230609121044.586214-1-alexander.stein@ew.tq-group.com>
 <daeeebcf-d1cc-4dda-3450-8fa137c090bb@linaro.org>
 <2442502.irdbgypaU6@steina-w>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2442502.irdbgypaU6@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/06/2023 14:27, Alexander Stein wrote:
> Am Freitag, 9. Juni 2023, 14:15:53 CEST schrieb Krzysztof Kozlowski:
>> On 09/06/2023 14:10, Alexander Stein wrote:
>>> Allow parsing GPIO controller children nodes with GPIO hogs.
>>>
>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>> ---
>>> This implements the same as commit dfb49cc231a48 ("dt-bindings: gpio:
>>> fsl-imx-gpio: Add parsing of hogs") and reuses the commit message as
>>> well.
>>
>> But it was suboptimal. Do it like in commit 6c19974d1e83 ("dt-bindings:
>> gpio: Convert STMPE GPIO to YAML schema"), including also narrower pattern.
> 
> Ah, thanks. I wasn't aware it is part of generic dt-schema.
> Regarding the narrower pattern: dt-schema still uses the wider one. Is this 
> still correct or something which needs to be fixed?

dtschema must have wider pattern as it covers everything, all boards.

If existing DTS fits narrower pattern, make it narrower. It helps
keeping code consistent thus easier to read.

Best regards,
Krzysztof

