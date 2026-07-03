Return-Path: <linux-gpio+bounces-39396-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3gBAIOZ+R2otZgAAu9opvQ
	(envelope-from <linux-gpio+bounces-39396-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 11:20:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 148CE7008F2
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 11:20:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LBwReXtB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G1F8VE7t;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39396-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39396-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 02FBD301436A
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 09:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63543B27C3;
	Fri,  3 Jul 2026 09:20:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7FD3B14AD
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 09:20:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783070418; cv=none; b=QSe9nm1sRZh0VUgyuOqkBbTy6Qm5bTnGMDN/JlGWxzoq/VSR8z+KCdyjo2SKMJiIL/fzRWcSZIRueypMuPphNgnK13wbRMRyuZQh55Pj4Ov66OiEOV38QasPo8UaCWyhvL7+SdR4OAS/0xjHzbnLBed/L8FBVQmCA6LLpEfiTxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783070418; c=relaxed/simple;
	bh=SInzcmPHMyawTK6c/5nfvrH+VklBNXrN3daWxDv60fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0RzL2cW2lsNc9kFFDCnIm21YTZCmu7lgwulN/RAmzeqUDeuB/GT3S1EPPq4Ekxy1J9pgFn1ibwl0L92aA+h2XFP2v3knxyYxw64fKdx8n4fzs2OKUaSePthd/CM13uTe5NF/4AikMOeu6sW0RZajWCkgRrNrYtCJMRO2r0r6Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LBwReXtB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1F8VE7t; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rms73136311
	for <linux-gpio@vger.kernel.org>; Fri, 3 Jul 2026 09:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hQtmr+j8o6eeTBOLKctC/1KMmbnUFU7wJ0fv38TVJTE=; b=LBwReXtBR7ctHxYX
	BiAIamsMZpf6SEA0ETGaIQJdWEN4a3wCSWpB9x+QC7WWbOcA8xFJfdx8VkGfpBE9
	LR4+FyZFRX0WeRZQKoOiNYRZ4VPDBL+5yZz11KgWzrPYUn6JfJnHktDFzCkFGVjO
	SKpQmu2Wa/hv8s/6FDyaS1PYydTvgoBv/+ymkMZb8LMsmTqF1/ZFIYgeDHy7Yd8w
	lwzkeClh91u/L2oMDJqVnHlIxL8wAdzi6olt2WzoZnFgkbnSysQc8XVN3KhqWDtb
	9uAB5Bsmy1bYLkjjX8fOgU2PjDyykz2+XXBDMhjjq5kDz10CyX+PFAzr3ZnBfX3T
	u4jbPw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b59kjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 09:20:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811ae55313so414496a91.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 02:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783070415; x=1783675215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hQtmr+j8o6eeTBOLKctC/1KMmbnUFU7wJ0fv38TVJTE=;
        b=G1F8VE7tzTO6Zj/I/dy7NajL/9V6PPchjESG9ZOnboigGt51Ia2Bvp7jHKnteonFaT
         0auBM8X/wJjLNLmbHWtYCDdILkTOZWksBSGE5fJE6YSnTk6H2Xb5lKLaeM56KpQp196N
         ikR6NLmoqaVl6fwYWkP99GZiurqBVkXnsDmlm66bE6tvglkKVunJX0X21mPQqBvRmSPJ
         OZn+0o2x6VqbvldnMTOUpFg67jGUjBH72MGz5MJ5hNwLMSo1OaLgSKgN15NSDBqZkeNS
         vQRc0P61ijLgJeMfTXZ2kD6xZrFUYa6qmQ0DOeTeTx85HhvPrxqm9aQGKV9IFMgQoEhj
         vWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783070415; x=1783675215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQtmr+j8o6eeTBOLKctC/1KMmbnUFU7wJ0fv38TVJTE=;
        b=ezC5QgRsB5Yufj0pvn8zchqlrMVNeSmjM9rmLO1SgDmAod6tMo3BCr1ORJ1UQ9cAAP
         R52JZiKh0GvPgaxHnxUFhfsUfildas9CMFcabn6gfrv0GienaFtP2+MpDKqdA1Bn2jaZ
         OtYOhhhFcqGrIWZFh2ExjIy8PqdrhMdCN5MplnQN9WXKpzYIf+7QV7sCpO8uTbxv+Oly
         ZOEkrAqno9yCbsFcNCWNihcYSR5a98Jm8KvPmRsMk/ZOq05kwgTOpGCnRRbMM2y1iG7c
         VsmEWt2TrlbLWpD6gA8uROumyEZISgO//o2VA00ACpbJI9a1wfdd10z5CYN4ib8c7ecG
         7P+g==
X-Forwarded-Encrypted: i=1; AHgh+RqG5KkiRExRaCmnL7JE6vQgm/+VxO80NjlH4VXr4/CGsr5swRFbgPZnIjBXFcYVG7hRJbsZjtPkAuLY@vger.kernel.org
X-Gm-Message-State: AOJu0YxCQzqUBesZEl2fov+vbzQuInROZVM9z+KJeGNlHF3B0auqMe+N
	WB9hYFueuhEKleVKOkIyaTdxmUNPwXbE4f4Rx49sfKSbt4ZveFe2SqZ/QxZBvLOki7yp3s/Ucv0
	AqAs1i328HkU+QJ0rgWUJHGBfzaE0YGD0Uti1vXQon+FOog4v/H7UzU/ZMTgPuZ/2
X-Gm-Gg: AfdE7cmxvcwLSnRhSv46L/7TdEgW3FKJNKgeHdvITga5kcTphJqXYGrYc4itlWb1Swc
	GmW1VdfbwYaFqvurTAo0sLdChQWRn5BUPJ5nLMH59Ic7ogDrkNK6GEYS7/6CQJVbOL2+gL2D4Df
	q3eaPhem5Ph6p30fmc/WklEYBZBoW+APiZDA6Ba0Xe/r5XoR/ihirPoWEf2Ch1IHpLGTIkbOCC8
	I43pNh4P/kPl3mQ2tHMKkKyieuz8ydl9NRP5gL84PFY9nH1SGNOGzBpISYAoBltqZRIkEhL7ixr
	/q9AUTOM5Zigdlfzhdiuz/Qdac+sGpSCalp1ocJMC8dSJlFq0yVRSdrSTH64/99Vd+8pnXPW7xX
	S/+eeDhwCZ+6HfNWfczysTzRAy6MnTuQWzxyuf6n/
X-Received: by 2002:a17:902:d4c8:b0:2c9:bd3b:34f with SMTP id d9443c01a7336-2ca911f344fmr96592275ad.35.1783070414893;
        Fri, 03 Jul 2026 02:20:14 -0700 (PDT)
X-Received: by 2002:a17:902:d4c8:b0:2c9:bd3b:34f with SMTP id d9443c01a7336-2ca911f344fmr96591945ad.35.1783070414411;
        Fri, 03 Jul 2026 02:20:14 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b41c364d5sm12798365c88.14.2026.07.03.02.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 02:20:14 -0700 (PDT)
Message-ID: <8a538dd5-ab36-4826-929c-8ad16d652728@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 14:50:08 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
To: Thomas Gleixner <tglx@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-5-4d8e1504ea75@oss.qualcomm.com>
 <87echoqd7d.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <87echoqd7d.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4OCBTYWx0ZWRfX2SOp46+47hG/
 QPsmn9k0NpwvvjqErbyxaYWSE7nla93oKxINiOrYv0DxRtxqW7Vkmn6khjr/FLo4mlOG+8u3Awq
 1YvqYEOaf5ZNW1dEeIsSmXKLOKUIFRw=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a477ecf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=OtCtuEUk8598TF12AxYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: kEUzG_xWTt4AQtNgQVmeRyb6KprLDepS
X-Proofpoint-GUID: kEUzG_xWTt4AQtNgQVmeRyb6KprLDepS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4OCBTYWx0ZWRfX8hgNatjSBt21
 Yy1fZJrplOsZlJ+q/iAFi48pZao43vwS9bJ8ieNskHpVcvKadzKgWldg1z5tnrnf1eWmj+CQoND
 p9EN+6LY+vc4e4futbtZWDphOSL7dIIpbRWEUMxUlPBXaL6v4yLWGV3VsMeLK1VE0RbNq99PNPv
 ljydiHuiPe8Zl6B+xHyiZxy/KC1PjtejhYJHu2J6FXW6pK/JyIki8VYVEX2ShWSC7J4SqELHcoU
 j7hjezzJZivKkh9GSyFU09K48dTl61rRRZIsBkyvwAPQySBDnom6AXeV/k+Nwo0SVhLLJdgq51C
 f7TDIaC0V5i2jpY3Iw9VsWy6rId6Y6ttf3jp9pwwOQ6PUZcfyWt6K3GtYmvcxqa+uiZeCpfA5kK
 l24bNVJAYWh5eT02e5ftBD1aySG6FmhkHnjGZCXIYVKK7KGGocb5eRCFJ+WSTEc+hxDb9Bf0FUu
 QMjJ2EgwS/I4JCYZCJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39396-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 148CE7008F2



On 6/30/2026 8:37 PM, Thomas Gleixner wrote:
> On Tue, Jun 16 2026 at 14:55, Maulik Shah wrote:
>> All PDC irqchip supports pass through mode in which both Direct SPIs and
> 
> All PDC variants support pass .. ??

Yes, It should be all PDC HW variants supports...I will update in v4.

> 
>> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.
>>
>> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
>> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
> 
> latches the GPIO interrupts and sends them to GIC as level type interrupts.

Sure, I will update in v4.

> 
>> still works same as pass through mode without latching at PDC even in
> 
> SPIs .. work the same as pass-through mode ....

Sure, I will update in v4.

> 
>> secondary controller mode.
>>
>> All the SoCs so far default uses pass through mode with the exception of
> 
> SoCs ... use pass-through 

Sure, I will update in v4.

> 
>> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
>> boards whereas it may be set to pass through mode for IoT-EVK boards.
>> The mode configuration is done in firmware and initially shipped windows
>> firmware did not have SCM interface to read or modify the PDC mode.
>> Later only write access is opened up for non secure world.
> 
> .. for the non-secure ..
> 

Sure, I will update in v4.

>> +/**
>> + * qcom_pdc_gic_set_type: Configure PDC for the interrupt
>> + *
>> + * @d: the interrupt data
>> + * @type: the interrupt type
> 
> https://docs.kernel.org/process/maintainer-tip.html#struct-declarations-and-initializers
> 
> I'm sure I pointed you to that document before.

Yes, missed this place to follow. I will update in v4.

> 
>> + *
>> + * All @type are forwarded as Level type to parent GIC
>> + */
>> +static int qcom_pdc_gic_secondary_set_type(struct irq_data *d, unsigned int type)
>> +{
>> +	enum pdc_irq_config_bits pdc_type;
>> +	enum pdc_irq_config_bits old_pdc_type;
> 
> Chapter before the above ...

I will update in v4.

> 
>> @@ -449,8 +628,13 @@ static int pdc_setup_pin_mapping(struct device *dev, struct device_node *np)
>>  		if (ret)
>>  			return ret;
>>  
>> -		for (int i = 0; i < pdc->region[n].cnt; i++)
>> -			pdc->enable_intr(i + pdc->region[n].pin_base, 0);
>> +		for (int i = 0; i < pdc->region[n].cnt; i++) {
>> +			if (pdc_pin_is_gpio(i + pdc->region[n].pin_base) &&
>> +			    pdc->mode == PDC_SECONDARY_MODE)
>> +				pdc->clear_gpio(i + pdc->region[n].pin_base);
>> +
> 
> Requires guard(irqsave)(...)
> 

Yes, added in v4 within pdc->enable_intr().

Thanks,
Maulik

