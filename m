Return-Path: <linux-gpio+bounces-30997-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHz2AYxQc2kBuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30997-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:42:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F6574753
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E83B33053B97
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852F4352F86;
	Fri, 23 Jan 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Di6xokwE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E07B27FD40;
	Fri, 23 Jan 2026 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164865; cv=fail; b=W8fiOeOd4uawZxlRW5GBigsQ8ayi9ID0FfNWuxKfzBQpt+7P3OSoVVQBgYr39swgD/9mAfMbv+wspZLf7vVDCbmi8LXhUCGtzysFNjYOiesbidxifrVYuavJZJQVVhKDIumO+W/fHBKW+3Zkxw/g8Y25VrdUNR2dB0q9mhEe58Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164865; c=relaxed/simple;
	bh=jAoxM1iw2pToaOi3nzCRGpgKQjvIJYYTF60fF8R6ZkA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=oiJ3AMhmBIroZDMQYjQNP6E6h+iZ6JjX1EREzGJn7KGALNdbdcaP0tQMOK/BJI4EAGmOcWBySiKtXKJXaDnxb9RJGY2JDi7a47kGPFNL0FOow7pq660O427VNDpySjv2EkZ+c651BZATKTAWcFj0m+4Iy3of42WzR8IvzRXjbBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Di6xokwE; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NAZhat2293480;
	Fri, 23 Jan 2026 11:39:51 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4but7btcyp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 11:39:50 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eg5+ZlyAjUG5VGt3FlH0+5e3P9VBqTL7kg4N76RCQlrDs7XWlJj7XOG4zqJ6IBL4bfNdfsctx+nEVk0yZ5dvFvzaS0fO4pJfuBmfU6Sxoo5FdLoFS8wGsyRa6FXIQJ0MoiJHRb6mRplx/+W0EFrJysH/1GZVjmdI9EWgG8RQXlo1f0q4QGkkRwnf+E63yZ3uDnlWALG5aOvcR0XspJqikPa2OTfj9pUAru+AOvvilIgyM7sOCYJk+mPML94fPAgjD8SUzAdUt9gb26UUNa9FNRlHljimieRbr2azh0YkWqLcKoCcudAxHgSQehZ53q7wCTHKmvZufnT2/wZyN0ghbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/x3KifGI7PXF56PNHTnVFHLRy1307u7M2zDU7VFqNs=;
 b=pvFO82G38hHT3XFEntIEO3y81VUEpR3Z62UrjJ6LW1Xq/s3hKeaJlHqCB4Bb/tTJ0j17ggznVIxWf14dnPCc+G/vBd+qqHPCAZ+Z24S18EuFA2UAyYcRR1YsCFXA0o/4hsEF5syrHmn7FtPiBCnqPQfUiiw6MG0/yDCUlPBW81jhPB1IpMycdblZYO4AmJMyrBEbXkV4yt62CO38Z72urCHm1xEnYf7H1MZA6qljWtuD8Ay8wWza/jg/HW2aw9VD0xap0TfWILPpNxY7JMVOIvouwNGOd+pLMLbPdAlwjQeYKhNO+OzWM9vf6Gy3LUvQBYRPu6DrMXGk0e/2+FM2DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/x3KifGI7PXF56PNHTnVFHLRy1307u7M2zDU7VFqNs=;
 b=Di6xokwEiWhLnHPhL/TxKPxt61uWQ9J209wxK5LCFqA/BmyyoKiRk5/dQeRm4w/e/0zbxuPk6ihWkZILtqDTTzwIxyg4KrAzvCTBkEK3KfyOmNKDhh3B6/AKfQyAvGSOYI3x1cEQ1ge+VcxWTNIwzC5l9OxSpjNUd8H1gknb2malLouLZ40gyI4kvn57djevwTbeAkKU/GHG4LW2RYXTLsFFrpWPs29w1mr29GHLHSotp330juOi9qErDZYeRco+vxOWc/WXGkdVxzJcR4arXrHeA7z+VOWGq4uVc63hKeKxZUlBwMzW00iuBpmQ5Inr1OTzTl7Zv+blFkcpiwzVxg==
Received: from DU7P195CA0015.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::33)
 by GVXPR10MB8525.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:39:46 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::ec) by DU7P195CA0015.outlook.office365.com
 (2603:10a6:10:54d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 10:39:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:39:46 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:41:17 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:39:45 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [PATCH v5 00/12] bus: add stm32 debug bus and coresight support
 for stm32mp1x platforms
Date: Fri, 23 Jan 2026 11:38:57 +0100
Message-ID: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMJPc2kC/2XMTQ7CIBCG4asY1mKY4afUlfcwxlAKlYXWgBJN0
 7tLTUwwXX6Ted6JJBeDS2S/mUh0OaQw3sqQ2w2xF3MbHA192QQZKgZM0951z+HcPRPlLSqlbGO
 4MaT836Pz4fVtHU9lX0J6jPH9TWdYrr9KW1UyUEa1RxDYSdNwffBjSrv02NnxSpZOxsqCqC0WK
 0UjbaMFSNWuLa8sQm15saLnKCSAZj1bW1FbrK0oFrVnHg1Kj/bfzvP8ATrJAUdYAQAA
X-Change-ID: 20260108-debug_bus-392666c7a3aa
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <jens.wiklander@linaro.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Antonio Borneo
	<antonio.borneo@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8C:EE_|GVXPR10MB8525:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f9617ae-5f08-4553-1672-08de5a6bb9fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmlxQ2pqNVg2cXZSL0hpOUJWamtYSUVrR1hWS1pBb0JOTnhXc0p0YS9aU2dM?=
 =?utf-8?B?Ri9xOXRtYmZoS0UydHFSN3pRQlZCN0d1Q0ZyN2pQOW9jNTZrbGYyOTAxc0RI?=
 =?utf-8?B?M1F1SFRBZVJzTW9lRUVYL1RuRXVNSmJ4NEVFcDJzVUxlSCtxenhjeDlhYUhx?=
 =?utf-8?B?ZVg2N0h1a0s2QkFsTVBvcFhQUi9FSGFORDN3TVJHMTltMm44L3B2cjNNQVlu?=
 =?utf-8?B?OVNiRkhDdTNvZU5MSDUyWG5XM2VDZzU1RU52RmVRZ0I1UlhEcEtwdkVYbjVV?=
 =?utf-8?B?SUNxekJML2tqZHcxSEZlVXZWdWl5SUMyNE9wZTVFNU9zTFBBM2FOUVJPSUw1?=
 =?utf-8?B?Ym0zUDNyaG1oRXd1ejN1ZzdXcUlsVTIxT3hVRFJzRzZxVlI4SVgrWUhTU2JR?=
 =?utf-8?B?blVFbWtSYkREOUNQOE53Zk1WU0orelhZV1VSbXlrbWx6bEVYeUlZWE54czFU?=
 =?utf-8?B?WXFMa0tmb1cwb3NCaHhxRGhocUkvamI0TWhxYXM3V3VpYjhaLzRDOG05c3py?=
 =?utf-8?B?TkNVQWYzekY3cHhXQXF1KzJ3SGw4MmZvWkc1NzZNY0taVW5NUDh0cVBVQ2kw?=
 =?utf-8?B?SG4vZlB6ODhzdkJVZ3VXRkhvdVpNWTVqRHZaMlBPbkhDaXhIVFdSMFRMcXpG?=
 =?utf-8?B?NG96QU9kQ0hoOGZRVlRKc1BzYWJocFRTajhEY3p5WEZaWE82dmRsUldiY3pC?=
 =?utf-8?B?Z2RScE1JM1FCd3N5UExHNlE5ZEMxNUhXZWtTbVJFdzlQZXdtYzc1ZC9jWHJv?=
 =?utf-8?B?cldKdlVyVzJCUVY3cjVodVBXWTRCSWIzQ3J0SzZnTm1lbWFhdGhoK2Q3eXRU?=
 =?utf-8?B?eFAzWEpYbWNha0REWXJDakx2UE50cE5XL0FhUmZBOFBqSTNzRVcrQWVlUHk0?=
 =?utf-8?B?M1U5S0cwaGRuRmpVKzlGV0hGZWtjZUhmeTl0Ny9nNTFsTkhXcUhwWW1BbkVU?=
 =?utf-8?B?dmJwQ3dSQVNPb3NiUGpUcVRWQVRtZlZkUTB4WkxBdmJMSTFPeFQ4Ukl6bXpE?=
 =?utf-8?B?OHN5VnAxY3dLb2hhblZkb1FFN0RSeis2N2lXUUhzeXFLMUI3TFcxRU5MYytN?=
 =?utf-8?B?RWMzSEFJWi9mamxSS1A0OUZmVlkrNi9FNVZKeW5BbGNxektvVFUyK3NNL3Rr?=
 =?utf-8?B?ZTFQV3BzWnVFRDR3V1BZYjIyVWpVdVAxdVJhRi9mY0hmMUgxUHBKOEw5UTFX?=
 =?utf-8?B?Q1N4ajNYZGxxRFlKVnZQVWNwWEI2bFp1NXdLQTBHd1krcEtoVUVteE0yQW9l?=
 =?utf-8?B?VjI3ZWVpU1RZQkVGTTVzUWxWTzlXMUwxQVczazhScTlKWUZvUC9yY2NEb21L?=
 =?utf-8?B?eVM5bjFvMDNkOUhGYW1GWlA5NFl0dTUrQ2lXY3d6S1RDUzZ1SWpkcUxYQWNL?=
 =?utf-8?B?WWE5QTJiZGl5Yko2Z054aWdndDlCTTM0aE1hclVWT1V3dDFrL0ZOeEgwSXk5?=
 =?utf-8?B?RWxCR3p4RXRTZzRJOHJkZ3dldlFlSXBoL0JEdzN6MUxnbEszR1crbXFXMmhh?=
 =?utf-8?B?VGJnREhNdnBBc2NyUXJ5TTdzcXU1TlFzQlZhOFpaTTZodllQdG9FczdLeExG?=
 =?utf-8?B?Zm54UWNURWtoTENVekoyaE5vSi9MV21FSWtmWE03YVFmaWM5c29NaEdTVkZ5?=
 =?utf-8?B?bTU3WkpXR3UvL3hudGUwMk1yMDE3T2dxSGMyWDZuNXZYVlUwVjNqdk9SOUZk?=
 =?utf-8?B?S2dlMFdPVlRxNkNmemlDVUt2ZEdvdWhjZHplWjVUZ1pjamxMblNIcUI2b210?=
 =?utf-8?B?d2wxYkZXbkpYMGFwQmtMMDU2Rm1RMmY2T08yMVR6M1lULzN5OUlxRVFMY3RD?=
 =?utf-8?B?WlhXdnEyNkhRemFOem50UG12WTN5dFo3RVBYZGxmYlk5ZWp0b1lLQTlDalUx?=
 =?utf-8?B?bkdySXhCcnlCdnBoemxGUEdGcXI4cGNRZ09RSTlmTWgyd3B3N0cyeFgwUWlv?=
 =?utf-8?B?azVTRHJUdW9DcUk2WUdtRktEUC8vUk1RRFZVaEh2cm5TTGV2VUcrMXkxZXY3?=
 =?utf-8?B?cVFWNVpZUm5HaHlRQVpTUjFCMi8zY0ZmUm1ydlJ2aVg0N0pycG1xZUV5ZXE2?=
 =?utf-8?B?aEJaN0wyQW9KT3ltR04xY3NiUGExRkN1eXBoOWpOczI4Q0pIYURjYkxKR2x3?=
 =?utf-8?B?M1hDMys0VzF5NGZKTmpVd0t5bTdUK3NYQktPeE1kejA1ZFhxVUhMK3ZZaUw5?=
 =?utf-8?B?L1dITkppYlVQL3FRMXBjMTVXYmRiWndaOGR2TXVKS0c2UDVlMW1idDZMMytT?=
 =?utf-8?B?VjJYVlV2alNYb3F0dnhxUkF0bEVNQ2ZMZVpUTVBuS3FUalI1NTlDb05IK3Bs?=
 =?utf-8?Q?iVRnW9uzw8/yn6C+c2?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:39:46.0366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9617ae-5f08-4553-1672-08de5a6bb9fc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8525
X-Proofpoint-GUID: E9tzUrTtBezJjL1aydaCBGu7vqflx0mN
X-Authority-Analysis: v=2.4 cv=Fas6BZ+6 c=1 sm=1 tr=0 ts=69734ff6 cx=c_pps
 a=ABl0Bi0us4p/gv29jCzjpA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8
 a=Ca_RQAvUjDkQCxdtJiUA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: E9tzUrTtBezJjL1aydaCBGu7vqflx0mN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NSBTYWx0ZWRfX2w615/Sd+IXs
 POlzws0a7hUd76SO2KjNSaLs2c4frSQ/Khuq/XKhaMrqljF6EohoXIYUnuv7s7/f2WFt1KTKyfL
 oqFzSn9GqsMl2ea6Owl6kGFVU7vc5n7wAyoPeD7Kb3vLRFQtMwpMd8H0TUs4ScdQ7Sj+6jn7b5m
 JnmVy/8qRz20lY7DVX/KzL4siMKAjRiFZGCDpQsi8tXW497KAMUyYpFTZXSdIs9f8nUJlpnOpaS
 vES5fTJRJgM3SqZ+93a7TFc7Mu+Rmh3cTXwoowsnBOJ323gWqwTRiCI3ER23Tm7pQH35+YHYC1y
 4iOPgS2eEu5Jv5BFUOKjj9JmHldReNtLYHhg9yX2gOEjE9dqqUIIl1Bg8XoCqjc/RcMsrO4IUwP
 7/DiFa3ZcL9T4UFqaLBeod0snMrkdEyEFjvsG30+ipQo5uAL7aQQfvUr6VEuZmet8K+lq32nYie
 MoEsokZ7uTD54G6fffg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30997-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foss.st.com:mid,foss.st.com:dkim];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 88F6574753
X-Rspamd-Action: no action

Stm32 SoCs embed debug peripherals such as Coresight. These peripherals
can monitor the activity of the cores. Because of that, they can be
used only if some features in the debug configuration are enabled.
Else, errors or firewall exceptions can be observed. Similarly to
the ETZPC(on stm32mp1x platforms) or the RIFSC(on stm32mp2x platforms),
debug-related peripherals access can be assessed at bus level to
prevent these issues from happening.

The debug configuration can only be accessed by the secure world.
That means that a service must be implemented in the secure world for
the kernel to check the firewall configuration. On OpenSTLinux, it is
done through a Debug access PTA in OP-TEE [1].
To represent the debug peripherals present on a dedicated debug bus,
create a debug bus node in the device tree and the associated driver
that will interact with this PTA.

[1]: https://github.com/OP-TEE/optee_os/pull/7673

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
Changes in v5:
- Take into account Rob's comments for the debug bus documentation
- Link to v4: https://lore.kernel.org/r/20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com

Changes in v4:
- Remove reg property from the debug bus and use ranges.
- Link to v3: https://lore.kernel.org/r/20260121-debug_bus-v3-0-4d32451180d0@foss.st.com

Changes in v3:
- Collect Rob's review tags
- Add stm32_firewall_get_grant_all_access() API and use it in the HDP
  driver.
- Link to v2: https://lore.kernel.org/r/20260114-debug_bus-v2-0-5475c7841569@foss.st.com

Changes in v2:
- Fix kernel robot error by documenting the access-controllers property
  in the missing coresight peripheral binding files.
- List the access controller items for HDP
- Various minor fixes in the debug bus binding file.
- Remove clock documentation and its presence in the DT node and driver.
  Bus clock will be handled by the child nodes' drivers.
- stm32 debug bus driver:
	- Depopulate the bus when .remove() is called
	- Remove trace when error on devm_kzalloc() as the trace
	function does nothing in case of ENOMEM.
	- Remove use of of_match_ptr()
	- Use tee bus callbacks
- Link to v1: https://lore.kernel.org/r/20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com

---
Gatien Chevallier (12):
      dt-bindings: document access-controllers property for coresight peripherals
      dt-bindings: pinctrl: document access-controllers property for stm32 HDP
      dt-bindings: bus: document the stm32 debug bus
      bus: stm32_firewall: allow check on different firewall controllers
      bus: stm32_firewall: add stm32_firewall_get_grant_all_access() API
      drivers: bus: add the stm32 debug bus driver
      arm: dts: stm32: introduce the debug bus for stm32mp1x platforms
      arm: dts: stm32: enable the debug bus on stm32mp1x boards
      arm: dts: stm32: enable CoreSight on stm32mp15xx-dkx boards
      arm: dts: stm32: enable CoreSight on the stm32mp157c-ev1 board
      arm: dts: stm32: enable CoreSight on the stm32mp135f-dk board
      pinctrl: stm32: add firewall checks before probing the HDP driver

 .../devicetree/bindings/arm/arm,coresight-cti.yaml |   3 +
 .../bindings/arm/arm,coresight-dynamic-funnel.yaml |   3 +
 .../devicetree/bindings/arm/arm,coresight-etm.yaml |   3 +
 .../devicetree/bindings/arm/arm,coresight-stm.yaml |   3 +
 .../devicetree/bindings/arm/arm,coresight-tmc.yaml |   3 +
 .../bindings/arm/arm,coresight-tpiu.yaml           |   3 +
 .../bindings/bus/st,stm32mp131-dbg-bus.yaml        |  76 +++++++
 .../devicetree/bindings/pinctrl/st,stm32-hdp.yaml  |   6 +
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/st/stm32mp131.dtsi               | 117 ++++++++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            |  24 +++
 arch/arm/boot/dts/st/stm32mp151.dtsi               | 172 +++++++++++++++
 arch/arm/boot/dts/st/stm32mp153.dtsi               |  68 ++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |  40 ++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          |  40 ++++
 drivers/bus/Kconfig                                |  10 +
 drivers/bus/Makefile                               |   1 +
 drivers/bus/stm32_dbg_bus.c                        | 236 +++++++++++++++++++++
 drivers/bus/stm32_firewall.c                       |  44 +++-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          |  14 ++
 include/linux/bus/stm32_firewall_device.h          |  26 +++
 21 files changed, 892 insertions(+), 1 deletion(-)
---
base-commit: e82d0477fd80707221c3d110f56d05506de2698c
change-id: 20260108-debug_bus-392666c7a3aa

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>


