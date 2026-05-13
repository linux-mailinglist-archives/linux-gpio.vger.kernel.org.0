Return-Path: <linux-gpio+bounces-36755-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OD+XNxmHBGr8LAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36755-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 16:13:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A54534CAC
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 16:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D572030CDE2B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 13:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E954D27B50F;
	Wed, 13 May 2026 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dt7aNmJo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="COgGPQac"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ABF246766
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 13:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680208; cv=none; b=GuSgV0lcq8nR9TFE05/YRAeD5VjGpC8UXO5oEaZqyEq/H7BD6CtGfqSP/ExIWFh3oq/nmgax3NcC9BaNuDdIGaMkTgS9WtiJPnzKlc1fwzF4k6iZhAL4C/JwUlUZwUA8A94Art+kVpC/Kptk+js6V97KNxE7kKsWqIA6qXT51Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680208; c=relaxed/simple;
	bh=21ChlqnG6+1/0k98un0SM3BswxDZ2/eLtnXGSiSpg9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CsWd4ITPCJueOezGnb73d8Cdm6Ii1IrhKbiIM2y5krjY33gXCc3YA95R1/VD6v/eCjp89jpqVsbw0eZZ6FlrgJS4+Jx/kULLQ+uVh9XQEubRXWPE928tdyMhPxqVURL1bJJdDc8uObRKSMv1X7VakNnscX9Cp3KrTehBMYNjWaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dt7aNmJo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=COgGPQac; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DC9OfS3324677
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 13:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kUmVYuQhPuKy5nGxoKDn5VTEZwu2/Gq0ve+F1MIYe/I=; b=dt7aNmJowZ9f8t84
	IjAgZmLQ62UDHq4Csa1iRHBgGhuaIK+owMODgGoXyTf6GdDgFwqlxaH3/QcB/dmu
	ZhtYJ+MFwrK5Ep7lpzI5LF0ueVDv9PdnNJ6heWXYgUYxs+B60Ln3MkO+vB9FfNck
	TLoVlCgAdWdXynKtU9FmRgRPzmLnBajU4SMuyz4qgQpy1Gq3UmjnibM/jGXzpyf7
	2KRduqmMfgww+Er9LrZ9S22vYkXz5bHNgjyvkGRi7tXKDG42BH1Kap5RGBIQpuYo
	ePmGcPvHAruci+mG+vkJA5l1ZoN0++TbQqtPOFHPVXgz2T4U51VBebIyIG6erOcF
	Wwy8pA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd9q0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 13:50:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bc763c7256so95480135ad.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 06:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680205; x=1779285005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kUmVYuQhPuKy5nGxoKDn5VTEZwu2/Gq0ve+F1MIYe/I=;
        b=COgGPQacpedAAcmHTZI6w+3yzKL/A8MdvkJZ+5Ho0engneM4pSPqcjXmPjzJ4kE+ci
         PV9cLdWDio1Ji2x59qakl5KUQyuL6UrpLI3zO0XdR1zIFTSdtyPoKsvopRITAIP9xycX
         KGMW/DxnU5Sk1Rlr+eYQ7PJdgjyMti2qzYrVYBnwRoiugPVhX75HFMKRXlcy8XzjZ/cX
         FEVDZBhUZ5G2co0Z50nIQfYWs6njratbvLZghd54MPaXiJoBuozGmDkexOIKYNjkGyrD
         WK9XhEoQF9kSOFcPzwnSyr0Dm6nzeJZionSI+HmHEv9t5WOkjE29EwrtFe13z/oUvxv2
         FHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680205; x=1779285005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUmVYuQhPuKy5nGxoKDn5VTEZwu2/Gq0ve+F1MIYe/I=;
        b=gIw1+otcDljbrCjmr5YkOK127Mt5pITSdnM3CU6h3u/aVAs+C6LThJQ8CfO4J2vW3A
         YzggPwGKV++zHMg9viMQp9AXJLhMX1L7iHWJwR9PbDVkbk5f5ZVKnwY+t253b5UL7aTn
         4V8hydDLcQ8QbrTKMxOwiXiDdP8N0RSu87ojRDsp6aNnGrpfgO7U7Z8s76fDceakuBAe
         gUTOaTHKJwwa54rhlosx6Fi8kvBUvd60MYFqYXPpNTQvoKzPmncQWek894RQSXJ9r53N
         VaMYpQkhaG974M94koWNfvg/n/iBvyzRi6E+eel+XP+WlEyyW4Y9lSswAwskWOQSZhOn
         MgOA==
X-Forwarded-Encrypted: i=1; AFNElJ/GYRw2G1sPx/averSTrzDPaiqy7PpwjPGARPsAxfUYWpbZBrtyTBCfNn6N8pg0OUaTwyegmTT4kvyI@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo4SoRtam1iM+jNuYbDBsnGwmbLujfRrvtJAsN3uA34DxzZ/3R
	77yL+cOULn6zf575SMWb+h0Cx/Gh+ILkDP8R8Rbp/NLkwOdJbL6t6AoatJrn2LMvJL+nlUVCU1r
	iQoxd8Cs8e3XaRRtjBgB8HlWoOkM1XslVMWodYpm9lwWZbFn1/GaOVPnNwZ4IRtb0
X-Gm-Gg: Acq92OGUX3uzKvUcNZnD57oLLa8GAa4CGlqCyvktkffk51YUr8YgT/0fiSAozQPirM3
	kCavGTCFcEWYVMfIqet9q3xWDUpqu1Ie3onnISwN50L0y39fm45DyI0k5izioBU3WqPniA2L3KV
	WGa0Om+HlZTapfwn6QRMuAEZMCWz1wQxK4VEpsVP3ZGO/wbuft1nJQPh/Udx2+lFHHjXgvK3kpK
	1Xob7p8GpruR+nwigd8pU2Qw1b+Xk31MGCpTbcJaTHh4OeUyeKsYrFxO8IugjgQab0CA/khPYaS
	JwAimIo3eg3LKp8kmG5bBAoI8VDDkCE1gxSpX9kI9OU8y2PL93Bpg8qv+v8gMlkEWyZZBCUF5RY
	6XgHnRDGT2ALCKah6rGmE1VwtqdTphcTuHUuJgeYAWP6BBYyNDA==
X-Received: by 2002:a17:903:17c6:b0:2bc:8f62:990b with SMTP id d9443c01a7336-2bd2773e38fmr37055425ad.41.1778680205300;
        Wed, 13 May 2026 06:50:05 -0700 (PDT)
X-Received: by 2002:a17:903:17c6:b0:2bc:8f62:990b with SMTP id d9443c01a7336-2bd2773e38fmr37055095ad.41.1778680204806;
        Wed, 13 May 2026 06:50:04 -0700 (PDT)
Received: from [10.219.49.212] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e75fffsm160721795ad.59.2026.05.13.06.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:50:03 -0700 (PDT)
Message-ID: <407abe2a-3a82-40a2-8072-24ba927bfd99@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:19:59 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework for runtime PM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
 <20260508113636.3561383-3-ajay.nandam@oss.qualcomm.com>
 <b2e69a76-e484-4b48-a0a6-89279e597da1@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <b2e69a76-e484-4b48-a0a6-89279e597da1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tixSSKYXVIuHFFFMHRl0KgoTv0lTn7-b
X-Proofpoint-ORIG-GUID: tixSSKYXVIuHFFFMHRl0KgoTv0lTn7-b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MiBTYWx0ZWRfXxRrtUd1AUM1V
 iRiTPyeavbuMiE3WhJQgYk5+BMXqDaWzdv+dN1IcNFlj1JYDhbvcw7S4G7aJ36fF7sI8qoq43fx
 HcVzsOqaOoVVrFd6qcQhMv9+THVpq4mx1845uT/qONVYivqno2VsWWYA77smwDJdq8q4QHDL24T
 /KzSr3G3BKpEO8wAkXrww0vJhe9vC6czKpQ24cwA9jy/4p7dqHMozwudXD9XkvjnQxhDIfsvOaW
 +LT65leGiRp5R4SOy3RAQtm1e2YrrbWo2GfgIEThHSk8eteaWcEIR6dS8qm2tFoLRGHdQFQnZCu
 sUFfrSLfmnIW3siP00E6nMDr+AHScHKhk6U1HF8jessmxjdHe2XnX7QcXaDA90BSPL3rtJ8RWnM
 aX+z7aNVOKyh1tIdvtwC49mZhS3y5ac9zhDS9bTWCgBAVKO6o+7HqVNL/aEbR0VFGvigu0jMYcH
 UI7gzl0JbHO1QBxjbTw==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a04818e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=wtJw0QWr3tSJ1Ft8UIIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130142
X-Rspamd-Queue-Id: 85A54534CAC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-36755-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/8/2026 7:10 PM, Konrad Dybcio wrote:
> On 5/8/26 1:36 PM, Ajay Kumar Nandam wrote:
>> Convert the LPASS LPI pinctrl driver to use the PM clock framework for
>> runtime power management.
>>
>> This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
>> improves power efficiency on platforms using LPASS LPI island mode, and
>> aligns the driver with common runtime PM patterns used across Qualcomm
>> LPASS subsystems.
>>
>> Guard GPIO register read/write helpers and slew-rate register programming
>> with synchronous runtime PM calls so the device is active during MMIO
>> operations whenever autosuspend is enabled.
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>   	for (i = 0; i < g->nfuncs; i++) {
>>   		if (g->funcs[i] == function)
>> @@ -119,7 +133,9 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
>>   		return -EINVAL;
>>   
>>   	mutex_lock(&pctrl->lock);
>> -	val = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG);
>> +	ret = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG, &val);
>> +	if (ret)
>> +		goto unlock;
> 
> Please remove the mutex_unlock/goto calls and replace the
> mutex_lock with guard(mutex)(&pctrl->lock) instead. This will use
> the scoped cleanup mechanism and let you simply return directly,
> shrinking the diff

ACK, will update in next version.

> 
> [...]
> 
>> +	pm_runtime_set_autosuspend_delay(dev, 100);
>> +	pm_runtime_use_autosuspend(dev);
>> +	devm_pm_runtime_enable(dev);
> 
> devm_pm_runtime_enable() can fail, please check its return code
> 
> nota bene pm_runtime_put_autosuspend() also can, but it's much less of
> a problem

ACK, will update in next version

Thanks
Ajay Kumar Nandam

> 
> I gave this patchset a spin on 8280 CRD and seems to work fine, nice!
> 
> Konrad


