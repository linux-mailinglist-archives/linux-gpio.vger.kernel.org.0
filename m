Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4838E1D3AAF
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 20:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729385AbgENS6X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 14:58:23 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36974 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728372AbgENS6P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 May 2020 14:58:15 -0400
Received: by mail-oi1-f195.google.com with SMTP id r25so25486071oij.4;
        Thu, 14 May 2020 11:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qPBikM7djpXPphaJtKg/odrCAnbAw6ex2T7aFaxLRN0=;
        b=NyckrRCn3X4I2YT8HpmYLliUcaoR5iBch1q5PUMq1DnwxFQaphYgqoEjKpSmGF82Rq
         lLgrlPyE1RXC5Wthzy8aKDa4TpTPl3SDFXUvrYSE8aSysSSdiNN0WfASomZt17XzNWx3
         LZAR6vHzvVMa7X7yYvnRR2QAurRW5Rl0jibalLHFZTLqZcyuNr6cc2nVkSfpluivr4q7
         tq8hIpEDR8eDsaFm81LmhOzwQUNGh/2gGVpbRdv3MsCBUUlIx/oxq18f1LDh9WJXayjc
         GNQTl8aZT45W1sIIIuX72UUPwQae0yPSjhH9mQKpte2dJA68hr/mt2wh9P1UFaTXmUqb
         MOSg==
X-Gm-Message-State: AGi0PuaexsnTDtN+eSOZfvLfBhQ7ECSIdYH634s2GdNYMappBYgg76k1
        5EOYSnK76/qhE4S/wnJUjQ==
X-Google-Smtp-Source: APiQypKgzCFNgTvNxHAVJQdyYehxQUJtvZ8t/uMvsKmpAPlvgDUJdRAzuuoxKiBxVvr4aVvNg4uJKw==
X-Received: by 2002:aca:5588:: with SMTP id j130mr30443516oib.144.1589482694847;
        Thu, 14 May 2020 11:58:14 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i196sm7095757oib.8.2020.05.14.11.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 11:58:14 -0700 (PDT)
Received: (nullmailer pid 30467 invoked by uid 1000);
        Thu, 14 May 2020 18:58:13 -0000
Date:   Thu, 14 May 2020 13:58:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marc Zyngier <maz@kernel.org>, linux-mmc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 6/9] dt-bindings: serial: renesas,hscif: Document
 r8a7742 bindings
Message-ID: <20200514185813.GA30416@bogus>
References: <1588794695-27852-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1588794695-27852-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588794695-27852-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed,  6 May 2020 20:51:32 +0100, Lad Prabhakar wrote:
> RZ/G1H (R8A7742) SoC also has the R-Car gen2 compatible HSCIF ports,
> so document the SoC specific bindings.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> * No change
> ---
> 
>  Documentation/devicetree/bindings/serial/renesas,hscif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!
