Return-Path: <linux-gpio+bounces-39395-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 77p/ChV4R2rqYgAAu9opvQ
	(envelope-from <linux-gpio+bounces-39395-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 10:51:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3AC700482
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 10:51:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q0NHziIf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Su41Kk1G;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39395-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39395-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF7AF303D829
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 08:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715F7381EB1;
	Fri,  3 Jul 2026 08:46:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C043F380FDA
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 08:46:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068418; cv=none; b=KuZPCgLKWtdYKB3b5y0sZy8GFzZhpdSxToiNGZxLAUriAgv0c0+MyERZEoFmQg1q0Kpo98nFiJS9jnBmkYeVdEExqybL4jWs4zN5yKHZZhhSx2bFO5jjL+mlRCV04NIORIXO66+VNyNqFIt2tF956g1lSQCUcwtrbnxXMctewXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068418; c=relaxed/simple;
	bh=Yh5sN0fooPWjve1pyIXuMVFhw1LAYLqgKlqoMYjWzuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C9c6ethPUT3RosjSTcFdgiOV4IzypU5iMwj1TyPFH1kPibgPxozQPB/6ZwIehWC4yAKCV9HxMsyIkWA6Ao4AHFTiMcSgw5pZwLa3QIK2OhUZWpyxZjwPVP35G1KF2LKS/JlM2jHG0tNXkk3bJwo9b6SRKIUWLLnBqGVEgHS02bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q0NHziIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Su41Kk1G; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637ZvBH3410421
	for <linux-gpio@vger.kernel.org>; Fri, 3 Jul 2026 08:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B69zEZt3iuxyMdtFtu+kFz/AGfO4nc5UwvvoATuzTCM=; b=Q0NHziIf2STsPAIx
	ZUNVTQ3sSlF55uDRJB+s+lzjVb4Q6NhovInGi6hPIUEzKiH6bZHjSCskI4Oo46jE
	Sq7jiS7kmbDCx4bs97cWF/doxvzCRhtbp/j8fbvqbWl5/euNXXZgt8HWrcxl0vyb
	Tbl1wSw6DqJ6Php1LzYd1MZo8Nhwdbwo2cQ9JUSQgIUEvnNqo1xmkBPOGEJ/FA0F
	mXycevGCW4ccmj8mrETYQBswdyzERfYD03Xum6UfwAZNT5/soYLOYNSxXU5mfzAo
	muUkEjwmC0NlT8CSj3QYA5JYrznhjfZ0P5+85d8qfsRIrAQuR+460IN510dhL4E4
	5jSK/Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u308aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 08:46:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c9ed5caa3bso16016615ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783068410; x=1783673210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B69zEZt3iuxyMdtFtu+kFz/AGfO4nc5UwvvoATuzTCM=;
        b=Su41Kk1G09jcrl6MjFKGJU6HFuIDGpyCdFZdsSAJEaJrrRo1ES4/ysUG1v4+QuygnV
         USFtI3nmTrb4Kbb6fiKmVaGugvoEpgIsMaalRX1/q0Y8NgfQt66jq/WDRGHg8SYpAW6H
         Ia1H1wO5yP0ip4dQd5LWhE6SEq3UAjCm/1Ty3eJ5pybdEKa5/ehpADniOwAoRL8Je0vp
         ZaBlZ+iMoLCotwDbg7pI05cN9ufR749I85VICB6oNs1NEdJQ22g/7JxyHOl3ncwx+m42
         SOfyXKER+XcO3y84ws5KI8eUj3AE4uJTsOITxXUa3v5TF2nbnKfvAMAo424I4fpuCgJ7
         Qxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068410; x=1783673210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B69zEZt3iuxyMdtFtu+kFz/AGfO4nc5UwvvoATuzTCM=;
        b=Dx3ts9wT9bprd6+3PgoPZzsrLo/Q8jtpf9bLC+E93NF8C5uLASFeDbmpJYblk4XGJq
         yRmWi/gQdKNMgr5lPXOLtIxKLW2k5HjSKTWTki1Y3jKiPUVfA4f3ytSWY2LHOpgcQOhF
         544TAgqoT6X8JjNLFPplm032YPf0VLXICp+TuMMYOz+UogFSX8achZuQECq8QkPJ6oju
         +Sr4orB70Amu6W/L30cO1fiIYdsMjf7ap5ipPEBjkSfRFF8Jbm1Ct3zlrvtvImUtLWo3
         CQQwu0IobP5B7q9K3D4T6Y8AD6aWS4AYTrSQhiqHB37GC3CyE7FhnyMvvzWW4QQiw27t
         xi/w==
X-Forwarded-Encrypted: i=1; AHgh+RrO51U4BpsbZ9QezKHOZeZEaEmqQR3VO0XtTsDzExumeH5ZM8oHest33+jPvUkI4jf8sDjW3ZKImw03@vger.kernel.org
X-Gm-Message-State: AOJu0YyuGrq5dzSH00cy2Ssk0rJye14M16lP3WT+X62es9AsuMFN+noY
	BAJp1wxY74o4OFWMXdlYIrrFFH2IeLAUGV3s296ZVD4p90OqAMPSZ408NopV7P2ATa2I8D2O+r/
	jF/JqtpMsgwvN8Y4t/0jwIkyHWPNMuqCK7TCb7VrX0rgdMFI6/g62IcOAyWBr1JLh
X-Gm-Gg: AfdE7ckdbt0ae8QmCPme0RQuC1uIeM94tBVCqn7bvLhzPWfEcOJ7kcuu+XMfyiwiTMR
	swxDCb20Hpp0W7znrFN7WZwNtwfWJdNRVBScIVD0CN2nnZaNFOGjT0kqbuymdselHOV4KIwcL3V
	hcdNw7FEI+WmWtHiWLMh0eI1n/CBmiQA78xDX5VFd9jRT0IU1Eey4M/BXuKFtDsxv65xo6hppMh
	DavOQjIXBO+WQ4cR9Q2FA0rkZ3LxiSVyq4WvdnHIWQ6XeD7o+/kDMG2zI2sM75P7hMLLj+VPtIJ
	CcUpi7w0OqLe2WnesV3rn5zGeMH9F/qfIoxXy/vpPwofdtAOFFFPRVD6IyW0HAq3gj8ic3nA12u
	yE58yepR26+z8U6+ThcOk/S9L337+g9EYpqDIn1kM
X-Received: by 2002:a17:902:c40d:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2cacabc2ae9mr36765305ad.7.1783068409983;
        Fri, 03 Jul 2026 01:46:49 -0700 (PDT)
X-Received: by 2002:a17:902:c40d:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2cacabc2ae9mr36764955ad.7.1783068409489;
        Fri, 03 Jul 2026 01:46:49 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm21512940c88.12.2026.07.03.01.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:46:49 -0700 (PDT)
Message-ID: <afd17a5b-ab71-46b9-b537-c5e9b98653dc@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 14:16:43 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] irqchip/qcom-pdc: Move all statics to struct
 pdc_desc
To: Thomas Gleixner <tglx@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-2-4d8e1504ea75@oss.qualcomm.com>
 <87jyrgqe5m.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <87jyrgqe5m.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Sh8CaqpC87G3bZ3GGuaUBosHOEjT46CP
X-Proofpoint-ORIG-GUID: Sh8CaqpC87G3bZ3GGuaUBosHOEjT46CP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4MiBTYWx0ZWRfX/undHlPi3HmL
 e0VIteyYGnbi9QcyPaq8ePJ4k9nNLdLrlNSQ33r9YwTQkA3BipT3PYDK6Nuhm1MZCcogGdJF4Z2
 nbYcjK1BmCF1fQRWkmUB9Y1RvSlZEHY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4MiBTYWx0ZWRfX+t+tsH2FIxyM
 yrhl1hdo5ja7J1YgBp23o4BPqU3f8ZqiZKy99Z7DEljoymZk1/3AKEVZwviZ2yvDux90/P2R+XN
 eBcrtk5mdh4lkvnfo4AC3X+8CjSF6khQzcKJ7qe88qjCZK4nERy+sw6Ayhx10usdz89thaELjPq
 1CDzpYTYvhsaLbbOB+JP5bfFEU2vPIco0ARretBjYmoexwdIDp4kGDlbsOZwYTlM/YDNL/sZTYC
 ndqx+fQfOydn9r1cjlrAJS+/MagnQ5y2pcx/NqUxyGARi+vAoNUGXM6RyJMXRh/7pm2/ZHvOr7U
 Mi+0hku1rjcS64IM1b5fiXQkFgoeoHsnbiR3gyJwu37sDkDfOTovQWYo7Ith0fIG3N3I3gB+TNT
 AJ+flnK/FZ1Wflc/lmkxrSVJvF8jgPSm9MVQc8t1FpnuQ8r5KOsc6tQbR7kynOp2DQFLqyPVGNm
 LQn8Ov4UJUE5kLStlEA==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a4776fa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=xKoXzObbE768e6KogzsA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39395-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF3AC700482



On 6/30/2026 8:16 PM, Thomas Gleixner wrote:
> On Tue, Jun 16 2026 at 14:55, Maulik Shah wrote:
>> -		for (i = 0; i < pdc_region[n].cnt; i++)
>> -			__pdc_enable_intr(i + pdc_region[n].pin_base, 0);
>> +		for (int i = 0; i < pdc->region[n].cnt; i++)
>> +			pdc->enable_intr(i + pdc->region[n].pin_base, 0);
> 
> This needs a guard(raw_spinlock_irqsave)() when invoking
> pdc->enable_intr(). The probe function is only invoked
> with interrupts disabled during early boot. If it's called later, then
> this still works, but lockdep will be rightfully upset.
> 

Patch 3 of the series moved guard(raw_spinlock)() within the pdc->enable_intr().
I will merge patch 2 and patch 3 in v4 series so that lock movement and newly adding it at probe time is captured in single change.

Lock is required only for old PDC HW versions (v2.7 and v3.0) where enable bank is used instead of separate enable register for each IRQ.
Adding lock like below will apply the lock unnecessary on HW v3.2 specific pdc->enable_intr() as well which is initialized to pdc_enable_intr_cfg().

       guard(raw_spinlock_irqsave)(&pdc->lock);
       		pdc->enable_intr(i + pdc->region[n].pin_base, false);

To address this, lock is still kept within pdc->enable_intr() which is pointing to pdc_enable_intr_bank() for PDC HW v2.7 and v3.0.

Since probe gets invoked later during probe, i will keep guard(raw_spinlock_irqsave)() within pdc->enable_intr(),
even if chip callbacks like .irq_enable invoking pdc->enable_intr() may not need _irqsave() variant as it seems no better way as keeping
lock before calling pdc->enable_intr() will apply for PDC HW v3.2 as well.

Thanks,
Maulik

