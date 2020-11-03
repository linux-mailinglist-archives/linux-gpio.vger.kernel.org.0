Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D62642A45F2
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Nov 2020 14:08:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729028AbgKCNIc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Nov 2020 08:08:32 -0500
Received: from z5.mailgun.us ([104.130.96.5]:47121 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728918AbgKCNIc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 3 Nov 2020 08:08:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604408911; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=xoOA0jIP+iC6+Zj10xYW4ClaYHPbXfMhMcG5e+fIP8E=; b=vQmUFplVsjWPcE50xoKFbZ4X+pIJL1Cyn07g5pQke1wC7McmmleJM/wJkmzPdEiR3fWPKOlz
 r3LXOK9n+KYmDCMdWQ1CtHi0dwc9/i/Ir+UjnnIEmElgHV5FnZIiaxt3y8nQzKasZfTQ70QQ
 4E3q5uXa6QnpHycPGpgNXlsnAT4=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fa15643875877e3eda021ea (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 13:08:19
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 248E9C3857D; Tue,  3 Nov 2020 10:39:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.118] (unknown [49.207.200.92])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C1F94C38538;
        Tue,  3 Nov 2020 10:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C1F94C38538
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add sc7280 pinctrl driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1602831532-24818-1-git-send-email-rnayak@codeaurora.org>
 <1602831532-24818-2-git-send-email-rnayak@codeaurora.org>
 <20201029142008.GE3151@builder.lan>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <c80a0861-da20-6ef9-2d8f-c01f89044ac8@codeaurora.org>
Date:   Tue, 3 Nov 2020 16:09:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201029142008.GE3151@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 10/29/2020 7:50 PM, Bjorn Andersson wrote:
> On Fri 16 Oct 01:58 CDT 2020, Rajendra Nayak wrote:
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
> [..]
>> +static const struct msm_function sc7280_functions[] = {
> [..]
>> +	FUNCTION(phase_flag0),
>> +	FUNCTION(phase_flag1),
>> +	FUNCTION(phase_flag10),
>> +	FUNCTION(phase_flag11),
>> +	FUNCTION(phase_flag12),
>> +	FUNCTION(phase_flag13),
>> +	FUNCTION(phase_flag14),
>> +	FUNCTION(phase_flag15),
>> +	FUNCTION(phase_flag16),
>> +	FUNCTION(phase_flag17),
>> +	FUNCTION(phase_flag18),
>> +	FUNCTION(phase_flag19),
>> +	FUNCTION(phase_flag2),
>> +	FUNCTION(phase_flag20),
>> +	FUNCTION(phase_flag21),
>> +	FUNCTION(phase_flag22),
>> +	FUNCTION(phase_flag23),
>> +	FUNCTION(phase_flag24),
>> +	FUNCTION(phase_flag25),
>> +	FUNCTION(phase_flag26),
>> +	FUNCTION(phase_flag27),
>> +	FUNCTION(phase_flag28),
>> +	FUNCTION(phase_flag29),
>> +	FUNCTION(phase_flag3),
>> +	FUNCTION(phase_flag30),
>> +	FUNCTION(phase_flag31),
>> +	FUNCTION(phase_flag4),
>> +	FUNCTION(phase_flag5),
>> +	FUNCTION(phase_flag6),
>> +	FUNCTION(phase_flag7),
>> +	FUNCTION(phase_flag8),
>> +	FUNCTION(phase_flag9),
> 
> I prefer when we squash these into a single function.
> 
>> +	FUNCTION(pll_bist),
>> +	FUNCTION(pll_bypassnl),
>> +	FUNCTION(pll_clk),
>> +	FUNCTION(pll_reset),
>> +	FUNCTION(pri_mi2s),
>> +	FUNCTION(prng_rosc),
>> +	FUNCTION(qdss_cti),
>> +	FUNCTION(qdss_gpio),
>> +	FUNCTION(qdss_gpio0),
>> +	FUNCTION(qdss_gpio1),
>> +	FUNCTION(qdss_gpio10),
>> +	FUNCTION(qdss_gpio11),
>> +	FUNCTION(qdss_gpio12),
>> +	FUNCTION(qdss_gpio13),
>> +	FUNCTION(qdss_gpio14),
>> +	FUNCTION(qdss_gpio15),
>> +	FUNCTION(qdss_gpio2),
>> +	FUNCTION(qdss_gpio3),
>> +	FUNCTION(qdss_gpio4),
>> +	FUNCTION(qdss_gpio5),
>> +	FUNCTION(qdss_gpio6),
>> +	FUNCTION(qdss_gpio7),
>> +	FUNCTION(qdss_gpio8),
>> +	FUNCTION(qdss_gpio9),
> 
> Ditto.
> 
>> +	FUNCTION(qlink0_enable),
>> +	FUNCTION(qlink0_request),
>> +	FUNCTION(qlink0_wmss),
>> +	FUNCTION(qlink1_enable),
>> +	FUNCTION(qlink1_request),
>> +	FUNCTION(qlink1_wmss),
>> +	FUNCTION(qspi_clk),
>> +	FUNCTION(qspi_cs),
>> +	FUNCTION(qspi_data),
>> +	FUNCTION(qup00),
>> +	FUNCTION(qup01),
>> +	FUNCTION(qup02),
>> +	FUNCTION(qup03),
>> +	FUNCTION(qup04),
>> +	FUNCTION(qup05),
>> +	FUNCTION(qup06),
>> +	FUNCTION(qup07),
>> +	FUNCTION(qup10),
>> +	FUNCTION(qup11),
>> +	FUNCTION(qup12),
>> +	FUNCTION(qup13),
>> +	FUNCTION(qup14),
>> +	FUNCTION(qup15),
>> +	FUNCTION(qup16),
>> +	FUNCTION(qup17),
>> +	FUNCTION(sdc40),
>> +	FUNCTION(sdc41),
>> +	FUNCTION(sdc42),
>> +	FUNCTION(sdc43),
>> +	FUNCTION(sdc4_clk),
>> +	FUNCTION(sdc4_cmd),
>> +	FUNCTION(sd_write),
>> +	FUNCTION(sec_mi2s),
>> +	FUNCTION(tb_trig),
>> +	FUNCTION(tgu_ch0),
>> +	FUNCTION(tgu_ch1),
>> +	FUNCTION(tsense_pwm1),
>> +	FUNCTION(tsense_pwm2),
>> +	FUNCTION(uim0_clk),
>> +	FUNCTION(uim0_data),
>> +	FUNCTION(uim0_present),
>> +	FUNCTION(uim0_reset),
>> +	FUNCTION(uim1_clk),
>> +	FUNCTION(uim1_data),
>> +	FUNCTION(uim1_present),
>> +	FUNCTION(uim1_reset),
>> +	FUNCTION(usb2phy_ac),
>> +	FUNCTION(usb_phy),
>> +	FUNCTION(vfr_0),
>> +	FUNCTION(vfr_1),
>> +	FUNCTION(vsense_trigger),
>> +};
>> +
>> +/* Every pin is maintained as a single group, and missing or non-existing pin
>> + * would be maintained as dummy group to synchronize pin group index with
>> + * pin descriptor registered with pinctrl core.
>> + * Clients would not be able to request these dummy pin groups.
>> + */
>> +static const struct msm_pingroup sc7280_groups[] = {
> [..]
>> +	[174] = PINGROUP(174, qdss_gpio15, _, _, _, _, _, _, _, _),
>> +	[175] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x1b3000, 15, 0),
>> +	[176] = SDC_QDSD_PINGROUP(sdc1_clk, 0x1b3000, 13, 6),
>> +	[177] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x1b3000, 11, 3),
>> +	[178] = SDC_QDSD_PINGROUP(sdc1_data, 0x1b3000, 9, 0),
>> +	[179] = SDC_QDSD_PINGROUP(sdc2_clk, 0x1b4000, 14, 6),
>> +	[180] = SDC_QDSD_PINGROUP(sdc2_cmd, 0x1b4000, 11, 3),
>> +	[181] = SDC_QDSD_PINGROUP(sdc2_data, 0x1b4000, 9, 0),
>> +	[182] = UFS_RESET(ufs_reset, 0x1be000),
> 
> Rather than fiddling ufs reset using pinconf we expose it as a gp(i)o
> pin upstream. So please move this to be the 175th item in the list and
> bump ngpios to 176 below.
> 
>> +};
>> +
>> +static const struct msm_pinctrl_soc_data sc7280_pinctrl = {
>> +	.pins = sc7280_pins,
>> +	.npins = ARRAY_SIZE(sc7280_pins),
>> +	.functions = sc7280_functions,
>> +	.nfunctions = ARRAY_SIZE(sc7280_functions),
>> +	.groups = sc7280_groups,
>> +	.ngroups = ARRAY_SIZE(sc7280_groups),
>> +	.ngpios = 175,
>> +};
>> +
> 
> Apart from that it looks good.

thanks Bjorn, I'll fix-up and re-post.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
