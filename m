Return-Path: <linux-gpio+bounces-33643-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO6JB1FiuWlsCwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33643-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:16:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B02D2ABA15
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6533E30B7694
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 14:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C173E3C4E;
	Tue, 17 Mar 2026 14:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSXpdnY+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ajzn2JvM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE9D3E316C
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 14:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756469; cv=none; b=J458x8AGIg8LRNODP1pomDY+sVPyl71Xzjg7Y9AZxQL2q/6m4ph8DOLieeMFVhluQxvbZbmbpfGF6sl82jEkb2tFJ5FMbESzIRUXk85rtqNMWT7z/+blWWmDf/Nr4Q9ihl3oyNJXH4fgeR3BQlB2WqDSSvzzUIw811CPMaYRdw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756469; c=relaxed/simple;
	bh=SjKY5rL+nXL4pYVVde5HOkkJzq5ZHB/znoBTF2Z5A3w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VjhEVG1FdQ86Uxy5o7AeLRToN4cyMHTUE+e90AuukZShkjt3LdE5JrITHGP77yynFqMjTlrYrQ6SS79lvyCVRoZNNT26nv2Vi0Nu+lNnnvAPutehNdWmogC5/CzJGkjl2RgpLEbpfGU2uaUZoFGrRre2OhYfCqz7dAC9TnqORFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSXpdnY+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ajzn2JvM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8474U1355583
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 14:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LgfIYBWPJOjzoQOWNAMuyA9WL02GR4rPUnpaw9+fGZI=; b=FSXpdnY+eL/9xWle
	/gm4urTVBVWJJKN1sPPPv3+VCdEoEVd3sQBUn2O7wjzrnTAPnsH2qLWmRqqXJ24M
	rFTgN1z9CrtlW1sjL2gGaYEB/kF+6vJ6WqLtKk68PqrWiGcfKjRQ2dt8BZ3xQ6ir
	mQ6xRzKduYlsOB8ScKYO1u/5NhgfCifIYQNG2Dkq2g/QZZ03g74OUVjeHxIpbk+Y
	NZKp40XcYpzXOWdUjRZTd9W+NEUv2o5IMPpmSo4JPe+1ch8V/cgJ3TmmqYdXXYGt
	/jIpo9vF7hjHGO3p5EKZWii/9mpJDI9IoAfVmDuqA79QZm+hHq/hX4Rl0lxb2w5h
	L9R3Eg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy4asm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 14:07:47 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5fb6622ca5dso7455409137.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 07:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756466; x=1774361266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LgfIYBWPJOjzoQOWNAMuyA9WL02GR4rPUnpaw9+fGZI=;
        b=Ajzn2JvMmyEg6wRSFr0+xagejCFMvgX/QPgjlcRwE+GTMggsIMB23BwMGk95OroUwi
         g5yFCs1p6VnReXGsfWzWFP0Jo+E/xH4IpK/o0t9T6g+5s6OpZ3Nio0ivWojMkbR8R7Rq
         tj8XVGfSPff6YsfcIc36e0uiXIcihcCbFztvQbmzCHvwyerhZ4Uea+TPhQUpNYop1zcz
         +ubnXmtAyKcasqvBlKryMmqsyZpOf6DFVmao94rCQGPI7u8V2R7g8NRhQjETqyRGYFte
         91FXMGf/blp/aHHUyC169R76WH7gJeDjDypVHUGgqb7tcYeR6BtDtbT8FEILzcMfH9Bo
         wC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756466; x=1774361266;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LgfIYBWPJOjzoQOWNAMuyA9WL02GR4rPUnpaw9+fGZI=;
        b=L1Nee5/6yZntO0B7jzH1k/fpLszddNkbiOHogba+bsbAt5j9wKYjPMuMYxyJfV2n3y
         t5uvYmIAfL6tGnbUv5sf7U9bNc8CHT2Uyux/73qVgbZubMMVIKr4bzv0NIq+XTwbI2GA
         SgSa9o8aEWbilmGe+HO/SrcGln5IeG3YmcPTEnTpd+eajEVajvc9ykfEbXnM+//BmnWg
         jnl3u4WiwZC2PrQWbKT8utvD46VxF33ZDZ18RDRHUMU0Z7FcAn3x+oPUTrdYASIlg/8c
         3cEB4cQRxMlz4OCeI4kRuXf1CIuon8H6aMFJjZry1kzP7SW16D+HDHREA58vKAjxv0YN
         CPdw==
X-Forwarded-Encrypted: i=1; AJvYcCWcylWtM8erSl3JylZnTiv//QTg3r0WUNa/nv8TzXp4ZNEm4/ikaBsm76eEZzQrWhgGtBnFsH3OweSu@vger.kernel.org
X-Gm-Message-State: AOJu0YyJKTRK8zuAoHMHkXzRKh0oexSkvMYGIUIXqBxmvUOXej4hpXKs
	zz1kDSHHzyIniYohal1NOSEsZikO2ECGuJeLMeETNczc3T0HnNP2mSfhSd2ASkq88yG3gxoCzIo
	rZ/VKLF5Fvl7LkcismhWJDin/iI9LaURKmaa036fVUwB7UcYKIQGg+rD7FsV4964z
X-Gm-Gg: ATEYQzwU+KrNyXAAYQttykVZjE7CoUkb2/Akj+SnLOXCHtAR0vS0RQuXDlF08QFjsPV
	4lLzwKhBXm/Wz0Z0+MSRDV4mb2h28g68EJlVdPKn1b2PoyYSGJqJx+yFGMC+o9Ykcq97t5QaUhk
	/g7LjIWURkV8b21yxyLJSGCzHnYqYuSEFq0Y79bIVf262yPr79/9RyM2GE3sXG6Vmo4ZuaE+rP1
	3vy5b9bSK7F6467y7HErDLq2THepyfmn5lg7gWD9LPDQBMiryOihmD7sKo7t5GCzP605i4IwLQs
	p7za1XY7QWg0zokCMpmPdSy8X41ILxg/BQyss4Jforisuh30X1WhNkg2bO4uJBzL3ftga0OnqhH
	0a5I2z2ZxztfQmK18yyjhpW0pE7ynlbbjaYDjBF/g5wthMqIPf0lK+LgXysxBRIY9Dd9M7aRoeZ
	EdJdck3pj8p7R86Ec/VzNgiTCo4F36GAxDWXC0dVDXJbYlf3ReITXGHNq8Lc4LRjcubR+ecnWUd
	iAB9FPX3h1TJfWY
X-Received: by 2002:a05:6102:442b:b0:5ff:a16b:93f0 with SMTP id ada2fe7eead31-6020e585dbdmr5264167137.22.1773756466314;
        Tue, 17 Mar 2026 07:07:46 -0700 (PDT)
X-Received: by 2002:a05:6102:442b:b0:5ff:a16b:93f0 with SMTP id ada2fe7eead31-6020e585dbdmr5264100137.22.1773756465573;
        Tue, 17 Mar 2026 07:07:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350b85f3bsm6577959a12.25.2026.03.17.07.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 07:07:44 -0700 (PDT)
Message-ID: <459993ae-c94a-4092-b81e-dc07c7011397@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:07:43 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH 1/1] platform: int3472: Drop redundant initialisation to 0
 and NULL
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linusw@kernel.org,
        brgl@kernel.org, mchehab@kernel.org, dan.scally@ideasonboard.com,
        ilpo.jarvinen@linux.intel.com, hverkuil+cisco@kernel.org,
        sre@kernel.org, hao.yao@intel.com, jimmy.su@intel.com,
        miguel.vadillo@intel.com, kees@kernel.org, ribalda@chromium.org
References: <20260317131040.215119-1-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260317131040.215119-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b96033 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=z3Uast6Rtm7B2PKYKTAA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNSBTYWx0ZWRfX/fseMM5QtzvN
 4NLiHXqxLHtlpgAdFtDP7Ot0nvNJuOPdygEUu9v22pt9IS6J+yDGdM7uOeifPmV+yEnPVH22/bM
 jlL37iP77g7RYhKSqqS/60GbTb5i+8TZtMiSGeMgNGI9cM8B7AVXFICCT19lX/eV/ckLags7q5F
 t2Wt+LtFPo6QAJVDc7QVanFHiOhGKCHNMYxXEhOSWQIK+r2wK+rQ48EKpOSmfoNpWuhaRLMIWGC
 xdVtkpe51Wxuc76AB5Urxk1kYnjT+AU5/SO73yCit3R/TqpEPoXcf2ugWNldAP6hGooramjwPbM
 7mi5Rm8o3rXaPhBicHdZiWYCqsFarYQY0EVKG7eBWKgX9stXPqpT9Gf2YqsXydcQfCQlL0+TarG
 QbFdx/psWJ6TnLUyvoSLV6aTJewMs8p3AHKv/Odcnk0TXqe6dIIVmuZGcunjqTCvrxCaAOQMgML
 WKmmDf+wsAs3mSQxTGA==
X-Proofpoint-ORIG-GUID: O3fBRe4VsLBrdF9WZeBbw38ulKfs7vnz
X-Proofpoint-GUID: O3fBRe4VsLBrdF9WZeBbw38ulKfs7vnz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1011 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170125
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33643-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B02D2ABA15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 17-Mar-26 14:10, Sakari Ailus wrote:
> A few fields in structs containing regulator initialisation data for Dell
> laptops are initialised to 0 and NULL. Drop the explicit initialisation as
> redundant.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/platform/x86/intel/int3472/tps68470_board_data.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 6bec5a910396..c1ddbf9a82c0 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -151,8 +151,6 @@ static const struct regulator_init_data dell_7212_tps68470_core_reg_init_data =
>  		.apply_uV = 1,
>  		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>  	},
> -	.num_consumer_supplies = 0,
> -	.consumer_supplies = NULL,
>  };
>  
>  static const struct regulator_init_data dell_7212_tps68470_ana_reg_init_data = {
> @@ -162,8 +160,6 @@ static const struct regulator_init_data dell_7212_tps68470_ana_reg_init_data = {
>  		.apply_uV = 1,
>  		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>  	},
> -	.num_consumer_supplies = 0,
> -	.consumer_supplies = NULL,
>  };
>  
>  static const struct regulator_init_data dell_7212_tps68470_vcm_reg_init_data = {
> @@ -173,8 +169,6 @@ static const struct regulator_init_data dell_7212_tps68470_vcm_reg_init_data = {
>  		.apply_uV = 1,
>  		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>  	},
> -	.num_consumer_supplies = 0,
> -	.consumer_supplies = NULL,
>  };
>  
>  static const struct regulator_init_data dell_7212_tps68470_vio_reg_init_data = {
> @@ -184,8 +178,6 @@ static const struct regulator_init_data dell_7212_tps68470_vio_reg_init_data = {
>  		.apply_uV = 1,
>  		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>  	},
> -	.num_consumer_supplies = 0,
> -	.consumer_supplies = NULL,
>  };
>  
>  static const struct regulator_init_data dell_7212_tps68470_vsio_reg_init_data = {


