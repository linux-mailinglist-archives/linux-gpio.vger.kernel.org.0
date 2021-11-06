Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BCCC446CEF
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Nov 2021 08:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233861AbhKFHxN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Nov 2021 03:53:13 -0400
Received: from smtprelay0228.hostedemail.com ([216.40.44.228]:42724 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231998AbhKFHxK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 Nov 2021 03:53:10 -0400
Received: from omf12.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id B860018223268;
        Sat,  6 Nov 2021 07:50:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id EA9E7240237;
        Sat,  6 Nov 2021 07:50:24 +0000 (UTC)
Message-ID: <4b3f1ee1179dd6d4b010cb110b38d26e7d91c19f.camel@perches.com>
Subject: Re: [PATCH v1 14/19] pinctrl: st: Use temporary variable for struct
 device
From:   Joe Perches <joe@perches.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Andy Shevchenko <andy@kernel.org>
Date:   Sat, 06 Nov 2021 00:50:23 -0700
In-Reply-To: <20211105124242.27288-14-andriy.shevchenko@linux.intel.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
         <20211105124242.27288-14-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.60
X-Stat-Signature: jap6txt4towx51bf66y6cdqwxohz91c7
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: EA9E7240237
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+6DUZa/TtJProF7+rBll2LVmF0I4FX6+w=
X-HE-Tag: 1636185024-57322
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 2021-11-05 at 14:42 +0200, Andy Shevchenko wrote:
> Use temporary variable for struct device to make code neater.
[]
> diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
[]
> @@ -814,26 +814,25 @@ static int st_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
>  {
>  	struct st_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
>  	const struct st_pctl_group *grp;
> +	struct device *dev = info->dev;
[]
> -	new_map = devm_kcalloc(pctldev->dev,
> -				map_num, sizeof(*new_map), GFP_KERNEL);
> +	new_map = devm_kcalloc(dev, map_num, sizeof(*new_map), GFP_KERNEL);

Are pctldev->dev and dev the same pointer?
It seems they are not.
Why reassign the ownership?


