Return-Path: <linux-gpio+bounces-11143-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD309984EC
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 13:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A36D1C20EB0
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 11:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F2B1C2DC8;
	Thu, 10 Oct 2024 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lJU3XipM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4408EF9CB;
	Thu, 10 Oct 2024 11:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728559498; cv=none; b=InQCUQURrZJXy2KopfSLwNiiMGblaTDM2DJRM0l0CyqwgCNx3NwGn5Q2bb6+oQP1HiqSQZfHabSclAK/4fyQ4lt7NHQfHthsiNVM1rjTSnfJ451Ce/aOm+WhTGwwWAf+3Bd/G1B+fWGQLjEO7Tc3sYVLdTpbXhucqxnw+KfcU/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728559498; c=relaxed/simple;
	bh=ywceDmzYQKH28KRgkOB9nGjXZGaXYWHDTS1DHsIk3Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IUuLrkdglHhx44mApQ+EQFXIKRBLA8kVLdD9+H5nnVY0EFblvRJ+e40vmW4us2EYqIwLbufF7EWcvY70Bo4saly8+aC8AfZUQPLYZFWK7z33uesqXuj+3/ij+uB959dIg9EAQBlcEhGa+vndDrh1DE+o647jvVIS4gMPjnChG+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lJU3XipM; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ABMduX002819;
	Thu, 10 Oct 2024 11:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2023-11-20; bh=+Lt5TvzGhT9DI465dwqRMgLKs/FyG
	03acJyUMNDMqLk=; b=lJU3XipMDhMxFK5PrptopagRJT+BsXO2p/dV/UFKndEuX
	4UN88zW7V9u3npraMwVgr7ngRDdoX7al+rFEUbdlZ4hTz6U7l3sdhItAL6OxHtrc
	ITAXFxGohb+5jqMV6l895TwZVnd7l2SZyuI3TyTUHOmuIYyv75s9u/smTWyaz3N0
	qV+LFe/BgNeFzitlHwMmY3R/90rXnqUTX7hqMV3A726aXu88A1cbV8Yjqsn2IfpA
	DsG9qFw76Vw39ryyf6E7xFeFMZ1gYeHTn26xAZ6F7AvnYaw3gDHNHOLVUqfALiQ/
	kjFXlI8Fuw35sLzxPDPFTYv9LKUUMMBQV/i59v6SA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42306ejh49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Oct 2024 11:24:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49ABCS2V011625;
	Thu, 10 Oct 2024 11:24:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uwg6x7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Oct 2024 11:24:48 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49ABOl9C031014;
	Thu, 10 Oct 2024 11:24:47 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 422uwg6x6y-1;
	Thu, 10 Oct 2024 11:24:47 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@outlook.com>,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com
Subject: [PATCH] pinctrl: sophgo: fix double free in cv1800_pctrl_dt_node_to_map()
Date: Thu, 10 Oct 2024 04:18:18 -0700
Message-ID: <20241010111830.3474719-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_08,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410100075
X-Proofpoint-GUID: sbJPztGdrITMqyNO9QML_0_1Qb3O_iJw
X-Proofpoint-ORIG-GUID: sbJPztGdrITMqyNO9QML_0_1Qb3O_iJw

'map' is allocated using devm_* which takes care of freeing the allocated
data, but in error paths there is a call to pinctrl_utils_free_map()
which also does kfree(map) which leads to a double free.

Use kcalloc() instead of devm_kcalloc() as freeing is manually handled.

Fixes: a29d8e93e710 ("pinctrl: sophgo: add support for CV1800B SoC")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is based on static analysis with smatch, only compile tested.
---
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
index d18fc5aa84f7..57f2674e75d6 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
@@ -221,7 +221,7 @@ static int cv1800_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	if (!grpnames)
 		return -ENOMEM;
 
-	map = devm_kcalloc(dev, ngroups * 2, sizeof(*map), GFP_KERNEL);
+	map = kcalloc(ngroups * 2, sizeof(*map), GFP_KERNEL);
 	if (!map)
 		return -ENOMEM;
 
-- 
2.39.3


