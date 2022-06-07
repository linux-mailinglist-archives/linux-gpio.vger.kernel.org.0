Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D40353A15B
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 11:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242592AbiFAJ5A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 05:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbiFAJ47 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 05:56:59 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA88BE0B;
        Wed,  1 Jun 2022 02:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654077415; x=1685613415;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Rezegc47oD04NrEL7IdrsnJsfPKKiLWJ9Y6Vzv7ZuDI=;
  b=lg/pJvuTvvu0o4nBmh0Jt2ZsV5D0Z12SfmJCEkXxXKD7igDlgASaT4p1
   myCsSQ+iwFGqbnzomp3PUe3W7LvgVLCTmM8TwYuJawJ1vHQYMoL3zEsY5
   VXdP2l1MkkwV3yoslvh2CAklpVW2inY9Q3t5saKXdv5Bu9RqwukvkNsab
   E=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Jun 2022 02:56:55 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 02:56:53 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 1 Jun 2022 02:56:53 -0700
Received: from [10.216.6.145] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 1 Jun 2022
 02:56:47 -0700
Message-ID: <26bfd089-46d6-d08d-efac-71ffc04f674c@quicinc.com>
Date:   Wed, 1 Jun 2022 15:26:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] pinctrl: qcom: sc7280: Add lpi pinctrl variant data
 structure for adsp based targets
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <agross@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
        <bgoswami@quicinc.com>, <perex@perex.cz>, <tiwai@suse.com>,
        <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <swboyd@chromium.org>, <judyhsiao@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
References: <1651672580-18952-1-git-send-email-quic_srivasam@quicinc.com>
 <1651672580-18952-3-git-send-email-quic_srivasam@quicinc.com>
 <YoJrGGg0RviVn2Xj@ripper>
From:   Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <YoJrGGg0RviVn2Xj@ripper>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 5/16/2022 8:47 PM, Bjorn Andersson wrote:
Thanks for Your time Bjorn!!!
> On Wed 04 May 06:56 PDT 2022, Srinivasa Rao Mandadapu wrote:
>
>> Add compatible string and lpi pinctrl variant data structure for adsp enabled
>> sc7280 platforms.
> This says what the change does, but gives no clue to what this
> compatible represents and why the clock is not optional.
>
> Could you please describe here what scenario this compatible is to be
> used for etc, so that when someone else adds support for the next
> platform they can use the git history to understand which case to
> follow.
>
> Thanks,
> Bjorn
Okay. Will update the commit message.
>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> index 2add9a4..c9e85d9 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> @@ -134,6 +134,16 @@ static const struct lpi_function sc7280_functions[] = {
>>   	LPI_FUNCTION(wsa_swr_data),
>>   };
>>   
>> +static const struct lpi_pinctrl_variant_data sc7280_adsp_lpi_data = {
>> +	.pins = sc7280_lpi_pins,
>> +	.npins = ARRAY_SIZE(sc7280_lpi_pins),
>> +	.groups = sc7280_groups,
>> +	.ngroups = ARRAY_SIZE(sc7280_groups),
>> +	.functions = sc7280_functions,
>> +	.nfunctions = ARRAY_SIZE(sc7280_functions),
>> +	.is_clk_optional = false,
>> +};
>> +
>>   static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
>>   	.pins = sc7280_lpi_pins,
>>   	.npins = ARRAY_SIZE(sc7280_lpi_pins),
>> @@ -149,6 +159,10 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>>   	       .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
>>   	       .data = &sc7280_lpi_data,
>>   	},
>> +	{
>> +		.compatible = "qcom,sc7280-lpass-adsp-lpi-pinctrl",
>> +		.data = &sc7280_adsp_lpi_data,
>> +	},
>>   	{ }
>>   };
>>   MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>> -- 
>> 2.7.4
>>
