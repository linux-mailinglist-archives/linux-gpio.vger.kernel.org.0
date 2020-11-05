Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7DB2A7505
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 02:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731210AbgKEBrc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 20:47:32 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:3689 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725862AbgKEBrc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Nov 2020 20:47:32 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4CRRGn2ncnzkL;
        Thu,  5 Nov 2020 02:47:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1604540850; bh=1TyHBCCwpl8WXLOw+y00Ta+ECeljoineDBn6iSjkCAw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TUrf1FzY/5AEa3aMTEedGY7q3vRnqz53uDcIDmF2tLB03WrhU7s8SNdhNkT/J8TaB
         DEKCRz62wqI0c75H/ZFqT/JOExo7DNBacbn55pPNJqpgmp7k9zWT365wrtrEtiBZhb
         3l0jL3+SVin6CDQJAUvMjk+KoELxR4rJUHXdCOE4bdrTJG4chekK693/R0MmY7wxVZ
         NfnynWCXECVjzULYWf64tPwBxA6Bbylty/Z+7pmb492+hhgblsWkUJBfAqomK3/q2k
         7kr9HoIG3O7qJ63SG3esoJPziNMTcz+s5hrgsb9x3+7TSUCK8YL7Kd6NJHUFXpYqFf
         wsxQAp6Y87Aug==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Thu, 5 Nov 2020 02:47:28 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 1/5] gpio: tps65910: use regmap accessors
Message-ID: <20201105014728.GC17266@qmqm.qmqm.pl>
References: <cover.1601164493.git.mirq-linux@rere.qmqm.pl>
 <e3a3979657babf716e5f4072e373637ce86ad7ff.1601164493.git.mirq-linux@rere.qmqm.pl>
 <CACRpkdaMHH35C1LqUROFBte3T00Lz0zApHy3hdZ83Z8EZR04hw@mail.gmail.com>
 <20201001090104.GM6148@dell>
 <20201104144331.GG4488@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201104144331.GG4488@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 04, 2020 at 02:43:31PM +0000, Lee Jones wrote:
> On Thu, 01 Oct 2020, Lee Jones wrote:
> > On Wed, 30 Sep 2020, Linus Walleij wrote:
> > > On Sun, Sep 27, 2020 at 1:59 AM Micha³ Miros³aw <mirq-linux@rere.qmqm.pl> wrote:
> > > > Use regmap accessors directly for register manipulation - removing one
> > > > layer of abstraction.
> > > >
> > > > Signed-off-by: Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > 
> > > I suppose it is easiest that Lee apply all patches to the MFD tree?
> > Yes, that's fine.
> I think this patch is orthogonal right?
> 
> Not sure why it need to go in via MFD.
[...]

The patch 4 assumes all previous patches are applied (or there will be
build breakage).

Best Regards
Micha³ Miros³aw
