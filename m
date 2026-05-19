Return-Path: <linux-gpio+bounces-37112-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFzNHh7jC2qdQAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37112-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 06:12:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 265A257725D
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 06:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 208A8304224E
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 04:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94AE22F9DA1;
	Tue, 19 May 2026 04:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SX+keWtm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jjyhiN8T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1F927816C
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 04:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779163858; cv=none; b=RJV5SHl3TgQTSTFztzp8sSt7Ic3pcbE5LaqD+BjgczOiT9W9eGHJhA8TPVaKVnOjY3fOvQUuAgNKncWEx3Reh1pCfIr4F1ZMdmWp+GOGShYViA8qPTr07x0lFHLuquBSUiAABzKJBpkxmPOV0N8rlE2OIznVtS6xpkmZ++WQPY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779163858; c=relaxed/simple;
	bh=YD5pRqb32Rg6/ph47dYp8qW1E2jdfQ9SNzh5AXty/Bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lCw8Jo0Z/e05epWZM/IRBBW+7Nfcyxl/dJQt4c5+0hlnyfTA9eFpXkLRL3y7tvloClU1w15tuHyBKYpn0Ch4FHanM4PMZGeaFso+PeYmlD8RKbPzBCtZb0K/U4Vcj/zVeyGnwb+RFz+UJ2Nt/MtjZY4OZ83u8hxwwXYehjj9m0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SX+keWtm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jjyhiN8T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J2QhlH2091050
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 04:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F41BO6haCztjrV3WpmCmogDphocXyTbUMlCrviX1MQQ=; b=SX+keWtm/wEaYrJ3
	dDX4B0kuyajaNJSdt/DcKCb3dNc80Ip1L2gJOHABUig/ew+3PFbvHMyzju68P4Lc
	yJHIRTH5Ho/v0HRnnnGQuSvOOAlJnzQIoozIg6l9lAEVJJWTJ4wselBR3giX9v9E
	xVwF5zBbErP2sZ6rMz/mpQd2G525H5MjjRwUiU5pEsIFOf+0LU06bZsnguVWNk+H
	wMLsTZp+KQTugkjWEZWEjdJNYDjZ5NSWI9NQ/RjTEAeQeheY/MI5UQuEKbARWDPS
	gW2Bet+Zk0dH2orNMLOC2c2mMTUloT18IMjZT6siQ4wWQeKEuvsMEqSfLVmFrDd9
	aMKIEw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpkm9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 04:10:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-366122e01fcso3140965a91.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 21:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779163854; x=1779768654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F41BO6haCztjrV3WpmCmogDphocXyTbUMlCrviX1MQQ=;
        b=jjyhiN8T2qd3tPovWup9RCTDXg59pAVJ62jdUnTOXqzCGKmJ39Y/YStdKQ+F4Fj8Lb
         5itXis5Xqnc9zwKrMsYYyhHNbqKPO0c/xik+s1gDLVd8PFtAitIKsmH0Hn3X1qA9CNcI
         +zJ1t4oaUkZ2GZWD5VOm95y/rtHG2GvG1beky6Wwjwc300GdNLtw+/auPwD5GM9RwIfR
         IWHK2M97ptASFevZqPCGynmauMU+YrmTkl5pyBqzX+x3MK9PDXgkURf59Hqr/8i5fps+
         IGgQnkAPI4BVq4GOyW6CdRbefxcqfmU5bdSHS/uPfg3zkknYOEIpKMH7WPW8foYgNaUP
         kSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779163854; x=1779768654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F41BO6haCztjrV3WpmCmogDphocXyTbUMlCrviX1MQQ=;
        b=BBS/3Q++rcW5tMVHzq0pigoELpITyFqBNCjq5ZzL0ATv7oqWPwZXtbO1Lpqqt9EWTA
         Oyk3QcwLtHhWXSJWeeAfnyuwp316OadWwpksrqrm+4feNs5veTQ2gbTo03BAwVqJilQx
         XCyWPLtKwnBwg+CTVfRDjLsrUQbRFLIrh0tlmmUsb5nS0IEDlNI8DUIcffVlrEd+Yswe
         80ovXRffiqALDLxFvyU3s7wcX4qzHVXmVQ4QjN/oko/Yp+BgZ5hykkDTChW7ZUKHQpoE
         2E1/TB74nhfGXy//r642uw5eGmPhpX0bbYuej5MV0vvKSv/+R30ho6E4RlM2BdaAWDjT
         JeDQ==
X-Forwarded-Encrypted: i=1; AFNElJ9A2cbAwGC7joYh+0RXgg0zYx+U/+E+1nzRCRIQtw6iCfBik/g+TK9ZrsI6ZLEfIRKBrcApS0GrUxxs@vger.kernel.org
X-Gm-Message-State: AOJu0YxE1Fd+8AgYh6tV588AuOQL7vrrKR6BCS/Mw39jA+as/XrOr3s2
	He5zulSFCxmkWLXgoVNIxCUd02IAYHTPzsxQpzLBxuzLGFfK4vZ7PJbvt/fMka4d8Ygtb8Zkhu/
	DI1jNXbri1fyNWKV3umdeyj5ijhw5jcnWZ/1RDo3pIHUgy5rjsMI2rVVhaW5irJ9V1rmadMJ3
X-Gm-Gg: Acq92OFVbCCkb+LClGAWCp95ZBAgrZWBi5gf8KGHz1cKLfWuniAd1SVxSAuu4Cj8uz8
	8zbR4ONG0cYMVynVo/dydawmVU6MFEv5/lvBE0y8mEtz1+9JEgl3BTZuY+UhA0zZHjs/DhgcMme
	P3+QL+yZCqHiBuuBx2HhHmWxSSN1MYdPJXE+KozZP/syHok3ciKby2ALXQKGVoxE/jJQAe7+pAJ
	HCGNeC+QUI5KMwSjRqdwe2ttL2PbDJsPtQ1wSRjhXXe23bTWMTNa7hoccOUifZCuC0i9EPe1wOC
	8/ZZB0Xfv72g+/Tebphcf8HaME2UT3gyyBc16wrZqJ5nyPX5hetcw5/EUADFS8G8RIzH3+eP7gf
	8inlEU4nSLRqHLgFMcSauHHNPAipyNTpYoCo23OTgGQ+piDL6zbg=
X-Received: by 2002:a05:6a20:3d1d:b0:3b1:6649:e524 with SMTP id adf61e73a8af0-3b22ebdbb2fmr20201299637.33.1779163853982;
        Mon, 18 May 2026 21:10:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d1d:b0:3b1:6649:e524 with SMTP id adf61e73a8af0-3b22ebdbb2fmr20201274637.33.1779163853488;
        Mon, 18 May 2026 21:10:53 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0ff0edsm15579177a12.20.2026.05.18.21.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 21:10:53 -0700 (PDT)
Message-ID: <a6a69bb8-79a9-4e12-888f-0b16da9c989d@oss.qualcomm.com>
Date: Tue, 19 May 2026 09:40:50 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Replace open coded eoi call with
 irq_chip_eoi_parent()
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514-pinctrl_msm_irq_eoi-v1-1-2d152f8695f8@oss.qualcomm.com>
 <agvW8hetKSsPAXgv@baldur> <agvXluPCLIQlq267@baldur>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <agvXluPCLIQlq267@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sY-CEWZ6SBE_AB_WHDA0UjWgYdvsYv_P
X-Proofpoint-ORIG-GUID: sY-CEWZ6SBE_AB_WHDA0UjWgYdvsYv_P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAzNyBTYWx0ZWRfX1Vyzgai02bw6
 K+BT/LYWvDQ5SF8Cjr7+pZyn+Zr4Pa7Bv6n9DAsY4BYT8BeQXRcS3gP8Xm0ip5WMzARZcZJgF56
 U/viLdVjr14P0JrW1LfyLO3s4R6Za3nMx7uLqjZOUL3jGrZ/ws7aTVO4BznuF8KRKtk17AP8LPU
 wh2p0QGWiLWngMbEtSoCIqF9Uw0ZMLmM5zloQ28LhCWvCAxAAyEr4hZNzZ6egAKCph5kn5G9wRA
 o7e8Momykvtrh5LYkPP3+A3dtRPcsA0Da+P0XQqJ9uMjanOaxMIORz1/tmUzzNxQ80IYrVUSDy3
 4i0Uh5Y+LQVJJ43OPx4qNbKAcZqgc9avsotYB88t9pVo2g1LATnhB4zv+GJb5rpP/YBPWTbv2WI
 Xxr1tfCrlk8k3lNihAttsfYE105YoR/ZiZ51F23hH4wnHH+Vh7IvL75GODQZt/v/scO326oOoci
 lZ0jLWEX8p0Vkb4OKOg==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0be2cf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ShOtjy6-wzECGNJG7jUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190037
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37112-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 265A257725D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/2026 9:03 AM, Bjorn Andersson wrote:
> On Mon, May 18, 2026 at 10:20:55PM -0500, Bjorn Andersson wrote:
>> On Thu, May 14, 2026 at 02:08:25PM +0530, Maulik Shah wrote:
>>> Replace open coded eoi call to parent irqchip with irq_chip_eoi_parent().
>>>
>>> No functional impact.
>>>
>>
>> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
>>
> 
> On second though, I'm not sure I want to r-b this patch.
> 
> The commit message explains the action of the patch, not the reasons for
> the patch. From the description I inferred that irq_chip_eoi_parent()
> does implement what is open coded here, and a quick glance confirms
> that.
> 
> I'm guessing that irq_chip_eoi_parent() didn't exist when
> msm_gpio_irq_eoi() was written? Or was it not used for some reason?

irq_chip_eoi_parent() did exist before msm_gpio_irq_eoi() and msmgpio irqchip was using same
with a condition that pctrl->irq_chip.irq_eoi was only initialized to point irq_chip_eoi_parent()
for the cases where the gpio had a parent pdc/mpm irq number.

Later via [1] (as part to make irqchip immutable) pctrl->irq_chip.irq_eoi callback was updated to
use for each gpio interrupt and hence requiring the check like below inside eoi call to invoke only
if parent data (PDC/MPM) is valid.

   d = d->parent_data;
   if (d)
      d->chip->irq_eoi(d);

[1] https://lore.kernel.org/all/20220419141846.598305-8-maz@kernel.org/ 

> 
>> Regards,
>> Bjorn
>>
>>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>> ---
>>>  drivers/pinctrl/qcom/pinctrl-msm.c | 6 ++----
>>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
>>> index 45b3a2763eb8..6771f5eb29e4 100644
>>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>>> @@ -1012,10 +1012,8 @@ static void msm_gpio_irq_ack(struct irq_data *d)
>>>  
>>>  static void msm_gpio_irq_eoi(struct irq_data *d)
>>>  {
>>> -	d = d->parent_data;
>>> -
>>> -	if (d)
>>> -		d->chip->irq_eoi(d);
>>> +	if (d->parent_data)
> 
> "I know that irq_chip_eoi_parent() will peak into d->parent_data, so
> let's peek into the object first to avoid it dereferencing a NULL
> pointer".
> 
> I see one other caller to irq_chip_eoi_parent() doing this, most
> everyone else just register irq_chip_eoi_parent directly in the ops
> struct.
> 
> Are we doing it right?

Yes, because some gpios may not be wake up capable (they don't have their PDC / MPM interrupt)
and for such cases irq_domain_trim_hierarchy() makes irqd->parent_data = NULL, so this has to be
checked using if (d->parent_data) before invoking irq_chip_eoi_parent(), since internally
irq_chip_eoi_parent() de-references without a valid pointer check.

one can argue that the valid pointer check should be taken care inside irq_chip_eoi_parent()
(and all other irq_chip_*_parent() APIs) but i guess not all irqchip have cases where
irq_domain_trim_hierarchy() may be invoked and it would be overhead for them.

Thanks,
Maulik

> 
> Regards,
> Bjorn
> 
>>> +		irq_chip_eoi_parent(d);
>>>  }
>>>  
>>>  static bool msm_gpio_needs_dual_edge_parent_workaround(struct irq_data *d,
>>>
>>> ---
>>> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
>>> change-id: 20260514-pinctrl_msm_irq_eoi-ab736e16d411
>>>
>>> Best regards,
>>> --  
>>> Maulik Shah <maulik.shah@oss.qualcomm.com>
>>>
>>


