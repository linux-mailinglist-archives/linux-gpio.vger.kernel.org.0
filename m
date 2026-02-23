Return-Path: <linux-gpio+bounces-32029-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFKYB78onGl1AAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32029-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 11:15:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CF0174AE5
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 11:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57A3830A4CFA
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B55356A08;
	Mon, 23 Feb 2026 10:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hncDHGmG";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mSL2tt1X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F2735B62D;
	Mon, 23 Feb 2026 10:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841345; cv=fail; b=cld3z5TIpcpveBrBLnW4Plw65BDwjuF/P1NCMjNwK7l22DJ1P9Q8vxewRkyxHguSkLu0j3gQJb5UkpyNmXUykgmQvHFSfwIsV8BPx5SwYJoslQwl3vloU8Req79S48QTCMrmAI8Qd6F8iTUHp90XBPsGywfZIgUML7Pu9hyTwH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841345; c=relaxed/simple;
	bh=ylMgwOQRKJeoQr9OzIhvj2QVq0cUfpS58Hd6WHCPnzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLHFV+cZZXwgLllfP9LwS+129jV/GHkYYBawGkpsCO6mwZb0eswes0tO8opYS5Lh1QIbOCOfrKyMnHh8X7DAnhOWyAGVpGwEBws/W5SQEJ93EXJvuCDSPncHPCuIvNTSH6isCGaRItN26LT+sYzWsrvFUkJ26oj3xJedT8yS+qE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hncDHGmG; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mSL2tt1X; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N5PCeA1162449;
	Mon, 23 Feb 2026 04:08:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=T9Io2fjs6fJBGvZ/JA
	vCF1AKNQcdC/vyVAhq0rqz22s=; b=hncDHGmGd1AhpOShMysrojl6rBpFLvXs2D
	LDR4tNO2KDaLCyYjWuWvlO4J2cyY0wa5OK/FFEsGT1cmN48ssJh8D3SJ3CRxescQ
	L6HyC5HuP0iebLqgfWh/rcEp5kQTS+CnidyUqcPw8TmkSyZ0ocTFskoV5H1tpWW2
	1smOpim+1yEIZdzdc93u+l+xwJBWsfiC88uYYyQCTRDSdkwJX5YWKGXPapbfPTRB
	4+G6pR8HvGi3jNkVzQfMNGg0tHDFgn5+H2hcvsVjkd0k7ib/Xdfuw00obspySydN
	MBoFSUJsLMr72mzeKQbMDPT13s3DZUlHvvsfnIfiMi81ho79GdDg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022101.outbound.protection.outlook.com [40.107.200.101])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j1cyq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 04:08:56 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTOYuJNqhRMo2xpm+sn1saH6CTWJXrHfg2G4QAcvXG4Nx2Fl7jNdJ6fOzR3X234yqxAxka1JK0uSKVLKq69RXh02K8tchs5hJv3khADs/aecjg/8IGb34UYsgJKHJQGZiLGbwBMlC103kPYXhq2T/PA4txxJj1Ajsac1HxBJbyGPiEPou5VZwpGlc0AyRQeDvps1jWuyUos6ilCuvVtuMBYPDApvOlmjBgJ+MVxaOFBD+YBzVGYMIL+j+095gCGrygCfxgV6sVcZHW8qc2jZXan8m826qKbSsnwFJoed72fLuX1cXUPhAdPCz/ZuoJ904QLKVPXHaq4LNtz4IYh/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9Io2fjs6fJBGvZ/JAvCF1AKNQcdC/vyVAhq0rqz22s=;
 b=h9TOJCDR7NXRVb51lVlBtPYyFuhIZDbJ6d7nD91gtI+HS56fUfqdtahBwSRbFnMc1fEuxL7OPo1+LQFtFxnFABujQBpHx5QSt/IuTESaZ1nRneTE18jF6tnpuEKRHnHvqS9WykTFRMqouFgU4NixgKznUnqC2Y7FgDvUBMe59By7SwjmKYzE5MO2Y8bt4816ej+AMnG2XPo1He5RUCTRHml7jM8iFj0mtzQxQxu1wT06T573OPUi97W4HIaFF9tnM7mWA6RQwIAQDGgGzx0BuU26C9katmZYwWouHU+QONp/tPA5rcBjqQxpb9jeqLMWhC5XVYRN7JM2S5vbC3HrkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9Io2fjs6fJBGvZ/JAvCF1AKNQcdC/vyVAhq0rqz22s=;
 b=mSL2tt1XXtFo9vylSR9cI7HGRlf2m1HxK/nCp1qO4CY2xJpH8J8PF/yZRFAyb4qA+xaRFF8xZM4dqZasS5QiCF9pgwcYeFC0x0WxRGXLck7DF4IWfGsszqhYFO1HX+5PM5WveSwYKB9fJziRK0327A7zxBKecDORVwR04b/TlJM=
Received: from PH5P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::11)
 by DS2PR19MB9316.namprd19.prod.outlook.com (2603:10b6:8:2d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 10:08:53 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:510:34b:cafe::a8) by PH5P222CA0010.outlook.office365.com
 (2603:10b6:510:34b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 10:08:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 10:08:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3D885406541;
	Mon, 23 Feb 2026 10:08:51 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2ADAE82024B;
	Mon, 23 Feb 2026 10:08:51 +0000 (UTC)
Date: Mon, 23 Feb 2026 10:08:45 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Linus Walleij <linusw@kernel.org>, Haotian Zhang <vulab@iscas.ac.cn>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: cirrus: cs42l43: Fix double-put in
 cs42l43_pin_probe()
Message-ID: <aZwnLVUf5GE6tKh8@opensource.cirrus.com>
References: <20260223-cs42-v1-1-431b01a6f537@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-cs42-v1-1-431b01a6f537@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|DS2PR19MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f13bde-037e-47d1-95f4-08de72c38c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027|54012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OR8FQNIwQrLhx2cJ1JEgUliWC0jh6derXYCDjQVnmMD17eRlw0Edpene3LOx?=
 =?us-ascii?Q?QiDjFHqt78r/NPXsT67XXb77puGkKlN+tKcKntALf4QgBwU+jPXKOH0W/qOO?=
 =?us-ascii?Q?/aNbB8RY6wb6m2F0LO7IlhbjPfqUDYlNg0Kg0LTLi3ZI3VmjNo4SZzChuzVc?=
 =?us-ascii?Q?YFK7Dqu0CTC/IvWjteyMeZHHe3qokaFVemzKoWH13tpN+PP6njwLoTk22Y52?=
 =?us-ascii?Q?riIhaDC0i3PpiAkHn3eeRHAtN4WpsU64C2jNOf3tWtR6bfxewpFleapqdIzX?=
 =?us-ascii?Q?uAl+LAW4ji2ysfokn1eS1kw9yeM+zRVwaVRorrOMu8UI79OEJUSN2Vks2E5x?=
 =?us-ascii?Q?AkVJOgmxwZKShPQAsikP06GX8sin3mWmZGXoNPhgjBiii7CtRZ/EKj0Kl460?=
 =?us-ascii?Q?l/l1BHV1PLrwjDEOSyZ0+blt8PZG3N26vPfcek/XOSpu9OZEmc7Pe3StIfE8?=
 =?us-ascii?Q?0jmezzwjL72GOv2+lAn3OslmMhRub0OtQmIydY4GGYra/2aDWEQ+n3s7wXkB?=
 =?us-ascii?Q?fcZtb06cFeuA9nHkbxGpN3W2N5YmmhBeh90elvf7YqTAdMbiLfi4di3K3VsB?=
 =?us-ascii?Q?idxcDd1g3IPf+dRzfFUAZiVGpUGs5rnJOdYf4MNGimCAAEPbqvuzUzRGkSF4?=
 =?us-ascii?Q?Ln346Kmb4E/hNBlwSm77WcUfwXomASJ4VRnD4HH9yJEJu3He1W2ZPgYCriMZ?=
 =?us-ascii?Q?v4Ps+nNq/aZt6HfCTA9KdbMq0Y4yqxcA0z15nh3jwCVI6+isCL8rPu2JIEw4?=
 =?us-ascii?Q?mgeDFkGFGddMPi++95p4NXvzkI+w8cRbGoVjxUIUcWZ6phx04kakp6YvqoC3?=
 =?us-ascii?Q?xG9evr1+i2VX6tTPq8LzugJNV0t6fjXgLf67qGhqwVsHY2F+0sJce7uoCBZ/?=
 =?us-ascii?Q?oRno1gWJMJurwP+4rxY5qcPL368794P89J5bLX1dWRUssHlbQO+YmuYy8Q2e?=
 =?us-ascii?Q?oQWbNWgBXdtPLr25q8GAv36nJ+N+TiKHChpc+pLeKHi0M35d+IZgNpCPfZ4G?=
 =?us-ascii?Q?3/QbPd4BuZBzpSfE55khPpIFXB9Mu2JNQ/yErF5Koe5lNP6cnpxvDPOwYAEx?=
 =?us-ascii?Q?zADXNOClosDno7mBrU7WDLhjnnkA1tlI9N9FBKxJwnCcthdlOgxxZ4RD2gda?=
 =?us-ascii?Q?BzNeWx2DlTvHlmq09q9gF25DqYtJoW0DvXo2qAZXQjd050uzwxXQ/0y2Y22g?=
 =?us-ascii?Q?2ohnKHqCw8r2/aUcAbQd16ug2MSCRhMjb210AEHfkVxdn7cPGUwqqHW3MoyT?=
 =?us-ascii?Q?UMVL12mo3qAtKUms2VIPkWBT74AEqM3FzyrWxXP4/Ow/a0Yshah0Je4P9Q9b?=
 =?us-ascii?Q?at2BuHTlmhcAcX+htp1/ub/p8eXHP4CcsPKYDgl3eHVykqihoZmJCq5g/aK1?=
 =?us-ascii?Q?810wluR/Ax7NzSaVHWxVP6kBMyWmy8woOf+uxZsDYSoJFy0SJqk5xcYbJPZ/?=
 =?us-ascii?Q?yiSg8EzUJ7ShNo0aLAVb3WZItaqKLbBzgmIUhIQhWyez7IZKnqV++xMjru/r?=
 =?us-ascii?Q?jawdwKoFd1JpGzHUH0SQ35a+ZGhvoN+v5X/lLf1baj4f47r/Q4s9/dcIwjsh?=
 =?us-ascii?Q?910JMo73yVB6A0/zCFi8TML/Q4Oc9OGWaPnJ9DwP7JDyzfH5UPq8ws+ukr6d?=
 =?us-ascii?Q?idsODvkiKxxmRdKVQeIqItNZNuticT4fc9Wn/dAABbTK5t01R912RO5CR2Dx?=
 =?us-ascii?Q?ygN3Dw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027)(54012099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iy8LiSXNXo8j+anmuEoXjJaNur9SRWjhQuqxRGLDu4qW1bT+kkDqbrDA6yP8rCOT5+noqd8ZZzXtDR5QIvabTz3doPu08WTA02DPCLJQxFjsPMmtk70hd0G0kwJbrG5MvgaWDB+CncJKRRkwNnQM/wx54Fjxuo7kSnSnRyh0xnv/yDp1U6sOXwMo1CzMK6AkdxIB9TTQxmH0AMzPajwO1AWwGw6c51M4CB5Q+eFQ/n4EABwt63GMTm23xOyXpyJGpXz8b2qgYhdNZ0xuugYv3lYlFL/tJl8RIRYI+PAhVrq9EzhxoLdVLTs+N2Nf6VJo4oyDy5KAdyWxuaT0tFKZnbo2X8kUUcdnsze+0psPL8/q40cWvFwXS70Lm13NrefrElgNLvmlCl+RKBLizpZfYcrGYr2rIOn2klJMd0moDEDxXxdfeAlGKK4m2As2P0m/
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 10:08:52.3873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f13bde-037e-47d1-95f4-08de72c38c06
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9316
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NyBTYWx0ZWRfX/hl8XeRP+zdN
 56JZTlzemF+kNDkExzBZZAwLlNBClmkj7BpWuKPCH90qNtMjCt6sWu4AK/zqmzqkOS2eR7k82lt
 yQXsXmLLm0X3NdYFC9GlGTnvp3Oa1g85lczi4rVsxLSqw6bDzcjwgMo0EOXEC0SshX7B1bgU9SS
 EPARJ8f45qOUWB4H9Hvorok7g9eIS2O3JkV46lyTvlEP3zNIq4BM4bz4uKSRw9gksMmw7qk5++x
 +CTuUdqXroBStEdZ13qB46u2GyQbG6YKvM44r9Dh26V0TDOQV1/EVbCDBLckbJv4cO0s9NBr1ms
 duCG3swNL165knMH/K35tokt+Y8sh6sF8AvhduvMlHaRyR8jIhZr676CBRym9hfB/D2OWCXFg9N
 WgCqZfDZBstEPrvaTlWaaBKVS4ObDxy0edmwSKuQxeGl8JLkRxeanPYvffWwgYH0jNbfETA4Gno
 SNDHvKpL8mVVPPbDwTA==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=699c2738 cx=c_pps
 a=aqjypfCBT7xgBBIDtMg2Ug==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=42pgw7ev8VzYzdz4is8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: sNomAB94jxnqVNo_1HQY5ZqNK1tbAgfL
X-Proofpoint-ORIG-GUID: sNomAB94jxnqVNo_1HQY5ZqNK1tbAgfL
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32029-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[opensource.cirrus.com:mid,cirrus.com:email,cirrus.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cirrus4.onmicrosoft.com:dkim];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 93CF0174AE5
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 05:39:07PM +0800, Felix Gu wrote:
> devm_add_action_or_reset() already invokes the action on failure,
> so the explicit put causes a double-put.
> 
> Fixes: 9b07cdf86a0b ("pinctrl: cirrus: Fix fwnode leak in cs42l43_pin_probe()")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

