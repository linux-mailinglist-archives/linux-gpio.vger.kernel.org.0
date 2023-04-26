Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C11A16EF76D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Apr 2023 17:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241407AbjDZPFP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Apr 2023 11:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240794AbjDZPFF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Apr 2023 11:05:05 -0400
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3DD17D86
        for <linux-gpio@vger.kernel.org>; Wed, 26 Apr 2023 08:04:58 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id b4786a13-e443-11ed-b3cf-005056bd6ce9;
        Wed, 26 Apr 2023 18:04:56 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Wed, 26 Apr 2023 18:04:55 +0300
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, richardcochran@gmail.com,
        manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add SDX75 pincontrol driver
Message-ID: <ZEk9lySMZcrRZYwX@surfacebook>
References: <1682327030-25535-1-git-send-email-quic_rohiagar@quicinc.com>
 <1682327030-25535-3-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1682327030-25535-3-git-send-email-quic_rohiagar@quicinc.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Mon, Apr 24, 2023 at 02:33:50PM +0530, Rohit Agarwal kirjoitti:
> Add initial Qualcomm SDX75 pinctrl driver to support pin configuration
> with pinctrl framework for SDX75 SoC.
> While at it, reordering the SDX65 entry.

...

> +#define FUNCTION(fname)							\
> +	[msm_mux_##fname] = {						\
> +		.name = #fname,						\
> +		.groups = fname##_groups,				\
> +	.ngroups = ARRAY_SIZE(fname##_groups),				\
> +	}

PINCTRL_PINFUNCTION() ?

...

> +static const struct of_device_id sdx75_pinctrl_of_match[] = {
> +	{.compatible = "qcom,sdx75-tlmm", .data = &sdx75_pinctrl}, {},

One entry per line.
And drop comma in the terminator one.

> +};

No MODULE_DEVICE_TABLE()?

-- 
With Best Regards,
Andy Shevchenko


