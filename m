Return-Path: <linux-gpio+bounces-38283-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xc1qLuCpKWqObgMAu9opvQ
	(envelope-from <linux-gpio+bounces-38283-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 20:16:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F0E66C32A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 20:16:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TgN5ToA9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="HvAFx/Rw";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38283-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38283-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 580F7305A8FF
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 18:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897373546FE;
	Wed, 10 Jun 2026 18:11:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DDC287263
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 18:11:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781115083; cv=none; b=S2cIE6zMLuqrQadP91155NUiPl3hYab++yQz9uuPPMWjdczbV+RP0GXnSkYAd/tujDtWnG0MZdtXfvf6+I26d11MdmvzObxFlZP7/N53jojNTnEs6Lb6g1aiLkfsMkiUXK37Ao2W716VFsPC8KYcfXvVTlMO2ZGZeLWcadB6aQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781115083; c=relaxed/simple;
	bh=rARHZonBLtdal4S9wNNeqesAoKQdJzVMfUxStkKkW58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pULF2Kw42KvqHI/vezY6xxCyBRP3RamGDebDf78Qif66LYKnISXgBvHYjKBGO2RVDeVZg+aCPZEFEwF7DOOucnhtVy5zgWKBXcHpht2yHnCXf9tds4+0IfXlXK5RJZIt9RfeV1wllMCB1FuDitCaa82j1Jek3Ks2vUQCVVEp7/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgN5ToA9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvAFx/Rw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AFwjH7104425
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 18:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8XBtQGM/dbzn9KbgmF/PPmQm4UuVJGjL0pdntzgTrVw=; b=TgN5ToA96vt0SBTD
	dPtV6Mqty5gmVWOxy2S8Gpu4TWbl+Bp2b4+Xr3iOfBVGoyUr8/md+VngDFr5896/
	gzZ8k/BAgnC8xg2umQoxooQh6pT2MKjuiLaPTh83AnbVFUVjMmCH33giqjiWrdWU
	wH4QLG/rVgKYZdl5JMuwXii5MDjBGroZXmwK5wzyuXrSIhRNiE+Dm6Y/2ONXMcsT
	dvNB6xD6NR59OqlIQOVKToOBNh/HaVqaWALIWdhKeHDTdohKxmDhF0MIiptKO1f6
	QZT0lxA/9OBQRzyGdka9Dt1ZZQ2Yg+wh7RDIiIYzs4ZzQfz7qDk1I5RlzT3cfIKC
	c3dkTg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnev04a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 18:11:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8428384f31fso5045004b3a.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 11:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781115081; x=1781719881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8XBtQGM/dbzn9KbgmF/PPmQm4UuVJGjL0pdntzgTrVw=;
        b=HvAFx/RwAvJxxp/AyIJQidpad4UCsWe/u98XtA2kVq2/JcSRBh1e+aijAQ2dMOtQy2
         nzgsRlbJMdHyfoUokDdn4FQbRlie4pmr2wwZP5A/XgnT0OVTvK95nMti9a4Zzt9Mj2Ud
         2l5ib54XxvjAOKkniLrS4fX4RpeIX/rCmLXRRh4iXj93ZyMs707glZEhCrPYxYdH+fJS
         vn9z55nDuVP46dhSAe0/Q7DKdaYMWetOCo6lDG8N6ucXH/txZf07CUBBArjZPWgwW4kC
         ulFdQ1R0R59aq1XsNppd86nihkWCrAHcCjES5t2Tqy5WADMAiy9GzQy0lVKcOyxKtSOd
         vjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781115081; x=1781719881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XBtQGM/dbzn9KbgmF/PPmQm4UuVJGjL0pdntzgTrVw=;
        b=U8d7G8jQ+VBy9iG24AZfcH+WVqGuy+1nbcOAhGCyIN0Mpjm7NSuKJWgC+QigiDRoj0
         FPkeYNvXFVNU5TYis3JoaAuqTXJi+e/lI7zbLWbO9OTDqGJi/XXu3z56gY2OGy4htJyg
         iv1ex4XX60GgMYumWSaX56x0rIZXYF1vkuWT5psob4a9wLY9zb7rkzsTv4uyc1MSNS0f
         8LkFsPQCUxQASH6hvbr+evYXWejg1/nCzO31pqkNz2CNcwTZyDHRG5Wrtz0XQ60oLtHb
         K2ZA9y7WAYRyhRf0JSTCFBqWWFi0O1ewJIQtIt7wEa0mwVWw8swIeD9iyO+DDURT3BvR
         XNaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8k4onYmfn1ZBM8pjfKzdguq/uV5ppJujS/dQUqZ+ScgxAn7Pr6z2XN/muyn8BsiRCZO4nE4DluCXVO@vger.kernel.org
X-Gm-Message-State: AOJu0YxWHnDSAm0qQEYnYWVk4iIovi3By+JDraNXpGPFVhA5kjbjuNvH
	LXeyM4FzzLs6fjTjwM7O/0tIv5htRTT/n2v1QVIeXxo2rt8Di+Hom3UJK/3W8yoo3zpNO3iUI10
	lFR3AmLec4qlw0p+LZUj1hY07ECevlXHoaNe34NADQI/TEUS8oPYG4fLHuRa8EQX7
X-Gm-Gg: Acq92OGo7V9VtkTsePe5CVjnn5N73KYM+3bn3Sx+aW3igFW6a6ywRIov0O4VAd21uou
	/9YO7Pw9tqjCgWhiCKX6I3xSPuFMgvVzfNTcX2VchiK7DlGATly5TS+nZzNrvICufCzyVIOGh3d
	JXbHG8F68a56pc7evlbNRGrXi+jKNqaFxul9mrd2KZZC9u+StIuHI5M1f7p7R2AQbep7ESqVW7F
	GSZAD1BW7UHaUZOa/M1SbogZOfyEwjC1d5pzYnmtY9bVk9nNVxC+rSohodA7regOj+GdFh1hspw
	jb3yyT2/wwRVen+IPz28Nx6AziPj+XscmWjno+6/2XJzh9yjYRODJJLtUBtAZFKFPX3R9osdDQS
	ds5JF5s2GfCjKUXRMBBjtv2xN1luwK2p5ZVXux4SlKBGpZ/KTmzpMkJM+t6yK
X-Received: by 2002:a05:6a00:1496:b0:83a:b344:826a with SMTP id d2e1a72fcca58-842b0f4eda9mr27861691b3a.26.1781115080648;
        Wed, 10 Jun 2026 11:11:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:1496:b0:83a:b344:826a with SMTP id d2e1a72fcca58-842b0f4eda9mr27861654b3a.26.1781115080189;
        Wed, 10 Jun 2026 11:11:20 -0700 (PDT)
Received: from [192.168.1.8] ([122.174.150.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428291ed20sm31077738b3a.61.2026.06.10.11.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 11:11:19 -0700 (PDT)
Message-ID: <3aa529a2-b4e0-4188-bd8c-a6b3c5e2f1d7@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 23:41:15 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] pinctrl: qcom: lpass-lpi: drop unused runtime-PM write
 helper
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260610080809.2588640-1-ajay.nandam@oss.qualcomm.com>
 <f03850f6-186d-4988-a450-e6e95f24a551@kernel.org>
 <0fc4d9d4-2943-4ed8-a8ea-014e83c74e5c@oss.qualcomm.com>
 <f77f6d28-b3fa-46f3-a6c1-fd0093cbb458@kernel.org>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <f77f6d28-b3fa-46f3-a6c1-fd0093cbb458@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SqHzyoEq01sLeSprASva5MdjhNhONLla
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a29a8c9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ph9GlEvSy1Vz2RjkXBjw8g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wZmLNYNR7iDTIedOvHwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: SqHzyoEq01sLeSprASva5MdjhNhONLla
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE3MCBTYWx0ZWRfXz9kwsdVWCxe1
 ASL2pfBXVyhWqOR6vDWw8M3mqwMHlkrihOdtw3FJJ2wqQloaLmG3p4eBYkxM6niujtS1hYsvVmu
 enWqvbBqh+1BL7yhdnQKnffOvHi2tiQyrTs+K1TMnXkJIt96KyPMWLSSqSislT2Exddj3lUQRWu
 4K4Xe4qlJsUHkjHS+3L8XRJGK3nEqr1QEG/P4gL5jpYzbj5ELZdxeN+qJ1wTN9CgN5ZGU9rhEky
 I6siwyH7XLboU+ktfow5cuKOz8nZp38ZYuLzsv8NBk70mSBvQt5sdGxTznaVL3InLGztrpYpy09
 FBHUtZw8i0VILK3HxWfSh0RYRf9jmF1+IjkUHqq6vpt+ptL9HWyPM8tWPRT4gl0pXGemN+7g/u2
 t2J4lU2VUqyD+oft3MbJhphF3laFkO++pGShCQ4aBuzeDom6HUMsBfi1BWTDzw+QxRVSGnWN7fc
 3G7MzbmFYvETvqNCKPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100170
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38283-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23F0E66C32A



On 6/10/2026 2:30 PM, Krzysztof Kozlowski wrote:
> On 10/06/2026 10:57, Ajay Kumar Nandam wrote:
>>> So why do we need __lpi_gpio_write()?
>>
>> Hi Krzysztof,
>>
>> Thanks, good point.
>>
>> I will respin with:
>> Reported-by: Nathan Chancellor <nathan@kernel.org>
> 
> 
> And checkpatch.
> 
>>
>> About __lpi_gpio_write(): it is still needed for the in-callers path
>> where runtime PM is already held and we only need the raw MMIO helper.
>> The unused wrapper is lpi_gpio_write(), so this fix removes only that
>> dead function.
> 
> No. Why did you have to add __ prefix? Why do we need function named
> with such style?

I’ve posted v2 addressing this:
https://lore.kernel.org/all/20260610180012.3505877-1-ajay.nandam@oss.qualcomm.com/

In v2 I removed the unused wrapper, renamed the internal helpers from 
__lpi_gpio_* to lpi_gpio_*_reg (no functional change)

Thanks
Ajay kumar Nandam

> 
> Best regards,
> Krzysztof


