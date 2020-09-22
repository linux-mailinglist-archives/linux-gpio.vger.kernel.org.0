Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 383E1274310
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 15:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgIVNaw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Sep 2020 09:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgIVNau (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Sep 2020 09:30:50 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AEEBC0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2020 06:30:48 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id mm21so1492694pjb.4
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2020 06:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1GHsfdPCR77ri55Z/gkRdzdu2BS26mtnO9jUw29WWuE=;
        b=PYf/fhqfKIr6N01I/QicRO2GByFEnNq9jt9OCDmvovRoGtA21PFmvL1UrQDXIaLlGc
         OPfYG/GNe7vdUQoRz0jksfygEUI9Y/h1ES0m4BbqBXMDQZLEDpUsrGlR6ZlHWXz5ZTHi
         LYd08Bz20EFeN7KakVAJq7NCP4lJtYWTUBr/nAgViUZP4zcM//wBoJvwrv27kx+pk/MJ
         95SDelKum1aG4OtwmRNWOaIRarAYQZDQPDkrH4KToFNIn/IKZQc6o4BYcFrmmwevyDIV
         r3qcMBBGkGodo9hLt5arLKbHW0jFcW8lj702BpEnsH9Ij1X0FzccPgIjJ7Z7SDtABfu7
         Vm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1GHsfdPCR77ri55Z/gkRdzdu2BS26mtnO9jUw29WWuE=;
        b=FHZFJ9atz32AwcS10Y6xi6/2YaNIBdCHOyWCdZX72CiJa18FdDtPEQtHoPSl8d23w9
         Cno1T3GDFvtvx8Uygu8Qfslya0XYXH8ZF3iFrrHvrglBmXk8+4xypJwtSeEGJnwvAFhu
         uhyejQF3e7HZqzgtzh9WPU79QvD9ST5j/VWAGzRlMotAxqzH/g9MSdfjc5fd5RvqdGPl
         KmOLxBsdCA6IKfpi512SUXFohy2Glx6sh2674usTuDez0QuQgaFiGKpzpIAYtKfSt5ih
         Yd4bX1QxyY63dBFdPdbp3CM2mhGsBRhn29if1lcoB16BITTcbQYE2kEpIkbZnxwIbHUr
         SvnQ==
X-Gm-Message-State: AOAM531JJ77ILJvNZya31Nf9wXzuPI4gQc/jAyjILA4f3j6+G1e7hXCN
        EQw3zRq9wgHatEztxE43Axc7Uw==
X-Google-Smtp-Source: ABdhPJzGpdDqF3aGCyYvVXJBfOFTTLMhvvAsovlgQEUN+xFaLn/zEmPC0jrtohf9XFdx+z/wp3wonA==
X-Received: by 2002:a17:90a:6903:: with SMTP id r3mr3607219pjj.169.1600781447856;
        Tue, 22 Sep 2020 06:30:47 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id ep4sm2480648pjb.39.2020.09.22.06.30.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Sep 2020 06:30:47 -0700 (PDT)
Date:   Tue, 22 Sep 2020 19:00:37 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] pinctrl: spear: simplify the return expression of
 tvc_connect()
Message-ID: <20200922133037.cehknuxert4hdsaw@vireshk-i7>
References: <20200921131058.92941-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921131058.92941-1-miaoqinglang@huawei.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21-09-20, 21:10, Qinglang Miao wrote:
> Simplify the return expression.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>  drivers/pinctrl/spear/pinctrl-spear320.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/spear/pinctrl-spear320.c b/drivers/pinctrl/spear/pinctrl-spear320.c
> index 99c10fc3d..e629e3035 100644
> --- a/drivers/pinctrl/spear/pinctrl-spear320.c
> +++ b/drivers/pinctrl/spear/pinctrl-spear320.c
> @@ -3418,8 +3418,6 @@ static const struct of_device_id spear320_pinctrl_of_match[] = {
>  
>  static int spear320_pinctrl_probe(struct platform_device *pdev)
>  {
> -	int ret;
> -
>  	spear3xx_machdata.groups = spear320_pingroups;
>  	spear3xx_machdata.ngroups = ARRAY_SIZE(spear320_pingroups);
>  	spear3xx_machdata.functions = spear320_functions;
> @@ -3433,11 +3431,7 @@ static int spear320_pinctrl_probe(struct platform_device *pdev)
>  	pmx_init_gpio_pingroup_addr(spear3xx_machdata.gpio_pingroups,
>  			spear3xx_machdata.ngpio_pingroups, PMX_CONFIG_REG);
>  
> -	ret = spear_pinctrl_probe(pdev, &spear3xx_machdata);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return spear_pinctrl_probe(pdev, &spear3xx_machdata);
>  }
>  
>  static struct platform_driver spear320_pinctrl_driver = {

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
