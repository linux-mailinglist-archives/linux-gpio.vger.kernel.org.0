Return-Path: <linux-gpio+bounces-34969-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEWTFfj212mrVAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34969-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 20:59:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B033CEE63
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 20:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B35C5300B3F6
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 18:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB143242AC;
	Thu,  9 Apr 2026 18:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GvgXLAQL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A8D2E7BD9;
	Thu,  9 Apr 2026 18:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775761141; cv=none; b=o38Yj/zv6I/do7xclfBo2vW15wQXAQNiplF5XcyighzJ1jqqOECe2OeTk4Giqviaqsq5O9z5dKGksd6/AFHdzAer+zKjkZt4jVE2BqP+awvsuQTfwj2dL/ErzTvBKYOmFMr55r56K9fDiofpdmNjEKQSURSQ4VMDzGotddCjbjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775761141; c=relaxed/simple;
	bh=qNoGmmSa28PVrldUYqQ6VTWXmgjDMcpLjlzsqUL1aPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dG0TCqdsM+kc0XDdzcQmArKvhOPaOJqgyNTh2ivZrOwHc0penCcEQHYE8L+CMAlBcyYL3+cog57wxQmZkUXPM7OJxUsntmQqxLP8hwN6vhphbo0lo+ugpHKEmBY1MhRwxTzx59pTvjdxVapr7vzE49eefnCCWc4aoT2AOCFhsxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GvgXLAQL; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639Hww1D2628123;
	Thu, 9 Apr 2026 18:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=zKDD6lu69MoDLLClG62eexNR8L4a2
	agAF07dRP2upBg=; b=GvgXLAQLq7lVQPsRsqx5n7JhhH8mIJjjITGhIYqnXXvCo
	R7WCkxUMGlhF9XleSgPy2IZNgm1FUl4x6Ux15gyrxXf6VbAP9KwkabIe2ROkxINF
	rdqLFQYtaG6iy3XLyiiGqk1EmUDCvjMlOvm+1WV/dUn7s33BmnpwTtGBy2A9N9Az
	5wuMW5M83Hp9ergSSWbavKQpJuy2z5JCcNrLDLsDXVcbf96nELSi5Rr0Es+YmTvj
	oqX1TqkP1vVb+fhD4cXYVuc8j4d0wGD6C2dJRRBlhV4wj8qJ51RgWTAMAtAa9/9M
	4+5QFXwTVqPSHTaLOrg9f/A34JZAOWf/43qWvQsIA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dcmqaytup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Apr 2026 18:58:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 639HKRDp040082;
	Thu, 9 Apr 2026 18:58:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4dcmnb9gj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Apr 2026 18:58:55 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 639IwsM9020890;
	Thu, 9 Apr 2026 18:58:54 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4dcmnb9ghk-1;
	Thu, 09 Apr 2026 18:58:54 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: linusw@kernel.org, brgl@kernel.org, thierry.reding@kernel.org,
        jonathanh@nvidia.com
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, samasth.norway.ananda@oracle.com
Subject: [PATCH] gpio: tegra: return -ENOMEM on allocation failure in probe
Date: Thu,  9 Apr 2026 11:58:53 -0700
Message-ID: <20260409185853.2163034-1-samasth.norway.ananda@oracle.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2604010000
 definitions=main-2604090174
X-Proofpoint-ORIG-GUID: Pp6IaRn9vkW3s6fi2KBdKeFSNnfGQiFM
X-Proofpoint-GUID: Pp6IaRn9vkW3s6fi2KBdKeFSNnfGQiFM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE3NCBTYWx0ZWRfX6KMfRx0Zy+9g
 AR0fLNZYtEt40MZb0wPPm8avVpG3JZAyOXKuv0f9dqiBxzHodmn3QvWDSApLZvdoAXR/TXC4owZ
 ut+6v0HAR2tlA3bgzkxU/0+WGTRXbwxovNLcl8xh/7HlalAzVn3iYhVSfeK6O3SxiDLBDd3kmwf
 ektw82D7QM84dMlO4oTDL9+J6jgPa/jlFA9zI0WqRaXsidf6XTBGjjM/TT134lbhxP2TPnbJqIt
 abq/jU7HvUUhnN7/a/k0A8AFUr4VEE+iwcVupq8uBX5cpc068wXyNAv9SBkybJNHfNxZpxsZB6Q
 SyfgrJwQvuRn/oH5T45a9fjABadxt2Usn4SuweEVj6o1WNdzVwIxjeOYhwIUFPZfWMmVFsvRy4d
 k9b6f8q85FNbEUtsBEdZyY+7hCJ7Wv8+mYcs3xL+uxqCFVpwWTipp2xEb6Kspbrl9yrHQ51IOO1
 VAHAuAL2quw+tgB2kUA==
X-Authority-Analysis: v=2.4 cv=NZXWEWD4 c=1 sm=1 tr=0 ts=69d7f6f0 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=Osr7MVhTVGmRnRM--I0A:9
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34969-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[oracle.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oracle.com:dkim,oracle.com:email,oracle.com:mid];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[samasth.norway.ananda@oracle.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C9B033CEE63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

devm_kzalloc() failure in tegra_gpio_probe() returns -ENODEV, which
indicates "no such device". The correct error code for a memory
allocation failure is -ENOMEM.

Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
---
 drivers/gpio/gpio-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index b14052fe64ac..df06b56a2ade 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -698,7 +698,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 
 	tgi = devm_kzalloc(&pdev->dev, sizeof(*tgi), GFP_KERNEL);
 	if (!tgi)
-		return -ENODEV;
+		return -ENOMEM;
 
 	tgi->soc = of_device_get_match_data(&pdev->dev);
 	tgi->dev = &pdev->dev;
-- 
2.50.1


