Return-Path: <linux-gpio+bounces-23593-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF28B0C6E3
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 16:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C993C1882D72
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 14:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9D9284B3C;
	Mon, 21 Jul 2025 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="InnDm18Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF6F219E8
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 14:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753109501; cv=none; b=EVpUKnTQ+vmvt+Xhs+jluGZqXnMvT8Kw2EQ7AcKY3glQoqy2Tkox09SP9n7NB5Ai+2bwavyqSC4/IBaOKgi2chszdyX+n1uqlYCuocdUlgabOEEuBGEyRfz8MRJkKh3PveQitlVcAiuCL3GOOQ8mMZ3/CxlGLzfkqmJ1qeZMwJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753109501; c=relaxed/simple;
	bh=2pvWMH07iqrBXEk2OWRv81HLnHYw7YmDApBoBqzjtKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZbRn34kw+CfgLhpaiQj1qo4jBNxuzGwSV7IuomVZjpzpwshq9wbnP1TQe/9+I0AbI4ud+Tdtw9J2SnDUG1UvHxRzTIZAC5B7IuqRy6+zQzGmlCXvHdLwmYzQR8JSa+W1LjhaJ33KuklTJz3eE2XJnD7J3yND2EhoN/aUDM3CDaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=InnDm18Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LAWjLJ002408
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 14:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nMgkULWhFnNfv8reCcAzyxz1uD+6zucjoyW4qz2tQPU=; b=InnDm18QKyUuvqHl
	Jdk1ho/XBnLd4JMnlT4ifi3Zo+uNU29WAVqEvZTjgY2sfqNPG1vb8Yvl30w9SkJk
	6G4k8qy6ZJTMRPW7B33vmbJqh/GMelvuRlQNNO9ItELvZGB85WXP5vO1cCGG54Ji
	dfGEmJ0t6RNIyd3TyMt7HJ8dyQSnxgE5ENng0mlvr9knV5Er+Fbla4GuuDapmTvy
	S523aTo4lJ/44NS9XZY3uXU2NzMGiQqrAs3Uv4EVFH4C2WJczyMDN2akB2MEFGMi
	n9ScBSouhPqeXb7WnLgxppDaIbsLBQn3u9ldA9GjT0uzlVgLtpaqiG0EPIkDLW2L
	+F3m/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044ddmy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 14:51:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7deca3ef277so62438085a.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 07:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753109498; x=1753714298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nMgkULWhFnNfv8reCcAzyxz1uD+6zucjoyW4qz2tQPU=;
        b=R4bRnxswaHY2EbqTgGgUOqDYYpG3U+uhw0M+u31F3AfGBNUSVgA6Xg8A4UQJACHNND
         UlhiKVGfsBg4057sUCXHL1oxEokabH8aNOYHl0PWV9q8P9FMr2jEuAMCXaFfxOSpatLn
         1xCcgEStdoNnjPV0btD2xQXuBHOqu6vV4X2+01epvSR+hw9KFxsKl0qtUc2Gi+eiXaO9
         EaZ0Ti9LJAlyDIHe9fvpxuu9k+4kj4O7ljouqlIWj/B+X/XXe0YIntBtG1ZIWheLndYQ
         lWSZl+Cv7v4uT1tjAd1ELodIpFi/lk1px4i29J1HAbQTinm7cO3AMo9Yiib0kYoBc96O
         fBRA==
X-Forwarded-Encrypted: i=1; AJvYcCU0QYGz8Vvqx5WIrPLZ7ihwgaibOS7hwLT05uwkz4dt0PdWKsWddx9BR0UaH7crkzYtU+96KF5LaeA+@vger.kernel.org
X-Gm-Message-State: AOJu0YxYlz9UllzxtZa4XPf/VHCk3NAFgZhEY+wP4WVZ6sw7bXiFBHIb
	7w1UqbWrEDVJE6PwtPMIsuqd5pzYlUC2WQvSLy4BESMGoSFLYOsE5QVi2OiCTHoLYQW7XWGIrbj
	okZWHMv5r2qD5ahTb3H/oOZcs3bmi8qCMdyN3TdiWN828w5csPDTVd4TzglO0VLz5
X-Gm-Gg: ASbGncsfWscJrki1EjyxmpXKfVMQLzUfe1K6z8/mzKPpUfltx2mfRlXlcqdJLKH13eL
	+jvIbm2t4/Y4kXlBocPOO9JowS5UJplQWHawQfW/jLKrQPfqd5NaJVgakZTHJf8bxCHPX/yYFAP
	R0GivXuif27EzZcKUEEwu46byoobtTIdSqEAyWJO7HXXfpS4occfG7mA3owVXjxEABlMITylBwB
	o8YgpOsQ3f7H9mR6HhKLcE74oUhpbky/LaA6/elIJm7prAzyCsAkQDrNkfFHrpQJozPzuY/GZAo
	gxItl0VebFdPuEY0OJTgaMXGXXlAV5IXnbOmK//SVk+p2Eq8ovFC0W24RsgdPGkqxyCXat7WGKC
	Stt62iP2nub9OHQmh++Ye
X-Received: by 2002:a05:620a:4014:b0:7e3:39d4:4286 with SMTP id af79cd13be357-7e342a8e398mr1151687485a.1.1753109497893;
        Mon, 21 Jul 2025 07:51:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSt5/RDO783Jsf0Dpjg6Xj5kzj9H3igzttfEVO974rPIh65MJIGlIMPiuiECbGupg7YZMCMg==
X-Received: by 2002:a05:620a:4014:b0:7e3:39d4:4286 with SMTP id af79cd13be357-7e342a8e398mr1151685785a.1.1753109497420;
        Mon, 21 Jul 2025 07:51:37 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca315d5sm693468166b.98.2025.07.21.07.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 07:51:36 -0700 (PDT)
Message-ID: <21c75060-eb8b-45f8-bddb-816fce787240@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 16:51:34 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add glymur pinctrl driver
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250721143037.20983-1-pankaj.patil@oss.qualcomm.com>
 <20250721143037.20983-3-pankaj.patil@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250721143037.20983-3-pankaj.patil@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687e53fb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=PtIsU_pUeB5Sheknjl0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: tpBAObvEudTbAQU3USJZOZ5mX1HJihzT
X-Proofpoint-ORIG-GUID: tpBAObvEudTbAQU3USJZOZ5mX1HJihzT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDEzMSBTYWx0ZWRfX7S31/lDzVp6W
 bSM3yJffglKjVheTWgLztCmVkpgiKopnfLobcT1MLBOo/9hdDdgsLueKXxEFrH1ldZ2XitotIPd
 6Wjhcufacq47VfoFpXleNyiop1frr0rBDJXihIPyoUNTk6eZf2BkqGKx6bHfjZijvmnS/4w99K1
 YM6BiMO0stYqAl5huMo9r1fb7XNvihdZ6Mb7mB9S4irR1rT+Lnn8px6jT/MiOnK3bDx+mrfGzc1
 WKhOVJymXoa5CcllaF3fnb7XPg2/vzGDmiwntqcEZ3lma/GZPmlJBOXk8U2xDVU9T/bk49UgZMj
 l4M+0D8cU1e1SKdDhZD0klmbBAu/UNWM4U0yvKk5UsUJ/hdaYaKh29MIxrpz8cMi4Skx7+GnIh7
 pMWk+Wn3y5qOV54LKQWLxTQ+dqmPx1a7mxb+TfnHYoOWYYGwQw4FNRm1WyyXsH1QH2zJLnhu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210131

On 7/21/25 4:30 PM, Pankaj Patil wrote:
> Add TLMM pinctrl driver to support pin configuration with pinctrl
> framework for Glymur SoC.
> ---
> Changes in v2:
> UFS_RESET macro updated
> Removed obsolete comment for msm_pingroup glymur_groups
> Update gpio count in glymur_tlmm struct via .ngpio
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---

As Krzysztof pointed out, your s-o-b is not part of the commit message
(include blurbs under the --- line, which Git will ignore)

[...]

> +static const struct of_device_id glymur_tlmm_of_match[] = {
> +	{ .compatible = "qcom,glymur-tlmm", .data = &glymur_tlmm },
> +	{},

Nit: "{ }"

(no comma, as this is the sentinel and we most definitely don't want
the list to grow beyond it)

Konrad

