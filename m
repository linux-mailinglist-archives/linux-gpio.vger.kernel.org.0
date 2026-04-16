Return-Path: <linux-gpio+bounces-35196-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGTqKf/X4GlymgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35196-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 14:37:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C83740E4E8
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 14:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 363283043D01
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 12:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4856B3B892B;
	Thu, 16 Apr 2026 12:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIZa+0gv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AwJc+2sd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FB03B38B0
	for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2026 12:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342777; cv=none; b=tL6hpBB+6pLc5Y93vvZDySomZUbpcg/joYIxqSTSNPRaYc+nGwjsPXwW4Y09dTxUubKhsls6RfwC7An0rALEgWME5OV1Y+7Q0uLAfVO7vx1sXPkMDu11+IwYNQdiESmoi5tgVtEtARKvV2Ombq7rU3oqbjTAUPFWKuHLlxrNmtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342777; c=relaxed/simple;
	bh=cwE1pKm5PJA5sW7aqFj52asvuoc1NO8t4F4Tt0GXABo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+MBKJh/JlWVNGsvkKwYrosW1Zrjn3wrZWNUnqYUBBe9qnloUMMVsiCdYTIOfnWZmSvZbfpJhJWBTb7EmVCiiqEO6M1wcAOnHUg//CAf6nlcZ/v8h/i9871Fb79rlTIil4ef8AJbfTgXugl7wkMhz2wYBhfVgyfA/aoK29Dqtzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIZa+0gv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AwJc+2sd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8CXIp2576111
	for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2026 12:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+j9Ne7osd79sCPFakjkyiz6R7TFYBWznjRj3B5Vnuc=; b=gIZa+0gvPJBkOEcr
	ZYMkHmJruDbYYrXt+yCctRix3Go4E5tFyvdg5NUzTFD2aAUMSfzxE2+YfYIrE/fH
	B2ukGpSh4uL0p17gcBzjPVwjHL61E3Fj7Kgk27ZFcjO4766fVxqBDQ1Yic2pAgv6
	3cNzjYAieVQyRafmrQG/xa8KU3gKv7xWZ4GVXx4JLzcfYvO0Lep49I4WeLHASDz4
	GlCgA9j7LDe8jbjsiDlxTiG45rv+VvSAabr5RHiSTUXfX/WZYAFXcr8I/5hxbfgK
	Uap9lIEGm93G/qekm2ayqA0O3Tmjel86Fv+1FOJjjbARH3dN50E4XK+CX/rv6txe
	GIpT6Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djv27gxc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2026 12:32:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b454cac322so45652855ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2026 05:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776342773; x=1776947573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+j9Ne7osd79sCPFakjkyiz6R7TFYBWznjRj3B5Vnuc=;
        b=AwJc+2sd5nJ74xXVtTDZPT6QC6SjG6gK/xZD3a6VwnLCUL65zRWvUNOj8C4DszMHv5
         vh/AnaFT9JLbj5JJs91wRdovWsyOF26blMmczgBvcJvdSP4kyKwhQiCwS1yOZsqJvleU
         vPwsblgep1CzKPzbSd4H7azxnyqvS/JrBz+n4tJt5MGl74LtKIxibw7lywWWE/Z6KAcb
         dsZsomwZ6keeIRnbp0B6Eo8wpy62nJVp55YRuePpH9Vn+KD4c/36RHJ1SeIe3bEnX8A5
         iIGHGeczSVrr5sEbqUdkLniEbhTw5KMniYqDDbZv/+BOMAw4BgI//xfBP3Zhf5v/4tJD
         6HYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342773; x=1776947573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+j9Ne7osd79sCPFakjkyiz6R7TFYBWznjRj3B5Vnuc=;
        b=mGFnXyE5kC/HnaQjA+5RsymbsC5w2J1V1eN+vc+qVBYC82ifsnYRboerIJlwy/xOdT
         h5gpnugzOo8x1Ixc6dOT8NLQgML+YKmhJ0AwT41FpeioKDAJvJ5qFnLA6DVD9TYQB2gZ
         s6xfG0IauWgcmPM3lZpK6zZZoM4vfscQ2BbS8UH1uaFd6hg0W2SMXHOl1KELXJ5Fp8Xu
         aZXw84okJWzbTxS6Ak5Y7GXn/TQRHZRSbJLPFZk6cfBjKt/WwUdPDtIhi8ZTvEzXV/oQ
         ZDk+zGz/bnBOyuwER5S1yo7+Om3yhD7QBk3Z9DZFF8C/OxWSN28Zr+g/aciWWJc1X4IN
         aOww==
X-Forwarded-Encrypted: i=1; AFNElJ+vuwwxeHoPQxU9HyiJLr/YlG2rML56dtm+OhmhAU8Ykt9HRtWIh6fMhj+Y26nGdm7gNuYoLx8yb5pF@vger.kernel.org
X-Gm-Message-State: AOJu0YyRqfKpBaL1cQvyL9v30UeNHtC7tvUGlu6yC6422b0ToSG0efZw
	9RXK6JCrjBTokHMOhSKEmhv65zOUscRlXPJnb+MJ3kQJa1Dz05JHLbg06exaIrar5rEI11npU8h
	yTen3j5JMzvGNWEkthwKfct1q92Ed9bCCYEwCoYX+Id0JYpd0eNQFroTCr2j+0qbHcg322Jc/
X-Gm-Gg: AeBDieu9YpmzKt+15qhuIydGsTHrMlCOmWKG0z2QDWuqwJW92ObATnPNhQDB1HOB0dn
	g2G6Wn1vJjsVD+JKoWR+nec663R6EqKbAtVuPovSLQPdVBve20GmGWvFNqgHt7Q8I/viV8jte4V
	QN8LL9+YfV7SyfccqSDc++Za86tPmbxjglLSq84Tp35lp+DwoaZ5oMEAxLQP71HKY2ZTvZ80d4Z
	LaD02AjQ2M847f4+GxTYNsGFNeZqSppo3wZC+zozixq/9iwbAexSqmWJGBps4A4QrbCziJ8LKUi
	5K9RMlqtDg6xCD3MhiGJ8KoG9NoHUg7p/KDwHBACa5dlP2ZiRUbOpXhNRnJSnuEdkQ2bVfuOa0L
	uj6eWOg3OtNQwvZz3U3+HO2DF+YZkjaOfgu0DEiwjAXs1CWKvvg==
X-Received: by 2002:a17:903:98c:b0:2b4:5b1a:d09c with SMTP id d9443c01a7336-2b45b1ad1ddmr181277425ad.15.1776342773447;
        Thu, 16 Apr 2026 05:32:53 -0700 (PDT)
X-Received: by 2002:a17:903:98c:b0:2b4:5b1a:d09c with SMTP id d9443c01a7336-2b45b1ad1ddmr181277225ad.15.1776342772961;
        Thu, 16 Apr 2026 05:32:52 -0700 (PDT)
Received: from [10.219.49.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782a93c7sm49156115ad.62.2026.04.16.05.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 05:32:52 -0700 (PDT)
Message-ID: <9963cee3-cd65-4583-b21e-0ac4eaca9bf2@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 18:02:49 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework for runtime PM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
 <20260413122233.375945-2-ajay.nandam@oss.qualcomm.com>
 <0975d136-0013-425b-a465-08f07efcefc7@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <0975d136-0013-425b-a465-08f07efcefc7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PJQ/P/qC c=1 sm=1 tr=0 ts=69e0d6f6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3rPMQvdw1QVwHz-kkGoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: jqVMDprkOjKLaTDiTnR0qr3p5YwLVO5q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExOSBTYWx0ZWRfX7GZ5wnlI2cG9
 eNjq7kNLDPThuw9DgVHA9My5eTl/2/OobTuEaMdiL8HAUFTb2DSoajv2TWFgWVMtT/g2gZIneLA
 OZDYNPaQA8vuWPz2GosPIQc/Dok/MEmS05lu97SKMQnqACnyZv1CuaKhOV08TijFMw7X+DtiF9C
 RBFzrFabRVFnWMBteNsdS/7iCTDN2D7boRxRGaFdC5uWAzfnzfRhg0sMJGP55Co+aasdXM1kf19
 bi6KTS09QUDrlXdljjiOz6Y59Ab5dVSKz3XbgStG1pNj+f4JRhrjERFOqGYnI1q9eHIlvFb0YKn
 z12uOzyVG9CyXWe0biyKjWCsOODvgXoHVzkX34e13+3b86uQQNRcHfw8XUEcOoS1wov9ssMmkyM
 Cq571FWA/ndPswRINk9hKzzzYtHK7nHZ4NL4X8JD4/zidwp8cIPFSszJVE9DXX28rfzASlJbGwe
 LZ0Lb1hxWw3b+24RuUA==
X-Proofpoint-ORIG-GUID: jqVMDprkOjKLaTDiTnR0qr3p5YwLVO5q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160119
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35196-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 1C83740E4E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/14/2026 2:07 PM, Konrad Dybcio wrote:
> On 4/13/26 2:22 PM, Ajay Kumar Nandam wrote:
>> Convert the LPASS LPI pinctrl driver to use the PM clock framework for
>> runtime power management.
>>
>> This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
>> improves power efficiency on platforms using LPASS LPI island mode, and
>> aligns the driver with common runtime PM patterns used across Qualcomm
>> LPASS subsystems.
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 36 +++++++++++++------
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.h      |  2 ++
>>   .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |  5 +++
>>   3 files changed, 32 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index 76aed3296..6d50e06ef 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -14,15 +14,16 @@
>>   
>>   #include <linux/pinctrl/pinconf-generic.h>
>>   #include <linux/pinctrl/pinconf.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/pinctrl/pinmux.h>
>>   
>>   #include "../pinctrl-utils.h"
>>   
>>   #include "pinctrl-lpass-lpi.h"
>> +#include <linux/pm_clock.h>
> 
> Please move it up, together with other non-local includes
> 
> [...]

ACK, will correct in the next version

Thanks
Ajay Kumar Nandam

> 
>> +	pm_runtime_set_autosuspend_delay(dev, 100);
>> +	pm_runtime_use_autosuspend(dev);
>> +	pm_runtime_enable(dev);
> 
> devm_pm_runtime_enable() will let you drop the manual disablement below and
> in .remove()

ACK, will switch in the next version.

Thanks
Ajay Kumar Nandam

> 
>>   
>>   	pctrl->desc.pctlops = &lpi_gpio_pinctrl_ops;
>>   	pctrl->desc.pmxops = &lpi_gpio_pinmux_ops;
>> @@ -539,20 +540,33 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
>>   	return 0;
>>   
>>   err_pinctrl:
>> +	pm_runtime_disable(dev);
>>   	mutex_destroy(&pctrl->lock);
>> -	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
>>   
>>   	return ret;
>>   }
> 
> [...]
> 
>> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> @@ -139,10 +139,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>>   
>> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
>> +	RUNTIME_PM_OPS(lpi_pinctrl_runtime_suspend, lpi_pinctrl_runtime_resume, NULL)
>> +};
>> +
>>   static struct platform_driver lpi_pinctrl_driver = {
>>   	.driver = {
>>   		   .name = "qcom-sc7280-lpass-lpi-pinctrl",
>>   		   .of_match_table = lpi_pinctrl_of_match,
>> +		   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
> 
> I believe SoCs other than kodiak also require this change to avoid
> regressions.

This patch is currently limited to SC7280, where the runtime PM behavior
has been validated.

Based on this feedback, I’ll revisit the series and extend the same
runtime PM support to the other LPASS‑LPI SoC drivers that share this
block, so the behavior remains consistent across platforms and avoids
potential regressions.

Thanks
Ajay Kumar Nandam



> 
> Konrad


