Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1191418C9
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jan 2020 18:35:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgARRfo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Jan 2020 12:35:44 -0500
Received: from smtprelay0130.hostedemail.com ([216.40.44.130]:34088 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726614AbgARRfo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 18 Jan 2020 12:35:44 -0500
X-Greylist: delayed 316 seconds by postgrey-1.27 at vger.kernel.org; Sat, 18 Jan 2020 12:35:43 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 775DF180036EF
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jan 2020 17:30:28 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id AEB62182CED5B;
        Sat, 18 Jan 2020 17:30:26 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::,RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3872:3874:4321:5007:7514:7576:10004:10400:10848:11026:11232:11658:11914:12043:12296:12297:12438:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:21080:21451:21627:21990:30054:30070:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: uncle83_5b0aae334862c
X-Filterd-Recvd-Size: 1758
Received: from XPS-9350.home (unknown [47.151.135.224])
        (Authenticated sender: joe@perches.com)
        by omf15.hostedemail.com (Postfix) with ESMTPA;
        Sat, 18 Jan 2020 17:30:25 +0000 (UTC)
Message-ID: <d7010f3bc07d2666e6bbde3140d51acd539cb55b.camel@perches.com>
Subject: Re: [PATCH 4/4] GPIO: creg-snps: fixed a typo
From:   Joe Perches <joe@perches.com>
To:     sachin agarwal <asachin591@gmail.com>, Eugeniy.Paltsev@synopsys.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Sat, 18 Jan 2020 09:29:26 -0800
In-Reply-To: <20200118104506.68524-1-sachinagarwal@sachins-MacBook-2.local>
References: <20200118104506.68524-1-sachinagarwal@sachins-MacBook-2.local>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 2020-01-18 at 16:15 +0530, sachin agarwal wrote:
> From: Sachin agarwal <asachin591@gmail.com>
> 
> we had written "valiue" rather than "value".
[]
> diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
[]
> @@ -64,11 +64,11 @@ static int creg_gpio_validate_pg(struct device *dev, struct creg_gpio *hcg,
>  	if (layout->bit_per_gpio[i] < 1 || layout->bit_per_gpio[i] > 8)
>  		return -EINVAL;
>  
> -	/* Check that on valiue fits it's placeholder */
> +	/* Check that on value fits it's placeholder */

Might as well fix the it's/its usages too.

>  	if (GENMASK(31, layout->bit_per_gpio[i]) & layout->on[i])
>  		return -EINVAL;
> 
> -	/* Check that off valiue fits it's placeholder */
> +	/* Check that off value fits it's placeholder */
>  	if (GENMASK(31, layout->bit_per_gpio[i]) & layout->off[i])
>  		return -EINVAL;
>  

