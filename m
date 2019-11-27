Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD1C210BDFF
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 22:33:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730973AbfK0VdK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 16:33:10 -0500
Received: from smtprelay0241.hostedemail.com ([216.40.44.241]:54075 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730628AbfK0VdK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Nov 2019 16:33:10 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 49DF1180020E4;
        Wed, 27 Nov 2019 21:33:08 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::::::::::::::::::::::::::,RULES_HIT:41:355:379:599:800:960:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2560:2563:2682:2685:2828:2859:2895:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3871:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:6117:6119:6742:7901:9025:10004:10400:11232:11658:11914:12043:12050:12297:12740:12895:13069:13161:13229:13255:13311:13357:13439:13894:14181:14659:14721:21080:21627:21788:30054:30060:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: cows61_381bf37cb8f3e
X-Filterd-Recvd-Size: 2684
Received: from XPS-9350.home (unknown [47.151.135.224])
        (Authenticated sender: joe@perches.com)
        by omf19.hostedemail.com (Postfix) with ESMTPA;
        Wed, 27 Nov 2019 21:33:05 +0000 (UTC)
Message-ID: <b2cbe247a33dd9f6c747fce180f964b88d5dc70a.camel@perches.com>
Subject: Re: [PATCH 4/5] pinctrl: sh-pfc: Use the correct style for SPDX
 License Identifier
From:   Joe Perches <joe@perches.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Nishad Kamdar <nishadkamdar@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-amlogic <linux-amlogic@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Wed, 27 Nov 2019 13:32:39 -0800
In-Reply-To: <CAMuHMdUSSHvQ74c156tuhWShp05TQuSmXa-kY3HNbYj0VL_d4g@mail.gmail.com>
References: <cover.1574871463.git.nishadkamdar@gmail.com>
         <5a7ed2e4b58ba7ff2f0638a2435a3a1e1c62c9f6.1574871463.git.nishadkamdar@gmail.com>
         <CAMuHMdUqfRioTBV27AKx9zv9YuSqEod6x+A4aguf=h20TDXr6w@mail.gmail.com>
         <9bacc7d9-6bd9-0b7c-18cd-d614796397dd@suse.de>
         <ae40eb808f420f5de4a140b8757dfbc426a8cf90.camel@perches.com>
         <CAMuHMdUSSHvQ74c156tuhWShp05TQuSmXa-kY3HNbYj0VL_d4g@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2019-11-27 at 22:12 +0100, Geert Uytterhoeven wrote:
> On Wed, Nov 27, 2019 at 9:59 PM Joe Perches <joe@perches.com> wrote:
> > On Wed, 2019-11-27 at 21:55 +0100, Andreas Färber wrote:
> > > However, if we're touching these lines anyway, shouldn't we be updating
> > > the SPDX Identifier to GPL-2.0-only while at it?
> > 
> > Probably better to do that with a treewide script one day.
> 
> Yeah... But it's already more than one year after
> 
> > https://lkml.org/lkml/2018/8/16/487
> 
> and Documentation/process/license-rules.rst (which is the authoritive
> rule?) still hasn't been updated...

The patch still applies today...


