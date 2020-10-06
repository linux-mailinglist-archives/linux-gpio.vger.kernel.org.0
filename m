Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05BB4285482
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 00:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgJFWZX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Oct 2020 18:25:23 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:36398 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgJFWZX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2020 18:25:23 -0400
Received: by mail-oo1-f67.google.com with SMTP id z1so127687ooj.3;
        Tue, 06 Oct 2020 15:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/Ga2Z0C5bYkL6wxJvlHQG/Q6Nj02izfhVX4lbiXVzNA=;
        b=hZBmcK3x3fnrMjTTNrJx6ZvvJ925fy7PAHsa7SmbimeVgVHBR+rm5Vsd90OW9w0QKw
         Zl6h4g92Oa2Gb4eCPxr+TF+ucw08ckhPfGqyr4G6Yqf9WxGsRdHEkCmf37cYpsSCDNcV
         CGgtVAMbpFQGH/VlG5IIBORnVxau2n6dy9nlBUH6P7ogP07dm2gstJpFCa+f21pAVg6W
         /mwXGR8fFNA3+WffVR0i+iEkjm0ODUeUxKkhXCwXZrUO8qpzuBera9OqupkuupLmPDdp
         Q/U0D3npk/tkMoOS7ctYJ5/++FfT+C8KOXzCmAkTI15XjyvrWM3SDQUD7G/oKaGqNJQb
         txgg==
X-Gm-Message-State: AOAM530ppJaK3QnFZHRiJuN443fzCAH8YLUOw8euFJYStqipW1pRb35t
        bMcglMxLxtr9psydLWXuUs9sTHVjeHiL
X-Google-Smtp-Source: ABdhPJz3KuUGtTMqG6urse6MWFdEcXvkoe7E73SCozRInDxIDRL432QIj8fLXIIhZx9AlqMF8FRblQ==
X-Received: by 2002:a4a:dd0b:: with SMTP id m11mr168975oou.75.1602023122151;
        Tue, 06 Oct 2020 15:25:22 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 38sm86240ota.42.2020.10.06.15.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 15:25:21 -0700 (PDT)
Received: (nullmailer pid 2965256 invoked by uid 1000);
        Tue, 06 Oct 2020 22:25:20 -0000
Date:   Tue, 6 Oct 2020 17:25:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Yangtao Li <frank@allwinnertech.com>,
        linux-gpio@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: sunxi: Allow pinctrl with more
 interrupt banks
Message-ID: <20201006222520.GA2965226@bogus>
References: <20201005190939.21016-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201005190939.21016-1-peron.clem@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 05 Oct 2020 21:09:39 +0200, Clément Péron wrote:
> Recently introduced Allwinner A100 pinctrl block has 7 interrupts.
> 
> This trig a warning when running dtb_checks:
> sun50i-a100-allwinner-perf1.dt.yaml: pinctrl@300b000: interrupts: [...] is too long
> 	From schema: .../allwinner,sun4i-a10-pinctrl.yaml
> 
> Fix this by allowing up to 7 interrupts.
> 
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>  .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
