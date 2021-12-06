Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F74D468F32
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Dec 2021 03:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhLFChw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Dec 2021 21:37:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234437AbhLFChw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Dec 2021 21:37:52 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B4C7C0611F7
        for <linux-gpio@vger.kernel.org>; Sun,  5 Dec 2021 18:34:24 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id bf8so18850362oib.6
        for <linux-gpio@vger.kernel.org>; Sun, 05 Dec 2021 18:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TTlnq7Wgzp2iX6Ls4tQK0iYVNHZC93S+jeurCSfQZQg=;
        b=VfAmdIa7950nGp7sfvUgTx/o5m/K2ugSiyqUnlGAt7y3DjfeFETtbKV4biPq7ywvei
         xF4wi6g4qFXI2OGXFs1/jxnOMurxZ+YBy851oBsN4o/F8EANSHG7iCh38gtbS24QjbZy
         Nzy2IYEprxBE6EDy5RkFY7NkXf+ktsvCpSka8E93IYlrqc9Rk1O1d0Scua7R+cKL4AqY
         QLG8ZS6bn8aiYGObLtMn9siD6l92rWqVUTKb4yaMWSdUaf1sNiUGIEbvlwxiZBvT8gm9
         bGq3Wl2YdJ5eHYeelFhH9VBArjRCByGjzlSxboWtFb5QqYMgvSncbVsbVHvUMa1Aw+wS
         rV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TTlnq7Wgzp2iX6Ls4tQK0iYVNHZC93S+jeurCSfQZQg=;
        b=oYcYBuMaVxmfoQbZNssi21QPLRY0d6iW88whWUk4ejyJ39MC8LZMLNbJLZ+xafPMLu
         6nr2WLZJdiTt4dRdCVsTRrmFXNV2/qLpqXlbtDc490mplXE8DDge8BDPPGvJh3MZwi2u
         1029eMkNaqIRDDtt10pTLqL1OJ+LwX/kOmFPgMOuS3kCILprSTiXpzWj6XMoSHoTP+r7
         k+UksqU6j0SxvyBleUcicZ+elfsFnCfBVJrLiZjgrD/Teyn2caKf1EL5QkKHZwI9hn8g
         ddS3aUoW6ILSd0+RJRFsLcnG60TiPkRfSySB/pYXV9dzTuHa2w+aGwo0ZC8eAfKZ2zcd
         bTxA==
X-Gm-Message-State: AOAM532mr7CwjVGVTaptktQ7OtgzPPX63BF1dDbetaWq0THwJyEUn7SK
        oAS3UwJBp3ihzW0kyYOdeg/JrQ==
X-Google-Smtp-Source: ABdhPJw574NkW6bD77DqAw/lwQOC13BsjPT9cNCMD5G/pLKoQYLZV9vtlJVZ+99bghWUwhxrwg+WbA==
X-Received: by 2002:a05:6808:1116:: with SMTP id e22mr21315983oih.45.1638758063412;
        Sun, 05 Dec 2021 18:34:23 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p6sm1952823oof.0.2021.12.05.18.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 18:34:23 -0800 (PST)
Date:   Sun, 5 Dec 2021 18:35:50 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.com>
Cc:     agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: Re: [PATCH v4 4/5] pinctrl: qcom: Update clock voting as optional
Message-ID: <Ya13Bl66oS1hgHFd@ripper>
References: <1638531140-25899-1-git-send-email-srivasam@codeaurora.com>
 <1638531140-25899-5-git-send-email-srivasam@codeaurora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1638531140-25899-5-git-send-email-srivasam@codeaurora.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri 03 Dec 03:32 PST 2021, Srinivasa Rao Mandadapu wrote:

> From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> 
> Update bulk clock voting to optional voting as ADSP bypass platform doesn't
> need macro and decodec clocks, these are maintained as power domains and
> operated from lpass audio core cc.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index bcc12f6..c2a1110 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -394,7 +394,7 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
>  				     "Slew resource not provided\n");
>  
> -	ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
> +	ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);

If some platforms requires this clock and others doesn't have one, then
please make this statement conditional on the compatible, rather than
making it optional on both.

Thanks,
Bjorn

>  	if (ret)
>  		return dev_err_probe(dev, ret, "Can't get clocks\n");
>  
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
