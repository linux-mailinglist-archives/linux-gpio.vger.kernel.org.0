Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1F449358A
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jan 2022 08:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352036AbiASHfw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jan 2022 02:35:52 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37858
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1352026AbiASHfv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Jan 2022 02:35:51 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 51FFF4000F
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jan 2022 07:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642577745;
        bh=ov9egi5r5E4XVL9ynR9hw1P76CtrpDcSLc1Oc2aKDbw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=gxLylVZri5t+kiY0MNzi0fhQ8Dl/PG54f5u9ZZcsY628Q/6i+R64bBocxz65P7+vl
         VNxRJUMyFasYobCA3ZS8bYm15EF2VXHOIH7B2714u4BVzRK3cIRzc/Da1MILNdqfq3
         bfEj6dlhcCz3JeF+AwEf0fNY0VVpwaSOgUAAEHQ+ePTPnWVW8I19kCn2rLCTyiS5UZ
         vSTxd8pGkb/qxMQA5KG95pmfC9KufIfWCIh+l+EVz5pqR08qNDU4+OdL+5kPkUOMcq
         gxqAa5PWcR4Rfh5MfUPPbOk+R4tZL+ENpuveMWlnd8cKgI3eTOAt4UvJLpKgavUm69
         sguu60/4Uxr4Q==
Received: by mail-ed1-f72.google.com with SMTP id c11-20020a056402120b00b0040321cea9d4so1409932edw.23
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jan 2022 23:35:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ov9egi5r5E4XVL9ynR9hw1P76CtrpDcSLc1Oc2aKDbw=;
        b=eLqaa1OVAHuIIzf0+40pQvj05QTMsYE5xCNHa7je/OV0PIMUJavGW2m/3K5p4AoROV
         SJLjJ/sUidKMHN6sx1SUL/UyClC9YozWPYMFDauF7NB8ou5FWxaaaV4V0KxzyOIIXCTO
         lTT6bT2orrajMKe0xxSBpGl79eJnsf52pj0bxudWDu/++yEhOMj1MiWMpWFDoi4Br7Tl
         RbfOTmesRPvgHh/moYJ7wr5glXm+4+X7hLZM57zCBXUnh/hbLsLInGw333i5mXRCbY35
         sEVxssvYonZXQUa2pQ/A8jCNBK8u0Op2s5fvoArVIBCDtvOwbL7bzYN1uUQpWSvBrAre
         1J5Q==
X-Gm-Message-State: AOAM532NIAzfW6dChjFsUOBOYwuabOxRSsxawerlo14lFE6QHVo6y1q/
        NGGRSV+jSmfBnlJc9COc6xWfAhtKiKxcMkRYoGOPZeSnbGJX1vrAKE5Zhb4H/3ZoSFJVf2yTdye
        czZyvZTTK5CpU84R3wcOmHxPqWO7CWgU7JyuqfkY=
X-Received: by 2002:a05:6402:214b:: with SMTP id bq11mr21727236edb.380.1642577745079;
        Tue, 18 Jan 2022 23:35:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGlkI4a+0j+FDYNuwrTHdaztz/FiAtsum5k959TJvtVGlwEMpbTA7l76r5zGrSraIO2PK8xw==
X-Received: by 2002:a05:6402:214b:: with SMTP id bq11mr21727224edb.380.1642577744928;
        Tue, 18 Jan 2022 23:35:44 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id t25sm779819edr.90.2022.01.18.23.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 23:35:44 -0800 (PST)
Message-ID: <b303e38e-109b-e049-f536-c5b00830249b@canonical.com>
Date:   Wed, 19 Jan 2022 08:35:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] dt-bindings: Drop unnecessary pinctrl properties
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        - <patches@opensource.cirrus.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
        alsa-devel@alsa-project.org
References: <20220119015325.2438277-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220119015325.2438277-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19/01/2022 02:53, Rob Herring wrote:
> For a single pinctrl mode, it is not necessary to define pinctrl
> properties as the tools always allow pinctrl properties.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/rockchip/rockchip,rk3066-hdmi.yaml         |  8 --------
>  Documentation/devicetree/bindings/input/gpio-keys.yaml |  6 ------
>  .../devicetree/bindings/pinctrl/cirrus,lochnagar.yaml  |  9 ---------
>  .../devicetree/bindings/pinctrl/cirrus,madera.yaml     | 10 ----------
>  .../devicetree/bindings/sound/samsung-i2s.yaml         |  6 ------
>  5 files changed, 39 deletions(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
