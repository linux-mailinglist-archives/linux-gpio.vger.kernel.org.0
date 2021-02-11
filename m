Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7EB3185C2
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 08:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhBKHhh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 02:37:37 -0500
Received: from smtprelay0190.hostedemail.com ([216.40.44.190]:36094 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229674AbhBKHhe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Feb 2021 02:37:34 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 9C69A18224D6A;
        Thu, 11 Feb 2021 07:36:42 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1381:1431:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:1801:2393:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3865:3867:3868:3870:3871:3873:4321:4605:5007:6119:6737:7514:7652:7903:10004:10400:10848:11026:11232:11658:11914:12043:12048:12296:12297:12438:12555:12740:12895:13019:13439:13894:14093:14096:14097:14181:14659:14721:21080:21433:21611:21627:21939:21990:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: cough69_3f08c9527616
X-Filterd-Recvd-Size: 3608
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf06.hostedemail.com (Postfix) with ESMTPA;
        Thu, 11 Feb 2021 07:36:40 +0000 (UTC)
Message-ID: <408ca31f3f43f4db40998f607f582aeb0ffbab1e.camel@perches.com>
Subject: Re: [PATCH v4 1/2] pinctrl: use to octal permissions for debugfs
 files
From:   Joe Perches <joe@perches.com>
To:     Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Date:   Wed, 10 Feb 2021 23:36:39 -0800
In-Reply-To: <20210210222851.232374-2-drew@beagleboard.org>
References: <20210210222851.232374-1-drew@beagleboard.org>
         <20210210222851.232374-2-drew@beagleboard.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2021-02-10 at 14:28 -0800, Drew Fustini wrote:
> Switch over pinctrl debugfs files to use octal permissions as they are
> preferred over symbolic permissions. Refer to commit f90774e1fd27
> ("checkpatch: look for symbolic permissions and suggest octal instead").
> 
> Note: S_IFREG flag is added to the mode by __debugfs_create_file()
> in fs/debugfs/inode.c
> 
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  drivers/pinctrl/core.c    | 6 +++---
>  drivers/pinctrl/pinconf.c | 4 ++--
>  drivers/pinctrl/pinmux.c  | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 3663d87f51a0..02f8710afb9c 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -1914,11 +1914,11 @@ static void pinctrl_init_debugfs(void)
>  		return;
>  	}
>  
> 
> -	debugfs_create_file("pinctrl-devices", S_IFREG | S_IRUGO,
> +	debugfs_create_file("pinctrl-devices", 0444,
>  			    debugfs_root, NULL, &pinctrl_devices_fops);
> -	debugfs_create_file("pinctrl-maps", S_IFREG | S_IRUGO,
> +	debugfs_create_file("pinctrl-maps", 0444,
>  			    debugfs_root, NULL, &pinctrl_maps_fops);
> -	debugfs_create_file("pinctrl-handles", S_IFREG | S_IRUGO,
> +	debugfs_create_file("pinctrl-handles", 0444,
>  			    debugfs_root, NULL, &pinctrl_fops);
>  }

Why aren't you also converting this block in the same file?

@@ -1890,11 +1890,11 @@ static void pinctrl_init_device_debugfs(struct pinctrl_dev *pctldev)
                        dev_name(pctldev->dev));
                return;
        }
-       debugfs_create_file("pins", S_IFREG | S_IRUGO,
+       debugfs_create_file("pins", S_IFREG | 0444,
                            device_root, pctldev, &pinctrl_pins_fops);
-       debugfs_create_file("pingroups", S_IFREG | S_IRUGO,
+       debugfs_create_file("pingroups", S_IFREG | 0444,
                            device_root, pctldev, &pinctrl_groups_fops);
-       debugfs_create_file("gpio-ranges", S_IFREG | S_IRUGO,
+       debugfs_create_file("gpio-ranges", S_IFREG | 0444,
                            device_root, pctldev, &pinctrl_gpioranges_fops);
        if (pctldev->desc->pmxops)
                pinmux_init_device_debugfs(device_root, pctldev);



