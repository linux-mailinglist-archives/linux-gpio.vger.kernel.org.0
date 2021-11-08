Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 801BE449D53
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 21:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237583AbhKHU7Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 15:59:25 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:37786 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236925AbhKHU7Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 15:59:24 -0500
Received: by mail-oi1-f170.google.com with SMTP id o83so29738018oif.4;
        Mon, 08 Nov 2021 12:56:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ROr6nFterK3OoeHb8IzT+KJ6EzNKL5k74QBsZO4xI28=;
        b=IxGbk1W/y3CCa8aLPTb36J2spIsr7JSJx6PhPFfO1diCEK8T3kw/T/JI4u4KEaG0CH
         oTZ7kLpgBI8ZF270/H1QqD9os+F0k57i9Tq3D6B8d2aHdAKPX9A7NM88EY+lDnUn59TD
         SDizi8Vf5JT4jJy3hPwvWWmSdKus1OnusJdYUeFsiygspnGCKqqjHE4brG7wcAc5w94F
         sirc5QA8KrbGISK86LTHvndH+AncS32bcQQ7jMlBWCVCSuFm2vatudTwzLbRTvuvNEU4
         /x2N/SQmMbGK2fdmgggQk7HIb/m8HKth3B6NAXamlxPcR7Hiphicwen8q5KAfhTscoPD
         HzTw==
X-Gm-Message-State: AOAM530OmLP+sUQAnYF/ReyFGq/wRATAFpjS0cCH5KrlcUuldh1KB2Xl
        Lfp9mXu7nbmsRL8C2hFPsA==
X-Google-Smtp-Source: ABdhPJwjqns1w3PPkpnQgHj7gavQ6nnOTZgyEEJoCHPPbJYilKF3I4gS8+TjRXtVoGZ3b0n4+yykvQ==
X-Received: by 2002:aca:3055:: with SMTP id w82mr1080310oiw.2.1636404999517;
        Mon, 08 Nov 2021 12:56:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 2sm2899127oih.34.2021.11.08.12.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 12:56:38 -0800 (PST)
Received: (nullmailer pid 4173 invoked by uid 1000);
        Mon, 08 Nov 2021 20:56:38 -0000
Date:   Mon, 8 Nov 2021 14:56:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Prabhakar <prabhakar.csengg@gmail.com>, linux-gpio@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add
 output-impedance-ohms property
Message-ID: <YYmPBkHyfaitPMIE@robh.at.kernel.org>
References: <20211029124437.20721-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211029124437.20721-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029124437.20721-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 29 Oct 2021 13:44:33 +0100, Lad Prabhakar wrote:
> RZ/G2L SoC has two groups of pins, Group-A and Group-B. RZ/G2L SoC supports
> configuring Output Impedance for Group-B pins (valid values 33/50/66/100).
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
