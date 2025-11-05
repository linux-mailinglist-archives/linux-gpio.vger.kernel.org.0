Return-Path: <linux-gpio+bounces-28132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAFCC3690F
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 17:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63D4A1A26C6F
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 15:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9BE337100;
	Wed,  5 Nov 2025 15:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZrOZcYV1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010065.outbound.protection.outlook.com [52.101.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2597315793;
	Wed,  5 Nov 2025 15:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357621; cv=fail; b=WhklD/6HFUoFH0EF8+rcbakzU7cn8TWVeIxEIDyM+LlCWjNJm5J4SCyBiB0xBA84wtq75ENhh5r02yuPxkjxYqhXuCG8rMoEW1h0MlWtouxnxKrIze3ggh+Df1Xlc5wvxvegicGy2G4q/BkCUHoesAfgEC2PtOuteSw2MWxQQx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357621; c=relaxed/simple;
	bh=Q0MfKNQ0U3gzgSzeFdHCqVj/ay196/QRtlIjkXU/3ao=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=eJ8gR9uPPT3GdKmqQQ5fAwsdNxaLyEPSKqwu337W9Haw3mWqJLrLzL6PEiH8K/0GA3E6mXJlbuuU46uATEK7amPxtnOgAjQYriZa1mhwBQOJcyvUizETQTxW8lF1PpO3pj6jHiW+LHase1+9MDEYFfoxRrAFG5STXydBEtttDho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZrOZcYV1; arc=fail smtp.client-ip=52.101.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHOZSYhl58NkO9A65OT805Ybdra9PXCLC6XOcQJTAM7zPRMAJz9BEGbmLFu82xKipy+L8zsmZAMDVO+CB2tSyYLG87xWufbAzDYEjmG1c5BnOoLWanooDp7VSmxcMzJDYzGWNlZH0oqBE/ES5MdjMeLCkLWvntPwgfmFHsqLV/28+Zf5nqaQsyadJkKio+4wfyTgGI0Y7jRQ+uu5u9h38K5YhGJ6OQt+LU8/vDTTZ190erD2YmGYkWWE+/sbxqAHDH63EJbptSgTkQ4sd3aTeRz1bE1r7JJFSZ1g00ilsLFApuXcBxyn5oIxNuk2ASeucGhNlnG3EKSTle+6tXI6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWfKehLp/wtNbB5mFwYEo5mbheFj1Q8SN5DNzGNZQAA=;
 b=g0OQcvXY91kSP6of0fsISGCjHmOX0UxDKJNjyMWNI3wY+WF5HDY0SBFfPQTcQ+JYINfYvexgCmmRVskLTrzNEY3Hplqy9idRYkHGSPhVwQ497HTd02GggCEp7y08R2qLtHTyyJiCTljPwclxcX8AW2L40yek/x/dVSPQDFT/3YP4JhAIfcOhGzsFRcGMmc/WxMHqNhBO2SutO18pH4Jl3Ha+5Zs+CXy8p2IW6UQP3YktBFf+4tk20KZKCBIGvyfi3KpksRIxpdm5m6FAx4bnKMS+5T7OH5YbpqWYBx9qKgZZMVeu7l1WX1rGbgE/O6/UoxymEmkkqlHhz2vrQI9HPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=atomide.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWfKehLp/wtNbB5mFwYEo5mbheFj1Q8SN5DNzGNZQAA=;
 b=ZrOZcYV1cenITJFIsexUhVf2fkY9w2gGwXkbeBGgGN23IV/s0BRk0ktK7SdCynVtVBPSF8N5s2ccYjkgBuze9YedgZ3jXKj4rhkAGtWhS16AoqLdZLk/A0jN0awTLmbx8lWYm9zxc9GD0s7dVwsrWYShX8wZZlFzyrNipvvgzJU=
Received: from PH7P221CA0065.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::31)
 by SA2PR10MB4427.namprd10.prod.outlook.com (2603:10b6:806:114::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Wed, 5 Nov
 2025 15:46:54 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:328:cafe::90) by PH7P221CA0065.outlook.office365.com
 (2603:10b6:510:328::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.9 via Frontend Transport; Wed, 5
 Nov 2025 15:46:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 15:46:52 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 09:46:46 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 09:46:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 09:46:46 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A5Fkkfn3901018;
	Wed, 5 Nov 2025 09:46:46 -0600
From: Bryan Brattlof <bb@ti.com>
Subject: [PATCH v8 0/3] arm64: dts: ti: introduce basic support for the
 AM62L
Date: Wed, 5 Nov 2025 09:46:41 -0600
Message-ID: <20251105-am62lx-v8-0-496f353e8237@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGFxC2kC/1XPwWrDMAyA4VcJPjfDVixL3mnvMXZwbGU1rM1IS
 ugoefc5hSTNUULfD3qoUYYso3qvHmqQKY+5v5aBT5WK53D9ljqnMivQYA2ArsPFwc+9jsFbz9I
 lJlHl+HeQLt+foc+vMp/zeOuHv2d3gmW7JFAbzWtiglrXyAYYQ0OJu49bfov9RS1+al6N30xTj
 HSGjBB7BDoYuxuraTO2mCieyPrWS5CDwd3gi8FibIskgYnFwcG43XhjNuOKadAzIEdrWlzNqVp
 v4XALPmFw0Wk0xz5tfaObvU/LH60F14pPTvY/5nn+B2r5pi3JAQAA
X-Change-ID: 20241220-am62lx-ca9498efd87e
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Andrew
 Davis" <afd@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "Tony
 Lindgren" <tony@atomide.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	<linux-gpio@vger.kernel.org>, Bryan Brattlof <bb@ti.com>, Dhruva Gole
	<d-gole@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5642; i=bb@ti.com;
 h=from:subject:message-id; bh=Q0MfKNQ0U3gzgSzeFdHCqVj/ay196/QRtlIjkXU/3ao=;
 b=owNCWmg5MUFZJlNZ8CmS7gAAaX////9rcn/9f7v62+udnmW/rfr6858X/dvv+nsv2D/H898wA
 Rtmg4g0ZNDQANGmgMgGQANA00A0ANGg0NNDCDQAA0NAaBoANqaDEeiaYyj0yhyANBo0ZA0aaGjR
 poAGgGI0NAxDEyDTTQANAaYEaZNNBo0YIGmQyAaMTEaMO1DNIaek0eoMTQZPUBowg0aNDQ0A0Bp
 ppoxDIYgDQAyGjIYgDQDTQAMgAGgLFoRyFECeViAwYQecZjCoKb0xOFHmhSBEMVZiqrnAXIw3Ey
 Jgy2RS9gDkT9k99XzBfr0lb9SLr9E+Tz3paOHxvIqomKhnFLyWu/xatAmqD9a6hufgfWT5ENYGm
 qAFoZDW+RorZIi44knuxNdOVhIM4yAUB25r4NrMxOGZUdp3c2DwDnslYBwQZFV1QosD3mgTCQrD
 8VDgAhdsFKsDTe1V/EF8dpTGSrGCYlj8UjEdEjGqbI3ibP7vg9pQhygRb695FNII+Sc+Kvboocs
 fMatXy0hUmcM3X9XE4hL7BLkoC3k3CTYu3ZqkLF27/FKvKE2303R3pZeBLxocgtY3Fa0cEffrJs
 0f2uBRD1baIOj+pwwPuFIPyFiij64Vrlx781e75yjU2zevKDkmVVnAv0ZDRZwgsY6wxhBh7m1h9
 EYYYw6lEm1/i7kinChIeBTJdwA=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|SA2PR10MB4427:EE_
X-MS-Office365-Filtering-Correlation-Id: efa8f244-1776-4539-566a-08de1c828a41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|34020700016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkNiY1h2K0Vpb1M1RGFsYlZMSlNKc0NGb3hlZGJWYW1qMjFpei9oTUJITGpE?=
 =?utf-8?B?VklhRmxvb3dvL2tyeTFUR1k5MkU0Z0kxVFVJRW8ydGQrZ1Y0UEt4M3UyVUV4?=
 =?utf-8?B?SlFERTdpd2IvbWlZaXZSc2RWSGIydTR4SDkvd1R1MSt3NUNHSHNsdkozZG5j?=
 =?utf-8?B?VzJrZ3BTNDdLR0tGclhYUEhjL3B0aEk0OTdoTDltVzh5TmdCMmNWaFJGOVAr?=
 =?utf-8?B?SFRFMXQzekRmVUUyMjNxdndRNEFodFBpWFArdXVqMjJtaytBNUp5UUhDNXNs?=
 =?utf-8?B?MXNGamhvVkd2YXEzVmE5aEJDUktBUndaVXE5Nyt3dk1aL1RBZmpwMWdMWXZo?=
 =?utf-8?B?RWNHbGRMNnpaVjVUOXVWYVhxTW9zY2xld0pMbGdQanc2YXl3elRKTThQWXlt?=
 =?utf-8?B?LzNxSUlXTnBWTytsWElZRnpmZHNDOTJicDR2VFBKWWw4TmV5QW8yMFd2NXNX?=
 =?utf-8?B?N24wenFNQnhzWG5tWFNGUm0wN2Y4cHZLTTRWdFFkdFZyYnk4cmZmemY5RjRS?=
 =?utf-8?B?bi9YaU5OVlUyMWVTN1JyRVU5Ull5Q1R4SVZpN3c1dHR1L0F0RlVJaHg5YlIv?=
 =?utf-8?B?YkhPQXlOcGlvRWFVcTJEdXZ5alZGeitTaG5qUE80S2tncThFSC9icFdqS2o4?=
 =?utf-8?B?N1ZWTndWVEhRc0FQelBWdjZ4NEFpL0NtRlBpRGxSOTRXSVBRSENBVGM5YlM0?=
 =?utf-8?B?Z1U5dG9rakF2SjZSMXJidlE2WXM1WEk0L0VETHBZaGlKNmdsdmlhVWxDeGJT?=
 =?utf-8?B?djBDZ3AxeWxjaStIeHkrOGcxV25TQmgwU0ZKL1NtRTFRdW9FUzJ3R25yV1hK?=
 =?utf-8?B?ejM4OENZN3VDeTJISlZzWHoza2RLeCtNaWJId1RYbDJ2WjVLS05JRGFjdTlr?=
 =?utf-8?B?dVFtV3NDK2o4czgyRG82OE5mSjQ1R2hIRzA0UEk2aU1hZFRLektnU0FBS2xo?=
 =?utf-8?B?bngvQzhsc3p3RzMvc2FYUzdLMzVaNVVxNndBeGt0WUc1a3BPSVRUK0VvVlJQ?=
 =?utf-8?B?RVlKby94YkhoaWJ1TDlSWlNZWkNBN0JOL2xVcWJTTGNQOGlhZ3NEclNxckVz?=
 =?utf-8?B?dEVUNGx2b1dMTUxDdGN6eHcydkx4MlNGYXduY0FNNHFaWlQ2alg4M3pDUElZ?=
 =?utf-8?B?NEk2K1cxT25TQkFPcGhtNmk5ZUpLQmN0cDF0V2MycmN5K3JPSTJySE9ybHRH?=
 =?utf-8?B?SFhONkdVUGg3c3c0V2k3RlFVMktqNytuRWNtL0QxMm5iVkIyanMvNVo4eFhs?=
 =?utf-8?B?V2JCcHJZTEFhemQ4Nml0S3N5Y0xYKzFiM2MzZlhaY1V6YVV3UXFXWHJCYTl1?=
 =?utf-8?B?WlhVMURGNFdCQTBqVU1Ic1Nma0ZhK3FtbnIvcHkvUURvSmRnNVo5NFlNL1B5?=
 =?utf-8?B?eHd6SFVMbFg4dHJ6K0YxeUV5SzBWR0VpNGhHR2FxYk94ai9ZM0N0ZjhTL0F0?=
 =?utf-8?B?UnpHeS9jdlMrZ3pnYzZydDQ5K0tpcWw3OG9BNnZUWW1JK1BrR1psSEN1NUNu?=
 =?utf-8?B?b05qQXpha01vY0RlOFhDa2VIRzlFd2QvcW1ZNTFLK0h0VDZBY21yN1MySWhT?=
 =?utf-8?B?OEtmUkpPWFZXd0dFQ1k2aHdwMTdFZUxUbGdFN203L3FUdmt1QWtyNGNZd3U2?=
 =?utf-8?B?UTlMQUc0MHBuR3pIdHB5T2FnR011SW94N1huR0x5WHFNNGh6b0dtZllrMHJQ?=
 =?utf-8?B?WjRZN3BiekVoTEJYamExdGdRTENzN3ZFS0hPNStJa25tb29iaVhBTEVWOXlX?=
 =?utf-8?B?dmRQa3FSQXR6dTRXeFlWZWpBUlFjWUhXbzgrazY3eHQvOXZRcmszTlkxbnJq?=
 =?utf-8?B?eVN0azZacHlKcVY1Qzl2NlU2bVErWmYzdTF5eFd5K09zaHVMTjZTWmxTWGJQ?=
 =?utf-8?B?Q3ZQUWJKd3Fhd2tZSmk5Vkh2Zi90Z2NvR2RUY0xOT3pKeUtnNTVxRzZxREZ4?=
 =?utf-8?B?aU1LS3dhTmhzRjl4bWgra2ZuTTNnVEl1VW9vajlGZFcxWXhzUU9KN3dWL21i?=
 =?utf-8?B?MHVEcCsxMi9wSlFCaGlpOFdoV1hqSmgyQ0dObll5Y0lzZ1Fmc1JrVVJybm02?=
 =?utf-8?B?NWp5dTNBR0RHU3N0c3NpZ3oyWDRSTm9CdXZNYldRRlAvRVVJNGZyZW5RdEpT?=
 =?utf-8?Q?ZAAU=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:46:52.3449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efa8f244-1776-4539-566a-08de1c828a41
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4427

Hello Everyone,

This small series adds the initial support (currently just a UART) for
TI's AM62L SoC family.

The AM62L is a lite, low power and performance optimized family of
application processors that are built for Linux application development.
AM62L is well suited for a wide range of general-purpose applications
with scalable ARM Cortex-A53 core performance and embedded features such
as: Multimedia DSI/DPI support, integrated ADC on chip, advanced lower
power management modes, and extensive security options for IP protection
with the built-in security features.

Additionally, the AM62Lx devices includes an extensive set of
peripherals that make it a well-suited for a broad range of industrial
applications while offering intelligent features and optimized power
architecture as well. In addition, the extensive set of peripherals
included in AM62Lx enables system-level connectivity, such as: USB,
MMC/SD, OSPI, CAN-FD and an ADC.

AM62L is a general purpose processor, however some of the applications
well suited for it include: Human Machine Interfaces (HMI), Medical
patient monitoring , Building automation, Smart secure gateways, Smart
Thermostats, EV charging stations, Smart Metering, Solar energy and
more.

Some highlights of AM62L SoC are:
 - Single to Dual 64-bit Arm® Cortex®-A53 microprocessor subsystem up to
   1.25GHz Integrated Giga-bit Ethernet switch supporting up to a total
   of two external
 - 16-bit DDR Subsystem that supports LPDDR4, DDR4 memory types.
 - Display support: 1x display support over MIPI DSI (4 lanes DPHY) or
   DPI (24-bit RGB LVCMOS)
 - Multiple low power modes support, ex: Deep sleep and Standby
 - Support for secure boot, Trusted Execution Environment (TEE) &
   Cryptographic Acceleration

For more information check out our Technical Reference Manual (TRM)
which is located here:

	https://www.ti.com/lit/pdf/sprujb4

Happy Hacking
~Bryan

Changes from v1:
 - switched to non-direct links so TRM updates are automatic
 - fixed indentation issues with a few nodes
 - separated bindings into a different patch
 - removed current-speed property from main_uart0{}
 - removed empty reserved-memory{} node
 - removed serial2 from aliases{} node
 - corrected the main_uart0{} pinmux
 - Link: https://lore.kernel.org/all/20241117-am62lx-v1-0-4e71e42d781d@ti.com/

Changes from v2:
- alphabetized phandles
- corrected macro and node names for main_uart0 pinmux
- Link to v2: https://lore.kernel.org/r/20250108-am62lx-v2-0-581285a37d8f@ti.com

Changes from v3:
- added more nodes which have been validated
- added link to data sheet which is now public
- Link to v3: https://lore.kernel.org/r/20250109-am62lx-v3-0-ef171e789527@ti.com

Changes from v4:
- corrected copyright date
- used the ranges property for the fss{} node
- converted control MMR's space into a syscon{} node
- Link to v4: https://lore.kernel.org/r/20250407-am62lx-v4-0-ce97749b9eae@ti.com

Changes from v5:
- added new compatible for the am62l pinmux driver
- increased thermal trip point to 125C
- reduced size of &conf its correct size of 0x380000
- replaced dss with display: s/dss@/display@/
- expanded chipid to include the JTAG_USER_ID information
- removed nodes requiring parent clocks until sorted in firmware
- expanded &wkup_conf length to properly contain the &usb_phy_ctrl
- moved back to &wkup_conf as a simple bus and grouped both 
  &usb*_phy_ctrl into one syscon node rather than individual nodes
- Link to v5: https://lore.kernel.org/r/20250507-am62lx-v5-0-4b57ea878e62@ti.com

Changes from v6:
- moved thermal-zones{} into the k3-am62l3-evm.dts to allow other boards 
  to select whichever thermal nodes trip points they wish.
- removed dss{} for now until binding doc is updated.
- Link to v6: https://lore.kernel.org/r/20250912-am62lx-v6-0-29d5a6c60512@ti.com

Changes from v7:
- enabled &i2c0 node in reference board file.
- enabled &gpio0 and &gpio1 by default like with other AM62* SoCs
- Link to v7: https://lore.kernel.org/r/20251031-am62lx-v7-0-cb426be9d6ee@ti.com

---
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Andrew Davis <afd@ti.com>
To: Tero Kristo <kristo@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
To: Tony Lindgren <tony@atomide.com>
Signed-off-by: Bryan Brattlof <bb@ti.com>

---
Bryan Brattlof (1):
      dt-bindings: arm: ti: Add binding for AM62L SoCs

Vignesh Raghavendra (2):
      arm64: dts: ti: k3-am62l: add initial infrastructure
      arm64: dts: ti: k3-am62l: add initial reference board file

 Documentation/devicetree/bindings/arm/ti/k3.yaml |   6 +
 arch/arm64/boot/dts/ti/Makefile                  |   3 +
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi        | 580 +++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi      | 141 ++++++
 arch/arm64/boot/dts/ti/k3-am62l.dtsi             | 118 +++++
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts         | 362 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3.dtsi            |  67 +++
 arch/arm64/boot/dts/ti/k3-pinctrl.h              |   2 +
 8 files changed, 1279 insertions(+)
---
base-commit: da84d094ded6e332c88c67218faabfbf8d3d59e5
change-id: 20241220-am62lx-ca9498efd87e

Best regards,
-- 
Bryan Brattlof <bb@ti.com>


