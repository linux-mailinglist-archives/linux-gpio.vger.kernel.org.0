Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC976A8303
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Mar 2023 13:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjCBM7B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Mar 2023 07:59:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbjCBM67 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Mar 2023 07:58:59 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ACB928846
        for <linux-gpio@vger.kernel.org>; Thu,  2 Mar 2023 04:58:47 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id eg37so67054784edb.12
        for <linux-gpio@vger.kernel.org>; Thu, 02 Mar 2023 04:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677761925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2vVmmF2sI36t+dGidCoWeCzXUPaa6cM0yHfnPJQrwvs=;
        b=iyt20uqVFfkgyTkctVAvDZBFnnRN4DWQ+rcJp97tmuIUL6e1KbZdg5sPhd9wSNev92
         TPh6QuSgs9IhlckgwHWn63+pjXuXyNBOwXdOqdoohO2uudkYtCMNkSig0KpVRi4rwaHq
         VYud+w7JKGAId/rR6WmYMaWcMeg5n21FdL0EXP0F0DCxzd8S/c6CDfECsR/GKXkoOOFJ
         4qbSkcwU0k0rI4NfWgLP+dzAqWuvbgvJFl+9w7CPmiwFiIfgep9B4bTRez31pweIZiuB
         VeJFlU4ND0hlbFtj58Mc3P62nrWUqQ9raJy3cInOVy7o3bVdyGW5SQ9XD9VER0FAHUZ0
         M+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677761925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2vVmmF2sI36t+dGidCoWeCzXUPaa6cM0yHfnPJQrwvs=;
        b=cALm2qGX+RSJ+c4dhmavJbQDQPXVEiyk2Hz3qUkdn5+wfIJWGjgeJuPEMmXTaALq04
         7tDW4tIHH35rF2FgrpWFrZ2qwuBw6Jdv2bx2CGmQR0jXckPfqwpqi1RGswj+QZUMUMPl
         TRdnncwsq1NWmk3bWgRviF9gxZsKqDOFUcgQADja86gL5DfXmhRUzf79I46uFHtgC3B8
         AYWzgh8DP68Pe4lRG8ZZ8phjkApC52tSjX7EHOmk26zPKzs3r0Pxy8IAT+VgjpCXtINO
         vjjp14xRkJPS1hn8qSWgAMp9tCLCycIVtvAqLyL/go/9pIERPy94PvtWTplGR4Nm8fN6
         T+cg==
X-Gm-Message-State: AO0yUKUYYxTQ8Kt0ALtRutpCG8ivKsMrI5uDTWgoFpvnNjSmZSx39zYH
        EFdRXIiSw1YXMvU1EIXmQnSR5w==
X-Google-Smtp-Source: AK7set9yzFoHBRZALvxYMI2qZ2Dhgl4YUhY3JtG91zpveRyK5yXkIoq9AHTSTjq6ovYpZ7Ra0ZwR7w==
X-Received: by 2002:aa7:c98c:0:b0:4ac:bdf3:36ca with SMTP id c12-20020aa7c98c000000b004acbdf336camr11290426edt.10.1677761925672;
        Thu, 02 Mar 2023 04:58:45 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d27-20020a50cd5b000000b004c0eac41829sm463097edj.63.2023.03.02.04.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 04:58:45 -0800 (PST)
Message-ID: <d29d44b2-3848-e64e-c397-9ccf6dba7eaa@linaro.org>
Date:   Thu, 2 Mar 2023 13:58:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 5/5] dt-bindings: gpio: Add Loongson-1 GPIO
To:     Keguang Zhang <keguang.zhang@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230302125215.214014-1-keguang.zhang@gmail.com>
 <20230302125215.214014-6-keguang.zhang@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230302125215.214014-6-keguang.zhang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02/03/2023 13:52, Keguang Zhang wrote:
> Add devicetree binding document for Loongson-1 GPIO.
> 
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> V1 -> V2: Use the same consistent quotes
>           Delete superfluous examples
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

