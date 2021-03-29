Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFB034D0E3
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 15:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbhC2NET (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 09:04:19 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:39793 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbhC2NEA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 09:04:00 -0400
Received: by mail-oi1-f174.google.com with SMTP id i81so12986911oif.6;
        Mon, 29 Mar 2021 06:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Y1aIiE7SFwLQK579HkpbIqGKLeyiA5YPx8hVoVVgXFQ=;
        b=BcScOans1nnoINUCY/3Sal7AMheU5Qv7Di1q4kPXS1u+m6Ql8c0ORO+K4/SjLHWOro
         wCASqsrtGIDPpFT9SKvfk/l6oM/zEYLg2NFJU1DjQWEGws1i1Xgv5dZsdg7J8/Wcy3te
         0BOilnoXtGDPt2r51T1qfASUhF3D6yehoaz3Uc5R4uN3axIwZ/Sh1fF6p1Rk7bcXlvzG
         R4712kwEIaMQSVYbzoa/RHJkGKy+hwLBRSPWB3rGxyIGsg0pdMK0vrkBkPv2Dp/Kh57H
         +HRY2Sgyfb2EJZST7CYSiEr1qblpNKnBOIPj7HIbizOJ/KNtkXVO1Cty8fuUhIvY5X3o
         wrjw==
X-Gm-Message-State: AOAM531M3/Xvdike69TOlc7j3Fll88oMp8dwSy3p3F1RmK5aNg72estx
        GFIztVJDqJmb2gp26VxnOQ==
X-Google-Smtp-Source: ABdhPJxVuo/+GjIyZRUdPE+WRTKXBoClchzvVKeZT69JaPvZAiRQuZKQWu0b5ZjOPvHdZRAEBZmUjQ==
X-Received: by 2002:aca:6545:: with SMTP id j5mr18291241oiw.31.1617023038568;
        Mon, 29 Mar 2021 06:03:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w12sm4346423oti.53.2021.03.29.06.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 06:03:57 -0700 (PDT)
Received: (nullmailer pid 2404780 invoked by uid 1000);
        Mon, 29 Mar 2021 13:03:52 -0000
From:   Rob Herring <robh@kernel.org>
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, hui.liu@mediatek.com,
        sean.wang@mediatek.com, erin.lo@mediatek.com, jg_poxu@mediatek.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, biao.huang@mediatek.com,
        srv_heupstream@mediatek.com, matthias.bgg@gmail.com,
        linus.walleij@linaro.org, sean.wang@kernel.org,
        eddie.huang@mediatek.com, hongzhou.yang@mediatek.com,
        sj.huang@mediatek.com, seiya.wang@mediatek.com,
        linux-gpio@vger.kernel.org, robh+dt@kernel.org
In-Reply-To: <20210329065047.8388-3-zhiyong.tao@mediatek.com>
References: <20210329065047.8388-1-zhiyong.tao@mediatek.com> <20210329065047.8388-3-zhiyong.tao@mediatek.com>
Subject: Re: [PATCH 2/6] dt-bindings: pinctrl: mt8195: add binding document
Date:   Mon, 29 Mar 2021 08:03:52 -0500
Message-Id: <1617023032.510147.2404779.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 29 Mar 2021 14:50:43 +0800, Zhiyong Tao wrote:
> The commit adds mt8195 compatible node in binding document.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 152 ++++++++++++++++++
>  1 file changed, 152 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.example.dts:19:18: fatal error: dt-bindings/pinctrl/mt8195-pinfunc.h: No such file or directory
   19 |         #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:349: Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1380: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1459436

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

