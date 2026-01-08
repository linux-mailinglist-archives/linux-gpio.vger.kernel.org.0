Return-Path: <linux-gpio+bounces-30257-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06246D02913
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 13:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BA32349035F
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 11:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C854C39A803;
	Thu,  8 Jan 2026 09:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lCXlvB3H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UkyRo/D3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A10387574
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 09:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864847; cv=none; b=jHVZBxxJgxAl+H2h46iTl+TxQUVLhibUM/l2D1SmIxN+L58OnkXXqTN/JZjIkLOq0Uk2nrZaOfb/unuuA+NFRXx25B2dIcv6nN/d90q7A+rFAwGu1BHEIf0pooULc23iIYQ7Qs860o2zF+7ryQiZE/pkustfL/ybDB5XxkEuiO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864847; c=relaxed/simple;
	bh=gS/Yhv2jIPc52+WzNNAVh7Z4IQsEjRBJdMYWcF8NAhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sQikfbqD8d8MqyOsZKlMMwUupjeM0/d0/E+kXqVRHyEsxfVvv4EDBPvL519B1PagNpFQfqupiGB+C8l3jHjSZggfscKs4jfR5WGLp8CE+OVVzyZRSrASInlBqEV8KexJ43lhHVZuBWCEq1d7pljYlABJDUF7U3UhWdHr4O5ltVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lCXlvB3H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UkyRo/D3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084sKTk3751414
	for <linux-gpio@vger.kernel.org>; Thu, 8 Jan 2026 09:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1DiYhb9ihKkjmA0sqtCTALf3H2WcBWrR3tqr+W2gaOI=; b=lCXlvB3H0Q9M29+n
	T8sRjEvgs27UY/I6JVuGM7Y18EfVFKBl3lgt4Yvw4wDV8Bdl8zrzvUVrgFVcJ+Ti
	RLtAYeKrvCMvodscvqBRNkEdn9A1ZEsBYeabmfXIWjuh5M5nvi/URxR/4zK/hW2j
	JJEF90Z/CC+jkyJdzxP4DEAI7zkRzRaMhWfsyopheA89Eku3z+FIeRBNdRNe5C2a
	dXyQwldc5KwY/SrNop2Q6BKI3OfynwhypQOGxnqxv7f8r9KubpFhWfitenfLmT3z
	/A/EfT0IO/d2mt9FQ+WgUAWicpL7IbHMZQwWxcJWgcyU5zLdL+WL1bgPOoyKTwpE
	QZ9l7A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxctq0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 09:33:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a089575ab3so37653335ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 01:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767864839; x=1768469639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1DiYhb9ihKkjmA0sqtCTALf3H2WcBWrR3tqr+W2gaOI=;
        b=UkyRo/D3bD0Z+oQJVRhNQy6hTToesJ3Won+TRgtKazhDPJeiMama3AVel1jHUXVBX4
         RudK7VY/ff2s952l01Zij3+jJLK58wVruckCvyLYOvPtgUBVVyt71GqoMEFROYBjSMcX
         /7Sq3TRx/0IR2OYNzSDYpt1TxRGAt1EXujiccx9/QkdpZO+o57RIKqTUotooB2ncfneK
         1bLtMNWYT/MNx1tTcSN4+Ed29qHyWs+tsKn+tiRQVPFttlF/lE2Inuqd2lQQVi/5qKrc
         x12919k6hf2vhOGHJjl0AAWKCvvYdlXCsESRSk9NkXkgPtjVjMLSL2rgowilLCgPg9nE
         1zSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864839; x=1768469639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DiYhb9ihKkjmA0sqtCTALf3H2WcBWrR3tqr+W2gaOI=;
        b=c2To92cK0jF+4stSRfab926b7TnW4stQH/0pJ1I4mjYOh4ChekzXmPbKzg1d/VNTr/
         EpK1SpUIY7UtmnMolSOrVQbp71ZIru92WL1NM8jzcNkZjiWwWjd9PSiaOvB24ya7Tv5D
         TE8MmnPgvdCJ06HgCk8LhdMXyuEr+R4XuYvG0E0nBgiwnfoxmxtQsNuHT5i2k/xN5fo0
         oN9wIoqvNwWgOfwUJTjavkvvtXDj+DfgDmZ9GujqzlWW5xWX3iF3WZriAElYM9CHFNbE
         S5233jP3dUi1+eu91Y3LY3/xSnQ9oFWoH8cffrKay9mt6TCJuf26YGWY3BQA3WgxI0lT
         wkSA==
X-Forwarded-Encrypted: i=1; AJvYcCXpl2Cja6l9jmaoPiESBWQtOJW9Bh/zzj0R0I1+aMzMIyXN83yDy7DN6+RIceeDEShRQVbL5t3cZWkG@vger.kernel.org
X-Gm-Message-State: AOJu0YxI/mKWX33hKUA2LLSsTEqCnxyAKx0yeZBkIgUq9PIbyHQR3nka
	aG+2gofFIZIivDrj9jdpeTqP7a7xfg5WhleyKiqpxvSO5LcOWpuwrLk242ft2NhrYCq23oHnFcs
	YzVcFLV5XZPlzgNHyLdMn0fqrJWaVeN/KvBNZr2JMZwI1dXgl9TpCS66kUmliyH4Q
X-Gm-Gg: AY/fxX4hProL4My9mdZIDYUuvqwEozEL4q++z9xUqXnRX24wN/if84LA0fGyJI6Z6uj
	jWXBIfk4WhpUNjgFa2e2L1U/lNEPRk5h5diPFM6keD+iBOGyKP/a3MA89X9fMQOgmmcPjfoUDk2
	8pxYw6zAjJ2E0ylIgkxZ1ZL/cWrTrk1oaJnAH0dH7loFGvxeTwQIHttgBMT9+bsW06Jdj6yYXr2
	2yh26XBZCnMekjUM8HJLPTGwqljoWSS5Z4UNcvKN5QFZe05EI6UGQG+qntGs06kkK55cPGXujty
	rJYTXRJlG2Jaoc+q385BVCsvDe5PDxS+QFQpL7hTzStdTpGajkRmD78PNyngmcwmwNiY3zJQIev
	0uCJp5d3zq5Gsw2MndycPtdqkhJl5V0+70N7XcbmIbO5P26cn
X-Received: by 2002:a17:903:3c30:b0:2a0:fe4a:d67c with SMTP id d9443c01a7336-2a3ee437a5dmr51484115ad.10.1767864838584;
        Thu, 08 Jan 2026 01:33:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEaA0ClvObVURRXM5032yF9VA1oq0sdi1HK7Y/r0En0OGVnnw0/cXYn8b3u3Yjhv5blQBnhA==
X-Received: by 2002:a17:903:3c30:b0:2a0:fe4a:d67c with SMTP id d9443c01a7336-2a3ee437a5dmr51483875ad.10.1767864838085;
        Thu, 08 Jan 2026 01:33:58 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2de0sm74027745ad.50.2026.01.08.01.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:33:57 -0800 (PST)
Message-ID: <d5f4aa46-4c23-45d9-8c31-64d10245d913@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 15:03:53 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: sa8775p-lpass-lpi: Add SA8775P
 LPASS pinctrl
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260107192007.500995-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260107192007.500995-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260108-archetypal-potoo-of-felicity-8ac479@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260108-archetypal-potoo-of-felicity-8ac479@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfX74Yns60/VILl
 1WvC2M2E/lDYLYi+m1vwzDlu9AkACsBKmsC6VW32JVAJFz5XOF0JVFyh+4dhZkmHWXnAVTm02VO
 g4T1gM/aI0UDovYiy9VZ/XzLUQkEWb4bztIrNxKwIYsqzMkxnzcDZHLIrQJYmiifgUWnWyZQ2qB
 uy8L8K9SGtidJFuJkgjWicOShdkeOE9QR4+fuKPaYMyTtkwYOjUX76BH2618LPx4GzOgIDkF1Bz
 Hged5DgwEw19HdMavEndt/qRODSmCGcm9naWYEa+4hy9TAdpIzA3aYdJjKC6VD4OQUCoxD4U2v1
 drA/2pzadNrIlrkdVI4KrrFyQbm+T2Bhw6ZJUkuMyeYWtIthOIP16OUlbPptFypfVBbDpOV+PbN
 bJ5skWF67QkKFyIYFlY9QpbiiifLJpsebekyBs8t25fazr7rxzXQFOoHQWs81mnATtojNdToo6D
 JijUb2Z5iG8uw4dlUrg==
X-Proofpoint-ORIG-GUID: tzzwj5isMluiLhnBwOWJ1taxywjg6NMV
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695f7a07 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=IbrVKMQAunHM5E1sM0oA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: tzzwj5isMluiLhnBwOWJ1taxywjg6NMV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080062



On 1/8/2026 2:34 PM, Krzysztof Kozlowski wrote:
> On Thu, Jan 08, 2026 at 12:50:07AM +0530, Mohammad Rafi Shaik wrote:
>> Add pin control support for Low Power Audio SubSystem (LPASS)
>> of Qualcomm SA8775P SoC.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/Kconfig                  |  10 +
>>   drivers/pinctrl/qcom/Makefile                 |   1 +
>>   .../pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c  | 216 ++++++++++++++++++
>>   3 files changed, 227 insertions(+)
>>   create mode 100644 drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c
>>
>> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
>> index c480e8b78503..bb1524243906 100644
>> --- a/drivers/pinctrl/qcom/Kconfig
>> +++ b/drivers/pinctrl/qcom/Kconfig
>> @@ -60,6 +60,16 @@ config PINCTRL_LPASS_LPI
>>   	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
>>   	  (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
>>   
>> +config PINCTRL_SA8775P_LPASS_LPI
>> +	tristate "Qualcomm Technologies Inc SA8775P LPASS LPI pin controller driver"
>> +	depends on ARM64 || COMPILE_TEST
>> +	depends on PINCTRL_LPASS_LPI
>> +	help
>> +	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>> +	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
>> +	  (Low Power Island) found on the Qualcomm Technologies Inc SA8775P
>> +	  platform.
>> +
>>   config PINCTRL_SC7280_LPASS_LPI
>>   	tristate "Qualcomm Technologies Inc SC7280 LPASS LPI pin controller driver"
>>   	depends on ARM64 || COMPILE_TEST
>> diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
>> index 748b17a77b2c..b2a23a824846 100644
>> --- a/drivers/pinctrl/qcom/Makefile
>> +++ b/drivers/pinctrl/qcom/Makefile
>> @@ -39,6 +39,7 @@ obj-$(CONFIG_PINCTRL_QCOM_SSBI_PMIC) += pinctrl-ssbi-gpio.o
>>   obj-$(CONFIG_PINCTRL_QCOM_SSBI_PMIC) += pinctrl-ssbi-mpp.o
>>   obj-$(CONFIG_PINCTRL_QDU1000)	+= pinctrl-qdu1000.o
>>   obj-$(CONFIG_PINCTRL_SA8775P)	+= pinctrl-sa8775p.o
>> +obj-$(CONFIG_PINCTRL_SA8775P_LPASS_LPI) += pinctrl-sa8775p-lpass-lpi.o
>>   obj-$(CONFIG_PINCTRL_SAR2130P)	+= pinctrl-sar2130p.o
>>   obj-$(CONFIG_PINCTRL_SC7180)	+= pinctrl-sc7180.o
>>   obj-$(CONFIG_PINCTRL_SC7280)	+= pinctrl-sc7280.o
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c
>> new file mode 100644
>> index 000000000000..4579a079f7c6
>> --- /dev/null
>> +++ b/drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c
>> @@ -0,0 +1,216 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/gpio/driver.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "pinctrl-lpass-lpi.h"
>> +
>> +enum lpass_lpi_functions {
>> +	LPI_MUX_dmic1_clk,
>> +	LPI_MUX_dmic1_data,
>> +	LPI_MUX_dmic2_clk,
>> +	LPI_MUX_dmic2_data,
>> +	LPI_MUX_dmic3_clk,
>> +	LPI_MUX_dmic3_data,
>> +	LPI_MUX_dmic4_clk,
>> +	LPI_MUX_dmic4_data,
>> +	LPI_MUX_i2s1_clk,
>> +	LPI_MUX_i2s1_data,
>> +	LPI_MUX_i2s1_ws,
>> +	LPI_MUX_i2s2_clk,
>> +	LPI_MUX_i2s2_data,
>> +	LPI_MUX_i2s2_ws,
>> +	LPI_MUX_i2s3_clk,
>> +	LPI_MUX_i2s3_data,
>> +	LPI_MUX_i2s3_ws,
>> +	LPI_MUX_i2s4_clk,
>> +	LPI_MUX_i2s4_data,
>> +	LPI_MUX_i2s4_ws,
>> +	LPI_MUX_qua_mi2s_data,
>> +	LPI_MUX_qua_mi2s_sclk,
>> +	LPI_MUX_qua_mi2s_ws,
>> +	LPI_MUX_slimbus_clk,
>> +	LPI_MUX_slimbus_data,
>> +	LPI_MUX_swr_rx_clk,
>> +	LPI_MUX_swr_rx_data,
>> +	LPI_MUX_swr_tx_clk,
>> +	LPI_MUX_swr_tx_data,
>> +	LPI_MUX_wsa_swr_clk,
>> +	LPI_MUX_wsa_swr_data,
>> +	LPI_MUX_wsa2_swr_clk,
>> +	LPI_MUX_wsa2_swr_data,
>> +	LPI_MUX_ext_mclk1_a,
>> +	LPI_MUX_ext_mclk1_b,
>> +	LPI_MUX_ext_mclk1_c,
>> +	LPI_MUX_ext_mclk1_d,
>> +	LPI_MUX_ext_mclk1_e,
>> +	LPI_MUX_gpio,
>> +	LPI_MUX__,
>> +};
> 
> Isn't this entire driver exactly the same as sm8450?
> 


ACK, thanks for pointing this out.

Yes you are right, the GPIO pin mapping is identical to SM8490.
I checked SM8550 and SM8650 earlier, but missed comparing against
SM8450. Sorry about that.

I will re-check against SM8450 and use the existing driver instead
of introducing a duplicate.

Thanks & Regards,
Rafi.

> Best regards,
> Krzysztof
> 


