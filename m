Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09E2F82A14
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 05:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730036AbfHFDmq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 23:42:46 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39406 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728892AbfHFDmq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 23:42:46 -0400
Received: by mail-pl1-f195.google.com with SMTP id b7so37310574pls.6
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 20:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GyYuYt1i9WaZ8yCH43JVWCp96Q/+Qm0jgwO0UVQVYIs=;
        b=OyBQEypiuCQvac5FyjGAX77gD8/Avj+XxwEX//E2nSdxoMtc7EFMRUUphfEwLEFnoG
         sq/4QcEsvf1mQcjecx45TrN+bf2AMyjhLtMKCZAszIMUgee2MEIFKqjCvi37Rjq9Ug57
         Oy4KPgPrPLi7nYd4zsNB0ruffzhRNwNvjeLidTsx+b4a5Vap7ueKYsxb6duFp4t2HWW4
         EdLtGLCmmiJ9K7n/65f6cvAzNNht94g8ye6z8eybM1+ezw7XWLWDWm9xG1fkef1gyOaO
         hGRp64Gp8fj96avZDJfn1NWbghMaLy1lqvZOcgazhfi1Sgwf/39R25++R+JY592vuUL1
         waMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GyYuYt1i9WaZ8yCH43JVWCp96Q/+Qm0jgwO0UVQVYIs=;
        b=ilcAfdKt+X1+SAomfIWVo/w49OKyzpsNjxTOSwZCXSYjOHMLZsKFwcqSijpxpIvkeF
         1dLkm8ra0z38ss+jqCmNmJaSXxe/4RB/Q3zy2dXkvWoAQJGAdozHDrdYjQ5nRmrJju8e
         v4G6XGI5XHU9llQV6TwrKsfm3Ps7iovSCfion4yp0FM5yKEIOaG08evC9R6zj1H6BXaS
         NBbrAPqD0v66UOiMH2y9hL2EVJh3mrXgY0gve3WgmD+gFIhk+tCGg164mJ4/C6RJK5/F
         Al0qGnxPksBCE51QK1+KOifGH6VYdi88Fl14vIOrytpLf7McZF3JD11AAmP7toUkNbWz
         l5cg==
X-Gm-Message-State: APjAAAU84zCT2/UsWVnhsxqFZ/ZewVU8tplaQLh07QsQI2Mloc17xRnp
        w+7CL5LEpHDZ+Hqg6cIPb+w0wvItBnw=
X-Google-Smtp-Source: APXvYqxoV+QNFxK1CxcdutLlR77u2tg+qbi8oydh1HNTQ8wuXUp3r07Qbcew/h4xMlPZTdNcoXH1cQ==
X-Received: by 2002:a17:902:4381:: with SMTP id j1mr1002780pld.4.1565062965267;
        Mon, 05 Aug 2019 20:42:45 -0700 (PDT)
Received: from localhost ([122.172.146.3])
        by smtp.gmail.com with ESMTPSA id a5sm18285778pjv.21.2019.08.05.20.42.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 20:42:43 -0700 (PDT)
Date:   Tue, 6 Aug 2019 09:12:41 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     vireshk@kernel.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: spear: spear: Add of_node_put() before return
Message-ID: <20190806034241.oqy53svdoyydgjli@vireshk-i7>
References: <20190804154948.4584-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190804154948.4584-1-nishkadg.linux@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04-08-19, 21:19, Nishka Dasgupta wrote:
> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the return in
> two places.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/pinctrl/spear/pinctrl-spear.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/spear/pinctrl-spear.c b/drivers/pinctrl/spear/pinctrl-spear.c
> index c4f850345dc4..7ec19c73f870 100644
> --- a/drivers/pinctrl/spear/pinctrl-spear.c
> +++ b/drivers/pinctrl/spear/pinctrl-spear.c
> @@ -157,12 +157,16 @@ static int spear_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	/* calculate number of maps required */
>  	for_each_child_of_node(np_config, np) {
>  		ret = of_property_read_string(np, "st,function", &function);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			of_node_put(np);
>  			return ret;
> +		}
>  
>  		ret = of_property_count_strings(np, "st,pins");
> -		if (ret < 0)
> +		if (ret < 0) {
> +			of_node_put(np);
>  			return ret;
> +		}
>  
>  		count += ret;
>  	}

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
