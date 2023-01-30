Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 354EF681B02
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 21:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236938AbjA3UAu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 15:00:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236434AbjA3UAt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 15:00:49 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42EC45F73
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 12:00:47 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id h9so4231276plf.9
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 12:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oYPPhRQH7ubPQanie/vKOvvHKXQgtOiqcTGLviBDhmA=;
        b=VuIJDnbFxTUIxWa8L1VWYdb9MI+Uw4XrbLFKat84mMs9afmGaZW62Y8sKNZY5LBIF4
         +Ul6XxbH/vm/jWs4c0ZPc3jWE3uAo28avKQqTO/OylcU85C+pB8xolsbJyGsGs/rL36V
         ZSGY0QiNRBwyMe6LPf8vVH/qahQuHtl7YMtCVevzTZ34CA2joFRibts3ttJxVgZaxcTx
         l/FqMCCgujpobwNcfJfN4c6OBuaJYFlasSYS1viKL0qQV/M1/KYatfFCLgEyymahIMwl
         4hVV55hFljOlpo+yPWWpOYotAjaJ3htnES4ajEtyGZ/W45QNCPKfgFhg3OCpw5z0Gfbg
         1ESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYPPhRQH7ubPQanie/vKOvvHKXQgtOiqcTGLviBDhmA=;
        b=GHr2NHDLLTmn+GIRoHpzggWs4UnGKiPy+PmwbbpX6mqKS510rXlDGx6dczAsxUye4H
         QHDbDUCFQXGrv6wNTxeAJDrgJQbMT53947CpLukUnMYIIS1v9QudGvJ76bh/UMEflGhp
         wQCGu5Y9MEX0eA2kBEkZvV3xwmYad2TVz+b1Dmo8ZHAZoUth9Ee/Szc44+SXDr2rTrDy
         TLNu64eXc8m8+ZEwDj0swbMbRZDPliTiaQ/vSOGBPMdmPbeDlS7jsut0DnniRCg3cbPk
         8VQXDhBL+l5ivmYvttk4Dy1GR+7dE8MZQACUy6iVjytwo1wqXnw/5HrR3Bq+caQ5MXJv
         nYxg==
X-Gm-Message-State: AO0yUKW3XstRjzqOSvGrti7Fxo2odaHoK62/9FsYqgnkm28n7ylBV1B4
        xfkaDiNcqrL/Ty/Z0eXrWXsrIXvISh1Tx6tyG8Eg2g==
X-Google-Smtp-Source: AK7set+H0YyjCWkJd7M+yIj4eRkqAmXNub+KUOd2n+yHCGliVqKml+ieu+Re/d5tqMId+oQWqascMv0yHsacweeoFCU=
X-Received: by 2002:a17:902:d64d:b0:196:7c6e:eb8d with SMTP id
 y13-20020a170902d64d00b001967c6eeb8dmr912246plh.12.1675108846782; Mon, 30 Jan
 2023 12:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20230127001141.407071-1-saravanak@google.com> <20230127001141.407071-4-saravanak@google.com>
 <CAMuHMdV4B49OM7S-UAxJtfAR8OvG_-S526fGnTA+t+-orytrTw@mail.gmail.com>
 <CAGETcx9EXkbAfEX6pBL84DBr3SEwiJe7N4xh91TspLn8CwZ+LQ@mail.gmail.com> <CAMuHMdUFeSim2gvmiBuPbAajbK6ybh67gBmbLLqRhG1T5+v0JA@mail.gmail.com>
In-Reply-To: <CAMuHMdUFeSim2gvmiBuPbAajbK6ybh67gBmbLLqRhG1T5+v0JA@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 30 Jan 2023 12:00:10 -0800
Message-ID: <CAGETcx-TSrjFnmxV02TMaGN6Au4f9SuLgzjMPOqAOTqx_bqLhA@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] soc: renesas: Move away from using OF_POPULATED
 for fw_devlink
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux Kernel Functional Testing <lkft@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        John Stultz <jstultz@google.com>,
        Doug Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxim Kiselev <bigunclemax@gmail.com>,
        Maxim Kochetkov <fido_max@inbox.ru>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Colin Foster <colin.foster@in-advantage.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Jean-Philippe Brucker <jpb@kernel.org>,
        kernel-team@android.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 30, 2023 at 12:43 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Saravana,
>
> On Sat, Jan 28, 2023 at 8:19 AM Saravana Kannan <saravanak@google.com> wrote:
> > On Fri, Jan 27, 2023 at 12:11 AM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Fri, Jan 27, 2023 at 1:11 AM Saravana Kannan <saravanak@google.com> wrote:
> > > > The OF_POPULATED flag was set to let fw_devlink know that the device
> > > > tree node will not have a struct device created for it. This information
> > > > is used by fw_devlink to avoid deferring the probe of consumers of this
> > > > device tree node.
> > > >
> > > > Let's use fwnode_dev_initialized() instead because it achieves the same
> > > > effect without using OF specific flags. This allows more generic code to
> > > > be written in driver core.
> > > >
> > > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/soc/renesas/rcar-sysc.c
> > > > +++ b/drivers/soc/renesas/rcar-sysc.c
> > > > @@ -437,7 +437,7 @@ static int __init rcar_sysc_pd_init(void)
> > > >
> > > >         error = of_genpd_add_provider_onecell(np, &domains->onecell_data);
> > > >         if (!error)
> > > > -               of_node_set_flag(np, OF_POPULATED);
> > > > +               fwnode_dev_initialized(&np->fwnode, true);
> > >
> > > As drivers/soc/renesas/rmobile-sysc.c is already using this method,
> > > it should work fine.
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > i.e. will queue in renesas-devel for v6.4.

I hope you meant queue it up for 6.3 and not 6.4?

> >
> > Thanks! Does that mean I should drop this from this series? If two
> > maintainers pick the same patch up, will it cause problems? I'm
> > eventually expecting this series to be picked up by Greg into
> > driver-core-next.
>
> Indeed. Patches for drivers/soc/renesas/ are supposed to go upstream
> through the renesas-devel and soc trees. This patch has no dependencies
> on anything else in the series (or vice versa), so there is no reason
> to deviate from that, and possibly cause conflicts later.

This series is supposed to fix a bunch of issues and I vaguely think
the series depends on this patch to work correctly on some Renesas
systems. You are my main renesas person, so it's probably some issue
you hit. Is you pick it up outside of this series I need to keep
asking folks to pick up two different patch threads. I don't have a
strong opinion, just a FYI. If you can take this patch soon, I don't
have any concerns.

> BTW, I will convert to of_node_to_fwnode() while applying.

Sounds good.

-Saravana
