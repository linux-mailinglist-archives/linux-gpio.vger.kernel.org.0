Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2FE73DAF94
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 00:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234112AbhG2WwF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 18:52:05 -0400
Received: from mail-il1-f175.google.com ([209.85.166.175]:35384 "EHLO
        mail-il1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233516AbhG2WwE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jul 2021 18:52:04 -0400
Received: by mail-il1-f175.google.com with SMTP id k3so7521974ilu.2;
        Thu, 29 Jul 2021 15:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HTJgy5VBZ0oMAHE9O7XmVIIL13K6DpLlQbEnJdwiDGg=;
        b=OF6eWnj6UqpObP2sdHK+/Ft6tkpDnVFyJ0xfj7h9G/Gj1gVWlgjL7MzL5esgEyBhWL
         AseMY5oM0LlseADRhQqkrBrmJPyEXQjbR+AAmy72j9o7TkSVaXzA7Ma5h2vSk4VLmG5V
         cMgCahwcqp0guGdJzUlKWsw06DQQ6qe5fDim1Dg5TvHCb7HMWw/hpwm9d/2ZV/NYLLrL
         eyxaKb9tVDnZzm+3tnP/D3TXvN5lxGk2bPzg1+AWCKsVvTug9IDFHWUyuH1yIrRuRdjk
         ReOHy6JgtM+i7+pejCgXGD656HA4X22cEhrz2AUwlGMI32f4hReY//VuR63bbMc27Hk+
         VW2w==
X-Gm-Message-State: AOAM531qBzBpu8qbCAYoRTxIfiy+Ry5vw33bTCEn6t1O96vpims1RPC5
        hmPhO58EuX1swAP6HRpJuA==
X-Google-Smtp-Source: ABdhPJxvwdp6rY9SUaluCLYLkZoGuVPcomNzfE5Ygq462J5Max8ViPgmc099fsR25cf7mnvNu3kFRQ==
X-Received: by 2002:a05:6e02:2162:: with SMTP id s2mr5369766ilv.99.1627599120624;
        Thu, 29 Jul 2021 15:52:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q11sm1623611ile.71.2021.07.29.15.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 15:51:59 -0700 (PDT)
Received: (nullmailer pid 1054722 invoked by uid 1000);
        Thu, 29 Jul 2021 22:51:56 -0000
Date:   Thu, 29 Jul 2021 16:51:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     Seiya Wang <seiya.wang@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-watchdog@vger.kernel.org, Ryder Lee <Ryder.Lee@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>, linux-clk@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Sean Wang <sean.wang@kernel.org>, linux-serial@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Matt Mackall <mpm@selenic.com>,
        John Crispin <john@phrozen.org>,
        Fabien Parent <fparent@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH 07/12] dt-bindings: arm64: dts: mediatek: Add mt7986
 series
Message-ID: <YQMxDIKR6+mR0gZt@robh.at.kernel.org>
References: <20210726071439.14248-1-sam.shih@mediatek.com>
 <20210726071439.14248-8-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726071439.14248-8-sam.shih@mediatek.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 26 Jul 2021 15:14:34 +0800, Sam Shih wrote:
> MT7986 is Mediatek's new 4-core SoC, which is mainly for wifi-router
> application. The difference between mt7986a and mt7986b is that some
> pins do not exist on mt7986b.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
