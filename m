Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55B83EF1EC
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Aug 2021 20:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233165AbhHQSft (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Aug 2021 14:35:49 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:44929 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232351AbhHQSft (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Aug 2021 14:35:49 -0400
Received: by mail-oi1-f170.google.com with SMTP id w6so439852oiv.11;
        Tue, 17 Aug 2021 11:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/UUvHVstpSmeWABSjaVWOHHhgWPHGVYAwroY70/1r94=;
        b=nHLj/+3Kc/8ZkYMmQ8YSehgvh7z9YuywpQytNAP4Z1NZWnUgYlit5MTTrnpyGBRaq/
         qLNpizLVS77kAwJELa2ZP2Y2NAIxIrjJqXYRM01UyzJxHXVWNm9DaEAN7LEl1yzHUb5t
         +FKJeIleMm9UB9matX4ugFyopEbxEXz+nvCO7v9U2B/Vc7ZQpL4vSzgiYv+xi/960sVf
         7r+jcbKs7mqf/JwwGM1Zv4Dpf3B8xg3Cx/Nz8sDb4pB3VYG+YcEGGI3i9O6LC3jccjGP
         fnKOfGsXpXP2OKhM8PSL0+R0Ws2HQJoyp/VeiUYRzt2xr6o8oKE5nJ+QuWZj1xdIjp0o
         c9nA==
X-Gm-Message-State: AOAM532kvBMbEXYKCp3WWXihxlR/g9vBDLjYPAzUogdcgTIPoydaU3uj
        WcNKIdqsJJVY6v3qecgLfw==
X-Google-Smtp-Source: ABdhPJxHDyYdGDQTyFagNlU1mVrzpbwIf8BHui2z91Z+R5Jv1ubcn+BSVtrJieSjNOPPeBcp9iqtag==
X-Received: by 2002:a05:6808:1807:: with SMTP id bh7mr3621195oib.52.1629225314988;
        Tue, 17 Aug 2021 11:35:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p2sm634161oip.35.2021.08.17.11.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 11:35:14 -0700 (PDT)
Received: (nullmailer pid 618703 invoked by uid 1000);
        Tue, 17 Aug 2021 18:35:12 -0000
Date:   Tue, 17 Aug 2021 13:35:12 -0500
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
Subject: Re: [v2,08/12] dt-bindings: rng: mediatek: add mt7986 to mtk rng
 binding
Message-ID: <YRwBYJmfAQ/3hGuI@robh.at.kernel.org>
References: <20210817074557.30953-1-sam.shih@mediatek.com>
 <20210817074557.30953-9-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817074557.30953-9-sam.shih@mediatek.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 17, 2021 at 03:45:53PM +0800, Sam Shih wrote:
> Add RNG binding for MT7986 SoC.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v2: patch v1 has been applied

Then don't send the patch again.

Rob
