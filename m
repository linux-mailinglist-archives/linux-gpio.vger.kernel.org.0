Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4458F26894B
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 12:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgINKaI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 06:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgINKaD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 06:30:03 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FCA1C061788
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 03:30:02 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id y1so4873685pgk.8
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 03:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aV1NwayJ9g5Ich31O6EePYi9dUvdkGUF1VlXhnHhYCw=;
        b=Tulk7gRDG0oL9MYWLhfdDz/c8MRLXQLarTfG4raYD8kfPn9BFXl7C9E6YsaCSytyto
         f0QC6E79XoMggJNKTvbEk9l6I2zGozMPqBy4jHLVLHo89HqIPDX1cD82gG6Y7FZ9H4Lv
         EQL6JF9hGy8eYadiy8vpjX1zJ3/GlhHKZ/1zXmIc9rokfxACMBWH0Dpe3eos3S5cOgzB
         6VQcLzUtqyDRsqBBGRbyN85MlTC5Ja4aUcwNdvqbFVT+HJ6stynm4+R8Ha87zsL5QMRs
         hcIvdnCdOWUbNFg8BqCpYYYSgsj17Rt1LOOsW/hovAPGYbUGqTGIWYS/uaxAD7T4YfA8
         Wqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aV1NwayJ9g5Ich31O6EePYi9dUvdkGUF1VlXhnHhYCw=;
        b=FENf6LBMNtZNqpuZIWBL//+HOAxOIn5CSuXKvTQRO6/bEumd5AT8xPCKqdLRaEPb3h
         6aFl1j+j59hiuYr8S482HTqOOvWdXcUd/BpmSTIZwSbN2Rl+USWiu0mf/gC61SjEysly
         yzO++blYcXs2SdNjZk69UhE5HKPylQhprj5ULqzz4yPg8cvCMAdqOuPLPSg83/wbiRIF
         A05PhyiicczjPxDGGQeWL5w+uqA1fNxjA+4DogavPWoxT3rTH6f3gx7R3nmniKoMLrWP
         uz3Hbf1AJmaw5uP9S4G4t1UoytyLYrgVXY+sT/kM6eJUbWWuFr1QBs5GnNYZTbB2kxK5
         IsnQ==
X-Gm-Message-State: AOAM531A7UECor4Kdu3GACcJ8vVU8kZz42NTKJh4DCjOyHhmu+637i46
        u4akKJLfw8BP/NWHyngj2Duj
X-Google-Smtp-Source: ABdhPJzo1JgcREdbm0ZO59wVSR1fnUpuwnfNT1SOJf28S+H1jG7IlQsfi96MVWCKY7RREmLOWfGu6w==
X-Received: by 2002:a62:8349:: with SMTP id h70mr13313397pfe.47.1600079401814;
        Mon, 14 Sep 2020 03:30:01 -0700 (PDT)
Received: from mani-NUC7i5DNKE ([2409:4072:6d84:8e8a:d537:f870:596d:5afa])
        by smtp.gmail.com with ESMTPSA id f4sm9276526pfj.147.2020.09.14.03.29.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Sep 2020 03:30:01 -0700 (PDT)
Date:   Mon, 14 Sep 2020 15:59:56 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: qcom: sm8250: correct sdc2_clk
Message-ID: <20200914102956.GA19867@mani-NUC7i5DNKE>
References: <20200914091846.55204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914091846.55204-1-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 14, 2020 at 12:18:46PM +0300, Dmitry Baryshkov wrote:
> Correct sdc2_clk pin definition (register offset is wrong, verified by
> the msm-4.19 driver).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> Fixes: 4e3ec9e407ad5058003309072b37111f7b8c900a
> ---
>  drivers/pinctrl/qcom/pinctrl-sm8250.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
> index a660f1274b66..826df0d637ea 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
> @@ -1308,7 +1308,7 @@ static const struct msm_pingroup sm8250_groups[] = {
>  	[178] = PINGROUP(178, WEST, _, _, _, _, _, _, _, _, _),
>  	[179] = PINGROUP(179, WEST, _, _, _, _, _, _, _, _, _),
>  	[180] = UFS_RESET(ufs_reset, 0xb8000),
> -	[181] = SDC_PINGROUP(sdc2_clk, 0x7000, 14, 6),
> +	[181] = SDC_PINGROUP(sdc2_clk, 0xb7000, 14, 6),
>  	[182] = SDC_PINGROUP(sdc2_cmd, 0xb7000, 11, 3),
>  	[183] = SDC_PINGROUP(sdc2_data, 0xb7000, 9, 0),
>  };
> -- 
> 2.28.0
> 
