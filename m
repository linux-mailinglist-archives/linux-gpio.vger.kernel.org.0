Return-Path: <linux-gpio+bounces-28723-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F9BC6CC80
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 06:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id C060B2C043
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 05:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C55270EBA;
	Wed, 19 Nov 2025 05:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Va3ObGAQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ijQwNs3s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955A419CD03
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 05:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763528525; cv=none; b=fDHgvV/NESSQ0aJhHcEuSpx9TwX5q9JJ9O9cieRD6kB5JD7zUbriTxGy9mxF9g+dqCiRUpXx1OIOanrLNw+7C6x0/7GRfizn4tF0bjbfSn+O8a8tUDJLszZvNl1VC5bI7WelneFSrRGMBFD0DMhAX3431DeDVzlpx9YcQ7ri070=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763528525; c=relaxed/simple;
	bh=SkDPb7JF1wbSbOailasNv8LOqVqSAWaBT47PG7LF3sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hv9p+Bpoywuw+4/gtT+rKzCRp/JPo3ATJIBAUcndKrnEyEDM10GP+Blbo1ilQsqckSGrTzkmvi4ahYYx6ry+69jUH2gNiw3xZxqj4mg79bPH7Eelz4iw/JzDAqRMnl9ndFaGqC4t8o2beQKBnVq0EgZiPxwEFk/GkvO7o45B3dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Va3ObGAQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ijQwNs3s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ4XgiX885023
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 05:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5NqIgx2P5nS26/g9jgskIxQbUIoH+MmlLA6OGcwLQ8=; b=Va3ObGAQhE7IG7+V
	8fVr5FNmrv0qdE42+P7m0gLZ3EnxQWzW5uIzPnrzVn3CAGHk2YQPG1mkW3dxf3kv
	lW8TGEB3dctlU2J6uw3v8PEi8jl8UJF1wlSvny2aJU94Q6IetegXwxMugtgxOh/D
	syZZI9jldW6Wx99cC7me32lyLRd9SxhKj98cifJ3i2SrkuQiSXm2hFTKJ+GXGrLZ
	+UBreJDF2jeMe5HH6H+uTZ1nduC9jW3ST7c8e/tfLFxvC4M/dX1gySBBFBoK1sO/
	HKZlB8gDY/BB7IAfH4M7eHGiqp5o8xvnB3jNV9LnTDV7pbq0KS0ZS+Ex3YlcnvRG
	8dKQAQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah6yq821p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 05:02:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so9130850b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 21:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763528521; x=1764133321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z5NqIgx2P5nS26/g9jgskIxQbUIoH+MmlLA6OGcwLQ8=;
        b=ijQwNs3shhjtceCFJ5YxrQJFwJQAO0uxx90aQIaalpq70H+/M15rFIPZuBop7sH3sp
         tzT91OGFNJN4FRpPXZrlVcA9YyW2LA4K9eJxcJZOaOY79Pr2cdr/kNvBAeWbZYEKcqa0
         EqMYYkkFpCuhwGcdGy+SOM4yYAc8seezjRohw0ZPX3P3xP1/b6Ut8aqsVxh3o/Ifzwox
         GmiB7kx5l8fsjsEu1xM2QJVxX6FxBWxGkHf7naF4e5cctT34Cjc3lNwjFfmytvPL7pK/
         3o353n+NiDRjjjBUnNN3eTFHa3hGRspsXTPjJgcI0U/NNacjTyXASfq2Kbp0IixUBhut
         bjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763528521; x=1764133321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5NqIgx2P5nS26/g9jgskIxQbUIoH+MmlLA6OGcwLQ8=;
        b=JASsyOwjufIkzKhbugzTcT0nNM1sqcFcYAFQyLEVe4m7hL/8b5k4Ys+ZcZm/k0MM9z
         3XGLgLaYyfaQQj8Ye9dp8OXrlyXjguLBE/BvIqw8BdWn7Y8D+r2GkVAHvcpldHXi9XWD
         rrkish/tBIlaMHYMdf2UReWOMazONa1jwF7vCj6Fi6aYc7cGH0bn7Gx9LoxgZrxx4Ebo
         kQxxxfAB8TEADFQtHtjhE9nTY/siMVNp4R1raVmUZysEict7U0zM2+p/ZhR4GHLXXleG
         aI0WQl8+LSvBuQFFpQrYF9Dl8RfwDabeII0rV6WrFOflcarrcZpJ16rCkDgK2VhX4PBq
         WTGA==
X-Forwarded-Encrypted: i=1; AJvYcCWhERGsoF9Ws1/jMMqKT7ZiL53lDUDKkI3HzjCVjsfoLrgUIXimZmTOLECEQrvtGkOHDl8PG3B5f97B@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7kX+w+4B065EUWZzm4uEgqvlFiceMtQafrvW2H/bhdMLWHcb0
	Els4sB/JCJnhG7itJR/dhbuZYm1OjY6epTyNPrTaKw6aufYlmvXDcpjFd/Z/fPKKZ317T4moZpd
	uAApywJ/QDVTxqbDOKqmqvdzPQ7gI7gGCiAPFf4WHIwIyX/hzJ0vWIJzkfLUbwIi+
X-Gm-Gg: ASbGnctMvZ9v3cUgSOTXTi2pLSKfvQz84ZyLIPfyfGlW+//v6aPke3lhs/eO7o97x+A
	Ce3EPP06gRHho5Bz3NxiJHbohG855M88QGALXr+E4i0jGAsISfw2d+9oicyW6bZKx2W/fe6RRDV
	PsldrE96+W6JQQHI2Lawqj5opBvu+FouDdoZpjlad0XZSOEZF+ZVA/HxefitK8arj8JN1NWRhOk
	Af6bqvCB9kZlOv0NKqs51pZMr89iLlXvp/ACVOpXsf88Fz8/3lDdxjxTbVu2zC/L6X8yI5VSSST
	TZG6hPoHuk+jQpN5Y02U9GzddW5K8uI+1Vla0J8SFWVRbYX6+sl4x7SYjcFEE4FkaiiDWmNnukE
	Aqu7gnh5vkQsRkBdB0137l4/lYkZtBd23Qdui/kz10aJVXw3G
X-Received: by 2002:a05:6a00:1407:b0:7b8:b1ff:be51 with SMTP id d2e1a72fcca58-7ba3be8c4f5mr20546302b3a.18.1763528521508;
        Tue, 18 Nov 2025 21:02:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH063BKmkkOWeo4TjNaTNBDPjwkkczHRvzPlsft60lCBe6xwb6sabiu6gIU78Nf2irU95uk7w==
X-Received: by 2002:a05:6a00:1407:b0:7b8:b1ff:be51 with SMTP id d2e1a72fcca58-7ba3be8c4f5mr20546272b3a.18.1763528521040;
        Tue, 18 Nov 2025 21:02:01 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9271505acsm18149433b3a.35.2025.11.18.21.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 21:02:00 -0800 (PST)
Message-ID: <9a7ead5d-e8b8-49bd-883f-575f7eb22b78@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 10:31:55 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl:
 qcom,sa8775p-lpass-lpi-pinctrl: Add SA8775P LPASS pinctrl
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        ravi.hothi@oss.qualcomm.com
References: <20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20251116171656.3105461-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <8a2f9708-6f3e-4c4b-942a-8df7b4d6e127@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <8a2f9708-6f3e-4c4b-942a-8df7b4d6e127@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iphOs_ErqbzeQ5F8rxrHLlH8jbTuz4Qs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDAzNiBTYWx0ZWRfX856xHWlBmuJA
 xECegqU3BT0UJ7WyygUx/c6Jj4wtnKDwSiL7SRgYOeZ1ArmXO/4xydBL8k19OW9tqQMPJnvNxQh
 +qxle5+uNjWH7Ha0GS3u6TuH7SK6N7LB4og4xML/pWtvnnhUh81IBlnf/EPLxk8GyMax3JK/qkJ
 MlpnMm/dtx1ySV5ij2+3y1t7ffSxgsNowQTRgtuh5fIxR3qDB5JeUBXYb0Jji47mpaFZ8WYKb66
 ATvJy5kcsSuJ0MfgZWOVf5Zi4fml/XTpHedVRNg0RGDCig6dYWar8Zphv9JjaHzsiKzkw83W6he
 EWlMuLOE0V4ovYrCxI/f6ZjjObTn759xRFAYYdjDIR0oNya4rmMpXuR0Dm2V2xZ5abJMgfG/AfL
 /1QByOeT6iYjmFiwss61JLckble3VA==
X-Authority-Analysis: v=2.4 cv=Ut1u9uwB c=1 sm=1 tr=0 ts=691d4f4a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=pU8MzpUV3DlFKexVmMUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: iphOs_ErqbzeQ5F8rxrHLlH8jbTuz4Qs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190036



On 11/17/2025 6:14 PM, Konrad Dybcio wrote:
> On 11/16/25 6:16 PM, Mohammad Rafi Shaik wrote:
>> Add bindings for the pin controller in Low Power Audio SubSystem (LPASS)
>> of Qualcomm SA8775P SoC.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   .../qcom,sa8775p-lpass-lpi-pinctrl.yaml       | 106 ++++++++++++++++++
>>   1 file changed, 106 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml
>> new file mode 100644
>> index 000000000000..01a56dbeaeff
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml
>> @@ -0,0 +1,106 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SA8775P SoC LPASS LPI TLMM
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> +
>> +description:
>> +  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
>> +  (LPASS) Low Power Island (LPI) of Qualcomm SA8775P SoC.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sa8775p-lpass-lpi-pinctrl
> 
> Are the mappings the same for monaco? You can preemptively add the
> compatible here too, if so
> 

Ack,

yes right, Lemans and Monaco share the same pinctrl mapping.
I’ll include the Monaco compatible entry as well.

Thanks & Regards,
Rafi.

> Konrad


