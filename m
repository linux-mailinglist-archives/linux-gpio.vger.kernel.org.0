Return-Path: <linux-gpio+bounces-35347-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODerJh2q6GnEOQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35347-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 12:59:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A694450C6
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 12:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF50C3013B54
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 10:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3ADF3CD8BC;
	Wed, 22 Apr 2026 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pm/HiF7q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="abhlyFl+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFAE3C13E2
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 10:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776855577; cv=none; b=k5f06kEcaEo28MHMe/sApkxsAqKqVUvtc1U0Gh3QVBz/HUfxFlylCSMCfwrVG48DUYHABoktZ6Qa0JPeJz+JOLH9Fzgf0mPPuiYaETdDJKNqW3bX2rgGThdtXYxuA4RHZpF6g0OZad1gc5E+GY0+SG/UBnzs8IhoLgg+lJqHjDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776855577; c=relaxed/simple;
	bh=1tU8ilTp0izBh60I/s/PQ8PYpHh14NXF95Klg8d3WKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ckIr/Gie5rlbMmWOPcd2FKjt/Qx/iqad0ptHsNdOZRWP7dfd1jth4hezLEjpA0aCjGeCCtdLXrMrpDFudtQkCP9MbCSa+39qNI5tWJG7l7LnmVBMxFM6VSagX5l5VPvNzdrKwZ90Eyj8r5uR47zlHeLhSklZ5Lma6uAb/Z7WECc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pm/HiF7q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=abhlyFl+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M96FnR664172
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 10:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oaBs1f323n7nubQy6ks501J38n6eyfc8rziMeT9fslQ=; b=Pm/HiF7q/JLF8Dca
	pmwIGvtL78ujaX9oLyMoViGzgAYQrPZ/ZTnVdsodGih1ZJF86aef8/URsRQ3MJya
	/el57WeDKW0j+rwVnPsTRPTcccg9ZzPghHz601HGYOhYTZ5mAdcK9BM4kjN800lW
	2PsIBZbLuZhXTY/dxafMbyXjIC0Qy8ELxE/Gs4115PaM8jPRZhVt1oFf1GSMArrN
	nfm2Ix6FYm0oeckt9cryCP80BcC2BymSQj65aqnJn+nTim9hEZ5rLyDAyNyjVJaW
	zfWB33OQ8IiVplbweCsZCQITDGkpY3o57Hmibbx4ZTnv1tEdK99Yv5fAhdZg4Ajo
	g0BVhw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgrdx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 10:59:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb98b09d3so5629831cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 03:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776855574; x=1777460374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oaBs1f323n7nubQy6ks501J38n6eyfc8rziMeT9fslQ=;
        b=abhlyFl+ua6JDM/gyw5urulWoRjcPmWqSEjTgOg3Muytx17Mrzt/HvPyqtg7B5ZFie
         AZFT3AwUuW2MlD22mEJAKtay7v9S8nhWaHBtcHj67jDqR3tA3Sn7KmEsZRLr/9hAs780
         wUAclxyGZj88khCskVBenz4A1K6GSouvbEZz5aeoHUDCyIBxlDENbpNN+UK3reDBT78t
         RzKCLm3aToNsaXeXb8G0tf14RaRNHX2mqcvrZzsyOa7suTb5ZrvVD+FwdCBR8fr+LToB
         CSp6MFBHEd0dnT/zd+FkFN8SDehMJq+paE9Kb1R9hQkYQPvHcaCLjbBt/mRJMLghlsg1
         oNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776855574; x=1777460374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oaBs1f323n7nubQy6ks501J38n6eyfc8rziMeT9fslQ=;
        b=aFPk3246Crh6Ti/IlZPXgj7fU70CvTTfX77t0VnVTaV/0fmpR5X392rb/gr86JR747
         OLMEV2dHOPCbhNWKONEDDypU/smJ6UnLEnjd2dx+qUz3LPHueDpVRTfKaK/31sk98Saf
         N/kkd/7hsOPeRpcmXXX/Q3R6VraWulLq8E22NrDIUtHIVDUp7oKgXjw6P504tnS+myU5
         r33YjMPd+KyAF1eyXJCgITBJhOfFt85x1nugqxdF8E0/Vmv8CCip9h9DuJgIQdL10cT6
         NOn9kI6vuIFpRBsk62WQtrMsjXEqadZSqp1usqLN1DcJP18xaZdpgC1OJi/CziUJ+KRk
         2JYA==
X-Forwarded-Encrypted: i=1; AFNElJ+cN9xNa+iRm989Ipb7Rq5Jwuqe6F2utVwV2wFzPxt8fVoT8KCmjNz7ZIG8ppCUimg2ZUpdbZ3fBej+@vger.kernel.org
X-Gm-Message-State: AOJu0YwILBebmw/6luG47wM9ZMZNfgoyrMi5Xg6BvpqrFWbkuL+vBzCf
	BW86ORUUFoAZAGYTo4N+ju16UN89KPsvt+2lz78+u7LAkSeYj49QKIudmjVDnrnyFwdgtPkV0Vl
	ULR+o8cSEg1povQGWeH4/iJ3FeEC4S60X9lEXffDw89PgS5FN8EcDJ2Z1ScMO/DCH
X-Gm-Gg: AeBDieshlh35nDF6dpr4jDaCGs+YyEg0FA7CUxMlU6H9PlhVOsjlkmNOc2/R5oR9yET
	KL9+vjXlsakiLFL2xMFbv1ZV+tGw25bOVzSfeGYYeDGM3ZFYYBTEfR5bDLBciClpsDA4dzLjusB
	weo8TBPeDTRSCOnyIm3dDQHVOooZ5SHunRIHFx/fp23MULT4KZp0B652gZm8YI3WwS8IsDTXhna
	HXNeJeMnwc0PVxvfyzOUOI/o5vDgdzgXhI4/9r+11hvVwPiSISoADNRXu7vvUtTlye9G3FM2yGU
	0S93lnxZPuReDBMQWX0k1isg5Oz3yLqS0+pa2vBrM1MP+kgVhcXhO4EhNTwBUV26Yk2z9dYmrQ5
	IO+OsU2EevLBOtbI9ob5XNJRBZvHK34/XPAjDCslACpdOo9US9oTKLIYWcuSaAw/BN4oi6APw5Q
	Vcc8lz3CyT/qZezw==
X-Received: by 2002:a05:622a:1812:b0:509:d76:fe73 with SMTP id d75a77b69052e-50e36c0fd9amr228235601cf.3.1776855574484;
        Wed, 22 Apr 2026 03:59:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1812:b0:509:d76:fe73 with SMTP id d75a77b69052e-50e36c0fd9amr228235401cf.3.1776855574051;
        Wed, 22 Apr 2026 03:59:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45504379bsm524976566b.42.2026.04.22.03.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:59:33 -0700 (PDT)
Message-ID: <077cec8c-f6a3-4ee8-8ccf-7bc2e540bc61@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:59:31 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
References: <20260420123135.350446-1-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420123135.350446-1-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: in8zPxbx-p8k5od880pnK7YmJ7F5md3P
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e8aa17 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=klSbozjfqijqAWY7aroA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: in8zPxbx-p8k5od880pnK7YmJ7F5md3P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwNCBTYWx0ZWRfXyqQ5almwUxtY
 S42HrDtOXItSByexPpTBuE4A230zJeE20aZSYVCs83YSOU39lLDVHeJeUWDt23Xmds8YZdeyC/7
 lzBMP1yfpSoE408EeuxQhWmPBYnOQjvXJUxUkUvyMPcWg6WNaDyfkgHf0RRKkscsfIKq9B7d/al
 bDKARjFuDtP1/34crccdn487/VoOYykJleksLhe10Pq4uwCzGXZrxqN7emDJdxebV98N5susJEd
 AfgKiVpsnxG+IUH2gvHhTh/y+DISzvBTNL5WwVovcN3PDb9Mb+I2BPhb4VWiGN/rkB0zUf136IJ
 Kobq3PFb+3q7Hn7h1vSc/jZd5PoRLLEmHjO2pHgNEyJCQ8snH/hKqp5EBaIxUbCYwLqcLp2kIUw
 GsIy+GBRkC53R+0/CC6z2jTYYOmAgzLfbQBOCbv5baj5PLDzClANwbRgXHEts/SLKls6giLlgfU
 HSeUUbzM3D3E61Mfluw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220104
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35347-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E9A694450C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 2:31 PM, Ajay Kumar Nandam wrote:
> This series moves LPASS LPI pinctrl runtime clock control to the PM
> clock framework and ensures GPIO register accesses runtime-resume the
> block before MMIO.
> 
> The common LPASS LPI core now uses PM clocks and autosuspend. Runtime PM
> callbacks are wired for all LPASS LPI variant drivers sharing the common
> core so behavior is consistent across SoCs using DT-provided clocks via
> of_pm_clk_add_clks().
> 
> ---
> v1: lore.kernel.org/r/20260413122233.375945-1-ajay.nandam@oss.qualcomm.com
> 
> Changes since v1:
> - Kept GPIO helper return type adjustments in the runtime PM access
>   patch and switched access paths to pm_runtime_resume_and_get()
> - Added runtime PM callback wiring for remaining LPASS LPI SoC drivers
>   (sc8280xp, sm4250, sm6115, sm8250, sm8450, sm8550, sm8650)
> - Addressed style nits in GPIO access helper declaration formatting

Each patch must be self-contained and not break functionality or build,
so that bisect always works

If I only apply patch 1, non-7280 platforms will still regress because
the changes made in patch 1 require that pm_ops is set for the clocks
to get enabled (otherwise it'll just autosuspend 100ms after probe and
any subsequent accesses will crash the device)

Konrad

