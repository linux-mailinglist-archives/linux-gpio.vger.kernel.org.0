Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2193627764B
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 18:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728592AbgIXQKu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 12:10:50 -0400
Received: from smtprelay0138.hostedemail.com ([216.40.44.138]:34742 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728448AbgIXQKu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Sep 2020 12:10:50 -0400
X-Greylist: delayed 348 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Sep 2020 12:10:50 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 41F3F18003C3E;
        Thu, 24 Sep 2020 16:05:03 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 6A350181D337B;
        Thu, 24 Sep 2020 16:05:01 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1568:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3622:3865:3867:3873:4321:5007:10004:10400:10848:11026:11232:11658:11914:12043:12048:12297:12438:12740:12760:12895:13069:13311:13357:13439:13972:14659:14721:21080:21627:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:3,LUA_SUMMARY:none
X-HE-Tag: face47_290156b27160
X-Filterd-Recvd-Size: 1629
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf04.hostedemail.com (Postfix) with ESMTPA;
        Thu, 24 Sep 2020 16:04:59 +0000 (UTC)
Message-ID: <21cc553cc3a07e0952eb52a50149c323daff6041.camel@perches.com>
Subject: Re: [PATCH 5/9] gpio: mockup: use pr_fmt()
From:   Joe Perches <joe@perches.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 24 Sep 2020 09:04:58 -0700
In-Reply-To: <20200924113842.11670-6-brgl@bgdev.pl>
References: <20200924113842.11670-1-brgl@bgdev.pl>
         <20200924113842.11670-6-brgl@bgdev.pl>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2020-09-24 at 13:38 +0200, Bartosz Golaszewski wrote:
> We don't need a custom logging helper. Let's use the standard pr_fmt()
> macro which allows us to use all pr_*() routines with custom format.
[]
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
[]
> @@ -577,7 +577,7 @@ static int __init gpio_mockup_init(void)
>  
>  		pdev = platform_device_register_full(&pdevinfo);
>  		if (IS_ERR(pdev)) {
> -			gpio_mockup_err("error registering device");
> +			pr_err("error registering device");

You could add the missing newline at the same time.


