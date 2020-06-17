Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 052711FD222
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 18:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbgFQQ1u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 12:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726995AbgFQQ1r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jun 2020 12:27:47 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A16C0613ED
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2020 09:27:46 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id k8so2464344edq.4
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2020 09:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0PeE1nNOhO8NzBOTfY/pdL8QsrWSh7rT+swmugwtigI=;
        b=sNqB/fFnXRRSizIysZQ/7bQPvN3dI1sAubAzmXPjlp5zADcg3mFHnEhj4KpzI4rlRT
         b0rXBfv2Leyc1LO9lG4qxGitWmak6FKoBKT4g43POIBQG/++rpoKsKoTPII/fiiBPcZ4
         nhol/ldhYskiBz7ksJBQ9W7X36Ud195pCyKhr2fxjwYok3HHb3JoLM6hol9DVu8c0XaT
         IrDZVH8Ne9ZwHErbNev4dNa6sCLZnMKaiZAZ17jz65bE2z46/CEosSbP3MB0bkOMXt9X
         jdY+AP4M7yuHGaMmy6BTlRgPH5WXxySI36LtxDl12eLIp0A97DJs8zhMYnEqbY8ZpY8F
         M2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0PeE1nNOhO8NzBOTfY/pdL8QsrWSh7rT+swmugwtigI=;
        b=jSQVTSnSnhuSi6gf0fjL1XRApCULmyE+i7aG00evHsLC37Igvs893zWhphxzMbAu2l
         BQlqPH4m5Qes55aK7obOy6re+h9kmUmEmtgeoaq/X0w5pJ/3qEJ/yZFt8Gw3IuqC6DRC
         nwDubKNurHczP+GvSKjFSQfMC5pRbKL2g8ls7bsEB8x3wWtsW57sFBIDYCp1FFlv8bYI
         DwVVoNMx4Z3LqjeP/SrMteX26ULul0atAeQypI8u4NSs584N4ivk+JvxHHFPbW5TjgWp
         sDPz+TyDsZ3DS1jqi4dro52NEJbk+BiBSF7DVCSbjK2gaB17EiwvnyZax2/PmxMHp+g9
         Ghdw==
X-Gm-Message-State: AOAM532eLsgbteNDHT4DYxgvz2w//Ui5+rdW7BMXj5ryJsa2oOde4Kb9
        92+zrLpvOHiIIoMafNNNspdWxw==
X-Google-Smtp-Source: ABdhPJzcNlf5mAAzJmZXfW/N+4oUOHXbX6TDnTWRpql38l+PqLTIechB/LyMZ9YZXb3Wzr6JLXkDVA==
X-Received: by 2002:aa7:df05:: with SMTP id c5mr25038edy.48.1592411265374;
        Wed, 17 Jun 2020 09:27:45 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id h9sm312336ejc.96.2020.06.17.09.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 09:27:44 -0700 (PDT)
Date:   Wed, 17 Jun 2020 18:27:40 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, jkridner@beagleboard.org,
        robertcnelson@gmail.com
Subject: Re: [PATCH] ARM: dts: AM33xx-l4: add gpio-ranges
Message-ID: <20200617162740.GA4181112@x1>
References: <20200602131428.GA496390@x1>
 <803e2d78-28ba-0816-dbb5-d441d7659a91@ti.com>
 <20200602135155.GE37466@atomide.com>
 <20200602163458.GA847883@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200602163458.GA847883@x1>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 02, 2020 at 06:34:58PM +0200, Drew Fustini wrote:
> On Tue, Jun 02, 2020 at 06:51:55AM -0700, Tony Lindgren wrote:
> > * Grygorii Strashko <grygorii.strashko@ti.com> [200602 13:44]:
> > > 
> > > 
> > > On 02/06/2020 16:14, Drew Fustini wrote:
> > > > Add gpio-ranges properties to the gpio controller nodes.
> > > > 
> > > > These gpio-ranges were created based on "Table 9-10. CONTROL_MODULE
> > > > REGISTERS" in the  "AM335x Technical Reference Manual" [0] and "Table
> > > > 4-2. Pin Attributes" in the "AM335x Sitara Processor datasheet" [1].
> > > > A csv file with this data is available for reference [2].
> > > 
> > > It will be good if you can explain not only "what" is changed, but
> > > also "why" it's needed in commit message.
> > 
> > Also, please check (again) that this is the same for all the am3
> > variants. For omap3, we had different pad assignments even between
> > SoC revisions. Different pad routings should be easy to deal with
> > in the dts if needed though.
> > 
> > Regards,
> > 
> > Tony
> 
> It appears that the only usage of am33xx-l4.dtsi is for am335x for which
> specific parts mentioned in those dtsi files are 3352, 3358, and 3359.
> 
> $ git grep am33xx-l4.dtsi 
> arch/arm/boot/dts/am33xx.dtsi:#include "am33xx-l4.dtsi"
> $ git grep -l '#include "am33xx.dtsi"' arch/ |wc -l
> 27
> $ git grep -l '#include "am33xx.dtsi"' arch/ |grep -v am335x |wc -l
> 0
> 
> Also, it appears that the only AM33xx parts that actually exist are [0]:
> 
> AM3351, AM3352, AM3354, AM3356, AM3357, AM3358, AM3359
> 
> I clicked on the datasheet link for each product page and while the URL
> has the specific part number in it [1], they all end up loading the
> exact same PDF. The header states:
> 
> "AM3359, AM3358, AM3357, AM3356, AM3354, AM3352, AM3351
> SPRS717L – OCTOBER 2011 – REVISED MARCH 2020"
> 
> Thus, I do believe all SoC's using am33xx-l4.dtsi would have the same
> memory map for the pin control registers and the same relationshop from
> pin to gpio line.  For example, GPMC_A0 has mode 7 and it is labeled
> gpio1_16.  conf_gpmc_a0 is at offset 840h which makes it pin 16.
> 
> Maybe am33xx-l4.dtsi should have actually been named am335x-l4.dtsi?
> 
> Though I suppose there is no point in changing that now.
> 
> thanks,
> drew
> 
> [0] http://www.ti.com/processors/sitara-arm/am335x-cortex-a8/overview.html
> [1] https://www.ti.com/lit/ds/symlink/am3359.pdf

Tony - 

These gpio-ranges are correct for all the platforms that included
am33xx-l4.dtsi.

I think it makes sense to add gpio-ranges properties as they describe
the relationship between a gpio line and pin control register that
exists in the hardware.

Are there changes you would like to see in this patch?

Thanks,
Drew

