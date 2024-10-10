Return-Path: <linux-gpio+bounces-11163-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DDF9993F1
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 22:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 166311C22892
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 20:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AA91E2301;
	Thu, 10 Oct 2024 20:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NagXoIPD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A76E1CF7B8;
	Thu, 10 Oct 2024 20:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728593577; cv=none; b=dX+cP7um/5ra1atvqc6SRT3m9L2SeM528GW18MomLXBDBrbK8I9JxPbDfhN0al6jkye3atmkeOOh7L8/onpEZW8tlEuM/o5Z8mWVAYkZvl+DT8T1YCPaGD+oJAfvP1M4laMxt213L87MYUGoY6o+ZW1VpsyDZyHaFz6844+iwe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728593577; c=relaxed/simple;
	bh=etEDntW0X/md7gzZZSsscb2sy5hgRhbqVNrPnRO1MkI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L0/SqCCgSBXrn7IWwpOa/C82x8bqMt9T0cMnzN8EnVt7icX5RMsveVGe3cGgdgHaSInWN11Daj9/22OgFGDksGjSO4Ud2DVvHEg+hngivAVROFmDG0cKVvfSir4HeJ0tfVwOQ4ZP4SpTsUbv4lrv4maEG+YHOPqM9MAnDfSBoGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NagXoIPD; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AJthn1001702;
	Thu, 10 Oct 2024 20:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2023-11-20; bh=wLyIh6+9gn3e4xbPSOwVBCRNfUEr4
	1UaG6ybaOHaEqI=; b=NagXoIPDGGQhvlyp1LT5AFFKHu9sR6f7PrAt5gm7LY/lc
	VjnPM4ZoEqSZ8JwzHhMvEoUAl9VJweQ39OpIDbSKR26LbFH7iyZQcWpwoDw2pzlP
	yfK2ZBs1/SHLOMDnVEGRnOHHiYKNUpGbHhjgtS8Hsz+g5RFiVAuVTGD550U3wAJe
	3ErxbGLHlGaVu1kz3DfbOq6NX5cbb7Hvtt1WkCK793HafO1f1QJg4SrPqufELOIn
	MfBZkFdBMohhSdEO9WcXhC6mjAqzQChibo73Kf/X4QhBUMi0TZ3iLRrLdSKBRdyW
	PauC08k8DgomkB23F1n+yUGLrverIoTNaWvDJvoKg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 423063upts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Oct 2024 20:52:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49AKqJHd027694;
	Thu, 10 Oct 2024 20:52:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422uwakw24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Oct 2024 20:52:43 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49AKqg7i023518;
	Thu, 10 Oct 2024 20:52:42 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 422uwakw0j-1;
	Thu, 10 Oct 2024 20:52:42 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: christophe.jaillet@wanadoo.fr, Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, harshit.m.mogalapalli@oracle.com,
        stable@vger.kernel.org
Subject: [PATCH] pinctrl: nuvoton: fix a double free in ma35_pinctrl_dt_node_to_map_func()
Date: Thu, 10 Oct 2024 13:52:37 -0700
Message-ID: <20241010205237.1245318-1-harshit.m.mogalapalli@oracle.com>
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
 definitions=2024-10-10_15,2024-10-10_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410100137
X-Proofpoint-ORIG-GUID: RLLLelALefeX2SGF4qW2m8rwk2iQWf2e
X-Proofpoint-GUID: RLLLelALefeX2SGF4qW2m8rwk2iQWf2e

'new_map' is allocated using devm_* which takes care of freeing the
allocated data on device removal, call to

	.dt_free_map = pinconf_generic_dt_free_map

double frees the map as pinconf_generic_dt_free_map() calls
pinctrl_utils_free_map().

Fix this by using kcalloc() instead of auto-managed devm_kcalloc().

Cc: stable@vger.kernel.org
Fixes: f805e356313b ("pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO driver")
Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is based on static analysis and reading code, only compile tested.
Added the stable tag as the commit in Fixes is also in 6.11.y
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index 1fa00a23534a..59c4e7c6cdde 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -218,7 +218,7 @@ static int ma35_pinctrl_dt_node_to_map_func(struct pinctrl_dev *pctldev,
 	}
 
 	map_num += grp->npins;
-	new_map = devm_kcalloc(pctldev->dev, map_num, sizeof(*new_map), GFP_KERNEL);
+	new_map = kcalloc(map_num, sizeof(*new_map), GFP_KERNEL);
 	if (!new_map)
 		return -ENOMEM;
 
-- 
2.39.3


