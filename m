Return-Path: <linux-gpio+bounces-24440-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BD3B28332
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 17:48:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 136473BEC95
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 15:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5000B308F25;
	Fri, 15 Aug 2025 15:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MsViWpvq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A882A21A445
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 15:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755272853; cv=none; b=T+kBWEkjP8UaCZUArr9bIp7hkMq80Bk3ZMYJKaoyws9vK8316ZMEi3TmRyAVnQbtzyioXIRVR6PjO3sEuV2EOpCw6QnRrrUq6VCeKoPaRX1+M6MQBff/g0pULFMjcWmCj3/fjygXltEysj6nKPygiihO0nUqdG4darc7nvmxVu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755272853; c=relaxed/simple;
	bh=uPl0cZOA+EjteN7T7Rj5RD+BWqJ3QGJOJuqloyWCIYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Usah902MHky+mL+kD1jbhHrJfWwnH9xIHBcDhIrHDZNCAFT3nc2WIRjjJ0IxGExaJ5yzu2LqptT2p6o4MLnNHqHCjhrMPyoeHBQLRtnFLuYfPA5zrLopQ5F8s4ZdqSK13dYMSy5TigI7st32b+qXiZPlE6XeSb6RwQBhJSoo68A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MsViWpvq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJ8cQ027491
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 15:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EiioAGCDCZ6vg6boHtPlr1C7Pfo4kH+4T3nIPbJhUoE=; b=MsViWpvqGHraR8ug
	GsNyBkh3W585v5L7CiMYNMVWio6jPdLJQiuU7ZtfsE6WPCL0K6lVgF/jhNBvx9Rw
	ZHXyEtQffluOA1BmhahfPFWwYBgnoNWGnWU6imazA17jVctEXDHYV3P/KTmP3PN+
	SmvSDLOsUf5cGHht20jkFvkCD3zHTf1zLBai3Pb93mPpedJkVyBHP00KIXoGBWhD
	qB7zPP6SdxdRIVUyV/JKBehPeUKq60y4qnRQIIVBhr0edfu2iKG7okZXg0KR2Xz8
	2oq/YDg6zE6yfnMfZFjdhPxceU1/1jrDlFX8DdGfWoRlb5zppbVs5j+sHTZQYTNQ
	JbFwqg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9t3nnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 15:47:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b47174c667aso1643394a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 08:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755272850; x=1755877650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EiioAGCDCZ6vg6boHtPlr1C7Pfo4kH+4T3nIPbJhUoE=;
        b=IPu0tV8S+QcN0GDOtXzCkoTH7+JPAu/ums4XBVth9+jdtDCOJm9DROPwgNWyj1ya+x
         hnX4DrQ6dLrSevIHzo6E73ixG2wo+jxfUfUO1fCII9Dr0dqJNHaXX1ftCmJ4eEvF3NRk
         8cH9djvTPZwne5Yby8kifvYVf94tdogG3mf/cs6JnXYH0Tk+N2hEG1fNx0FvnWcSV3P/
         KJkh/GqcO5xYfSUU7eE0YKJn/YTzEda9CoELN+3u3Is6LYqZjzwBeZmThZIvFlqjO1UF
         vxh1srG/B/C/j1LEkVApIJGKr5nP9EKLtLW7ZWDOkvCcBBvgpk5SIofn0qake4m98WDw
         4MQw==
X-Forwarded-Encrypted: i=1; AJvYcCWpNxZ5yTZmFOH3SmVG1rY56MxxKH/llnH5IPU5/wIYmYloy/aq67g32HFCP7ljmhTV9H2cSalOv1xx@vger.kernel.org
X-Gm-Message-State: AOJu0YxspWENTsJtMdOl/4bp6spbPbsf3P70clMSK56j2uEj8ksiIRs6
	JANvWaK3WYgWV/cPwlnhAKNUw/CKGR54LhTFUoEGUY9aQUPWTSoFSjB9FboNmhuys/oBVHxyU4C
	YYKVAbPJEF3dFJpp4N6BHH4wi5DjInATr6Qxdib1VsSA0oQQky+1Nu/GIQZWtNhBR
X-Gm-Gg: ASbGncuhBDkeiy846YgYfR9gDRpbUYtLBWISvpNvsinv/XsgYyk7cDfIOd+yQd4kV3z
	gViYQv3weX41LLZl+dyvYT0YwS7dkwWNt+YPamGja9TImlGdXoSpjrIpgcsy3A94Q6OL52llEgN
	SV9HQlxO0cusfKgrAKlepSHgnXDZ0xVFNBMTEdLnerN7PE8vn/aSV2OMztjUov7ZXhRwnV+g7le
	btJ2q1BbyEkqH4xGWF+4DtzB+RHTcjTHQo/qfFYAv9xcrDhoRYwf8DxH9+lKD89udR4M2UWjL88
	JIAVFxc+61wRF5cyj34IEa+O8ahqOC23aW3irtCGfvL89B5Qzb1eokshqDObF0PmilEZC3JZzWz
	dRXc=
X-Received: by 2002:a05:6a20:a10a:b0:23d:e026:5eec with SMTP id adf61e73a8af0-240d2d8fdf9mr4493903637.6.1755272849820;
        Fri, 15 Aug 2025 08:47:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfbod/CWLgd7xkweW30B24YNgaFlJbj9Vgp4n7cu6PVX9gaaIaPkSlYozadv7IFAd9WFvAPQ==
X-Received: by 2002:a05:6a20:a10a:b0:23d:e026:5eec with SMTP id adf61e73a8af0-240d2d8fdf9mr4493867637.6.1755272849332;
        Fri, 15 Aug 2025 08:47:29 -0700 (PDT)
Received: from [192.168.1.4] ([182.65.246.255])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d60978fsm1576486a12.26.2025.08.15.08.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 08:47:29 -0700 (PDT)
Message-ID: <def861bd-eec8-41b2-a21f-4bc33d44e7cb@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 21:17:21 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO
 for WSA883x speakers
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250806181818.2817356-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250806181818.2817356-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <5ee0656b-136b-480f-9555-26ccdbff3eda@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <5ee0656b-136b-480f-9555-26ccdbff3eda@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689f5692 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=pI+DPfzdYYuZfMA0k80AuQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Mg5sY2mpGzWUx03gXF4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2kZNMCZcrT_qaXpn8bKxK3GtlF90pKj8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX8bX5IcQtYddK
 7iTF/bLsmGHBFbd36i6V2ofb598sT7sFUlAxxDltr/CQGXUomhMaj7cwp6N5BduYuGoDgVmCQMH
 wuoRdlvoxK2+1gPt9Mn2IDkkQtH6cFggWoUgT1U0BRNBT1yTC1X70ZEsSir+b4g0TWDO8N5Rpx2
 +GplN5hV/9/bb5oRzdmkKHJYm0eolE0myGK15aZmKoFf4LVHwEw0OX1J+RaaLS27IzOvLg8YpPE
 20g94OPlL8cC+zu9AywjanViKMgUth3Iq6gNrhH8qJIWSDVQiov0b/uQ3ypKDkYYSQ3jYoNWtPU
 T7mJRI9RhVmH5D+ibpkuMqilgCl32nZ63wOAZqj39eawOv0e2a/Oqk9MuF1W6VVF7Twt1vUAfhL
 OyDENiyL
X-Proofpoint-GUID: 2kZNMCZcrT_qaXpn8bKxK3GtlF90pKj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015



On 8/15/2025 12:07 PM, Srinivas Kandagatla wrote:
> 
> On 8/6/25 7:18 PM, Mohammad Rafi Shaik wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
>> WSA8830/WSA8835 speaker amplifiers share a common reset (shutdown) GPIO.
>>
>> To handle such scenario, use the reset controller framework and its
>> "reset-gpio" driver to handle such case. This allows proper handling
>> of all WSA883x speaker amplifiers on QCS6490-RB3Gen2 board.
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> ---
>>   sound/soc/codecs/wsa883x.c | 57 +++++++++++++++++++++++++++++++++-----
>>   1 file changed, 50 insertions(+), 7 deletions(-)
>>
>> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
>> index 188363b03b93..ec7a55d88576 100644
>> --- a/sound/soc/codecs/wsa883x.c
>> +++ b/sound/soc/codecs/wsa883x.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/printk.h>
>>   #include <linux/regmap.h>
>>   #include <linux/regulator/consumer.h>
>> +#include <linux/reset.h>
>>   #include <linux/slab.h>
>>   #include <linux/soundwire/sdw.h>
>>   #include <linux/soundwire/sdw_registers.h>
>> @@ -468,6 +469,7 @@ struct wsa883x_priv {
>>   	struct sdw_stream_runtime *sruntime;
>>   	struct sdw_port_config port_config[WSA883X_MAX_SWR_PORTS];
>>   	struct gpio_desc *sd_n;
>> +	struct reset_control *sd_reset;
>>   	bool port_prepared[WSA883X_MAX_SWR_PORTS];
>>   	bool port_enable[WSA883X_MAX_SWR_PORTS];
>>   	int active_ports;
>> @@ -1546,6 +1548,46 @@ static const struct hwmon_chip_info wsa883x_hwmon_chip_info = {
>>   	.info	= wsa883x_hwmon_info,
>>   };
>>   
>> +static void wsa883x_reset_assert(void *data)
>> +{
>> +	struct wsa883x_priv *wsa883x = data;
>> +
>> +	if (wsa883x->sd_reset)
>> +		reset_control_assert(wsa883x->sd_reset);
>> +	else
>> +		gpiod_direction_output(wsa883x->sd_n, 1);
>> +}
>> +
>> +static void wsa883x_reset_deassert(struct wsa883x_priv *wsa883x)
>> +{
>> +	if (wsa883x->sd_reset)
>> +		reset_control_deassert(wsa883x->sd_reset);
>> +	else
>> +		gpiod_direction_output(wsa883x->sd_n, 0);
>> +}
>> +
>> +static int wsa883x_get_reset(struct device *dev, struct wsa883x_priv *wsa883x)
>> +{
>> +	wsa883x->sd_reset = devm_reset_control_get_optional_shared_deasserted(dev, NULL);
> why deasserted ? we are already doing wsa883x_reset_deassert(wsa883x)
> just after calling this.
> 
ACK,

yes right, we need wsa883x_reset_deassert(wsa883x) to deassert manually 
because same api should handle powerdown-gpios if not reset-gpios.

will use the proper api devm_reset_control_get_optional_shared().


>> +	if (IS_ERR(wsa883x->sd_reset))
>> +		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_reset),
>> +				     "Failed to get reset\n");
>> +	/*
>> +	 * if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios,
>> +	 * which does not handle sharing GPIO properly.
>> +	 */
>> +	if (!wsa883x->sd_reset) {
>> +		wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
>> +							GPIOD_FLAGS_BIT_NONEXCLUSIVE |
>> +							GPIOD_OUT_HIGH);
>> +		if (IS_ERR(wsa883x->sd_n))
>> +			return dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
>> +					     "Shutdown Control GPIO not found\n");
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int wsa883x_probe(struct sdw_slave *pdev,
>>   			 const struct sdw_device_id *id)
>>   {
>> @@ -1566,11 +1608,9 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>>   	if (ret)
>>   		return dev_err_probe(dev, ret, "Failed to enable vdd regulator\n");
>>   
>> -	wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
>> -						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
>> -	if (IS_ERR(wsa883x->sd_n)) {
>> -		ret = dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
>> -				    "Shutdown Control GPIO not found\n");
>> +	ret = wsa883x_get_reset(dev, wsa883x);
>> +	if (ret) {
>> +		dev_dbg(dev, "Failed to get reset powerdown GPIO: %d\n", ret);
> this is redundant we already have failure messages from wsa883x_get_reset().
> 

ACK,

Will remove the extra error logs.

Thanks & Regards,
Rafi.
> 
> --srini
>>   		goto err;
>>   	}
>>   
>> @@ -1595,11 +1635,14 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>>   	pdev->prop.simple_clk_stop_capable = true;
>>   	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
>>   	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
>> -	gpiod_direction_output(wsa883x->sd_n, 0);
>> +
>> +	wsa883x_reset_deassert(wsa883x);
>> +	ret = devm_add_action_or_reset(dev, wsa883x_reset_assert, wsa883x);
>> +	if (ret)
>> +		return ret;
>>   
>>   	wsa883x->regmap = devm_regmap_init_sdw(pdev, &wsa883x_regmap_config);
>>   	if (IS_ERR(wsa883x->regmap)) {
>> -		gpiod_direction_output(wsa883x->sd_n, 1);
>>   		ret = dev_err_probe(dev, PTR_ERR(wsa883x->regmap),
>>   				    "regmap_init failed\n");
>>   		goto err;
> 


