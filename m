Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 517851F9BA5
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 17:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730753AbgFOPMb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 11:12:31 -0400
Received: from mga05.intel.com ([192.55.52.43]:6502 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729875AbgFOPMb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 11:12:31 -0400
IronPort-SDR: +y4UHbwz2ux2avnzUVwENOQMNmfmbb9hLMw3fzUi+Ojyt22TiFrCrNXvbNkosbGnQPspzppuci
 cr+GKmCcjbeA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 08:12:30 -0700
IronPort-SDR: vZhxHtn/kD9Imc85J7Gkwf9qygtjoPruVDG9ESMt7IfcNWGvG31d3HHmmRuI5yyFPmyuRA7MuM
 UpFRJqKZfMWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,515,1583222400"; 
   d="scan'208";a="351393842"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 15 Jun 2020 08:12:29 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1jkqml-00Db1E-O3; Mon, 15 Jun 2020 18:12:31 +0300
Date:   Mon, 15 Jun 2020 18:12:31 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v1 4/4] gpio: pca953x: disable regmap locking for
 automatic address incrementing
Message-ID: <20200615151231.GG2428291@smile.fi.intel.com>
References: <20200605134036.9013-1-andriy.shevchenko@linux.intel.com>
 <20200605134036.9013-4-andriy.shevchenko@linux.intel.com>
 <20200615122044.j2vdhpmhbpsw6qkb@taurus.defre.kleine-koenig.org>
 <20200615125349.GD2428291@smile.fi.intel.com>
 <20200615132027.flexasjahrn6floq@taurus.defre.kleine-koenig.org>
 <CAHp75VcA8ExfpBXyo=nB0KqP5+s9RWq8YtZ03Z8UTp7RSPvTmQ@mail.gmail.com>
 <20200615141804.aocz2tw3czlcyaxy@taurus.defre.kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200615141804.aocz2tw3czlcyaxy@taurus.defre.kleine-koenig.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 15, 2020 at 04:18:04PM +0200, Uwe Kleine-König wrote:
> On Mon, Jun 15, 2020 at 04:38:23PM +0300, Andy Shevchenko wrote:
> > On Mon, Jun 15, 2020 at 4:23 PM Uwe Kleine-König
> > <u.kleine-koenig@pengutronix.de> wrote:
> > > On Mon, Jun 15, 2020 at 03:53:49PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Jun 15, 2020 at 02:20:44PM +0200, Uwe Kleine-König wrote:
> > > > > On Fri, Jun 05, 2020 at 04:40:36PM +0300, Andy Shevchenko wrote:
> > > > > > It's a repetition of the commit aa58a21ae378
> > > > > >   ("gpio: pca953x: disable regmap locking")
> > > > > > which states the following:
> > > > > >
> > > > > >   This driver uses its own locking but regmap silently uses
> > > > > >   a mutex for all operations too. Add the option to disable
> > > > > >   locking to the regmap config struct.
> > > > > >
> > > > > > Fixes: bcf41dc480b1 ("gpio: pca953x: fix handling of automatic address incrementing")
> > > > > > Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > >
> > > > > Ah, good catch. I assume that I didn't have aa58a21ae378 in my tree when
> > > > > I created the patch that then became bcf41dc480b1.
> > > > >
> > > > > Looks right
> > > > >
> > > > > Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > >
> > > > Thanks!
> > > >
> > > > Linus, Bart, just to clarify that this is material for one of the next v5.8-rcX
> > > > (this cycle!).
> > >
> > > I didn't test but I wonder if this patch is really urgent.
> > 
> > I'm talking about this entire fix-series.
> 
> Ah, I didn't notice this is a series as I only got patch 4.

In case you are curious / want to try:
https://lore.kernel.org/linux-gpio/20200605134036.9013-1-andriy.shevchenko@linux.intel.com/T/#m5e01e6462f2f72fbc4bdd3f71c330b7a2f75d5ba

-- 
With Best Regards,
Andy Shevchenko


