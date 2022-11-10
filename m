Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76B76623F90
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 11:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiKJKNS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 05:13:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbiKJKNR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 05:13:17 -0500
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 651C96334;
        Thu, 10 Nov 2022 02:13:15 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AAACcU7040064;
        Thu, 10 Nov 2022 04:12:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1668075158;
        bh=pPJpv7QuroGfs3mkuiQ1JtikR8UCmpSuhiAcetSYzaU=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=rYVPRTTAPYD9gVtdc38ppB5nvX34iE1WNzEp6omsZF3fNiFXpA6E/Y9W3NvQzo8tO
         fnM03PsYx+dKugIfrC6FnlPdtaofO8u+nS1kZTKkGL14O8STeAcG00kRJlHWmwcSuk
         hAcOL55n8UYIS6gJWHDNP5ce571Dg8hXh8nQycOQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AAACcS7109089
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Nov 2022 04:12:38 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 10
 Nov 2022 04:12:38 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 10 Nov 2022 04:12:38 -0600
Received: from ubuntu (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id 2AAACM0p033066;
        Thu, 10 Nov 2022 04:12:25 -0600
Date:   Thu, 10 Nov 2022 02:12:21 -0800
From:   Matt Ranostay <mranostay@ti.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     <brgl@bgdev.pl>, <lee@kernel.org>, <kristo@kernel.org>,
        <alexandre.belloni@bootlin.com>, <a.zummo@towertech.it>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh@kernel.org>,
        <vigneshr@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH v3 4/7] gpio: tps6594x: add GPIO support for TPS6594x PMIC
Message-ID: <Y2zOhf8lqVLyLn+A@ubuntu>
References: <20221109065546.24912-1-mranostay@ti.com>
 <20221109065546.24912-5-mranostay@ti.com>
 <CACRpkdaTV6unVsfNj+M39jLn5FLTnhryjuzF4EB6Ytds9R1nEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CACRpkdaTV6unVsfNj+M39jLn5FLTnhryjuzF4EB6Ytds9R1nEQ@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 09, 2022 at 10:59:08AM +0100, Linus Walleij wrote:
> On Wed, Nov 9, 2022 at 7:56 AM Matt Ranostay <mranostay@ti.com> wrote:
> 
> > Add support for TPS6594X PMICs GPIO interface that has 11 that can be
> > configured as input or outputs.
> >
> > Tested-by: Keerthy <j-keerthy@ti.com>
> > Signed-off-by: Matt Ranostay <mranostay@ti.com>
> 
> (...)
> > +config GPIO_TPS6594X
> > +       tristate "TI TPS6594X GPIO driver"
> > +       depends on MFD_TPS6594X
> > +       help
> > +         Select this option to enable GPIO driver for the TPS6954X
> > +         PMIC chip family. There are 11 GPIOs that can be configured.
> 
> select GPIO_REGMAP
> 
> This driver is an archetypical example of a driver that can make great
> use of GPIO_REGMAP helpers, so rewrite it to use them.
> Look in drivers/gpio/gpio-sl28cpld.c for an example.

Linus,

Those helpers look great for this usecase on the surface but however I think there could be some issues.
For GPIO direction it isn't configured by a bitmap on a register(s) but by a bit on a range of
registers (with a register for each GPIOx).

For set/get values the gpio helper would work though.

- Matt

> 
> Yours,
> Linus Walleij
