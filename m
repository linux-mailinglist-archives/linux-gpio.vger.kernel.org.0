Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 878A052883F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 May 2022 17:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244587AbiEPPP2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 May 2022 11:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244846AbiEPPPZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 May 2022 11:15:25 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8782B3BA7D
        for <linux-gpio@vger.kernel.org>; Mon, 16 May 2022 08:15:23 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id m15-20020a9d608f000000b00606a788887aso10243679otj.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 May 2022 08:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aqUacUDD/fnqySsoi3HdJFEi/V1mTy/VfQQMnGzRza8=;
        b=dmfC0zUnM3Da4eBmHuwkOrpuYP643Dic9NsM1QhvrqzZggtptHBQDGNxfy6PdTxadp
         0WuH6KV4+gkux/NZgj8EAnr7WeIeOjpQpaTch577VWirBI7CKJsjc/eySNgOlfbTA6+O
         vfF7AJ0JYNL8acPMBsHIbylCVcn8VAYVcqKGBCjy2bbjQSmniPC7FVH0oWqXWBc1CVE0
         2E58YZqxk95IMCcPfWaPL/21THyhS7lvMivfJsDimueM5vMX0Tu4E0bb5R7nXiAnqGMG
         +SxQubBfyUDFkhNrgmoHlz90Pp0twEahIdAUh4C3BiFtparP46Mxgj1X0+UU/1PsunOs
         nE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aqUacUDD/fnqySsoi3HdJFEi/V1mTy/VfQQMnGzRza8=;
        b=WzPS5YLOspA5QIhJ5GLiFtMMyCSvjveTWi9VY+GwVdKMKi4Idc5xR0jpH78I/W2L7w
         4UmfxPAI9Y0YoAUCYgRJ6/vmvrNbjyDKDDVvKZYF7T2eTEOYIuPOJjk46VPLouIZSIQY
         VsftIxI+GvH78v3MSVJLio8KmU1N0kvOV1Ns4a0yOT3vGQ7xZ1CewN7HWauSpS2dolQG
         VXDW4cF4qoZJTsGcg+/bce0fZCAoAtKGulQIOLOO+3iT/z9RGckzDBhhYOYnT0nepL0Y
         RRcKTO8PKPjjmcWThdqQ9fMuVA2MURYKD1tit6FTJVBoZxdfpDs54arIqI1tHZMOuAIZ
         lyLA==
X-Gm-Message-State: AOAM533Y0v1nFcdF+wve433O1qOXjv7S7SXzZatZhTla0d831SwB4GeU
        7fDW2SNXbSJj2WOKRxxsdPcYLw==
X-Google-Smtp-Source: ABdhPJyxCbBtqQzZ9IoSbuL6c4zNV6p71BzBhppEUqHbNuekH9OptVw3cYCBHP8hn3HJmDptoqnELA==
X-Received: by 2002:a9d:2f65:0:b0:609:a162:388d with SMTP id h92-20020a9d2f65000000b00609a162388dmr325956otb.331.1652714121253;
        Mon, 16 May 2022 08:15:21 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 23-20020a9d0317000000b006060322125asm4070722otv.42.2022.05.16.08.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 08:15:20 -0700 (PDT)
Date:   Mon, 16 May 2022 08:17:44 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: sc7280: Add lpi pinctrl variant data
 structure for adsp based targets
Message-ID: <YoJrGGg0RviVn2Xj@ripper>
References: <1651672580-18952-1-git-send-email-quic_srivasam@quicinc.com>
 <1651672580-18952-3-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1651672580-18952-3-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 04 May 06:56 PDT 2022, Srinivasa Rao Mandadapu wrote:

> Add compatible string and lpi pinctrl variant data structure for adsp enabled
> sc7280 platforms.

This says what the change does, but gives no clue to what this
compatible represents and why the clock is not optional.

Could you please describe here what scenario this compatible is to be
used for etc, so that when someone else adds support for the next
platform they can use the git history to understand which case to
follow.

Thanks,
Bjorn

> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> index 2add9a4..c9e85d9 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> @@ -134,6 +134,16 @@ static const struct lpi_function sc7280_functions[] = {
>  	LPI_FUNCTION(wsa_swr_data),
>  };
>  
> +static const struct lpi_pinctrl_variant_data sc7280_adsp_lpi_data = {
> +	.pins = sc7280_lpi_pins,
> +	.npins = ARRAY_SIZE(sc7280_lpi_pins),
> +	.groups = sc7280_groups,
> +	.ngroups = ARRAY_SIZE(sc7280_groups),
> +	.functions = sc7280_functions,
> +	.nfunctions = ARRAY_SIZE(sc7280_functions),
> +	.is_clk_optional = false,
> +};
> +
>  static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
>  	.pins = sc7280_lpi_pins,
>  	.npins = ARRAY_SIZE(sc7280_lpi_pins),
> @@ -149,6 +159,10 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>  	       .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
>  	       .data = &sc7280_lpi_data,
>  	},
> +	{
> +		.compatible = "qcom,sc7280-lpass-adsp-lpi-pinctrl",
> +		.data = &sc7280_adsp_lpi_data,
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
> -- 
> 2.7.4
> 
