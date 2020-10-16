Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B06D3290D46
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 23:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391310AbgJPV2f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 17:28:35 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:38486 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390460AbgJPV2e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2020 17:28:34 -0400
X-Greylist: delayed 526 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Oct 2020 17:28:33 EDT
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 428CE8062D;
        Fri, 16 Oct 2020 23:19:45 +0200 (CEST)
Date:   Fri, 16 Oct 2020 23:19:43 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH -next] omapfb: connector-hdmi: simplify the return
 expression of hdmic_connect
Message-ID: <20201016211943.GG1496366@ravnborg.org>
References: <20200921131051.92661-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921131051.92661-1-miaoqinglang@huawei.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=e5mUnYsNAAAA:8
        a=no2T8IuB39rNVZpCtwQA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Qinglang Miao

On Mon, Sep 21, 2020 at 09:10:51PM +0800, Qinglang Miao wrote:
> Simplify the return expression.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

I dropped the changes to gpio-cs5535.c when I applied this patch to
drm-misc-next. It looks like an accident that it was included here.

	Sam

> ---
>  drivers/gpio/gpio-cs5535.c                                 | 6 +-----
>  drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c | 7 +------
>  2 files changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-cs5535.c b/drivers/gpio/gpio-cs5535.c
> index 53b24e3ae..57b9ddffd 100644
> --- a/drivers/gpio/gpio-cs5535.c
> +++ b/drivers/gpio/gpio-cs5535.c
> @@ -345,12 +345,8 @@ static int cs5535_gpio_probe(struct platform_device *pdev)
>  				mask_orig, mask);
>  
>  	/* finally, register with the generic GPIO API */
> -	err = devm_gpiochip_add_data(&pdev->dev, &cs5535_gpio_chip.chip,
> +	return devm_gpiochip_add_data(&pdev->dev, &cs5535_gpio_chip.chip,
>  				     &cs5535_gpio_chip);
> -	if (err)
> -		return err;
> -
> -	return 0;
>  }
>  
>  static struct platform_driver cs5535_gpio_driver = {
> diff --git a/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c b/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
> index 49551afbd..670b9c6eb 100644
> --- a/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
> +++ b/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
> @@ -50,18 +50,13 @@ static int hdmic_connect(struct omap_dss_device *dssdev)
>  {
>  	struct panel_drv_data *ddata = to_panel_data(dssdev);
>  	struct omap_dss_device *in = ddata->in;
> -	int r;
>  
>  	dev_dbg(ddata->dev, "connect\n");
>  
>  	if (omapdss_device_is_connected(dssdev))
>  		return 0;
>  
> -	r = in->ops.hdmi->connect(in, dssdev);
> -	if (r)
> -		return r;
> -
> -	return 0;
> +	return in->ops.hdmi->connect(in, dssdev);
>  }
>  
>  static void hdmic_disconnect(struct omap_dss_device *dssdev)
> -- 
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
