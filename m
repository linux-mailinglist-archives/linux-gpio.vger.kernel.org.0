Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFB221F805
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 19:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728752AbgGNRSc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 13:18:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728532AbgGNRSc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2020 13:18:32 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D170C061755
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2020 10:18:32 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id i14so7842486pfu.13
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2020 10:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=2Bgo+EwlywQpFj0pE/Su+4bABsjD1sCVUR7hvl6xKBo=;
        b=FV23NmzIE04DIi8PhPUdryuuclb6dWf24zsJIveBqunEq3yjAFNoKc4vpw+PTmPF8R
         eMu1v6Lz0x9QKnUQdQIWGtu7CvPMqmJmUPAhpF2UjXnRVfSprk7A1DvW6FYJLbWwoIgc
         FC9Y+w942Q5uz6h/EqQls2Q4XVpMYwM6k4h5EOat8wRvJizYu3sK5oAIeEk8IR5rsE80
         5GFvYA4rsonni5Ibeohb9BUzsNOGm5bhZXDhmAp68Jw+TorW7AGhHrJkFISo/FhgPN87
         jc89oJ4Uf7Cw4rsaE5e/iIDwM4SkWoHSewGHxAy+hGLcL5U9TewXLj69im6rSAivgrxQ
         9OFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=2Bgo+EwlywQpFj0pE/Su+4bABsjD1sCVUR7hvl6xKBo=;
        b=bs+RV0y+mZME/vSma7AYVThcacCMyraw7m/lctLenLKc8yTxIHTsuDBak9zM1u92Cz
         mLijRPHW+i2YD4K9XV2+AOen5yXEoIFOToUS4ZL6JacSM1wyb83gPmajXwcdALiaRhf1
         NltpKhrwKoaXzahZW2X9FD9x/1bGy/fSjlpEWGdQu+3LFVWGQjgwPGGU0PEpI83PeEGL
         0ipIW1PIhyUEGSOJFtpJA7Y66ofgZWVbxEu+/NIl5BIvgT1OFroXUnlL/8J8l4R/tvp3
         v3YHwW8ypmxUPW89uYLtu9Z0A8+VhTeYcMRs3Yq030xk48BAR2IrmDJJDnP7FTrzPUBC
         Vuwg==
X-Gm-Message-State: AOAM531gIbuuJyYefWZ9dJludClIBCqm5b3DsUSqQtjfvnZ255Cr956p
        zuXBf5+vRXKOnlsNNA24nq8L
X-Google-Smtp-Source: ABdhPJyEqwY1nnJOTN22awXt+uGZJ7NHXl3YxP9b73/ZkOSKPCwl5Y+BHZbe5WvqX7p+q/Fs1C+S8A==
X-Received: by 2002:aa7:8557:: with SMTP id y23mr5117516pfn.148.1594747111587;
        Tue, 14 Jul 2020 10:18:31 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6d83:a4f:d:a14d:ca62:5c15])
        by smtp.gmail.com with ESMTPSA id y7sm3088884pjp.47.2020.07.14.10.18.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jul 2020 10:18:31 -0700 (PDT)
Date:   Tue, 14 Jul 2020 22:48:24 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        David Liu <liuwei@actions-semi.com>
Subject: Re: [PATCH 01/25] pinctrl: actions: pinctrl-owl: Supply missing
 'struct owl_pinctrl' attribute descriptions
Message-ID: <20200714171824.GB7260@Mani-XPS-13-9360>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-2-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200713144930.1034632-2-lee.jones@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 13, 2020 at 03:49:06PM +0100, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/pinctrl/actions/pinctrl-owl.c:52: warning: Function parameter or member 'clk' not described in 'owl_pinctrl'
>  drivers/pinctrl/actions/pinctrl-owl.c:52: warning: Function parameter or member 'irq_chip' not described in 'owl_pinctrl'
>  drivers/pinctrl/actions/pinctrl-owl.c:52: warning: Function parameter or member 'num_irq' not described in 'owl_pinctrl'
>  drivers/pinctrl/actions/pinctrl-owl.c:52: warning: Function parameter or member 'irq' not described in 'owl_pinctrl'
> 
> Cc: "Andreas Färber" <afaerber@suse.de>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: David Liu <liuwei@actions-semi.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/pinctrl/actions/pinctrl-owl.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
> index 5a0c8e87aa7cd..7efdfb4f3e9ba 100644
> --- a/drivers/pinctrl/actions/pinctrl-owl.c
> +++ b/drivers/pinctrl/actions/pinctrl-owl.c
> @@ -35,8 +35,12 @@
>   * @pctrldev: pinctrl handle
>   * @chip: gpio chip
>   * @lock: spinlock to protect registers
> + * @clk: clock control
>   * @soc: reference to soc_data
>   * @base: pinctrl register base address
> + * @irq_chip: IRQ chip information
> + * @num_irq: number of possible interrupts
> + * @irq: interrupt numbers
>   */
>  struct owl_pinctrl {
>  	struct device *dev;
> -- 
> 2.25.1
> 
