Return-Path: <linux-gpio+bounces-31645-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oH3hD3tIjmm9BQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31645-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 22:39:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 750ED131521
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 22:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 46AD03013D74
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 21:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AFA35502A;
	Thu, 12 Feb 2026 21:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JWCFgxuv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D96529BDBD;
	Thu, 12 Feb 2026 21:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770932316; cv=fail; b=SuM4m/BNiGkvWrqSmo1GatJGdo9vUbNbp/z1MWuiKFkf/L81sgy6NKLjaP5LTvekFNy8FTArU+c4KEIXbHeLu5HnoFztvDN0Wq3R3JLJ9wyr0yoyP/Zn7H7CBveXUJpu+I4uUk6ZhoKqtPkJxWu3Cn4KZFMZ0uAlxcQzlsrS5xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770932316; c=relaxed/simple;
	bh=jj0ycAATLEu8OTnq4VC1hmg35H420KPHi+G0LEJq/Bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=nSajXOvFg93Se9W1LkkayhkrAAZnVM/I+eE5963E5CHN9No2ETn/Iy1Py2C+YQgBUAIq5z3jJq6EO4D//oe2io8WUfqNalZax8k9VURC5Xoca92yfdgwSdtAHdL75buMMCyeq1gixqfJhUUtHX2uLCd/gFR53T3WKwxIeY3cpi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JWCFgxuv; arc=fail smtp.client-ip=52.101.46.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGSE91gs03zgZvtwwC19LuDV5N8RnUBqRaagIOiPOexiUKjQussslyTjLk9qqYieXsXtNfnNhQg/zmVwrCIimPsrH2J3mIW/SK9HrBQBr3Yg5QJ0Nda/EZJ+oH0OLrR914a7RqKmGwwI2rx6uKk5CK4dKY1xZ+F6xLuuam4QgZIXF4I+nX/dNKwMY/xCjDw8j/5n+r1QPU19zVrBGMgKTYMEHOXCVV2cfK8inRP4qz0lqwdv0wexM2FlGXUHVQctHdacRBu/YmTUWwhJ7CI+QX0vJ5QeCmN4hhSqCCJbrdqqUt2F6xbC3JaycD3xDFbUTZwV3Zvz2ce5Ch4YfTBwSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+6zrowkqYHEmMiNBgFqqao62IWRHjgrWtm0SrJDens=;
 b=M4Xp2jbvYslW4Nr33s0Zzngca0YAvip3s4FCFO/uO4l6YUe0D/ysSPL1zTPGMDVuqIqJXjOPDUe7XunBVvRjGDEnTokKA9IigcjdUDCWmaJzqpATXutqIhB8IxDL4THtQmPezEsTzd7Q+fBaiKEi6AXac2BWEGh0fbErJN1J2cosYmJ9jNw8BrZZ6aVqTAiLMWTzNMWXibh7t7fWoBTBcccM3q2WWYkm4zAC2ELRbueCHarErRng3MSpuHvhVvMMonqm18XtqTyT8tM4mcDGwSRoeWTF5nmwCY9RPrDnIAiEvcRYqTrlzUt45946hzPr4+cLe6w5PnHs5xdcx1KYcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+6zrowkqYHEmMiNBgFqqao62IWRHjgrWtm0SrJDens=;
 b=JWCFgxuv+43Frs8gPmkx255bwb6MWFFLo2yMJEAsfc0zoIHmr7hWBhjR2+TSoA8SQ2qO110dqa3OFiARaSpHGID7Gqt2Q8XBSsx96za1vu22NUsf1FfSUENxgwKgfw5s0JsGV7Jn5J2TDKxnj01yHegZI54gQptnxoAGhEwt3iY=
Received: from SJ0PR13CA0105.namprd13.prod.outlook.com (2603:10b6:a03:2c5::20)
 by IA3PR10MB8372.namprd10.prod.outlook.com (2603:10b6:208:575::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 21:38:32 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::1) by SJ0PR13CA0105.outlook.office365.com
 (2603:10b6:a03:2c5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 21:38:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 21:38:30 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 15:38:25 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 15:38:25 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 15:38:25 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CLcPvw019741;
	Thu, 12 Feb 2026 15:38:25 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Thu, 12 Feb 2026 15:38:09 -0600
Subject: [PATCH] pinctrl: pinctrl-single: add ti,am62l-padconf compatible
 string
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260212-am62l-padconf-v1-1-0bb6f066fabd@ti.com>
X-B4-Tracking: v=1; b=H4sIAEBIjmkC/x3MQQqAIBBA0avErBPGAQ26SrSQnKmBslCIILx70
 vIt/n+hcFYuMHYvZL616JkabN/BsoW0stHYDITkkSyZcHjazRXiciYxIk48OrQ4BGjNlVn0+X/
 TXOsHpMjrGF8AAAA=
X-Change-ID: 20260212-am62l-padconf-ff5f6050107a
To: Tony Lindgren <tony@atomide.com>, Haojian Zhuang
	<haojian.zhuang@linaro.org>, Linus Walleij <linusw@kernel.org>
CC: <bb@ti.com>, <vishalm@ti.com>, <d-gole@ti.com>, <vigneshr@ti.com>,
	<sebin.francis@ti.com>, <k-willis@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770932305; l=1587;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=oZAeipa0850VO5Wjjc5hR76uErlzOyYo4kpVuXHR0TA=;
 b=7h9h9uyr1CzEeoeRDNerWVv3E9eRtX6k6vJXRk4cKQ907J5Rmbg1x3QcqPcOGE1LFKGwchGE1
 CJODTpBN1ukCpdgVZEEZs7PZ+r8HAwad2da5ILXEoTuGQl7vgqrI6xu
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|IA3PR10MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: 635986e2-c9c4-41a0-cadd-08de6a7f1072
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzlGbjdLUkxxNlBBQU95MjRoTk5IRXpOWkdmaHk4d2tPbXJLYTVXZElWd3pB?=
 =?utf-8?B?VlU0U1lDa1lLOTVaNEFna2pwTWRMWWlQbjhVSVJaN3pVQSsvTnBGNVdGaFdk?=
 =?utf-8?B?Mm5vRk9zSXhEdDI5SVVCWjFhMnd2WFNqWkZobGhFVXRQek9FRnl1SVRlRTdy?=
 =?utf-8?B?c2JSVnB0dm4vWG94TDZkQkRqaGo5Qys3REpWT1JKOHVObWZmYVNXWGlYOGRK?=
 =?utf-8?B?Qy9WMVAvU05OSGQ2NWowb2Q2dzNFYkZrMDRTTXVtdG8wVHZUaEdJM0xmcnQ0?=
 =?utf-8?B?czFaZVlVNm9XTmNSM3FXZlUxenJDRlIzb2NpRlhpRG02a1FhRzhxK1VkL21Q?=
 =?utf-8?B?bWdnc1JzUHN4S3NzK21JQTkycFVrWWlENFU4WThWUURFNEFtalhaMmdoU1hT?=
 =?utf-8?B?cVhTTDdDWXVoeWVkaG5waXU5Mi82MkNxelluQTdMN2xzSTdWWDJ6dXVSaDR1?=
 =?utf-8?B?WkozOHdTVXYweUxjVmkyUGVuekUzVEtuZkk4bElGWUk5b240QzNEL1h3VHZG?=
 =?utf-8?B?UWdGeWc4dzR5SWd3bGhBdm1wRldLS3VCSWNkVGRmbDkzOWZLU1hMZGNtSEVr?=
 =?utf-8?B?RUJBdS9nN1JlNW1veDA5cFBCSWxUS3AzNWpCNTJRcVJ4VGNoRnBWL0Z5MHFo?=
 =?utf-8?B?aUpFWituZTZwS3ZSU3NmeHRMcXNIbjZ1aEpTTEFNZjF0cUhaMEFnMW9WQ0ZQ?=
 =?utf-8?B?N3cyanJqRll1K0duQlF3dWhMRzhGM1N1Z0pBN0VKU0liWVpNSk0zMWlFOCtl?=
 =?utf-8?B?REtCTHE2NmVrb3ZXaG5SSlM3MkNpb2NOZjBqVWlIMTNCQ3U3RWtjUncyWnVY?=
 =?utf-8?B?bGlPa09CNExBUGdTZllUNmtFelVpamcrRmhtWDNkeFA1M2xQZWJUNjVCc0Rw?=
 =?utf-8?B?M3Y0bnAxcWJydzdwSGFTRUFJTzZJaVVGNEpvbmtub21BRkQxY3UvdUdPZHFW?=
 =?utf-8?B?NmtHcWNFd1ZIaEpJUlZIT2N0MUZ6N2RWc0ZKSGFiY0dzZHhFMEpsZ2g5Q3dL?=
 =?utf-8?B?VC9INUtGc0RwYTArK1NVTVRCVEYzSXVKeWdVYnJnWnN0bzN6Skd0WlpPRC96?=
 =?utf-8?B?V1pzNHRYUHUwQlpsM1VMNVdiSSt1WkV5M2U5ZW1PSVl5bDJyRkhJeStFRmNL?=
 =?utf-8?B?a0RwbG1uSkozOWxWR1hsWXppVFh2OUpEWEUvdHNtaisxc1IxWWZndS90L0tB?=
 =?utf-8?B?QnNGY3RWbzNsRDJaWjBUNk1hMlF5SmRudXBWK1lWdGlDVzE1TTEyWWFoUnRi?=
 =?utf-8?B?SkIvWC9aaFIyMzMzM085QW80TVdvVmpzVDJ1dC9CV1hKdnh1Y09UU2JVS0Ix?=
 =?utf-8?B?WFhkOXovZk05MlIzeTNYK3RDMkxYMjN4cW1WZnhSWnRVcXJ3MWlKd2I2WWNq?=
 =?utf-8?B?UFA3Q3FlS1lFTGQwUWhuTUxzNG9ac2xMUjRtMUVQZG4wSHhvazNHWDdrS2J2?=
 =?utf-8?B?SkdacmZaNlN2YnhOZExUL0dHYTJ5UWF1Ui91bzQweFZhRU42ZVBna2pzb1NR?=
 =?utf-8?B?aXVxOENBM3ljMFM3MDE1VU12aUViNUo0UEt4VzU1Q1NtSW9uRXJCZStNZmpP?=
 =?utf-8?B?ZlZ6N0RicFFYODZOUjFpMUM2YTVQTXNNNGh0RmU1T0ZocnEva2llcEFLM00y?=
 =?utf-8?B?V0Q2REk5YVY0NU9sQXR1N2M1WlVDRm4yeTlCSEFaME1Ed21wN0VXVG02WTRF?=
 =?utf-8?B?WXh0d2g4QUs0Ni9PYTEwNXpFZmVldTZDSVY4d04wVU5KNzdZOURDbnM3VXBo?=
 =?utf-8?B?NmlNKytKYkhhK09ONXBZU0QwUVdDOWlmT1UvQmxqN3UyTDk4eGpHU0U4aVhr?=
 =?utf-8?B?Y2JMaWZGb3VTeU05NzlkODYxUnNhb3I0NVpIbUFDUDVnNXg2cENMNTJmZi9p?=
 =?utf-8?B?VW16bnQvV3RvZjRyNnJNTG4wT1ZRbmh0bTY3d01mVTRUZ2lWYlA2SHhWdTJ4?=
 =?utf-8?B?NXVCeW1UTS96d2N5emovZkN0T2hIK3JURzJVRTRHalBTM2lGc2J6VStXZU5s?=
 =?utf-8?B?Q3RJbHhaNHdBRjRFa0k1VTZrdkxoOEppLy9md0xuOEx3eEN1Ym0wTVJSYXVo?=
 =?utf-8?B?dVFTM3VOcWtXYTFGYWwwUjNrRlZCTzZHRGFJdW5oQ0sybVJQbHBTMDdTNTh6?=
 =?utf-8?B?a1FabmlqYVhjbVJCZGcvcGlBUTZyd1EzemVqakhabTB4NmtvaDNRZEZUejNp?=
 =?utf-8?B?ZSsrQnpjVjNMcUhlY2IrYllEbVVWVkdUc21UOUU1NW00Q3BaUWIrbllnRnhM?=
 =?utf-8?B?a2VoQk1mR3RicXcvSzVCZ3J0R1hBPT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9bUcG9pEjRw09V9gioxk2pxb1vVvCt3VBwzzm35vMmE6Av0pGXUPAGRpskW5wgmlcESc5vr8TL3gDGfrTxf590qRyAyi9284BGkPOqHYYSyOSTYFe6QDwSPJaH+2OSkRJxalRb4rEIU7jgo48yNKbsXrl9qSawl0jRhOozY3OuzlrqevIgIlIo8OPolwdpvVdV/U6RTMjtecR9sLE5gxnZK1kmzbT+eAlAVKz/Qe8nmXmLfKmt56G6ufgxPsjkJkPvPRFHsb/uVsa50l83wSed2mmaWSyum3QHyO1JY75za1wkvlmvhT4eDqogBrlvKMPXmcNGSjcDYiwo4o26uIs6uMtknpvLkPGXMMl3LYveSK5CwAQXfMmHfGGA6eN7vp+JY2SKdpkkOo4IZ+F1ra3F69AQ41DgFfLbWNmnwy0oKW2GGaMIzw8YeFub51tOVO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 21:38:30.1210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 635986e2-c9c4-41a0-cadd-08de6a7f1072
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8372
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[k-willis@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,ti.com:dkim,ti.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31645-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[ti.com:+]
X-Rspamd-Queue-Id: 750ED131521
X-Rspamd-Action: no action

From: Vignesh Raghavendra <vigneshr@ti.com>

Add "ti,am62l-padconf" compatible string for the AM62L SoC, which
requires register configurations to be restored during system resume
after suspend to RAM (RTC only + DDR mode). This reuses the j7200
configuration which includes the PCS_CONTEXT_LOSS_OFF flag needed for
proper restoration.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Kendall Willis <k-willis@ti.com>
---
RTC Only + DDR is a low power mode on the AM62L SoC where most of the
SoC is off except for RTC, which is used as a wakeup source, and DDR
which is in self-refresh.
---
 drivers/pinctrl/pinctrl-single.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index d85e6c1f632186b36e95b0b1338a7644ae751f99..288c9c9bce9a5b1cdfa96f69e6a104152439789f 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1980,6 +1980,7 @@ static const struct of_device_id pcs_of_match[] = {
 	{ .compatible = "ti,omap4-padconf", .data = &pinctrl_single_omap_wkup },
 	{ .compatible = "ti,omap5-padconf", .data = &pinctrl_single_omap_wkup },
 	{ .compatible = "ti,j7200-padconf", .data = &pinctrl_single_j7200 },
+	{ .compatible = "ti,am62l-padconf", .data = &pinctrl_single_j7200 },
 	{ .compatible = "pinctrl-single", .data = &pinctrl_single },
 	{ .compatible = "pinconf-single", .data = &pinconf_single },
 	{ },

---
base-commit: af98e93c5c39e6d0b87b42f0a32dd3066f795718
change-id: 20260212-am62l-padconf-ff5f6050107a

Best regards,
-- 
Kendall Willis <k-willis@ti.com>


