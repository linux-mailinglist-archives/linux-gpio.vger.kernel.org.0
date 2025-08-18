Return-Path: <linux-gpio+bounces-24474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4289B29892
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 06:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C915717FF82
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 04:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063F126A1AF;
	Mon, 18 Aug 2025 04:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OxBisv9R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775E126A091
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 04:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755492107; cv=none; b=FvTMU/P8PeBwlTOQthf9OTATx5wQ2iWY76iu4Wk9+EwEWO521Vi2FIJkrgsxU91qTrW107tAc4ogW4Mkxl/jF+hQ6HNnhOMt9rg4YFN8M1wK8Pmo0VoLAWSz5zvoLFdzopAdivD08x18e7smALYZgzy6QyNT2Q1yYUOzkJG83MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755492107; c=relaxed/simple;
	bh=VyAXqrL1J25SHXJIh8uQFCfLNfdmKv32ZEsR9r7oEic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AgG1ukgqQIGb5KWmWj43FOWMdBGJ2zAS16WEuBsc7lHBKgKa7PeR7PEA82SJozBegEOWqBqA3r6fYuJMzAQWBeewvuW9sX/zb8jQhC2ZyD5jELe2TXFXA/dmrYs1BVlnlTYTe7a3bIrrlHN0l5C9cXY07mphPHHYvAhswzEUSFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OxBisv9R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HLnfvt031569
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 04:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Peq5jroX6bfA9ULfbqaeNxDwibXDATliD+d8eaom374=; b=OxBisv9RbLUOBWNt
	YMNAoAEvPQnt9qe5uJvuk9CY1kh2WdS+nAT1Ah9quVeuTyUZtn+BRVeCcyqiUEFQ
	DB743MR/HGOEnQ8nDsKUREOGYVJD/JRjNAmdNEXk5nOx2/HScARBVz/85Vy59Qxv
	baumhmnWe5+poL3u/t1e12Z6IBKUgEi9yUnU6tz2mHAH1iLUJWBKzjnY7ZUHaSRv
	p9GwfyszF7h7KkPf8behsqawawKftHvXSCC6jFZUSwGSOaY2rWaBPglMOdav16o+
	7LBSaePSBdHDz4Z4cJwaSNN6cPlkim0pm6ZtfMqg8X+lwMUN+yCrN5WVuHZlY0Oo
	aX7nDA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5mb5qd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 04:41:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2445812598bso101411125ad.2
        for <linux-gpio@vger.kernel.org>; Sun, 17 Aug 2025 21:41:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755492105; x=1756096905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Peq5jroX6bfA9ULfbqaeNxDwibXDATliD+d8eaom374=;
        b=DojpjEMHjXXxBMbbBUSNLjI39IXuDb2UVY6txvEzBY93LjGYMNpVLNFNftqlBCRe7g
         Zt73EQM/yCOkWrO7ZGHHnh8+E87G5m8t7RoKmxZ8LjLwgKCcETyNDp6T0p4/Ofzwpua/
         TqVcC5n462YrBIJpYdNytc+yvaCcija+UnDKsUaWL9L4y/xDqAmJ6NOksqgme20UGg3O
         XmLOvGrE68TXVbxiiU3d2NrPAgOqxfvofVVowMerOD5w1PTubbCmcENxeasaqcolXiMv
         2tUsPGuvAZwa9ljRKFcK2bIe7cTDfzo86Y/Vr/7R0+8glC0AXdG0g8APIOcevKIxFUM4
         YT3w==
X-Gm-Message-State: AOJu0YyWETdqtCjqn9upmp3Mdf15RkArYNBFf5CZyEJOri9UP52b812Q
	KoHJJtYAviWoRm45e9XBeNm7PPptpU5ppQ80aBLTTV7sJ8bJQVJM3f99xDDRO3J5vDA47qDOEQy
	QHRKvZOxqws2CFuctAwlyICta69tdKhUHaCMAXbVHPu5IyWsm1yLaZuLsINXNutrD
X-Gm-Gg: ASbGnctcNg6DipRtsDQzuwnIidN9dSemPoWKOD08ljPbdJbr2KE59uvwg93NQqYaeK+
	dwcD6n0SeweP/4HwGRJ6ovVXUMoPGWX72ZRinigMwf2OJkYg8RhSx2hnu+jfVEjtY6x5LiEVvgu
	hP8KH7aphGHT1as6ZG3Y+9qQnuPBQUJUwH7ie/aN720sn1IZTcnmk3ZGV19lp/WU4ayrkkDmSwv
	t+adabJJ0PNwt2PYWaStAaUD6l2ZEuy1DO8EgALp/dBbpiJJQ2Yd7FMAhEo/sWqgqGteoz2D024
	o7h//aBFubMM748J+foG5920kt7I+cHKr72gab2EnOH0XX05aEI9o2OkcqII8tx9DwYjRz8pP9t
	B4xaYGyB/HniN8vyeW5xA3bnF1lS5373DZrDEw1aZa9prJiZ+R5GcVKcW
X-Received: by 2002:a17:903:2d2:b0:244:65c8:c1f2 with SMTP id d9443c01a7336-2446d713833mr125854475ad.20.1755492104749;
        Sun, 17 Aug 2025 21:41:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQJSbvnyIWPvgIJzJYpANNMRobaCFSmLvbGiHmUQDK/yFiIYbJT8OVIneejTGAw9DOE2vL8g==
X-Received: by 2002:a17:903:2d2:b0:244:65c8:c1f2 with SMTP id d9443c01a7336-2446d713833mr125854225ad.20.1755492104324;
        Sun, 17 Aug 2025 21:41:44 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53ba5fsm67547155ad.113.2025.08.17.21.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:41:44 -0700 (PDT)
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 12:41:24 +0800
Subject: [PATCH 2/2] arm64: defconfig: Modularize SX150X GPIO expander
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-modularize-sx150x-gpio-expander-v1-2-c2a027200fed@oss.qualcomm.com>
References: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
In-Reply-To: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fange Zhang <fange.zhang@oss.qualcomm.com>,
        dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        xiangxu.yin@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755492094; l=758;
 i=fange.zhang@oss.qualcomm.com; s=20250714; h=from:subject:message-id;
 bh=VyAXqrL1J25SHXJIh8uQFCfLNfdmKv32ZEsR9r7oEic=;
 b=41yPYNLtiYTsrZuLq5hgyVMh5pdRS9C7Th5iCJHTQ/sJ5Rg0qNnCJ8QTPHbnAf7pkcMUFEIfP
 q9aTTFOyrmdB3BY07mhSKXGC4Vky5MwPmZ2DY9H+2AcuK2DtgPC0yy/
X-Developer-Key: i=fange.zhang@oss.qualcomm.com; a=ed25519;
 pk=tn190A7bjF3/EyH7AYy/eNzPoS9lwXGznYamlMv6TE0=
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a2af09 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=DrVYGqsxnvAqSPjisG4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: YAmGyVPChXreFJuQMgbi2JroSB5k50Wc
X-Proofpoint-GUID: YAmGyVPChXreFJuQMgbi2JroSB5k50Wc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfX8gNuhVrbGeQf
 yifjz6GMLbHjHA5/unpoHu0HEp4Ss582tML0RTQXr3USDtuZOngtKeqN0n1Bj1LrYehVZ2pRWw6
 ePKuAVdpKNIPU8ZM7iyYI51Jdn0rwE2Nhhk5PW7lJRxnQdWz7r2tyLj0Eyt6Gvx0oAmNhlFtHVc
 4gx8owDLZ1SJCr0k5E07wIE4tVVGobC+iHyxWAOYR/JW4H2GZvboq8u1zLdJOzlTscARBz5vLSl
 fhbR1eZj5czK5gE/ezHJnHZB8itu2ccOI9+Lyb0yFfjV3Ki+runAydOYZbeNHIIHPDWuZZnZE20
 /prdjQV2NecjTfWMKu2ZRbpz+0yU7W1E7mU9ILZ7YoRq8WMfBkiqeD3Uin+b/YWXQg4+uucht/O
 Ohxo3TDu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042

Modularize the SX150X GPIO expander which is equipped on the QCS615 Ride
board to allow the ANX7625 external bridge to function correctly.

Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 667c4859ecc3cda9b0a3dae7abdd8587fc4f8dbe..dce4450fa9fa58fab0556a6e84b899a3306b4db3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -598,6 +598,7 @@ CONFIG_PINCTRL_DA9062=m
 CONFIG_PINCTRL_MAX77620=y
 CONFIG_PINCTRL_RK805=m
 CONFIG_PINCTRL_SINGLE=y
+CONFIG_PINCTRL_SX150X=m
 CONFIG_PINCTRL_OWL=y
 CONFIG_PINCTRL_S700=y
 CONFIG_PINCTRL_S900=y

-- 
2.34.1


