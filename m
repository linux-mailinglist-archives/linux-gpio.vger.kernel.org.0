Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48AA92B5415
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 23:07:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727204AbgKPWGo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 17:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727098AbgKPWGo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 17:06:44 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD18CC0613CF;
        Mon, 16 Nov 2020 14:06:43 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id x9so21913104ljc.7;
        Mon, 16 Nov 2020 14:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BJxsU8gN59tvuGgU7PNdMo5fT7THwls7sknlrTbR/LI=;
        b=Dzbvq7jedO3PcJom1SrUcQvsxJ8jFOdFumGcK2rmcwJwZGsmVTyjrYF/OMRmTFJub9
         tVspSg+BzS5AvYB2h4VhuaIDU9XJc9IrheSXoEBnY2LNc6qODA7O7CkwpNS1iAwbjnHw
         oiVvCY3oynumTov2j3ns3vDvoCX2nMB8KElSOu/TiY5VVAxnmK6zhPtxK9+H+QDAp60w
         2Wrd/QzGEU+eLLmGTx4aXT7Lj52dv2gSYX59IntvyTZDa2dYIkoaieufTHpjTNon4ix4
         pifwxW/tMNxIqIbNkp1X3OxDtH0r0FrNaAayMAck1wFjMMe7GPVof9aMYcrnT51TfTIp
         jIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BJxsU8gN59tvuGgU7PNdMo5fT7THwls7sknlrTbR/LI=;
        b=MFi7JaGw6lhwH1SKKIZQ+xpCgKynP+wyNY/TEOeDNZuVUZrSXy6d7EXa0qnZGVybrP
         x0a2Zx3TfW9peuam85sxO7yZu1nBq4hdHuA08WmT8D/Ud0/IdmVlZLRY/SjQj/e4xDDN
         9yEqvb2ymmhUY/QC8xFGF2iYrdA8USROkOUHj6vsYira7n5p4zbw5O7UI0iUEGb8OIl3
         /VUMFndKA3OeUyIRe6a1yJ/ophO5bpnfe2xAJb6Pw8+IHzuc2YsvCXAV8ueDiCT5Cc5U
         JepNLoBnZxAVWpf6u89+FijALzrtlDWpMDFeB/4cZKufKtudduQeJdclcwNrZmBtI2Bk
         QLSw==
X-Gm-Message-State: AOAM532gF99jMY4c2GRLUeuCtPKL/EZe8Qaz1u5HAbAFQ0z/RnRmlXft
        WD7mdE5PBvYHqLqY/67SaCe7pUnqqU6V3/vk
X-Google-Smtp-Source: ABdhPJyf4bQRr3U3N2oJ43oLqlb4UWVX9zldVIP1uKyiEN1cpLv1Kt1MOolmlKctMFvj+U1UU5b7xg==
X-Received: by 2002:a05:651c:207:: with SMTP id y7mr600414ljn.428.1605564400898;
        Mon, 16 Nov 2020 14:06:40 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
        by smtp.gmail.com with ESMTPSA id i7sm2756834lfi.269.2020.11.16.14.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 14:06:40 -0800 (PST)
Date:   Tue, 17 Nov 2020 01:06:38 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH 01/32] of: Fix property supplier parsing
Message-ID: <20201116220638.ljrj6zgvgmvyib3k@mobilestation>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-2-damien.lemoal@wdc.com>
 <CAHp75VfvUZ6h+JGCUQ65i7qFsugvbd3n=aCprgvp=geRSpQEhQ@mail.gmail.com>
 <20201109174450.myombn5skpj5wcxh@mobilestation>
 <BL0PR04MB6514880A6977E605D38D68BEE7E30@BL0PR04MB6514.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR04MB6514880A6977E605D38D68BEE7E30@BL0PR04MB6514.namprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 16, 2020 at 07:30:15AM +0000, Damien Le Moal wrote:
> On 2020/11/10 2:45, Serge Semin wrote:
> > Hello Andy,
> > 
> > On Mon, Nov 09, 2020 at 05:14:21PM +0200, Andy Shevchenko wrote:
> >> On Sat, Nov 7, 2020 at 10:14 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> >>
> >>> @@ -1308,7 +1308,6 @@ DEFINE_SIMPLE_PROP(pinctrl7, "pinctrl-7", NULL)
> >>>  DEFINE_SIMPLE_PROP(pinctrl8, "pinctrl-8", NULL)
> >>>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
> >>>  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
> >>> -DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")
> >>
> >> Sorry, but the above doesn't sound right to me.
> >> It's a generic code and you may imagine how many systems you broke by
> >> this change.
> > 
> > Damien replaced the macro above with the code below (your removed it from your
> > message):
> > 
> > +static struct device_node *parse_gpios(struct device_node *np,
> > +                                      const char *prop_name, int index)
> > +{
> > +       /*
> > +        * Quirck for the DesignWare gpio-dwapb GPIO driver which defines
> > +        * the "snps,nr-gpios" property to indicate the total number of GPIOs
> > +        * available. As this conflict with "xx-gpios" reference properties,
> > +        * ignore it.
> > +        */
> > +       if (strcmp(prop_name, "snps,nr-gpios") == 0)
> > +               return NULL;
> > +
> > +       return parse_suffix_prop_cells(np, prop_name, index,
> > +                                      "-gpios", "#gpio-cells");
> > +}
> > 
> > So AFAICS removing the macro shouldn't cause any problem.
> > 
> > My concern was whether the quirk has been really needed. As I said the
> > "snps,nr-gpios" property has been marked as deprecated in favor of the standard
> > "ngpios" one. Due to the problem noted by Damien any deprecated property
> > utilization will cause the DW APB SSI DT-nodes probe malfunction. That
> > though implicitly but is supposed to encourage people to provide fixes for
> > the dts-files with the deprecated property replaced with "ngpios".
> > 
> > On the other hand an encouragement based on breaking the kernel doesn't seem a
> > good solution. So as I see it either we should accept the solution provided by
> > Damien, or replace it with a series of fixes for all dts-es with DW APB SSI
> > DT-node defined. I suggest to hear the OF-subsystem maintainers out what
> > solution would they prefer.
> 

> As Rob mentioned, there are still a lot of DTS out there using "snps,nr-gpios",
> so I think the fix is needed,

Yes.

> albeit with an added warning as Rob suggested so
> that board maintainers can notice and update their DT.

Yes.

> And I can send a patch
> for the DW gpio apb driver to first try the default "ngpios" property, and if it
> is not defined, fallback to the legacy "snps,nr-gpios". With that, these new
> RISC-V boards will not add another use case of the deprecated "snsps,nr-gpios".
> Does that sound like a good plan ?

It has already been added in 5.10:
https://elixir.bootlin.com/linux/v5.10-rc4/source/drivers/gpio/gpio-dwapb.c#L585
so there is no need in sending a patch for the gpio-dwapb.c driver.

-Sergey

> 
> 
> > 
> > -Sergey
> > 
> >>
> >> -- 
> >> With Best Regards,
> >> Andy Shevchenko
> > 
> 
> 
> -- 
> Damien Le Moal
> Western Digital Research
