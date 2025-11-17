Return-Path: <linux-gpio+bounces-28594-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B63D6C64744
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 14:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 942093664A7
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 13:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481AD33030F;
	Mon, 17 Nov 2025 13:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="Dlhl7xjH";
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="Dlhl7xjH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11021126.outbound.protection.outlook.com [40.107.167.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4B1330335;
	Mon, 17 Nov 2025 13:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.167.126
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763386757; cv=fail; b=HEHeG30RMufO1MNAUoyz4rHd8otTuroCzmJiAIsfZgVgbx/PAH6Vs92uLSmqQPtb4BY8ik9ID67JPJ9lGySbskCKSVU2XyXf4WkFAgkA3TLzFDxLPmjzIrkO/mN67bJMMyhxfDbVrU9n62M5ajHYTPSOIBYiu4S9t9N7SeuSqhQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763386757; c=relaxed/simple;
	bh=2tgYyBjHBmpexgv0cqTZzyqjgbGVigwqof1IqWKB3GA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RqEA8Wb4UW/LKjWzrK3nTot/S80ChgVP2od6LO1rYqgxd8JyHregjOsmwG32YX5EplTzyVwmw7QRI3kcmWRgCy7XPUVAGZIZ0zNtkPbe2ZYD2//3yE1+2dqPuvEJY/V4HTFiNbtmYWORKReqSPYwBGltoECQ0N54HvwgXfyzSks=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=Dlhl7xjH; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=Dlhl7xjH; arc=fail smtp.client-ip=40.107.167.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WzDzOi6rK7nBIYKLvOGDxcld+PXuGFST7f+h1KjiOhc8qPS3nVXizbEiNHPpCT7P97UalhjE9TPwOmCxjUiP0/c/exB+25rS2VYFn7tB/Hx8IO/GGoqjBuHrHo4c4xyTRj0VhWWxWcFb7qA21uc9fVLlKiQbDiSbou7mbP9XfhUqKPaLRUcU2NiOJmBMRVrPY04O6fN1rcmdYGkgmbKQgG9z8l7HeFptftap7VcxciXlQ7HnDaOfVxcSAqT5bRAv7Dti7yWgxXN+9GsJYQVU63P3Erp9sFqSGCQAltzuZ1cajce5c7SoH1LGEmbQa1eDTaBhUdlbC1RVCDxYKIUa7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kkmL6sQ5VJxC0vB8huOAyFR7Lrd78Rkzck9gB+ikgg=;
 b=Ho/RaLh1gTS4/5ln4mYFDGyZhvkZulmDGlssyCx44gy4o0oHHqu+mwq+DbOM9kWQCOUx54j+ifmcpZn340H22Ff9dYA73YZpgWLN93FCaCRSbJxg2Ak5DVzOwOwYMu/H0dZbxLGNrE2JDoAvjvOR3FezMuyjhub0DHjDUCrBQqYYbNzsXqoJM6oo42r97iveaj8r1/1iDaLiuWkGyebMXf3QI9Yl0Efha8cJhfjS/ywT1PWkrg6gblWs7oCTbRdjQYMC5x2dmPMJOLC5Lo/RB6pk6RsItg1y11Gn9UDeinaRSMFbvPIIpJCWMYtO9X7v7RjaSWCbuGR9VkJjsCB4pg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 194.38.86.34) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=pass
 (signature was verified) header.d=duagon.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=duagon.com] dmarc=[1,1,header.from=duagon.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kkmL6sQ5VJxC0vB8huOAyFR7Lrd78Rkzck9gB+ikgg=;
 b=Dlhl7xjHwbUzjygakAyFP3UHqMVcKZPEsIUYn1+QwhyMACaETt3QieQbwzc9KwVaN3mxmrKlKDzxBoz90I1LaxgzV5pTLI/PlwsXO1G+arOPCd+Rc79VtWt2pZ7YwWhr8LHlkq2C/ZtcTfCA+y6i4evyH73VJOJUBdiZDihI+O4=
Received: from DU7PR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::29) by ZR3P278MB1700.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:8d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 13:39:12 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::2b) by DU7PR01CA0008.outlook.office365.com
 (2603:10a6:10:50f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 13:39:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.38.86.34)
 smtp.mailfrom=duagon.com; dkim=pass (signature was verified)
 header.d=duagon.com;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 194.38.86.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.38.86.34; helo=securemail.duagon.com; pr=C
Received: from securemail.duagon.com (194.38.86.34) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Mon, 17 Nov 2025 13:39:11 +0000
Received: from securemail (localhost [127.0.0.1])
	by securemail.duagon.com (Postfix) with SMTP id 4d981Z6ztFzxpB;
	Mon, 17 Nov 2025 14:37:22 +0100 (CET)
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazlp17010001.outbound.protection.outlook.com [40.93.85.1])
	(using TLSv1.3 with cipher AEAD-AES256-GCM-SHA384 (256/256 bits)
	 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by securemail.duagon.com (Postfix) with ESMTPS;
	Mon, 17 Nov 2025 14:37:22 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFiTvDhnlbhR2/XFQEsUBiB+9GCyMfrg627BPSt0OxZ6WFyVQs4egbtj365J+EzbItOxCUsssHT2CGP/8J+d6HTSnyRpCAsuT4PVD1XMRKXcKfa4tPy0AcpR2h8m1HozztAmvkwm0hBhtV32eXHAqPV+xVBBc5GeV5vG8lh0l5lrSzHf+ktqMfzGit1cc/46qHUNxsMMBDM1FAGwYNXBExauNodMxEQ2tP+sJ2hd1KkXJbsfIMIjUssKDpCqxe+WAVltNy8Uwcz8HVL9dG6mj+9jv2hfZkpH2okIMnWEYhhG8HL4htsXGQZj7eyOiZm9+krYfwe8paPv7PJ24HKCag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kkmL6sQ5VJxC0vB8huOAyFR7Lrd78Rkzck9gB+ikgg=;
 b=gx1cJEX9DFH4GeoPcZCU5BUI6U4rTqH/2QFH2jQW6FDnmdEFWg/VfYH25WYSHcb0xmu3b6u3BccdXagLJCm1Kl9knE9RXWDNABlKutbFUWGzeqDRnHG5jkV/cDKnDPBzgx3ysTXMvuCa+fkQi/XtGgReBTiZvV97dDG9z+BO36k3iNfdEbQWgZDMROO9r/eefRev5y7X/tXLSNYT2MmCKFdCPInZL2gkyYIRl2Z1LjwRneXnHA65X/9jsOjxPjRX0HaxYcDhZ4QY38S6sSOTCm/LMIn+f9iB4wYnGGJLOhemn8LBWVzIS6P2aq6wP1i1fvzlyA2ElzahUtoRuHLV8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.79.222.204) smtp.rcpttodomain=kernel.org smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kkmL6sQ5VJxC0vB8huOAyFR7Lrd78Rkzck9gB+ikgg=;
 b=Dlhl7xjHwbUzjygakAyFP3UHqMVcKZPEsIUYn1+QwhyMACaETt3QieQbwzc9KwVaN3mxmrKlKDzxBoz90I1LaxgzV5pTLI/PlwsXO1G+arOPCd+Rc79VtWt2pZ7YwWhr8LHlkq2C/ZtcTfCA+y6i4evyH73VJOJUBdiZDihI+O4=
Received: from DU2PR04CA0158.eurprd04.prod.outlook.com (2603:10a6:10:2b0::13)
 by ZR4P278MB1882.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 13:39:06 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::37) by DU2PR04CA0158.outlook.office365.com
 (2603:10a6:10:2b0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 13:39:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.222.204)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 20.79.222.204 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.222.204; helo=de2-emailsignatures-cloud.codetwo.com; pr=C
Received: from de2-emailsignatures-cloud.codetwo.com (20.79.222.204) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 13:39:03 +0000
Received: from ZRAP278CU002.outbound.protection.outlook.com (40.93.85.0) by de2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 17 Nov 2025 13:39:03 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 ZRAP278MB0899.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:4a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.21; Mon, 17 Nov 2025 13:39:00 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e%7]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 13:39:00 +0000
Date: Mon, 17 Nov 2025 14:38:52 +0100
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: menz127: add support for 16Z034 and 16Z037 GPIO
 controllers
Message-ID: <aRslbKpI-aIUip2T@MNI-190>
References: <20251111161817.33310-1-dev-josejavier.rodriguez@duagon.com>
 <80a20b13-7c6a-4483-9741-568424f957ef@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <80a20b13-7c6a-4483-9741-568424f957ef@kernel.org>
X-ClientProxiedBy: MA3P292CA0027.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::13) To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|ZRAP278MB0899:EE_|DU2PEPF00028D09:EE_|ZR4P278MB1882:EE_|DB1PEPF00039233:EE_|ZR3P278MB1700:EE_
X-MS-Office365-Filtering-Correlation-Id: 970c7de2-34b1-45f5-9355-08de25deb10d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?GSOw25rX2AO0a234HFubGHr+x05rH/NgxRwnD0rFnC9/Gy+XmB/k25skwypB?=
 =?us-ascii?Q?wwx5jjJgIKT3VoJqXPzbxmiJN1J0kRfPTr9B829c/ZaTCgTlndRJRePZHTU7?=
 =?us-ascii?Q?kKxsd5A2uvSbWJjnntmL1hrE9VH8ujacr1F6pa1msh0jQsSlkCn5e34auRFO?=
 =?us-ascii?Q?W+95i+CdpwbUsPGe0x5RGC/A160rrRPFKC+p8WgS5Va6LTDc4C4uLFBlV2eD?=
 =?us-ascii?Q?yKR0DICgYAXvMiEBInLoeYHad49ELUqF/wWZRKEe/fHIIImBymCcLnXt8Qtk?=
 =?us-ascii?Q?t8SMyTp4bMYi+zNwxueBVFLlhGEJTG6pPnu7y1JLZTWdFH6SFNONb3c8ODHX?=
 =?us-ascii?Q?A4qjAviICsbgSqJfwx78sk8be5RWl/NkvKgilvKevC/R5EyZieQYT6sBLJuD?=
 =?us-ascii?Q?ymrCd8UtgdhiH3uRH1uViv4gIV7CSnxE47xEZIf9vAobuCpeR9WsUGcEXkn1?=
 =?us-ascii?Q?BD9offvi6xohPmIuV8p6EMvo8KQktid/SQzLJJRgwoeyTGif6XMAo4qLJK1V?=
 =?us-ascii?Q?zkYdYqCCbJjWwRp9cougVfHeNIaczZrl4Bv/6Oaj6VWr7HyOixyhWhqUPvZX?=
 =?us-ascii?Q?3GQ62BPtAvKXLsc8nZCeF0Vp7/U8TSAL3XNIZfLt4TCkp4pNOfmZDt6gGn4D?=
 =?us-ascii?Q?f2N1TbVdxS2Ap7mudaathiFrzT+tviKinVIhbRI1CDl5yBO83q2K5nQbRUYX?=
 =?us-ascii?Q?h7fL8iQ8Mzh+hDyQV1PKvIUr8WgXicl3RxzYpCKpyVMQhwKJ2hGyl3i/RBrL?=
 =?us-ascii?Q?JsAG7yAi9P7mIT/Qf46bEGnC4V/7HbVr47IgY5jsluGJz427QoxHwb7PBnnO?=
 =?us-ascii?Q?VJxeDu6UGdWwkMpp3han8vrOK7wDcqywb3WUC1VC+H/1EbswpvDdkLg3i9Ut?=
 =?us-ascii?Q?cqrDkv8J6yIu0UjEsIDBpDyC1bfVO7qPpHLiSZPVvj285UkhQZw4p/ZsD20g?=
 =?us-ascii?Q?yWMx3u9ZlqMnvg9b/GfCEpqc0R0uNhZVd0PRovLpyEADnsySsM1zJRa4gdAh?=
 =?us-ascii?Q?MSOVvVDykUCy4Uwqi1+B/lvSVCdZrku+UGZX9iXul9wfPj1nIy+diVJ6vRkr?=
 =?us-ascii?Q?9WK7hk+OcEkTijpm4xscy5ZGPwnsnxQvfLEidyirgbDzLOKDZ1eZdz6OPiPH?=
 =?us-ascii?Q?uIZLtn3rzY+u9tEsln4POAgl/9aWFUm2N2qwICIzO8HXpjc6ukNgxD+YuYVF?=
 =?us-ascii?Q?QpHi+UFLEJe4IVHTqfHk2tPb49CB2bMhPDXn8g/o1UNnKfA3WRES7YWdo0BG?=
 =?us-ascii?Q?yVAZ4XmFyXFQ0ZRYX61vy5mVX2JRH9fvzGqEnfSVAXmf7jfuLyr/0/nfZ72j?=
 =?us-ascii?Q?UtJQC0heSvk4BXyc5evuhhLDPg40pW1L3U93LollVkmupe2p0VF1/rYfkBfY?=
 =?us-ascii?Q?xayayzvJHQO8vgeLTr35qh8VvyoILpPaN4jiE+GiV3L4KYgZPgmHA4vF3ClP?=
 =?us-ascii?Q?udlrKtK8JvOmApwyk0lVyHaB9N/TyQz0zqh4fMcV8d4SEKBqVfhlJ2yO7Rf5?=
 =?us-ascii?Q?nA/QJON51QhYOounSySFUnteFWKG42rHIkfz?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0899
X-CodeTwo-MessageID: 88bed779-d2c6-4865-a247-3b6bb2d22790.20251117133903@de2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
 7829a6de-b265-4872-e147-08de25deaa05
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|35042699022|14060799003|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?09uXpwqOT6he4fTIzGT6TXYsZ7XEfTgBC8mll3GTVap/ROSmeb2O+wC9RJto?=
 =?us-ascii?Q?fgh3RMYn00f8AJl2JEQESzzUq4wGcvX2MqnA8isU24OT797H+4QAAM6q5MoO?=
 =?us-ascii?Q?1nWLcZnKRowZiF5gvAH1AwM8hRE/OZ1cERnMBELgNx0iuiyICwCfC+vh5e+G?=
 =?us-ascii?Q?U7yHe1Ue5RpgS3jpfIjkYf3gkrYOOs4DVe4aaWrr/dTEg9BrnbRLx3Gverqp?=
 =?us-ascii?Q?7s0jBlrEU/K6V0v8PsucQqoiNGG2zqINENaCs5mY7nYXqdL8oyWqWbQgMYND?=
 =?us-ascii?Q?f6vOh+e4Q7gP4xszsM4ZNAUZbkeREnc8bGe6uwOhUv0y2F9RbHvBZF9OSz5a?=
 =?us-ascii?Q?vVj8AMERA5kBuv9oWk4iOeE27QiBiHx/E7LWyNkK0cvOPQ9xEYB7Cz7wheeM?=
 =?us-ascii?Q?rZocaauUHAFX6EAD0ThUppwzM5TrGFSammp6Gl880TeWj7xrEeRtAll+xY6N?=
 =?us-ascii?Q?edGMA6fCXDI07wxk1TH/JDUxBSDDUpKT9IufIrLCWD+hnZVveYb7MTzKfGqh?=
 =?us-ascii?Q?51/MlS8jgiNYWtbpw+9c69jhTFnwWKmNoX7Ur1/wlOBWWLRHh0oFT1U/nlIi?=
 =?us-ascii?Q?VnN9PxRAr0+IFoe4fhkfyO5NeNa8L4KpoQXEHaYzhWSpet3ke8jAlp944WPX?=
 =?us-ascii?Q?GjemmbKo/pUwUu9vAzz+BMtweZxNwUM9z0uwOw0ZMxVouTpFUxQmpLQeqXSI?=
 =?us-ascii?Q?LtseSQ5QJ2toK7eGMZJJ4XZ1YiTjILeiwbvu03onaZg6ZQnKPKIujR1NehbX?=
 =?us-ascii?Q?y57/IOmYiyP/xkk3BtlmHKKjhXUsiB/XADYC5/nIHKeCFxNYz405tuTiI319?=
 =?us-ascii?Q?30Kaohga+n2UebyxUKJYGQR+kX8QGCNyFsxyoTVYD8cp9mjXQAzBQFReanQZ?=
 =?us-ascii?Q?NIW0Hijs8hq22bRN2sLwda4JY/yavRDCis3IBR8SjOD++/e+ZoNWkwFiIFdm?=
 =?us-ascii?Q?cqxQxS06lr21V2O3VgzKoJFevuCaIqzFWt00ff6LY8ndvHmauUW6ghdstNyx?=
 =?us-ascii?Q?cGTnGQpp7KLla6+vFmjYOMIQ8QB9gwam42FdV8nonTiC2OWtOulghD+B18Ag?=
 =?us-ascii?Q?qcuVEjxcFy9Pofl7PXD0wCjyFX/4IiCy1cuOZfRb/jY+uYTwe6IR1rJkz/Tj?=
 =?us-ascii?Q?wN/gi9rd4JklwBZfXtisE/XkJRNrtMX8ztj5BIkw8bS9g+rb6DYbkOQYPV/V?=
 =?us-ascii?Q?78bB9BD9T1AKQT2LJOw2DEkxu44QVFXpkcl+N7M4QIdsjdnIioVm8Fa6AvU9?=
 =?us-ascii?Q?QgipQmkFgp50KJKRJ7iC2Q79kjF27gvYGBZh9SANoqKJf19IWoXMrzGjS+Bp?=
 =?us-ascii?Q?cPrwggtKBT0/Jtv87sjPXngttgutIVFWalBbEBH19XF17h2B1Gqe6gaAXPUT?=
 =?us-ascii?Q?Bzw8jMmlZZ6kZNB8/irVNq1mcUqCKd40sfgqvveIHbv+qWcjB2q+qbCg0LTd?=
 =?us-ascii?Q?JAtw8Vs13/yrByVEOTksP5UfltYSpqdWSQ0kGd7qq92Ea84MH7Veunj0LyBX?=
 =?us-ascii?Q?1WjZ2uLqohWKRwE4L/+/pAIoApj61ZOxG/f9LZPxbru+UvNVANdLx95w8SXq?=
 =?us-ascii?Q?2TtEymQFxHgYmwWdgMY=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:20.79.222.204;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:de2-emailsignatures-cloud.codetwo.com;PTR:de2-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR4P278MB1882
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	25192bed-c730-4173-d9b3-08de25deac8e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kbHadP9nB5nIRk5JcMqBMaLFsDIo0c43y0vNele931t+H0Eu0IisRRYT7J3k?=
 =?us-ascii?Q?/pXXKe7UsTDpcc6DPEEeWqlantYy8LYrUOsUHshly9Dmshs5cLOWh/AzTpfa?=
 =?us-ascii?Q?2Q/plAphovMwdtWOt2Jjo2OwR5v5shiUhd7ecAWwvTz+8yY+I1duOVJx2TkO?=
 =?us-ascii?Q?DJdivixr9ZqzhHXwOmgvLv2OhV3PBSmwdKPvY5dO9i2hMKRFsysLyjpy5JE2?=
 =?us-ascii?Q?CMg7qRk0oldjmkKHf4F6HlC1LEIzYPl8aUZHXSv8YIaP+1xoyvxZ2HL5cVoV?=
 =?us-ascii?Q?IvSOdwQpGA43RdIVzThSVjtDWZhfbObqxp2zIY4EFBq+NpB8LNKHWhtTetKy?=
 =?us-ascii?Q?lKcn1/gM7sVuhdBt2fir+4NGCPT+yWoGWDvVnAy21MHJT/FBk3yVGrS5CvnB?=
 =?us-ascii?Q?qOrGIyTaWtJfXf90n+PY1g1T+EZb3HedUHU19cquEjPmg6Fg6peJAzPqyCp0?=
 =?us-ascii?Q?DE9psdmIASXArF2ZzbHvh+uEYhCWHHWLD11w8eo0qeaS3Xe3FoSubduq36Rf?=
 =?us-ascii?Q?yugfOvOd61HlricI/3bUlVzvMgJz+Z2Cenm44onwJUuxQq7yluXvKBv6SDms?=
 =?us-ascii?Q?yaG5QWX0eenigwvuH4tGolBA34pri53lOtDBz/V37YfBYeT1zAgq25q8pNH6?=
 =?us-ascii?Q?9YfYp48xerNZAgU3BinClVvchD/5pN4o2voj+W337SyfIoxA4a+0GOo2193/?=
 =?us-ascii?Q?hPytGdajSsWrZ7W5PKe9DFVa9PQq3Po77XM+cqZuNxUuICFsRMDQXxpvz4yr?=
 =?us-ascii?Q?3pA6MR+0+SJGujD7ggQvvN42u6KC+p1+gfLRabtlgRrCUJeA0Ioa/NOQX756?=
 =?us-ascii?Q?9zwyf7egjvZosCUKFX3oUxd11H8Y2S/oMfqyRwFHCH51cAmjDkrfENM2s3ls?=
 =?us-ascii?Q?uVRcALgIwsevV/4Pjh8WosshYGcxeNhNMurwMx7Ap1Qyb+TnUETWuPCbf4Xc?=
 =?us-ascii?Q?AMOCfNPzVrI1IyKPDHnCFrYPlJEytqbiPZ9hAe+kjTaa3hpNBXvVCEIBkVx4?=
 =?us-ascii?Q?PbkmkW9kg/gyXoAKX4C4r0d585GMggtRYI2lkbecheUmKmtAKjox5Fcruh6F?=
 =?us-ascii?Q?rGUbadirf3AipISUANPZ86iNTvFbWUXk2pwJQFnaA1+j4IwW+pMxs00alxDa?=
 =?us-ascii?Q?QLoBMNhBee67CUBX9UTiw0fzcAXaZ/gJxpgyzAe1Enp37/ZNAwrK0IDC9t4y?=
 =?us-ascii?Q?Xmw9q39MZdGdH6oE83oVEocRQTukAgyFkSRazxhRER4OlyXUlapbhU0c+Ox7?=
 =?us-ascii?Q?NBo8w4FkWE//bFa1VWjme9ox39nfAFSSPTUpSMK7eG4l8h/6owm2TkzKCF1E?=
 =?us-ascii?Q?MsrxbF0yIerZKYskAm+1L95jm60p1q/o4Fg3QEVWPmeZJQjXaRvbrSOWNWJ3?=
 =?us-ascii?Q?NT3hXo+POBeVFtmSbKvuofnai//HV+VSFUYQ/S0GF9cyxNZd/Maa/zS149O0?=
 =?us-ascii?Q?IS7p36E9Z3n6y7ZefUPVOLJDvVt4+ziEd4THnoEp+ZZL0VVC3eKqUwhbhXFe?=
 =?us-ascii?Q?yIuzmrLevwLuzRpBZiisRztFcNsjKSHavctMpv0czNp0w/ot5tGi2P5722aA?=
 =?us-ascii?Q?ka/D2/SL8ScJ0NTY1D8=3D?=
X-Forefront-Antispam-Report:
	CIP:194.38.86.34;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:securemail.duagon.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 13:39:11.3690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 970c7de2-34b1-45f5-9355-08de25deb10d
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[194.38.86.34];Helo=[securemail.duagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR3P278MB1700

Hi Krzysztof,

Thank you for your review.

On Wed, Nov 12, 2025 at 04:48:53PM +0100, Krzysztof Kozlowski wrote:
> On 11/11/2025 17:18, Jose Javier Rodriguez Barbarin wrote:
> >  
> >  static const struct mcb_device_id men_z127_ids[] = {
> > -	{ .device = 0x7f },
> > +	{ .device = MEN_Z127_ID },
> > +	{ .device = MEN_Z034_ID },
> > +	{ .device = MEN_Z037_ID },
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(mcb, men_z127_ids);
> > @@ -204,4 +224,6 @@ MODULE_AUTHOR("Andreas Werner <andreas.werner@men.de>");
> >  MODULE_DESCRIPTION("MEN 16z127 GPIO Controller");
> >  MODULE_LICENSE("GPL v2");
> >  MODULE_ALIAS("mcb:16z127");
> > +MODULE_ALIAS("mcb:16z034");
> > +MODULE_ALIAS("mcb:16z037");
> 
> Why do you need these? You have MODULE_DEVICE_TABLE() just few lines above.
> 

I added this new MODULE_ALIAS() because it is the mechanism that previous contributors
used to enable autoloading of mcb device drivers. After reading your comment,
I decided to investigate further how the MODULE_DEVICE_TABLE() macro is used and processed.
I discovered that MODULE_DEVICE_TABLE(mcb, ...) was being ignored by the kernel build
system. For this reason, I'm preparing a new patch to add support for MCB devices 
in file2alias.

Therefore, I will send a V3 patch that simply removes these new MODULE_ALIAS() entries,
and another patch to add support for automatically generating module aliases based on 
MODULE_DEVICE_TABLE() instead of MODULE_ALIAS().

> >  MODULE_IMPORT_NS("MCB");
> 
> 
> Best regards,
> Krzysztof

Best regards,

Javier R.

