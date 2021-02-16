Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D4131CFA4
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Feb 2021 18:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbhBPRwR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Feb 2021 12:52:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbhBPRv4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2021 12:51:56 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C945C061574;
        Tue, 16 Feb 2021 09:51:16 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id m2so6719879pgq.5;
        Tue, 16 Feb 2021 09:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3K+lLj+ToepKcVL6jFBLayNi2lw8pt4wdM7MFFLValU=;
        b=kZcTyLWrhkAH4qUDGXjB1kikVrpaTpGrTd8n2Z3kSoT70/do/dOAO6Npv0419YLoCd
         CX5Zyrq3nlxYGQjRKdBi9EKi2a6ChpsPRJPC0GwTgagj9V2Cduq7Vjav2fiJgsok0BTJ
         8h5UkGxKjNofhLEDZHNB6M0BH/4bXz22dBGseHbQk8rMrnZqjGLgmF6LNMgS8hjvXYA5
         7hlYeKl1OciEIkHoZ2q4AchB8oTS4+T+PAImDJF941pChVTLaq7F8+6EhLwX40Glqk/o
         qqdiF9oLFqy6lm0pdLA/rH1EVN6riAk49srrO2ghiOStFfhOzfqSV/13eQg1mZYX6HPV
         owJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3K+lLj+ToepKcVL6jFBLayNi2lw8pt4wdM7MFFLValU=;
        b=qPO5Qluj6aECL+MLnXBe+bsKJB8sEg23JOWlnuj4tDYvB3zIJg3CgzzZMe6VZ63kYf
         bbBHkfh2jMJtq0Plp954A8527bWG8alA+H8eU2Hf9LI1YIgkS1KMz+jIYCaFIpiNct+J
         ixLoFyRUEYexVXOaLVPYanrihe6C8jfmOpON+e7E0LhOD8AQq8mGsmLTB+zUNE+4D1iE
         be9DjNvt6Dyj7WbYPPdB2qKTJqLdl2dSaINg2iTDiJpeceYjhvYjKYsMPTcDq2VGAAlZ
         PnCrcPlt+/mdnOvOkNfw4gDrWnH8FrWrd2FIkP5MtItyF04g9BFXr4apkPlYhc0igV34
         4BuQ==
X-Gm-Message-State: AOAM532qtNUHohHfPBZIppqi5fXtFxMip9kf/F/cocLhgFZUQ0dZKyYZ
        vNtI5IWeRqOogbLvW441xchlKloFNZP27Kj6dBTow+/Hoj9OnEBM
X-Google-Smtp-Source: ABdhPJwVO5MhJbC2nXdnYPgfgN9obY3svn0bEpjhbdwa3zbBXc/qZQSpJk11mqKowG1vd/lH/flnG+7qJGBIpEsojE4=
X-Received: by 2002:a65:4c08:: with SMTP id u8mr12071065pgq.203.1613497875959;
 Tue, 16 Feb 2021 09:51:15 -0800 (PST)
MIME-Version: 1.0
References: <20210211175140.85391-1-alban.bedel@aerq.com> <CAHp75VfUY5-VtCWjaU6Q=hJY9hyUz8B36C0528RXUxkbnL9yEA@mail.gmail.com>
 <4d67d5627921b0f7ca6579b81f97691c53ef0c34.camel@aerq.com>
In-Reply-To: <4d67d5627921b0f7ca6579b81f97691c53ef0c34.camel@aerq.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 16 Feb 2021 19:50:59 +0200
Message-ID: <CAHp75Vczzhs=8k9G1FQYvqOV+Xg3GHp2=TykJX+E5ypT8puFqw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: pca953x: add support for open drain pins on PCAL6524
To:     "Bedel, Alban" <alban.bedel@aerq.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 16, 2021 at 6:37 PM Bedel, Alban <alban.bedel@aerq.com> wrote:
> On Mon, 2021-02-15 at 14:53 +0200, Andy Shevchenko wrote:
> > Hint: don't forget to include reviewers from previous version
>
> I added you to the CC list for the new patch, did I miss someone else?

Then we are fine, thanks!

> > On Thu, Feb 11, 2021 at 7:52 PM Alban Bedel <alban.bedel@aerq.com>
> > wrote:
> > > From a quick glance at various datasheets the PCAL6524 and the
> > > PCAL6534 seems to be the only chips in this family that support
> > > setting the drive mode of single pins. Other chips either don't
> > > support it at all, or can only set the drive mode of whole banks,
> > > which doesn't map to the GPIO API.
> > >
> > > Add a new flag, PCAL65xx_REGS, to mark chips that have the extra
> > > registers needed for this feature. Then mark the needed register
> > > banks
> > > as readable and writable, here we don't set OUT_CONF as writable,
> > > although it is, as we only need to read it. Finally add a function
> > > that configures the OUT_INDCONF register when the GPIO API sets the
> > > drive mode of the pins.

Before continuing on this, have you considered to split this
particular chip to a real pin controller and use the existing driver
only for GPIO part of the functionality?

...

> > > +#define PCAL65xx_REGS          BIT(10)
> >
> > Can we have it as a _TYPE, please?
>
> Let's please take a closer look at these macros and what they mean.
> Currently we have 3 possible set of functions that are indicated by
> setting bits in driver_data using the PCA_xxx macros:
>
> - Basic register only: 0
> - With interrupt support: PCA_INT
> - With latching interrupt regs: PCA_INT | PCA_PCAL = PCA_LATCH_INT
>
> This patch then add a forth case:
>
> - With pin config regs: PCA_INT | PCA_PCAL | $MACRO_WE_ARE_DICUSSING
>
> Then there is the PCA953X_TYPE and PCA957X_TYPE macros which indicate
> the need for a different regmap config and register layout.

Exactly, and you have a different register layout (coincidentally
overlaps with the original PCA953x).

> These are
> accessed using the PCA_CHIP_TYPE() and are used as an integer value,
> not as bit-field like the above ones. If we had a struct instead of a
> packed integer that would be a different field.

How come? It's a bitmask.

> I'll change it to PCAL65xx_TYPE if you insist, but that seems very
> wrong to me to use the same naming convention for macros meant for
> different fields.

To me it's the opposite. The 6524 defines a new type (which has some
registers others don't have). We even have already definitions of
those special registers. I think TYPE is a better approach here.

> > > +#define PCAL65xx_BANK_INDOUT_CONF BIT(8 + 12)
> >
> > IND is a bit ambiguous based on the description below.
> > After you elaborate, I probably can propose better naming.
>
> It's derived from the register name in the datasheet which is
> "Individual pin output port X configuration register".

Since we have already register definitions, if should follow existing
pattern, i.e. OUT_INDCONF.

-- 
With Best Regards,
Andy Shevchenko
