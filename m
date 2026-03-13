Return-Path: <linux-gpio+bounces-33311-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOgxL5exs2lYZwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33311-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 07:41:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACA127E3F5
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 07:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 369F63018AE5
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 06:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85592271468;
	Fri, 13 Mar 2026 06:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="igt3PzcN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPBqNSqp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D2935950
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 06:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773384042; cv=none; b=DHjQg+Nw8XT29+zsOBXGvQ4VFT7PbkT29jx9XL2HhxT+BB5VgZYAnT5h32Y0/E7c2e3B95g1eWoEeVCVm++ouc3LjUT8jlwZVCmSR+d/AeaFHUlpoXdQtMBOXIyxuU6o4zKlqeDeRA0MDWJ6n2dpql8fS+j7iACi/3ly3pzISsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773384042; c=relaxed/simple;
	bh=e09vajKUZDPJp/jtPUeU3JFL/LXPxR/y5475uhVbaV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XpQNXuq7/dSoqzATapE6REyz/X8sXQMYkf9NUUEs95hoq/rRrSTRlDOLjxbKj2eLQiP9hUG07QJ8/MWkoN9JpvMk/Gn7L65+wRsgKBWxfwsCjBa8Ar6+jduCYKIAxhNBkAmWsBhnhRY3HWlzg6FXAHoKibQVzAG+72T1UXA6C7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=igt3PzcN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPBqNSqp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tYjF3229721
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 06:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z2yHacvHoEIS2iQIpmAHHWFbIhfSnfNYOJJs/3j8L5k=; b=igt3PzcNK9I98DSL
	VHvueWo2j9CWkpFIGpFBP9CT4CmDO9ra1MMdk6sqBhSjlLctmC18afwIPFjUrDAe
	3kddXrWbr1vgSWWWsSwX5HtNzkz6Ys+G0vdUmwZBqXs91X9Kq2ShBaByRCfzZ0vB
	kVWO6lOFqoMcQaSN3wIBziYb6VUAHiQqdkHzKMBWlmwM7GQ6gKtjbKrzPdGSCBGb
	k3Kf04SNM0AAvT76DM6qMzDHaNQ6IG92nM1DxK/14sh8JwW0pgYf9d+ihTbkj/eU
	qScEAs5EorzHHnC1b51Fld4ZaePc5phInRtHHjNNukym8CHTHOQFK5z1pCBhrxdo
	Y2pgNQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7gvc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 06:40:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aecd4f7c37so4657295ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 23:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773384039; x=1773988839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z2yHacvHoEIS2iQIpmAHHWFbIhfSnfNYOJJs/3j8L5k=;
        b=gPBqNSqpeDOd5HwhK1bdTomJ7bpDTNAkKHzJd8JC1EfV8yLrUZFITI4f6qTAb/wcUJ
         6pepeIxotUPpC39Gl78xnFONBz16TefE1AKQJaYgbmqnZ/bVlw/UMDkBK985iLv2ojL4
         /IrwFc4GF9pWxdHKQs505egQIhGRfqXj2PqfL8+GakgRV4aFKM/u7S91G72zFE5xxLcW
         dcmbsdZ+AHiFMHcfbms2+iacpq0jZshRT4HjlYcTI0Fba33Ej4twOj4+l6aG9N99nA8Y
         4eelNCN8rmzT/xt69QwnD3bfy/QFozsoVhCeIcK8IWXfiuZP1UsSiPk46VrltiqOxv8j
         J40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773384039; x=1773988839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2yHacvHoEIS2iQIpmAHHWFbIhfSnfNYOJJs/3j8L5k=;
        b=g3HRfZCdxicuZIAzZy/SA6zvcFVCzgtKoEBrqe41ERj8YhstEVFtLLhtuaPVhTK+Op
         phFUhUnERAl1WnKQdBWZ9mwZ3F3meOS9qr8kA945AHPiI8/LmVk6YgKugIkL7z6kqGhL
         pplzl4E5blK3Ju6h0EITh13xIba7ewcCl0XQe+FM4yZh1xTCkVRVAi7enfVoOIb1VlKS
         0AWjdbv81Oe/6lSKqzg3Lm8s/FWTicDhE1ZYb1CyBXOMXf68SmokZ3J3lUyaq90xPpRv
         fFHtlHPQsSQwIWOJaSoAeQjud72u0XSYyX2ADSNogHOspI8tMcaFZ+4P8q2GYf1XT/ko
         cjKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrNWHZD66wS9z3qltFPSzniHBShdHZrpdlubisobKaFkXxzg3E/ogutXsiVB09ma1FALO9SYJyDxsB@vger.kernel.org
X-Gm-Message-State: AOJu0YyAyLM4t7tQdSHvORX7rwC5Bv8AAm9YW2EwaUeVXpwzsxerRyne
	XUIWm1e+twOnyDjy+7HLtm7xWPdZyJBpxnIwy9sDxD8tD74EVnoMZmwNQMiy6LTF0UGal/EVq7d
	9L079CYVonSuU/xGl5BTur1YB/WSsxYqad3w0NBc7uSD+Qf4LTO07oUJsArKxCWA+
X-Gm-Gg: ATEYQzwoL9tBGBXh0l6UKkqqbAvfB8Q/43eqtuYwZl14jKo3M07ccisoC3ZG88Jk5wm
	ibXBK9qqI+8f3Mo1/5KJdXICFuXM5P+WWddLDpY9Y48bDglpX/JpAzAKezuDqmjvlN4XMyVzxzA
	zDzqJxlZbOuaQPTz6D5CLP1awhfIWu/8jUqK3Vq0TseXK4CCXD/6J7Vp0Ft+kQI51dLrCqZcod6
	4Rmhjqi7Oe69eV18MnQTTfjh14vXmQ0t77TFHhFIzy+EISRZZo5NpYaggxUPMbvHJgC+AVb+u7W
	88BrxbjDwT8oR1AwW+f8VSu9yCL6VNNAfBR/wH8JdyX8ZGWYF7z4OBJ3cOHC+UtPv2OGXX1Mj7C
	pXBxVktiD9PysczG2MxZrrbG4QiKWDjcHY8qkEVlJcGV0xg6HElQ=
X-Received: by 2002:a17:902:d58e:b0:2ae:ceeb:fa5f with SMTP id d9443c01a7336-2aeceebfd57mr9326935ad.28.1773384039351;
        Thu, 12 Mar 2026 23:40:39 -0700 (PDT)
X-Received: by 2002:a17:902:d58e:b0:2ae:ceeb:fa5f with SMTP id d9443c01a7336-2aeceebfd57mr9326555ad.28.1773384038853;
        Thu, 12 Mar 2026 23:40:38 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece62c581sm14676585ad.33.2026.03.12.23.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 23:40:38 -0700 (PDT)
Message-ID: <771a8f63-90d1-45b5-960e-342d9041fc4d@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:10:33 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] irqchip/qcom-pdc: Configure PDC to pass through mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-3-760c8593ce50@oss.qualcomm.com>
 <eizcoxjnjgbobjwndnq7gewqnynnm2o2aqhh4muposgnhhagaf@tnomg2p4uj27>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <eizcoxjnjgbobjwndnq7gewqnynnm2o2aqhh4muposgnhhagaf@tnomg2p4uj27>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: S-f4pRjRNbjJmnqfRbzSprwQnd7XYhx8
X-Proofpoint-GUID: S-f4pRjRNbjJmnqfRbzSprwQnd7XYhx8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1MSBTYWx0ZWRfX/0lOCtqnXU7y
 fYqBStxDqqYTaSMssp+Rr//s2EwJkex5FMsnQqgoxHIOPPbBRUjJc0DLAkbd56zBzhgdbeNfW1R
 ZfBefQPE3ILflofvnjeHc5XbnXxomdteEsaFqdWiewRF9x5dBLoxpS0CgNiC1JUFUJO/elsyi39
 yHPp+Aaa17T2T88IougPQbYsec1z4dyzSm1HAMnrFH0do2kkaMWge6fAngbs3mzeXgCTw6jvcKc
 eUTadZWLCQh1/gdyd5/0AK/qhcKVFRL2qTWC1dnvDWH3nagL+1s0hphR7wl+oI4Y8lBZ4y7ZyMX
 x0M8RiOiVuHwssfgh1w6DA+HO3905O9zMZJoS8CZwX1EN8nqLolAbXn+6qVuZ9cL3XhWaqNfwww
 qOJNrSIZE/1Eo1QX2rec+tDxAEtTob09dLrTuwAPaqcecNmKH6MqvrD7yb0H5+AS2xNz6gw15au
 jIbu9AAgzzEJUYS80sg==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b3b168 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=wsG5e61cFZotgxzGgJkA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130051
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-33311-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6ACA127E3F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 7:52 AM, Dmitry Baryshkov wrote:
> On Thu, Mar 12, 2026 at 09:26:37PM +0530, Maulik Shah wrote:
>> There are two modes PDC irqchip supports pass through mode and secondary
>> controller mode.
> 
> Can't parse this, excuse me.

Ok, I can drop this in v2.

> 
>>
>> All PDC irqchip supports pass through mode in which both Direct SPIs and
>> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.
>>
>> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
> 
> It would help to mention the platforms, not everybody has the core docs.

Sure, i can update the platforms which are v3.0 or higher.

> 
>> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
>> still works same as pass through mode without latching at PDC even in
>> secondary controller mode.
>>
>> All the SoCs so far default uses pass through mode with the exception of
> 
> Is it something that must be configured by the bootloaders?

yes, currently changing the the mode can be done from secure world either at boot
or after boot via scm write.

> 
>> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
>> boards whereas it may be set to pass through mode for IoT-EVK.
>>
>> There is no way to read which current mode it is set to and make PDC work
>> in respective mode as the read access is not opened up for non secure
>> world. There is though write access opened up via SCM write API to set the
>> mode.
> 
> What are going to loose? The ability to latch the wakeup sources on the
> CRD?

CXPC (SoC level low power mode) would be lost if the device can not wake up from GPIO wakeup sources.

> 
>> Configure PDC mode to pass through mode for all x1e based boards via SCM
>> write.
> 
> Would it make sense to always use the secondary mode instead?

No, it would not make sense to support the secondary mode in Linux.

> 
..
..

>>  
>> -	pdc_base = ioremap(res.start, res_size);
>> -	if (!pdc_base) {
>> -		pr_err("%pOF: unable to map PDC registers\n", node);
>> -		ret = -ENXIO;
>> -		goto fail;
>> +		/*
>> +		 * There are two modes PDC irqchip can work in
>> +		 *	- pass through mode
>> +		 *	- secondary controller mode
>> +		 *
>> +		 * All PDC irqchip supports pass through mode in which both
>> +		 * Direct SPIs and GPIO IRQs (as SPIs) are sent to GIC
>> +		 * without latching at PDC.
>> +		 *
>> +		 * Newer PDCs (v3.0 onwards) also support additional
>> +		 * secondary controller mode where PDC latches GPIO IRQs
>> +		 * and sends to GIC as level type IRQ. Direct SPIs still
>> +		 * works same as pass through mode without latching at PDC
>> +		 * even in secondary controller mode.
> 
> I'd say, there is no need to duplicate the commit message.

Sure, i can remove from comments.

> 
>> +		 *
>> +		 * All the SoCs so far default uses pass through mode with
>> +		 * the exception of x1e.
>> +		 *
>> +		 * x1e modes:
>> +		 *
>> +		 * x1e PDC may be set to secondary controller mode for
>> +		 * builds on CRD boards whereas it may be set to pass
>> +		 * through mode for IoT-EVK boards.
>> +		 *
>> +		 * There is no way to read which current mode it is set to
>> +		 * and make PDC work in respective mode as the read access
>> +		 * is not opened up for non secure world. There is though
>> +		 * write access opened up via SCM write API to set the mode.
>> +		 *
>> +		 * Configure PDC mode to pass through mode for all x1e based
>> +		 * boards.
>> +		 *
>> +		 * For successful write:
>> +		 *	- Nothing more to be done
>> +		 *
>> +		 * For unsuccessful write:
> 
> Why would it fail?

It can fail if the write is denied by firmware.
As i understand the older firmware had neither read/write as such firmware
was meant to be used for non-linux (windows only and not for the dual boot).

> 
>> +		 *	- Inform TLMM to monitor GPIO IRQs (same as MPM)
>> +		 *	- Prevent SoC low power mode (CxPC) as PDC is not
>> +		 *	  monitoring GPIO IRQs which may be needed to wake
>> +		 *	  the SoC from low power mode.
> 
> This doesn't quite match the description of "latches the GPIO IRQs".

It does, PDC would continue to still latch the GPIO IRQs (as the mode change failed)
but PDC won't forward them to parent GIC as they are masked at PDC with __pdc_mask_intr().

In summary,

Below is what x1e users get today if they boot up Linux:
 - All the GPIO interrupts works fine for them as they don't get forwarded to PDC
   due to commit 602cb14e310a ("pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now")
 - SS3 idle state (CPU level deepest low power mode) not added in device tree due to
   above commit.
 - This prevents CXPC (SoC level low power mode) as the CPU subsystem cannot hit deepest low power mode.

Below is what would x1e users would get from this series,
 - GPIO interrupts continue to work fine after reverting commit 602cb14e310a
   ("pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now"), PATCH 5/5 of this series.
 - SS3 idle state (CPU level deepest idle state) is added, PATCH 4/4 of this series.
   Adding the SS3 idle states opens up the path for the SoC to achieve CXPC (SoC level low power mode)
   (This again depends on drivers removing all the global resources vote)

   While all global resources votes can get removed, if the PDC still could not wake the SoC from GPIO
   interrupts, the CX is kept at MoL (minimum operating level) and TLMM (which is on Cx rail) would then
   wake up the CPUs from SS3 CPUidle / suspend (s2idle) state with GPIO interrupts.

Thanks,
Maulik

