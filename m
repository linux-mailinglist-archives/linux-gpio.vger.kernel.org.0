Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 585D74CC17E
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Mar 2022 16:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234488AbiCCPiI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Mar 2022 10:38:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234566AbiCCPh7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Mar 2022 10:37:59 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F193192E3E
        for <linux-gpio@vger.kernel.org>; Thu,  3 Mar 2022 07:37:12 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F36B53F043
        for <linux-gpio@vger.kernel.org>; Thu,  3 Mar 2022 15:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646321831;
        bh=8DezQocHOANVzIXQp7GBe2DNdvF/29uXU4JAHaGAUrE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=mKu5q2hkeuDMb8ll8yCUTTZM2EHGprUJ4Ph5lqOMmJL80i8dMZRAqhBplz1H0T5wz
         XLl+c99Z9BYN+Hlod87DaLUeK5AB4Q3B35YRIpnYJmu3VWHhv7eKg63bTrO0hxwG6V
         aXdLEdGagT5pwNUGvN9K2LVm8kjGd0du0eJQJjbkzmKVmcqvSN08WDwRFFewLoyh+d
         gk9uo/Tx0M+Yz09BCy21PLHN4k4vjHrfyTq05erealPeMh10tVajN3rUUvchUzT/jz
         61Pau2j/mvozZ6U1wm8SjMcRYnUcTCU+oIwgMxOW1LlASABBYCbqcQqDWgxzDqELG/
         rwJSRIamyIZUA==
Received: by mail-ej1-f70.google.com with SMTP id sa7-20020a170906eda700b006d1b130d65bso2908904ejb.13
        for <linux-gpio@vger.kernel.org>; Thu, 03 Mar 2022 07:37:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8DezQocHOANVzIXQp7GBe2DNdvF/29uXU4JAHaGAUrE=;
        b=ubXdIBqWYlOncJrh5IBiL3qcL2vjp4lDvlUSmO5ySxkKBTsCcFTmx9SjlzQO1YBT2F
         5lKbI/OQSocwkQCyGJK6eqcwThzLWiA/oZuAUCkhm/ikRX2HfOxMMi4Rrg4RojhtHQXG
         2+gusDN/x/0LKFqYl6cWSP6vHD7vU6GQKjrUZTo41r8SFX+zKfO6m0XQQXE66yGgLCIA
         XlY/byBRfNJ04+FGUwT/NEeJtMd70yYE4JBuBX+8bbv7jTsm0IeUeAtSzdUETIUIh7fA
         KECHwNTquzW1xBrujqq6+fwFFxysTvaai15l+LXvz8jTpM8jIpvzLiBsTAaDiHWlwc3p
         BzNQ==
X-Gm-Message-State: AOAM5313+UYJCrJKPtFsm2a8ppyxteSmngY4orQ2QYsrBwJIuVLOt2VR
        u9CiNUo+WYX/J6lsJYpORgKQzw7M5NJWMWhQ7/3RlU2mwmsYBvWFk9waUMgwo4xT5/jPQscvxKr
        vN2STfNRbBDR++PEY5pDLHr0zo8uXflTb16RDafs=
X-Received: by 2002:a05:6402:5150:b0:415:de72:5384 with SMTP id n16-20020a056402515000b00415de725384mr3251289edd.273.1646321830722;
        Thu, 03 Mar 2022 07:37:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuGas3Tunwgz5F3zcC5Firl26y2pjjUMIjqfXRcAT+U15otBYle/YgV3gbGaIkBzdsY2NVUA==
X-Received: by 2002:a05:6402:5150:b0:415:de72:5384 with SMTP id n16-20020a056402515000b00415de725384mr3251268edd.273.1646321830509;
        Thu, 03 Mar 2022 07:37:10 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id q10-20020aa7cc0a000000b0040f826f09fdsm958428edt.81.2022.03.03.07.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 07:37:09 -0800 (PST)
Message-ID: <58e10c95-902a-bdf3-15e6-616e4d2cda7f@canonical.com>
Date:   Thu, 3 Mar 2022 16:37:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Convert i.MX7D to json-schema
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220303150653.1903910-1-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220303150653.1903910-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03/03/2022 16:06, Alexander Stein wrote:
> Convert the i.MX7D pinctrl binding to DT schema format using json-schema
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../bindings/pinctrl/fsl,imx7d-pinctrl.txt    |  87 --------------
>  .../bindings/pinctrl/fsl,imx7d-pinctrl.yaml   | 113 ++++++++++++++++++
>  2 files changed, 113 insertions(+), 87 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
