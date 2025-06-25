Return-Path: <linux-gpio+bounces-22149-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34833AE7B8D
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 11:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E16793A990E
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 09:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4278C28DF3D;
	Wed, 25 Jun 2025 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNy1UpGq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B3E289826
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 09:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842545; cv=none; b=O3aRbJZXRgL6teoZsyJpyn3HmnB6t/jZe2H2CyBIT33WYzNJeTVrZ/gFU7rnSCr7aw6j8RvXAOwiOEUut1NcJsiKENWyKGMXxpWGeudg3VSBaH9WpOxpb72MtyB1q0f6SunHOWaUsIbni7J5mg5TpBpREep9d661CZSbuTEMh0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842545; c=relaxed/simple;
	bh=ua23f12yKTPwtpt0JlvjEXXpjbyLGPgunHNRHKA0bv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JlLdrFVfuz+mF1pXgD55wAb5eAsi7V01uHOUJdUlOoKpman3i/r7W17Cm8NRumBrHDYEb/MQNbXa4C0vg+zpVILBhotupoQhAXZusCTvHlMweSGwHMLSfV47nFjMpCgwka7MdprxA/1eF4a1fdP/WRkln9gPe2zEvLF7xqiZD6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNy1UpGq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1pLh9001165
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 09:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XMRNxJZ8smunB7DMnFgJ6mTwhifmu2C8+bZ8Rt2d4q8=; b=MNy1UpGqKsSGAVfo
	W3r8NIukSe45r+e70P+YD+Gsnai3BqvLiWiODAAa//S+OoIc/BX0B5ApZxwnH8kA
	BI3tldXlZSm7a2FSwHWygUSpMI1TqQ6JQHT0Vti1JLKcjj1rBLEY4fxbutZ2a4TB
	HTzNrm825ziKv9g1YaV3Av/yku6qQnu/bhVppvhYalC8gF91a+Huo1HzUe0igs7I
	7TsU/j1km7r5jkeGX5rd32ufpFsAcfqTwkaUuILieDpvWGbN9MiNMJedYJ4Scdqp
	pyGGdcp/1g54Zdz5ejcqi5pyvFcW55ohvkzG2t5LD5aHE/IwkhExYeb64b4Z8IXw
	96so3g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7td938v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 09:09:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23536f7c2d7so106049695ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 02:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842542; x=1751447342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XMRNxJZ8smunB7DMnFgJ6mTwhifmu2C8+bZ8Rt2d4q8=;
        b=jg0hwCr6Rsn0ZLC/9k/x7cIxg9Gf/sXccfwLvkeY2qEL174NuEj4B9u8pln9Qerpbw
         rcvSK9a9iiv/rXgesYAzMzN56u4sWJbKmL7TzTkZsYZmoJr23ubj7FhlbwF7ePe4P3ta
         yt5nmB4iZioAStQh7L5hkEZh5h7t5seDhZNdx145w9gxZB6d90ih1b7V0RIrOJA3PY4o
         Jg8mIhRDOXDjk/TnylAeADtZpfnH/Vm4ufBvKGXca0fFvYPlo01z4cZR/GPUrr0fwzzG
         fc0HIAyPVRcPXP4Esm97a3bfWR6VBgEOKGXVc0z8iI+KyhOsoRFgn+FJcbLuSqkCxQ6x
         2yyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwvtEym32Ct4aAxu6+a357YxjEiRaLPPFo85Z91dWIzd9FuJebgsYiZnDXYXVVTi8EsHyN6tqktprj@vger.kernel.org
X-Gm-Message-State: AOJu0YyVb4Ha+OR4NrVCIYVyeEraJTvLadxo8ugGVfg7zUFFaMNZfV7z
	6IIuxTJ/xy+JOapJZx56J3bUOwFPsfkfShu1GQG39FKbSNbULOCcqnrDhsiDxUB0zP66SbazZRM
	vxnNAKYuQ6yfYW+oTwCXBqm+K9obdDqZGbKYZ+a21Ez6ww7m3d/283ctQmVP/znif
X-Gm-Gg: ASbGncuHro+BxJsffvjYW8+UcUXAEmmQ/KTtGSBBQYJxIcHLScXidquS1mamkSYsmwT
	jzubJZZvTWDMM9nhQ7EgYyWWBR7ZtwIOl8L4CfHxXCCOIWXMf1SjNstO49GxsKAgLZxzp0/4JxM
	kaS1d82hZc+NhOWZD1hVhkT3rCia2G/gWp4hhU+b4ezK9DT8e8Lcx2R9czroc5CN3oIOk88xqbd
	lQzc+ef2R/WeefWN4pLk/wfe4G2XkSchOyPk6AXtbt/Q2leFfaMERhgITzRHJ03f1qa+kyDrMIO
	x5A8jI7hmL5HrgzOrajBJL5kCoa2vL9BOvgWGzesb1491cVzTSAWVc3YisHVHA==
X-Received: by 2002:a17:902:e5c6:b0:235:ef56:7800 with SMTP id d9443c01a7336-2382404d8b0mr40820705ad.30.1750842541585;
        Wed, 25 Jun 2025 02:09:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzZJUEV7/dwWDdN5l2PU08bFUS8+SGUQX9bvhOHDAS/otE06vi/IebhTFUfU1a9+dcws8jcQ==
X-Received: by 2002:a17:902:e5c6:b0:235:ef56:7800 with SMTP id d9443c01a7336-2382404d8b0mr40820175ad.30.1750842541122;
        Wed, 25 Jun 2025 02:09:01 -0700 (PDT)
Received: from [192.168.1.9] ([122.169.211.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d839379bsm132437225ad.51.2025.06.25.02.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:09:00 -0700 (PDT)
Message-ID: <f1ffcfcf-b213-43ee-b6bb-a57bcb82c567@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 14:38:54 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO
 for WSA883x speakers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
References: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250620103012.360794-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <v7oxwbf6xjc2gxeviwe4tayovzasysqig5smk752an74qd2e46@q25ymfyru3ze>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <v7oxwbf6xjc2gxeviwe4tayovzasysqig5smk752an74qd2e46@q25ymfyru3ze>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685bbcae cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Cd/wWaFLovbkbTNPkk+rxA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=BkUvjnVOG6HkTn4gpLkA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA2NyBTYWx0ZWRfXyJ349lZmq/k4
 c9whUqJYhuYNq5miXqJeV1wMF+q6adIGqm9QJttXAQ28XNIwdQdUhNninjhNYxS6qK7jBK9B9y2
 FzU0+Y24ek5FVRX9gSpz0ZRnjmnJKhTAQEPerr4G3eL8vyWSNfb8/OFcOh8pnMgNIo76j3YE5bo
 vLudRO/o7r3Xv8yWbEgsUcJATlQsw2+PZ8Nn02BMNqXwkea83Usyn+6Pg/TVelxjw5zLuHQijPg
 NR2cTtOIsU45y4dV6DElgpWZzQyJRFkrYqtx97hd4hDqNvKcdaCg+R6PoZ0QLG0sf6VdSpTeQkW
 S3JzHEUnm9a2QWGKJSFXxQggMtj9zZ10kzdTJzeKmAB9nNSTqlyJQAZ5V6joaVF6grdydGdHap6
 YAXml4tZQmSEIaunnlVet+rcLgotjk5DCBZ9YsRgk+TfJxLCXFFrPGI8q7xG+h7rHVWRw77P
X-Proofpoint-GUID: _Qh4U4JDTGZZTGSkNBiltOnhXXdtAbUr
X-Proofpoint-ORIG-GUID: _Qh4U4JDTGZZTGSkNBiltOnhXXdtAbUr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250067



On 6/24/2025 8:13 AM, Dmitry Baryshkov wrote:
> On Fri, Jun 20, 2025 at 04:00:12PM +0530, Mohammad Rafi Shaik wrote:
>> On some Qualcomm platforms, such as QCS6490-RB3Gen2 and QCM6490-IDP,
>> multiple WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
>> To handle such cases, use the reset controller framework along with the
>> "reset-gpio" driver.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/codecs/wsa883x.c | 57 ++++++++++++++++++++++++++++++++------
>>   1 file changed, 48 insertions(+), 9 deletions(-)
>>
>> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
>> index 13c9d4a6f015..b82b925c1f8d 100644
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
>> @@ -1547,6 +1549,44 @@ static const struct hwmon_chip_info wsa883x_hwmon_chip_info = {
>>   	.info	= wsa883x_hwmon_info,
>>   };
>>   
>> +static void wsa883x_reset_powerdown(void *data)
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
> 
> Please name these two functions in using antonyms (e.g. init/fini,
> powerup / powerdown, assert / deassert, etc).
> 
Ack,

sure, will update the function names.

>> +{
>> +	if (wsa883x->sd_reset)
>> +		reset_control_deassert(wsa883x->sd_reset);
>> +	else
>> +		gpiod_direction_output(wsa883x->sd_n, 0);
>> +}
>> +
>> +static int wsa883x_get_reset(struct device *dev, struct wsa883x_priv *wsa883x)
>> +{
>> +	wsa883x->sd_reset = devm_reset_control_get_optional_shared(dev, NULL);
>> +	if (IS_ERR(wsa883x->sd_reset))
>> +		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_reset),
>> +				     "Failed to get reset\n");
>> +	else if (wsa883x->sd_reset)
> 
> No need for 'else' here.

Ack,

will make the changes.

Thanks & best regards,
Rafi.
> 
>> +		return 0;
>> +	/*
>> +	 * else: NULL, so use the backwards compatible way for powerdown-gpios,
>> +	 * which does not handle sharing GPIO properly.
>> +	 */
>> +	wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
>> +						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
>> +	if (IS_ERR(wsa883x->sd_n))
>> +		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
>> +				     "Shutdown Control GPIO not found\n");
>> +	return 0;
>> +}
>> +
>>   static int wsa883x_probe(struct sdw_slave *pdev,
>>   			 const struct sdw_device_id *id)
>>   {
>> @@ -1567,13 +1607,9 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>>   	if (ret)
>>   		return dev_err_probe(dev, ret, "Failed to enable vdd regulator\n");
>>   
>> -	wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
>> -						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
>> -	if (IS_ERR(wsa883x->sd_n)) {
>> -		ret = dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
>> -				    "Shutdown Control GPIO not found\n");
>> -		goto err;
>> -	}
>> +	ret = wsa883x_get_reset(dev, wsa883x);
>> +	if (ret)
>> +		return ret;
>>   
>>   	dev_set_drvdata(dev, wsa883x);
>>   	wsa883x->slave = pdev;
>> @@ -1596,11 +1632,14 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>>   	pdev->prop.simple_clk_stop_capable = true;
>>   	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
>>   	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
>> -	gpiod_direction_output(wsa883x->sd_n, 0);
>> +
>> +	wsa883x_reset_deassert(wsa883x);
>> +	ret = devm_add_action_or_reset(dev, wsa883x_reset_powerdown, wsa883x);
>> +	if (ret)
>> +		return ret;
>>   
>>   	wsa883x->regmap = devm_regmap_init_sdw(pdev, &wsa883x_regmap_config);
>>   	if (IS_ERR(wsa883x->regmap)) {
>> -		gpiod_direction_output(wsa883x->sd_n, 1);
>>   		ret = dev_err_probe(dev, PTR_ERR(wsa883x->regmap),
>>   				    "regmap_init failed\n");
>>   		goto err;
>> -- 
>> 2.34.1
>>
> 


