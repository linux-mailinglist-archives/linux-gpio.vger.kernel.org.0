Return-Path: <linux-gpio+bounces-38226-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EfBZKXgeKWrvQwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38226-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 10:21:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E532F66717E
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 10:21:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Nvq1PM6E;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=K0lDtIG3;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38226-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38226-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0264A3071CB5
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 08:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAF73A5E8E;
	Wed, 10 Jun 2026 08:14:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B61B3A5989
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 08:14:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079269; cv=none; b=fXWdU1bBqjAch+ZGme3W6e0CS6PaNfeMoppRIIm7EWbooP27z39VovcZH4y0MQVICkJk92r+XfKDkQ3r14v/xtGQtW20yKq3asSt5i+omhGrXyoB2Q10OkqGcyr09pVs0NJ8bbBAFr9wiz8Kw4ubxbl5dUvl0+4kEgwfQQSE/mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079269; c=relaxed/simple;
	bh=6tNt2knlQaGLvQLbDqwVIf8lCHEl1tWiYmIoI7brRqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pj4qJqccVJ53nY4UsDAXB62s0pmbR+BMZYp2u7uNl+xxXv3Z4ivOCab1DW4K2ozbuNuot0bMVwgLySLAj/3itByeOIptybxoSnH5HdKPR/VwtQPbFSzkOwHl6LNKxyaJGhvh0h4qbaAi5j7zzC1Z3VUnrlJ6hBHQ0MJ23j7sCZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nvq1PM6E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0lDtIG3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7ht9A3151743
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 08:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P7m2AaYtiFBNkE7Ec+ikzutKgjTULANhgT2ImDwCS9o=; b=Nvq1PM6Ejt8MJoeh
	AueWOCR44Q3IkI3Gc0gy++O+cqpj0O3EFom9YQTiPrUxrEp3ARC03U4brbsezgU6
	H4YC7CXcsBGXwAMMKVOA8oP21A4yqHnPcss2k8nSYJaKFMlCH6Rqv9qQItAdhey4
	9Z1ABoTkfVlLvvj0JnQL7dJSww0PYbts0g60HNRtSYtEZWHnTGK5fQEAEtkjpLgj
	jYMfZGbd3STrr/BCa8E81qHA0Rk+IwRSCVIeZ1qICw9lE4ZMimkmgKqjdp+wZaui
	nZI64FfQ0JHVbS+A7D/zAAx6FJ6xkreMX3Cqv14oxlORlv4/vkTWScYeM0yyPp5E
	IcEYJw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnesetr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 08:14:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso67037445ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 01:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781079267; x=1781684067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P7m2AaYtiFBNkE7Ec+ikzutKgjTULANhgT2ImDwCS9o=;
        b=K0lDtIG3F8xmMNJWmusaF5rloUcmCXwWhPsRM5c1atp2rGNqyjuU9ENOugEj7Ou2tG
         JHZDe7+ZR/B4JdQ3+3y+phelrplwV56DH9pJtP2OmMJEwqAKgNHyfNJzBlBntkJCN7YM
         OvXH6loPzr8tkxR9djLCcgvp0/lY5SwIJxUOFUw4qbZMF7e4nlNE9M0gL7lttdiIKBvp
         5xZmR1fIDfYtAZzY7VjQ7pvx/c5+XC52lGWliFw7AElLAlcYo8e/AZC9z7GtzBRfZvNM
         CInJx1EpsXU87PyRN6RAfZPSFG6r+TZ1k0GpTEK4BcWKvDyRXbQRsCbu+DfDF261LPJE
         EiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079267; x=1781684067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7m2AaYtiFBNkE7Ec+ikzutKgjTULANhgT2ImDwCS9o=;
        b=bqut9yO9JcoyMs4u8oY//QNQkA7Gk07trIlmXCI+1AuXtiRRuJSo6flmNqX10FnOy2
         a0Wyqr473oNkGzvhhJzKuNFwCfzRv0Rc+j9Za5oQSN/jru4QelBSBV+nXAifKOw0KZ0M
         /nA9fVknhAvNUmULAqUnEP74roCpG48mCE6OwN00lXP7MgMRGglAf4E8wX3CAr0cVv6z
         0aycuLbXMVQEh0yQmxrjuZ4h4I/Riu9mFPgNwgWf/JiFeEETffVTkP7VfcqTUf0aGYuh
         Ren43mbghaijuUAhlfv+CvTRS2/vvmipifTt66JJEPXOUmTaQLYc8ByjvcJZ3e3mKn49
         2ZTw==
X-Forwarded-Encrypted: i=1; AFNElJ/l2Tedsqms+4ttUtg9r6QnJ8XEIRWwpjmoLwC0LeMg4aYHPOqv+L5frw5QYuOMliY5lo5yArsO7uDh@vger.kernel.org
X-Gm-Message-State: AOJu0YxKytMUZVn9SJSai/bKAalM+UfZj86q+ig5LGQA2iOECngiRStm
	h91BR8F3TD8LNh27kgIWnQr+kLq1/G6RcYexck9r3EWJJ8kvgEVM+hMKMUgrSSaJgLZXvELYs+3
	wiqmiMvpJJ256gMOg+ngeTWNX4HEzNi93ITenxiteRUy1xO2g9pO7jIq48akLwlAe
X-Gm-Gg: Acq92OE+My1/ay2ckQgNntU6bTwryvCWjKcp27CekTfbMYzaM0noV/s6BtaCBHvr35h
	70lJXEyggUjmMcAklK2/0wg9vA7igI/jsPGE14Mqf5U2H8wE60KVdkCUVVx5zIrnUTCJCMDWsdH
	qHR6kthpVcrY7GCA1cBkym211ER4r4gTasyrPAFWqSEJ1w0SGUK7+YVIV72sVd6c1v2z2fhyE56
	7h6byB5RR5U74v5JwVF6+fFLqJ+eQktNgBca3ANkNPzCBUrBMF2YdQMlIyEMLsDhcIwmb8jer4W
	c+1J74lgVkTuqLVdtgOrZt8TNTwzYbA+ZmD/MPzOcXckwLhn+ToZV/nc3NkgyMQ1/RtJ4xjJWUz
	ytCNzGANOL/78IrWzYe9TkLoiFmqesHiHvCecU11NzVb4hpnLBljQfBz7Aa4S
X-Received: by 2002:a17:902:e892:b0:2bd:ba44:6c07 with SMTP id d9443c01a7336-2c1e7b3273cmr272140975ad.16.1781079266970;
        Wed, 10 Jun 2026 01:14:26 -0700 (PDT)
X-Received: by 2002:a17:902:e892:b0:2bd:ba44:6c07 with SMTP id d9443c01a7336-2c1e7b3273cmr272140575ad.16.1781079266399;
        Wed, 10 Jun 2026 01:14:26 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d389sm227967235ad.16.2026.06.10.01.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:14:26 -0700 (PDT)
Message-ID: <51b95f5a-d123-441d-832e-be023fb9d98d@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 13:44:21 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework for runtime PM
To: Nathan Chancellor <nathan@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260522204644.4101640-1-ajay.nandam@oss.qualcomm.com>
 <20260522204644.4101640-3-ajay.nandam@oss.qualcomm.com>
 <20260609231238.GA1901681@ax162>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260609231238.GA1901681@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JsFU3MGUamouE-cQoeYUtE2EvsT2b_JR
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a291ce3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=I1y84f6UziIZZygAmgMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: JsFU3MGUamouE-cQoeYUtE2EvsT2b_JR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3NyBTYWx0ZWRfXw/1EkHoDS15r
 JNjt41/wrueVQ6WhgOZdhH4tfw2gh05MK4Arj76+XRNh2+lxBgRDWjWKxzrD9tPaZI4U2l6PX9M
 5IOxzRe2Xpt/dZFoqhOZSWAkPfpAUhIsxtHMcYGdqQ6jMc5nNgw5gzkxebiLIA/NNAd5B1XzC+l
 G3neyC6U6mnZozUarwbpIn6zgxM1KCXx20ih+tqFuni4c1ILhX4159nkiG9C++x24HFBiYocXL0
 66P5XoaUVXtpLJJYZuXm3aaCorKTRr8+2y8sC4umENlbXwyEQVqWCJOc03cPPaUgjNd6lz8vKRC
 9jewz38+Z/kmCp+f6E/y56dcDZdPdoiBz2iF6TiIJXbNAVgI856Yh5K8iJRLBcS+RWo9TWk3nTk
 jxvdi68uMWPugGKlHqED/sDX2RksRL9fLI+KuQZQ854lRVqPDA3OBVPJqyhC+8osqTI/rF2x20W
 zm0zE3pdtxMWhqYXoog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38226-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:linusw@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E532F66717E



On 6/10/2026 4:42 AM, Nathan Chancellor wrote:
> Hi Ajay,
> 
> On Sat, May 23, 2026 at 02:16:44AM +0530, Ajay Kumar Nandam wrote:
> ...
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index 15ced5027579..4d758fd117c4 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> ...
>> @@ -48,22 +49,48 @@ static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>>   	else
>>   		pin_offset = LPI_TLMM_REG_OFFSET * pin;
>>   
>> -	return ioread32(state->tlmm_base + pin_offset + addr);
>> +	return state->tlmm_base + pin_offset + addr;
>> +}
>> +
>> +static void __lpi_gpio_read(struct lpi_pinctrl *state,
>> +			    unsigned int pin, unsigned int addr, u32 *val)
>> +{
>> +	*val = ioread32(lpi_gpio_reg(state, pin, addr));
>> +}
>> +
>> +static void __lpi_gpio_write(struct lpi_pinctrl *state,
>> +			     unsigned int pin, unsigned int addr,
>> +			     unsigned int val)
>> +{
>> +	iowrite32(val, lpi_gpio_reg(state, pin, addr));
>> +}
>> +
>> +static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>> +			 unsigned int addr, u32 *val)
>> +{
>> +	int ret;
>> +
>> +	ret = pm_runtime_resume_and_get(state->dev);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	__lpi_gpio_read(state, pin, addr, val);
>> +
>> +	return pm_runtime_put_autosuspend(state->dev);
>>   }
>>   
>>   static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
>>   			  unsigned int addr, unsigned int val)
>>   {
>> -	u32 pin_offset;
>> +	int ret;
>>   
>> -	if (state->data->flags & LPI_FLAG_USE_PREDEFINED_PIN_OFFSET)
>> -		pin_offset = state->data->groups[pin].pin_offset;
>> -	else
>> -		pin_offset = LPI_TLMM_REG_OFFSET * pin;
>> +	ret = pm_runtime_resume_and_get(state->dev);
>> +	if (ret < 0)
>> +		return ret;
>>   
>> -	iowrite32(val, state->tlmm_base + pin_offset + addr);
>> +	__lpi_gpio_write(state, pin, addr, val);
>>   
>> -	return 0;
>> +	return pm_runtime_put_autosuspend(state->dev);
>>   }
>>   
>>   static const struct pinctrl_ops lpi_gpio_pinctrl_ops = {
> 
> After this change landed in -next as commit b719ede389d8 ("pinctrl:
> qcom: lpass-lpi: Switch to PM clock framework for runtime PM"), there is
> a warning that lpi_gpio_write() is completely unused, breaking the
> build:
> 
>    drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:82:12: error: 'lpi_gpio_write' defined but not used [-Werror=unused-function]
>       82 | static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
>          |            ^~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors
> 
> Seems legitimate, is this intended?
> 
>    $ rg lpi_gpio_write drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>    61:static void __lpi_gpio_write(struct lpi_pinctrl *state,
>    82:static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
>    91:     __lpi_gpio_write(state, pin, addr, val);
>    167:                            __lpi_gpio_write(pctrl, group,
>    172:                            __lpi_gpio_write(pctrl, group,
>    179:    __lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
>    340:            __lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
>    350:    __lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);

Hi Nathan,

Thanks for catching this.

You're right — lpi_gpio_write() became unused after the runtime PM 
refactor, which triggers -Wunused-function with W=1/Werror builds.

I’ve sent a follow-up fix to remove the unused helper:
https://lore.kernel.org/all/20260610080809.2588640-1-ajay.nandam@oss.qualcomm.com/

Thanks again for the report and testing.

> 


