Return-Path: <linux-gpio+bounces-31709-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yA82M/H1kmlY0gEAu9opvQ
	(envelope-from <linux-gpio+bounces-31709-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 11:48:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 404581427A7
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 11:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5170301588A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 10:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86193009DA;
	Mon, 16 Feb 2026 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DPHzJg7d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EP4IksMq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA264502A
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 10:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771238893; cv=none; b=VCZrBvZdNYiy05MMlXJDe3q60ui1ll4E+Wy2Sr6lB3/0ZOXEefPOQI1NQmBhiRpMafQK4vgQdJejz7hzRSKqeM5bhCWhMo9meaKp7k8LhMK5Yb7ArhwS9SOiAmIgvzShRHHuPPooXtGY5c/k2TaOqYPTz3Rr4wrcst1lNzNEHk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771238893; c=relaxed/simple;
	bh=1zbQrVDLQB6w3Qg/Ku+uP9HZ5NDJol3JbH2TotTclUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XQMfcgHtZK5s5o3izCyu+gIqmWDCyOJJ/aYomuVC1Dx5L2iWSVB+jTwSX9oqATxKFi3A8F0Tzfs3FfPpyMXWqAadyrWHbHoRINIkq85/aKd1q8zDHrOJh8ElVsN7pbH/xutJHsoEsxXO8+lcTDRtzpGjFSpFJDHvbXiKG5vu6AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DPHzJg7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EP4IksMq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GAjc0D1728549
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 10:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n1SaqNIg2+numwZT8FVXW5Ow+2HmHKzCnOHuqK6Vf1U=; b=DPHzJg7dkfvcPfJW
	nuINujkdOsd5bO6EcZL61hhPpkUh2XgrwnrOQJyB2WN5mlFwp2EAbxkqoh6b+IOd
	V+jChK+FBh2qdj14AkZFeN78U2Bm3Uk9pjyhAUdvt0iChTeXsxUFMRBaD7IiOjHc
	hOyOsEx3CHlAEubgMjU0ZG7bIWMAusa2KQypbQKMcwKr+Lo3OmuE2r1aNsHAcmcE
	o0T/ewQnetUhy7yKQuFOujwoLxXW6FT9L30rXINQCLTbKVKS899U1n/xBpPnZ0xj
	LGn6KZeSg5rHpTLEA4yhnTzVOxnExHlDq4nx5TGafO/w/nyLLsPaNojxKtdsz0PL
	GTOIiw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbnv9hc36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 10:48:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89545f12461so20864916d6.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 02:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771238890; x=1771843690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n1SaqNIg2+numwZT8FVXW5Ow+2HmHKzCnOHuqK6Vf1U=;
        b=EP4IksMqLDr+B7cI9f7guPAi99cJXpn+7QVyWSSEvQY9cuKGCkVdhM+Y09rSXBFO5b
         1qzpbnpImYNi6itdccfADJyhEDl/0jwlIl8GLHNkxgXMpktVB4/k8Usf+x5Sa2KidCnR
         kJDk31kpriXODWLt0GGbcYGQMlcyqbE2iyrNTSJs8OseyBkYb2OLI/Stxjn+Zx3TMeQs
         8voEcv20XByY757lbRL9NIsv92bkSNuOPE5kP/NtkQfwMSGpQR7vVrN+ivLo1pBIniPZ
         DGvN3BmGDx4BNOg+6Ot/SStjvqIqWSavCVh4yq2lgnPKAqTX7PkNJ3tFY7lV06TB51zY
         GsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771238890; x=1771843690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1SaqNIg2+numwZT8FVXW5Ow+2HmHKzCnOHuqK6Vf1U=;
        b=EwDRsfhLPd1uSDnE82XDNsNAsACchWm6zt6HExioMAYhKkgVckVCwjgzJ6eKi20bwH
         YtnH2oDpR5pIAMxQmkk8YGvZJH0lizD5XNZVK8V6jI6De6IdwPzCYKXFrCaVretjsLr7
         c5AMdyJbWb4EFQ5LXYTy/g0fEti9wvPg4P6aFXVoLibeyBg2ZwRsBqvnrYczJTxeHEcS
         +XhA04/0wt2pRbzM8w75hAuQZUVpleGVseM3j58UCbAudKbIBNAx6ePuakl6ewV/iNcJ
         iMF82CCjsY19Mjlpe4UqNPhIw0nv7N6uArLjcl7e0PEV/weM0RG/3x2w/WL/rjcUzvj2
         Fblw==
X-Forwarded-Encrypted: i=1; AJvYcCXtatzYHJO5Uhb5ZgRFWw1Dh1WWQyYt2vm/4IyEpggR2F37FBz6hPYP4Va7hHd+WUy34MIPgBRNouUj@vger.kernel.org
X-Gm-Message-State: AOJu0YxneIt6prM8y0qbeYi0E9ptJ8j+dMB/gRYtjk6Np89f+4VCOWDf
	tjIMcoNkdgLe6xAsv/FMOaqzGK4rt6ViptJCJdofZZPzxBPMpmwiQdSdCEYix9yglTOdIvcKK3d
	LUi7cEeHeI7RJHEX9+Fe/lwFOdruOsAR3r68866oz41LGhZ40e4gT2x/D29F5InpY
X-Gm-Gg: AZuq6aKJS0xP/Z3Ci85F5jl05X3smEUpLQa61c4dHiNTy7p8KA712nIbxD4uj5DYwzR
	VyCFUwKhugErW7necSp74VvVktYYsDmpmTOeREhzMh9MOR0jZHkg3fhfptLgVRNZ3mklpkmTk/h
	ZnI1gu/zHmVKMsG+u3RwfRdzipLyIZoRekaGZziPtmc+m/j8cOt3y1+EKH3043CsdVZveGi5SHA
	7HweXZ/HVgjuO6oMHvr/mA+Drb63h7RSjIBn/rQaURz21h2Uh0Pq8H50eCrRD+KYsxZgGkgB9jw
	mmbkjsWe0Us3fBxE6IyVqrDRsIOtiLvk84le9ogK3X3yKh9erWTvw6FKD7Vob7tYVMDll8LVKfV
	XIjKnpwdwHge9scXIBA4bfx9I/UZpMjc8++gSdKEErBSEUwuaK1TpTQGoup8veNkS/bqwZUq+nT
	xJ7+Q=
X-Received: by 2002:a05:6214:4f05:b0:897:12e:8e8b with SMTP id 6a1803df08f44-897347e287emr108822076d6.7.1771238889946;
        Mon, 16 Feb 2026 02:48:09 -0800 (PST)
X-Received: by 2002:a05:6214:4f05:b0:897:12e:8e8b with SMTP id 6a1803df08f44-897347e287emr108821916d6.7.1771238889488;
        Mon, 16 Feb 2026 02:48:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f7c24sm248590466b.30.2026.02.16.02.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 02:48:09 -0800 (PST)
Message-ID: <7ae02a5d-b79b-45dd-be23-dbc1114c9a7f@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 11:48:05 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: sdm660-lpass-lpi: Make groups and
 functions variables static
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260216082549.32853-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216082549.32853-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GzaJ0_oZo69n_ORzRG6AgvI5USqZOzTL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MSBTYWx0ZWRfX8E/9M3+feWTa
 sYR3NPhkTreYfWxUvPTRszzl4DXz01sLzbhAZJ59/NjSwEp5MEdDZY5TMWMY7lo1+OJfIdt0Mxb
 tIspcTFNUtohQtAuqqiBhdodZdWPuv+0WSOPg+MZeltqVwDzK2nGasiLR5XwvtROjInKnRQg+95
 W77AHOOByuHgqRYEkLMTlQVBN222gamuIK4zmY7fH55jjokEi6/DX/8svX7aXUefQkazkAI5yUK
 /bWww5uN7/zACwuGls1P94ZQg4LQ1IN3lh1WzlOg5Ls+6rQem1cy+i9aH4OP+YEyvJ3p4azkbKD
 um2LOZtduV2HVykvxYMo4tA/YeZdV7irLWBo8bf+Ezaxh5hzFkvr1DjHSTrqxDZ3TylR0TASsGY
 uprXjDPlFGiOrNQsHkjARJGC8BVWgVf73T5IJweOl/sMEHLu/YwyLoMazqLHAYFSy+vdiM3XpzB
 YuJXCE2Wp19popUq1mA==
X-Authority-Analysis: v=2.4 cv=b7K/I9Gx c=1 sm=1 tr=0 ts=6992f5ea cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=6-iG9zf4YNE-WpPKBB8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: GzaJ0_oZo69n_ORzRG6AgvI5USqZOzTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160091
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31709-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 404581427A7
X-Rspamd-Action: no action

On 2/16/26 9:25 AM, Krzysztof Kozlowski wrote:
> File-scope 'sdm660_lpi_pinctrl_groups' and
> 'sdm660_lpi_pinctrl_functions' are not used outside of this unit, so
> make them static to silence sparse warnings:
> 
>   pinctrl-sdm660-lpass-lpi.c:79:27: warning: symbol 'sdm660_lpi_pinctrl_groups' was not declared. Should it be static?
>   pinctrl-sdm660-lpass-lpi.c:116:27: warning: symbol 'sdm660_lpi_pinctrl_functions' was not declared. Should it be static?
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

