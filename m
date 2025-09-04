Return-Path: <linux-gpio+bounces-25570-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B29A9B43695
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 11:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42EF21BC420B
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 09:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98272D77E7;
	Thu,  4 Sep 2025 09:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8CdGFlp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB182D6E78
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 09:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756976726; cv=none; b=pKlbQdRiDLX5lck4KXuR/gcFD/jkkWfwKJEoZ8+04bi94riJs5NFwU1HvkzbXlOgW5do7UXNVnkDgSQ9QHBPL0nrc0M4jath724MyvGcXf6/XUYKMnjx+2fKXl44fc4k4YKlPJ6H9kPRPc1Kakhdk6JW16TwbDXMSszaLIBGVNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756976726; c=relaxed/simple;
	bh=plmPEpfQMO3YEjTyCXmuGh54NXSVgSjwnmBAsPAbVyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BiIyaqEpww97XHGVDYejUt3c2Oea0yXpbqMXik6bHVNWv83r+SIT8EmafUMJbwm3x2A7GLO5R9pZm/XFJSIGEweN7zY7SdhgLaSrQkxd/JVe2AkER/gxpzcDJRF/Q/y2JJotSA9B2OASQpkc6oqhLAsirPULgTTTfLVwtW9FLH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J8CdGFlp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5841V6mb016597
	for <linux-gpio@vger.kernel.org>; Thu, 4 Sep 2025 09:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y3354bZOtkc6dotBrNo46+kgtyiv6WAidh4XlD2eQB0=; b=J8CdGFlpYm23cM3o
	qA9PNlfuOuT/8H21G4e1agtfqjPU0sHk741L/txViUEOWwz8iCNFjhv9muUZ0wbx
	gaDTd7JeDpC0gqgImekJ4YiDCvqRj5eBmBlwnte8tCMHTWv2SNZ7SynLJdCLulPw
	N4uHT+qhQQJGl5cupih1yGy/TVqCpGUI1LpIXkNBeIPDgbpyx4qAV+ONX+SNn1IW
	KvEG2ZB7fh4HHi2Qj8E56l+YdrKbt9h3GtDbK0UtHQOv4U5/vBQ5omax5XVtS43I
	kF6l6bo9Tb4kbIbCGd5vaZhQxGdtrLfutgcTogjUoB2kUGnPi8pTc+t0vyTM6347
	oOUQHg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj3edd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 09:05:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b33e296278so1338921cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 02:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756976723; x=1757581523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3354bZOtkc6dotBrNo46+kgtyiv6WAidh4XlD2eQB0=;
        b=EV3mg774VgZuVoYMODXPSDHT41gSbxlmAiblJ1I5wIz0Wu8H/xNL0l/t2xb4M073iZ
         1GphO1vEU7qFKo3wRYXj7H/05/XqMQVpcNPTqakiZ6XLrk1cDLQ8Rn2DAsZBmQ9E1HbT
         epeXzXDzQ7BgGNsrgT8cnfIt4rFptRoYLHCtL4U+L1FcyeT5Mew5r17BtWwHbafypF6V
         jSNCmGonP4+jjoH4l8esvROzjvnpW7Lw07Fi72rwlZqeqfuZS4upySPOyGrqVrA0O5eF
         lGjjWE/Tb2MzlxlB8vK/avJm3lbQBiEzaQJOltJ2C77QpHEXM/LvtdaHslrf0pQlkwY2
         B5Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWgZ7dMiIYvi5FUuZK5+zhxzpe9VSuMCmZvXQ4uIzeuWUr5Svhg5No1U7WEXLmuVx6QPIVQmFFIdOqv@vger.kernel.org
X-Gm-Message-State: AOJu0YxHKbBr+FWklD/RxlT4nYWEtPPQ71C5Cgepp0B/rmFAeVb+m0IL
	G8KlqgKPRo4LIsoslK9GIHVXTR8wSb2bCOoy/ENK2Gi/jOHUg2hIswBVWarm9pGyhnOrKsswuDL
	WOxYTQMb9wcCMMxoHPm7Q1ENQzO5HNqcpGpmmMdn7QETiiINc+ihODnTSCKPLw7GPAZxZvQ4H
X-Gm-Gg: ASbGncvrxrfe+X8MALFyfSHnvTI/noYFwZA0880Jae1bMM+dSQKn9NIj0Fr8+wGnA/t
	KdP0mkpnxDGT2dugURrQSngmXviU7yYWjVrYWsF0RrrObn0MArePFHRoRMsK71De7AapqQzMgOI
	AUpqM5TytqfkAucLVnCuzywGmRobSu2wCMiOFBzyKkajiomFMeUgMyOMI+wNhRct/P0zFr1DKId
	CYwWjWKDGZ75r25N2a2rrEPq9epuMk10ThWMRnDGwvWdqEh9yk8S4e2m079woOEyumu90PIZr4C
	FjOJldRz7nKcAB38QlAFmoaiOdpvNt6MrTzxTRXUz56nIihIWNPnQLh71p+iwr4kABJcR7QWiXI
	yNbj8LSokxDwvOZSylTqyEQ==
X-Received: by 2002:ac8:5d12:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4b313f0e6e7mr174872761cf.8.1756976722789;
        Thu, 04 Sep 2025 02:05:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKp0JIOqe7KcHRuwNbMy/T1sz594GUnF25np1+U7x9aNCZ0OMz0fmzvg55AOLuXRjrIcc7gQ==
X-Received: by 2002:ac8:5d12:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4b313f0e6e7mr174872511cf.8.1756976722305;
        Thu, 04 Sep 2025 02:05:22 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041f6fb232sm1089893966b.87.2025.09.04.02.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 02:05:21 -0700 (PDT)
Message-ID: <da1781f2-448e-4236-8af2-d2ee0744f588@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 11:05:19 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] pinctrl: qcom: Add SDM660 LPASS LPI TLMM
To: Richard Acayan <mailingradian@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, Nickolay Goppen <setotau@yandex.ru>
References: <20250903-sdm660-lpass-lpi-v5-0-fe171098b6a1@mainlining.org>
 <20250903-sdm660-lpass-lpi-v5-3-fe171098b6a1@mainlining.org>
 <aLixvcgoRIHoniv-@radian>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aLixvcgoRIHoniv-@radian>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX9RLBiPgwwXHp
 +im5xDbSLH/1kRxShU48fcCZkn/oo+KNheB5kU21aj6AkpYiVA8govl14xUyg51ORj5dN3NeF6W
 oless/y+r4lgjyhnB7QCkG2OhhsJ8RtNnI3lhs3bsHoHoh8PLZQmYp0GkQoJaEk8v1yHN7//Kr+
 UxSfb9LQzwcb8ctEncrupyjwv1Wrgww0m7qGc65fPq3MLIA+v4Wyn9HUB9Y6kTcRUFsCdjoEcAE
 pS+GqwxJ8/BtlCPdhE9ESJ2jHkJjfXvNnuggn1SmFcbibCPemTL2ujdLl/Le0fnUC38c50WD9+G
 8xi7+awmro1MsaTZi9T2zwUtAlq1ViNZnkteywG5muWFkRoWIMc47wubzrjKCzrRCZKIPstme2y
 M12gp1aU
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68b95654 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=pGLkceISAAAA:8
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=cKVQg8D8wNGJnLBI7BwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: 16CBlrSJfINIDeTxN7hr60o8Qt9LxRs1
X-Proofpoint-ORIG-GUID: 16CBlrSJfINIDeTxN7hr60o8Qt9LxRs1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

On 9/3/25 11:23 PM, Richard Acayan wrote:
> On Wed, Sep 03, 2025 at 04:39:03PM +0300, Nickolay Goppen wrote:
>> From: Richard Acayan <mailingradian@gmail.com>
>>
>> The Snapdragon 660 has a Low-Power Island (LPI) TLMM for configuring
>> pins related to audio. Add the driver for this.
>> Also, this driver uses predefined pin_offsets for each pin taken from
>> downstream driver, which does not follow the usual 0x1000 distance
>> between pins and uses an array with predefined offsets that do not
>> follow any regular pattern [1].
>>
>> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107
>>
>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>> Co-developed-by: Nickolay Goppen <setotau@mainlining.org>
>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>> ---
> 
> (snip)
> 
>> +const struct lpi_pingroup sdm660_lpi_pinctrl_groups[] = {
>> +	LPI_PINGROUP_OFFSET(0, LPI_NO_SLEW, _, _, _, _, 0x0000),
>> +	LPI_PINGROUP_OFFSET(1, LPI_NO_SLEW, _, _, _, _, 0x1000),
>> +	LPI_PINGROUP_OFFSET(2, LPI_NO_SLEW, _, _, _, _, 0x2000),
>> +	LPI_PINGROUP_OFFSET(3, LPI_NO_SLEW, _, _, _, _, 0x2010),
>> +	LPI_PINGROUP_OFFSET(4, LPI_NO_SLEW, _, _, _, _, 0x3000),
>> +	LPI_PINGROUP_OFFSET(5, LPI_NO_SLEW, _, _, _, _, 0x3010),
>> +	LPI_PINGROUP_OFFSET(6, LPI_NO_SLEW, _, _, _, _, 0x4000),
>> +	LPI_PINGROUP_OFFSET(7, LPI_NO_SLEW, _, _, _, _, 0x4010),
>> +	LPI_PINGROUP_OFFSET(8, LPI_NO_SLEW, _, _, _, _, 0x5000),
>> +	LPI_PINGROUP_OFFSET(9, LPI_NO_SLEW, _, _, _, _, 0x5010),
>> +	LPI_PINGROUP_OFFSET(10, LPI_NO_SLEW, _, _, _, _, 0x5020),
>> +	LPI_PINGROUP_OFFSET(11, LPI_NO_SLEW, _, _, _, _, 0x5030),
>> +	LPI_PINGROUP_OFFSET(12, LPI_NO_SLEW, _, _, _, _, 0x6000),
>> +	LPI_PINGROUP_OFFSET(13, LPI_NO_SLEW, _, _, _, _, 0x6010),
>> +	LPI_PINGROUP_OFFSET(14, LPI_NO_SLEW, _, _, _, _, 0x7000),
>> +	LPI_PINGROUP_OFFSET(15, LPI_NO_SLEW, _, _, _, _, 0x7010),
>> +	LPI_PINGROUP_OFFSET(16, LPI_NO_SLEW, _, _, _, _, 0x5040),
>> +	LPI_PINGROUP_OFFSET(17, LPI_NO_SLEW, _, _, _, _, 0x5050),
>> +
>> +	/* The function names of the PDM GPIOs are derived from SDM670 */
> 
> Not anymore, the names now match the other LPI drivers closer.
> This can be removed.

With the comment removed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

