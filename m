Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B08F02681E2
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 01:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbgIMXo7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Sep 2020 19:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgIMXo6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Sep 2020 19:44:58 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125A6C061787
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2020 16:44:58 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id o6so13328155ota.2
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2020 16:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u+16orXS6eKgZdRPjtycA2QsQkZ9PgwDktyZbsANKf8=;
        b=rTLdml14/5EiD6qdDfI6t7Zk+ezQFMhmHq1xi6EA2zYZMZR7bQy4j5XRMoW9LvDQec
         s9NtdQquciVM95f+Hlx8xDMoE6NjT3mwkOHisWe+WiblVWTEtwNkJb8sJnm21eiMrS5p
         OskV8EFS2hSU6cspiwkyvj76+1m+grMWXiRidSGe2S0T6TYZ924ubxo0XidWRfKpxvmh
         i1/odYt3MUPp6ZkxQtiV94bJxavQkubdOzwrYiTar3zMkxe7X5Y43v0yIVj3J5roBhQM
         HyH2ro2qvPtg8y1bOwPUjX6EKnzaxYkPqKRtv0XyuLV54dZ04etw9+X/+7LB0fPHB8BL
         6PGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u+16orXS6eKgZdRPjtycA2QsQkZ9PgwDktyZbsANKf8=;
        b=axm43m8jAYKMfBa0DSxJWvy1qvNd2AwmlQ1N/8d9aNDY2E2QIxTwq/MicHTlIAtsGs
         cvjpKAJjjGQtU68fvDlWdvnh9lx+uXQdUho31hXk/7rdpnC0RtfuW6YlFzcmUAR3mdWu
         vDPQxbZmR+49IEnDXGa1PxFTECAraCuQ/Juoy2r2bz4gSGho8YHp9LyCS6zkncFk206s
         C7+tkZV3vmZcxusmYAnB9+PCjZQXOjYuMROnUqe17ww5moug6rayT5t4KDPTCy0zZ8tU
         7Tx0r+PtYcSsulnfikfcD1KKXZ7V1HugYenBuHfCQUTqQu6ahIfFSZ89DgshbzpkK6C9
         jipA==
X-Gm-Message-State: AOAM530tJLY5uBbz//eb6W4rljZ6H9e5Ux4GkqMTtpK9Wd8Ie9j/Bw0R
        U4LCsNmwWErAMyjIO2PqfMIYmg==
X-Google-Smtp-Source: ABdhPJxnOzAZekRVFxe4phKoGP3V3PhSYhIk4HBLNETlKFtMomrm65HV5IiTy6UKk2xyqle5C9rs9g==
X-Received: by 2002:a9d:71ca:: with SMTP id z10mr7583811otj.307.1600040695927;
        Sun, 13 Sep 2020 16:44:55 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id h24sm2159215otj.33.2020.09.13.16.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 16:44:55 -0700 (PDT)
Date:   Sun, 13 Sep 2020 18:44:52 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: sm8250: correct sdc2_clk and ngpios
Message-ID: <20200913234452.GX3715@yoga>
References: <20200913225005.30218-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200913225005.30218-1-dmitry.baryshkov@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun 13 Sep 17:50 CDT 2020, Dmitry Baryshkov wrote:

> Correct sdc2_clk pin definition (register offset) and ngpios (SM8250 has
> 180 GPIO pins).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 4e3ec9e407ad5058003309072b37111f7b8c900a
> ---
>  drivers/pinctrl/qcom/pinctrl-sm8250.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
> index a660f1274b66..4f7dae61b089 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
> @@ -1308,7 +1308,7 @@ static const struct msm_pingroup sm8250_groups[] = {
>  	[178] = PINGROUP(178, WEST, _, _, _, _, _, _, _, _, _),
>  	[179] = PINGROUP(179, WEST, _, _, _, _, _, _, _, _, _),
>  	[180] = UFS_RESET(ufs_reset, 0xb8000),
> -	[181] = SDC_PINGROUP(sdc2_clk, 0x7000, 14, 6),
> +	[181] = SDC_PINGROUP(sdc2_clk, 0xb7000, 14, 6),

You're right.

>  	[182] = SDC_PINGROUP(sdc2_cmd, 0xb7000, 11, 3),
>  	[183] = SDC_PINGROUP(sdc2_data, 0xb7000, 9, 0),
>  };
> @@ -1320,7 +1320,7 @@ static const struct msm_pinctrl_soc_data sm8250_pinctrl = {
>  	.nfunctions = ARRAY_SIZE(sm8250_functions),
>  	.groups = sm8250_groups,
>  	.ngroups = ARRAY_SIZE(sm8250_groups),
> -	.ngpios = 181,
> +	.ngpios = 180,

But, while it is correct that SM8250 only has 180 GPIOs, we're exposing
UFS_RESET as a gpio as well, so this should therefor be 181. Sorry for
the obfuscation here...

Regards,
Bjorn

>  	.tiles = sm8250_tiles,
>  	.ntiles = ARRAY_SIZE(sm8250_tiles),
>  };
> -- 
> 2.28.0
> 
