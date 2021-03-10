Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23997333D38
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 14:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbhCJNDE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 08:03:04 -0500
Received: from mail-lj1-f170.google.com ([209.85.208.170]:33448 "EHLO
        mail-lj1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231517AbhCJNCs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 08:02:48 -0500
Received: by mail-lj1-f170.google.com with SMTP id h4so25498455ljl.0;
        Wed, 10 Mar 2021 05:02:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=sTSRxDbi5nvaP9NyY08bdt6i+cb/v1XJzy+djVvVXTo=;
        b=mBDyIWtn422OA1bBMJvcyyCS00DvEk639c0JnOozeqmUDiIsrd4EYmwj7UZdDbAIjD
         wn4OQWMASC5DqWPk2baSogDsIMqg7y5cjD6PP5QNVOqAVOCA3MuZf/Z3X2LhhZKEq2+p
         AIEut3TjOqFgnNjlfRqa08SEGJRr8jsQapodSOeQtZ93RHa1TMh365z1JeyXzfgZsEr5
         Aod5OY9rKoVXdLtgOlhd+518c9oPmM8JWF7MN6UpAQVQsy940uO1+gQKmR5j/eWmdz57
         B1T6r2SH5IilajJhkXQbLXuWPMFlu7jRkfp8MPmSZa+xdPpXn8LkgUnPoDQhO+4OmtIB
         VIQg==
X-Gm-Message-State: AOAM530BT2NJTUOrjtBfN7viqjHKZt+X1qLcIHnYkAdRNhjXbZlJz7AE
        sJmD3Vw3hBPS2I6V6MIbe1mYF38tKtY=
X-Google-Smtp-Source: ABdhPJyTWbVFlX45RasDQubh0t6WJRM3nMQEVbIHwXKWfU220B53iYVZGYCKqnnbQ8phhUhHQDliUA==
X-Received: by 2002:a2e:86c8:: with SMTP id n8mr1844498ljj.409.1615381366389;
        Wed, 10 Mar 2021 05:02:46 -0800 (PST)
Received: from dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id r5sm2868521lfc.235.2021.03.10.05.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:02:45 -0800 (PST)
Message-ID: <e7bb00af76de65c60061c58a570d5b6f40961eb0.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v3 06/15] mfd: Add ROHM BD71815 ID
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
In-Reply-To: <20210310111755.GN701493@dell>
References: <cover.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
         <be0e8cd06ed75e799c942e5076ee7b56ad658467.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
         <20210310103639.GG701493@dell>
         <a631bbc3dd3bd0f02693d1c35f9a14dbaec67cc3.camel@fi.rohmeurope.com>
         <20210310111755.GN701493@dell>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Wed, 10 Mar 2021 15:02:41 +0200
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2021-03-10 at 11:17 +0000, Lee Jones wrote:
> On Wed, 10 Mar 2021, Vaittinen, Matti wrote:
> 
> > Hello Lee,
> > 
> > On Wed, 2021-03-10 at 10:36 +0000, Lee Jones wrote:
> > > On Mon, 08 Mar 2021, Matti Vaittinen wrote:
> > > 
> > > > Add chip ID for ROHM BD71815 and PMIC so that drivers can
> > > > identify
> > > > this IC.
> > > > 
> > > > Signed-off-by: Matti Vaittinen <
> > > > matti.vaittinen@fi.rohmeurope.com>
> > > > Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> > > > ---
> > > >  include/linux/mfd/rohm-generic.h | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/include/linux/mfd/rohm-generic.h
> > > > b/include/linux/mfd/rohm-generic.h
> > > > index 66f673c35303..e5392bcbc098 100644
> > > > --- a/include/linux/mfd/rohm-generic.h
> > > > +++ b/include/linux/mfd/rohm-generic.h
> > > > @@ -14,6 +14,7 @@ enum rohm_chip_type {
> > > >  	ROHM_CHIP_TYPE_BD71828,
> > > >  	ROHM_CHIP_TYPE_BD9571,
> > > >  	ROHM_CHIP_TYPE_BD9574,
> > > > +	ROHM_CHIP_TYPE_BD71815,
> > > 
> > > Is there a technical reason why these can't be re-ordered?
> > 
> > No, I don't think so.
> > 
> > BTW. there will probably be a (trivial) conflict here as both this
> > series and the BD9576/BD9573 series add an ID here. Let me guess,
> > you'd
> 
> That's fine.  I will resolve that manually.

Thanks :)

> 
> > like to see them sorted?
> 
> Wouldn't that be nice? :)
Aesthetics is not really my cup of tea. OTOH, if amount of IDs grow,
then sorting helps spotting whether some IC has an ID here. So yes, it
kind of makes sense.

Can you do sorting while resolving the conflict between series or do
you want me to
a) do sorting if (when) I re-spin the series
b) send separate sorting patch as a part of this series
c) send sepatate sorting patch after all the pending patches touching
these IDs have been merged?

--Matti

