Return-Path: <linux-gpio+bounces-33504-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPt3EiHUt2n0VgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33504-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:57:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AD5297891
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E34C3090093
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C4B3909A0;
	Mon, 16 Mar 2026 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMNRTUwm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VlL2B0Ol"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CA139021F
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654416; cv=none; b=CTpyHekwomcgOf8ZMZhzghyIzDBSrL+jkq5N8vGj86JdiDbACz70FADKO2Ksk5iXx0Rykt4YH6wNI4l4Y71PEiFsqnUNhJ5p7chTMeaFocrnkYQzLoXPX7jukaX3qYIDTrKQZwofpbNN1IzjEdGhsw4SMUTngBH+yLeUUqhuDzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654416; c=relaxed/simple;
	bh=5GAIeFCS0uUPv2PKBNS/6Rzen3mfcjnDIRp5SqOEd4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksI4Ga+GC53yy8vpoWg3hFl9XmQEnDOFAHxqxDCkbSrgQ56SmpfGDDML6Jg0msVVlEe64SD2IXotqPcXwNTAY9aUkzNed+Fb4lPF9Xnv0vZ1zOCMFwv4lZugQuckmnf7SkQFyrfkzYAtQWkqSKVTD+jX07iaep7Dd2HiwUwhUQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMNRTUwm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VlL2B0Ol; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64cH42583313
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xGZEmgt8LPoPXTKdramnEFd7yZk6ZE7MCzHzNUdrRCE=; b=AMNRTUwma2/9IaeH
	bhQbeiAOg6wVPg+ZoBY3OsJG18ZcZBfk7PTWVMNihK04XX8qfQ9e/1UGleaTNLVu
	PFVSxBTBwPXD1vu8TzOSue0qk3xB/egG3rvTqE6C9+0sTixg6dgloz9+aU5fga7r
	zIO2TCs7GJohbO/gFOWsiges1KCkuVy7etOnDAPMcrulHg63jpSl8Bs+SaSA9eCQ
	ZK0O63a9WuSEhBBSEMR3Oz2hl7g/kT0epWeU50EPS59X5uO7/vcmR0zmOX75NWEc
	cP7V3bc8DcQcEKLkA2g3A5RoET2BmGQC0MrvHu40CwekY2tR4pd7br6chi9O3xUB
	TZxJVQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0ecd0c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:46:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a01982dc5so42379716d6.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654413; x=1774259213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xGZEmgt8LPoPXTKdramnEFd7yZk6ZE7MCzHzNUdrRCE=;
        b=VlL2B0Ol3dngjeW5xO3YCotO9cWt3Z7eVQ1jFabFA9ihS+ihCcS+lwrYJO7dzKtt5w
         b3qaqVf6X/v13B7M8y8/zpyC0PJQ2mW/MtuHjYOA8cS3Lt0VzT7eXMtTB7V0TZvFJDoD
         qg0ajbAGype4P5LJY7pASOvE8n6ll0YS7u8tG6MzS2o4dhWaPGznAVSctTTNpfuW9bwv
         DGV/pmkdwPhOCgCiqt6p/abEtI9RElMgnyewRjifJoMjuPABtbRl4RtLp+8d9Jby3Sfq
         NrBP0Nbcw0Ovt2UwVnGMmpI7jLHBi/MIJwOuyUizd0D2ihZRMwjKddCcdS8N4YqtQ1we
         MlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654413; x=1774259213;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGZEmgt8LPoPXTKdramnEFd7yZk6ZE7MCzHzNUdrRCE=;
        b=TSXckJn1hCh81bxsLrhJoO5lIYcA12yzW17tjZ4KKM4wu7W7ZbcKJ0fjmlx7Yqbcpi
         jMM/NTX0U1SIoAWbcZpB3iaWefaNNBfJ1986wli/1JcujFQjqBF5pUR2o5eda7pok71y
         GEqbRzbskR3xczqhBplXzKQ/yQIhSA+M7FFdg6jBpOwh+2G5dUM/DRJ1LyVAStAGQwFY
         9YsDGgF/c58Q51dQKNFALqFcJjvoFsxH9E1njJSOkXg/a0srYIqTJO+fKqTDX5Fi5HDK
         LS3RHvJofdOIX6gAhpkdyk04ZmXFkDJfQB/l5z4D3kDUqW0h9ykcwe6icdsqQW+bNbly
         rCOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6Sjq9zgRy1/aA99w44W7DBoKXs3WaPYm53z9jq8/cF8Eod14eTkJdEsxhf5t7UCClYLPVYNVdnR0a@vger.kernel.org
X-Gm-Message-State: AOJu0YyczAQAupENgpyxG3fW3sxwGPWOuDlXPHimSO/VIqtj8y48o49L
	ethJr4blNN0fo4owSTRSTxQb03bZTt+0zdr2fBMoVeWcWM4AZ1ZLSSH9OvRHMvZ+hB0a0uGlrB/
	Pp2KhaLoKvAXIWLsijGKVrFUL4IW/EEiBG5GukY9Yol5vu2Zs+WSumV9aXk/SD39D
X-Gm-Gg: ATEYQzxATIHqd+KrTmYBpsn4yjDMVYbcwmyXKFzpqqBkhuojA0p1XmfTeGo+XJgJieI
	P8+80K9b2OBwpxi/X1QrMnPY53xVK3C+acqQvuU9i22xYSCvRdxrL3sFH8TobSG0Atntqa0JJRE
	2fyaPyhEvItWRL71Uc9R3k3ykuisairYpoPnPGlbq2qXQRHl/BfiuCKIY1/hcYxazN1JUgleb7c
	HSVYnkVn9ZFfIjlfTu8ODDXg8vYzDLf+1MzMEgqH3eMW0FeoenkNtE3knKLbvnVXnVpoW50zwhB
	q/WXhMv2ZKnHjLuOrWCKgSoPcL2w1TJmurN9tyB7uwh0O8XupnYB6xQLXHUfdyop0Zuj1CMSe4t
	Ypk2U4f7OUNPGe6pLSZnosA3zL0QSg6jtB9VFmYtIw8Kz/xzHZSwQoXcTlh+mTkIJiqUeMOj48L
	buPf8=
X-Received: by 2002:a05:6214:601c:b0:89a:6263:feae with SMTP id 6a1803df08f44-89a81cce148mr121904476d6.2.1773654413454;
        Mon, 16 Mar 2026 02:46:53 -0700 (PDT)
X-Received: by 2002:a05:6214:601c:b0:89a:6263:feae with SMTP id 6a1803df08f44-89a81cce148mr121904266d6.2.1773654413056;
        Mon, 16 Mar 2026 02:46:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97ae89ebc4sm237981866b.34.2026.03.16.02.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:46:52 -0700 (PDT)
Message-ID: <c89449b8-f28c-4364-a1be-5267f0d99c01@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:46:48 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] pinctrl: qcom: Introduce IPQ5210 TLMM driver
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-4-fe857d68d698@oss.qualcomm.com>
 <05a1dcfc-7df1-4b20-a504-468814a87b3d@oss.qualcomm.com>
 <1eef0fc0-d33a-452a-9da5-3d0903b1712f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1eef0fc0-d33a-452a-9da5-3d0903b1712f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xPgI5-CR-aA4Y9F9LibcgzNyJobmqvoP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX/bdKmK3qMcZZ
 vCphx8J0TniSBnFgigTAhKGfKXwptuhIDvSS0WFfqAmmo6MAeHvUok5+AHhdxri/LtiHc3HVzA4
 WxGrgbJPy5bIncJrhmgGDNo40xzQM6QmZLAy1J7KLoQ9R4H3n3ZwsaS4I9+LKgQ+8+QQR/ZEE8u
 ygQluvM5vvvmv55dO9gszz2xG+kIgxuNWi8jHE1Idm2+l0u/DUMcuzr2tUR8yOBScY2FGaQnqn2
 Fpw2/JOxRwVL9pZPON/f6D0dIcptJvzrKlxT4S4w7i/Tm/kUdymZ9D/6EFA/DwvnPp/ghUl0+ui
 98Qpdt14b0Pm1SgugVdACa6O616wMOSGZtelIomyzX6M3oa1T0HyW2ojVdABFnfUhTnmyeL8lFI
 0VQkIXKX7OXXcRjuYZ+XcWkUJk8dgWdMMzTgl9Y0RHXqyN8boY/R1y35avhYDluzzfVXt71CJ9t
 eoEMU5NIS3sJNO8YfIw==
X-Proofpoint-ORIG-GUID: xPgI5-CR-aA4Y9F9LibcgzNyJobmqvoP
X-Authority-Analysis: v=2.4 cv=BqqQAIX5 c=1 sm=1 tr=0 ts=69b7d18e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-I31x9S0JgnQQLvGL8gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33504-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C5AD5297891
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 9:58 AM, Kathiravan Thirumoorthy wrote:
> 
> On 3/13/2026 6:24 PM, Konrad Dybcio wrote:
>> On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
>>> Qualcomm's IPQ5210 SoC comes with a TLMM block, like all other platforms,
>>> so add a driver for it.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +static const char *const Led00_groups[] = {
>> odd uppercase
> 
> 
> Yeah,  in HW document also only this name has the uppercase. So I just left it to align with the HW document. Do you prefer to change it to lower case to maintain consistency?

Yes, please - I would assume the original author had made a typo and
didn't really intend to have a single random occurrence of an uppercase
letter

> 
> 
>>
>>> +    "gpio23",
>>> +};
>>> +
>>> +static const char *const led01_groups[] = {
>>> +    "gpio39",
>>> +};
>>> +
>>> +static const char *const led02_groups[] = {
>>> +    "gpio6",
>>> +};
>> What do these 'ledN[012]' functions represent? Are they muxes for
>> getting activity/status signals for eth/wlan ports?
> 
> 
> Yes, that's right. These LED functions used for the eth/wlan status.

Can we better group them, e.g. into threes in 'led[012]' functions?
(or whichever way they're coupled?)

Konrad

