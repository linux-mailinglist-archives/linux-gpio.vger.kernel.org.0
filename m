Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72457334078
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 15:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbhCJOkS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 09:40:18 -0500
Received: from mail-lf1-f48.google.com ([209.85.167.48]:46290 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232111AbhCJOj7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 09:39:59 -0500
Received: by mail-lf1-f48.google.com with SMTP id r3so25668920lfc.13;
        Wed, 10 Mar 2021 06:39:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=dOW9NNyhr0U64AcTwcxch0JsYRD28DeaUQQZX9qSIMI=;
        b=ohhacYpc69oMv8aH3tYoLQpnT8AtAOBuF06ZMZ0u/2ZHhDqNYNkOqjFMwOPF6gjwft
         xPmbQYw/R+qGKXlautxdVYJ/rZzjOfeWLwsesNLRm0vhnGCbDI/zGJdJtDCoElFjhxUa
         DFTLrgOL6egvYX4gl1guktTQAZlMQv102yVXCa3/XXFiuTkjyXwA9PT4T/sDv12PFZCP
         yr/xdhtmfY1q9F06A2cX1+SAYzX0V4vV4ophwswU+Pgoo4fZosmQZCCjzI/7oL7QJA5j
         YwV/26OVQqZWh7rziH5MWrfx/2rFPHolhIl8BAUj+QP7vL+A25bNjr0gpKsixhnB2pIY
         mw0g==
X-Gm-Message-State: AOAM5334PkhZCLaCJ1kpUZiQQoMLmCGJNEFaocFFXQkORXlz90TI0Qb9
        iPIXz/kinPjcbbKxQYsbRdBlNGhNRzY=
X-Google-Smtp-Source: ABdhPJz0N4ESPFKrv9Ed4ZqbbEPfr2ELQWAJoqAzkKZsIKxFkUin5JeGQicXeamxVvBNTbMkCGguyQ==
X-Received: by 2002:a05:6512:398a:: with SMTP id j10mr2190836lfu.167.1615387197625;
        Wed, 10 Mar 2021 06:39:57 -0800 (PST)
Received: from dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id x24sm2932898lfu.206.2021.03.10.06.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 06:39:57 -0800 (PST)
Message-ID: <c1cb760a0bd2cf46dc5d9b21d1a08286a7671d21.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v3 06/15] mfd: Add ROHM BD71815 ID
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
In-Reply-To: <20210310133136.GQ701493@dell>
References: <cover.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
         <be0e8cd06ed75e799c942e5076ee7b56ad658467.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
         <20210310103639.GG701493@dell>
         <a631bbc3dd3bd0f02693d1c35f9a14dbaec67cc3.camel@fi.rohmeurope.com>
         <20210310111755.GN701493@dell>
         <e7bb00af76de65c60061c58a570d5b6f40961eb0.camel@fi.rohmeurope.com>
         <20210310133136.GQ701493@dell>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Wed, 10 Mar 2021 16:39:52 +0200
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Wed, 2021-03-10 at 13:31 +0000, Lee Jones wrote:
> On Wed, 10 Mar 2021, Matti Vaittinen wrote:
> 
> > On Wed, 2021-03-10 at 11:17 +0000, Lee Jones wrote:
> > > On Wed, 10 Mar 2021, Vaittinen, Matti wrote:
> > > 
> > > > Hello Lee,
> > > > 
> > > > On Wed, 2021-03-10 at 10:36 +0000, Lee Jones wrote:
> > > > > On Mon, 08 Mar 2021, Matti Vaittinen wrote:
> > > > > 
> > > > > > Add chip ID for ROHM BD71815 and PMIC so that drivers can
> > > > > > identify
> > > > > > this IC.
> > > > > > 
> > > > > > Signed-off-by: Matti Vaittinen <
> > > > > > matti.vaittinen@fi.rohmeurope.com>
> > > > > > Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> > > > > > ---
> > > > > >  include/linux/mfd/rohm-generic.h | 1 +
> > > > > >  1 file changed, 1 insertion(+)
> > > > > > 
> > > > > > diff --git a/include/linux/mfd/rohm-generic.h
> > > > > > b/include/linux/mfd/rohm-generic.h
> > > > > > index 66f673c35303..e5392bcbc098 100644
> > > > > > --- a/include/linux/mfd/rohm-generic.h
> > > > > > +++ b/include/linux/mfd/rohm-generic.h
> > > > > > @@ -14,6 +14,7 @@ enum rohm_chip_type {
> > > > > >  	ROHM_CHIP_TYPE_BD71828,
> > > > > >  	ROHM_CHIP_TYPE_BD9571,
> > > > > >  	ROHM_CHIP_TYPE_BD9574,
> > > > > > +	ROHM_CHIP_TYPE_BD71815,
> > > > > 
> > > > > Is there a technical reason why these can't be re-ordered?
> > > > 
> > > > No, I don't think so.
> > > > 
> > > > BTW. there will probably be a (trivial) conflict here as both
> > > > this
> > > > series and the BD9576/BD9573 series add an ID here. Let me
> > > > guess,
> > > > you'd
> > > 
> > > That's fine.  I will resolve that manually.
> > 
> > Thanks :)
> > 
> > > > like to see them sorted?
> > > 
> > > Wouldn't that be nice? :)
> > Aesthetics is not really my cup of tea. OTOH, if amount of IDs
> > grow,
> > then sorting helps spotting whether some IC has an ID here. So yes,
> > it
> > kind of makes sense.
> 
> By 'nice' I don't mean 'pretty'.
> 
> I mean 'improving readability/maintainability would be nice'.
> 
> > Can you do sorting while resolving the conflict between series or
> > do
> > you want me to
> > a) do sorting if (when) I re-spin the series
> > b) send separate sorting patch as a part of this series
> > c) send sepatate sorting patch after all the pending patches
> > touching
> > these IDs have been merged?
> 
> I'll let you use your imagination.
> 

Right :)

I'll sort the ID enum when I respin a series which is touching it, ok?
Or do you want me to resend this even if there were no other changes?

It's just an old habit to add new enums at the bottom to maintain
binary compatibility - which does not matter in this case.

Br,
	Matti Vaittinen



