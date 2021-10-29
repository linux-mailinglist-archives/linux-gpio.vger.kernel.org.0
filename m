Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A77C743F469
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 03:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbhJ2Bjw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 21:39:52 -0400
Received: from mail-oo1-f53.google.com ([209.85.161.53]:40772 "EHLO
        mail-oo1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhJ2Bjv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 21:39:51 -0400
Received: by mail-oo1-f53.google.com with SMTP id m37-20020a4a9528000000b002b83955f771so2782857ooi.7;
        Thu, 28 Oct 2021 18:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PfowumfndLK5nYVoy8RPc3ruj7Nut9GNjhXXbRm7A70=;
        b=iQChW9r6BZp2/euMQcNMfox3z1qhYL5AYNm8D6Z/422c9OpbOI94faIcZtJhS2nW5y
         k9zN3KvAbWlJlG5WhDiRbi1YFAudMoLylfFP6R3RpnxY5TkX9SSF779k0lZ56RVWFPoe
         IjJD1NyVzqAdTQ/+whnJW2z96VZuavNsDGrxRF57dCLg9RcTkdG1MVmmDUWEzb9gBb3v
         84mmNQLwnzKdTBRsGW7iej5/3iNeoYdIlI13OLHFrcvWlY8haxxEvuZ9SlK2TQP2Sg6N
         EBF/KZCQwi6316XgEdbM9JPjxv6ZH9hJf8dBntL2xHd44VUjcIZPSi/ETTG5Hth0RegV
         LQUA==
X-Gm-Message-State: AOAM532FvW/UvbmfH+fJ47CBFSSM3fubh34YeEMqc7Gmzhq0BiBz6dVY
        H+C1WfqB4O8oIXRY2O+kTQ==
X-Google-Smtp-Source: ABdhPJwR8ig3tEdXtBL0iU/K9fusKlCVqxfGknYDMYCLCEPUbQI9R7STXg9I9RLwbuwCl5zs7lDh8w==
X-Received: by 2002:a05:6820:13c:: with SMTP id i28mr5611166ood.65.1635471443147;
        Thu, 28 Oct 2021 18:37:23 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m13sm394486ooj.43.2021.10.28.18.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 18:37:22 -0700 (PDT)
Received: (nullmailer pid 967920 invoked by uid 1000);
        Fri, 29 Oct 2021 01:37:21 -0000
Date:   Thu, 28 Oct 2021 20:37:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-riscv@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Anup Patel <anup.patel@wdc.com>,
        Drew Fustini <drew@beagleboard.org>, linux-clk@vger.kernel.org,
        Matteo Croce <mcroce@microsoft.com>,
        Atish Patra <atish.patra@wdc.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-gpio@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Marc Zyngier <maz@kernel.org>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 03/16] dt-bindings: interrupt-controller: Add StarFive
 JH7100 plic
Message-ID: <YXtQUcQDCfd6Q1PT@robh.at.kernel.org>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-4-kernel@esmil.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021174223.43310-4-kernel@esmil.dk>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 21 Oct 2021 19:42:10 +0200, Emil Renner Berthing wrote:
> Add compatible string for StarFive JH7100 plic.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
