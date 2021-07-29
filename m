Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798093DAF8A
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 00:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234742AbhG2WvY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 18:51:24 -0400
Received: from mail-il1-f182.google.com ([209.85.166.182]:37600 "EHLO
        mail-il1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233516AbhG2WvY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jul 2021 18:51:24 -0400
Received: by mail-il1-f182.google.com with SMTP id f8so4233643ilr.4;
        Thu, 29 Jul 2021 15:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gWxlLweJQNhlRL0/DUplNg/SDpZzR8jOTWXmRYnCmmM=;
        b=Bi0yjGdIhXjemqjPOO154CMwklK84Khb7/q3Wh6wH0mkFr6MRimKpfBtBvt8zovw7I
         6FTZhRAbJ+JsORqQCTVUoPQ+U9UT1e2RQw5xqoog/KXuKs0h9onjSFd9553p/5iRwP43
         dZTfBoriCh1Kb6FAFENYiDHaTAAeibBoN/q31oLgQZrlNDTan8dgOD80c2DdnLdmmVGq
         DEC0WN2aPf0F4hsXDFdYOMVZKCz05/oe+f/JyljB6xBVFIPYFoWji++p+VwBH1iCxK2y
         3ray4urJXQnkWDERTcp/Syg+Z+169fuQGaNQ/LQB36vlQlkv6mzIcpUMDQo3EvtjUJFC
         Ie2Q==
X-Gm-Message-State: AOAM533sKVbd02/odHW54/JpG44p5dJKeY7LamurhxZPKb8gmd13lIon
        6ePyYTTTbpnfJ9SL8sAk3g==
X-Google-Smtp-Source: ABdhPJxE0S6s3FLD5yKTnzi2Pn4YDBkze8cQUCq7Ay/b4kKYHPu7HwjO3npjdwNFKoGRGzq9+QqVrg==
X-Received: by 2002:a05:6e02:d09:: with SMTP id g9mr39729ilj.153.1627599078974;
        Thu, 29 Jul 2021 15:51:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r3sm2500646ilg.20.2021.07.29.15.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 15:51:18 -0700 (PDT)
Received: (nullmailer pid 1053555 invoked by uid 1000);
        Thu, 29 Jul 2021 22:51:15 -0000
Date:   Thu, 29 Jul 2021 16:51:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-clk@vger.kernel.org, John Crispin <john@phrozen.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>
Subject: Re: [PATCH 05/12] dt-bindings: pinctrl: update bindings for MT7986
 SoC
Message-ID: <YQMw4zbhxCTqXqLC@robh.at.kernel.org>
References: <20210726071439.14248-1-sam.shih@mediatek.com>
 <20210726071439.14248-6-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726071439.14248-6-sam.shih@mediatek.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 26, 2021 at 03:14:32PM +0800, Sam Shih wrote:
> This updates bindings for MT7986 pinctrl driver.
> The difference of pinctrl between mt7986a and mt7986b
> is that pin-41 to pin-65 do not exist on mt7986b

Sounds like you could use the same compatible string. Wouldn't the DT 
for mt7986b simply not have any config for those pins?

> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt7622.txt       | 284 ++++++++++++++++++
>  1 file changed, 284 insertions(+)

This is a big change. Please convert to a schema. It probably should be 
a separate schema.
