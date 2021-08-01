Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 990563DCDD0
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Aug 2021 22:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbhHAUtA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 1 Aug 2021 16:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbhHAUtA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 1 Aug 2021 16:49:00 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E195C06175F;
        Sun,  1 Aug 2021 13:48:51 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id c7-20020a9d27870000b02904d360fbc71bso15598963otb.10;
        Sun, 01 Aug 2021 13:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3wDs4TscZnBfih/RoUBpjRLjosLDw2uLwbF2csntLTo=;
        b=IxfENPjH2e4w5qRT7ASIYRIozgQ+/sX8NCAKqSMc6b8w5WRry3ukSep3aE2Fdahxn6
         06QxofQwMZSunlFhvJ35+J6SYxpVw2+IItEPpV3WL1PO9zjtPi3cPwE4M4guMKfNdiTn
         d06Vtv5iYNjJAk6E3J1cmLMEqxDXekYvaqh8C3R2LpUrtBoMXTXuHEp7GWlQfesx7fKI
         ZmAVqd7Z/Xjr6/bA44sAEb95fSmTPw3Apd/Up7D3P/GfAn3D4X6TmYn4VU0nBl12ATDj
         KCwnHIE1lE8wm7IwmhLBMER1of3SIGWivzBShnm66w1mNspn295cJaqgc5CW/yRPXXY/
         0YTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=3wDs4TscZnBfih/RoUBpjRLjosLDw2uLwbF2csntLTo=;
        b=duCQPL6C6rFZ9lVO21qEAQz/CC9lC1KScbt3yZox+09MfKhslBZpyWW/0FcEVUHKd6
         LxF1tNa418mes8hVr5/aaDXl4tG8EIeFM9j4mdJslLyR+aCpWrGHwmqU+th2YyRFxzA8
         Zp2Br76PK440LkTVBoxlJTVzOPcH3qACyH43M3LApouNLTqDFUUoQEDyncdhmPoQV7vd
         f1pZIn6ruWSgVYy4j4+298ooC2tAAGmfYtTzZoqjVCWh5r4avvPIRfrOpdT8CL5SwNsC
         aKFJa7bJI54wUG1epTWXRwhQU/JdVSW4AEVA+zk0zjvnS4tcaMy4Q8i0pZlmF4+KkkES
         Y00w==
X-Gm-Message-State: AOAM531/ra+0E64sHJ1R99ee+uhmtWskrv7g0jiJ4fWFzvQtEagtlLXI
        LlEa4maE6aDQ3M//fMR2vpA=
X-Google-Smtp-Source: ABdhPJzlGbNGz7fO6f3aMCFJPAHsiwpnrYGwxdWj9tPS+NunUjP161qUG9vYt6Ii2t5StdpPw6vNDQ==
X-Received: by 2002:a9d:26a:: with SMTP id 97mr9282002otb.333.1627850930545;
        Sun, 01 Aug 2021 13:48:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c11sm1559290otm.37.2021.08.01.13.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 13:48:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 1 Aug 2021 13:48:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
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
Subject: Re: [PATCH 10/12] dt-bindings: watchdog: Add compatible for Mediatek
 MT7986
Message-ID: <20210801204848.GA2800586@roeck-us.net>
References: <20210726071439.14248-1-sam.shih@mediatek.com>
 <20210726071439.14248-11-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726071439.14248-11-sam.shih@mediatek.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 26, 2021 at 03:14:37PM +0800, Sam Shih wrote:
> This commit adds dt-binding documentation of watchdog for Mediatek MT7986
> SoC Platform.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 416d716403f6..a4e31ce96e0e 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -13,6 +13,7 @@ Required properties:
>  	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
>  	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
>  	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
> +	"mediatek,mt7986-wdt", "mediatek,mt6589-wdt": for MT7986
>  	"mediatek,mt8183-wdt": for MT8183
>  	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
>  	"mediatek,mt8192-wdt": for MT8192
