Return-Path: <linux-gpio+bounces-14037-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B54C9F83AC
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 19:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71CB2188FCA3
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 18:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB07D1A9B4E;
	Thu, 19 Dec 2024 18:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CipT6zSe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CE61A704C
	for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 18:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734634723; cv=none; b=IF9nMm5Y6k05k5DQnMCPRrhowfsgMU6Cazdtvy7GRk5VR5RtoTzk3Io+DryGhFz5PmOthD21x5P2Wo88s6qMyyR9aq5vW72fU7Z2QD/VO6YpQkkwU5PCoxgWsGj9CumHmNJQsUXXqOA0hmnemsM2s4bYVljqsGY42emrpv6wt50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734634723; c=relaxed/simple;
	bh=axLo119heLWBFxUBcctlRiBbYg4ax5uAH6d+A3wUUck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1Rt6/fzHgE0wJj7wC+88rYvnwMapy7O+qFBwG2FvRjmINgq1a4zUS/6+KnjJDIryxjxdTZselVCtWqXOjCTbAIUduT2ffFNzk9BpvmGn5ezP0ebCloX8cMy2fb9Uc1qiaDw1kpUEMMTWzKOmduguSlqG8tgi5UAqcf+TMRSPAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CipT6zSe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJHLPos017568
	for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 18:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRJcBe0xIsl1ZdSMYuFgDKPdn3YkUJjMbpcCSrMDWyA=; b=CipT6zSeE2ztyUXk
	N/+Q+mRHSlbCTqZCrnslcWLy6EMdRQxbgt4X2sTR2JMSTPKcVhUzmGJgY7mihzOg
	/xNxqgxr8ceatP9d2PTdBdkWt0zBI52htLDGDQ9bOB0NXRb7fIj/lfFkvvk3quaA
	7NJMNduH1vqr7YqFrgo+r1y/cqnCG/DlbqEq8um8g4Z0tN5o7M7fI431vT0mrQ3i
	/ik+Tu9MjaCLmO08kOLaDvA821NdxirNfbhup6ShB/6xNNKOE4iWPYpfT4ZFKnyf
	jUFnrJptUxaxmDXhJA2Tb/NJTWOjOFEvaAJPEjx/92LBt6wUdhfiG7kMx3jYUbfK
	trcg+A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mqt8073r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 18:58:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6dd0d0e0604so1941006d6.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 10:58:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734634720; x=1735239520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GRJcBe0xIsl1ZdSMYuFgDKPdn3YkUJjMbpcCSrMDWyA=;
        b=g+5NsrONwJXfIFhT+MTt8I8XAg07lv5SSGsOlZejP3y5fHWQPRjuXVyPidgDegLr9I
         4xWPfYySmO18Op/OzJ3nSR5ev0qj1XzAU+XcCvUwks7X7Aopsy32aE+cYtFxHpzpvJBa
         j+3bBNMIuov4NrZIIRQMky02gBa35lJl6A+FRVDn+tYKA2zhhBZNiziOeqQRYnb2lzKQ
         uQFSJIaVcFQ2x0TRqOjRDgQ5rAyK1rFI6cuMDUbXnapD0f9Y4nLg0bDV3OILcsqZ33v2
         QIi1LL/OvKm5aXFt2Unvniei9LQDF2nwtVR9dg+28e7aH+9Dm0kWkOyHkZLOeAo0d/aQ
         4rsA==
X-Forwarded-Encrypted: i=1; AJvYcCVNEvXGrB1RAWilH4UZqcwdMLgGC/lDuhuVKAqj9Rug615U5FnGgIx71o4ELEgTChdVhXYAI5wmZSwc@vger.kernel.org
X-Gm-Message-State: AOJu0YxjfRP3I7SZ5WjgnnUp74V0xSReBb9qWDn7PmNdJ+cLHwJLJzZM
	TYkCDZ3hGqN2xxJ0rNB1bwvXfzqW1s7Hgg2vBmohzVLUeTptAuMnowmiYGp/mlwwWw0C4JyMtRF
	XDXwATIdBSaB3ZdToVj4iO+PGotDbo/zWB+0h+/rK2Zoe/Yf2xZb7+vFnOjFS
X-Gm-Gg: ASbGnctYfBE5J8r55RtJkVtnCe2Y0T4Ux1JxdswMPZ/J5tLLlJrw4UvCOHhce4ZeIrH
	3aLKZzgEPMkkS1xeNQF4quE0UFEXlOPnrx1kpSeij8lBmQrgKVUtkWKFFvr/vmFXTMywW/SUGHb
	CCy1bwA0BJQJF44JPsUBYLjxBoSNDdSmVhlU+TeJz2Ar8OkdpBqrxOWO/puG2AfxDGTf2S2JLm8
	vdREFmhwxxDkK7T6V6Zlj3hCAj0SeJa8/mGBjP2QuALvO4Gveu3VGClhystN47Tsutv+l8L3u0h
	fPhURuzc8X/TQqVtXbcl2p2LXXuOYw1NsR0=
X-Received: by 2002:a05:6214:5f06:b0:6d8:adb8:eb92 with SMTP id 6a1803df08f44-6dd23307518mr184766d6.1.1734634720148;
        Thu, 19 Dec 2024 10:58:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHF0bfXtB/SET13HIUhyCCHUDpUyYn35muJnRdXNK+Wqw/rveCyZHBP0Mj6iB9Ojx/5IaTZsA==
X-Received: by 2002:a05:6214:5f06:b0:6d8:adb8:eb92 with SMTP id 6a1803df08f44-6dd23307518mr184536d6.1.1734634719692;
        Thu, 19 Dec 2024 10:58:39 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0661b3sm94320666b.180.2024.12.19.10.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 10:58:39 -0800 (PST)
Message-ID: <15653310-5f73-477c-9ebb-8872dda64310@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 19:58:36 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: correct gpio-ranges for QCS615
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20241219-correct_gpio_ranges-v2-0-19af8588dbd0@quicinc.com>
 <20241219-correct_gpio_ranges-v2-5-19af8588dbd0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241219-correct_gpio_ranges-v2-5-19af8588dbd0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _bqK0JLoFSCbnTTmrp8Utm1KV2o0krGB
X-Proofpoint-GUID: _bqK0JLoFSCbnTTmrp8Utm1KV2o0krGB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=814
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412190150

On 19.12.2024 8:59 AM, Lijuan Gao wrote:
> Correct the gpio-ranges for the QCS615 TLMM pin controller to include
> GPIOs 0-122 and the UFS_RESET pin for primary UFS memory reset.
> 
> Fixes: 8e266654a2fe ("arm64: dts: qcom: add QCS615 platform")
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

