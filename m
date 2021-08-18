Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E683EF76E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Aug 2021 03:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237475AbhHRBUm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Aug 2021 21:20:42 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:40618 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234828AbhHRBUm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Aug 2021 21:20:42 -0400
Received: by mail-oi1-f176.google.com with SMTP id r5so2103218oiw.7;
        Tue, 17 Aug 2021 18:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+z3ILV1fVhurBfPQC3iXBEQ2csZiT8sJKpTVvArWqCg=;
        b=dCT2B6uD0xRv59J/Bhamr4Bf30ixKL85hJFnjcCr8r3MpApieeKtMBar0itEWdMQfR
         gHYJcxTRozmkIiRBxHf2kyKEchGiHUQgXDVNO6++lvaf9Dz3zqrTcMqS2lu+l23/alzN
         Ie8BsHJRIg7IcG1g8JpW7tSO+Zx4gvOVCPyZh3NEDNtgdzf5C1J7DcPiTVSicTDuFt0H
         cw9aUrbeuW07EYGYZg1MVcxVptagP6Cq5zeH07n7DXzo/TKco75xtBnSgIU3WrHRIL6S
         3yKV2rBtEt+3w3kNZf+izqy9YYLsCyIoGiFt4XoZw+AKPI/YeEwutHsbFz5Ql/aLsKan
         8U7A==
X-Gm-Message-State: AOAM533Goho6oyANbJ/H91TQ/VZVoJQeUY2cHgj/TeUpDlHT72+FZ3HX
        h+iEnWKbgcUGa+gTNnshug==
X-Google-Smtp-Source: ABdhPJxQxcNn3z/Tx3n1n06qxWShd5xmbfoiTFU7Ma9Drddtx9IGPWVaSH8gdzWvG7uNbFGtcCC5rg==
X-Received: by 2002:a54:4714:: with SMTP id k20mr4720831oik.103.1629249607974;
        Tue, 17 Aug 2021 18:20:07 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o68sm735648ota.33.2021.08.17.18.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 18:20:07 -0700 (PDT)
Received: (nullmailer pid 1182094 invoked by uid 1000);
        Wed, 18 Aug 2021 01:20:05 -0000
Date:   Tue, 17 Aug 2021 20:20:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     John Crispin <john@phrozen.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        devicetree@vger.kernel.org, Sean Wang <sean.wang@kernel.org>,
        linux-watchdog@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-gpio@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ryder Lee <Ryder.Lee@mediatek.com>,
        Matt Mackall <mpm@selenic.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-serial@vger.kernel.org, Seiya Wang <seiya.wang@mediatek.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Fabien Parent <fparent@baylibre.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-mediatek@lists.infradead.org,
        Hsin-Yi Wang <hsinyi@chromium.org>, linux-clk@vger.kernel.org
Subject: Re: [v2,01/12] dt-bindings: clock: mediatek: document clk bindings
 for mediatek mt7986 SoC
Message-ID: <YRxgRZ5VyXSPqY42@robh.at.kernel.org>
References: <20210817074557.30953-1-sam.shih@mediatek.com>
 <20210817074557.30953-2-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817074557.30953-2-sam.shih@mediatek.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 17 Aug 2021 15:45:46 +0800, Sam Shih wrote:
> This patch adds the binding documentation for topckgen, apmixedsys,
> infracfg, and ethernet subsystem clocks.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
> v2: remove compatiable string 'mt7986-sgmiisys'
> 
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt    | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,ethsys.txt        | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,infracfg.txt      | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt      | 2 ++
>  .../devicetree/bindings/arm/mediatek/mediatek,topckgen.txt      | 1 +
>  5 files changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
