Return-Path: <linux-gpio+bounces-37741-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMSQMfgVHWqIVgkAu9opvQ
	(envelope-from <linux-gpio+bounces-37741-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 07:17:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 678796199B9
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 07:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4311B301D311
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 05:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729B323392A;
	Mon,  1 Jun 2026 05:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfH4QDxN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NMDp2Z2A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1792B1CEAC2
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jun 2026 05:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780291039; cv=none; b=iMjTfU/a6RHzlwHPQNrRIzXxBY4rj9IqaVVgcXQujBknPgTAnpBMmSpWybxer7VFC47r/BsTDgkfmTYh7iK2XTaoryCa6mj1NAGHpvGtp0HuCU58OXLQHKMG8Hs4d+MeGwTzPZSmH/akmB99fmZhwFZPK2tZtGO7KTv/X74yDyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780291039; c=relaxed/simple;
	bh=6gsGCN9fywOATamR24kEHpzEum26tdu1tLiSViwkxpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oiluk2vnGMq+KTCYYiUdULeT5hqEO4otVL4HJuPrn8B0APUllWdE5m4R/yVgrgRb5lcpoGN9d83w7QOKJ8tREAV6ux4CkEPAN+cFfGQUBPwFW80xKV+tCD8X1iumV+JJFkk9eg5pHdbvoW81bqVJMuC3gf6KwL64/T2loOnKu9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfH4QDxN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NMDp2Z2A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VJU1Hf1886235
	for <linux-gpio@vger.kernel.org>; Mon, 1 Jun 2026 05:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhDV9pl06TXs/rs3qAQNP2Kc91MF0S9ipRtDBoJkiVI=; b=TfH4QDxN1b645pWo
	JhC33efiy8Mhk6eu/lAtEE9GPc7Txr07P07e/YmpdG9Jgi0PSqLxrqK8bS13NQdF
	YAJSbTuOmAtsIQ2108+RfZ+RyK0ODulz/VuVHIlusJlkYAs5wdSGOV+3EmvnJ4vc
	2WMaO0eYwhPMRA9E8hA5xt/0Xce2mi61UJNX6wuHFqB+9rF8UoEbbMZd7zVK4DAe
	B9tiaFEsttDAqzx3cCsFVU4FvwaCr0WsoEWLiW3QgB/FMTSD8HBfxYbfHb3O9GAj
	nT6jhF2Y2bJ8bJclZ1Ex++GmsC7MjeK1uxOcDE9TmQpUbhwxrAMZi5FfLAPHaVgT
	oMdUnQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efqfxwsrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2026 05:17:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c32faa62so18449475ad.2
        for <linux-gpio@vger.kernel.org>; Sun, 31 May 2026 22:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780291035; x=1780895835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhDV9pl06TXs/rs3qAQNP2Kc91MF0S9ipRtDBoJkiVI=;
        b=NMDp2Z2AxHfDMPV1xJMWIin79HhPd0kIrd91Z0WlqURfa9trm73dZm2zzvZWNkk9RA
         3x280SXhf8S3DVs9HqEtBidpVtUpu1tGKYYo5WQaLhKb/shC3KoFVhq94K8+XoN0c9BH
         11zSxLlUPcd5fOygLDRQpmDAH61rVyt7EPHcZe/CSR+V84W6vZP7hsikjKDYwxkE28eG
         4vHu+drPa0O2YWKTyybwAZYlQCrRFH4HdTKSULVy2ZtYW13/kFd9Fn7Bt+9ApnE5LtOS
         fgAamyEUZCx5gODuQZZTK/KtkrIFa7JABS15pEzB2/oI4jowBuTuCoYlxIfSTULJ+64E
         9wJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780291035; x=1780895835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhDV9pl06TXs/rs3qAQNP2Kc91MF0S9ipRtDBoJkiVI=;
        b=bvZs6Oa4jydQMQrlMMzFJqAFnXk22PZZxxVLZX97eZvnXLcO34aEELuRbOHl85vlqA
         72rnX4kYz50P6vsHCe5pYlNECKThi+VofuIAaP5mgUkaRbN3SAZwvaubddXEeiHGYUDi
         XvF33e6msDNOV5WpCrcPqWYk7gBbWu8V70zpd8S6dEH/PwlVhngdBCMGjWuq/G4b9u9/
         oW1tc6yrqT7+2MjDgAhl3NT0vFLf9IKJOrcLzxG+b9D0FFb+OZahECMKvdTXO8/OzRYV
         u7DfojQwfgOW4RfpjRX544GRtS+TV+5sQblTDvFRmAOymQp08sxMGPMXt3AKRe0a2Qzz
         b2Gw==
X-Forwarded-Encrypted: i=1; AFNElJ/MrKNUW5OPlI8tqEO1Zj3lj7A61llFD8wri1SywT8Ycui8VYRy5K0XqbdoFoHrJ2F1whxa+Xmh4LeA@vger.kernel.org
X-Gm-Message-State: AOJu0YxAvVfIeQNLnZ9GRwGWxApmQSSAIpVTWGkG6uLUfuoIzUxKxSUD
	RH/G/K2hfUwsHgp9G+3Hkhgfvkzadupp9cQz6Rf7Kd0l2dH7BeAUDOoUdWmf+zm/FObj/4RZUi8
	Jc+DOWvVhIbnXUWisGhOqB+KOy+ClILowHZ5PAkGbx7V3aaBpGKap+zrC9Jc0lr5y
X-Gm-Gg: Acq92OGHwfqI8PJ8X5Z1PVFS3CMqtpN35eK7bSTZeY1RJVfZtdzABn82mH7DQsSyApF
	RrQ6qvmcaZCEYikVjZTuwOizD0iMCqM4XnQ0exRcGfCb3Vjse735Okp570wYTkf7vWuUgD7y10r
	m+5WUOn28mArLJDb6beFsmmdy7V9odmWoMaOy8dFuXYh5weP7x0BDBJ4tloHrFpClUFosNGogGB
	JFOufkXNFzv5Gy9hIOhqlm24QwimomiRCt+VTWn64TAxSHm1b72te1m4QRfYhGfol/W53ZuA0fL
	edgwWVtSwpRuAyOCLqqGBJJGSLK0eHHSrFfND2xliHLu2KQY9fyyrp9fJ/kTUulTmFfKVmcVt7t
	Yxn1SEBsndd0LCJZeF2jWCeEtkJF7n4N48xj3/CNHBf2NBtQPSqadAqqib0ZTjzn/ubZ10UdfZG
	7kPJCdzd9LvQugpT/V0C1T1yG4
X-Received: by 2002:a17:902:ea07:b0:2bf:2e06:2ebf with SMTP id d9443c01a7336-2bf3685df7dmr109697485ad.31.1780291034868;
        Sun, 31 May 2026 22:17:14 -0700 (PDT)
X-Received: by 2002:a17:902:ea07:b0:2bf:2e06:2ebf with SMTP id d9443c01a7336-2bf3685df7dmr109697055ad.31.1780291034415;
        Sun, 31 May 2026 22:17:14 -0700 (PDT)
Received: from [10.133.33.84] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b01727sm96486175ad.53.2026.05.31.22.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 22:17:13 -0700 (PDT)
Message-ID: <155c7b48-6fa6-4f25-8b0f-4e9081d5fadf@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 13:17:06 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] pinctrl: qcom: spmi-gpio: Rearchitect for flexible
 group support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-3-3a6a025392bf@oss.qualcomm.com>
 <20260530-fervent-snobbish-silkworm-24ddae@quoll>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260530-fervent-snobbish-silkworm-24ddae@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: phOCBilX5vtKsQGnz_jSTf_1e_EAMfmE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA1MSBTYWx0ZWRfXyUGMHPik02Z9
 jjoN2YvUMkf9rPy7jP1cfr2ZcIm5i8NNf+0603tKXwmTi6ydPBdg69gQsvJcqY2hjOdsrivJYqm
 bHdgbzYj1znAEHWoWKtgSRv/MfgaM+hRSyW1CmQoVZQ0F67lr+RoasqYvhHLMton8NBXtBV1nng
 Bg4xtrFt1USZjCUmkMH6lzpxiMCV641JF7iUhDyC8G7sx57AQ5xW2xBR0jcblD6O4XbJtmR5FAw
 +hc4levF1FaB0aQfn9MdonsZJLcQHv9y7PsXhTbfsVNP8my0MUxqHsi3ms81rba/C6azE0Bs6ZW
 g9ZcVJ/TG/hIB1lZA4533J2KcwsE++YbvUD6jhPNUSFX0TPRFlBlWtdRVAHNlSNaBeQSxNkp0eE
 kVxqOGPCSCipopWnZX0iH3s/BCWYhVCcDr/ujN9OhFOvMayHuNSzYtGpDbk5w+ooyfXDHR2aUGp
 Z0y2O/v8/lTsVOZBnbA==
X-Proofpoint-GUID: phOCBilX5vtKsQGnz_jSTf_1e_EAMfmE
X-Authority-Analysis: v=2.4 cv=Zq/d7d7G c=1 sm=1 tr=0 ts=6a1d15db cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=43zHNb41aA7duc6R1F0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010051
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-37741-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 678796199B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/30/2026 6:31 PM, Krzysztof Kozlowski wrote:
> On Thu, May 28, 2026 at 06:05:37PM -0700, Fenglin Wu wrote:
>> Currently, the driver treats each pin as a group, and every pin or
>> group can function correctly in all existing functions. However,
>> this approach is no longer valid since some PMIC pins only operate
>> together in specific functions, which are limited to certain GPIO
>> groups. For example, in pmh0101, the level-shifter function is
>> supported only between GPIO pairs like GPIO11/12, GPIO13/14,
>> GPIO15/16, and GPIO17/18.
>>
>> To better accommodate these new functions and restrict GPIOs to
>> those that support them, rearchitect the driver to enable flexible
>> pinctrl group configurations by utilizing the generic pinctrl group
>> and function APIs.
>>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/Kconfig             |   2 +
>>   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 377 +++++++++++++++++++++----------
> And now make this built-in and RPMH as module, then build it. Does
> it build?
Thanks. I missed to add the dependency in patch4 which really adds the 
rpmh control. I will update the Kconfig to make it depends on rpmh and 
cmd-db drivers.
> Best regards,
> Krzysztof
>

