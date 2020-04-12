Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63F961A5F24
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2020 16:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgDLO6U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 12 Apr 2020 10:58:20 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42418 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbgDLO6U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 12 Apr 2020 10:58:20 -0400
Received: by mail-pg1-f195.google.com with SMTP id g6so3377968pgs.9
        for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2020 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rTIEU+1p57JM86oUR8vky9xhTGUDdAwAfZ33tlMYcsg=;
        b=q9OvvwnOaWHDNLWYzu2LsXXiB4ftLPKQ2afugtXjVzh6NDksIIV6u7I2UwUBEspwwk
         n66W6vK7wDSjuQ7T/t+clqMQa7gUyJjgtCeKVK6PSViX96D/vYZwiuJ3CJd+kT/ruDkc
         mZBZSMe+bc6AwLI3rUovgNAbsdpVOXp1nB6tEfbETSkh926wHm1JGwzNBHLtu3c/T2Ku
         jTcJJb2TK8chEc/rTVM9jzXSwvGcKPwEROiWz0RKIgwJ+DvbNS/lCeSUzfueuH+aD206
         dEB4CbbklGKaSu4yJalOzoby644Oez02zYAcXcCaBAMOgQf01m5N3mbb94jFQECYaKgo
         Nc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rTIEU+1p57JM86oUR8vky9xhTGUDdAwAfZ33tlMYcsg=;
        b=i5Y/m4G15MkLxXou7baSfwjTTxGsYgb2hoQ9TjV9dusk8O24P8rAWUQ36OnwO/VpY+
         RX4yVJGSjyhEwF2eTIpfh2LDOmIlnzMIAAA3r0KkgU7Kv1Q4SY5KFAqLpsDiqVCGdQWA
         XDOqI6vCSnCjLATVSPtuXZiioByW5rTtEQgIqWzfLlv9/AeDHJMNXD7fxneMUPtTK9T8
         Yj2rGd28yZD/SOwhlxOLYfKqe4NVYqyhHUJpiKdYoLXUgaOnKS1KkWgU7iZ8ewLoH2SN
         PN7YRIlbdPCAwvOnghkXgzYuQrJkPeh5NHVGXJGJAU9/wrSaBR70fzoYswvWTiOIOMNT
         PoiQ==
X-Gm-Message-State: AGi0PuYSrH1LnlkhH1Jary2hB2a2TOJm/gbbv3mFWuol+LeXfIrzXmwZ
        a5ueiCw6rYE5rH5zKKeHZkh1
X-Google-Smtp-Source: APiQypJNdy9YTjk5GB9lpiOXNesua8+VB5uyx8Q7MdwmHOFPyFoR3/iQDjMrQg8yGNKsXVtGXmbpvA==
X-Received: by 2002:a63:5fc5:: with SMTP id t188mr12852920pgb.291.1586703500250;
        Sun, 12 Apr 2020 07:58:20 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:71d:af15:192:edd2:f211:80bc])
        by smtp.gmail.com with ESMTPSA id iq23sm6850656pjb.18.2020.04.12.07.58.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 07:58:19 -0700 (PDT)
Date:   Sun, 12 Apr 2020 20:28:12 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Amit Singh Tomar <amittomer25@gmail.com>
Cc:     andre.przywara@arm.com, matheus@castello.eng.br, afaerber@suse.de,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org
Subject: Re: [PATCH] pinctrl: actions:  fix function group name for i2c0_group
Message-ID: <20200412145812.GA14305@Mani-XPS-13-9360>
References: <1586702060-3769-1-git-send-email-amittomer25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586702060-3769-1-git-send-email-amittomer25@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Apr 12, 2020 at 08:04:20PM +0530, Amit Singh Tomar wrote:
> After commit 6f87359e8bcaf88381b9c9c038929e0e6872d308("pinctrl: actions: Fix
> functions groups names for S700 SoC") following error has been observed
> while booting Linux on Cubieboard7-lite(based on S700 SoC).
> 
> [    1.206245] pinctrl-s700 e01b0000.pinctrl: invalid group "i2c0_mfp" for function "i2c0"
> 
> This commit fixes it by using correct name for i2c0_group.
> 

Another one ;)

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> Fixes: 6f87359 ("pinctrl: actions: Fix functions groups names for S700 SoC")
> Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>
> ---
>  drivers/pinctrl/actions/pinctrl-s700.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/actions/pinctrl-s700.c b/drivers/pinctrl/actions/pinctrl-s700.c
> index 47a4ccd..f579a65 100644
> --- a/drivers/pinctrl/actions/pinctrl-s700.c
> +++ b/drivers/pinctrl/actions/pinctrl-s700.c
> @@ -1435,7 +1435,7 @@ static const char * const sd2_groups[] = {
>  static const char * const i2c0_groups[] = {
>  	"uart0_rx_mfp",
>  	"uart0_tx_mfp",
> -	"i2c0_mfp_mfp",
> +	"i2c0_mfp",
>  };
>  
>  static const char * const i2c1_groups[] = {
> -- 
> 2.7.4
> 
