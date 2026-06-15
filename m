Return-Path: <linux-gpio+bounces-38438-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gf3NGEqPL2oYCgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38438-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:36:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6963683831
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:36:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Pyo97Pf2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="A4/BoHRx";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38438-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38438-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8754930087BB
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 05:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE5F3839BB;
	Mon, 15 Jun 2026 05:36:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DA33A7F5F
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:35:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501762; cv=none; b=cyOIvn4GqJdQydTAgt16xbpDvT0aCKG1xDwAzz4udDLk7+jVaKSQln5oJIZmw7vGghBT84oc1pRfSeynPpti4QYEY7FTJ8+fqlUDhFitBWubFJHXxDtN7l1pIL7QQDiN4B7BClWyQFaMj4epvDcZJa/2VSb40/JlB7yD4JsYxjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501762; c=relaxed/simple;
	bh=dqTxwBE0ndeNI4p89sERCO/AVO4VgpAF218vctzv1Ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lXuqJtZ3Bldc114ycFhW2KyZr3pDyqo7kR8zaJgfH6eHLBqUcK3ZC29cE92yca+Yda+2IYm/LsEuLMjmzZSkYWwTGdlBiJyDrc+QSeoogNX/65O2YwXIkXuADlX074Lq3ldtqbYVCGIkNYnv01xLo1LiO1GJ103XHZnImHYT4NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pyo97Pf2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A4/BoHRx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1jCCh3244256
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Al+gKbBHNdbBsiWp1MXXGDUpeRROLny1uWI20QOnrqU=; b=Pyo97Pf226S1bWrY
	MM0AyKyAHjACgId2pBb3v5nowUWCN5KuA93A+PS/yobgF0ZkeDYJIQosiI+hIztr
	fzoUWlCbyi4u8etKj3HqvJvR35K7DZa3+MHmkEXkbZ4SrluOIQkLblNkSwRHhfxq
	TNt8CTKp6K+lFehHpSgvDutwL/j+Vo1wDRhMKGk8Gok3SXdgcNoBKat7VYeBY74F
	/RhZXVc9RFCe7J331l7yxBWMVRpMlKHaXNu8f6r5i8dUf1/dveBVPoLST/TuGGv7
	FH7+qwmZbWTD0QAigXAAigfZFaq4UUjc+no4yTG4YzuzN7sU5OcecevlB+0hDjP7
	epbpFw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gwr99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:35:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso2826799a91.0
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 22:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501755; x=1782106555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Al+gKbBHNdbBsiWp1MXXGDUpeRROLny1uWI20QOnrqU=;
        b=A4/BoHRx+TOa4oL/A6awisIwOWh5Fy6YTWJPvPLIvaHMPYdQx+4s+fofHANOARhaEZ
         QsyEG3/Aii4+JSLPIELI4b0Hsp2V0HwZfwRFFmcqlgjEGoX3ByRpahX8PKWg4yOsLy6I
         AClIuIN3dyexcBSmF1huVY8xmlvJ8BJuO4C+szMNFhMQob+sxINT5ntnlB/179ycIMDY
         4ywAhoRs8hkw+U6ZWr1tZjOA3FRibPURkaor0YZqNBcUu+49mwqr9NWNzKPLPMfC6Eb2
         QKZ75TKEXA4LDmlcfFKv2n8YO1jKiaD8D44hszLxIAY+a1VB0CN98TNn1JYFq7QApXkY
         Ff6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501755; x=1782106555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Al+gKbBHNdbBsiWp1MXXGDUpeRROLny1uWI20QOnrqU=;
        b=XVpdkHH4CfXd5/hwFiy7eAZYnKyihhuauN1HWcXkXhDfCCOCviM/MEM4geSyFH2xlG
         KuySgmViAv/CbhycrM9ZOyBlfnBNySW6tqaDr8Y4sDQ2e37OZgsSqo8gSCo4MqFLUBk6
         gV7K4iEFFGD0Sdd7f2OflQfgyeTrWbmhddQgMwAB/vuq5Auoxq0o664yLG0KMJdG1w9a
         OLgcc8MWJS4vT3ZIgRQfutTTFUpVR7z3KMBm+s20fe1qLvHeIft+CT41nfg2APmC64gM
         9IJeUS/+n+37UGHpMlLoB4xbcYmy+//dpD51EeFMZJzRYxLq5veFl9opEPV4Pmcw1rpG
         FoQw==
X-Forwarded-Encrypted: i=1; AFNElJ9nDPloYe/xxQkwrreOdbAUqYihwHSxldD3tSO8yIUQ4a0REE9HpirQiFJXi4HPuRUrwCKr6M/pvUdR@vger.kernel.org
X-Gm-Message-State: AOJu0YwQVQ6qafwTJIj0UwzdiuqGL1YsKEo+d375Asa74tRrJ/kbLtxV
	BygZ1I+l7+66JxrBau1irWKCVpqt4KR4/LkKCiFEUFcwbVghUxl+RV2s6cxugDsWtrKtQN8tcpO
	c9MN8DPMwJCDsHahD+iEz0uwPW+J4sWK757o/YKuYRiw2a3MMW/2RYCOoOtR8+HmU
X-Gm-Gg: Acq92OERwJlSp4eWypa6K5fFZybGbuZ8CpywfTUPLZtiUsq8m1iWXd7QuNG6BW8Jr+1
	Wu8wRWHCa+cbnMZjIeBc7tLi6h5nhNHejBI1vo75CAuepM4w+rimqPlc7H6No2Wm3j5xhEFIWLU
	fUQy/96Ni2Rbo1r4qkuKIy2PgZgx9lguxRXWRULJnc44n1iW0aTMH2Vp7q/guvtXzOW01mFmZA9
	bIPGNWlBZoq3LXdon4ck9eA4U/Bu147OnyOpLEGYgT4+lfmesr8me1cL4hVZ6fBX5wmQ6cvsy3s
	R6m/o8y+h7KZUckAcV3mKKnzwrKT5xtcz9ofCgRtgbMXqTIrxmT5uGMAXGBn0y6UO0ZpVLV3l7D
	YClaT584ASPXp+op8PKTVDbxVAGbJbjluD2Ksi2n4JgDxT5mYA+E=
X-Received: by 2002:a17:90b:53cb:b0:36d:8e49:d8 with SMTP id 98e67ed59e1d1-37c2bcefb0amr8644745a91.15.1781501754600;
        Sun, 14 Jun 2026 22:35:54 -0700 (PDT)
X-Received: by 2002:a17:90b:53cb:b0:36d:8e49:d8 with SMTP id 98e67ed59e1d1-37c2bcefb0amr8644729a91.15.1781501754124;
        Sun, 14 Jun 2026 22:35:54 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1f07bbfdsm11133492a91.5.2026.06.14.22.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:35:53 -0700 (PDT)
Message-ID: <39bc7472-a643-40bf-bbfb-241433dd71d6@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:05:48 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-5-f6857af1ce91@oss.qualcomm.com>
 <ahWQmTr-9a33b9FY@linaro.org>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <ahWQmTr-9a33b9FY@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfXyLHgrEqo8p0z
 6CGaMRE5Iwky9hbpkcHqoDWO6CrXP/FmG6nIqkysNKIp/cZ59jBKgL4zNYrd+VlE4WPiMWV6CZb
 paXUkZfEL8Gcipa1tOwKRgebhfOvdUo=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2f8f3b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=F36j7lWHSACE9dnm3LoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX40gIBoMVNM7A
 9qg0PgadjJ1q8GfWjQGIY7PAQHFa+AKkS1DVIC2RzaXDDEvw4hvn+K+A1hcwmhuOwzevycu+T7w
 qiVtXuvOKdXrTnWhDmXFvnFhNqSfGoYkGpzIpYnCUKE+t7ksub0jquQrIY4uWcXv/me4w2+sODk
 tzzEKFnovCZmR7DROHsiafTV0Gq6i02j05D9ASxIEGjdVzr5HdapmxN9GOvVBTvFnM4KKVa6Mfw
 gUV3kRQAXIQ1JJMIVDZplReti7/vDLhRsxdi9Hl/XkbT78eFU1CmYg8LI2DEOx+pmtBYwPwIHYB
 osnhFVAruVnHi7DqnGADo/Bn14lyPOJi4oUltX41I4fX69WI8sP51FYQU3XLkFS0x0YOi1memjB
 UJwZusV7tCEZfutbuaT6mj+3/tWFqswZb1F9TV9ohpWBGJ8KyvGm0qQE6qQtx4UrSIgoKP1mz/F
 D8C+gPdaT8EOmTC4AcA==
X-Proofpoint-GUID: K9jZx7Hwwy42UgZTQOc58odEKof34oEA
X-Proofpoint-ORIG-GUID: K9jZx7Hwwy42UgZTQOc58odEKof34oEA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38438-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6963683831



On 5/26/2026 5:52 PM, Stephan Gerhold wrote:
> On Tue, May 26, 2026 at 04:24:41PM +0530, Maulik Shah wrote:

[...]

>>  static const struct pdc_cfg pdc_cfg_v3_2 = {
>> +	.gpio_irq_sts = GENMASK(5, 5),
>> +	.gpio_irq_mask = GENMASK(4, 4),
> 
> BIT(5) / BIT(4) would be clearer here in my opinion.

GENMASK gives uniformity.

> 
>>  	.irq_enable = GENMASK(3, 3),
>>  	.irq_type = GENMASK(2, 0),
>>  };
>> [...]
>> @@ -184,6 +204,14 @@ static u32 pdc_reg_read(int reg, u32 i)
>>  	return readl_relaxed(pdc->base + reg + i * sizeof(u32));
>>  }
>>  
>> +static inline bool pdc_pin_uses_seconary_mode(int pin_out)
>> +{
>> +	if (pdc->mode == PDC_SECONDARY_MODE && pin_out >= pdc->num_spis)
>> +		return true;
>> +
>> +	return false;
> 
> Can put this in one line:
> 
> 	return pdc->mode == PDC_SECONDARY_MODE && pin_out >= pdc->num_spis;
> 
>> +}

Sure.

>> +

[...]

>> +
>> +static void pdc_clear_gpio_cfg(int pin_out)
>> +{
>> +	unsigned long gpio_sts;
>> +
>> +	if (pdc->version < PDC_VERSION_3_0)
>> +		return;
>> +
>> +	gpio_sts = pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
>> +	gpio_sts &= ~pdc->cfg->gpio_irq_sts;
>> +	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, gpio_sts);
> 
> Is this guaranteed to be called sequentially, i.e. not in parallel on
> another CPU? Otherwise, you need to add the lock here to make sure the
> read-modify-write doesn't race with another CPU.

Right. with irq_desc->lock held it will be called sequentially and no locking
needed.

> 
> Note that since the irq_cfg_reg is also used in qcom_pdc_gic_set_type()
> it would be safest to add the lock there as well (although since PDC has
> IRQCHIP_SET_TYPE_MASKED it's probably unlikely to be called in parallel
> with another irqchip operation for the same IRQ). In my patch, I handled
> this for all users using a new pdc_update_irq_cfg() function [1].
> 
> [1]: https://github.com/stephan-gh/linux/commit/59ca2a7335ede83e4a7cf02704dd7c469c725c14
> 
>> +}

[...]

>> +static void qcom_pdc_ack(struct irq_data *d)
>> +{
>> +	if (pdc_pin_uses_seconary_mode(d->hwirq) && !irqd_is_level_type(d))
>> +		pdc->clear_gpio(d->hwirq);
>> +}
> 
> You might need a write memory barrier here and/or read-back here to make
> sure the write is complete before the interrupt is unmasked in the GIC.
> IIRC I added this in my patch after seeing some test tlmm-test failure..

I did not see any need for barries and all tlmm-test passed.

[...]

>>  
>> +	pdc->unmask_gpio = pdc_unmask_gpio_cfg;
>> +	pdc->clear_gpio = pdc_clear_gpio_cfg;
> 
> What is the purpose of these function pointers if you always assign the
> same function?

I have updated them in v3 to be assigned only for secondary mode.

Thanks,
Maulik


