Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B069D55DCE5
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbiF0Jak (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jun 2022 05:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233795AbiF0Jaj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2022 05:30:39 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 316C318A
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 02:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1656322239; x=1687858239;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2TAk1HTirqWaRmYwpXIm8GXh5upucONd8Hs6TrcmmQI=;
  b=T16Cbd7oWV518/rAf+w8MpwBgq4BHPBKKjm8Xzcoqr2m8xD+JUmT0Vlx
   aAhurgvBbMQyWkUHdzrz9QY0KDVAYYwyg0vhnUjVnckW0STsxgn25Ive0
   9Mt03tu8dAIGW9kK54m7txMaSnM9bk6ibQw81pi/fYYYWDG+COiKLgVm5
   c=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Jun 2022 02:30:38 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 02:30:38 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 02:30:38 -0700
Received: from [10.216.28.64] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 27 Jun
 2022 02:30:36 -0700
Message-ID: <fda47a80-605e-ee39-d7a0-d48d40fc8840@quicinc.com>
Date:   Mon, 27 Jun 2022 15:00:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] pinctrl: qcom: sc7280: Fix compile bug
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     Stephen Boyd <swboyd@chromium.org>
References: <20220627092425.98730-1-linus.walleij@linaro.org>
From:   Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <20220627092425.98730-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/27/2022 2:54 PM, Linus Walleij wrote:
Thanks for Your Support Linus.
> The idea was right but the code was breaking in next.
> I assume some unstaged commit was involed. Fix it up.
>
> Cc: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Fixes: 36fe26843d6d ("pinctrl: qcom: sc7280: Add clock optional check for ADSP bypass targets")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index b3d4244a5266..b5d1b996c454 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -388,7 +388,8 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
>   	pctrl->data = data;
>   	pctrl->dev = &pdev->dev;
>   
> -	data->is_clk_optional = of_property_read_bool(np, "qcom,adsp-bypass-mode");
> +	data->is_clk_optional = of_property_read_bool(dev->of_node,
> +						      "qcom,adsp-bypass-mode");

There is another problem with this patch.  As lpi_pinctrl_variant_data 
is const type,  unable to update this variable.

So I have posted the fix patch series v5. Please check and let me me if 
anything to be done.

>   
>   	pctrl->clks[0].id = "core";
>   	pctrl->clks[1].id = "audio";
