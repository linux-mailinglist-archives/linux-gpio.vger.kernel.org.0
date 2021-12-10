Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1238746FB1C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 08:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233441AbhLJHLo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 02:11:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233193AbhLJHLo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 02:11:44 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D3FC061746
        for <linux-gpio@vger.kernel.org>; Thu,  9 Dec 2021 23:08:09 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 137so6082945wma.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Dec 2021 23:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=mEi8zG32L5BM4knFZEh4X58cQ8vPXgu19KLr41BpThw=;
        b=Z6V9lTHVh6jLpNPghCGj0gBazVEG9jUCUKQWeKb4JW40szPdmPOHXRE2VDcDyyV0C9
         216/e2PXEPymhtk8ZdEzo8o17umAnx1VNG1xZeLO6Qth4w6tgfsdsZgbFBtvokkBlCXO
         ZdkyjO5ptGLEECJp2DrTBIDDjFTmx+e2ggwmOo1+/ldTOkHLBvRwTA4sxulgG1Q3MYr8
         BIDCb+NzWAiEpcJ+282vAucKi7ooalkj1EG7Spu9OqHH45JbMxCRNb7LokrTxsgSP1EM
         lboVleVDZfsOBzQ4jBbLnyEILNrEoArDU83Jk2WAcCoFIDugCqG9dOrN7cbVL/hl0BGG
         p4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mEi8zG32L5BM4knFZEh4X58cQ8vPXgu19KLr41BpThw=;
        b=G8v+3iDzjLrYoCrf70ZpNUR3c27ssg78rzax0zakDO1tZtoTd/06lTSP7HjGqqBswK
         3N7Jff0MM4Qc/65sHkeFVaKHErYdTXAcpiZXGP4bBdH+2KQayfphr5bpQF3qORLKgBm0
         uPIFk2fQlGWxD6O8ovBvup9Jr8bQ4dBJpkj+tXsRnfHMNT5TYD5nSwPt9L1DpFxZRaY1
         yyDuWEMqxuIVL6Bfe50KSMM+3iWpgXyE78kPlIyCAc2b2xQswLcK6MkxCoqOynjz5Ens
         qk2arXOK2NaDTMNZyKhZRHd8nCVusE7AM0P20XVWmJ0i0KCyzUMRNo8FDL59udPWEByc
         /wew==
X-Gm-Message-State: AOAM532RYBbwyo3bkXLGldhoMOgRMhKrHi4v/jjSQpHC/Y0ep9pstIl9
        8HJ8suzMIG8ZXPuz8/8FywUDEg==
X-Google-Smtp-Source: ABdhPJxTuFvBSTJZKodLxPpdabMZCi2ERxfZPpgov67fsd+HFyE6MnNUboiG7cgRHbbzpq0oG6+31A==
X-Received: by 2002:a05:600c:3489:: with SMTP id a9mr14243155wmq.120.1639120087972;
        Thu, 09 Dec 2021 23:08:07 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id p27sm1922934wmi.28.2021.12.09.23.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 23:08:07 -0800 (PST)
Date:   Fri, 10 Dec 2021 07:08:05 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>, Andrew Lunn <andrew@lunn.ch>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Bruno Banelli <bruno.banelli@sartura.hr>
Subject: Re: [PATCH v9 3/6] dt-bindings: reset: Add Delta TN48M
Message-ID: <YbL81TEMp8CA7Sam@google.com>
References: <20211109113239.93493-1-robert.marko@sartura.hr>
 <20211109113239.93493-3-robert.marko@sartura.hr>
 <CA+HBbNGH9ih5RovU9YHL91osFxDJbWw2Qk=ed30GGQvndNJPKw@mail.gmail.com>
 <33ab37f5b30252e41f3e0769c7702764a9e77d7f.camel@pengutronix.de>
 <CA+HBbNH5Hq7WC7PkpFt=hUsTRstP3KrNCsbWWy5QaZRFDvZDKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+HBbNH5Hq7WC7PkpFt=hUsTRstP3KrNCsbWWy5QaZRFDvZDKA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 09 Dec 2021, Robert Marko wrote:

> On Thu, Dec 9, 2021 at 10:40 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> >
> > Hi Robert,
> >
> > On Wed, 2021-12-01 at 22:28 +0100, Robert Marko wrote:
> > > On Tue, Nov 9, 2021 at 12:32 PM Robert Marko <robert.marko@sartura.hr> wrote:
> > > >
> > > > Add header for the Delta TN48M CPLD provided
> > > > resets.
> > > >
> > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > ---
> > > >  include/dt-bindings/reset/delta,tn48m-reset.h | 20 +++++++++++++++++++
> > > >  1 file changed, 20 insertions(+)
> > > >  create mode 100644 include/dt-bindings/reset/delta,tn48m-reset.h
> > > >
> > > > diff --git a/include/dt-bindings/reset/delta,tn48m-reset.h b/include/dt-bindings/reset/delta,tn48m-reset.h
> > > > new file mode 100644
> > > > index 000000000000..d4e9ed12de3e
> > > > --- /dev/null
> > > > +++ b/include/dt-bindings/reset/delta,tn48m-reset.h
> > > > @@ -0,0 +1,20 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +/*
> > > > + * Delta TN48M CPLD GPIO driver
> > > > + *
> > > > + * Copyright (C) 2021 Sartura Ltd.
> > > > + *
> > > > + * Author: Robert Marko <robert.marko@sartura.hr>
> > > > + */
> > > > +
> > > > +#ifndef _DT_BINDINGS_RESET_TN48M_H
> > > > +#define _DT_BINDINGS_RESET_TN48M_H
> > > > +
> > > > +#define CPU_88F7040_RESET      0
> > > > +#define CPU_88F6820_RESET      1
> > > > +#define MAC_98DX3265_RESET     2
> > > > +#define PHY_88E1680_RESET      3
> > > > +#define PHY_88E1512_RESET      4
> > > > +#define POE_RESET              5
> > > > +
> > > > +#endif /* _DT_BINDINGS_RESET_TN48M_H */
> > > >
> > >
> > > Does anybody have any comments on the patch as the reset driver got reviewed and
> > > the bindings have not?
> >
> > Not much to review here, I can't tell if the indices are correct.
> >
> > Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> >
> > To be merged with the rest of the series. Or do you want me to pick up
> > the reset parts individually? In that case you'd have to split out the
> > reset bindings into a separate patch.
> 
> Thanks,
> It has to go with the rest of the series as it all depends on the MFD.
> 
> We are just waiting for the MFD dt-bindings to be reviewed.

We need Rob to review the set.  Then I'll happily take it.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
