Return-Path: <linux-gpio+bounces-38329-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XZlqNfGcKmqGtgMAu9opvQ
	(envelope-from <linux-gpio+bounces-38329-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 13:33:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 324906715CC
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 13:33:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YKmGp2w4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CHN14sKo;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38329-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38329-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D30003252674
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 11:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBB83E7164;
	Thu, 11 Jun 2026 11:32:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75583DA5B6
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 11:32:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177544; cv=none; b=cPUMmSCBCStuhNO3ETLsekO6uFssL5iQYICRlLFYKGq2cQVmsziqEixFYVhE2w0tkt2I044yD0G0e/kN5zh62Zw4fnF7L11vVp7GrEovyz6l64FM9gWiqP5Ix2oCufja0qk+zgjoEGT7qjjUKcAeHDNpigGwVCTxMj3ZtiidX1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177544; c=relaxed/simple;
	bh=0StIhegVocrr0UB01yU+UcOspZ1FBVgbSkPGYjz3Acs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VneW/AzxbiD1NnHPM7zVsJcYGEb2TOiapsHNdjN9yQu5oc71MqCQ/mLEwTtSOJmUqgpLeQryuMsAEhqmO8iv3zevMzKp8OdIJaVlneHKMD8W7idRCr/vC3GCz+Cg69z5nr0YJUdya2NEJ0WcR/wHjh3IPxFOKLJpNoksMHCWkUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKmGp2w4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CHN14sKo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xM1v284300
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 11:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLBwXK7+oD6+XlBvQMPqJDwpfaAh9nMZFyst4JItm4k=; b=YKmGp2w4Uw9sd1Lv
	n2/3v+0Fvg+ZGtp4HTspljqxGNIj9yWFgrPQFEJ8L1HtgcHfEFzcoHO7RWeqJfB7
	p/SavtBwi/Aw6c3XmHPakqA9zb4wXeTQbm8P8nYzdLjckTD9F3qRmTrIR7wvLh62
	/+nV0ddbYvknnbcX7Mt0lKLT2nYfyhoRdg8sNdBOP2FJ8KineipZeIE0Xd5rQ5Nt
	1cEpcMoBvrPdKLg/Ml9jotWen3SSuIdKSpTNhA2qZfmwPiL7v7s6jUg++lSS1mqM
	jqVNVnQXFfaf/OGMCxj/LHjL/nJcfNTIzLZbSEDwck1vR/gx6x3pg76ISaqBo9ip
	GRez7w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6tk6ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 11:32:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5177b12d7bbso14763481cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 04:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177541; x=1781782341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yLBwXK7+oD6+XlBvQMPqJDwpfaAh9nMZFyst4JItm4k=;
        b=CHN14sKoGZadYc9af023CA0NJNIAg3Gk2MmLIFjhjuCKjvKdHWjbAT5J0kjJs5jw32
         udRbYPYhVeHGvdvFdGA/bfSNo5D98j3WAT+yxWDokaKPFD4s2sTHHqUCLvE1yArbRm8u
         G2i0zM2jC3mAB37fpprceFB2hpakQtQQfIYgLW4jw6Cx8sKV3YCugSq+3xljl9IuJsol
         lXsX3NxGjeUrd81QW5K/medhfkZs/miwZxdRl9lQJPkoW7fBUd/652fqpLeesTwxG/YE
         XTVhe8BeQgIAjrZctgiu4TnLHdxCoZ2Efe4lUVZziNJt/DV/j56RAQz0WUGj+rkMPS3W
         VN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177541; x=1781782341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLBwXK7+oD6+XlBvQMPqJDwpfaAh9nMZFyst4JItm4k=;
        b=rMf9V9LBWwCCtohLCPgbidqg4RT+0m2XqG1VxnyFgbDEJRUauuRWYpVbsL3nfL7nl2
         Cl0KNUp3DwqHQnNNnpuXm/ODwMQz4jdZ6TV5GAf6K9hqYr8gDUJ0Trb0dQ5IG83Q0pQQ
         pytYC1zyPk9Gtx3po17uXop799G8ogYPLyapbM2EUxC4UmRbcgkZ18L/tEJdqq62wVRz
         31YNp/jHNRLcyOcEKu91YvIwrrFRh9BYWhWFu4w//FrndJwdG1ffRndlin0RiGzJYeA9
         JefGJlpG4uwvbJ1TdCsWEaJBGmrop19CAl7WcjQIaPImEMcQ+zqX6IyRpVkvZQCGaJ8C
         PXgA==
X-Forwarded-Encrypted: i=1; AFNElJ8glCG5s7E4HMMhtj6meAaU0wYe5eLU7P9CFlckBGwl1uyaS4tcXB46ReQYlPw9f+YIqErohM1XRtZ2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz02v2qFkv7m7akT8zjfPv+BPMvWv3c8s8d92S0xuCzmBijRRO6
	cV/6m6yzQWv5+BQPA8fGQ2SriSISOJHyPZmwMj8lT5QidDAAS1ljSYMBRdTDPd5Fr7ftRPeWeS6
	vscvlbDSf2jJbKemPE58GLX35+uhpu6aHqiqV5PpUwfMr9dHJbqk1OFq0WF5k5gwN
X-Gm-Gg: Acq92OFEaVG9uiNueIUBJ2rEkkHmswJ0V+pngcDKQScdqaGwyEnr8tJn8WzN5V6Ceay
	vYcDGmCbBq+B3M+HEOzqOo5PKD0dsXAJrG4GE9wICUUu+40gyi3VDtASttTseCBUSTT7oBP0nUZ
	H4lcXz84+u4/oZN8fEE8TqZmrEJ7hPEVaEHK330RYgE/SXezLmsAxwovZKyyFZtp0s4QOB9N67D
	iu5KqAnusB+IMv7tKE/YQzbDK2kC3za3mleSX/JR1NKehPPUcz0tHe3Ew8rZcZWZvexr0s9Fsv8
	r+J/nfxrlbxcgi/Ew+ZBga1nKMOS9YClVi2/bLNwiTPUCB5w2vApsLxbviXUkUEJMXBNgO3MW6P
	2lmXJWdqh4xU+Prn8XomUHjzsgtSZET0v9C4hsz/BpbrqfDYP41ayT7Cd
X-Received: by 2002:a05:622a:1f18:b0:50b:2875:5782 with SMTP id d75a77b69052e-517ee2375f4mr20213831cf.6.1781177540992;
        Thu, 11 Jun 2026 04:32:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1f18:b0:50b:2875:5782 with SMTP id d75a77b69052e-517ee2375f4mr20213461cf.6.1781177540438;
        Thu, 11 Jun 2026 04:32:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f14cbdsm52606966b.2.2026.06.11.04.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:32:19 -0700 (PDT)
Message-ID: <b6fd22ee-a063-4af7-b21a-5f6268c65b07@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:32:16 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] pinctrl: qcom: Register functions before enabling
 pinctrl
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
References: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
 <20260519-mainline-send-v1-sending-v3-3-3dd7aa125353@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-mainline-send-v1-sending-v3-3-3dd7aa125353@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX2K5DVThG1+vp
 cYSrcuACms+UL4mg/ShmVlpxJGo6/oRNGzSRxtYzVAEUQBLLZ/S8jLnp04egSFbi2ImVzvRUR+K
 Io973kfW4aedv/rnLJYKMCt1XCTim+TVzADfalHdMvmzVGykimMxtkit29NIq9LOlBHiWvCTG/f
 6wlxPpaTMqlBxSqZiEHv6AMv6PuCym8o1mBZx9Z0kNQn1zMClhnIZ17u1uJexQyJEiBCRqnA+9U
 HPofBq09eSRk0qRi82BEq6cAhkcNk2vg2oy49EGN9nSzkjPVbJeozvFFYReSEu0FtU2Zrft/tvW
 eTnMFYULK0573NZFMVE6T9ojPw+2k4syg4ENJAe+oIpGExz4oJt13XXv2xoqgv2UGez1Rlf+J18
 gsy8T2LQF8UF320a3oD+LqsnU80aBvOaVB1lPqmgje7vrf7HwVb16eZW2jiji2U+H5YKNMvP7Jx
 pxZeEEboqOtE36nKXaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX8OVRP/tUsszv
 5FNW7vjhH5nnhOriv9Yg10RlmrU7hO6vMhqpjUY4pIWhwi9wuKKSTgvIB3EbhFAGaB0iVu3JxlO
 FAqCiSmTAEZP5AdSYcVg/m86+NwpgM8=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2a9cc6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lq5VANsAAuRygiiSL6QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: oFLr159o-vJEJEwEBxASA_QrFGf70v5D
X-Proofpoint-GUID: oFLr159o-vJEJEwEBxASA_QrFGf70v5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38329-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:contact@alex-min.fr,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:linux@gurudas.dev,m:linusw@kernel.org,m:robin.clark@oss.qualcomm.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:iommu@lists.linux.dev,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 324906715CC

On 5/19/26 9:16 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> pinctrl consumers can request states while the pinctrl core enables the
> controller. On Qualcomm pinctrl drivers this can happen before the SoC
> function list has been registered, which leaves the function table
> incomplete during state lookup.
> 
> On APQ8064 this can fail while claiming pinctrl hogs:
> 
>    apq8064-pinctrl 800000.pinctrl: invalid function ps_hold in map table
>    apq8064-pinctrl 800000.pinctrl: error claiming hogs: -22
>    apq8064-pinctrl 800000.pinctrl: could not claim hogs: -22
> 
> Register Qualcomm pinctrl with devm_pinctrl_register_and_init(), add the
> SoC pin functions, and only then enable the pinctrl device.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

