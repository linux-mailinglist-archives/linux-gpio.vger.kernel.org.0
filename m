Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D044C3FCF7A
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Sep 2021 00:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240063AbhHaWN6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 18:13:58 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:47005 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232930AbhHaWN5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Aug 2021 18:13:57 -0400
Received: by mail-ot1-f53.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso1027267ott.13;
        Tue, 31 Aug 2021 15:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZX+HYfB8T7lqB7oM6NTvI7e2KeIFR4Q4WaO7nRRDb5k=;
        b=uQ9gmU/zOL7qRUli1Nx+Ud/EDa7nXpGGhcoeCtN1kAwnE4lBu0861dagCGDt2crkEw
         ANQXk2ImqM1V927oA9gOM69TC3hgKV7DK+wRqb9iun2QK7NzN492vJe7lTj4oadPHmXQ
         bNkzF7iGycV+ShhvQJPHyl+suZrTBBRxeABQqug9QxxKJg1PEnK488LH9iXNkiZxj2wc
         4cHqGefjOk/EeSiWzTRhacDopVNb/2FQYa9j/rwj0sv+dxW4pscFhKkwV1NthNfondJh
         tpddiXpSi7fA6SfjvdrO0UBpLxxuEeik5J9Nwn6PdbRcuZ08lgF6g8EcTckjORCt1Cxs
         m+ew==
X-Gm-Message-State: AOAM533oVmQUl5/CvXBKPjqsS8y93C0U4A6+Z5tVyKyU2t0vQ7yelMHk
        f8hTFc636cDWb599vkd3vw==
X-Google-Smtp-Source: ABdhPJxjm1/Aq+KESj1LLY5oPb7CeYJ3OoUGohOGiGVBqGpgGf4+usowBjaHVrFMsg2fj3gJPvibvA==
X-Received: by 2002:a9d:2053:: with SMTP id n77mr27506291ota.9.1630447981665;
        Tue, 31 Aug 2021 15:13:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v24sm4221903ote.66.2021.08.31.15.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 15:13:01 -0700 (PDT)
Received: (nullmailer pid 735476 invoked by uid 1000);
        Tue, 31 Aug 2021 22:13:00 -0000
Date:   Tue, 31 Aug 2021 17:13:00 -0500
From:   Rob Herring <robh@kernel.org>
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     linus.walleij@linaro.org, mark.rutland@arm.com,
        matthias.bgg@gmail.com, sean.wang@kernel.org,
        srv_heupstream@mediatek.com, hui.liu@mediatek.com,
        eddie.huang@mediatek.com, light.hsieh@mediatek.com,
        biao.huang@mediatek.com, hongzhou.yang@mediatek.com,
        sean.wang@mediatek.com, seiya.wang@mediatek.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v11 2/4] dt-bindings: pinctrl: mt8195: change pull
 up/down description
Message-ID: <YS6pbO4hmNyX//tP@robh.at.kernel.org>
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-3-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210830003603.31864-3-zhiyong.tao@mediatek.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 30, 2021 at 08:36:01AM +0800, Zhiyong Tao wrote:
> Change pull up/down description

Every commit is a 'change'. Your commit msg should explain 'why', not 
what the diff is.

> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 32 +++++++++++++++++--
>  1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> index 2f12ec59eee5..a341ed9f0095 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> @@ -85,9 +85,35 @@ patternProperties:
>            2/4/6/8/10/12/14/16mA in mt8195.
>          enum: [0, 1, 2, 3, 4, 5, 6, 7]
>  
> -      bias-pull-down: true
> -
> -      bias-pull-up: true
> +      bias-pull-down:
> +        description: |
> +          For pull down type is normal, it don't need add RSEL & R1R0 define
> +          and resistance value.
> +          For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
> +          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
> +          define in mt8195.
> +          For pull down type is RSEL, it can add RSEL define & resistance value(ohm)
> +          to set different resistance. It can support "MTK_PULL_SET_RSEL_000" &
> +          "MTK_PULL_SET_RSEL_001" & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
> +          "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" &
> +          "MTK_PULL_SET_RSEL_111" define in mt8195. It can also support resistance value(ohm)
> +          "75000" & "5000" in mt8195.

Sounds like constraints on the values. Please write a schema.

> +
> +      bias-pull-up:
> +        description: |
> +          For pull up type is normal, it don't need add RSEL & R1R0 define
> +          and resistance value.
> +          For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
> +          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
> +          define in mt8195.
> +          For pull up type is RSEL, it can add RSEL define & resistance value(ohm)
> +          to set different resistance. It can support "MTK_PULL_SET_RSEL_000" &
> +          "MTK_PULL_SET_RSEL_001" & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
> +          "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" &
> +          "MTK_PULL_SET_RSEL_111" define in mt8195. It can also support resistance value(ohm)
> +          "1000" & "1500" & "2000" & "3000" & "4000" & "5000" & "10000" & "75000" in mt8195.
>  
>        bias-disable: true
>  
> -- 
> 2.18.0
> 
> 
