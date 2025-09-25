Return-Path: <linux-gpio+bounces-26577-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2D2B9F504
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 14:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 134EB384D2E
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 12:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188CA1BE871;
	Thu, 25 Sep 2025 12:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTiAQQir"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2FD1A5B9E
	for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 12:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758804246; cv=none; b=s1KNw5P5TMS6Z+xQycXXZoJqUw7e47+8cKESigxUcsm982Kb/lfEFh3DYOlKXAZn1rRUX9PbqD2GJgrOxNxyjqXQbPlUFnwlWDl43fnt4iVIf/z+0bwbWFzvhiZGqE79PJKxVv0At7J7VH/QCkLeJ1sCqvcdrHdTPq2G51Q7Bpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758804246; c=relaxed/simple;
	bh=FDZQOCz16djFlBDx5G+q/SJZvR1Nd4tnacSZ3RZpF6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZreGTr0SnVP4nFbkhxQljr1WfTUsU6jOJgKoJv/hYdc9mtFVu1IMlL/MDisxmiiEIV/w8ffZyaaHQhJSpd6kL4Qi4V75qZAAQaA+0UJiUSCYvRupw0o/a2pNfU99gNU50vCParR82BUrdN0Gze8h9EOHX/cY8VAIIMq+pBDv7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTiAQQir; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PAX0pJ002255
	for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 12:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J1dwgELFlCnM0xIxl3rJVZougZALziWUncte4Klhh90=; b=ZTiAQQirl4hUHOrO
	ABNQSD+zst6QwW3Mx5Htc8nHBSCq2PE+UFQiVFgJQ6MvE19n1shtl3QsK6CwWlDz
	DGY0dNYq1GxRKV1Soz4p53iJGsRt0kmJmdeWvIGWmwmrCJuDjzEirwDpgjQNwsf7
	RZFLR8OUodHYoRJO5sIyHeoIjS6ZNUPhehjQaI6gCdBPldzsxu2BuUGlWyTqClOD
	zDjJgOWupElvQwst68F4g87Vk/Ycksl6CeEx4d6HuqAINQ4aVZeL9dw5NdbfqnQ+
	sJshWOPmtEi4YWGFfgCVWXz3fYNGqaV4V3X9iTQLhY6fLOWAQ6rCNYHMnauoMfEf
	hrTSxQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98r2qp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 12:44:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-85696c12803so38435685a.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 05:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758804243; x=1759409043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1dwgELFlCnM0xIxl3rJVZougZALziWUncte4Klhh90=;
        b=s7cveouA9+hbBdlXG22fkybW7O9LuzEwTSHXZw+G9hxToaT+o3NSIVRwh1lKkxzP12
         19gf4zVvZBBqZNLDFrCA2CUhO6gWjfJ5wDyTx08u4y2085n7cFWAwsewG1kd43ULZgpx
         m908HJNqSDVWd7o7zhGO82FKcWgktZxg76JxeHmrZORhMBXL1ytP1m68ZCMyrv1kouG3
         NJAEdeeb4ihANdBSgCwYl1doUi7XU2BJapECRBugXBK7YUaPc7FDTa4ZlJt5vcs0r36a
         grQUH60Q2+d1d3q7d0mZ8p7AAjMlCL4HNgblqmWmZlHuZr5VV716YzcduORu0uINbH33
         pn/A==
X-Forwarded-Encrypted: i=1; AJvYcCWSpe5p/BuzHumUDuYC4NxfXoySA/GX/wsa8rNGHAnC4qxGxDE6utqw3VVRn85J809Dy0MbXwXdqSEh@vger.kernel.org
X-Gm-Message-State: AOJu0YxkanlrDajGDo8SFaWv0z4CJHJ4WkkNzhAbj2v6U0u7yeg6U7q7
	xo1KKs5+bgsJFmxVUlgrcz7tdtgzWv2B6pDhMfvuynFBQMexXMhu1Vu0c4gxJnMYzKmewkeq8zi
	XSxS/3rGF8T/B0cdsCr78sis5ygGz/mfZMbf+H05MMkTBW6mmoa7yuHr7ibfRSHkz
X-Gm-Gg: ASbGncs88lelPkKUe4CvfwTHjcIdps2Gqbnesz18jqK50uulzHbv1K8V3RWMpE1TqJD
	ie1UFMQisTdYZn8gNzPvaTtXAkVBZSEDsVe1UDiRwmNW7m3ilAA61+enjp03Wd4baRGziq062Ix
	qwk8Yr64Ie4tXlI39/ys7yFyMITr8h/GYWXc2iTIDwnJGfynGG8eZmFDqp5WgY+HA0WQU3j2g3i
	1IKqJkFt693vnNhvvoEEgUBBv2hTkEjP9BBL490LMVdiQev3jz5M+7fCRFvXEBgMwTqTeA5WLf4
	CKN0lDKmZz83+4mvXZ5ECljr526pTXR4deNDA6svEy+a525pqdVb5A6Z1E6rXAd9+VPxK9xVqGB
	1UsEyWq2ewlyKwGjOVfiYCQ==
X-Received: by 2002:a05:620a:4888:b0:85a:dcb:a0fc with SMTP id af79cd13be357-85aea416316mr275179185a.13.1758804243433;
        Thu, 25 Sep 2025 05:44:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTirFLDo0M0Czkw5tWy8aR4EZDdLw5DUbB9F6HAhp2U1yQ+4dTFZ34JK/WVzP/W4uKPnDE5g==
X-Received: by 2002:a05:620a:4888:b0:85a:dcb:a0fc with SMTP id af79cd13be357-85aea416316mr275176485a.13.1758804242839;
        Thu, 25 Sep 2025 05:44:02 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a9978bsm163475566b.95.2025.09.25.05.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 05:44:02 -0700 (PDT)
Message-ID: <eea3ad4e-d656-4ee4-b4fd-2414ea78669f@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 14:43:59 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: add the tlmm driver for Kaanapali
 platforms
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-tlmm-v1-0-acabb59ae48c@oss.qualcomm.com>
 <20250924-knp-tlmm-v1-2-acabb59ae48c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-tlmm-v1-2-acabb59ae48c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bO-6eb9bpqnHHZnb-zuaVWM9ktoagB3R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX923d6Zh/fY0R
 VeqvgTkkqU5y5VGy1VpVqkbr5AvWKMnJEWyRBIaBOsNv/XIQdJhlZUSI8d3/12qXBsJTpdCDB/I
 MJChjcWLBrVFI7VF9dph4q5pCBsQv7+V6FJ0Isdvyr1tg+V6iwzejyrgKFKnzc788sj3xPgxPIu
 Mpg7fRlOloV1FZ7vZnIxXMezF1behVOMGSSLGnstKmt8HvuUAMTPIBcslZZOfl6ryA2LEK0hb97
 k4tw1JMH+UwGLzDdcgFZ88q8r4jHIsYVMtyr8lk3TtjeG+3AsARVaJqktKMuwWgEeXLlYgpWmFx
 maSJjYcPuwXmzL59FmtyCrSDVoboHFLL0gzuXNOOXGR6pxXCAr2gfsjIr9PwoITKi20PnxRt8vq
 C5ZMpvtq
X-Proofpoint-ORIG-GUID: bO-6eb9bpqnHHZnb-zuaVWM9ktoagB3R
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d53914 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3KcoXW5xE102B6w2v2sA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On 9/25/25 1:16 AM, Jingyi Wang wrote:
> Add support for Kaanapali TLMM configuration and control via the pinctrl
> framework.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

