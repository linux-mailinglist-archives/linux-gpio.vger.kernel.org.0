Return-Path: <linux-gpio+bounces-20602-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF524AC54D3
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 19:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B20D9188D81E
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 17:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925792798E6;
	Tue, 27 May 2025 17:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pAX7QMoy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14351F4CB1
	for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 17:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748365436; cv=none; b=Wj8ET9tLqVn+X2K9cstCYA82hIeYKolmemfRQfxBVw2ksIE4+ojwwbLpdtAgKV6BBvU1pumkgxro+ou2YIshE2hs4u5DXt0b58lVw+8bjZVO0HCXiOPwC564C6hg8L5LOY+P9KlGlUm4gf8KW4j5wBrNbzr7uLaCrmRlMcY1WQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748365436; c=relaxed/simple;
	bh=D/exj8D4Mdt6FJYvJh51f96SRZVSyPsguFJ4c+GikA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pUnpNmk1I/8HhVWNyajhl98vOZ+xXuemEBZYto+552KwYMr4hw7Rq2PZkZyD+lILJ4PzGWPpJWrZxZpK1OpzzHlkNXU+fVWLAify7eIHVy0kEFsUcRvBHbUlNCEgilTXIIOQ/C0aRQZpGtDsBvMoeQVcijsDlU+94BpxssyhAN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pAX7QMoy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9Ymm4002117
	for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 17:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fN5GCmNGnguuUfY6HIS616UzD+Rz36jMub2o4gFIJoQ=; b=pAX7QMoyiVE1rY9Z
	+cKXPpiJ98pUzTz92OcGDPCydeOAXwvebWP7QHok+kDYdfdzki/19s9jOgDF556F
	Y0sKH8EIvRhxDrtbrbnYwDxhmdtJY+wlI6wEAuWp2hpHj9cbU8iNmJU5v5nBK1eu
	J34qCPZjcchBCurdEjc909jY4kpc1plvTBAZu0lb0wx7KOYTLhqVzDZZScp9n2VH
	xrRs4rI2YRo0H0/+3RGD60ngh3+YcNwy1MXS6UDbwJlbjT6CbB9Mbl0Cr8Ao84Hk
	JdkEmD5qE+OFOZ48YnC6lAN+/ZzLUUZbLgQ55BohYDY20fYtMNalhx+1mjWJoWfW
	m7VuJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavksaqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 17:03:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c53d5f85c9so107254185a.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 10:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748365432; x=1748970232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fN5GCmNGnguuUfY6HIS616UzD+Rz36jMub2o4gFIJoQ=;
        b=D71qXCLIPoNfduXyRekORHvwC1ps5AxRHszY5qkPXuYCTvxNXpwAhJr/9y7iK7wx9w
         lxbnFwU9O1CFTU2xXVLeinQW3rFZ3OwpFxAK69UdMdoppLKMQPG9Od+D1Brlhijd1fDX
         esCizTMiIYku3nGb/U64D6l9I6g04iEsVbIcBt/i57DTh/DRfivpwnUaxHX+39HmyYE5
         N49COxCaL5waICLFyoEerRB7X5ra6szYBHXaiOI68NFB5qwsF21VDsVvWi2DmSfIQg5p
         eQaj0Yivp9Tj2Ashm37Zy1dfReut9LWbFMTN75aGuw+CYorr8CKv3ej9X/XVFolJ7PL4
         Z/WA==
X-Forwarded-Encrypted: i=1; AJvYcCXfgDD+YbiOuQv3oJQYes/mg/hQJfAgPsSe13B1vhWxe1UqsDvv5EW6sTHnGmwxW1Ae5usy8Fmx1gyT@vger.kernel.org
X-Gm-Message-State: AOJu0YxkpZIkdSZI50kzsTmBK5PWb7zfaS8NdGq4S1jgebMPWpP2gDPY
	pgbk5o7JwkpCORCaD6mGu2kzeECDCeHA7v0oXsqFmCqpq7H8Lwb7E2dZoZOafZdMBa4Gy2iWmZ8
	oWRkdJQsBcXiR/cIALJCYQYgsPE1ISYmxR+TXupvllYP2LBQdUZqNHq7oaFR7lXpG
X-Gm-Gg: ASbGncsMjyKxeHmWVURITKWvZRLCq6+aHzo16/bOZtAVD9Zy7JlJisczwxsSrWXtai1
	p99V+Y37fDBHN1ZaSoYR4bGiU7QzoRFjiVMajF7JfGCRmviJaeCPvixq4AIcMOWYepFg7N/znLW
	SFX5w+S2P+GuLjad/uSLCoyXcywAfUfHPsahurFHrvr9n8YzhNKUhroLUYobmkvTgj1Tf3WA2jo
	8knspmdVS+9VPB6f0nmjGoyrZtaqz2GNtSKSl3TMM4dKxdvatZWgsUAGDPrkQUoTkqvE1ZE25WD
	es//ahdPJyB4N4ylHO3naSvE6/hABWaueZ+/sS3uen7rM9AYIZZFqsHEBGEcle0xPw==
X-Received: by 2002:a05:620a:49b:b0:7cf:85b:4b2d with SMTP id af79cd13be357-7cf085b4bd1mr14853985a.15.1748365432586;
        Tue, 27 May 2025 10:03:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDevCtCl7OkxCN6/99TDwIJJTrAXaSCvcoslipOU+QfWt40Ux7PUXxxh0fu5f697QezV7y8w==
X-Received: by 2002:a05:620a:49b:b0:7cf:85b:4b2d with SMTP id af79cd13be357-7cf085b4bd1mr14852585a.15.1748365432068;
        Tue, 27 May 2025 10:03:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b059sm1900573466b.10.2025.05.27.10.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 10:03:51 -0700 (PDT)
Message-ID: <e40e3078-cfa7-4927-af6e-f66a5dc4861a@oss.qualcomm.com>
Date: Tue, 27 May 2025 19:03:48 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] arm64: dts: qcom: sm6115: add LPASS devices
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-7-9eeb08cab9dc@linaro.org>
 <26afac49-2500-470b-a21a-d57e4ff14fa6@linaro.org>
 <DA735DM0N649.3NLLMFUW7ANNM@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DA735DM0N649.3NLLMFUW7ANNM@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZA3JyutBUZpEdKevSCEDLHdmqHTfGxkd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE0MSBTYWx0ZWRfX8RPG8xJ4DnTW
 b+Epyv+pZSziWRLdpJt6a7K3u+9XZydqFpRjiUOmNnDhjCp3O7UEYH3OzoYOm3S2myVZF22juBp
 OY9qwJsHz8nVIUv0/+b3Weg8osOLhJShAdJ1ntgiuauHVypbNODbppXPDQL/nmCffAOK5g5Wy1m
 zXwfB8l94pkaAdHZJvM5OMpe+bRgoECwFf/zSQEUtSHrEH83xX51yt/O41cLyEy7AC65Yqxct+W
 w1u+fR/tDMgrHoQzxymdU/cwa0qpuEP1FwhqRS/0ePpHIzntnLSsAnBhcub7uMXEBw/HJob3uuW
 AYzzXOwKFzezMaSQa2F9uJFOZvw+Szom06dCH1dNDBK+6Z9etFxEzCRVuPSXNV8EMYOTU5SwNqh
 aMinlZCHHX3JU0dropO8Lue5yJ3io+vSBf3nubKiAjyoNkCh3u5fl/EST4C1VnHlDI4dK9Jg
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6835f079 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=IU-kIAO4L2lcGG9yRekA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZA3JyutBUZpEdKevSCEDLHdmqHTfGxkd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=858 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270141

On 5/27/25 6:32 PM, Alexey Klimov wrote:
> On Thu May 22, 2025 at 6:52 PM BST, Krzysztof Kozlowski wrote:
>> On 22/05/2025 19:40, Alexey Klimov wrote:
>>> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock controllers
>>> are required to support audio playback and audio capture on sm6115 and
>>> its derivatives.
>>>
>>> Cc: Konrad Dybcio <konradybcio@kernel.org>
>>> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Just keep one CC.
> 
> Question is which one now. Konrad, is it fine to keep your oss.qualcomm.com
> email here?
> 
>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>> Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Missing SoB.
> 
> IIRC I took Konrad's changes but at this point I don't remember how much was changed.
> So I need to switch to Konrad's owned completely or somehow indicate using tags
> that it is initial Konrad's work.
> 
> Konrad, what's your preference here?

just loosely mention it in the commit message

Konrad

