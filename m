Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D054732289A
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Feb 2021 11:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232457AbhBWKKF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Feb 2021 05:10:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhBWKIv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Feb 2021 05:08:51 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AFA2C061574
        for <linux-gpio@vger.kernel.org>; Tue, 23 Feb 2021 02:08:11 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id j6so6562356eja.12
        for <linux-gpio@vger.kernel.org>; Tue, 23 Feb 2021 02:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ROyuuue68J3fLDExdnLzPZi5sO6o6bjOhvo+3Bf4zzA=;
        b=SpdAy61NGEOL3U3BiDXcHcGiE6m98ALFU9VrnL3SytXSVkLWlCc526JADgIR094cDO
         1r7DmCvBceTl3YROgT3kFMPLHsBJe/eyGHbGLvf6RGEpC+Bqfz4/FasCFG4oN5zaYZlT
         xwY2L2jidKSGT4IlMkoTZK4Mlpb8DcbyehV4gpjmid6dhjzHUQ+FCYnHn/MgrIgaGtST
         n6W60JWghn37Lpu0upjreXDZAvXQrGKoAO+kkN1BCzOOibXUzSn7hSlGsXg5exOgivJ4
         YHRaHzJfqIpHd4SwfhAg/KI1PVw23JgRo0qeSnjfx2zTjDVtrsaxK503jbZuGm70ckyu
         VKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ROyuuue68J3fLDExdnLzPZi5sO6o6bjOhvo+3Bf4zzA=;
        b=QPkAvGRbdQivUU7rwuT9kY7fQ8NDeV/PUriiTZ+S7FT5wwjsfGB3TPsK7c7jfBZNte
         Krlq5Gvjr5fqS4uyl9oy83YS3c8fFhaSkYWr7FqZ0KPHH0t+zVTUORanZukA1cZgnP8+
         US37zvw/aFv3A0AeZFBgQ1tZzf98p0n2BEpI7Omuo8k04PxMfRhMA98BOeBGScXh1X3R
         F7zQe9qEzD1qwcfooCQFzc+98/5SLPLsa48MAm3MSz1si7O57o6N2DpnJaSeYqL1J4zn
         T6vY1HXOmPeD7KaZS4y6vgi+qvIrx8+OZasIQ594MlJzIjKTVvTzs1VSmd3iNFtRYWmj
         suuw==
X-Gm-Message-State: AOAM533anHTwRRafJ3lLj+IgdoVU9kRKPMvLE8xCQRZ1OLgftAuwiNNK
        ZwWJ4QZw84EEGbx7+hJByqg=
X-Google-Smtp-Source: ABdhPJza/DR3mOZaLgwzC5Y9tWRDVAjF6MH1sIflJbClHHEDe5fut02toOIu/RGBwrnoE2LUdwRD+g==
X-Received: by 2002:a17:906:34c3:: with SMTP id h3mr25264946ejb.132.1614074890245;
        Tue, 23 Feb 2021 02:08:10 -0800 (PST)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id i7sm283406edq.87.2021.02.23.02.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 02:08:09 -0800 (PST)
Subject: Re: [PATCH] pinctrl: rockchip: add support for rk3568
To:     Jianqun Xu <jay.xu@rock-chips.com>, linus.walleij@linaro.org,
        heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20210223072419.123308-1-jay.xu@rock-chips.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <9a725c5c-b5c8-0ac9-738e-ad89f1188345@gmail.com>
Date:   Tue, 23 Feb 2021 11:08:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20210223072419.123308-1-jay.xu@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jianqun,

Before a new compatible string is used in your code it must be added to
the documentation with a separate patch to rockchip,pinctrl.txt .

To get a ack-by you must include:

robh+dt@kernel.org
devicetree@vger.kernel.org

Your patch should show up here after filtering:
https://patchwork.ozlabs.org/project/devicetree-bindings/list/

./scripts/checkpatch.pl --strict
0001-pinctrl-rockchip-add-support-for-rk3568.patch

WARNING: DT compatible string "rockchip,rk3568-pinctrl" appears
un-documented -- check ./Documentation/devicetree/bindings/
#424: FILE: drivers/pinctrl/pinctrl-rockchip.c:4547:
+	{ .compatible = "rockchip,rk3568-pinctrl",

On 2/23/21 8:24 AM, Jianqun Xu wrote:
> RK3568 SoCs have 5 gpio controllers, each gpio has 32 pins. GPIO supports
> set iomux, pull, drive strength, schmitt and slew rate.
> 
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---

[..]

>  static const struct of_device_id rockchip_pinctrl_dt_match[] = {
>  	{ .compatible = "rockchip,px30-pinctrl",
>  		.data = &px30_pin_ctrl },
> @@ -4239,6 +4544,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
>  		.data = &rk3368_pin_ctrl },
>  	{ .compatible = "rockchip,rk3399-pinctrl",
>  		.data = &rk3399_pin_ctrl },
> +	{ .compatible = "rockchip,rk3568-pinctrl",
> +		.data = &rk3568_pin_ctrl },
>  	{},
>  };
>  
> 

