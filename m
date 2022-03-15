Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCB904DA09E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 17:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350349AbiCOQ6g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 12:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350330AbiCOQ6g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 12:58:36 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC1CB57B35
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 09:57:23 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id w20-20020a4ae9f4000000b003243aa2c71aso5022363ooc.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 09:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iwyi6l6mAU8+nYjyk/K7oCC0ixMS0VKyBpljmAjIxm0=;
        b=EtQQA78G9e7DaQ2Bpd2WTtbGypI1MZf7hjLWoX4nrzjd6fi5v2IY5SGEBlkou+L24u
         dKygIqkA9WrpD6R+7NPqxvFwCcj4UdOE7TTyRzItaiP0y6oT1apVV2M4KJp8KQpdetk3
         hLBaaAXh5cOaCm/33y2DLPrD/fjJ/192e1fLW94ZLEKRXgjmLUqPpCLFdFZK4aVd0avP
         YapIkT6wweXDRnGP3BijGy31W8uqrfbtJZYbqDhKU9pm4uArET+9mEJ9TBRC/4XbqyHo
         LUIO9AhepMFLbJx3Aqwe3dWbIm88glVW0mi97CRZ6nudgs9fJtmkJPljBeA+j4HBncJ5
         +FNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iwyi6l6mAU8+nYjyk/K7oCC0ixMS0VKyBpljmAjIxm0=;
        b=RDEhxLayomhEWgWPHNPb62SyxXbD3yxsz6vBhJD+pCrszQ2dp72dK+LNtBTulxQhv9
         wktbj69/Kobw6j8TGSo50vNzOQuRnoPgpw8ZdvA3y8ExninRgR+66ydQhfYv2qNyWwne
         Yxld+w3NaPuSWIocKPRnuBAu56sKUcBirSQKB5ffDPm//RYWuNzAL4e0My2hMdM0haDx
         65rWFmulZO5qZsgw4ykJLfCntssYHPyf9BRX+o11qy43snB75zNpsOHKdYhZs9vRC5BF
         9mbNQ64suMNyhShjQ1Rs6WXE3UFVDgS0OITi4XXzY9Ouf9hVMmBnqTVK9Haibg30ifur
         +xPA==
X-Gm-Message-State: AOAM531XgncTSrgcnJJ8aKli60IPKLTd45EvF0SeqVjMI2qN6v+xrysv
        lDqlv++byqbY9Wx+dl9s+y2Jbw==
X-Google-Smtp-Source: ABdhPJzzqNiHdVXVH0CXBoLP1udVE9MYmYPmQcCKBtA1PAprIUkgp+/UWSfjGSEtXdadUx3fdyEGxA==
X-Received: by 2002:a05:6871:60e:b0:da:b3f:2b85 with SMTP id w14-20020a056871060e00b000da0b3f2b85mr2048202oan.292.1647363443260;
        Tue, 15 Mar 2022 09:57:23 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id l12-20020a056808020c00b002da28c240dfsm9665261oie.16.2022.03.15.09.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 09:57:22 -0700 (PDT)
Date:   Tue, 15 Mar 2022 11:57:20 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v11 7/7] pinctrl: qcom: Update clock voting as optional
Message-ID: <YjDFcJOA8An58iTe@builder.lan>
References: <1647359413-31662-1-git-send-email-quic_srivasam@quicinc.com>
 <1647359413-31662-8-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1647359413-31662-8-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 15 Mar 10:50 CDT 2022, Srinivasa Rao Mandadapu wrote:

> Update bulk clock voting to optional voting as ADSP bypass platform doesn't
> need macro and decodec clocks, as these macro and dcodec GDSC switches are
> maintained as power domains and operated from lpass clock drivers.
> 

Sorry for missing your reply on my question on the previous version, I
think this sounds reasonable.

> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c        | 12 +++++++++---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.h        |  1 +
>  drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c |  1 +
>  3 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 0216ca1..3fc473a 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -401,9 +401,15 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
>  				     "Slew resource not provided\n");
>  
> -	ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Can't get clocks\n");
> +	if (data->is_clk_optional) {
> +		ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Can't get clocks\n");

Dug into the clk_bulk_get() functions, and __clk_bulk_get() will print
an error telling you which clock it failed to get. So I don't think your
more generic error here doesn't add any value.

Just return ret;

> +	} else {
> +		ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Can't get clocks\n");
> +	}

Depending on your taste, you could do:

	if (data->is_clk_optional)
		ret = devm_clk_bulk_get_optional();
	else
		ret = devm_clk_bulk_get();

	if (ret)
		return ret;

>  
>  	ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
>  	if (ret)
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
> index afbac2a..3bcede6 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
> @@ -77,6 +77,7 @@ struct lpi_pinctrl_variant_data {
>  	int ngroups;
>  	const struct lpi_function *functions;
>  	int nfunctions;
> +	int is_clk_optional;

bool here please.

>  };
>  
>  int lpi_pinctrl_probe(struct platform_device *pdev);
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> index d67ff25..304d8a2 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> @@ -142,6 +142,7 @@ static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
>  	.ngroups = ARRAY_SIZE(sc7280_groups),
>  	.functions = sc7280_functions,
>  	.nfunctions = ARRAY_SIZE(sc7280_functions),
> +	.is_clk_optional = 1,

true

Regards,
Bjorn

>  };
>  
>  static const struct of_device_id lpi_pinctrl_of_match[] = {
> -- 
> 2.7.4
> 
