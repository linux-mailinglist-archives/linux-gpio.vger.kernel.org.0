Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2695831742C
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 00:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234132AbhBJXQU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 18:16:20 -0500
Received: from smtprelay0066.hostedemail.com ([216.40.44.66]:41828 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233574AbhBJXNi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Feb 2021 18:13:38 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 2F19018029DA9;
        Wed, 10 Feb 2021 23:12:43 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2693:2828:3138:3139:3140:3141:3142:3352:3622:3653:3865:3867:3871:3872:4321:4362:5007:7652:7903:10004:10400:10848:11026:11232:11658:11914:12049:12296:12297:12740:12760:12895:13069:13311:13357:13439:13548:14659:14721:21080:21611:21627:30054:30060:30070:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: cork97_4c1518427613
X-Filterd-Recvd-Size: 2099
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf20.hostedemail.com (Postfix) with ESMTPA;
        Wed, 10 Feb 2021 23:12:41 +0000 (UTC)
Message-ID: <0bd0286b12832bdbe815325f581aec3a8ae3ca2d.camel@perches.com>
Subject: Re: [PATCH v2 1/2] pinctrl: use to octal permissions for debugfs
 files
From:   Joe Perches <joe@perches.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Date:   Wed, 10 Feb 2021 15:12:39 -0800
In-Reply-To: <20210210212115.GA216435@x1>
References: <20210210074946.155417-1-drew@beagleboard.org>
         <20210210074946.155417-2-drew@beagleboard.org>
         <87437daafdd86fa5c765ff9b17b6c7b097f0c317.camel@perches.com>
         <CAHp75VeJT0dPATD-Ux+JCEYxNTigbOn_6D_F1VQkfL=vuiCBPQ@mail.gmail.com>
         <ef9bc69ea67b70557265f117ce2a09f8019bb17d.camel@perches.com>
         <20210210212115.GA216435@x1>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2021-02-10 at 13:21 -0800, Drew Fustini wrote:
> I will change from the incorrect 0400 to 0444.

Thanks.

> As for S_IFREG, it does seem like leaving off S_IFREG is the most common
> case when using octal permissions with debugfs_create_*():
> 
> $ git grep debugfs_create drivers/ |grep 0444 |grep -v S_IFREG | wc -l
> 302
> $ git grep debugfs_create drivers/ |grep 0444 |grep S_IFREG | wc -l
> 9

It's ~2:1 when using S_IRUGO

$ git grep debugfs_create_file drivers/ | grep S_IRUGO | grep -v S_IFREG | wc -l
109
$ git grep debugfs_create_file drivers/ | grep S_IRUGO | grep S_IFREG | wc -l
48


