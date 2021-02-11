Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 231503185A3
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 08:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbhBKHZJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 02:25:09 -0500
Received: from smtprelay0232.hostedemail.com ([216.40.44.232]:58398 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229533AbhBKHZI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Feb 2021 02:25:08 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id B098A180A68C3;
        Thu, 11 Feb 2021 07:24:26 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:960:966:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3872:4321:4385:5007:7652:7903:10004:10226:10400:10848:11026:11232:11473:11658:11914:12050:12297:12663:12740:12760:12895:13069:13311:13357:13439:14659:14721:21080:21451:21611:21627:21990:30012:30054:30070:30079:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: cart80_3f0d51b27616
X-Filterd-Recvd-Size: 2439
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf11.hostedemail.com (Postfix) with ESMTPA;
        Thu, 11 Feb 2021 07:24:24 +0000 (UTC)
Message-ID: <7b4105ca8671a2962910deb5418a934bf07d1458.camel@perches.com>
Subject: Re: [PATCH v4 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
From:   Joe Perches <joe@perches.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Date:   Wed, 10 Feb 2021 23:24:23 -0800
In-Reply-To: <20210211071153.GJ20820@kadam>
References: <20210210222851.232374-1-drew@beagleboard.org>
         <20210210222851.232374-3-drew@beagleboard.org>
         <20210211071153.GJ20820@kadam>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2021-02-11 at 10:11 +0300, Dan Carpenter wrote:
> On Wed, Feb 10, 2021 at 02:28:54PM -0800, Drew Fustini wrote:
> > +	ret = strncpy_from_user(buf, user_buf, PINMUX_MAX_NAME * 2);
> > +	if (ret < 0) {
> > +		dev_err(pctldev->dev, "failed to copy buffer from userspace");
> > +		goto free_gname;
> > +	}
> > +	buf[len-1] = '\0';
> > +
> > +	ret = sscanf(buf, "%s %s", fname, gname);
> > +	if (ret != 2) {
> > +		dev_err(pctldev->dev, "expected format: <function-name> <group-name>");
> > +		goto free_gname;
> 
> We need a "ret = -EINVAL;" before the goto.  sscanf doesn't return error
> codes.  Normally we would write it like so:
> 
> 	if (sscanf(buf, "%s %s", fname, gname) != 2) {
> 		dev_err(pctldev->dev, "expected format: <function-name> <group-name>");
> 		ret = -EINVAL;
> 		goto free_gname;
> 	}
> 
> I'm going to write a Smatch check for this today.

It's a pretty frequently used style:

$ git grep -P '\w+\s*=\s+sscanf\b' | wc -l
327

A grep with -A5 seems to show most use some additional error assignment
when checking the return value.

$ git grep -P -A5 '\w+\s*=\s+sscanf\b' | grep -P '(?:return|=)\s*\-E' | wc -l
174


