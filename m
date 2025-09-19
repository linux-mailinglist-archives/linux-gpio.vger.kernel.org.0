Return-Path: <linux-gpio+bounces-26410-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E18B1B8B296
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 22:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34C5C16E066
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 20:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3501E2D063D;
	Fri, 19 Sep 2025 20:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GDwcBzy/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7821F213E6D
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 20:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758312054; cv=none; b=a3RsmWksZo9LWJkfjovC2jbcx8IC+/48bOiGNfVNqq6s1KrWrIEyIGGaY3R08T2/tPIO8XFG+rbD+5UlhKNR1Ojjle+EV72iNr4/Tx4MsgygMGR/9aA5du+/uMknztwb1Qgs1nVROy6at8Z+ApCj3122vddtfLKU2czLo4T6csQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758312054; c=relaxed/simple;
	bh=Y76S3H0ehzYEkiTShzQV2y4R/Ceh13K7kF+3QkotxxA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j5t2i5+geE7CmW4P8nJ3y/Ye+qO/Z+2dDWC0+tj9xCBwu5kBdqbhWSOW06H/XRp4UxmUVe/zTKcXEG93uLeWuCFDtf2w0g3iDOiYTCqQLQlN7jgcuIoLTSJn6Mf2VBIcmabf8WQ+MdLdGEddf6Bvsf9ph65PBQZCMZRf7EUz8x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GDwcBzy/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JJWECp003366
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 20:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lrJ12YoUugvWUqmVr6hysi
	rvr/khh90USYulSQ7t+GI=; b=GDwcBzy/8DPyn3GAN+bnfFnJq313KVtz0Vzkpz
	2FBe2MhAeFHXgJRP0nO4srw5AhN3lNg8qCM35ZH0ShtshoZyDPCXGcK1yqZCwK3D
	3Oo3jw59u6Ml0v9I/QFoR4R/in87eRkbTDeSJ5W3Y2WMSD33oIyyvZ2MHfj9Z+5a
	53AwMhDAiJVPw15tpIj9WsI/6HqY1/qUI47C6rXs0M3XZMdkAMnFKPVKiYZ027gF
	XfDFuZwJdfGTx7kwVPC6VURFI+Ov/oBGEeuEDaNZMMIbRYBgvD559W05zPC19vAu
	TEMUEgAuzDXScZqfYJsNoXeQhw3drBzF3La0Qz8rScUoaEIg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497wqh18ku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 20:00:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244581953b8so27681915ad.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 13:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758312049; x=1758916849;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrJ12YoUugvWUqmVr6hysirvr/khh90USYulSQ7t+GI=;
        b=Wto9DnPXyPdPXa9UR4OhI9aCCXM2vEpHnR5mwtzreFaegdzYUcfroa/I6FVgVotdUX
         kIV035DETyN5NnXNAnZRavKTZb8grOQJoVJLnX2CbBETWB2xN/zcezIdb6VxAjzRK0Nu
         Mo99EO2MVUPmOY6dcxD78D6KTUW+PzZMfe6AQbiZOWAFmiMF3FDqAoOybfuN2G2gol2H
         8/roHu5ZEGrhUGz5z+jVp0h/0F6XZ5kT1lJ2anBdQgMaXe4a0FQzILko4lg2pfttn7on
         OyfGrVjsBIblnMweT6v7Eg1Ydg27VAqJabKVoglhY0t2ZZfgYLgA/xkvILLuwkwZ2edA
         Fk/g==
X-Forwarded-Encrypted: i=1; AJvYcCUyT91tP7UgrYy4KfFRyh6ZXxUyr+//W7WbTWtbMdD2wl8mJF7lTP6R7KRymm3h74XSe0A9BvkbZVfH@vger.kernel.org
X-Gm-Message-State: AOJu0YwxMazqcZOPCd5++JUR+2EhnckfTfwAk3CheZs3Ud50uhH6NTwV
	LwJeX3xK3vtQAplDIoWJVoIET57UCkvWFLwnT2e8miIkTvsLXsMcA4qhhirsa2OPWo7yK91QvkY
	NEBAjhQ1NoGDK3OyxZzGW/4mGjmBf8KfDGsJ2moAma1cG7VUGC/kzcTZqPaQixU18DKzEb952
X-Gm-Gg: ASbGncv+oU82OQAIzJQwurylRrAjmz9AGCJJkrUTIfV2P1qKl1dM5Wgqnh+y0LAD5xw
	wCsuz/ez6GXZYvy3MG0sVcKNxzZQnJ4YEp2fSfCYKE+g1RnPCOe8uu/fXOcQMtTtxd7woSZudXs
	sbRIOglU7GkO4STuaPfOePhq0iaugx2Bl7spptATcUykSN1JwY1JN+ELiF5fu+S7Nx/1a+FQYHf
	+x1cGwxh2SAtSez59jzmLvrUeswF4k6nNvlMeqZK22QZKj8fyyhRbxK8d5PU2MkYwxO/i32sVY7
	7gCrUHvBMsgIThvhFMhzbM7sCoIbI30qOXJpPcGGiU+Y4U2Ibi2eUzsawTklZU/CCtto6wQKtZe
	/eqqzZy6lxulp/4MZRYAWngaHeA==
X-Received: by 2002:a17:902:d506:b0:262:f626:d516 with SMTP id d9443c01a7336-269ba46b4famr60376125ad.20.1758312048378;
        Fri, 19 Sep 2025 13:00:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdJEKRDdX/cjLVv1z/Bkn+SWxxdXbX1futxoBqIMDifIWnOaxRgKGgcPzg5IGgznJ3Sen6Iw==
X-Received: by 2002:a17:902:d506:b0:262:f626:d516 with SMTP id d9443c01a7336-269ba46b4famr60375755ad.20.1758312047941;
        Fri, 19 Sep 2025 13:00:47 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698030ee20sm63053905ad.109.2025.09.19.13.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 13:00:47 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH 0/3] drivers: spmi/pinctrl: Update SPMI & pinctrl drivers
 to support Glymur
Date: Sat, 20 Sep 2025 01:30:08 +0530
Message-Id: <20250920-glymur-spmi-v8-gpio-driver-v1-0-23df93b7818a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEi2zWgC/x3MSw6DIBAA0KuYWXcSSin9XMV0oTLQSYqSIRIN8
 e6SLt/mVcgkTBneXQWhwpmXueF66WD6DnMgZNcMWum7emmF4bfHVTCnyFieGBIv6IQLCTr9cMq
 PN2usgRYkIc/bP+8/x3ECVSTK2mwAAAA=
X-Change-ID: 20250920-glymur-spmi-v8-gpio-driver-d27d0fb36464
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758312044; l=1348;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=Y76S3H0ehzYEkiTShzQV2y4R/Ceh13K7kF+3QkotxxA=;
 b=saHwtTpFiei/wrhs/SBwfJdkRmxXPq8tLdmHZBnsIQLMStEpt2mkFtvnUUXEOf4SwtcS1FK4Y
 laQviH6uDooCoxJA7Ipk2fRYxYulmkWrUADvpX+mT8FvLPk1rlyP2oN
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-ORIG-GUID: n5F4_LC8D9NvjCEc_m6S6QjSbO-Z6OpV
X-Authority-Analysis: v=2.4 cv=HITDFptv c=1 sm=1 tr=0 ts=68cdb672 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=rjyjYzsXQ0sINxRBlfYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: n5F4_LC8D9NvjCEc_m6S6QjSbO-Z6OpV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDEyOCBTYWx0ZWRfX8hiCbohWVExo
 Nl+GSkEK73S6IWleHiSR9R818x9YxFRzdt4yruERLhmI4m3oiZRMyOagfG1K8c0ykog8LDVJi1q
 YpB9PpGJ1HCZkq+7eG7CJyw3Zai0WQXCXeNsInzeIhe59vv4B3bDCSRdoLhBPKc4AdkfigaIc2Q
 xAMH+RF0DhzQPz4eiCqJcQwiZiV/sjbm+CKdCRNwosqDE3MSq/1GDX9z+jILMX5OlXKqF8cqclZ
 +xKGcKWmqa9laoYuY6G6XvhHEbET8PNXfJZkrk0pqkNWDckwu09cbvFut3QsDRVBeccuGS38gHd
 h+LbuxDMtupM+B46NRLL5cGK9R9fI2mwhCJXlyjpqx/Q54SP/Txm7XZAzXe+lTkTdigeDyilIAV
 exUxR5WV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170128

This series contains patches to update SPMI and PINCTRL drivers 
needed for supporting the PMICs present on the boards with
Qualcomm's next gen compute SoC - Glymur.

Device tree changes aren't part of this series and will be posted
separately after the official announcement of the Glymur SoC.

NOTE: Related dt-bindings were posted some time ago can be found in 
below links.

SPMI v8 DT binding:
https://lore.kernel.org/all/20250919141440.1068770-1-pankaj.patil@oss.qualcomm.com/

PINCTRL DT binding
https://lore.kernel.org/all/20250919140952.1057737-1-pankaj.patil@oss.qualcomm.com/

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
Anjelique Melendez (1):
      pinctrl: qcom: spmi-gpio: Add PMCX0102, PMK8850 & PMH01XX PMICs support

David Collins (1):
      spmi: spmi-pmic-arb: add support for PMIC arbiter v8

Subbaraman Narayanamurthy (1):
      pinctrl: qcom: spmi-gpio: add support for {LV_VIN2, MV_VIN3}_CLK subtypes

 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c |   9 +
 drivers/spmi/spmi-pmic-arb.c             | 327 ++++++++++++++++++++++++++++---
 2 files changed, 306 insertions(+), 30 deletions(-)
---
base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
change-id: 20250920-glymur-spmi-v8-gpio-driver-d27d0fb36464

Best regards,
-- 
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>


