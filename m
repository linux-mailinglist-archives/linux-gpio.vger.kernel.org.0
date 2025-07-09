Return-Path: <linux-gpio+bounces-23031-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 339C6AFF05F
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 20:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F39361C83DC8
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 18:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A870E238173;
	Wed,  9 Jul 2025 18:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnupimiL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E446F226165
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 18:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752084218; cv=none; b=LH7PKULMm4gGEnu3fb54edA9g9eX+/w5W9+MRIBYbnHvux55Le1L1rdkK1bWhM44yEy+lmn4mzv9hAbewpTaIbneI5YTLWjpuGQw/h0aXs4JJ035Xy+DFqmSKGFbImtWugSHU3BHGNyeXczs3TZ8wTQ6Fpfesc7EAH6zMAlktCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752084218; c=relaxed/simple;
	bh=27TDKvCzp0syh0EGTxobI8FWbGxi4OXzg+TEq6GiL0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M2a+SIIxYAZxU3jkp+3sDvBdvr6Z4BbqzGqjkgUIwHm9R/442ljIL5xKoMq7pdkFzXmFkjv0oA9CSzF6qEoWs4IKRMTV42LbmRwlGjwml6dten7uftTwF01BqW5c5GrAzedpFOGlQFs1D/C/o7tu2CIfnfv4j2IqF83Qjr7cmlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnupimiL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569Cp68Q017173
	for <linux-gpio@vger.kernel.org>; Wed, 9 Jul 2025 18:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2uc92O1GGv7emWG1TYEn9fypVsBaY5TnEeVaY/0T7/w=; b=KnupimiL4EZalts1
	9iEjxmVspLViNkxnTUsyCodjfZClzaw3RAAZ2hh6QRgRGnyn1GoKdQZidsvNJHYN
	Z7/VxAuaKpUtt74ZD+sV0H64fNlFc5S0Yd/FPiazPMl/e0V7hoqjbc5cJLu2kySp
	7XUXkBuvInznLXZjQPSYeQDgGitwILYrSCJRWt//urOBqwyfdi8imRlHHWnrtTBo
	MeSHWjhAulRW7flXAk5sA6yGYoCPCxRjjtv0S25CDHWIJ6+uRWzW4mTr47k5zDpu
	9GsTKJHcr+xuVJte38F/oNEiHARwn1Tmmpzc1opgSA8fRa0kksABdaEGanDNpou6
	KHMHmg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvefngpp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2025 18:03:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0976a24ceso2935485a.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2025 11:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752084215; x=1752689015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2uc92O1GGv7emWG1TYEn9fypVsBaY5TnEeVaY/0T7/w=;
        b=Y4OknM991ucdOcLgmasaTLp1ob9I8X6cCFLXKDjZEM2oIBY9dgRoMiQUvWfNJVsOPE
         GsrVfellLwALNLQ1D4IACmU6IsGZ7wmLv+yz/VPMxVMT/iz2jXnY7nfuiNueIGLAbGLC
         spSlmZU9vBTfYAv3QHXi4IK0R9meLM16uiw/G+2hKXHweL/nmZluWmQsdvVjD+ofzt3x
         Yzcz2UQywkafgI8TfMvFMYJq6S/kMWTh25ReETWohr10blIP/aZ+yRozRLrJcpOwq9NC
         A21x5Ys5m5XI/qsQ6BEGFPxpkRh8AiLHSstxev/rmSpzF5zgK6um3TeToCabRBKY29t5
         B9pw==
X-Gm-Message-State: AOJu0YxNO3OslRFdHmUWhXWHJxSzk75xV/3s5yum00+sUqDmncxsJQCb
	h5QDeIAnsO1p+SkH4PSOSR7dq9MVfddlJRJ1FAAuJoaTNyxI4FXKPkDWcK+RQhNFbJtHBEl32XT
	vk9EIF35XOU+Rw5XFQayu5dLoJ2EajHCgFee/l2tYtRmz4Cu4Pnr0XfPnbVu70vpq
X-Gm-Gg: ASbGncuDCNktCa7XzzRvW92p8cEjzODufga1eYvatLx/yx52i/QDMsJhWQG6ahg++by
	+gO5AnEPSnzbJNt6hD6iC8/uzftRiC50F9kJzZX4+8kJxsWQJAqwvas0UwVyfnPIxFcU1YxMSq6
	NlhqdStoFWixZ+bzpIbqZH89Zc0nBwIEV0KvHCPFtcMaxCF/Yg9ao+G5H/y+qHarHzDs7pJ5Gvs
	48GCwOgWZLPzF4GIlqNJAJ+ws6ryk/hVVPAfJOuQK2RvP8jEQ2wWKalTJTCo+f1X0AkRygp9Q50
	oDGqhugSi2n5ULQZK9vSpTf0U4vPoCpGOVyipCI/sBCI23nNR7SITYFaJYFe7lw+R7oF2JGeYhv
	V4/k=
X-Received: by 2002:a05:622a:1491:b0:48a:80e5:72be with SMTP id d75a77b69052e-4a9e9db4837mr1964011cf.2.1752084214588;
        Wed, 09 Jul 2025 11:03:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT4JbzQDFlByDuD7hy/m9S00Zb2j1K9B+NMiIKO0svgqjP5RylRzZ8vUZfB5MYmmWt5DXtBg==
X-Received: by 2002:a05:622a:1491:b0:48a:80e5:72be with SMTP id d75a77b69052e-4a9e9db4837mr1963781cf.2.1752084214116;
        Wed, 09 Jul 2025 11:03:34 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb8c80c4sm8994918a12.75.2025.07.09.11.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 11:03:33 -0700 (PDT)
Message-ID: <68dfc6b7-1083-44dc-bdaf-4fc09e944671@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 20:03:30 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] pinctrl: qcom: mark the `gpio` and `egpio` pins
 function as non-strict functions
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-11-b6135149c0d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-11-b6135149c0d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE2MyBTYWx0ZWRfX1WyAfOk+wRp+
 mW4yJTPi2C0O1MEkZO9yUEQ8/chSdm4K1hpZrIrlRCGZnEhlX7WiYe1aA8z8twFct83f8o5TaX+
 8KXMzbVPENuwKdOdFOrB7deCx1Om40DW8DT2TDErjmrOeozm2yU2M3/9QwyC3ejaFDCg9cqR7dc
 WgfgEHruaB/bYkJsKDprtCThTpEixWze6U+m8vRdb88t9uZzlstDrrJqqdcDcv+Z/awS0oBK7M3
 WSva2JOFeezqPA/G5R+ujj20f7IA97SKTo4YGUca0W+nVTdYGWy06wfMThoEKYyKrgC4lLzYynM
 YWMLFwnm5j0ZoKWxtrNNluTicL4qhd2UbEQMGYFNB4Kn1cMP02iBWDRNlme04JrSr/l9i96ZuWx
 A/cag+Q+bqGseknWKFGuWCBy5mza/UOoBHq3FEc7LkVz6ISSiDthHt7W8d5CwvTPxjGfTHx4
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686eaef7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XSwnDwznb6xmaXktW1IA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Rm23OGhYmySHRDhOLPF-dZ1hdGb73kyy
X-Proofpoint-ORIG-GUID: Rm23OGhYmySHRDhOLPF-dZ1hdGb73kyy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=853 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090163

On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Allow pins muxed to the "gpio" or "egpio" function to be requested as
> GPIOs even if pinmux_ops say the controller should be strict.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

heads up for +Luca, I'm not sure how your Milos addition will
stack up chronologically

Konrad

