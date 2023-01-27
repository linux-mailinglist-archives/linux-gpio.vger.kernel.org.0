Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31AA567EA75
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 17:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234564AbjA0QK2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 11:10:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234640AbjA0QKX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 11:10:23 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0105775795
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 08:10:18 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id n7so5413766wrx.5
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 08:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c5c1eedNjG2GtgvM7btwPNhYOwNRimSFdJYoD2846dk=;
        b=vnyG2N7BkeFCq1NOoffzeAQTOuKZslMEMR5Q3TJ9vmmrorqaKr7pwMRiUSw2e4iCCC
         j9AMFbrYb54DJJUr8V6aT9WZ8gHVrc3IznywBBaoQ0+HHE7+H+g5+MF4O5mjotIa5zdi
         fet/sywe0/BhWHPnE4jh1D0NtNSEqCzyxrNz6PZwbnrEu3dVC6qq5CAr6eWCyryV5EX/
         letUfNSsTcZDMyjaFulOLpGHebkKkpIQqZedsOcle+nJAz7QYaR2bASHFsXttnu/9K4T
         axFTwSV8QblZvUgU/a/Zg0ulDkbWpEkASBtQrmKYPYIM1TAJXIPmQJoH7ne6ZdRoD/K8
         22kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c5c1eedNjG2GtgvM7btwPNhYOwNRimSFdJYoD2846dk=;
        b=2wyyHYpGR9YsijQhQV1+O6D7Lyk1RuChXsdLHCHnmfMJrnKnFAAC2I32LBfgHhygne
         SZ1MQQ5eXO5URuhnA8KU2K0uONzR5ec4e5MhrbprE4QOeE7BFYutQaGWCL425OgZo5uS
         3zRtp3lr0Td+dBbU9Q83T3R0Bs+4YgkOSutmdGq70Qs3YAxFxq4lK8IPkJoCERMYNrbT
         Z3IInJYP0EZe+b/rvcFllP8gzItuMITATiDMioVjHTkPEjxP/Ecu5bzZ4+kfI/oQeEjD
         4eezpD0lpJW9V0B1vQcuX/iRZEJF+txNYrZkgwwPVNx74ztRccIWkiY+132QwVrWP2Vj
         dSYQ==
X-Gm-Message-State: AO0yUKXOXHH/tXBHVrb/D7deGQwpYZQhPMYdZJqXbxUkwIZyBRWx96im
        fUbeRXWtOQHJtR0+Ui/yaiUZLQXCD48gxPba
X-Google-Smtp-Source: AK7set9fC9KDLzGG5uo35qWPcOMhPWvuhV8kzWwn2bTk49e9kuY/12RAcoiVciK7zU73a00qjeojCg==
X-Received: by 2002:a5d:5541:0:b0:2bf:c0e4:1bc5 with SMTP id g1-20020a5d5541000000b002bfc0e41bc5mr6984696wrw.56.1674835817538;
        Fri, 27 Jan 2023 08:10:17 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n9-20020a5d67c9000000b00294176c2c01sm4307168wrw.86.2023.01.27.08.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 08:10:17 -0800 (PST)
Message-ID: <6b5e20a3-69ba-aceb-5402-853729e73266@linaro.org>
Date:   Fri, 27 Jan 2023 17:10:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: describe sa8775p-tlmm
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230127154426.173863-1-brgl@bgdev.pl>
 <20230127154426.173863-2-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230127154426.173863-2-brgl@bgdev.pl>
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

On 27/01/2023 16:44, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add DT bindings for the TLMM controller on sa8775p platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thank you for your patch. There is something to discuss/improve.

> +  reg:
> +    maxItems: 1
> +
> +  interrupts: true
> +  interrupt-controller: true
> +  "#interrupt-cells": true
> +  gpio-controller: true
> +  "#gpio-cells": true
> +  gpio-ranges: true

Blank line here.

> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 74

Blank line.

> +  gpio-line-names:
> +    maxItems: 148

Your GPIO pattern suggests you have 149 GPIOs. Something has to be
fixed. If this is 149, then reserved ranges is up to 75.

> +
> +required:
> +  - compatible
> +  - reg
> +


Best regards,
Krzysztof

