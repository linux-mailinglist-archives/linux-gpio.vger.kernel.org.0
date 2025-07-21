Return-Path: <linux-gpio+bounces-23597-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0541FB0C853
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 17:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88EAE3BA7D4
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 15:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D222E03F0;
	Mon, 21 Jul 2025 15:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GoXhyD+Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC6E2C08C2
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 15:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753113487; cv=none; b=lTJuNsyvC1XybVx9SjUFIs4JwW2yQ/UwT8hlhTdAruH3qwjlKsS5a0XTQDn32rjAtRpihcsUq9YCWhwgoHL/4l0K2B3TCXy9aduIsYMz+me4RfxK6YE7gpFcceTd1Nuxd/ODgPGzHdFhGnBGcbQeRkAGPYdyre5WM2+eA1Tq+mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753113487; c=relaxed/simple;
	bh=Aeb+cBaDP6mCJ/kvpMM3pvMOYo5DtWUCf8qOisApiNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BiCU2NUv0ktXkCr8ERMiP+ZDKmHHHWId67u65Z7W9sat6qM33KUNvUrTvcMk2SvY3yiLVnkTCgOudctltQ9sNlnvnxC2DJgW6vYWZ/S8BffFwcTgPR0pJ5xz4rBCFzmnDfOxICc8/isAfmIb069jTHcOrgzbFr1n3BEYr01u43I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GoXhyD+Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LAxqKo000926
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 15:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7eaykh2jpr4tDzQ/ml8eASCLk5tz1CCA/grPwuJlCtA=; b=GoXhyD+Qx6sZ84f5
	Lw9+R7ToqBXi7jfqR+wvz34jza0wQeaCbxhOP36MJNguhVMXL5LymKf9pLVjeR6/
	/csboVapjS5vGcrZ63JRIA0EeuTNuLM5rdUA6kw2hA1eYMEdrUunMSFtxkacgLnr
	TaEEXoguHDC7Dc+GUcFnb7NEmhfFYxaiXzdLp4a6uRXLGPat0uqdYV509Tvm0VQH
	fgRlrUs6+Lj6mrt6aBXml2tAAMEykShAi7Jw1bT3fkV94eHfxAPv0pqbIlUIw5Yz
	FLqIS9Y/Knt5/TBTOeAMEiCxIWvHtJ1rib1DWX3iSseOPWDJpUYYO4r/t/uiMeuJ
	QyPHqw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044ddywr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 15:58:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235eefe6a8fso33599425ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 08:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753113483; x=1753718283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7eaykh2jpr4tDzQ/ml8eASCLk5tz1CCA/grPwuJlCtA=;
        b=dVuk114GrPSm/WQ1uKx21QIYgRIqHIYKmBiUpU7apkElf1+pgRnh3tZgX45xXBRIM8
         jiX7dr4Oxex6c23xEOj45b1q6l88OFE1qdPdkUQG0vgfnTN9Sg87Yv8Th8obQb4V+lGC
         lOM90Zc7CYEhoj5nCwZtZySff5NmkvisVrkZN0i/UFd9I8HNpt0t5t8QheKp78WzmL5y
         +zAOplLnOwyAoKZ/Wu5AN9YCJDCpJBnbHGFmdQWJRRTR3RO2CCjyeSg1X/fsG5hAko0D
         mM47eus8YrICcLliyR7RpdMl2JRia8roVkjn6ML91qFi89d27iq+jK2yXG/XR1s6RFtp
         wPkw==
X-Forwarded-Encrypted: i=1; AJvYcCX5QcaJ4gNna2muOE7J1cJOEEWHoAoZy7p2TNPIy/yZYYLsWGR3ncgZ4j+zHuPoU082D0Xljm5X/vU1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx04Hziky1QRLboo2aPcosJ1szuvalrBsRHIemoxvYfdtGm25OX
	1GmmZcGDPlQwspwX/C5dc4JesFRaaogKYN7znbpunxlJz2qJhY8YiemIE+FvqF8MtUuBUUvLRev
	J/aD2XRQoip8JHC3xKFOpyyCCj8n6a0jVEsJ0XNkqhanzyQSs+CV5CtTDwkd6gXyT
X-Gm-Gg: ASbGncuMuoFl7RTgIWPZ7ARLUNqRaHRl+UFpFZyDJUreqCvd3coEDnLoMjF0rDM3Bj1
	mhSYRJfnB86Du4wx1byzsFseUw6K1MgeOkRYW/no0j76xsIqiy056yCXVEXeUjQNkXO1uFm0oNt
	TqYcjDfDemCyrdxruitvB94difRepivoUVfwfwHygRpIg69+YDeNOxHliQXx1NB1IqjoWOWeLoo
	LWexDAuvnDoRfXoQ1beZPNFZK9+Y7n27immUI2k+ZWmUjvpLDYupwONtLZoXo3EX0j6vJN2M07e
	uzZEOzSJOu39rUAJ7cI3iU2jqH51ao8I8femY+JpgAXed2qcD2PZFy8dy4DfZs+Rs1AQ95nHA1H
	RtwstbmlDEiZu23qMLCTeLW/71Hv/a9DEJJX8jWlQYkxPeZQIMJdd
X-Received: by 2002:a17:903:3d0d:b0:234:f4da:7eed with SMTP id d9443c01a7336-23e3b84f72emr209498145ad.44.1753113482585;
        Mon, 21 Jul 2025 08:58:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfxVD4xFyUDm77aId4Mxba2CamnraZ59KFcCKOXsR0AXPmtHwmcTsp614S8u5McuJQ6G4ayg==
X-Received: by 2002:a17:903:3d0d:b0:234:f4da:7eed with SMTP id d9443c01a7336-23e3b84f72emr209497835ad.44.1753113482146;
        Mon, 21 Jul 2025 08:58:02 -0700 (PDT)
Received: from [10.50.52.170] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6eeb9csm59786515ad.186.2025.07.21.08.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 08:58:01 -0700 (PDT)
Message-ID: <32facbb3-3cdb-42dc-9e65-3daa0b3899a8@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 21:27:57 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add glymur pinctrl driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250721143037.20983-1-pankaj.patil@oss.qualcomm.com>
 <20250721143037.20983-3-pankaj.patil@oss.qualcomm.com>
 <21c75060-eb8b-45f8-bddb-816fce787240@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <21c75060-eb8b-45f8-bddb-816fce787240@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687e638c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=TZC3DJ3nR-gMiTPXGEMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: dMwRpB-_mXGXZW4SJO1FJiRzH_8PXAov
X-Proofpoint-ORIG-GUID: dMwRpB-_mXGXZW4SJO1FJiRzH_8PXAov
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE0MSBTYWx0ZWRfXzvZYjHV8/6Vy
 PWBxz/iTfiYFA7I1GoXGrEdTBAIzIR4YowG3u9A5C5XoE17hcn+bfRXux+2ZP/ELLt7NiJOjKvV
 k7imiHVSkNGUGox0d0Jf1rWNef93JVAdetDWaxiNqOAbW2bLjDGojkOwY2k6/7FLUcYe9ybCBW8
 F2X6bVxDZvvU9M7v9THtfQd/mdcwQceg6NNpGnqswU5s7WrkrppcLSaYRlaTOsoudgn6t8pLR+P
 VCB1WQq5n/cBj743wmmfqkXWNIeHPKiCR66dzTDddVEOLXCSJ8X62dUB2QgC2P8E6kAr/ijB01z
 erLmWRVPGAntDc5NvUVGON9rVlB1tpRNdrmjbXGJRGRV4HJp6ARgbThWQlKb4+Qkswo5mLoR4pE
 vjkmXAUGqOC3kO5aN0596VRv7t5fYoDcijNf1GmhVDmcKavCPUGnyzrc/FHiXnD2nnStUgBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210141

On 7/21/2025 8:21 PM, Konrad Dybcio wrote:
> On 7/21/25 4:30 PM, Pankaj Patil wrote:
>> Add TLMM pinctrl driver to support pin configuration with pinctrl
>> framework for Glymur SoC.
>> ---
>> Changes in v2:
>> UFS_RESET macro updated
>> Removed obsolete comment for msm_pingroup glymur_groups
>> Update gpio count in glymur_tlmm struct via .ngpio
>>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
> As Krzysztof pointed out, your s-o-b is not part of the commit message
> (include blurbs under the --- line, which Git will ignore)
>
> [...]
>
>> +static const struct of_device_id glymur_tlmm_of_match[] = {
>> +	{ .compatible = "qcom,glymur-tlmm", .data = &glymur_tlmm },
>> +	{},
> Nit: "{ }"
>
> (no comma, as this is the sentinel and we most definitely don't want
> the list to grow beyond it)
>
> Konrad
Fixing the review comments in v3,
Formatting issues in my setup, will take care of s-o-b in v3.
Thanks

