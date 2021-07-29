Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2BB3DAF9D
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 00:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234930AbhG2Wxj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 18:53:39 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:43831 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234928AbhG2Wxg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jul 2021 18:53:36 -0400
Received: by mail-io1-f50.google.com with SMTP id 185so9140686iou.10;
        Thu, 29 Jul 2021 15:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uJpFDnLGsRTERddirEkC/Otejhw3rqBCEU9YfBhRf7U=;
        b=DfM6Y3q3FSjITvYtBeD1J9QCwh3ElbCy4QF3pfDlM2A+rYqUno+xo3nYNLG7ZTVJ35
         kGq9QYMj+kMmjfe4U067eQzNAzZ4EJiHiJbYIfcKF0+/FGix1N02oJHSW+vQTd8g4eEU
         BnDWSJTiIgciDyMpqIydyGTJ2PNm9HTFV4y3n9ETbGaZQtCztkUeWYFHN6/pTmrbpGMf
         Ajkmc2rkJk9ul8rdHGiNV79cB+tpjXhrWxN3sq93+vFQfmQInxfryFG4fdA2DpBJw9zM
         lqdrjlt0TbJ0P42/tcsM3VWl9n4q7zWY6HftNf6kNh/hqSMjmqAj/8om3VdJbkKFP4YJ
         eyQw==
X-Gm-Message-State: AOAM5300e3sATGRhfxOeZiQOv3fEcvMSjp3px0yvxIU+C78VYtSKSDvs
        zpJHLFz99PlR7SjkLf2X7A==
X-Google-Smtp-Source: ABdhPJyEsK2jDWjZFywMCQXwGVNiTd+X7dee88ammCDu73syt+3U1Fhoa2oj3r3aYr5KQbctmLvaDA==
X-Received: by 2002:a6b:b883:: with SMTP id i125mr6041617iof.104.1627599212586;
        Thu, 29 Jul 2021 15:53:32 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z6sm2632418ilz.54.2021.07.29.15.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 15:53:32 -0700 (PDT)
Received: (nullmailer pid 1057151 invoked by uid 1000);
        Thu, 29 Jul 2021 22:53:29 -0000
Date:   Thu, 29 Jul 2021 16:53:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Matt Mackall <mpm@selenic.com>, linux-watchdog@vger.kernel.org,
        Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Crispin <john@phrozen.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        linux-mediatek@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Fabien Parent <fparent@baylibre.com>,
        linux-gpio@vger.kernel.org, Ryder Lee <Ryder.Lee@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-clk@vger.kernel.org, Seiya Wang <seiya.wang@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 08/12] dt-bindings: rng: mediatek: add mt7986 to mtk rng
 binding
Message-ID: <YQMxaXqr/zqf1+Ch@robh.at.kernel.org>
References: <20210726071439.14248-1-sam.shih@mediatek.com>
 <20210726071439.14248-9-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726071439.14248-9-sam.shih@mediatek.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 26 Jul 2021 15:14:35 +0800, Sam Shih wrote:
> Add RNG binding for MT7986 SoC.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
>  Documentation/devicetree/bindings/rng/mtk-rng.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!
