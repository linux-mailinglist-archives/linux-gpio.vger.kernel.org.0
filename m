Return-Path: <linux-gpio+bounces-6370-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FFB8C574C
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 15:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A6741C21989
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 13:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDD61448D3;
	Tue, 14 May 2024 13:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GBasVKUo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0955313E030;
	Tue, 14 May 2024 13:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715694227; cv=none; b=t47t2KsW9AmRC0r9uUh/A25sgYCNMSTw1esQmUsxcBuFmwzPCmffT0MmleAxw6vTIWDWl96SLBsNkN8QjlI/eGnScdj7etCJGXUXM5vnCfIfEoRHi00djahkPNXe60g8LrNCCrDVCT5GF3o2xuWey3+yJY4ImHoekiloOCWYbaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715694227; c=relaxed/simple;
	bh=G0Bo38YZIzqeU2pSO1mST+0MOKskBDfPjlOUdtUd3Ew=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U7uKkPnTen2GtCSOy8zyW7Mu1ih1eXflMA1bTz/o229WDsqL0GxeGaDvvjIvDXHGw2uhZjCsM5uDG+Wgue7/KAe13e0hDlhJ0zUFGsN/9SJSdkxZcjZaxEfhXN0rGLGnbXzxV05sJ4KX32Di8ud1r3o7KOUFcTRE+ibWWljvR/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GBasVKUo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44E8p9wn023860;
	Tue, 14 May 2024 13:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=BhGliWrH0f1GGT+R8BeF5lpysJJHwl35yYYn/PJwrHo=; b=GB
	asVKUoVbM4nZ7eeAhVRdpYxCmIZ2C9lXyToVeGXYWy0Dq3OSIpaBAHVdAo6GUdkv
	utOwHrqb2yqgDuGL74DUSfC5DI+O18Ukwycnd3XbcdeELa2WyCoTtqvZlmkj2stl
	6CXw6gnks8pinntFewtExmDslY79WOzmTr+8H4P2Tzm95ncUW6O/tfocWp9eBxdW
	2+Z1bUCTVLO9IO9tQGEr28lkhq3yFvBubr2+wN0HAjGTlsgrOFad/fqIxXs4OURy
	JPzMbZAvFB7ckoMzpj6nTvZ/+RdnNS52imhWkFEVbhEV+J38GZUXY0pfLXAe+VCW
	X4f2zjC9+ES7LLiuTHLw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y2125ee73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 13:43:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44EDhdub016651
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 13:43:39 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 14 May 2024 06:43:33 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: <johan@kernel.org>
CC: <andersson@kernel.org>, <andy.shevchenko@gmail.com>, <broonie@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <johan+linaro@kernel.org>, <konrad.dybcio@linaro.org>,
        <krzk+dt@kernel.org>, <lee@kernel.org>, <lgirdwood@gmail.com>,
        <linus.walleij@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_c_skakit@quicinc.com>, <quic_gurus@quicinc.com>,
        <robh@kernel.org>, <swboyd@chromium.org>
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
Date: Tue, 14 May 2024 19:13:17 +0530
Message-ID: <20240514134317.691887-1-quic_skakitap@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZjpMeVk_HiixZUEu@hovoldconsulting.com>
References: <ZjpMeVk_HiixZUEu@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UmTUJpFNGnTJwVmIvoG1naXdyimjSYr1
X-Proofpoint-ORIG-GUID: UmTUJpFNGnTJwVmIvoG1naXdyimjSYr1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_07,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=696 clxscore=1011 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140096

> On Tue, May 07, 2024 at 01:48:30PM +0200, Konrad Dybcio wrote:=0D
> > On 5/6/24 17:08, Johan Hovold wrote:=0D
> > > From: Satya Priya <quic_c_skakit@quicinc.com>=0D
> > > =0D
> > > Qualcomm Technologies, Inc. PM8008 is an I2C-controlled PMIC containi=
ng=0D
> > > seven LDO regulators. Add a PM8008 regulator driver to support PMIC=0D
> > > regulator management via the regulator framework.=0D
> > > =0D
> > > Note that this driver, originally submitted by Satya Priya [1], has b=
een=0D
> > > reworked to match the new devicetree binding which no longer describe=
s=0D
> > > each regulator as a separate device.=0D
> > > =0D
> > > This avoids describing internal details like register offsets in the=
=0D
> > > devicetree and allows for extending the implementation with features=
=0D
> > > like over-current protection without having to update the binding.=0D
> > > =0D
> > > Specifically note that the regulator interrupts are shared between al=
l=0D
> > > regulators.=0D
> > > =0D
> > > Note that the secondary regmap is looked up by name and that if the=0D
> > > driver ever needs to be generalised to support regulators provided by=
=0D
> > > the primary regmap (I2C address) such information could be added to a=
=0D
> > > driver lookup table matching on the parent compatible.=0D
> > > =0D
> > > This also fixes the original implementation, which looked up regulato=
rs=0D
> > > by 'regulator-name' property rather than devicetree node name and whi=
ch=0D
> > > prevented the regulators from being named to match board schematics.=
=0D
> > > =0D
> > > [1] https://lore.kernel.org/r/1655200111-18357-8-git-send-email-quic_=
c_skakit@quicinc.com=0D
> > > =0D
> > > Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>=0D
=0D
This is my old email which is discontinued, please use <quic_skakitap@quici=
nc.com>=0D
=0D
> > > Cc: Stephen Boyd <swboyd@chromium.org>=0D
> > > [ johan: rework probe to match new binding, amend commit message and=
=0D
> > >           Kconfig entry]=0D
> > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>=0D
> > > ---=0D
> > =0D
> > I'm a bit lukewarm on calling this qcom-pm8008-regulator.. But then=0D
> > qcom-i2c-regulator or qpnp-i2c-regulator may bite due to being overly=0D
> > generic.. Would you know whether this code will also be used for e.g.=0D
> > PM8010?=0D
> =0D
> Yes, for any sufficiently similar PMICs, including SPMI ones. So=0D
> 'qpnp-regulator' would be a generic name, but only Qualcomm knows what=0D
> PMICs they have and how they are related -- the rest of us is left doing=
=0D
> tedious code forensics to try to make some sense of this.=0D
> =0D
> So just like for compatible strings, letting the first supported PMIC=0D
> name the driver makes sense as we don't know when we'll want to add a=0D
> second one for another set of devices (and we don't want to call that=0D
> one 'qpnp-regulator-2'). On the other hand, these names are now mostly=0D
> internal and can more easily be renamed later.=0D
=0D
There is a PMIC called PM8010 which also is implemented over I2C, which cou=
ld use the same pm8008 regulator driver.=0D
Hence it is better to use device_id instead of a MODULE_ALIAS().=

