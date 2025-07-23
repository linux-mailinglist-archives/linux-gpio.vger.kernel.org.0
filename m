Return-Path: <linux-gpio+bounces-23693-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BF3B0F1EA
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 14:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6C31540333
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 12:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5172E5B05;
	Wed, 23 Jul 2025 12:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8soRlhm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1F42E54B9
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 12:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753272443; cv=none; b=YIm/S+HIApnnoADJ0gIVH69WDKoEmcoAZ4BIuGT6/dxIfG9HuW9excEVWE1m/a0pDMZ/k+dDMZnDDHPKNr6PlhwML+ej5wszQZ7HD+VQ9xBjrayD5o+kHsQjcm+vJzzcraeZfgxyRXU84/MJdjMDFBhEi1uCXDNcvvogpw1aX04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753272443; c=relaxed/simple;
	bh=l7h14Ukiz36WSUCzAfQ1B5MfKsDmhlXkecfI4fzWztY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T0OlXy2Csi+neUmQmrYPYRkcfWUXpd7k17Ok4cGVz2KTBmsoXd6LH0Esb4wLwLHBpFmZUDEgt6lm5YNLEiRp0Csg2hzxQEU80o/lLejVmP0LIfwrAn/c4Rqg9/9SntKgt4yj0RqwEW+4IVhmvrBB1JSgiag3Ak6zoGA7IIUnPCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8soRlhm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9XLBe020015
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 12:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ghA/VS95zinQDHhXlbeITIgaSp5qFlupk4F14AhAmp4=; b=U8soRlhmuc1ef6CV
	mN/IJvlU8ogmLUzycLeymbxpm8aJGHje7tKHJ14C0LJO4kWvYXZ2fvhfS+HV3KxG
	/C8fEavtkSA/3atvmAAYZ0B+dfk95e1g3cLR4He6QqaVV7qrkHpPjTerEGjKu2QV
	NRIFYw0p+9btI2HiIq4YKnUAFnuzvqE4CInE1T4eVMNHkcfJtUHqSQqkwwySEvE4
	RdzWKb4CrsgBHey4YPHCMH11+HTPkyJrujhKojLqJlg27EKjqmQcPrDYaGJ7d+cx
	06BCukdIDa/ruZjxvbYlhHTH68jQklqrAA0GQZYDObw+9WwnvDjwmSO3xPKfHh9x
	Zhx7oQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3eqvaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 12:07:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748f13ef248so6188226b3a.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 05:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753272441; x=1753877241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ghA/VS95zinQDHhXlbeITIgaSp5qFlupk4F14AhAmp4=;
        b=tI6Z1HD9pyWoPY2TFiEVPW/VDBOn/ArqjXbwIdoD/Twm0VZLOFKBbU0LhY+jWAg9Tb
         Z9mp7Nq61mAjRg5zkgRwq7T09Y4XNvH+zrmdL61JDNcWPDhjPSitYuuuZL8Unr2YH4XL
         TaTkgOpnLuzmqrbtonGwukT4qirAt8E3CZURoGmiICKtnTEGB53CxHADh6Szdu3Z1RHf
         z9ca7UGcnkbKANzeGfsucAOQViBQiCxGZItU2eLjfaIwR4nGHqGPNniFqjtXiYfm0Jb7
         SUfWZNbYWPpPoJ1UsHuFXkHBsfW4Koq1gfgfvpjNsB9MfQLl94C7USdnkpsQRpzO1Izm
         sPkw==
X-Forwarded-Encrypted: i=1; AJvYcCVnW8JypevVGA9X1EMAInA6naLCenmFhNCCSVe33Ha/3ytzP0Tr7znYwcv2MFeWTR16UNQLt07pHwlK@vger.kernel.org
X-Gm-Message-State: AOJu0YwkyTP5ccwVMX3IdEg4QCpbDzDgYKHpwo04QwiSZPy3PZICfZjx
	j+qRoAhxU0qGBhFjnWHw96i/WWxgEPR46Umfc1DS6OjfY3VHnnNEbPFykEP740rEdV/5FKylwnk
	p5GaGDLND2J+U2efLihHgOQn7NS9jw+oWXw3wjFP0oAmloOrt0M6NqG1HiR9HC43H
X-Gm-Gg: ASbGncvO0BBWCW6vtqbirz8XsvGv1zOiWhMxiS8KSCqHZZkbYX/CyVjCHkRFT/9fMG7
	oE+nSTc6/Qzvo6qcx/qnrcuKPpllAbNoG23mnjQPjWvKuekycyOHL3rFjlrTWPqpxrm0/Q5FHEg
	qsU7CA67QZIuIz0NJZmauwhRVCkVQN1qucQ9/0fogO9qypn301c/THbrBv9ocQwJ7A/i+FJm4BY
	nWfz6ndjx5adX/hloAOMqawcd6JcD1XoCDp2lnLOoCcAWUXWOnB9djXMj1v60LXmabbrg5SN9Mu
	l57bDknFJdGRb8OmjEa/gb6K9BM0BOBvd6N/aSesPUzXZ8W6EnL9/JAwzWluvdDWykNtAxvHNcy
	S45d4OqwwLO3OnLP4ADKi+Md7fG0g3cQt+qklGpr7snokIHm3w+BfEg==
X-Received: by 2002:a05:6a00:1909:b0:748:ffaf:9b53 with SMTP id d2e1a72fcca58-760353d5d08mr3999938b3a.16.1753272440628;
        Wed, 23 Jul 2025 05:07:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUboQ8jvgpdXbLokFYRCm9swkz+x1eIWhQBORpRgtnNTRDZV/f+O4yVxWhMrDrPrbssQecVQ==
X-Received: by 2002:a05:6a00:1909:b0:748:ffaf:9b53 with SMTP id d2e1a72fcca58-760353d5d08mr3999895b3a.16.1753272440071;
        Wed, 23 Jul 2025 05:07:20 -0700 (PDT)
Received: from [10.190.201.48] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb155e25sm9630984b3a.94.2025.07.23.05.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 05:07:19 -0700 (PDT)
Message-ID: <d31c5e0f-dc50-4e7b-bd81-256269c82ec3@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 17:37:15 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl
 bindings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250723103644.4058213-1-pankaj.patil@oss.qualcomm.com>
 <20250723103644.4058213-2-pankaj.patil@oss.qualcomm.com>
 <70277682-94e7-4905-823d-25ae76f72ee2@oss.qualcomm.com>
 <790fd85b-fb24-4d44-bdb1-706c534d1da5@oss.qualcomm.com>
 <d37879af-a1fc-41d4-8e31-2abba6fd6d57@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <d37879af-a1fc-41d4-8e31-2abba6fd6d57@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NH-OxUvO18rTusYzALhQK2pjgYD5CcgC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDEwMiBTYWx0ZWRfX5WhCG4matKDe
 q7L/ulPp0z9OpiLumCb+NdmnzDELrPxgof+Bz3zYyfFHT4myVDC5aQsHtJMxPCHLe1Rl3agzFKt
 aOs2Lo/KjHq/Mp6ka4zxpSXBvWclbRvxNDx2dv0b2EsKFJGeYc+1j5JTv/vrS3NWCOwrzfw/G5H
 FJ02xihGE1F4APX0dCUwV8tgblvp4F9MW7/BSw6SfVv4xXJbvOvmrk7vkV6sZ7LLH0eFGB95DaV
 hsnHHpW3BFNc8L9jsBtpc5jQbCBJ0V9Yx3nDH33rAc5IUFv8HQoNhZjQ0i7vL/kcPO6dlsTRpPI
 9Wa5T0saMLfZa06hoGjs0PJXyryr5JBVg1dQIwk0Pj1U7GjDTbQ8l3caNXcDD9iRCS7PMPTH/rM
 PNbK1Cqui7N3sl2ejtTT2uNaytURocd7pWev7iO0z5NCGdkiFK1dcyFp7tJoopstmaeiVRfB
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=6880d079 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=fmhopZmm7R1C_NTn11oA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: NH-OxUvO18rTusYzALhQK2pjgYD5CcgC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=871 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230102

On 7/23/2025 5:25 PM, Konrad Dybcio wrote:
> On 7/23/25 1:48 PM, Pankaj Patil wrote:
>> On 7/23/2025 5:10 PM, Konrad Dybcio wrote:
>>> On 7/23/25 12:36 PM, Pankaj Patil wrote:
>>>> Add DeviceTree binding for Glymur SoC TLMM block
>>>>
>>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>>> ---
>>> [...]
>>>
>>>> +      function:
>>>> +        description:
>>>> +          Specify the alternative function to be configured for the specified
>>>> +          pins.
>>>> +        enum: [ gpio, RESOUT_GPIO_N, aoss_cti, asc_cci, atest_char, atest_usb,
>>> Any reason for           /\ to be uppercase?
>>>
>>> Konrad
>>>
>> glymur_functions enum members fetched from ipcat,
>> this does not exist for sm8750.
> I'll repeat my question
>
> Konrad
It's in uppercase because of the way it's in the driver,
I'll update only the bindings to lowercase and repost.
Thanks

