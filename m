Return-Path: <linux-gpio+bounces-12188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD47E9B25B8
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 07:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AD6F280FD6
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 06:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A137A18EFD8;
	Mon, 28 Oct 2024 06:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BD0MS4gY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F04818E34F;
	Mon, 28 Oct 2024 06:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730097207; cv=none; b=ItEISrokSZpTdGYj0wm5tRdAmxiZJKHazZlalHSk+EGR8uPEFHxTggq0TbqlFF31PKeCZXJOpuH15pxObUxH79C5lHgN5Mv8bCDk5OeD470h4l2+dQpOWHWC916K6gsnlh+OVyIEOvYQ2wNQpzzG9Oeg7lYH2o+3WBPVVyFg7No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730097207; c=relaxed/simple;
	bh=NwhG7COTWtXYFL1JDnaUPdJejW/YZbqi7o9Jeu9Ngl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cF/VZOIsqqUBNEWERIphiGpYyx2Mhzuxbbzz1K/N1cJQCupj4OKRYnhYi/Moa4i2bt5yoncHeDh4+gSA8pXgQgFWoFEIuY7kTjF8wx6Xi/Z2VZQAVczECE0VCRJS3W5epLi3bMV+O7UKqVK8XWGq2AqXm5GyhRi6O4rygFN3DVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BD0MS4gY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RNe8LI019075;
	Mon, 28 Oct 2024 06:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i4OXs07TOYzSsBw6m8GOECx0EoEbnKVP5KaQ7zD8mSk=; b=BD0MS4gY22cly5ki
	6bjWRHeKeRoEI374XDq6U3fwyj5uzgyYAIPMMB9kaDn/nQQAhPlWaWRRFgjQHV4f
	WWuzSEj1XH56umybN8Z6ts/fSqkctO3JtHhfhvnblBDFvqdtv7zRFW8LjX1EIRee
	r3TYnzfyd31BIbeaJZ5KeExTZGN7053mdv0i8h0oNKNYYeYZEGrj/2x2FphDX3Kt
	VHB2TrF9Dd5d4+sYXmLyuY8RE8f2IwHGWaJ4G4mYo7zA5e08ceqw10yz38Zf5gpd
	KxFPuzOcHq5foNw0NY52Prowp6Cay5B1ZFFpd9SEpRO8daeq1foEog1hiX3ta2TO
	CCNM/Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gp4dv2xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 06:33:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S6XHX6026124
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 06:33:17 GMT
Received: from [10.151.37.100] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 23:33:12 -0700
Message-ID: <c154d164-57c8-4407-8b07-543676d21206@quicinc.com>
Date: Mon, 28 Oct 2024 12:03:09 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm: dts: qcom-ipq5018-linksys-jamaica: Include
 dts from arm64
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Karl Chan <exxxxkc@getgoogleoff.me>,
        Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linus.walleij@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
References: <20241002232804.3867-1-exxxxkc@getgoogleoff.me>
 <20241002232804.3867-6-exxxxkc@getgoogleoff.me>
 <f2eck3tudqoqyylcknfvz77wj52fornxevp6po3y7sov7swikt@asez6wepyl6h>
 <768a1c92-6e1d-4d6c-90f6-efe66f68dd0e@oss.qualcomm.com>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <768a1c92-6e1d-4d6c-90f6-efe66f68dd0e@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9XPW6bRbAV07BdK_t25d7GMW1B_hPfzx
X-Proofpoint-GUID: 9XPW6bRbAV07BdK_t25d7GMW1B_hPfzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=626 clxscore=1011 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280053



On 10/26/2024 5:08 PM, Konrad Dybcio wrote:
> Would you folks know anything about it? Do we have an open source
> U-Boot release that could be sideloaded as a secondary bootloader to
> kick it into 64-bit mode

Yes slightly older u-boot release [1] supports booting both 32/64 bit
kernels.

[1] 
https://git.codelinaro.org/clo/qsdk/oss/boot/u-boot-2016/-/tree/win.coretech.1.0?ref_type=heads

Regards,
  Sricharan

