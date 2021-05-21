Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0AF438C076
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 09:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233208AbhEUHMY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 03:12:24 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:58303 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235464AbhEUHMY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 03:12:24 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 5A79122234;
        Fri, 21 May 2021 09:10:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1621581059;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hL5RWGHgC+f5boTILisjTi8oPmHUeP7PXAuRFqWVXfY=;
        b=Qzq7HPPQv5LhsqDMTEOG36cExdmVjWCoGX30H3IYZjA90KR9bpde/WPXuwW7GAG11d/XBP
        kJXUmigQacS1/qmnoV5hlvHoaTZxr4/murgQyP9SErTaUSu4ZKF1QeInPMz9PnapfTgQwW
        7bs3kchRLX3Tl0peiUwVeKJvP7cc9Z0=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 21 May 2021 09:10:57 +0200
From:   Michael Walle <michael@walle.cc>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     linux-power <linux-power@fi.rohmeurope.com>,
        linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH 1/2] gpio: regmap: Support few IC specific operations
In-Reply-To: <7a76b454ddb4b143021dfea504608d9db67f33af.camel@fi.rohmeurope.com>
References: <09091e75157ea28dcad1605008532016304356a4.1621509932.git.matti.vaittinen@fi.rohmeurope.com>
 <7d6f71e0a79e6ccd2a9f69be189993a9@walle.cc>
 <c6acc28e87d43973561a66bdb4d78905882f2940.camel@fi.rohmeurope.com>
 <689539b24f9dc57ec0bfc92fdd9d3464@walle.cc>
 <7a76b454ddb4b143021dfea504608d9db67f33af.camel@fi.rohmeurope.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <75c35a7d5561ec3b206351849e2b89f2@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-05-20 14:42, schrieb Vaittinen, Matti:
> On Thu, 2021-05-20 at 14:22 +0200, Michael Walle wrote:
>> Am 2021-05-20 14:00, schrieb Matti Vaittinen:
>> > On Thu, 2021-05-20 at 13:42 +0200, Michael Walle wrote:
>> > > Am 2021-05-20 13:28, schrieb Matti Vaittinen:
>> > > > The set_config and init_valid_mask GPIO operations are usually
>> > > > very
>> > > > IC
>> > > > specific. Allow IC drivers to provide these custom operations
>> > > > at
>> > > > gpio-regmap registration.
>> > > >
>> > > > Signed-off-by: Matti Vaittinen <
>> > > > matti.vaittinen@fi.rohmeurope.com>
>> > > > ---
>> > > >  drivers/gpio/gpio-regmap.c  | 49
>> > > > +++++++++++++++++++++++++++++++++++++
>> > > >  include/linux/gpio/regmap.h | 13 ++++++++++
>> > > >  2 files changed, 62 insertions(+)
>> > > >
>> > > > diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-
>> > > > regmap.c
>> > > > index 134cedf151a7..315285cacd3f 100644
>> > > > --- a/drivers/gpio/gpio-regmap.c
>> > > > +++ b/drivers/gpio/gpio-regmap.c
>> > > > @@ -27,6 +27,10 @@ struct gpio_regmap {
>> > > >  	int (*reg_mask_xlate)(struct gpio_regmap *gpio,
>> > > > unsigned int
>> > > > base,
>> > > >  			      unsigned int offset, unsigned int
>> > > > *reg,
>> > > >  			      unsigned int *mask);
>> > > > +	int (*set_config)(struct regmap *regmap, void *drvdata,
>> > > > +			  unsigned int offset, unsigned long
>> > > > config);
>> > > > +	int (*init_valid_mask)(struct regmap *regmap, void
>> > > > *drvdata,
>> > > > +				unsigned long *valid_mask,
>> > > > unsigned int
>> > > > ngpios);
>> > >
>> > > Maybe we should also make the first argument a "struct
>> > > gpio_regmap"
>> > > and provide a new gpio_regmap_get_regmap(struct gpio_regmap).
>> > > Thus
>> > > having a similar api as for the reg_mask_xlate(). Andy?
>> >
>> > I don't really see the reason of making this any more complicated
>> > for
>> > IC drivers. If we don't open the struct gpio_regmap to IC drivers -
>> > then they never need the struct gpio_regmap pointer itself but each
>> > IC
>> > driver would need to do some unnecessary function call
>> > (gpio_regmap_get_regmap() in this case). I'd say that would be
>> > unnecessary bloat.
>> 
>> If there is ever the need of additional parameters, you'll have to
>> modify that parameter list. Otherwise you'll just have to add a new
>> function. Thus might be more future proof.
> 
> I do hope the "void *drvdata" allows enough flexibility so that there
> is no need to add new parameters.

Thats for information passed from the user of gpio_regmap to the
callbacks.

> And if there is, then I don't see how
> the struct gpio_regmap pointer would have saved us - unless we open the
> contents of struct gpio_regmap to IC drivers. (Which might make sense
> because that already contains plenty of register details which may need
> to be duplicated to drvdata for some IC-specific callbacks. Here we
> again have analogy to regulator_desc - which I have often used also in
> IC-specific custom callbacks. But as long as we hope to keep the struct
> gpio_regmap private I would not add it in arguments).

Because that (opaque) argument is then used for the helper functions
of gpio_regmap.

-michael
