Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 425041142F3
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 15:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729644AbfLEOtA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 09:49:00 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35647 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729535AbfLEOs7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2019 09:48:59 -0500
Received: by mail-pf1-f194.google.com with SMTP id b19so1733467pfo.2;
        Thu, 05 Dec 2019 06:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=zerf2jeTJ9T1+KiLBXKGAOgo3NLhscKc1xofy5L3cP8=;
        b=tEjy3aWT847idRVE/j0aVnV+HovrelpV9vx0sXBsnUpcJaSTMtuUK9EonXSlEmpgl1
         C9VryYh2cCZrCnW8vu2GEUIhS1quctAlNiL9Goa66xRuo0oShIqxqmUSmNhGAeIJPKeY
         /A3gYs7IiEIeQA4LyulxkKV9s+CaUGdgFzH+NntG0IJb9eilyvi8inTVBpLPGMehSs4w
         lehgRMa8jyYGgcqGj5AaOkBlnGaKbs6EkfVa5PiGSw9yWeIiUj8f1Ys/bthnCuqbtMi6
         vVroLppUxdUsWEDqOJWh3TBslzixAHJdllVIo9pZnzHDN0pMjuA/LYn3EKuhbYS6pzSL
         T3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=zerf2jeTJ9T1+KiLBXKGAOgo3NLhscKc1xofy5L3cP8=;
        b=oMrENHTDz5jfxUP1hAX0PAyMvShgCVepN+VWI0AKmAD9ze091kgNZ+FlQl9S44jKYj
         G+/mJB8XUeVpS+Y121B5lDhVtoJSYDggyyFZSmfNEStvJ4J64gssy+m44JrLkgvJPiCI
         d0kFSt0BHhCLMCM2HwkE4jiXd8p22PxIiUFt+ox++IF2W6GAYV681BAN1t0UlV8vRklA
         KQvkkWIQgnp00C+hUI07obnASj3z37HqzeX1zMW9ig5lyt0oVXytq1mSs6NX8kbeb7Kx
         UN1VGOiV9BvSAL9gVhViwINrgr+VO/0V54Vfn9hHnBC5d0NcptM8wEEQM8pAeN4kAbRS
         kOBQ==
X-Gm-Message-State: APjAAAXTAAA3Nb3/G1+Re093vJNlsXdgfffeKiQUb/R5Od6KzZawzWcG
        vi/7gOPJmmmZoDu+JjtvjJM=
X-Google-Smtp-Source: APXvYqyoEwFvj/ecUcKGhOn5iUEfeT3IoooJMwY33IQjpCOk/nMjVc0JZT4J+N3pT6rDv4VDA3+2oQ==
X-Received: by 2002:aa7:98cd:: with SMTP id e13mr9039200pfm.56.1575557338720;
        Thu, 05 Dec 2019 06:48:58 -0800 (PST)
Received: from nishad ([106.51.232.103])
        by smtp.gmail.com with ESMTPSA id z130sm12175224pgz.6.2019.12.05.06.48.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 06:48:58 -0800 (PST)
Date:   Thu, 5 Dec 2019 20:18:48 +0530
From:   Nishad Kamdar <nishadkamdar@gmail.com>
To:     Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] pinctrl: actions: Use the correct style for SPDX
 License Identifier
Message-ID: <20191205144844.GA2903@nishad>
References: <cover.1574871463.git.nishadkamdar@gmail.com>
 <5b588fc885efca6efdc73869aa4b1eeeb3d6f6c5.1574871463.git.nishadkamdar@gmail.com>
 <c76290a7-b9bb-7f70-e750-04fe6fdbb7e1@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c76290a7-b9bb-7f70-e750-04fe6fdbb7e1@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 27, 2019 at 10:02:08PM +0100, Andreas Färber wrote:
> Am 27.11.19 um 17:40 schrieb Nishad Kamdar:
> > This patch corrects the SPDX License Identifier style in
> > header file related Actions Semi OWL pinctrl driver.
> 
> Owl
> 
I used the same format mentioned below, which also says OWL.
Meybe we can change both of them in a separate patch.

> > For C header files Documentation/process/license-rules.rst
> > mandates C-like comments (opposed to C source files where
> > C++ style should be used).
> > 
> > Changes made by using a script provided by Joe Perches here:
> > https://lkml.org/lkml/2019/2/7/46.
> > 
> > Suggested-by: Joe Perches <joe@perches.com>
> > Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
> > ---
> >  drivers/pinctrl/actions/pinctrl-owl.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pinctrl/actions/pinctrl-owl.h b/drivers/pinctrl/actions/pinctrl-owl.h
> > index dae2e8363fd5..feee7ad7e27e 100644
> > --- a/drivers/pinctrl/actions/pinctrl-owl.h
> > +++ b/drivers/pinctrl/actions/pinctrl-owl.h
> > @@ -1,4 +1,4 @@
> > -// SPDX-License-Identifier: GPL-2.0+
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> 
> This is not a uapi or asm header, which that /* */ rule was later added
> for, I thought?
>

I might be wrong but I think it applies to this file too as there as there is a SPDX
identifier in the first place.
> >  /*
> >   * OWL SoC's Pinctrl definitions
> >   *
> 
> Not objecting, just making sure we're not blindly refactoring code.
> 

I am not sure what you are trying to say here, but the SPDX identifier
requires an independent block comment. Hence placed the obove code in a
separate block comment. Everything else is as it is.

> If doing this, I suggest updating to GPL-2.0-or-later.
> 

We can do this in a separate patch as this patch only talks about
the style.

> Regards,
> Andreas
> 
> -- 
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> GF: Felix Imendörffer
> HRB 36809 (AG Nürnberg)

Thanks very much for your time and review.

Regards,
Nishad
