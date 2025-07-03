Return-Path: <linux-gpio+bounces-22701-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED11AF6FA4
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 12:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7461A3AE01A
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 10:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9CD2E1726;
	Thu,  3 Jul 2025 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gvFnyOSB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A092D3753
	for <linux-gpio@vger.kernel.org>; Thu,  3 Jul 2025 10:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537076; cv=none; b=MgiK/ZiV9nUVpZlTVPacBqGt15KPPqKDG+BeothjK3fET+x/s/k0oMwwGNL56up18qpvznhLObdG+11EastONXSE/6MP+ynEpz4+IIadsDfhr2gc68bDSl6T6JX1d4Ic7HnuOoW1dxFb/dbLFWX8HvyMqDjJp1jxA8azDEkE4YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537076; c=relaxed/simple;
	bh=cyTu142mWOH15jjQQR8zgkNVkfWZan1wub5jXvzfRWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tphm2+QAI/Vt4hbTdcgkRbCULYlH86x7rlLt4Y3oCW6DDBNk8h3uhIAK/08+MpcUzkCyk0XkAZUCWW/hICeMu3QiHhWd+T6Sdbhn+/H/PVm6bW/rPQ5IYuSvU1qE+CaSy1OrwbO2sBH8eX78udF43bgcr8r45mCz44gBasMkLVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gvFnyOSB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5639rPXm025364
	for <linux-gpio@vger.kernel.org>; Thu, 3 Jul 2025 10:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oUtfiWChnTptD8GgF9Q1eg1hm3mYO2U2DifbMke4nQM=; b=gvFnyOSBx5Zh75xU
	SLvcJThJvf6mWMXWPebbqcXw/LQKVtbzvTkao9o7jI2W3/eLsTxYdQOcYqabZbGQ
	p+DRhgT1UPNJE3UiSUnW7SK+d6r+JHQ0Gnp50MYM119vTpQxOENAKRFxTIrI2uGV
	Sx4otX5eeXvOsL5MJRxRr3N5bIdAgZ7pm12TeQjBbfboIvVwY33ocojvZkqnQ1gg
	2kKZ9DcUj5Jvs4MWbh422O5U/tNiYfZC6fyzMDqc8yMjbaVDWOoB9IJycbJuIuz1
	0anRYOh8dnf59cVcVUSQ9VK8ia2EoF5WYaXcUQ9DzSBgVpIa6fy69ZFLyZv9lsNF
	TNHwFA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64w2df-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 10:04:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0979e6263so42508885a.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 03:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751537072; x=1752141872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUtfiWChnTptD8GgF9Q1eg1hm3mYO2U2DifbMke4nQM=;
        b=EoOoyvIeQAevIKKr4PGG8/QHXXH9WiUKH/e9DJ4QjxzLEXBkztc0HEN3FFO187fq3d
         xp/KE9nLCYfwfHG2lFp2+H6wKCwsOmajqshFutvsHInYUH+xxeGdw8+4H5fcUdvAIz0t
         IPJslePSFl43f2MdVnJTzWg/O9HfE7c2grTYgsF3XxOVHo07Jn8gIg7nDfcMKaLwQslW
         02TVpT1liNTKonRdFsz8JcNCMDAsomGbUDdv+0gTZ/arw5mTzOu82Hw8DDBUcX9ZFcXb
         6oZtyKW/ufl3DYrtK6rLnzwoJ/KIKk8Zys4ofQbvt9sOFiPCWgnMbMi4GHHsCBKCHtqA
         yP7g==
X-Forwarded-Encrypted: i=1; AJvYcCVuhUIv/aakfGd5bZEducaLlSG3nFQgn9OC7/yjBhk9+G15h1Br/Q6CEN7b7U6odZ7bzKXCGt4W3qq+@vger.kernel.org
X-Gm-Message-State: AOJu0YwIUNwfj85dOgITk8BInwAfQLdA+QUOwXa/Ay8BYk6hnn39VmQa
	godD2MvYxYKTcKUygRHbBWiTMN7DfDU188xTs8sl5lrG7aAak4sCFZjcOai1WrWmrw4QPJcTaOq
	oPDyO+6+lfskw/BbdOIdY+5g4CUdSK/acYVYTWgYc+gj8p6DHKnu4T+Ps7kKlPWlbWaitfWzw
X-Gm-Gg: ASbGncszC6h2pc//zPjdd/suaxK3F9AKDOiMaqXLxSRYKFju54x1VPSEQy7ujdmtvyr
	pM0RMs/QJDXTIfsa3uEey7wdtE605RGE8ntblts0aLI6zhCxJQxO263aHACrqQ0RRtjZIW5isUo
	nbUcdg9f9+9ydZ4tTkZ6Smmn0ICdBMQvFj91sKxTRAEUrCG1W7i5w3bFbMeGlsVq3XF9Oh2cb7G
	fTyFAmxQLvNEmQ+xQF59Qwz912somNiMUngAfEVmWW9ahgqfQjgBgiUEFiY8MwGNJAIIX3awf9o
	P6EiQBWuApcbigXViIkBVKDvz502wIxzQScLqPTKSerXI6EM+ICxGmkAQHJ6XdiQUWeqh4JYYbn
	xxrau0/Tu
X-Received: by 2002:a05:620a:170a:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d5d3f81630mr79845185a.12.1751537072315;
        Thu, 03 Jul 2025 03:04:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2LJCfxQ4Vlc6G/INeD4FSxm9U7KnRLIwjqUdsVZx1frVxI2yUcjNbNlDmF6QyLAOxpw/4TA==
X-Received: by 2002:a05:620a:170a:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d5d3f81630mr79843585a.12.1751537071886;
        Thu, 03 Jul 2025 03:04:31 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60e2a743d53sm4520080a12.28.2025.07.03.03.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 03:04:31 -0700 (PDT)
Message-ID: <a453bd90-b7c7-42eb-b769-b4c87b6dac12@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 12:04:28 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Milos Top Level
 Mode Multiplexer
To: Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
 <20250702-sm7635-pinctrl-v2-1-c138624b9924@fairphone.com>
 <20250703-daring-burgundy-limpet-a1c97e@krzk-bin>
 <DB293G0PC5P8.13IW22M6DDESM@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DB293G0PC5P8.13IW22M6DDESM@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=686655b1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=K2Eths-FuMJ0g_30MjIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA4MiBTYWx0ZWRfX38x8/GfP3EGh
 /Jldc8hJeF+YSYGggzlYIhNmZKN5gHppVHtBZfG3Jou/cWW0BS8Jga7lI9/zeIG4S178sbwgnCI
 mVqFlZpjPB1l6Dlrm05I1rFNZmjOaObR0hVYEQUKeQYjQZwBjiq83debdFmsyObRPunz6tpJzVh
 SvJyK/V0F86GXC5hngk4x/36tBmUVI0H99bmHphrTweqsixjzuwaKbOag3+I/6qSGJJTl9oncMp
 iQLk/+9txjWinD+KWgCHPLBznyR0SPWWtQfEP+wPhtqGDOZGR7NVtySKnQG6XjrFADegwrYosZI
 up1zXr4CPXfyJsJejOpVLZ+rr5gFZ/zLi3ixKs/QxqzlKQhEQ3Kl6DjGcgwPg0XURldC/fLsbVs
 iHrZV7i1nZVdAYH0COj+FIJ8j/2DDRqO2e8WAsmmXRWByo/JhVSIzajNc+HxsWZWpNYBnhfr
X-Proofpoint-GUID: oaOZcmZqqr2xxeGPU62xAbKgUChO_yI9
X-Proofpoint-ORIG-GUID: oaOZcmZqqr2xxeGPU62xAbKgUChO_yI9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030082



On 03-Jul-25 09:44, Luca Weiss wrote:
> On Thu Jul 3, 2025 at 9:41 AM CEST, Krzysztof Kozlowski wrote:
>> On Wed, Jul 02, 2025 at 05:56:16PM +0200, Luca Weiss wrote:
>>> Document the Top Level Mode Multiplexer on the Milos Platform.
>>
>> What is Milos platform? Does it have some sort of model number how we
>> usually expect? Wasn't this SM7325 or similar?
>>
>> The problem with such new naming that it awfully sounds like family
>> names, so just expand the name and explain it.
> 
> Please go argue with Bjorn/Konrad about this, wasn't my idea.
> 
> https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
> https://lore.kernel.org/linux-arm-msm/b98d305b-247f-415b-8675-50d073452feb@oss.qualcomm.com/

Milos is the "real-est" name of this silicon. All the associated
S[AM]|QC[MS]s are just variations of it, with different fusing.

You'll stumble upon it across e.g. firmware build strings, as
well as in any documentation pieces.

There are various internal reasons for the switch, but the most
obvious external-facing one is not to have the user buy a devkit
and wonder whether they should use QCS9100 or QCS9075 DTB, and
why there's zero drivers code for these magic numbers (they
include SA8775P). We can simply point them to "codename" and
all C code will refer to it as well.

As for external reviewers not knowing what the platform name
refers to, this is nothing new - AMD submits colorful fish names
and it's broadly accepted practice

Konrad

