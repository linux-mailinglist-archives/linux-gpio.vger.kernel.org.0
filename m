Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD821B4E9C
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 22:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgDVUwq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 16:52:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:50558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725779AbgDVUwq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Apr 2020 16:52:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C637920857;
        Wed, 22 Apr 2020 20:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587588765;
        bh=Ip45XjNU3RfaDdS8GuN5nOdWgVjIUF1z7tcIGoDtEkI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=a2ofJsV+3c30LI/TqgmPbHk3GA/NjMJEhkk+06ZoNpF4jh14gNBBYW82NSJShgwQ3
         HEbAUcdqQ8QbFJZKcDSax3rybD6T4m/T35TlNYigGsqFmJqm1a8+xTgrlNgsVuMBvK
         NNQSHQZ+OCCxlYYi7sEsKemN+ZMz8QTzgYTQETss=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <60402718-f36c-cab3-2766-9ae180dd7504@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com> <20200409195841.18901-13-pierre-louis.bossart@linux.intel.com> <158754793532.132238.9824423478783177623@swboyd.mtv.corp.google.com> <60402718-f36c-cab3-2766-9ae180dd7504@linux.intel.com>
Subject: Re: [RFC PATCH 12/16] clk: hifiberry-dacpro: add ACPI support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        tiwai@suse.de, Linus Walleij <linus.walleij@linaro.org>,
        Daniel Matuschek <daniel@hifiberry.com>,
        Hui Wang <hui.wang@canonical.com>,
        Matthias Reichl <hias@horus.com>, broonie@kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org
Date:   Wed, 22 Apr 2020 13:52:44 -0700
Message-ID: <158758876497.163502.13202465070681172627@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Pierre-Louis Bossart (2020-04-22 02:54:38)
>=20
>=20
> On 4/22/20 4:32 AM, Stephen Boyd wrote:
> > Quoting Pierre-Louis Bossart (2020-04-09 12:58:37)
> >> On ACPI platforms the of_ functions are irrelevant, conditionally
> >> compile them out and add devm_clk_hw_register_clkdev() call instead.
> >>
> >> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.=
com>
> >> ---
> >>   drivers/clk/clk-hifiberry-dacpro.c | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >> diff --git a/drivers/clk/clk-hifiberry-dacpro.c b/drivers/clk/clk-hifi=
berry-dacpro.c
> >> index bf0616c959da..d01a90fed51b 100644
> >> --- a/drivers/clk/clk-hifiberry-dacpro.c
> >> +++ b/drivers/clk/clk-hifiberry-dacpro.c
> >> @@ -114,15 +114,22 @@ static int clk_hifiberry_dacpro_probe(struct pla=
tform_device *pdev)
> >>                  return ret;
> >>          }
> >>  =20
> >> +#ifndef CONFIG_ACPI
> >=20
> > Use if (!IS_ENABLED(CONFIG_ACPI)) instead?
>=20
> git grep CONFIG_ACPI shows most of the kernel code uses #if(n)def=20
> CONFIG_ACPI. It's equivalent, it's a boolean.

It's not equivalent. It is a pre-processor directive vs. an if statement
that evaluates to 0 or 1 and lets the compiler see both sides of the
code to check types.
