Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A277A21F801
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 19:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbgGNRRt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 13:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbgGNRRt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2020 13:17:49 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02092C061794
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2020 10:17:49 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id p1so7295080pls.4
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2020 10:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hnEFouxs+we3yCbXczH8V8BowgDMhEQabzvQ7VTQSUs=;
        b=fGc8yYLs91rKUbePsXS8Omz/SMuyt3n7nXMuiwyo9zE3Ttv+pAC1IlQwkpIya38CCW
         HByWzm4683r8rMc8n+GzW4h2LZ8swZqnWuNU6Ybv9BdUQs6ZFacZYFwf0rdGOTIuJyfd
         9UTCtvrp4sFnv+ZLM40jX5XQe3WKr52/JZtxUzR7QDuLglqIJADP62Fftgh7oNEOfLka
         sDNtNXfPLX026CAeZ6mevAW3L0KtJN4i9DI66mI7vesoVIZHooLFuiVAIvFUo7K3F5gE
         t/YCDb/zIDIigaun2Mac91nNtYR5wATCIGbXxBdKSsu29Upd/6MxQmcs0WfbuHzOloFr
         V85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hnEFouxs+we3yCbXczH8V8BowgDMhEQabzvQ7VTQSUs=;
        b=AZNR5ZzhIkO29xBpCZVUHVfcp5CbijahVHCfcjRfjVDDTvUk4ldnupM1BJXn/8GU+R
         VGVoeC8lETnlT0UJamiD4QILlO5w74fMyHm9X0ozabeBGEBBXvhrhlvM05glNVLRmTCT
         LXC1XtZiHCRzdBdhcG2p5J+JaEIuJaQmjCW/wjNSjPAHGvDVW5/kSO+bX8YiUSK1zW21
         lT0y4f/xC0FSZVVc5NX4lHhQt+FlRY6ghJBXrw75+hn801OUJ0RzooM7WtFvKcQTS13U
         jYBdJEwWwVsmD2AxFzt32YyqKUT9703CEFnWxCjTC5VnuXQfYd7MAN3KEaFMGz5BIKjd
         WyXw==
X-Gm-Message-State: AOAM532VqvQkIuDwMgnzez4QjKhQyypSeT9vu6TKfS90rRWr1EfdlXIm
        G6MF501Ul/E6eHvkzIIGvtM68ihMT3Re
X-Google-Smtp-Source: ABdhPJwp8WPJacRREeYurMSXd2PZPgxhOF/urNM0WAhQhjFkuxyGfC5yfSDtHEpTWWQOC95UvhFyEA==
X-Received: by 2002:a17:902:7e01:: with SMTP id b1mr4839837plm.310.1594747068418;
        Tue, 14 Jul 2020 10:17:48 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6d83:a4f:d:a14d:ca62:5c15])
        by smtp.gmail.com with ESMTPSA id c27sm17191410pfj.163.2020.07.14.10.17.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jul 2020 10:17:47 -0700 (PDT)
Date:   Tue, 14 Jul 2020 22:47:42 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 18/25] pinctrl: pinctrl-bm1880: Rename ill documented
 struct attribute entries
Message-ID: <20200714171742.GA7260@Mani-XPS-13-9360>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-19-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713144930.1034632-19-lee.jones@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 13, 2020 at 03:49:23PM +0100, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/pinctrl/pinctrl-bm1880.c:40: warning: Function parameter or member 'pctrldev' not described in 'bm1880_pinctrl'
>  drivers/pinctrl/pinctrl-bm1880.c:40: warning: Function parameter or member 'pinconf' not described in 'bm1880_pinctrl'
> 
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/pinctrl/pinctrl-bm1880.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-bm1880.c b/drivers/pinctrl/pinctrl-bm1880.c
> index d1a7d98367870..a8e267237435f 100644
> --- a/drivers/pinctrl/pinctrl-bm1880.c
> +++ b/drivers/pinctrl/pinctrl-bm1880.c
> @@ -22,12 +22,12 @@
>  /**
>   * struct bm1880_pinctrl - driver data
>   * @base:	Pinctrl base address
> - * @pctrl:	Pinctrl device
> + * @pctrldev:	Pinctrl device
>   * @groups:	Pingroups
>   * @ngroups:	Number of @groups
>   * @funcs:	Pinmux functions
>   * @nfuncs:	Number of @funcs
> - * @pconf:	Pinconf data
> + * @pinconf:	Pinconf data
>   */
>  struct bm1880_pinctrl {
>  	void __iomem *base;
> -- 
> 2.25.1
> 
