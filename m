Return-Path: <linux-gpio+bounces-35749-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMVIEkWi8WmwjAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35749-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 08:16:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C630E48FB01
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 08:16:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F437302BA6C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 06:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98168372662;
	Wed, 29 Apr 2026 06:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNrT2uc7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bPtZpldg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0E9330644
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 06:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777443383; cv=none; b=aZnoYU+68ujYeQbgQtqV63zhjwJivuHhJRzyMtc2Cah3Na9fcq11hCTAjsmLww0S5QhlV1LF6tkb3m6pfta85vfd8KyOJTInEcu1lS/XLbXyuBIKCReKFkp8uMuG4j1a+0Bb81q/vdvUNQZZizPmVdzYfGRvbIv21McxCwqXIhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777443383; c=relaxed/simple;
	bh=Mf0/YK4bzgXf722U+ONfaRNSQKH+WaUt68zz4BrW9+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERsP5AANC8NiE8nchI49klX62CgWHeRJhtjdo2DewmtMaMYEtRyCqF1o+sSAKa1yFkKWfPfqDtRMpcQYno0r03EA7lc+tUTzZz46NstPVCATdS13oglhOuw3/0ubfGjBXoVz8PgYdLmsIrKiC1+ga5TjQgtHuOQoE3fTcMdMjYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNrT2uc7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bPtZpldg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T6CNlP3385690
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 06:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	icT9YAJFov2exmFPJXiPcjch8zwqjp/K5YLC8aHa8n4=; b=CNrT2uc7JYCfvGWj
	bBbezwbE0MDKJS23IxJwAZ155Lp2Krht/WgK5bDQEupnCtzAyXXjogsBHjNX/kgP
	CSInl2/H4oGqSlih46xmKTIhgjLXM0NaH5kUJ5riaMarHsZwMdvBK+4CnIGHkM/m
	Jy+jImxZOIfxc8bFNw1pFU2OuesjhXAZAvXMFVuKZZFiwMS9r3VKeu/JdNNHqIK6
	zaSR9aOHR4NEsbxfpTE86iEScaVJzICG64QXYcLXpQrR2gzJ+lQ+puf5luYFU1U0
	8kUAHfL+A+UJt2p7eS/97z9PHrjxDAVJVjOs6AQJGxNL/BLPuXih6CEAUPfz7SKf
	SjKEww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duch1g0fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 06:16:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e136aff17so221905021cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 23:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777443380; x=1778048180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=icT9YAJFov2exmFPJXiPcjch8zwqjp/K5YLC8aHa8n4=;
        b=bPtZpldgAgRsiab7TG7cb1hSP3mKDwEcAd+ym3CrZrTXDjl9dtQT42YBazK8Neer1e
         RLg+mnBBZfts/h4ngOSNrwIfZBba+7Muq27GN1DmhPWB6rBJWAt2DQ92GT9ENMQHBefc
         4b1oNCxTltjMVNNgeDMg6ij7ODdkQqU190aG4ceKIfF6ORrrnQO6jr7koh9ykLrsg6Ns
         CsfL5kHy2DTYRanl/TaAuAltaijeDrq3DPrhJ7LfS2bdrnfY3a3lI4U4Mwn4UQunvHkq
         2xoqbPdj+0CK4zY1mYQWJHonvvnpdv5j/Z4pKOKBe8QN0ji0FwkPfSIySyLFaNEDxqsn
         IQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777443380; x=1778048180;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icT9YAJFov2exmFPJXiPcjch8zwqjp/K5YLC8aHa8n4=;
        b=fihyz7uPKHM5tVHrmUzbtXvGcgR4KsIpIQMzXDvnDS3daWV4aVg4xqiIOG8OwzZVUe
         83wo728wee4s+Jru785Al9kEOeoIVjXE28GtWZZggU8uepNJy6xiv4SSCH1OEWy6cbw0
         WoJo5pLoiRKFg27udgND2jh5EpxExxmO8R87Z1+FHlOrjS1dm6JiPMEKITAjy6b0OHng
         xPyQsXbwlJO7J3a1hYczWa85/IHCklN6CNTexkxYZ/fHKue5E3xnwn+GE4ftR4RDw7vj
         nBMddWIOQNh4H8E0dkUpiRTp6WL/Z1Kl8JZhZ6A2pmearJ2wmTI48H2QovUGpNV3ZhY0
         HQXA==
X-Forwarded-Encrypted: i=1; AFNElJ9MX7bqL04zsJnsnce7ZlSFECjupJya57/TqPyYW0zIL41rXjniuFl2/0Qcfwhu8IuOclMuTL4DM2jV@vger.kernel.org
X-Gm-Message-State: AOJu0YxpTTyFFrgUIvXNN9IdUGvq29orGf2TUntFu/YioAulbwadmhCv
	n2msTn4biK4GGBFMdvffxNhoHWqdG8yeJ0oHz2ocLpnpXATo1LziB1ZBbTufaU6H+LrnBXKW/7y
	Yybpjpme20FLh058NAp1Vl7KYNCSliYZ3b54UN3Q7KIUt5U7Q2MHJVsZwG2dR3yftE5fixx7G
X-Gm-Gg: AeBDiet2Gjytb6gRZPKIIPwR/3R1xHEVDlmsK9O+bxtZLTR1e/wxLtd4VPU5m250voi
	8J3GW5iY4dNRzT7XBQ2T8q1GP6kKjySnVMn7+2BVFQW/efn7fSNJCgIv66psYOC43I/LDZDU94u
	kdyK2TAirvjvtOqIDMveJSnpjI1OQ9llmlrX+FyLGwqvybCetRZw6hY2o7ZGeJnajMJjjiXzGZq
	NYXTXRrk5dWkfBKcECCD0lq2DsvHXMs8E2+zy4AW4UJqCsfxY0WeKIw4i/cTk+xQSeIQdEsoWSD
	4vGekPiTlGGoGjVDlB+O7Pc3tNA9JWYHeCGfxoMCKzRsHDDwfSeTo/0fKu4UYJPGeFSe/8ybGj1
	NDjWLNbAhd/Wv65KYQheOYbAQ62rIwieoLbGi02d4fiMnVghOKLlCDuFuEp4=
X-Received: by 2002:a05:622a:356:b0:50f:ba60:2de7 with SMTP id d75a77b69052e-51018a3575emr35084761cf.38.1777443379922;
        Tue, 28 Apr 2026 23:16:19 -0700 (PDT)
X-Received: by 2002:a05:622a:356:b0:50f:ba60:2de7 with SMTP id d75a77b69052e-51018a3575emr35084591cf.38.1777443379379;
        Tue, 28 Apr 2026 23:16:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b3d481fdsm3330604f8f.8.2026.04.28.23.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 23:16:18 -0700 (PDT)
Message-ID: <372e9718-bea1-4f20-ab86-af6f56299e75@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 08:16:16 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: qcom: Make important drivers default
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260428163548.154392-2-krzysztof.kozlowski@oss.qualcomm.com>
 <lccuj5tcir57c3pzlcvyjmle36alr64zv257si4taqis3novrs@exgphqb3k6tx>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <lccuj5tcir57c3pzlcvyjmle36alr64zv257si4taqis3novrs@exgphqb3k6tx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=arGCzyZV c=1 sm=1 tr=0 ts=69f1a235 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=z-_RKpQUm9htusuhYdgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA1OCBTYWx0ZWRfX9xD8QK50Uroi
 cP3fbDsDxFxzELY9iIOWcsUdbOJMzfEEAVbo9xwA9rlGJUpk7RiCpz4lphgk/1hIFqzb8q/NjS1
 u3EGOdE73U8u0IaN0bgEF7STLF6q9ruX6rEH7lvqYosQBbkhrxlGBnRT6eWIEE5YpWoA0f8wiAC
 OZuWfd/Q5G+GcwYydOml3PoKqdzhVG3MMSNvwjVPqy+KwqhdhV67wKno8NwVeO5X+canTxhrpNg
 i8nDUS1rLp42BwzyDIrh10I4YJn7TMoCsVHOW0h5oLAl26rKJ007n/E/q0ptTJ4dPMg82PmfUnX
 UmlMFosMOzX6dmk2PmUINs5Mg89HFBXR/cZsgtbcPaNQNvpP2d6Dgnk6ibcgQHwMPBltPe0mmtr
 4fRbeXxi8SJCizJAliy/ggn7ZGB8hrKPqqFeIOb2k+4jKpiX9PIoy/bdyDNLB7RE6opYPSgAKPw
 WvxXkOXH4dyoEVX4X0A==
X-Proofpoint-GUID: p7yrnX_r7iruANYS0zLEtVUJTAy18mp7
X-Proofpoint-ORIG-GUID: p7yrnX_r7iruANYS0zLEtVUJTAy18mp7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290058
X-Rspamd-Queue-Id: C630E48FB01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35749-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

On 28/04/2026 23:13, Dmitry Baryshkov wrote:
> On Tue, Apr 28, 2026 at 06:35:49PM +0200, Krzysztof Kozlowski wrote:
>> The main SoC TLMM (Top-Level Multiplexer) pin controller drivers are
>> essential for booting up SoCs and are not really optional for a given
>> platform.  Kernel should not ask users choice of drivers when that
>> choice is obvious and known to the developers that answer should be
>> 'yes' or 'module'.
>>
>> Switch all Qualcomm TLMM pin controller drivers to a default 'yes' for
>> ARCH_QCOM.  This has impact:
>>
>> 1. arm64 defconfig: enable PINCTRL_SM7150, PINCTRL_IPQ9650 and
>>    PINCTRL_HAWI, which were not selected before but should be, because
>>    these platforms need them for proper boot.
>>
>> 2. arm qcom_defconfig: no changes.
>>
>> 3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bit
>>    platforms, which are already enabled on qcom_defconfig.
>>
>> 4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
>>    builds, whenever ARCH_QCOM is selected.  This has impact on build
>>    time and feels logical, because if one selects ARCH_QCOM then
>>    probably by default wants to build test it entirely.  Kernels with
>>    COMPILE_TEST are not supposed to be used for booting.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> I did similar change for clocks and I will be continuing with
>> interconnect and other missing pieces.
>>
>> Changes in v2:
>> 1. Rebase on Linus W. devel branch. This should go with pinctrl, I
>>    think.
>> 2. Add tags.
>> 3. Update also PINCTRL_IPQ9650.
>> ---
>>  arch/arm/configs/multi_v7_defconfig |  8 ----
>>  arch/arm/configs/qcom_defconfig     | 15 -------
>>  arch/arm64/configs/defconfig        | 46 ----------------------
>>  drivers/pinctrl/qcom/Kconfig        |  1 +
>>  drivers/pinctrl/qcom/Kconfig.msm    | 61 +++++++++++++++++++++++++++++
> 
> I think it would have been better split into 3 patches, but this way is
> also fine.

You mean defconfigs as separate patches? I could do that and I was
thinking about it, but many people do testing with defconfig and such
defconfig would be nonbisectable here.

Best regards,
Krzysztof

