Return-Path: <linux-gpio+bounces-36759-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKY4Ne6RBGoVLgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36759-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 16:59:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 473C65359E6
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 16:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 640B53136904
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 13:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F632BE630;
	Wed, 13 May 2026 13:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HPGiUO7m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0guWT17"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EA0201113
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 13:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680516; cv=none; b=sBfZ9yuJ2mToLt+Sa8qW30/KbuXhY8FRYeZyLd08q19cbZ6FINrmMeqIwOo9hMyR1Km7+tj+6NnATg0szVq6Nr75oVSTnmjl6i9s/VyUWgk+UeL463DKTZUYuZrQGMNd5P7JnheTr0lxaK9Uxp44Dsm6urkdF+EONHzGSQ6d8tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680516; c=relaxed/simple;
	bh=Sg22Ki1E0LIq6tnDfW9dCTXcNsA+L5xOvP7nRby3elc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YgkT0EiN0U+eqKwqwWXuaLTbc+1wsU7J6kp6jZ5hWBiLGo+pA0G5hIX57nk54cUKK4wnq1+ybrDzg2nfF30TMD3IaAP9TaDxV6aSyWmwdM3/hJYjQXXGfCGcAwUeMvd5sn1w9AICr+2V+wZHySMqgwI/jMYOLzVskBuRlmwlVSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HPGiUO7m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0guWT17; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8rM3i4082621
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 13:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ANCRzftwcS6j7zoWU1eRpFbLwKzNuEIw5aZkdck9U0M=; b=HPGiUO7mto2IzB4S
	pdMQ2NtnSqHjvsYfCLl+JZsT471Nl1jcgMjdDsbZCCUtBdLh5QWUTYpMVk4pNaCM
	sB3o9sM5c5hVHLNCjSqv+be3P8fS3xOc8wORoq+YD2ffudPBVs9Wa+pU/mqSIm8u
	jDu3fusTgdpvFNU76634UXbAlA7bCMkdCZeZyUrYfunaR8H0PjFlTRP1190BQKmV
	tdk2bdtlv4Y33SKSxMH4QKyRC3FAcehaDjV1GwQBfaBZYBzsw6atuSRyXh5Axz4V
	CGhv6P1RLcRlUlGF7NjvjWob/cXuw45qiYJOkuIEpNe8gVPiDnFO1B3aJGspgxiC
	YUFE/g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e13ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 13:55:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8024fc7032so3520813a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 06:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680514; x=1779285314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ANCRzftwcS6j7zoWU1eRpFbLwKzNuEIw5aZkdck9U0M=;
        b=L0guWT17jOl22gyCnwpnIKpYvU5O1SVQI9YSy1y7VGIuX45mP0pomXiX16Jrfst9+4
         fgLIO7TOlE0tNdfCfjhbzE2tujpbLQ4frFFZosoEQ0OxZt5zfQ4vn5ADUBvZZgTczR9v
         Wlg+8mdDd1xhc5EdZ+dpGqV9rboM95O6owLyPId7yM1/Tb25bm7fLL/u5jTJQupQhLSp
         KX9R3+IOwXnMr1hEeEJrHMky28TP+hl4UPoepkQtx2emZyhe1aKLLJ6zIlTVOn2uAmPy
         aUWVMHZdSjcYUA3XYPn0wYJF42HQ2IBbi5hNBAdiTUSnwoMPfekO0UWJpZW4Y51fYQ9J
         GnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680514; x=1779285314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANCRzftwcS6j7zoWU1eRpFbLwKzNuEIw5aZkdck9U0M=;
        b=oJMqfRneRnu60NRs27BoUVt8kgFWJzBEw+5MvQeQkPKk0oT5xCkgMI2+q2fxpdBLPY
         dJsFT8SIAjKk1GPNPiGhIvYumeJho0ZZZcVHBuqIuUor/vF0pvhYDecTXZnVsdGEujvr
         4DkmH9Co9dZ4al/KnQpKAm9/s5yXWIRDieVkJT07wxQIeVli+1VUEG1UyKTo+8I/vsdk
         jqDOG8akC91vCYP2Uxom/D7r957nptJXoarwFjo+FWFeTAYKjm2KuUNwg+25Tw7KQhVK
         lyrVFdfaVU0jG/Y5lq3y7OqjdyJOmaVutTRBgffGwdroh3OChofbmv6q58/wOsmzM06P
         rW0w==
X-Forwarded-Encrypted: i=1; AFNElJ/wW5KKez57bRg8LVj1Gvd7uP0JbwUYqqGD65J7utfLJYGH7xV7Wa2qcH33t5e90WSQXVuIk/UVOKfR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj66j0yTLjW1PMpfKQ7qE6C5bFbAvKwpsCFFTQjfpox6mtVAVh
	oSyaJitQEb2npIrN5NhRx0qYShBJijAC5NuTxbetZvm3yqtsp6JGXQ5i6MXQ+3FeKq6QqFnkbRC
	zfGDxtRgNo1yyonNRyoNjMNboqmllOHIPM7q2reJdXSgvs+7rzmqPXC60ZQHRIOU1
X-Gm-Gg: Acq92OEhO795HPd98NkemW8D9wkArc/dpXoc93XkS6TnpEEO6f8HIKSrslKCYDeglJQ
	4WtGvR1rpKjwdY2RAaCXywRDdZ41wKHV9sN1l0QAvowhF1GBigRlXnCOQflKmfi0m5hl4hH+QvA
	t5gcsq6xakT61rMyB0nPCr9zlFFDxA34H1Na7eswtX9KOrIHEmGK/Wj+vcBRMAE7ukaqUtFK5Ll
	PGAsn+69pLnUi34AO6SfY6BRaphtgg96KbwQP2zekGYR/EKChbtL1PM5iQe6Q9VUam/XFeRjJq9
	e8wQZJXU/TYRwl+dp9/ODs5iEm8XfVp6ult1jZDsFk7UVe1R5QCxjKzf3Qh8LAQUcxysMQpVcyK
	aI+wNKXOLeVddLYh6EINuwnSApzx12AHSHc41bsEKgcK64vQRgg==
X-Received: by 2002:a05:6a20:431c:b0:3a2:d976:2210 with SMTP id adf61e73a8af0-3af8006b01fmr3709087637.8.1778680514105;
        Wed, 13 May 2026 06:55:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:431c:b0:3a2:d976:2210 with SMTP id adf61e73a8af0-3af8006b01fmr3709039637.8.1778680513521;
        Wed, 13 May 2026 06:55:13 -0700 (PDT)
Received: from [10.219.49.212] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267688fe2sm20084373a12.9.2026.05.13.06.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:55:13 -0700 (PDT)
Message-ID: <8cdca0cf-7b36-4aef-bc93-c611611b32b7@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:25:09 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] pinctrl: qcom: lpass-lpi: Enable runtime PM hooks
 on remaining SoCs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
 <20260508113636.3561383-2-ajay.nandam@oss.qualcomm.com>
 <gkgffuxfown5esdo6s6yg4povzskhean5hzd2yowsiyxrpkd2h@oa2fs63ijmym>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <gkgffuxfown5esdo6s6yg4povzskhean5hzd2yowsiyxrpkd2h@oa2fs63ijmym>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Mn_lwgk2RPqvrZK2k23CQgUaatv2qVWe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MiBTYWx0ZWRfX68HuFkEgyCgP
 icgT30FENpF3w9mVo6/XrNSxYmTIWtnSqY7Lsmnt4IpISC0wFDWyLK/WJ5PKiyi4LTWQ5tiIwlz
 RNqwPP1qkvWotIiBrKBBoEC51HJs/oeC6LfTyBlzoPP91LAYVwEd/wxudgcxczZfjpYs12GVivA
 NbhMCbA7Z249A0GxFLoiGLSccgKpTM/8d5HF/bPSghUItElLufIOtqFh3pSI5GhGYy+Nze5n5VY
 kBdJAEiAvvMxNaM6fMjp7rFESZjz/zeOKqVzm5KtqAx22f5+F9OZ8lbX/G99Pdb4HWNlGi0wEbw
 8LbNrpnfaZfE0bT7WplGsbjF2Vae3uMhK8Mu4zO8HkLpIAQif458nspjwu+TPa4YHrqlozAtKfX
 ABX57/WNRthF2M/Tm6Nx+HBv8AKf1MZjm4irBF1bwLKZcyC6yUZh7GMVx8QgDOiU5LBcrcfHpsg
 rHjXUST+HQOiXlcDx/g==
X-Proofpoint-GUID: Mn_lwgk2RPqvrZK2k23CQgUaatv2qVWe
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a0482c2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=lFrEOrpXHASGKh8PcUEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130142
X-Rspamd-Queue-Id: 473C65359E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-36759-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/13/2026 6:18 PM, Dmitry Baryshkov wrote:
> On Fri, May 08, 2026 at 05:06:35PM +0530, Ajay Kumar Nandam wrote:
>> The LPASS LPI core conversion to PM clock framework relies on variant
>> drivers wiring runtime PM callbacks.
>>
>> Hook up runtime PM callbacks for the remaining LPASS LPI variant
>> drivers so all SoCs using the common core get consistent pm_clk based
>> clock handling:
>>    - milos
>>    - sdm660
>>    - sdm670
>>    - sc8280xp
>>    - sm4250
>>    - sm6115
>>    - sm8250
>>    - sm8450
>>    - sm8550
>>    - sm8650
>>
>> This is a mechanical per-variant driver update that relies on the
>> same generic PM clock flow (of_pm_clk_add_clks() + pm_clk_suspend/
>> pm_clk_resume()) and DT-provided clocks.
>>
>> Runtime behavior was validated on Kodiak (sc7280).
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |  7 +++++++
>>   drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 11 +++++++++--
>>   drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |  7 +++++++
>>   drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |  7 +++++++
>>   drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |  7 +++++++
>>   drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |  7 +++++++
>>   drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 11 +++++++++--
>>   drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 11 +++++++++--
>>   drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 11 +++++++++--
>>   drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 11 +++++++++--
>>   10 files changed, 80 insertions(+), 10 deletions(-)
>>
>> @@ -173,10 +175,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>>   
>> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
>> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>> +};
>> +
>>   static struct platform_driver lpi_pinctrl_driver = {
>>   	.driver = {
>> -		   .name = "qcom-sc8280xp-lpass-lpi-pinctrl",
>> -		   .of_match_table = lpi_pinctrl_of_match,
>> +			   .name = "qcom-sc8280xp-lpass-lpi-pinctrl",
>> +			   .of_match_table = lpi_pinctrl_of_match,
>> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
> 
> Incorrect indentation
> 
>>   	},
>>   	.probe = lpi_pinctrl_probe,
>>   	.remove = lpi_pinctrl_remove,
> 
>> @@ -134,10 +136,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>>   
>> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
>> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>> +};
>> +
>>   static struct platform_driver lpi_pinctrl_driver = {
>>   	.driver = {
>> -		   .name = "qcom-sm8250-lpass-lpi-pinctrl",
>> -		   .of_match_table = lpi_pinctrl_of_match,
>> +			   .name = "qcom-sm8250-lpass-lpi-pinctrl",
>> +			   .of_match_table = lpi_pinctrl_of_match,
>> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
> 
> Incorrect indentation

ACK, fixed in V5.

> 
>>   	},
>>   	.probe = lpi_pinctrl_probe,
>>   	.remove = lpi_pinctrl_remove,
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
>> index 439f6541622e..a79f99ec6df9 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
>> @@ -6,6 +6,8 @@
>>   #include <linux/gpio/driver.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_clock.h>
>> +#include <linux/pm_runtime.h>
>>   
>>   #include "pinctrl-lpass-lpi.h"
>>   
>> @@ -202,10 +204,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>>   
>> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
>> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>> +};
>> +
>>   static struct platform_driver lpi_pinctrl_driver = {
>>   	.driver = {
>> -		   .name = "qcom-sm8450-lpass-lpi-pinctrl",
>> -		   .of_match_table = lpi_pinctrl_of_match,
>> +			   .name = "qcom-sm8450-lpass-lpi-pinctrl",
>> +			   .of_match_table = lpi_pinctrl_of_match,
>> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
> 
> Incorrect indentation

ACK, fixed in V5.

> 
>>   	},
>>   	.probe = lpi_pinctrl_probe,
>>   	.remove = lpi_pinctrl_remove,
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
>> index 73065919c8c2..9037ef0020da 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
>> @@ -6,6 +6,8 @@
>>   #include <linux/gpio/driver.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_clock.h>
>> +#include <linux/pm_runtime.h>
>>   
>>   #include "pinctrl-lpass-lpi.h"
>>   
>> @@ -210,10 +212,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>>   
>> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
>> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>> +};
>> +
>>   static struct platform_driver lpi_pinctrl_driver = {
>>   	.driver = {
>> -		   .name = "qcom-sm8550-lpass-lpi-pinctrl",
>> -		   .of_match_table = lpi_pinctrl_of_match,
>> +			   .name = "qcom-sm8550-lpass-lpi-pinctrl",
>> +			   .of_match_table = lpi_pinctrl_of_match,
>> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
> 
> Incorrect indentation

ACK, fixed in V5.

> 
>>   	},
>>   	.probe = lpi_pinctrl_probe,
>>   	.remove = lpi_pinctrl_remove,
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
>> index f9fcedf5a65d..513ddc99dd37 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
>> @@ -6,6 +6,8 @@
>>   #include <linux/gpio/driver.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_clock.h>
>> +#include <linux/pm_runtime.h>
>>   
>>   #include "pinctrl-lpass-lpi.h"
>>   
>> @@ -217,10 +219,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>>   
>> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
>> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>> +};
>> +
>>   static struct platform_driver lpi_pinctrl_driver = {
>>   	.driver = {
>> -		   .name = "qcom-sm8650-lpass-lpi-pinctrl",
>> -		   .of_match_table = lpi_pinctrl_of_match,
>> +			   .name = "qcom-sm8650-lpass-lpi-pinctrl",
>> +			   .of_match_table = lpi_pinctrl_of_match,
>> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
> 
> Incorrect indentation

ACK, fixed in V5.

Thanks
Ajay Kumar

> 
>>   	},
>>   	.probe = lpi_pinctrl_probe,
>>   	.remove = lpi_pinctrl_remove,
>> -- 
>> 2.34.1
>>
> 


