Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 599E43DAFA4
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 00:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234759AbhG2WyC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 18:54:02 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:44798 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbhG2WyB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jul 2021 18:54:01 -0400
Received: by mail-io1-f43.google.com with SMTP id l18so9121226ioh.11;
        Thu, 29 Jul 2021 15:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GzKTEl+aI5e4Vr90e7NxH6ppG4Jl145GBZiGyVIci40=;
        b=XlWztQNRypvFt1/llHNj89fbPNVI7CGJVahErCMNjvijyCNukamXm1N/6dXLi54osg
         CM74h6jjG7zVpG/6xVlpezLugzM2CbGsHbjxQQFPzxeXKeTvOlcPM2Q3Cx7/DMqv8Qvh
         euRZC5Ez6j0HCN09w62kqH99Iv3jIAyhtloDyCAtO2JFD1nuFeggvVTY/NffdwfACgNv
         9jzPQBanCSb2urlVKSR5M55bspwPuAqWJpFO7KAbS8FJdsiFHu5obCi8nXtlqbiPUZwb
         lCe3N+OEnbpppn2lCvrT6v7jZ67Yp1r+bwwLZ4nO2N8tH4vdsNeEt8ODsbN4xePulbvR
         w1OQ==
X-Gm-Message-State: AOAM533YGO8wu5m23PjizNJANAizGDAD8OveYcscHkTEMJeBzxQhB/Z0
        79hfbQX2wOql7P4Qend+ag==
X-Google-Smtp-Source: ABdhPJzhnT9o0KLHaaYhPruzpf12C4zNGzZkdtuvfbTedRgXSgZ4Vk/8rud1Rrd5UFQNmEltOmu1vw==
X-Received: by 2002:a02:a999:: with SMTP id q25mr6518689jam.16.1627599236588;
        Thu, 29 Jul 2021 15:53:56 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id l9sm2408722ilv.31.2021.07.29.15.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 15:53:56 -0700 (PDT)
Received: (nullmailer pid 1057877 invoked by uid 1000);
        Thu, 29 Jul 2021 22:53:53 -0000
Date:   Thu, 29 Jul 2021 16:53:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        Sean Wang <sean.wang@kernel.org>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        Matt Mackall <mpm@selenic.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, John Crispin <john@phrozen.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-crypto@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Seiya Wang <seiya.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 10/12] dt-bindings: watchdog: Add compatible for Mediatek
 MT7986
Message-ID: <YQMxgbD4j+SrXaSQ@robh.at.kernel.org>
References: <20210726071439.14248-1-sam.shih@mediatek.com>
 <20210726071439.14248-11-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726071439.14248-11-sam.shih@mediatek.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 26 Jul 2021 15:14:37 +0800, Sam Shih wrote:
> This commit adds dt-binding documentation of watchdog for Mediatek MT7986
> SoC Platform.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
