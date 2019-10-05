Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2D5CC7AA
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 06:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbfJEEXE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 00:23:04 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43454 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbfJEEXE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 00:23:04 -0400
Received: by mail-pg1-f193.google.com with SMTP id v27so4853581pgk.10
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 21:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4B9eHmi0DL0E1YSAJ4344KORqouD+llln3LfV3vaWvA=;
        b=NyeSwcZp8hS7e0XhB6WwIswMbkQgX1zj+c+MNXctVIyP+Q9cG33Q8GoAVxT8PBVdox
         glh3qsv6a6Ij1XPcNqJD+J6icYBjuYRBsrFQMiPye26mTuWMbpsdBeFEWRzIrK1vUzhw
         O3UfMGR4DvcBgVfrWfFVy14qMXFOpPis+h52Eam9YvnOZYuzXjYXWYMmMLg1pptRWi+J
         YmpolJyDbETZSZP3PAc++7XMiHihv7vvmCK6L3daOFq/jFgFrl4YBNhGe9gVx4O1ch73
         hKzwJmWna2nWcGOVCqnl0wYc8Mr+4YbFkSiKzoj5Ht+irXLDB/0vKM2JJJ8nxvQjcRde
         ZeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4B9eHmi0DL0E1YSAJ4344KORqouD+llln3LfV3vaWvA=;
        b=BnRk+REIa3OXLTqrcvCvVtungbCX42padeiuHkfyIEmcGPFr9ZNE8kMaqFctkVwLVm
         0bmD3gqg5E/nI69TSI4+A2+svk1F8KJeIohxTNJeT0DTLwbQeeF4/KNRPB49/J8rPfWQ
         kZh5FyiT8VBIb74uEYy6r1K5GrAxqoutfvr0nj+Fe92WhvDdq3k6U/yNdxxqMw0eoVgY
         KXXHJytRyetGJKZ+AHUgQ7TqtJs2mWY9qyWXg5o9Ee2ZP2jCU1cTkP5Y1etEgljwzWJh
         O9x/fYqWK/KdhEbeY3XBD1ZLVk7P4vJYHrn/xbRBtGyzukwjTcVFoCOtlEZFkmZm2DNg
         gKdA==
X-Gm-Message-State: APjAAAUy3KEoziXlj8bcp+XEht0YVSBBwjJcTjLi69NdFpK440sdw6Gf
        AIjLrTAm1XZyhmunqjaz8hBJiA==
X-Google-Smtp-Source: APXvYqxgK8xmcb8cmqLsORJZ7TTthNvSR38Gu5AhhulxNuWGRWRRZdbxrIuJPiYnKHNvKZ2NG/bVbw==
X-Received: by 2002:a17:90a:a47:: with SMTP id o65mr20625084pjo.90.1570249383344;
        Fri, 04 Oct 2019 21:23:03 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b14sm7900427pfi.95.2019.10.04.21.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 21:23:02 -0700 (PDT)
Date:   Fri, 4 Oct 2019 21:23:00 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, marijns95@gmail.com,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/5] soc: qcom: smd-rpm: Add MSM8976 compatible
Message-ID: <20191005042300.GA6390@tuxbook-pro>
References: <20190921101207.65042-1-kholk11@gmail.com>
 <20190921101207.65042-4-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190921101207.65042-4-kholk11@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat 21 Sep 03:12 PDT 2019, kholk11@gmail.com wrote:

> From: "Angelo G. Del Regno" <kholk11@gmail.com>
> 
> Add a compatible for the RPM on the Qualcomm MSM8976 platform:
> this is also valid for MSM8956 and their APQ variants.
> 
> Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>

Applied

Thanks,
Bjorn

> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt | 1 +
>  drivers/soc/qcom/smd-rpm.c                                  | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
> index f3fa313963d5..616fddcd09fd 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
> @@ -22,6 +22,7 @@ resources.
>  		    "qcom,rpm-apq8084"
>  		    "qcom,rpm-msm8916"
>  		    "qcom,rpm-msm8974"
> +		    "qcom,rpm-msm8976"
>  		    "qcom,rpm-msm8998"
>  		    "qcom,rpm-sdm660"
>  		    "qcom,rpm-qcs404"
> diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
> index fa9dd12b5e39..fe2199f6ce8f 100644
> --- a/drivers/soc/qcom/smd-rpm.c
> +++ b/drivers/soc/qcom/smd-rpm.c
> @@ -217,6 +217,7 @@ static const struct of_device_id qcom_smd_rpm_of_match[] = {
>  	{ .compatible = "qcom,rpm-apq8084" },
>  	{ .compatible = "qcom,rpm-msm8916" },
>  	{ .compatible = "qcom,rpm-msm8974" },
> +	{ .compatible = "qcom,rpm-msm8976" },
>  	{ .compatible = "qcom,rpm-msm8996" },
>  	{ .compatible = "qcom,rpm-msm8998" },
>  	{ .compatible = "qcom,rpm-sdm660" },
> -- 
> 2.21.0
> 
