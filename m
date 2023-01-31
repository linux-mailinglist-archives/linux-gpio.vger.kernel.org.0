Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3C5D682576
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Jan 2023 08:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjAaHVW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Jan 2023 02:21:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbjAaHVP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2023 02:21:15 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB5E1ABC6
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 23:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675149673; x=1706685673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IVFg2YIwtxGykDVIdDHfwx0TsW2m4rSROxT0BiZ/jCA=;
  b=HH8vaTVWHJdpkZ+mgTTqEJwcLU/JW//wnoIR/NTGEdamfFGmPnTYpy7A
   Hz80iuC/tKb0pLBsJFBzf/ujs7utVt07Ero9LkzJnfuNL1pPQvdHLUAKC
   VBhoJYMWy11KI+5JjRbvf72jVjPt8qGvCog2gsh+SEbwJSSMU++XuplB/
   Il07SFe0+lRrCwySnK52l+19gPLNZer13pcTqi2eXgfsKptQ78nVHWbbU
   NbbU/+5Ke4yGSPXf3t69LvbPrDjJH/ym/edAR/PVmbflnQcHlKbTrVXp2
   5S5E5nW3bNpmp+hDsYYS9yh6ArCx5zT/GVcsB//z0jScK3Os/BmnHzbdE
   w==;
X-IronPort-AV: E=Sophos;i="5.97,259,1669071600"; 
   d="scan'208";a="28758267"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 31 Jan 2023 08:21:11 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 31 Jan 2023 08:21:11 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 31 Jan 2023 08:21:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675149671; x=1706685671;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IVFg2YIwtxGykDVIdDHfwx0TsW2m4rSROxT0BiZ/jCA=;
  b=iLsfU9VGCgEiZMNOQ15Jr2NFln0VQbuZdwuZZrenTKfxfRkYr8QFgu8q
   0/VeZ/271ZXyKJ9vU75OJmIFgLg7hbK4sA8WymaW5vPW4iUyZ51+tURTQ
   JTxvUWwlriY2IfvauiNOI9l5RiZcyFFECbILZSlyCHXG8QndNYtyIQr4w
   jmtlG2GsEFLl4hGY41SXZsxNq1kZGUYPW35Wqf4WjaTkO7qeVIUeLHR2d
   skv1yf1oPgNzmZDu2j/csrlm5Zih8qUKOx9zw+g9i0NFC8QkSzRwoU2Af
   tsA1IgAyjQ3TkM6i73NIo+5btfzNW5weisD++xMUtfyKyfNT79ScjiMaU
   w==;
X-IronPort-AV: E=Sophos;i="5.97,259,1669071600"; 
   d="scan'208";a="28758266"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 31 Jan 2023 08:21:11 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 546D6280056;
        Tue, 31 Jan 2023 08:21:11 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Robert Schwebel <r.schwebel@pengutronix.de>,
        Sascha Hauer <sha@pengutronix.de>,
        bartosz.golaszewski@linaro.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        christophe.leroy@csgroup.eu, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org
Subject: Re: GPIO static allocation warning with v6.2-rcX
Date:   Tue, 31 Jan 2023 08:21:08 +0100
Message-ID: <12150419.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAL_JsqJofZ5386oS1hkme2n_pbQVe3OAVxusQvs43wzKCM2LZw@mail.gmail.com>
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de> <CACRpkdb-LbRrg0gwB6ArJ-=YdM5TtXVN3oZf58hPCppnt8ZUjg@mail.gmail.com> <CAL_JsqJofZ5386oS1hkme2n_pbQVe3OAVxusQvs43wzKCM2LZw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

Am Montag, 30. Januar 2023, 16:45:57 CET schrieb Rob Herring:
> On Mon, Jan 30, 2023 at 9:02 AM Linus Walleij <linus.walleij@linaro.org> 
wrote:
> > On Mon, Jan 30, 2023 at 12:02 PM Marco Felsch <m.felsch@pengutronix.de> 
wrote:
> > > On 23-01-30, Linus Walleij wrote:
> > > > On Sun, Jan 29, 2023 at 7:33 PM Robert Schwebel
> > > > 
> > > > <r.schwebel@pengutronix.de> wrote:
> > > > > While this could also be done with a daemon offering a dbus api,
> > > > > this
> > > > > would be significantly more complex. In a critical environment, one
> > > > > needs to make sure that the daemon process never fails, otherwhise
> > > > > the
> > > > > power of the DuT would maybe be in a random state. Then of course
> > > > > one
> > > > > can add a watchdog, but with the current sysfs interface it's really
> > > > > simple. Of course that would also work if the new interface would
> > > > > offer
> > > > > a "keep this line as it is" feature, but adding a dbus daemon just
> > > > > for
> > > > > keeping the state of a pin sounds overcomplex when the kernel could
> > > > > also
> > > > > provide that functionality.
> > > > 
> > > > One issue we face as developers is scaleability. Things that
> > > > seem straight forward on a single board computer in a lab get
> > > > really complex in a big system with man GPIO chips.
> > > > 
> > > > One of the big dangers of the sysfs ABI is that it is dependent on
> > > > probe order which the kernel sadly does not really guarantee.
> > > 
> > > Does it? At least the drive I listed (e.g. the imx gpio driver) uses
> > > aliases to make it reliable.
> > 
> > I'm not sure that is the intended use of the aliases in device tree.
> > (Rob can maybe answer this.)
> 
> The kernel community's position on stable device numbers for userspace
> is quite clear.

Sorry for this stupid question: What position is it? Is it documented 
somewhere?

> That is how aliases get used by the kernel though. IMO, they should be
> limited to a documented set of alias names, and GPIO is not one of
> them. We replaced the whole GPIO sysfs API for this reason (among
> others).

So in which case, or under which circumstances, aliases are acceptable?

Best regards,
Alexander

> IIRC, i.MX is one of the worst abusers with aliases for everything,
> most of which should be removed.
> 
> Rob



