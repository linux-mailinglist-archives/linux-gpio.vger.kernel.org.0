Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4CD48B0E8
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 16:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245121AbiAKPeS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 10:34:18 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:52628 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240480AbiAKPeR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jan 2022 10:34:17 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A6777B81B61
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 15:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5CF8C36AEB;
        Tue, 11 Jan 2022 15:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641915255;
        bh=8YEEKJFVfxZ84YjTI2jSz/Yz8gvZv4P4YbrKwT1xBCk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HamDLsSnjEyYn2X6ZyvPEc24qknTsSUlsZ+RR4R6lGLEeaTaUMYbFO67q44JSY1Eg
         IKtppDOuUyLwTriE8xqc9Ol5G3dfDJkLNJbAziR4s7Qb5lfF4Y4SDYjHoAkaX3yVGo
         GTGP6iGTMCPL95jfuAvPfxAMOy54IAp5RBkBDnhEqyU8ZVhXY9JrJk6+qs8heSFkea
         cvCq2vA/uttlNhi/XMAOp6lKCgOSGoPGVHgwUyrV2yKfrVfSITbJoyv535+Zit9uJn
         0uTrL/mZ43wgFLauzTCC0fwGQ+gm5IXCDapst8zkDvmDwLDDT0dPZnVTviwWa4FpuP
         3rONA+Qo/+9Lw==
Date:   Tue, 11 Jan 2022 08:34:09 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 4/4] pinctrl: add one more "const" for generic
 function groups
Message-ID: <Yd2jcfXqqKHK/NaG@archlinux-ax161>
References: <20211216162206.8027-1-zajec5@gmail.com>
 <20211216162206.8027-4-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211216162206.8027-4-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rafał,

On Thu, Dec 16, 2021 at 05:22:06PM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Generic code doesn't modify those strings and .get_function_groups
> callback has that extra "const" as well. This allows more flexibility in
> GENERIC_PINMUX_FUNCTIONS users.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  drivers/pinctrl/pinmux.c | 2 +-
>  drivers/pinctrl/pinmux.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> index 6cdbd9ccf2f0..f94d43b082d9 100644
> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -875,7 +875,7 @@ EXPORT_SYMBOL_GPL(pinmux_generic_get_function);
>   */
>  int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
>  				const char *name,
> -				const char **groups,
> +				const char * const *groups,
>  				const unsigned int num_groups,
>  				void *data)
>  {
> diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
> index 78c3a31be882..72fcf03eaa43 100644
> --- a/drivers/pinctrl/pinmux.h
> +++ b/drivers/pinctrl/pinmux.h
> @@ -129,7 +129,7 @@ static inline void pinmux_init_device_debugfs(struct dentry *devroot,
>   */
>  struct function_desc {
>  	const char *name;
> -	const char **group_names;
> +	const char * const *group_names;
>  	int num_group_names;
>  	void *data;
>  };
> @@ -150,7 +150,7 @@ struct function_desc *pinmux_generic_get_function(struct pinctrl_dev *pctldev,
>  
>  int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
>  				const char *name,
> -				const char **groups,
> +				const char * const *groups,
>  				unsigned const num_groups,
>  				void *data);
>  
> -- 
> 2.31.1
> 
> 

I have not seen this reported yet, even though it has been broken for a
couple of weeks now. I see the following error in -next:

$ make -skj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- allmodconfig drivers/pinctrl/pinctrl-thunderbay.o
drivers/pinctrl/pinctrl-thunderbay.c: In function ‘thunderbay_add_functions’:
drivers/pinctrl/pinctrl-thunderbay.c:815:29: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
  815 |                         grp = func->group_names;
      |                             ^
cc1: all warnings being treated as errors

Looks like something like the third patch of the series is needed for
the Thunderbay driver, which it appears was in development at the same
time as this series.

Cheers,
Nathan
