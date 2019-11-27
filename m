Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61CC910BC5B
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 22:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731539AbfK0VUb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 16:20:31 -0500
Received: from smtprelay0028.hostedemail.com ([216.40.44.28]:35402 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727454AbfK0VI6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Nov 2019 16:08:58 -0500
X-Greylist: delayed 540 seconds by postgrey-1.27 at vger.kernel.org; Wed, 27 Nov 2019 16:08:57 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 738B71802EC06;
        Wed, 27 Nov 2019 20:59:57 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 794C21802587B;
        Wed, 27 Nov 2019 20:59:55 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::::::::::::::::::::::::::,RULES_HIT:41:355:379:599:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1537:1561:1593:1594:1711:1714:1730:1747:1777:1792:2393:2525:2560:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3622:3865:3867:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:6117:6742:7901:8985:9025:10004:10400:10848:11232:11658:11914:12043:12050:12297:12740:12895:13069:13255:13311:13357:13439:13894:14181:14659:14721:21080:21627:21788:30054:30060:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: goose47_391d3abea6950
X-Filterd-Recvd-Size: 2157
Received: from XPS-9350.home (unknown [47.151.135.224])
        (Authenticated sender: joe@perches.com)
        by omf02.hostedemail.com (Postfix) with ESMTPA;
        Wed, 27 Nov 2019 20:59:52 +0000 (UTC)
Message-ID: <ae40eb808f420f5de4a140b8757dfbc426a8cf90.camel@perches.com>
Subject: Re: [PATCH 4/5] pinctrl: sh-pfc: Use the correct style for SPDX
 License Identifier
From:   Joe Perches <joe@perches.com>
To:     Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Nishad Kamdar <nishadkamdar@gmail.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
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
Date:   Wed, 27 Nov 2019 12:59:25 -0800
In-Reply-To: <9bacc7d9-6bd9-0b7c-18cd-d614796397dd@suse.de>
References: <cover.1574871463.git.nishadkamdar@gmail.com>
         <5a7ed2e4b58ba7ff2f0638a2435a3a1e1c62c9f6.1574871463.git.nishadkamdar@gmail.com>
         <CAMuHMdUqfRioTBV27AKx9zv9YuSqEod6x+A4aguf=h20TDXr6w@mail.gmail.com>
         <9bacc7d9-6bd9-0b7c-18cd-d614796397dd@suse.de>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2019-11-27 at 21:55 +0100, Andreas Färber wrote:
> However, if we're touching these lines anyway, shouldn't we be updating
> the SPDX Identifier to GPL-2.0-only while at it?

Probably better to do that with a treewide script one day.

https://lkml.org/lkml/2018/8/16/487


