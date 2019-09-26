Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2E6BE9C3
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2019 02:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbfIZAjh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Sep 2019 20:39:37 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:41910 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbfIZAjh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Sep 2019 20:39:37 -0400
Received: by mail-qk1-f195.google.com with SMTP id p10so353589qkg.8
        for <linux-gpio@vger.kernel.org>; Wed, 25 Sep 2019 17:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8eElvPCoM/FfEnn5Y4ueHDwedd4HgZwZRPzixoGrG8Y=;
        b=SRkhwVFdVzU6Xd8hDe1fjb+pbOsZaE2zoac5LpFpNUAq5387VnUQYu66P9pKspY4QS
         tyx/JCI8DmzLJyHnqqsJ4cys0kdlwdoTZUjr6txj2JT0y671xbzHCXGyc44Fp1J/VQwx
         qP76nOzMumdSVfW0J+k14XJdC3gtD8dYXnqgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8eElvPCoM/FfEnn5Y4ueHDwedd4HgZwZRPzixoGrG8Y=;
        b=W6Yz7HU5ak4GcvyScSkbhlW5uHkH0jPNgZ8Z2O5ZEr9wDKjHJfl5BuSRentDHkXnEI
         W71B4knJvIr1yqgUSfgcqY1qeR7sN0jREf/I5zJukBIAz+BsVIrsSK7evYkcXPvOd0Sz
         L6GLHPhxZfMJN6AXAMJOKgeH8J2mqJ66VqJ0/XrgZvW1mQuNPdmiPYBggwZuZVT3cw6u
         XvkgvoBRMXn3SgmgQU7jfX4C33NE7kQmaABo52UQg3RlOTGQ0yNfzjThSTY6nUCcge/x
         /uMcVCkpaQNFwObRwXmN/Uz9zvVIxdqqL9x/NA6Hg1kDeV9pntMVDH6Oz7roRbKlsOG+
         CDpQ==
X-Gm-Message-State: APjAAAUdIqQFaPubmqQm9e7KJwyY0melaWbnzbDX2UzoLLePUy/AUlKj
        fmvYkIrWkxmz4dWTT9s4f0lD18rJszi9i645i6sA7w==
X-Google-Smtp-Source: APXvYqysEFiOA5JsgMZ41RNUUxUa7Or5sDYleM9GT9IE+iSk5HjBjZ/LqeLOrwmBKEcZCtSL7jmzfEV43UKJ/AQUUqU=
X-Received: by 2002:a37:dcc1:: with SMTP id v184mr805620qki.258.1569458376178;
 Wed, 25 Sep 2019 17:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190924024958.GA229906@dtor-ws> <20190924082143.GS2680@smile.fi.intel.com>
In-Reply-To: <20190924082143.GS2680@smile.fi.intel.com>
From:   Alex Levin <levinale@chromium.org>
Date:   Wed, 25 Sep 2019 17:39:25 -0700
Message-ID: <CAPBFDX+Bjd7CZg2ZqBANJ6=pb9SA7bnpxOo=Lv4BS1CJUytEmQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: cherryview: restore Strago DMI workaround for
 all versions
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 24, 2019 at 1:21 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Sep 23, 2019 at 07:49:58PM -0700, Dmitry Torokhov wrote:
> > This is essentially a revert of:
> >
> > e3f72b749da2 pinctrl: cherryview: fix Strago DMI workaround
> > 86c5dd6860a6 pinctrl: cherryview: limit Strago DMI workarounds to version 1.0
> >
> > because even with 1.1 versions of BIOS there are some pins that are
> > configured as interrupts but not claimed by any driver, and they
> > sometimes fire up and result in interrupt storms that cause touchpad
> > stop functioning and other issues.
> >
> > Given that we are unlikely to qualify another firmware version for a
> > while it is better to keep the workaround active on all Strago boards.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Tested-by: Alex Levin <levinale@chromium.org>

>
> >
> > Reported-by: Alex Levin <levinale@chromium.org>
> > Fixes: 86c5dd6860a6 ("pinctrl: cherryview: limit Strago DMI workarounds to version 1.0")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/pinctrl/intel/pinctrl-cherryview.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> > index 03ec7a5d9d0b..bf049d1bbb87 100644
> > --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> > +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> > @@ -1513,7 +1513,6 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
> >               .matches = {
> >                       DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
> >                       DMI_MATCH(DMI_PRODUCT_FAMILY, "Intel_Strago"),
> > -                     DMI_MATCH(DMI_PRODUCT_VERSION, "1.0"),
> >               },
> >       },
> >       {
> > @@ -1521,7 +1520,6 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
> >               .matches = {
> >                       DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> >                       DMI_MATCH(DMI_PRODUCT_NAME, "Setzer"),
> > -                     DMI_MATCH(DMI_PRODUCT_VERSION, "1.0"),
> >               },
> >       },
> >       {
> > @@ -1529,7 +1527,6 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
> >               .matches = {
> >                       DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
> >                       DMI_MATCH(DMI_PRODUCT_NAME, "Cyan"),
> > -                     DMI_MATCH(DMI_PRODUCT_VERSION, "1.0"),
> >               },
> >       },
> >       {
> > @@ -1537,7 +1534,6 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
> >               .matches = {
> >                       DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
> >                       DMI_MATCH(DMI_PRODUCT_NAME, "Celes"),
> > -                     DMI_MATCH(DMI_PRODUCT_VERSION, "1.0"),
> >               },
> >       },
> >       {}
> > --
> > 2.23.0.351.gc4317032e6-goog
> >
> >
> > --
> > Dmitry
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
