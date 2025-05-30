Return-Path: <linux-gpio+bounces-20794-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAB8AC8CF3
	for <lists+linux-gpio@lfdr.de>; Fri, 30 May 2025 13:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A317D3B6573
	for <lists+linux-gpio@lfdr.de>; Fri, 30 May 2025 11:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D48B207DFE;
	Fri, 30 May 2025 11:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cab.de header.i=@cab.de header.b="DEFcsjaf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-007fc201.pphosted.com (mx08-007fc201.pphosted.com [91.207.212.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066232288F7
	for <linux-gpio@vger.kernel.org>; Fri, 30 May 2025 11:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748604701; cv=none; b=pJmg//RZESYNyCaqmiPpCi6eMlxjzu7dDsiG4Lf/Gvc7o4S2RqdSGLruunKroZiw++c25TbB6Dvqv4Q+IPpHtuyDoABUycUKzTGds7b6fhjbJgLrC5hvDg/QdORMDur6XvOBi5wW6Ownb2Km/5YeGF5DS9vKG0twAP1zgGJNmJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748604701; c=relaxed/simple;
	bh=nYruS45SapJ6MdDHZBSPzhCkox0vxpm9zGIk+nrkhSU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tjh1PpaiHEMF1Q9Qe/ttSHiVlojxwO0uoy5osya3k1s4Xw7YcdqmXA90LuiPyI7T4+EOfplTEyEC43LvI43ASnhiX0GnPjt7pPUIhKdKV+f0EVw977r//8o0qHNlchCTXtbAOLEcC5//LWZmDLODhrKlNo+yPgWMaQvJhfqJqJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cab.de; spf=pass smtp.mailfrom=cab.de; dkim=pass (2048-bit key) header.d=cab.de header.i=@cab.de header.b=DEFcsjaf; arc=none smtp.client-ip=91.207.212.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cab.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cab.de
Received: from pps.filterd (m0456229.ppops.net [127.0.0.1])
	by mx08-007fc201.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBPDs0019880;
	Fri, 30 May 2025 13:25:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cab.de; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp-2025; bh=CEMjN/p92D20IW8ET6NlfzXK
	ASsrGUdESbb01022h9M=; b=DEFcsjaf3U7wPiyYTCDt4SRcrfUIWy0gEIaSUGBp
	WLi2PhJPT4cl3WR04drtKV8LeEV50NYv0oizdn052LCSRNAP93skWaUd2QPUEu/4
	ywndlB+18dczx7k5Ei9FDx8hVEQFymzRQpNHahCyUZ8JWvyV+mf3BO2gkg0Y0SNi
	1EmkvDv0bWr7zOPgHdoZhkPSRz5k7Ze/3aKxzg05hH4Qa/9Uh3aivyuObDKUIbPo
	suH5QR26CwpDJVSdamU04ip9KjjX40YLJztZT/ivDLEcJFDoiPpzhQxeJgvhSAdL
	OmmUGDiiTkv+4LxB0Y8nvzLfhKRzQAj/oxI5l/CHBTEJVQ==
Received: from adranos.cab.de (adranos.cab.de [46.232.229.107])
	by mx08-007fc201.pphosted.com (PPS) with ESMTPS id 46ut7k9yu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:25:13 +0200 (MEST)
Received: from KAN23-025.cab.de (10.100.0.38) by Adranos.cab.de (10.10.1.54)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 30 May
 2025 13:25:27 +0200
From: Markus Heidelberg <m.heidelberg@cab.de>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: <linux-gpio@vger.kernel.org>, Markus Heidelberg <m.heidelberg@cab.de>
Subject: [PATCH libgpiod] build: drop python3-config check from configure.ac
Date: Fri, 30 May 2025 13:24:40 +0200
Message-ID: <20250530112440.124178-1-m.heidelberg@cab.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Adranos.cab.de (10.10.1.54) To Adranos.cab.de (10.10.1.54)
X-Authority-Analysis: v=2.4 cv=aKbwqa9m c=1 sm=1 tr=0 ts=68399599 cx=c_pps a=LmW7qmVeM6tFdl5svFU9Cg==:117 a=LmW7qmVeM6tFdl5svFU9Cg==:17 a=6gx2k9LiueYA:10 a=dt9VzEwgFbYA:10 a=yU_-SeGVZe2lLadOBA8A:9
X-Proofpoint-ORIG-GUID: wE1r0Z6-6_2dfxXhziOaxAHilxpMCdT-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA5OSBTYWx0ZWRfX+dKzRDmYfhX0 qoyKigbVJEE1Efstuu7143XxoOukNwiNaICnSqKXRMnjGWUK+H3N/s3QQnxgI5RZ+MpiVwYdOqL 3BISpiqJx64MzXsRa+K+7tE0S6yl5Qv1M6B5WlSYuMbWBLXjsOe93+QQBPCxmpdykVcVnU/N0TY
 aINXn9JKXkU/KPhleylaaGGs4TV93RXjjQQxOeoLn8ceZE8XLikNgt8lmNq94ocRjMAoMg4OsJ9 tjfORLsEntcBCDtvBWT5gr+5pGftQ8Q2iboanHr7cbcbfe1BuWdcTQH+Nct/iuYWHVFRqlzI4cO hUaQ3+WgXhRHYkR4cwz0dXQZpndaO7u8/Jg2d8WUK59FonS5PyPcOMy+HTmDracMlTaYoGddYh+ T/cjvCTR
X-Proofpoint-GUID: wE1r0Z6-6_2dfxXhziOaxAHilxpMCdT-

Since commit b7ba732e ("treewide: libgpiod v2 implementation")
autotools are no longer used to build the Python bindings and thus
python3-config is unused.

Fixes: 8aab09cb ("build: drop unused python-related bits from configure.ac")
Signed-off-by: Markus Heidelberg <m.heidelberg@cab.de>
---
 configure.ac | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/configure.ac b/configure.ac
index 416ae28..9b6c862 100644
--- a/configure.ac
+++ b/configure.ac
@@ -230,12 +230,6 @@ if test "x$with_bindings_python" = xtrue
 then
 	AM_PATH_PYTHON([3.9], [],
 		[AC_MSG_ERROR([python3 not found - needed for python bindings])])
-	AC_CHECK_PROG([has_python_config], [python3-config], [true], [false])
-
-	if test "x$has_python_config" = xfalse
-	then
-		AC_MSG_ERROR([python3-config not found - needed for python bindings])
-	fi
 fi
 
 AC_ARG_ENABLE([bindings-rust],
-- 
2.43.0


