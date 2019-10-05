Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9483CC7D7
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 06:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbfJEE0D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 00:26:03 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46039 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbfJEE0D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 00:26:03 -0400
Received: by mail-pl1-f194.google.com with SMTP id u12so4054040pls.12
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 21:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sobyjg0LEWIOIfIDQwzBofiEnYt7JRmx1Uywz+kzECU=;
        b=HbataOo9Vzbos1Rzc5V4Jdnssaz2Tm5fWWPqo3+rBucM98zghiPOgJoq007pYW+8vP
         z7SK4M1yFjTiCfeU2fLeLnXseq8YWpN6Cf86+fVvrCvEDgrPgHaf6055Ez4w/zyckdkO
         vn3eEQ8xWyOLahS00qtxBFfICguIRpsjjWkd9ldEHWEwIAwVG0ED9yqGrNnV7jATYqgh
         ZvjIPQ2i3neXL8x/X/DD9CeNJzJYKPGLQtA3Dj2+7slh7n71eG1zXiQz4VrrNOJSqOJk
         fwu62gJt2l12pBQLgCCGVLIbcH2GKlQyXfjxaru/sWGFvpob+tiwz1Ebw0EkLQHwyrpc
         8uAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sobyjg0LEWIOIfIDQwzBofiEnYt7JRmx1Uywz+kzECU=;
        b=mPrlsz8lJH0hBOoclfKseNfbgF8V3U08P2mmNz+yrLhHOG0fl8bH80YCBFGBqr3IPc
         HLP6UUzh+dzsOoLINsy+cZeExuit/8d0w9Xad2HZmnC4x38Smpwl5rARRyO9hxbdhqpm
         yPIpQfpoT9h+ME1JJleAlt3OX7yXJmMH9+4+6AdPyhged6qdYlQv1VNxPwrneLTOZA1O
         z2MVK1zN0iEUkJ7sODoD7LHchxVaZnnt5sd9T3S53ZmhGqSzDEtLGDpotMF/H6GzksOa
         6sVz8EoH1mT8t3r4ugreW6s7uGmAFhDcCulazMPlYwCzHAlpRnfOL5KlWktwpAmdRyJ6
         4GTQ==
X-Gm-Message-State: APjAAAVBIbcwMkB8ddA3OhrKT2cvDnqDjnu+Lced5fJDCp3lCp65EW0E
        p8DnwSDWquJIU5MR2XI1CA2YaERVal8=
X-Google-Smtp-Source: APXvYqz571X26hj2dwQYjnk6tgNF45rgLRkLOWL6qR1fqXkZZdrrGWB/YGdfU4UeE1x0sNaT75iReQ==
X-Received: by 2002:a17:902:b08b:: with SMTP id p11mr19061907plr.320.1570249562546;
        Fri, 04 Oct 2019 21:26:02 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q76sm13472797pfc.86.2019.10.04.21.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 21:26:01 -0700 (PDT)
Date:   Fri, 4 Oct 2019 21:25:59 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, marijns95@gmail.com,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 5/5] soc: qcom: rpmpd: Add rpm power domains for msm8956
Message-ID: <20191005042559.GB6390@tuxbook-pro>
References: <20190921101207.65042-1-kholk11@gmail.com>
 <20190921101207.65042-6-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190921101207.65042-6-kholk11@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat 21 Sep 03:12 PDT 2019, kholk11@gmail.com wrote:

> From: "Angelo G. Del Regno" <kholk11@gmail.com>
> 
> The MSM8956 SoC has two main voltage-level power domains, VDD_CX
> and VDD_MX, which also have their own voltage-floor-level (VFL)
> corner.
> 
> Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>

I was under the impression that 8956/76 can be used interchangeably, if
so I would prefer if you pick one (8976 as that seems to be your common
choice) and stick with that.

If not, I think it would be nice if all bindings came with both
compatibles.

Regards,
Bjorn

> ---
>  .../devicetree/bindings/power/qcom,rpmpd.txt  |  1 +
>  drivers/soc/qcom/rpmpd.c                      | 23 +++++++++++++++++++
>  include/dt-bindings/power/qcom-rpmpd.h        |  8 +++++++
>  3 files changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> index eb35b22f9e23..30176b1e595a 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> @@ -5,6 +5,7 @@ which then translates it into a corresponding voltage on a rail
>  
>  Required Properties:
>   - compatible: Should be one of the following
> +	* qcom,msm8956-rpmpd: RPM Power domain for the msm8956 family of SoC
>  	* qcom,msm8996-rpmpd: RPM Power domain for the msm8996 family of SoC
>  	* qcom,msm8998-rpmpd: RPM Power domain for the msm8998 family of SoC
>  	* qcom,qcs404-rpmpd: RPM Power domain for the qcs404 family of SoC
> diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
> index 3c1a55cf25d6..b50f62851461 100644
> --- a/drivers/soc/qcom/rpmpd.c
> +++ b/drivers/soc/qcom/rpmpd.c
> @@ -115,6 +115,28 @@ struct rpmpd_desc {
>  
>  static DEFINE_MUTEX(rpmpd_lock);
>  
> +/* msm8956 RPM Power Domains */
> +DEFINE_RPMPD_PAIR(msm8956, vddcx, vddcx_ao, SMPA, LEVEL, 2);
> +DEFINE_RPMPD_PAIR(msm8956, vddmx, vddmx_ao, SMPA, LEVEL, 6);
> +
> +DEFINE_RPMPD_VFL(msm8956, vddcx_vfl, RWSC, 2);
> +DEFINE_RPMPD_VFL(msm8956, vddmx_vfl, RWSM, 6);
> +
> +static struct rpmpd *msm8956_rpmpds[] = {
> +	[MSM8956_VDDCX] =	&msm8956_vddcx,
> +	[MSM8956_VDDCX_AO] =	&msm8956_vddcx_ao,
> +	[MSM8956_VDDCX_VFL] =	&msm8956_vddcx_vfl,
> +	[MSM8956_VDDMX] =	&msm8956_vddmx,
> +	[MSM8956_VDDMX_AO] =	&msm8956_vddmx_ao,
> +	[MSM8956_VDDMX_VFL] =	&msm8956_vddmx_vfl,
> +};
> +
> +static const struct rpmpd_desc msm8956_desc = {
> +	.rpmpds = msm8956_rpmpds,
> +	.num_pds = ARRAY_SIZE(msm8956_rpmpds),
> +	.max_state = RPM_SMD_LEVEL_TURBO_HIGH,
> +};
> +
>  /* msm8996 RPM Power domains */
>  DEFINE_RPMPD_PAIR(msm8996, vddcx, vddcx_ao, SMPA, CORNER, 1);
>  DEFINE_RPMPD_PAIR(msm8996, vddmx, vddmx_ao, SMPA, CORNER, 2);
> @@ -198,6 +220,7 @@ static const struct rpmpd_desc qcs404_desc = {
>  };
>  
>  static const struct of_device_id rpmpd_match_table[] = {
> +	{ .compatible = "qcom,msm8956-rpmpd", .data = &msm8956_desc },
>  	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
>  	{ .compatible = "qcom,msm8998-rpmpd", .data = &msm8998_desc },
>  	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index 30a0aee0df57..3423f964c233 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -27,6 +27,14 @@
>  #define RPMH_REGULATOR_LEVEL_TURBO	384
>  #define RPMH_REGULATOR_LEVEL_TURBO_L1	416
>  
> +/* MSM8956 Power Domain Indexes */
> +#define MSM8956_VDDCX		0
> +#define MSM8956_VDDCX_AO	1
> +#define MSM8956_VDDCX_VFL	2
> +#define MSM8956_VDDMX		3
> +#define MSM8956_VDDMX_AO	4
> +#define MSM8956_VDDMX_VFL	5
> +
>  /* MSM8996 Power Domain Indexes */
>  #define MSM8996_VDDCX		0
>  #define MSM8996_VDDCX_AO	1
> -- 
> 2.21.0
> 
