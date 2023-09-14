Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E966C79FB3D
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Sep 2023 07:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235348AbjINFrr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Sep 2023 01:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235344AbjINFri (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Sep 2023 01:47:38 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF241738
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 22:47:34 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99bcc0adab4so71967666b.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 22:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694670451; x=1695275251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aRwKx+aVUNdsT/yRs8dmsSCK+EhxcclEATZc5SW5dvk=;
        b=CwWSiijddI8KOTo71TaKJsUGwgeBO4AN7smiA5V2bM9M8y4U4SD4p/fdw4XAdGZCfZ
         EYtqIyqM0mLEA5SQWraJ28eSVvGIaMvQH7dTVClICZYrXItPEdFI/3aQtTfviakmiBbK
         Kf4kwbQxsiaOpvWN7tXvonFaXbHDw781u+HpcmCbjnjevh3AZUc9GkuPhFVLljXSjuuS
         vEGbEzXp5D4zbv6Csr+Xd6rmo0O9QlKyK88AZ7KTWDmzRA27fLa//HkhMtwYdIle97sF
         t/Hee40bl4FrF62ndwIWyOIVGsp8B82jDILjRu87kasYqXwZuJfg8h2fyuZsaql76Z4X
         QKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694670451; x=1695275251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aRwKx+aVUNdsT/yRs8dmsSCK+EhxcclEATZc5SW5dvk=;
        b=fjQdl4idgtbTqBq0bddZfqH7Yclac/EdlgeD3vPeo6CdgeM3k+Kn9E/CeBZJxZiZtR
         2tHKC/ku2F7xD0jnW+xZlHKop9jeOORbxUurJ41gekG3bSvjWaVNrsKpuGfnlEK+VwBk
         uG1QzxZ2OczIgaYXOQ8P/CQJtNR6XmyWDFAgGKUZ/HxVD2gEsmMFQe95yQ9efehH1+ie
         QwlKdyhUDKkqS3xZyAgMYqDjdiRGhJVCWudfgKNjO5DRlcIMc/FfugWfnbnDidxxxp28
         VV4GvREu6bJO2505get99CrDes+IiaYMr2f/2rrnXsj3qqIxBM2fHyaWovaRsxYIlpiX
         o9MA==
X-Gm-Message-State: AOJu0YyPHdDwOWeZdl+bPFtM8GGy5WSteHTrGSPqdhldig18smRNdgPH
        Nr1EB0gcxg/jWwOeFMQrQA8vqA==
X-Google-Smtp-Source: AGHT+IGxTh/8mNU2+nmm+vM8YqApu/9J2UNCKeeNHOXZXyiuYhSXCWhblzjZH7lFirW7vVAD2E7tLA==
X-Received: by 2002:a17:906:e:b0:9a2:2635:daa9 with SMTP id 14-20020a170906000e00b009a22635daa9mr3555311eja.6.1694670451368;
        Wed, 13 Sep 2023 22:47:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id gy18-20020a170906f25200b00991d54db2acsm484864ejb.44.2023.09.13.22.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 22:47:30 -0700 (PDT)
Message-ID: <4520fa76-8645-a438-ba7d-ef50c9781249@linaro.org>
Date:   Thu, 14 Sep 2023 07:47:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/5] dt-bindings: gpio: vf610: correct i.MX8ULP and i.MX93
 interrupts
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>
References: <20230914-vf610-gpio-v1-0-3ed418182a6a@nxp.com>
 <20230914-vf610-gpio-v1-1-3ed418182a6a@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230914-vf610-gpio-v1-1-3ed418182a6a@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14/09/2023 04:20, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX8ULP and i.MX93 actually has two interrupts for each gpio
> controller, one for

...

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,vf610-gpio
> +              - fsl,imx7ulp-gpio
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 2

Instead describe the items with "items:" and descriptions.

Best regards,
Krzysztof

