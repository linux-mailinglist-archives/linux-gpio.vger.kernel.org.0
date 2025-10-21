Return-Path: <linux-gpio+bounces-27379-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BF2BF6B38
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 15:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B719050392F
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 13:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14886334C13;
	Tue, 21 Oct 2025 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHYh3WfO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2826E334C38
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 13:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761052444; cv=none; b=mkWa52f32XvOhZA4/g/DhPH6xjV2eJfg3vQZ/76PWbzUl50Tz/wVq9ls+joQYRrxKl6xJigWmnwzD95vR97+hiX7ZFIvSsBO3YIVHB8BXObXyKTqQDkuuYqRDZS8uZPB9g5Gq2jLebGyXHRWfp2al52FHZr0rrHUoMTt7F6VjKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761052444; c=relaxed/simple;
	bh=w2i+FxONBXXx3PvM+d1TKTp00ehfZPIgAaTK1j0wkl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WKrwan8ZBNwx5zXGOJG2nv9LO7h2fB+nudCCf4MaBsLTZEjwb3y9vIp0EFd2ikKa9q0BZultYm8NwUVXKUqTyTyIkrHV+qvvg/sh183gVvDxX6x3WsECI7TeSNT5nKYDlSA6m2JTNZOI3Am9PtViP6vBHT96BBg22tDvVbvRDE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHYh3WfO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8PM6B025592
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 13:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1J3FwMBpLhx8fYWCDWyhBCXacIdXPm0xifRPcXHEaJ8=; b=OHYh3WfONtQnQIWN
	jqNqPFtwtmIP6JuNtltLlO5uECBdbthXS+cv6w0vMPNXrYjgT5OBozJ9FUOWeSF3
	0vVU4zQyf1ABp5ByavV32Z1Yw8QYcFVMMZQMOgSJA9+/jGsbkhevmCz1xVF5rt9D
	dmYUdrckZy/8d/BHg5/j5SvzlJqXwBM9xwMWTRywIVniZ9uSD72wA2TWzyVaXldO
	Tf3ftUzKy/lwH3jKzWcQskpsraeuzVDqItzYJ7YcrrwX54OoOgUSLzxcJ7Gv5yP4
	6jEIIbojQtWjgzoOTtbed8Dg4M/+TVBqcFR6yV0WtdZDRRRDfkwF+rweUBiPzAld
	o4uFRA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w80u9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 13:14:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87c146f81cdso145728166d6.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 06:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761052441; x=1761657241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1J3FwMBpLhx8fYWCDWyhBCXacIdXPm0xifRPcXHEaJ8=;
        b=CQRvE784LfP06bF57041MDsfjQmEzeGwjGUk7LydQcdqjZWvxlr9z0uNipsHAFOZJ6
         LdsDBAc3eXosKk7JaBLwfoiays9KrnOOgdrs69PWUiPYuGUubqBwqVHD5FBIxicu4d1B
         URA7iQGtVfi9wewDD2w1pQNLuyYk2VF1naKDzfjSg786fTX16eHPzhxY5dmppFgOTnqe
         gD09NLAwO2N8ez5+9Du44/nvhJl4AA4eoYVf63IcDGsfzGD0JIPQlqMD3CIP1nlhARff
         Qnmk3iAZ8tLiAqy1UqaH8dZnw8XzpoKIcTuQs/Y+V407ofOnmqvu6IifscZj0+Kuz0Ec
         5+qg==
X-Forwarded-Encrypted: i=1; AJvYcCXhUFHACiQwrB0jjfcviFjyEYFUsPS86T4EOyF0BgGOfjXoJIeoxh9I/gvpZht94Z/bCbnibVhjhdhx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7e4hWrOvJsYsPSKf1H/1RnUBPIj+qoqGp0hVicuCcjTi/27m0
	ZYh/SK+g6gD1FtiIeQVodmiLaOdTNUZ+2hHejHUh9hQQonAE0Yd/1epEKUZN6+CPiz7UWkrlB3p
	0xd9NouNJPBXWeFcDGuYhpb1bZqlF6XDUfGxJFmRuyLQfNut7nTzxpfiWYUUb8arZ
X-Gm-Gg: ASbGncv1AHE8hC65as+3blBMdW3bF1D5xk0+/AinlgnlYJ5L1ao8/E1krXfetyoQwLe
	uAhf1gCHQBmdalQbH1MrbYN7kzUCO/HJ/a5GvsnvqgiZIJ2cIwP94iVstDdt4zOA1mptjw5k6s+
	SQhN1MBaXbLD35S8iQpTn2bwqUBDwxSwwnQkOCfBVxCDSVq8mMJFnn5znYgdYoG6u9gsuEXcIxv
	Q6gY1NO87W2J0A/36MJYjCmw6g3ftFI7fLPzYtSySVyo22Tx44C+bxZmi1BUcpOwkC9lhf2Yq+6
	vdV2i21Hd5v4chB3gSQY2jA2qEmcC4rgB+R090xh69SEsrYn73CS1J+yDPMoRfP9khg3OovQtG/
	jV20dz3aIvYySoUsXZCO8dy1WzA==
X-Received: by 2002:ac8:5fd0:0:b0:4df:a3f1:2b41 with SMTP id d75a77b69052e-4e89d2f2d22mr191979421cf.37.1761052441079;
        Tue, 21 Oct 2025 06:14:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMR85aYmO0SlEiPplaQeeABFnTh46S57hFvtLZYcoP7my3aQJA/qcKSdNST7j3T+8HnZ1Sug==
X-Received: by 2002:ac8:5fd0:0:b0:4df:a3f1:2b41 with SMTP id d75a77b69052e-4e89d2f2d22mr191978891cf.37.1761052440479;
        Tue, 21 Oct 2025 06:14:00 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-474949e0a3csm18730905e9.0.2025.10.21.06.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:14:00 -0700 (PDT)
Message-ID: <450cac8b-598b-4f47-8bf0-43c805038e7c@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 14:13:57 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
 <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
 <b6223af9-2d9e-4ccd-b297-79f63167242b@oss.qualcomm.com>
 <DDEN5NSLDIHD.C1IELQW0VOG3@linaro.org>
 <zmi5grjg2znxddqzfsdsr35ad5olj3xgwwt6hvkiaynxzm5z33@gsgrdguj563n>
 <DDO0LYS7UTEW.3A9WGTAA5DKVO@linaro.org>
 <56vmqgrjy3je7omzirxnfxtuocebbj356iaew5thgkagi35464@hh34y7efssow>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <56vmqgrjy3je7omzirxnfxtuocebbj356iaew5thgkagi35464@hh34y7efssow>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX2r8qRYg2kTd1
 ihpDYVWIIfD3ygjgdPOmnT8+MVAKXTdkdpNpTqjPO6+UJBGWZowxmsc9h5S5afQN8ZxHA4bqhT4
 6u2XuO6HZbSZWz4zSrSNDuOTBA1dQrzNSxngoDrxwi1ZXHHe+C14Lwt1dmW5WYXEz6Z4ZzrL9g2
 OGI0JyUnH/MbWXH7Bykn+KC868XFK0f8SFVl0259diArR92kp4f8BFkMZVlqqY8wTZw2WLurf4f
 onJUbsTvThFczeIlBWWu7nC+RinG7I2hxY/ond60+8tHLfv3tJwV/c+OhwNP1yTSnVADX+q0iPh
 Gqbkc8QuLTqbmtlqslbiKTgj1Q/dsxp/lvSwDwj4g9sv4F/I7OYhURKM1ugCI+xX2Vf9zM4Rn3U
 UW/EmgXj/jOayMSbLQsEi3Evyj31Jg==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f7871a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=S47CMrjrQcjTfVtel-AA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: OREp0MLVv6MiKLAn8X5ogR3nxLzzogUg
X-Proofpoint-ORIG-GUID: OREp0MLVv6MiKLAn8X5ogR3nxLzzogUg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015



On 10/21/25 2:03 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 21, 2025 at 01:56:09PM +0100, Alexey Klimov wrote:
>> On Fri Oct 17, 2025 at 11:42 PM BST, Bjorn Andersson wrote:
>>> On Fri, Oct 10, 2025 at 01:29:38PM +0100, Alexey Klimov wrote:
>>>> On Tue Oct 7, 2025 at 1:39 PM BST, Konrad Dybcio wrote:
>>>>> On 10/7/25 4:03 AM, Alexey Klimov wrote:
>>>>>> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
>>>>>> controller device node required for audio subsystem on Qualcomm
>>>>>> QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.
>>>>>>
>>>>>> While at this, also add description of lpi_i2s2 pins (active state)
>>>>>> required for audio playback via HDMI/I2S.
>>>>>>
>>>>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +			lpi_i2s2_active: lpi-i2s2-active-state {
>>>>>> +				data-pins {
>>>>>> +					pins = "gpio12";
>>>>>> +					function = "i2s2_data";
>>>>>> +					bias-disable;
>>>>>> +					drive-strength = <8>;
>>>>>> +					output-high;
>>>>>
>>>>> I.. doubt output-high is what you want?
>>>>
>>>> Why? Or is it because of some in-kernel gpiod?
>>>>
>>>
>>> What does "output-high" mean for a non-gpio function?
>>
>> This is not efficient. It will be more useful to go straight to
>> the point.
> 
> It is efficient. It makes everybody think about it (and ask the same
> question in future) instead of just depending on maintainers words.
> 
>> This description of pins was taken from Qualcomm downstream code
>> and the similar patch was applied (see provided URL in the prev email).
> 
> And we all know that downstream can be buggy, incomplete, etc.
> 
>> Back to your question -- does it matter here if it is gpio or non-gpio
>> function?
> 
> It does. The I2S data pin is supposed to be toggled in some way by a
> certain IP core. What would it mean if we program output-high? Will the
> pin still be toggled (by the function) or stay pulled up (because of the
> output being programmed)?
I2S lines are configured in push-pull mode which means that the lines
are driven high and low actively, am not sure why output-high is needed
an what it means here as these lines are actively driven by the controller.

@Alexey, what issues do you see without this?

Am not sure if pinctrl driver even cares about this if we are in alt mode.


--srini>


