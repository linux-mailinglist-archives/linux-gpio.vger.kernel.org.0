Return-Path: <linux-gpio+bounces-26745-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 946BCBB22B0
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 02:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4307716F567
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Oct 2025 00:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C47EEA8;
	Thu,  2 Oct 2025 00:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUCYIKS1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9EFA93D
	for <linux-gpio@vger.kernel.org>; Thu,  2 Oct 2025 00:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759366233; cv=none; b=mI2Iuz6tyYNuD4j5h02+Qgl5NY5EwqKCQtaG8O13zzmqEbVzpXd61fEA/lW+3YRQF8ufxG71HqYonXySMLviWmPEQxe0bkWRabT3LybmB/Jf/AlrdLTRxIo9Iax1tqAvnvFgHItoppjNNsKuLA61nFOg/k0Vw5ToNBf4Gpre0aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759366233; c=relaxed/simple;
	bh=pcLhHJCXTY8Rx0ZoTvbpeKJuwGj5s/9zbvQnYMx6r6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k5TH/COHHBwBjT2VFsUrSB20zPc1duvBixzsZrwpQA0USjfpxvLmw62VAAbrdvujCe+7JJHqb5CYL+Knn7kUC3sbsVQM+0gwHfMo/t85jYGrydXRXHGbxc0hJJ8LoZG6+KdOPDK7G0cIa+/I17458zZAx/e+zx9ghHvwm17dtv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUCYIKS1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IbwA2008313
	for <linux-gpio@vger.kernel.org>; Thu, 2 Oct 2025 00:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7ulc+vZjEzPbgWCzpmuRHchS
	Qw8CDsC03VwUjnWv2pA=; b=bUCYIKS1qCqINuoUlonGTpaDrnrudeOj9rri13av
	08u3b+JgNuAU5NWh+No3hB+UN/tBWMnQQwgJh4nHwhMRAE+RVK/qsuwKu9rX3He9
	pQYKsoR2BFMo4VsfFzgQWLNRvW0auWICrOfi5osNG3bDzqjTAmjcgLbtbO7DjxZu
	vSWQ9a+9+GuUAHrn8tjxNR1CojFVesqF1gBjnYuVJimbWwZD+7Ih9BsLmgWOIem0
	c4CpC4nU0CYKeNXRoGJLqe2Q0sqeUZLtgNxUKOnraLhu6bcmW4eLcMQMz3Tp84es
	WEi1iPdxGc6sCfh2uX/2wchoobsSbsTLUzufQxC41aFYxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr9pum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 02 Oct 2025 00:50:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b78fb75a97so5048431cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 17:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759366229; x=1759971029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ulc+vZjEzPbgWCzpmuRHchSQw8CDsC03VwUjnWv2pA=;
        b=EQdda9v+HPoCZntL6m//qx4qR2KAfQq1HBw294xqzqZJ71ABuy9k6CG4sof3VCywmb
         ka/06nfhRgTENx5+oEGSOBifWcLRiDIYCA5N7Wa+g2TdsT8eqDbTHrPLVVkwFLEgjGbp
         vAMNlilMF8atfFtFQ4vm8BTG7zZA76mDhukmGfkF/qqJLq2NKts/AO5g7y2gOD8DHhi8
         BEw8+ZmfOBJHUtqvTlv/8rtsOwD8GbvLcuoqws30QLpW1replDxcJdrEdawYcMhdcCHo
         OMTx8edZhNuPAz3hVfV+pQdagTo+QTn49V+LMbujAaBiMJV6XSDLc21FVagQmcHMZCZr
         H6EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMnOsf7zQ0DPzBm8gJcLJv1/0rOvjFd1F36gRBpNW6cOhWZ09szzqpO0E029rq0u+t9ZUq8z6FyyWr@vger.kernel.org
X-Gm-Message-State: AOJu0YykbNETafT/u/4LbXB6AwzNbCKnRhHfWddYylFcx6XTDSzwSJlZ
	FFX9VpfwpaDRM0d+3UEEPKu4ot4WRcUxSESwc2uOIpUykJNWYBocoU9TyUGQdLDqsIh1rOlg6Ie
	aQB+u3Fsx+uDfiMq/8wN7fwZs8IuClfPPNRNvfM+LFyUT2LnJ+W084G1dmHhe0VE7
X-Gm-Gg: ASbGncsVB9C74lOHbptPtFX0q2llSad1I6VPkO/L1n+OYG0mU78Hi2TSfQICwT5M4/K
	r50BFr5A9kxtuhgcmg2H0IBJctC81xOI87+9PyG9Xlftmq0lTaoP/06zzveIW6sLcfRNf6WXFAj
	ahSo+ffeQ1OPAnUQHPnFeCSbf0sS6mNFAbBW2BZIB+n48K+JoykRw3oI0+uiLsK/KkRu2o1Vgjb
	BXZ3lDUqpkekDcgKHLWE1G1R+ySiFs6u7w+jFp2qTqqKOU5kBai58FHTIb1wOPkkFplYaRhc2JI
	M/ERdn6TxSLMKO2YeEWMbhZDRo34dGa7T5+wvPu8fIy2yhXMqhh/UOdHD86pWTh7i4KAaCrk9fM
	OZlYyKw4BYnDGeT7/e9PAaO/kQBQQY3amDebRrnmXEvIXXewANa5Xk7c49g==
X-Received: by 2002:a05:622a:598b:b0:4d9:5ce:3746 with SMTP id d75a77b69052e-4e41de6f81cmr73081231cf.46.1759366229527;
        Wed, 01 Oct 2025 17:50:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCclp98+N6Qg6dRWsktO9GaXOQng3cW+YUBThiQY3XzDHdMc4J/Sf5gh5nJ+36guSA5Lv/2Q==
X-Received: by 2002:a05:622a:598b:b0:4d9:5ce:3746 with SMTP id d75a77b69052e-4e41de6f81cmr73080981cf.46.1759366229120;
        Wed, 01 Oct 2025 17:50:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119ed45sm320922e87.104.2025.10.01.17.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 17:50:27 -0700 (PDT)
Date: Thu, 2 Oct 2025 03:50:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] pinctrl: qcom: spmi-gpio: Add PMCX0102, PMK8850 &
 PMH01XX PMICs support
Message-ID: <gnutyscz67spmu2nmsiyptcqsp7y45emirdwlsldrgsddfwi7l@rm52ogzmnorv>
References: <20250924-glymur-pinctrl-driver-v2-0-11bef014a778@oss.qualcomm.com>
 <20250924-glymur-pinctrl-driver-v2-2-11bef014a778@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-glymur-pinctrl-driver-v2-2-11bef014a778@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfX2fVNaL1CXn5n
 sgLPwGCc0L8yn+XgY9zjjzd0hyhUqzEDjeMk6i65ymlxwZefxsC9rXJbQc3tO1K9SSOCqk6C/As
 XUU2yUCPrs3PBpwldd8io9Rl250zS3M/f79x2Pk1AQMxGpb+h/QV/M4HZP5H8araiZn3nN5XOxD
 CWhUTL2ln0NGy2sQSB5465WY+JYrMUryvMBzTgBSmTBoyaHO1VpmjNDXL92uCYb+FecpFAR844n
 Nm1/DUHKpweLKXH0XNY0gf/TUqfvDwOnda16sKE2olFd7mqwzTS+06NeV3ofnP2sd9GZSiGOVbh
 BZ3tOAenQrp2gjqE+f+iFuOk5Cgid2gDXr3erf+CteCmdNIFDRqP3Ril6xyEkkhMVdciB2uSjBn
 /H38U1oB7KJTRgO8XOc1RH2HQHNA4g==
X-Proofpoint-ORIG-GUID: KWU0myLYOZVUyuf3K1DZSTbSgIjDR39W
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68ddcc56 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=rQW_yBrpdR-Tfh0GWmIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: KWU0myLYOZVUyuf3K1DZSTbSgIjDR39W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082

On Wed, Sep 24, 2025 at 10:31:03PM +0530, Kamal Wadhwa wrote:
> From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> 
> Add support for PMCX0102, PMH0101, PMH0104, PMH0110 and PMK8850 PMIC
> GPIOs with adding appropriate compatible strings.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

