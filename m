Return-Path: <linux-gpio+bounces-23689-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 726F5B0F171
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 13:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 812623A2846
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 11:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5C42E0924;
	Wed, 23 Jul 2025 11:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bEGV6vIJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3434624EF7F
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 11:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753270831; cv=none; b=h7FIjkd+P1Vq+Ek2IGrISrPSWFov/kOFx0kLvOqiAJzk5piyFs/9IIC96RY9bSqK+ZgedSUNGyPEaSzvxk4oddUaFJgbdxPgwrFnhoFdj7YDrbmpvleXmALNhOPGcPRuCmSZpCnzFuhrrnlYfs6VCd01pvqhO56RI2I9Pcb27v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753270831; c=relaxed/simple;
	bh=zxEqXYU184o0NEWEyl3/b8vley0hDm5uiksijtgyxZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b6wYFnSiCxldkCar2E/j51rUWjwOTuvcnRQ2Jzy/yesNRlA95Bbx3Jws6MW9ks94DQ1yM9TGMSdzv0HQsUiWxPo2dVf7uKwdbETlrFDjwSU7JUprFTUGlxak+Hoet2Y+1pqg37ic2ZFYombdLsd+V1spQN++rMJ5k5SbzWjQHVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bEGV6vIJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9aCC8019723
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 11:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LtBv+dCZU3MXTFg6yWzYJnNxDj6mZzTLopQbFf0I66k=; b=bEGV6vIJZ/WxzI75
	kX3+NLMErVDAVinAiLPX3VhuvMAgH8i2WNBphYP3K3EJjq2sthu6AJ+QSTxH5zUB
	c4uw4z76EpSzHTJonIfAG27cY/Djl3MnuJkehk3WLyeOWt1bKIV3oQS4bSKMVg1f
	MpIWfDsE8YgKmv81JEf365deK3vXP/N2iPhkIC/hQKeG4sg5YOBw7GX3qI1hWmdg
	x3eVs127j7Q+Vy4Z4r/nx9cGMlvV7OqM7M+erpwrHa/DNMI65ttQCWDVf85m7ktD
	ypAs9lfuldSUiQhBjRBv1bj+u6a6RiO8Itkdd9Dgl5BlGWIDGF9EXi5tNFNmzhUr
	2dudBA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hu0qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 11:40:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab77393308so21670551cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 04:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753270828; x=1753875628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LtBv+dCZU3MXTFg6yWzYJnNxDj6mZzTLopQbFf0I66k=;
        b=ZnYFsOeNxZkKaeFG+YApvLOViw8k7coCqgDEePQF4Vb4MemwBWbOPGlYVoA479/ALZ
         YVeri+Q2GCW2Xi3ibjT64Voy9c1ATwduPSJpM4oc7IKWUMPa45Rfz6Gle1NCsJFL3/L/
         g7K5zcLAhhbsKQZPhGeB79Uc4Isd1VADmcntViYM4dNTh8Pu/kSaItd8QLNe0G5Bb7z7
         mGnla1x6rW90vXMQU5BZkI6ZHLhOd6WrCXSZhbtcNZrSroPtyS8sY73g6t5iy5Ri+J4m
         G61q52BU+skMRHpdikhnI3pmXy/czEK7hLjVYlqdlbNVRYzuw2nGzDiqcHhoodbtpE4K
         z1ww==
X-Forwarded-Encrypted: i=1; AJvYcCXTzIoCivLIUJCzXaXhpsZ/Z7C/YwUEK3jkaH3QYmWOtNlRyah3o2aibMWy4FGTmaeIRZZ3fB7oPqlQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Uk/L5cwJK4vYENEhiOezFWPe/n2Vkye27waQAWy1iDdavbsO
	p6czdsV2V+3sUxyQyLS5pAOhYYlNAcBNJFC9b5XWqVZbz4/TfEdKsr9y7VoVzLZkA3VrB/wZW6U
	JddK2pe5LKsOiNfdrBMHEXA04jtP3ZrR+DGi8J3OFjkWDsqI7YH/IROJGZXMYWrWc
X-Gm-Gg: ASbGncvemeuDhHObfv2PNCLWjYmGRPKLhqujAPRAMFcjnZiaBT37iwW9/zC3D7S/0El
	x8xM4CFoAk3gkumi1z33JzCbkmyHuPVmi1HwuFXs0wms5wNbCoI4R9ZvrLvM94F3GtzjPSDfJvu
	SRbCMvb5DgyL7zC+I7pNfbV/zlcLG2sbMzgMfZW+Bs6Gc9OPQRLtp1znM1DUhhOljAsKRM7/yG1
	wfkEd5byXNfRrcPrfOVhT68KxbPUJ3kH1S1KdFaO4CoxKH81Upz8Yzp3mRCj020UdMYda2ED3Gp
	KSaCRs/vhwEmUq0i7R8LQu9TMrXYeFT9+ODrYEzlyCksDHqeCykYAJxIHzYCR/F/vtj1AHlFa6C
	+s/34OP0HiCSpwSN6xg==
X-Received: by 2002:a05:622a:1b21:b0:472:2122:5a37 with SMTP id d75a77b69052e-4ae6de5bfb6mr14172221cf.4.1753270828286;
        Wed, 23 Jul 2025 04:40:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp928hZJ9EbJ+TeXWHb9YaHxKY/0cu/xA0W1wmCQOKT9wQ1BXC6xBmFULU4vRxTLsQq3PrOQ==
X-Received: by 2002:a05:622a:1b21:b0:472:2122:5a37 with SMTP id d75a77b69052e-4ae6de5bfb6mr14172051cf.4.1753270827690;
        Wed, 23 Jul 2025 04:40:27 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f36ff1sm8509328a12.26.2025.07.23.04.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 04:40:27 -0700 (PDT)
Message-ID: <70277682-94e7-4905-823d-25ae76f72ee2@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 13:40:25 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl
 bindings
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250723103644.4058213-1-pankaj.patil@oss.qualcomm.com>
 <20250723103644.4058213-2-pankaj.patil@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250723103644.4058213-2-pankaj.patil@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=6880ca2d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=0A8kWLnl_qBNfi7CqYEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5OSBTYWx0ZWRfXzu6Jw+GManYh
 +Yp9/Kqd4u+2OFcPyFTzflb3gj/tiS+MQSqAM/NC2YA4XDZlRnvJHHO4l3VJ6Y5buRKTNrBears
 XnibyWonD+1MOavLLAHmsLkiWDs6mBIL7burQyt9zhId+u/IuF9Je40mX/Q8juNVx32/2ODnPP7
 a4nPNsixR1SbHERe6gKv0QCPRLVcwX0B/J84K78EP9tXVo2dbOb4O9cjrvJXGz1AOrtPrMMW4cf
 yGUzBCna6JIWCuL9K8kLxf5xK9krnlOY3k+23xyUFwh1NlYmLaBtO/Ulzr83lSvywE5FTJ9um6N
 w24+4RFvQBiurrx/Rpcwdodoia2YOAAlnC7/cEzKK3dY637A3ksBjKQ8GbE2PSfBedaDbZi3W2d
 DgSyNt3rrUmISREfY2GElYLuwsofu97hDZYBIW+Xnix6vW67LJwg2nBiQWnMTAUqN9RcXkDM
X-Proofpoint-GUID: NsK17dlLGvncEt3jrgDeT4mnte6oM3KI
X-Proofpoint-ORIG-GUID: NsK17dlLGvncEt3jrgDeT4mnte6oM3KI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=923 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230099

On 7/23/25 12:36 PM, Pankaj Patil wrote:
> Add DeviceTree binding for Glymur SoC TLMM block
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---

[...]

> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +        enum: [ gpio, RESOUT_GPIO_N, aoss_cti, asc_cci, atest_char, atest_usb,

Any reason for           /\ to be uppercase?

Konrad


