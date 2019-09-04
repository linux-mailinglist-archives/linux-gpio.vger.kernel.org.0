Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2B59A9736
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 01:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727741AbfIDXeQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 19:34:16 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43599 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727156AbfIDXeQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 19:34:16 -0400
Received: by mail-pl1-f195.google.com with SMTP id 4so325919pld.10;
        Wed, 04 Sep 2019 16:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=zEfGTR202P+nwSsU1qSBd5C7kGsRpjPGHZxgayed3co=;
        b=bgNGAHlojCAsmb10/j/F4VrV1/7ILP14DPCXfjdhzRir4IZQWwkF6Hg4EJKc2JLDzb
         cgpVtDjEzBNDrKQEIvw55Uam/IjHauVNHZMcV702fkUgEYcFZJ5n7g+9MY1zHi6vMF5E
         jUoJ3GvvFLZsZvdxgYyVI6Y2u4EjUgciFSQFZoVkEKzXHD2HaVmayQYgfXwEYGHD7bM8
         OVDp35v2L0+znwSHmDf4ljqbUB1Q52eIcyj3phJ28h4Znsr2pSYzjgqvNimEHF0RPZtl
         wH7Hd7K0vzSVh+vDM4bSH9SifMeSZaYfZ2e2C7CVJZQiwHPRvvms4cxoSe18y8QKWV3/
         LE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zEfGTR202P+nwSsU1qSBd5C7kGsRpjPGHZxgayed3co=;
        b=Bq6EFjCtvEZaikRTvio/DP6IT9oOuASjj86nTgzK7DXH8RfKLG7n04qyr/aju3NbP2
         U2Vk0Xrgyn/CG1rg4S9QClcWOI4efTNZInjU088gS3BeeQYt+j/iBxTJd5l8pAzwJq5L
         iXjx4/AUd406/s4zvJPSfIS2/ftJVKxz+jTVJfjIEphX43iLe2rg/wdTLrPTEK990X1I
         2R5OAqzuAEHAqw6vHx3+Ey8mibRfKin+seCV2HrG1ZRcgx+isFXCRsVTyBgl0DwZKf3t
         PhsRC8P0v367TTgS0Yu6pkZD+6tNj9JWtp15pwuRCp9OWW3yzQERqOjOUCwctsX1g+6r
         r/NA==
X-Gm-Message-State: APjAAAUBZe15BdVOcozrrC+ysrHVp0wu3hF0yjHACF8dMPaXSMDwtPgv
        FDG3OTBQn1e5gt/Lnbo/A+s=
X-Google-Smtp-Source: APXvYqw3odHmU1fPWW8sZtm0x+bGwW0rkNDvCptjLNdQshanr2Coj2SEZMCxGSIfz+2XD+ZWxq8Gvg==
X-Received: by 2002:a17:902:a415:: with SMTP id p21mr261987plq.319.1567640055590;
        Wed, 04 Sep 2019 16:34:15 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
        by smtp.googlemail.com with ESMTPSA id c138sm179277pfc.80.2019.09.04.16.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 16:34:14 -0700 (PDT)
Message-ID: <1ca6ffddd2452e218ef19ea84ac6c6277e1a9725.camel@gmail.com>
Subject: Re: [PATCH 3/4] gpio: Add in ast2600 details to Aspeed driver
From:   Rashmica Gupta <rashmica.g@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed@lists.ozlabs.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Date:   Thu, 05 Sep 2019 09:34:10 +1000
In-Reply-To: <CAHp75Ve0zEkuD-75aZ6FU+A=DvX8NvVvY3n9p_pYDyfa76sxoQ@mail.gmail.com>
References: <20190904061245.30770-1-rashmica.g@gmail.com>
         <20190904061245.30770-3-rashmica.g@gmail.com>
         <CAHp75Ve0zEkuD-75aZ6FU+A=DvX8NvVvY3n9p_pYDyfa76sxoQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2019-09-04 at 19:30 +0300, Andy Shevchenko wrote:
> On Wed, Sep 4, 2019 at 9:14 AM Rashmica Gupta <rashmica.g@gmail.com>
> wrote:
> > The ast2600 has two gpio controllers, one for 3.6V GPIOS and one
> > for 1.8V GPIOS.
> > 
> > Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> > -       for (i = 0; i < ARRAY_SIZE(aspeed_gpio_banks); i++) {
> > +       banks = (gpio->config->nr_gpios >> 5) + 1;
> 
> Same comment as per the other patch.
> 
> > +       for (i = 0; i < banks; i++) {
> > +static const struct aspeed_bank_props ast2600_bank_props[] = {
> > +       /*     input      output   */
> > +       {5, 0xffffffff,  0x0000ffff}, /* U/V/W/X */
> > +       {6, 0xffff0000,  0x0fff0000}, /* Y/Z */
> 
> Perhaps GENMASK() for all values?

Perhaps this and your other comments below would be best addressed in
an additional cleanup patch? This patch follows the formatting of the
existing code and it's not very clean to differ from that or to change
the formatting of the current code in this patch.


> 
> > +       { },
> 
> Comma is not needed here.
> 
> > +};
> > +
> > +static const struct aspeed_gpio_config ast2600_config =
> > +       /* 208 3.6V GPIOs */
> > +       { .nr_gpios = 208, .props = ast2600_bank_props, };
> 
> Seems curly braces missed their places.
> 
> > +static const struct aspeed_bank_props ast2600_1_8v_bank_props[] =
> > {
> > +       /*     input      output   */
> > +       {1, 0x0000000f,  0x0000000f}, /* E */
> 
> GENMASK()?
> 
> > +       { },
> 
> No comma.
> 
> > +};
> > +static const struct aspeed_gpio_config ast2600_1_8v_config =
> > +       /* 36 1.8V GPIOs */
> > +       { .nr_gpios = 36, .props = ast2600_1_8v_bank_props, };
> 
> Location of the curly braces?
> 

