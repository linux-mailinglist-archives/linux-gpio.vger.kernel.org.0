Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 535403FCF75
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Sep 2021 00:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239631AbhHaWKe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 18:10:34 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:41628 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbhHaWKd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Aug 2021 18:10:33 -0400
Received: by mail-oi1-f177.google.com with SMTP id 6so1157632oiy.8;
        Tue, 31 Aug 2021 15:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HmcikI+VA0QWzI/qoUl+fgTIxA58N+W9f1DbteKD1V8=;
        b=oa8ZFYJ6r0jAzns15dymxo9r/iCsdEuLMlH54qJSYcUiNL6xlQXqVvpeEs5vgBlFyl
         44SkU+jYIU0iGNXmRr5AJ2v8WVVDNivTjsLnMP3wdS0AiCHqKIFFVX+SXFmoz+Bz3ZKh
         ib9nKvUpzsG+4Wj6eHkAQIAE3W8lhD21JM4V4f9gDWkPcXj3v9136a2gXGwMcQYw+8Rp
         vmtgDdSIkEG2HEz3XYr2/aXBZXlOTN3LNIVG5yt4n0ImNwO9oggVvZgmoy6rmK7YedmQ
         XTHQ/WSIK89SB3TMEjO6xE6ls5L0Eb5xPOYxNaOT3oq5atrMc2m49DnNPMRq2IyBLK9D
         eYvw==
X-Gm-Message-State: AOAM53328AhyhFsCGp/DeHQh5CBx5MHoaP6Ros9kw3RBNE01RVPXzuWv
        BpFaekWBXzuzjzxygktqs7PH+pEXlw==
X-Google-Smtp-Source: ABdhPJx82+Qn2N1AOPfd4yPM8R+IFiObvLLyMQ4j+UpyO87vSVMNNDAUlqu/L4TPpkcu9FUWchm5qw==
X-Received: by 2002:aca:be56:: with SMTP id o83mr4847542oif.51.1630447777584;
        Tue, 31 Aug 2021 15:09:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id y66sm3900548oia.12.2021.08.31.15.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 15:09:36 -0700 (PDT)
Received: (nullmailer pid 730620 invoked by uid 1000);
        Tue, 31 Aug 2021 22:09:35 -0000
Date:   Tue, 31 Aug 2021 17:09:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     biao.huang@mediatek.com, devicetree@vger.kernel.org,
        eddie.huang@mediatek.com, sean.wang@mediatek.com,
        mark.rutland@arm.com, light.hsieh@mediatek.com,
        srv_heupstream@mediatek.com, matthias.bgg@gmail.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        seiya.wang@mediatek.com, hongzhou.yang@mediatek.com,
        sean.wang@kernel.org, linux-mediatek@lists.infradead.org,
        robh+dt@kernel.org, linus.walleij@linaro.org, hui.liu@mediatek.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 1/4] dt-bindings: pinctrl: mt8195: add rsel define
Message-ID: <YS6onwnr4Lo8VPDA@robh.at.kernel.org>
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-2-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210830003603.31864-2-zhiyong.tao@mediatek.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 30 Aug 2021 08:36:00 +0800, Zhiyong Tao wrote:
> This patch adds rsel define for mt8195.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  include/dt-bindings/pinctrl/mt65xx.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
