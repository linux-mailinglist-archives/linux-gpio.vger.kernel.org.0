Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC31D43F499
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 03:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbhJ2Bw7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 21:52:59 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:43682 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhJ2Bw6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 21:52:58 -0400
Received: by mail-oi1-f181.google.com with SMTP id o4so11101486oia.10;
        Thu, 28 Oct 2021 18:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eT3ChWaMOp5kyHbGSPNQZqiJesN+wKA5EP84+9fXwG4=;
        b=m5FYG6L8eAgfgPI2m0obPs1fL7Eme/AeUT23Chx/YLs0gfyUW3pzLe5adyGpKvHvEt
         9+YYWV2SlsrMLvdBFc5dFioD/u83sj31hRg3EzLLYSQCgpENgnsTuBdf69BMkQ8BwQxm
         gj4ABuL/02v/hEF9r3xw+GBr3TUVTtCcjAiVbGj3xxiBg/kTh7A5HEKzuc8b5uoHjPxa
         T5XzFvhCRCLTUsHSPelFDn80wD4WXvNmRw21OSQzPqevrK3WKIZcGwc2vBWSjwmQ/c33
         8bXWVwqX49hJAMoJ99SfrHyRKfjNOfB8KeCtkEHXDOmFkOg79ImfRNfQPBcxzfAvS6Bc
         zNyw==
X-Gm-Message-State: AOAM5301JFtoiYioearQfyVbDp/Ybwwi4KV/sKtvnZY0vvz+DGwiPPVo
        r3q7kxJTcjxia7gGst81Rw==
X-Google-Smtp-Source: ABdhPJxAP9sJ1yu3Kht4JaNms+QFgt8gIGs8br4REvzieGCwOwjZwdh3OyK5GmRJ0zW8Xwq1UGGXgw==
X-Received: by 2002:aca:ad16:: with SMTP id w22mr11487871oie.109.1635472230382;
        Thu, 28 Oct 2021 18:50:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k22sm1582548otn.44.2021.10.28.18.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 18:50:29 -0700 (PDT)
Received: (nullmailer pid 987933 invoked by uid 1000);
        Fri, 29 Oct 2021 01:50:28 -0000
Date:   Thu, 28 Oct 2021 20:50:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv@lists.infradead.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        devicetree@vger.kernel.org,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-gpio@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Atish Patra <atish.patra@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        linux-serial@vger.kernel.org, linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marc Zyngier <maz@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-kernel@vger.kernel.org,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Anup Patel <anup.patel@wdc.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Drew Fustini <drew@beagleboard.org>,
        Matteo Croce <mcroce@microsoft.com>
Subject: Re: [PATCH v2 13/16] dt-bindings: serial: snps-dw-apb-uart: Add
 JH7100 uarts
Message-ID: <YXtTZCRUTUB88w/a@robh.at.kernel.org>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-14-kernel@esmil.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021174223.43310-14-kernel@esmil.dk>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 21 Oct 2021 19:42:20 +0200, Emil Renner Berthing wrote:
> Add compatibles for the StarFive JH7100 uarts.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
