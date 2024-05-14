Return-Path: <linux-gpio+bounces-6371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA2B8C5796
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 16:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA6431F21DA0
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 14:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D3914533C;
	Tue, 14 May 2024 14:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fnpraNzr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46CD1448FF;
	Tue, 14 May 2024 14:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715695511; cv=none; b=DXVHJ+Vjg8wmIaGjaFmxh3glqLIMnSRGFNs1ogx4OxXcnM/uxysJ/3nyMVk7vtiNb3o2/k/QImnz/Dvo5sI20YUUGJ+shQtEkKcebedgWDMYm99XYXPd5enBAU2mNIKT0vgOQl1pl/ZOAf+26F2nEBqu2R6SjacpWI9gEhLBlxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715695511; c=relaxed/simple;
	bh=pVor6w+gfuEq7q5W83Q0sFl6sZ7JG1Fvdsh5vj80d5Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VCIWJkkvOMhT0EBi/Ixc5a+Prk3j9RMLvH4yWvrIBHilk9IEz0ZCudEG8VHt7oFYWhIo3O4n+zNmWrVvQgDAy8Llk1IfevvngCXIe7sOMBuJvZ0PMJQqRjDyDSU4E+D8VPU6T0Yu6y5muUrRHJSJx661003ogQpW/QmTEOlCCKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fnpraNzr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44E8XmbZ003244;
	Tue, 14 May 2024 14:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=6yAcoOMDxonW31p5ndUhwbJgh4bOiimX+ZhHTZ+gqI0=; b=fn
	praNzrrVgLivM/MaT7SR6l0AEwEhIH7+c8XC+g/LYsLB7z+SR5+y0CbBB+SpVU/o
	7tvu6dr+LuR/nisMea24vaQb3fylXN9Fy+3n5m1/vU9tydNxHQAuN/ySaPacZyBX
	8i2uD0BgFwkGX4QyTxeKPoRg9W5wU7yoa7ZPNy0aQN4vjPjZTbCVmHTuOrPiJZib
	djHGvtLNCNaMOhL7Aj4P31HFqtSnAwGnVfVPSJsXKJW02eCUMrF1vEvKEAacnur4
	OOHmFQMUVZVX//x6bqI5ksKmXgEnScOnsPzBrbJwf++yycg6+QMEIayObkIClx54
	M2E4TxbBww0CN+kOZf/g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y3j28k2sw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 14:05:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44EE51Bp000560
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 14:05:01 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 14 May 2024 07:04:56 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: <johan@kernel.org>
CC: <andersson@kernel.org>, <andy.shevchenko@gmail.com>, <broonie@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <johan+linaro@kernel.org>, <konrad.dybcio@linaro.org>,
        <krzk+dt@kernel.org>, <lee@kernel.org>, <lgirdwood@gmail.com>,
        <linus.walleij@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_skakitap@quicinc.com>, <robh@kernel.org>, <swboyd@chromium.org>
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
Date: Tue, 14 May 2024 19:34:46 +0530
Message-ID: <20240514140446.706847-1-quic_skakitap@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 5SEzk7F8cX03PJQoadk1GbX0kVuNZltc
X-Proofpoint-GUID: 5SEzk7F8cX03PJQoadk1GbX0kVuNZltc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_07,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=827
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140098

> On Thu, May 09, 2024 at 03:07:02PM +0300, Andy Shevchenko wrote:=0D
> > Wed, May 08, 2024 at 10:37:50PM +0000, Stephen Boyd kirjoitti:=0D
> > > Quoting Johan Hovold (2024-05-06 08:08:29)=0D
> > =0D
> > ...=0D
> > =0D
> > > > +               BUILD_BUG_ON((ARRAY_SIZE(pldo_ranges) !=3D 1) ||=0D
> > > =0D
> > > This should be an && not || right?=0D
> > =0D
> > > > +                               (ARRAY_SIZE(nldo_ranges) !=3D 1));=
=0D
> > =0D
> > In any case BUILD_BUG_ON() is not encouraged for such cases, it would b=
e much=0D
> > better to have a static_assert() near to one of those arrays.=0D
> =0D
> I think the reason it is placed here is that the above line reads:=0D
> =0D
> 	rdesc->n_linear_ranges =3D 1;=0D
> =0D
> and that would need to change if anyone expands the arrays.=0D
=0D
Correct. static_assert() cannot be used in the middle of code here, it can =
only be used at the declarations part which doesn't serve the purpose.=0D
So, BUILD_BUG_ON is the only way to go here.=

