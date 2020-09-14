Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8B74268221
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 02:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgINAXV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Sep 2020 20:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgINAXT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Sep 2020 20:23:19 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6860FC061787
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2020 17:23:19 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id m7so14592481oie.0
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2020 17:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VeoJfvdwA2FpsLhIg2kbHQF8yQZUevay/v5sgOZqYSk=;
        b=U1ar6Lz4LGAwm7nCzAvcav4trYv3CWZkG+jipI280ytcgC+vCKwtSESLT5y2JE5gpb
         x8BVJX6Cp/wbw8lfjZJdFiZ9a5vxDLUTMZF2NQo+te3oIiLU6YFpY+s5RUpEhDMpfn7l
         maLty8pLPy8Lovrl8ZE8qkmdB+QXtnHJD/s+TxSXPOiPfFIqdyrLmncOHyKDsjFN7s4g
         TDH9rFZJg1S7k6CzSQnpJLxAILMQbfH3QjPnF0pO0V/wneHG1y1t5Qyohi/dQBwlcloo
         NxEgo17b/vaQUqwASdwuMDSKA9jcQCV1maw7/B2AJZKEBgHn6QZlqgrFRe/aBK4o9dvN
         MgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VeoJfvdwA2FpsLhIg2kbHQF8yQZUevay/v5sgOZqYSk=;
        b=LwW1MNtdcZHcNpNpIRXK0PdXa0TkzQmi/2uXbwE0RLwhXj0slHT1GFRBRti+BCiLLO
         7ZN3fAf8SSXYXCvqspbHJuhYy/9PZNSfXR3cxmnRSlrbiRX4TPGlJzPUua96UBAeF+vY
         2H0CYc/Z1rexVbsVkTpM7O7ozDfLUWf/efpJ7I5XP107IhzYB92vfxzvceDD3tAGF1ob
         AA6yvOoZ2k25n5yoSfxE3mLrqBLGDyoD3kSq7tMZufDwJUkFAG99KGwt+IS1i41OtdBa
         88hQLfanToxkZCSylE5gHVHPlar1At0TR8GCj/XV3l8m6awzbJjHtgi82gWVlvUL8RIl
         VN6Q==
X-Gm-Message-State: AOAM530JAtvMIdQ4VjAUX5F8pqFy9h+HE/XDzcxJFIWjYsSerPhzc1MI
        3DRLVfK/ORBVHz5TPXpmphZYgQ==
X-Google-Smtp-Source: ABdhPJxPV3Dt3UoF44oem4KmCTZCEOKVRj0m0gypveUeWHdLsXDcQ0+GBOsTfjG1QdN9VJbqBoP3Aw==
X-Received: by 2002:aca:4e84:: with SMTP id c126mr2252183oib.94.1600042998498;
        Sun, 13 Sep 2020 17:23:18 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id h24sm2206301otj.33.2020.09.13.17.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 17:23:17 -0700 (PDT)
Date:   Sun, 13 Sep 2020 19:23:14 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: sm8250: correct sdc2_clk and ngpios
Message-ID: <20200914002314.GZ3715@yoga>
References: <20200914001229.47290-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914001229.47290-1-dmitry.baryshkov@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun 13 Sep 19:12 CDT 2020, Dmitry Baryshkov wrote:

> Correct sdc2_clk pin definition (register offset) and ngpios (SM8250 has
> 180 GPIO pins).

The second half of the message is no longer relevant, and you only need
one of your s-o-b below.

Regards,
Bjorn

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 4e3ec9e407ad5058003309072b37111f7b8c900a
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
