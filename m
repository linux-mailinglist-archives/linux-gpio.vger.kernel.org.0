Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAACB34D804
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 21:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbhC2TWA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 15:22:00 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:46613 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbhC2TV2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 15:21:28 -0400
Received: by mail-ot1-f51.google.com with SMTP id 68-20020a9d0f4a0000b02901b663e6258dso13296198ott.13;
        Mon, 29 Mar 2021 12:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=ABMvZ9iUvOdLCSBOVI1wNxuXeT7prS5xQHqqnwlqeLM=;
        b=TxyKCN2b+IFpN6zYa+COtUl78u8LNQBTHAy8Esp0vC5NM/uS6PH68HGLI8Ig2tQT2o
         eM84hnWc/NOzsq2YLFM+SDu39nwNx+EBTXN7WmIHRrHYSA6fffNUP5iCMZgBV9LEimMn
         9jDCEBaXppfk206ZCrnDe7xlE5v99mgYH2MIqhL1LWHH4ZlZnAK9olAE+Cd1bjEUTLWL
         JR4895GGrSk2jMeLt0ZEn6HfCFB7U/TDzgfzOhipgy9ekyXsvj1QRyx09s+wNcxCXOr7
         rGyrE+IHmhnTA9/+Jp6bXT0F+wCA02rOlNjdvLvtCWkGAyqkf2mV5qOZZKOQZk11VqGA
         PqkA==
X-Gm-Message-State: AOAM531nsh9QFumJo5vvNSWS39JZFBgrR5/YZ3/NS2W4zKjYpB5Qujf1
        Zv/49Mpk4WcXyGmMGXrO5H+UirtnOA==
X-Google-Smtp-Source: ABdhPJwIFStn32vLNg0UX/TXSmm7jOFuFdUm4TdNpso1A3DPY9K9j909OAzRLcWQUCadrY2Pf09EsQ==
X-Received: by 2002:a9d:1c7:: with SMTP id e65mr23811411ote.259.1617045687465;
        Mon, 29 Mar 2021 12:21:27 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f2sm3949995oos.16.2021.03.29.12.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 12:21:26 -0700 (PDT)
Received: (nullmailer pid 2905696 invoked by uid 1000);
        Mon, 29 Mar 2021 19:21:24 -0000
From:   Rob Herring <robh@kernel.org>
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        biao.huang@mediatek.com, linus.walleij@linaro.org,
        hongzhou.yang@mediatek.com, srv_heupstream@mediatek.com,
        jg_poxu@mediatek.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, mark.rutland@arm.com,
        matthias.bgg@gmail.com, sean.wang@mediatek.com,
        linux-gpio@vger.kernel.org, erin.lo@mediatek.com,
        hui.liu@mediatek.com, sean.wang@kernel.org, sj.huang@mediatek.com,
        eddie.huang@mediatek.com, linux-mediatek@lists.infradead.org,
        seiya.wang@mediatek.com
In-Reply-To: <20210329113103.11003-3-zhiyong.tao@mediatek.com>
References: <20210329113103.11003-1-zhiyong.tao@mediatek.com> <20210329113103.11003-3-zhiyong.tao@mediatek.com>
Subject: Re: [PATCH Resend v0 2/6] dt-bindings: pinctrl: mt8195: add binding document
Date:   Mon, 29 Mar 2021 14:21:24 -0500
Message-Id: <1617045684.216718.2905695.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 29 Mar 2021 19:30:59 +0800, Zhiyong Tao wrote:
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

See https://patchwork.ozlabs.org/patch/1459558

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

