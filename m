Return-Path: <linux-gpio+bounces-25878-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18210B51159
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 10:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAB4E1658C1
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 08:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A066A2D23B6;
	Wed, 10 Sep 2025 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcUQ7a3A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60AB2DD5F6
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 08:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757493194; cv=none; b=pV7ye0LRJgPxlMU68vEpC0mVsIryPeZY3o7yPdwUiEk+7FYsF6sLINQIZmTUMSxouk6gokVlC0+tXlvlOs2Q26jVeilvqEJgMNUnrGSsDcqVqYM5cIWmxaB6j525stb8OI35zAQOx/CMEzSvMNMvlJFLmeUlV5vsMrf6zDlDVGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757493194; c=relaxed/simple;
	bh=DlbYRyEexjj8zwCKt3P7KTXIhWfFrI732ELpZqO1BK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MGdmFDCjpCscWM8m6WnmQ41jcFX6TowFHNSjurpFyv5iHWpEaOZAPDOECNiQ9GjoHVlMg6jXymSeyOXLp672pAziy3gaLtobJDHbBLHPXh2ah02RstImEBdawcO7w+ot194oi1bZn7pNDkrtrMn8CJvNGgLq3p8QRfXkLFT/WCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcUQ7a3A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58A7co45018135
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 08:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DxMGn1L6bdanOBGg3S871xsvM7GU6DH0il/8SlYbifI=; b=WcUQ7a3AjLuXIVmF
	nWTcbBOsbzu8QxUIZgY7ZRDVQZqUjQyXrwwdm99BXQCx2nxjagdIMoSy0mAw46sU
	fzZoWx+lPCXprO39Aa7DY2zwvtHz16aVvq0lOzKpWHeMfQDJ1EZ+1tZCt2IykxPV
	64D+bbuea25tz2wKyTMAEm1kWSbDP7WT6vrzwoFWH6/XfqTLFvXGIkL+Uh1+weMh
	8ughICVKVY+Ff5BMBYOAGhhVQmziNeGsHuisltrDj/85lz852yq9e8yqFvclOoIr
	zevksYVUHy3T1vbDXxDfmvMaXNpBYcqIIR5e4DKnTEooA0U9Q/J0MelCOGzb5elf
	2f6n1w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9jb9b6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 08:33:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5f15a5f3dso9509001cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 01:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757493190; x=1758097990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DxMGn1L6bdanOBGg3S871xsvM7GU6DH0il/8SlYbifI=;
        b=J0KLFOfTrr3E4KjWJtIGy+m4y5B7nTtxSHmPpAQxAH/FDKDLCRUky9Z3kZJTuB6U3n
         GkG5M/h9qDXhU0MgKIsn2NSuRyihRbY1gP3ZKFc6QgMT/OfN8I/tWbfx4M3Pid+Y8Aqv
         qq2wFEZ9d+PN+lpBJNKQTo2IU57aQMhPou2XjGGck5CkALUol5E7+6GyYegOhzHVhUd0
         mgeDwbwvWdSYKwNhWVUlTv/CiMEPgwYmWoe5tISaBIH5Jc7j2zuZAp1Jbn0N6IuNx1u+
         ISjJTyAkfpumBpz7X+DfAGW8NQCqTibkAFm7abcixb9mhcg2QyU/sMpWZVygsoeK35sC
         2w7w==
X-Forwarded-Encrypted: i=1; AJvYcCVBDpfkTZqYD4E2ML+sMKKWyhGvMA7D5ZDdiS2E0GA8gdXWCCI9IpW+jWnsj95aLXIpkKQ8xwadTWmo@vger.kernel.org
X-Gm-Message-State: AOJu0YzDXKHDmvzSOgfTxrSaeQfrM3to2wx2Idquk8ALesIY9dKi+Che
	ZZZCSSGBaFOO3b0wnG1TRiTEAClnHiD7LDBI1PFRhmxGoXN6vTiqtws2m9JBYcltn504jFRj9+y
	hEQdUFRPjCjUn02AbkjbyahjqS3Yfw0o8EaaO3Sc1M4zc3lfeMvWpZzIxGIHgyvCxd0k5O/wO
X-Gm-Gg: ASbGnctG2nwqEbSzNBj2hOUs03z+7OKsRzLA/FyDrLJ0GGQmLufSo76OlD1piDPHYzu
	Ag52mbOx3w9GUYjCrmfU5L7//mpbZ/wUhWlLuYImu2C74+HSOkEm1ClqkPV3wwhBXhU2f80+his
	2lXd7aUVWd0yOxxt2uAmXSPX/llL8avBxZ202h56OnvDR/QFECCCGKJSf7WOZgkIYCgYrl5IFE8
	mdlNEV1szZJPGj0mxc56Z2HfDCYO1kZd6PvVp6nqKy04d4rBDSsF6T4S3v2fQHBgSGvdaa7u5hY
	wC51uz8MHFNaGKysPJCKzIiFtnbZvAakyNBGbbFJAO5yY34xt3ScDGk0/j6TqWGYdnP5OefJSXx
	4iZLfy9yMYr8CDL0jjVWYqA==
X-Received: by 2002:ac8:5f14:0:b0:4b4:9175:fd48 with SMTP id d75a77b69052e-4b5f830417amr105966471cf.0.1757493190245;
        Wed, 10 Sep 2025 01:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELYkAW9euO7xNhHIImT1VuFKchy/KUizYQutBzWVi31b4Qahaje2/jd+ln7b6AU9wCDck/8Q==
X-Received: by 2002:ac8:5f14:0:b0:4b4:9175:fd48 with SMTP id d75a77b69052e-4b5f830417amr105966301cf.0.1757493189549;
        Wed, 10 Sep 2025 01:33:09 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b078334e86fsm127048166b.56.2025.09.10.01.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 01:33:09 -0700 (PDT)
Message-ID: <f20b174b-bfe3-448b-8da5-963693de8f2c@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 10:33:07 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: qcom: sm8250: Add egpio support
To: Sean Parker <sean.parker@viasat.com>, andersson@kernel.org,
        linus.walleij@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250904170613.68855-1-sean.parker@viasat.com>
 <20250909205248.16169-1-sean.parker@viasat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250909205248.16169-1-sean.parker@viasat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfXyPGKitGXu77h
 XuHdGGd4eCpLRo+wi/P1Ylxt0NyV5TPW1GxA+u9QHNt71Oeox2sxGXSbUiJcQeTkvJgO+XlKORz
 u5Hor39KP/AzmAkDJndkXlxxt+ypEgDcn4iqblpwtvK+G/NCBb+Y3KaWgRKGrDwPoFERFdFAg1U
 TOLBL1/ReS7gyyCGkMNCMKAl5LDrn6Q/StUdVD+KBm+WeNRocXvRxaQ+DfSJGNwprhzBKuQYX0K
 yhWGkcGWPzxeWMONbqudKNg7qzXx0XLWuFCianXc4UGLXouXPt91uQv9gbLKEPMX8C1xw8AXgMQ
 i5WonjT7D8aR/ezUdbCrEF+e+gaXqoWQfVzKdcXMnj2RgoU/CPJ6SYjVxLnqXGCtHbc5qy+AzBF
 jbKgERIk
X-Proofpoint-ORIG-GUID: j9PSezT0xJ2HEYWyugthnsR0-YShatj2
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68c137c7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=B2zXoFvHAAAA:8
 a=EUspDBNiAAAA:8 a=yEquWHxyAAAA:8 a=HbEANjnKo7ABX2ZL8B8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=VYVPV9JAioCtC5HZRjjr:22 a=_j3XSMEICZ-j_p4bQif0:22
X-Proofpoint-GUID: j9PSezT0xJ2HEYWyugthnsR0-YShatj2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

On 9/9/25 10:52 PM, Sean Parker wrote:
> This mirrors the egpio support added to sc7280/sm8450/etc. This change
> is necessary for GPIOs 146 - 179 (34 GPIOs) to be used as normal GPIOs.
> 
> Signed-off-by: Sean Parker <sean.parker@viasat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

For further/larger contributions, please include a short changelog
under the "---" line (which won't get into the git log), describing
what changed and apply any xxx-by: Foo Bar <a@b.com> tags you receive.

The b4 tool makes it much easier:

https://b4.docs.kernel.org/en/latest/

Konrad

