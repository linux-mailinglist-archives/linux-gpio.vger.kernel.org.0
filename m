Return-Path: <linux-gpio+bounces-35243-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6O+RBJvn5WlkpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35243-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 10:45:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A32F84285E9
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 10:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D3DB3005A99
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 08:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D563385538;
	Mon, 20 Apr 2026 08:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1yD6pV4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RxffZpr6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61B938911F
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 08:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776674711; cv=none; b=QJ2woEJ2yDEUFHX7//T8sBpBaB2Yb5e31pN14Admzppyk5wPoMgPa+jSPIWa/q7iwaRYWsUK06V+xferspSoG54dfSmtueHf1TZ251fStpFx+SfGAhX6U0q5gElbDqi/bT069sMhd/B+wv0NM2lIqptpzt3Yszmy71qWnB1GbQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776674711; c=relaxed/simple;
	bh=1f3+FY0eODonk77L71n/GWv2Bu4Zn306GljTsgpHpbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jSD/z4Bp+bwDZKV37+4MuI3yxE4R5rjNkh24MN69jfLNcPuXmMgilODvlwZiU+iR7i6CkiU+tC/S8kmlLDJqelTw/HCqZion5Xud3QpeFwf2XoenVVCcNdtmd5OYA+MB+IrFZotQ0a4e8oj29nFF2Y9jRMt3Z226AmFhjvZEfww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1yD6pV4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RxffZpr6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7Wt3k1532096
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 08:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VJ5z6Lev2AQUyalN7zgWolbBiaRJ+GEDL5W9uP32NnY=; b=Q1yD6pV4A2WpcqSm
	NNJtnzkyYqipACF5WIzhuzXoDJTRlOgBxgMcetvBi/SIbcoFU2S+/oLm5vfbxmqk
	DQsMrVgPnJ9qPml7fbTCYQS111qy1POhyRUkOH4ZAAZ75dHBcw+LQr94rtXMdtmQ
	ex2ypop60hNV5OsJHgva8qicJ8PR0ocglv3vmoGyGL1CmEItm97xpXc8Vo7/FUbn
	F+UK45W3QkMuGU5K+nVdS1V5SDzw7FEUwGeP843oWCH53ykultIBoJ2+d7PUmzHI
	8+N7d43ZWWaBlj7O+/DuCF1dKecdaZkHeEyZPNx0jM9Xo1NJeToE7Av0inZkcwzy
	N66J5g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfus0g00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 08:45:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fbb57764aso4116098a91.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 01:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776674708; x=1777279508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VJ5z6Lev2AQUyalN7zgWolbBiaRJ+GEDL5W9uP32NnY=;
        b=RxffZpr6Dmh+P0pz24oDgGGxnD3Cui4Oom/g/FM8Kugt8wgllAZ4Sn/xovsumQOIeI
         3IQY8sZlEn4vKG1w0GDwXEomK8Lo/hHfOEOhzLTNcDtb06tMeQDYoUd7Y/CqMLwUM4Ka
         0ktV4vmjgypR+kY+Tf43FAcTq40US28uUiYKjZU+BqRztxBl95TeHfWJBFSqdkgZdXku
         DZ/bOosrOOw7FJhu8QSW62jzc4Kp5+Jdj7vJarBi3jHrfdoOFv4KBI1rR8M28mmM5xBc
         iXBpAPYNDiPFyV/2GSS+emQzW9TxQD2n2ud+2GT0qEYqHA3gSi7EFElN5Um1gb3/gGW8
         ablQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674708; x=1777279508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJ5z6Lev2AQUyalN7zgWolbBiaRJ+GEDL5W9uP32NnY=;
        b=bd7GjPLvksplw55J0XSFsqEmoPHLFryOJisYoHVMEn07Zd/ftYZ8+3C2UrN/Ymqszi
         L8cEFz4xtPMSdPG/oX8tVQz9f1eq3w044KjgsaRqxGwJU29IAfQYxHU0dZRwt+PbtFn2
         m63CUqte/llKzKVqh9UZoChSHtFeTtGS9ozwYX9vR6Io0HpOQdoGRsDv4LkmsK7Gl+Ps
         nOYNlpDKen3suUpc8HwGmqqOJN/wVW3Oa/u+CTyvsxQrzHGaksunzCdhyf6zoRgQRWAt
         VEP3Oyh2e75q1waWpfXS34D/t/RI/Q/g10MChicpeuGOzQZRAeVysBgrLy/maKcYnsEK
         nP/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/xcSpUq9PPtSx67ufHM7E9Lho5uWiWjCaamjU10rrwGFhCBAfPhDo+AUrFxk9x8hybjC2/WnggUo2b@vger.kernel.org
X-Gm-Message-State: AOJu0YxDkEnvL+58t0jzSo9yjqGBYNeMnu1ZCgwGyzp8SsgvIPt5Pllk
	sHa3/OwybwhFw+ocWqcgq1Oab2uSDKFRroown+tJt4u3eK5XaOTdceHO/e1OUbNDuvXE9UgHpXY
	TGkbE9myXPHgXZu+w3djWMot5mWEpQJQg3kh2PwbsSmyDrzePI7yPo43KguJ+wbe+
X-Gm-Gg: AeBDiesEq0sjDjGV6ZyMIbfsvLxHDr/Bdr9HlfqjZ6D/wJmgx5bmd4D6i+EVebPq8SE
	+1Pxy9CiSc1R2MoWrWIbEMJQ4OgvWCIXCMIhjqA8YW/CnxFdck6tRQQeDqzVoCDmmMeTwVdLVGo
	4+Y26EJG636gVOEvTDbmMgRKGQlfNi573DBRQ+YOcQPtYSCj12IeTEQCZdoh8PwQhHMketbgqEd
	6ZWyozVYqZQuBSBySpyzTMqrF+ELhBWhXt5D0d5p6wO89ZLcaBB0zXJDy5Ffr4K84tiOyiV6nm+
	P5IYknnvNClnwFGno28eR/Gf7BYrmP+P2PvmzifKYCCvWDjmUMKV4k/HneZoCoOJqbHU8K1+Wor
	LLgzuseWP/sW3qOlIo7HbvuesKcz2fBBhgkXjrnMVMNjp4nq9j1lgrSIX4wPz
X-Received: by 2002:a05:6a20:938e:b0:398:6ec6:b06d with SMTP id adf61e73a8af0-3a08cd3782fmr10319174637.34.1776674708025;
        Mon, 20 Apr 2026 01:45:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:938e:b0:398:6ec6:b06d with SMTP id adf61e73a8af0-3a08cd3782fmr10319125637.34.1776674707137;
        Mon, 20 Apr 2026 01:45:07 -0700 (PDT)
Received: from [10.219.49.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797701d880sm7255649a12.20.2026.04.20.01.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:45:06 -0700 (PDT)
Message-ID: <0e0ff9bb-5f61-49bd-8c6c-811e1687ce6b@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 14:15:02 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] pinctrl: qcom: lpass-lpi: Resume clocks for GPIO
 access
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
 <20260413122233.375945-4-ajay.nandam@oss.qualcomm.com>
 <dbbbd4f9-ab27-4568-a06b-5d982d54bb51@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <dbbbd4f9-ab27-4568-a06b-5d982d54bb51@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4MiBTYWx0ZWRfXwGpr7PQveg0y
 bP4nR9OvNZs54KElAJsgQaiVWY5XJ2T/p0mEGGCsopcGpy3JaIBq6o/zlGQ6o5JvWZ8a5oXUnwf
 ss2dY9i9DupLU3Ir0eMc8pkz39B8qXZGv2VBxjNKiWz84DrwpdSTYihwaORCRcje5Qm57ESH3mo
 WjSX8+6NqgeFVX0+VSULIhKvMWuxFN5utkNByVuQvtYdEkD2tnlD7KZmHHWxF3ogVxHULLnRC7X
 Mkv2ELHkq063fnpo1TwZ0e6vBfpMIjDwyLGNgf+98/B11RYwDUyGpywb+bFfMMQYlkLWEMK7sfD
 wy61u+FnzkLooL5t1xUoleaH/Z8BcbPjXKF+8+dRlaH0NUdyXVGnLOI6ucn6z8UF/JkmMH/YvnB
 HdbXFG7qZjvmPvjKdOVZXRo7GuqynRO0e0jBh1kKMUbJoUcCtYB2xOyjgpYtLB6zdxNG35zl5uG
 PrUOsBR7m1mdBg01iMw==
X-Proofpoint-GUID: ELqEPQ1i7zy7u_byFNOXJFarurZZkjer
X-Authority-Analysis: v=2.4 cv=PMQ/P/qC c=1 sm=1 tr=0 ts=69e5e794 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=THQc4dpt17BYfH4AucgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ELqEPQ1i7zy7u_byFNOXJFarurZZkjer
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35243-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A32F84285E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/14/2026 2:14 PM, Konrad Dybcio wrote:
> On 4/13/26 2:22 PM, Ajay Kumar Nandam wrote:
>> Ensure the LPI pinctrl device clocks are runtime resumed
>> before accessing GPIO registers and autosuspended after
>> the access completes.
>>
>> Guard GPIO register read and write helpers with synchronous
>> runtime PM calls so the device is active during MMIO
>> operations.
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index d108e7321..4275f2734 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -49,8 +49,17 @@ static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>>   	else
>>   		pin_offset = LPI_TLMM_REG_OFFSET * pin;
>>   
>> +	ret = pm_runtime_get_sync(state->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put_noidle(state->dev);
>> +		return ret;
>> +	}
> 
> Okay that's how they can fail..
> 
> Please move from pm_runtime_get_sync() to pm_runtime_resume_and_get() or
> someone will come around next week to "improve" it

ACK, Will update the patch accordingly and post v2

> 
>> +
>>   	*val = ioread32(state->tlmm_base + pin_offset + addr);
>>   
>> +	pm_runtime_mark_last_busy(state->dev);
>> +	pm_runtime_put_autosuspend(state->dev);
> 
> put_autosuspend() already does mark_last_busy() nowadays

ACK, Will update the patch accordingly and post v2

Thanks
Ajay Kumar Nandam
> 
> Konrad


