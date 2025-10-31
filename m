Return-Path: <linux-gpio+bounces-27913-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C19C2689F
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 19:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BCFD54E3B4E
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 18:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC31D350A14;
	Fri, 31 Oct 2025 18:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vZ0VgQoJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011001.outbound.protection.outlook.com [52.101.62.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE752D0C9C;
	Fri, 31 Oct 2025 18:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761934542; cv=fail; b=C6bQv7tvBnm0pxwMiuykuMk21f/PewblOhwYV8GjUcSlyS5KZDpsq3cPXk7Zzqu7+rZ6KLFp39b9NZOTNSUfGqliIWDpoMYtYxEGCim94cGzIoMxPfTPiWXWrR9yVtb5fAzFXtSH9rfVfi4klg2l91xpKFdLGcUYrxliVa/fGrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761934542; c=relaxed/simple;
	bh=ddj7VGJHugQVbtY/5mHCIXJDx/IZcapAJibxfoZLP8Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxqV/DuIODlIuJnf6595dM6MBWUmDHWLP/pASLTbXkpBkCCTj7epsoEhlp2zwR15k1jRHBuqXmkLt29OjIeVQdgTD+ctjs4Py7Gsh7KS4L/3+T58xm3OzJsZtx0EoR4XjaVoz/gxbnhbu+F05+L8EJyHL2f42eEKHcA3tMpLbpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vZ0VgQoJ; arc=fail smtp.client-ip=52.101.62.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TE0M5BOVMm9aX02oGC322qYAKvaIe9j7KV+NqVtTm0N8qlAbKPNr0MCKYULNYvwkMRsOTyzlp3kJfRsbKnp7phDT45+bcohCi4MHmXKAoOhEvIIT2mhxUI438SCmwzF4NTPMcPj50/UXdW2iPTnO3Al2BdyWui/KZjEouPGh3McZiut2uOnFYsAm+tT6KyTUXkasEX+pwXfkii0LthGFXN3koq89vRNHrlZEJr4s5wZOzamfJMkCTtYCe9cDLo/so5kKsc023aG/TQk0XpM49NyKKkLE48WHKbcgyLvpsxfpaj9HfsHCB4Xv57ZffN7+Qw0RrBURPmJhKManlml1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZRM1IIGA/FI/TVCSCkZ8tjEPNl3RLBRr9FnwfLBW34=;
 b=EgyCS7NdJS+tEVS6OIUqAw1FLStDfxdvFGEVHbYTQPVfLAZr6WWFJdtDwqU+CUgT7+BVHCeGzfsFl4TyMT0oM+dD4araui4xJYmksGNaRy8WnHleZROzrbJ8GH5QWH5kk+pYW0Nq/8RzOC1/8egpkZ7yZ07TquYm0MBBxjpRXH0Uo2tlJ8DZxV1YNssbxE9sYMlxgDi3/F/9CgONs5ckj4/ClhURUvHAw4OG2OgJXi1XAqLlNuhpsfM/k11R+NH478t8Bwnbo/+ZW3RliBvmcuNzdxT02wU+ZPdvZOOYeon+F4CJ4ze3tV1TYuNcA9FbkeMnID0ToY6Bsbt8AxEeiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZRM1IIGA/FI/TVCSCkZ8tjEPNl3RLBRr9FnwfLBW34=;
 b=vZ0VgQoJpZYNcK4gXhxtQFlTz0kdTmd2ZMWNjA30o4q59M/KmZu1UPiDb79oEfCi16LtpYWk63mzekXvjDCfu635yTCL7d3Hw2BNieecInfhYNLF1IcgIw1rcj8pwq7Wj05GZuZFCcS9xxqNbPIrtaihfdx71UPK64f4mPu8h4c=
Received: from CH2PR12CA0019.namprd12.prod.outlook.com (2603:10b6:610:57::29)
 by SA2PR10MB4426.namprd10.prod.outlook.com (2603:10b6:806:117::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 18:15:37 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::ac) by CH2PR12CA0019.outlook.office365.com
 (2603:10b6:610:57::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 18:15:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 18:15:35 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 13:15:24 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 13:15:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 31 Oct 2025 13:15:23 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59VIFMlF138654;
	Fri, 31 Oct 2025 13:15:23 -0500
Date: Fri, 31 Oct 2025 23:45:22 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Bryan Brattlof <bb@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Andrew
 Davis" <afd@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "Tony
 Lindgren" <tony@atomide.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v7 3/3] arm64: dts: ti: k3-am62l: add initial reference
 board file
Message-ID: <20251031181522.kkt622vlemiqfb2g@lcpd911>
References: <20251031-am62lx-v7-0-cb426be9d6ee@ti.com>
 <20251031-am62lx-v7-3-cb426be9d6ee@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031-am62lx-v7-3-cb426be9d6ee@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|SA2PR10MB4426:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c732a8-b6bd-4835-807e-08de18a97cf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|34020700016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?USYezSX+DvV7pr6oP2T0w0sTlHJ6QtVTR7D0uqtpTno2YYMO1JO7RBCVFnQv?=
 =?us-ascii?Q?/vtg0kC9uxI/I5Zuj8HJA1jk9SQDnfxBL+J0ucS5lLxk83G1MG/jr/NVX8lH?=
 =?us-ascii?Q?SPlxBsomvdvAxZF73oTX/9JEJUUcXk/AvSe+/HnVGQWD6baf0+TSTSpcmbeO?=
 =?us-ascii?Q?aJqZ5/6JK2PlbTpLcwKSa8qxgy0ujKUjaf4NE/JvwwytJWAGmYtOAzj+RK7i?=
 =?us-ascii?Q?jGYts378GxSoyLFhF4vTh+NSaPMteBX56OxiyG0fQwspknhdxoL956H0x63g?=
 =?us-ascii?Q?uy7UkxeTUIGDzuno3y8052gOcwNNfogs0x5cXNYfyQBrRRmxGOHhhttw0Wch?=
 =?us-ascii?Q?n2sTSMd9Xpe+bqFf720wZ1Q1mNjaiKloGCTzMx555gyNIi3RaBdj//W53VWC?=
 =?us-ascii?Q?hqjJ/UyUs6HWxL1wCFsrghUj3ExUfhfYIQ4XMn9u6YNX0CKVkIEiwhQE5cFd?=
 =?us-ascii?Q?4AO0y1yjmeBQW0qDdrpHwPrGYeM+/Xs+4zg7D+nJ+URY5mZ2qwimXXt12SCn?=
 =?us-ascii?Q?Ugj0YcwNTHglvoGmcFI1/QCwSXJkY1HOc5O/Zb9Gbue/jyIILGfG2CYRS89/?=
 =?us-ascii?Q?56VbPF3LmJ6jmP5UBye8iL+inbNjiEYEpy87htdWHn2ALkrxE0/4bL215npC?=
 =?us-ascii?Q?qL9qSnjxCS5rq7pq+CUKPV/6ja63DSc464i5/Xm2I0DJFcpntlpJdsC8LbGZ?=
 =?us-ascii?Q?pOUo/qZXNZOfcDSfOssIRqjQvAvaj00h0mfSx9RLeeyZ5iBLh3zf96nkAv/2?=
 =?us-ascii?Q?BDGO80wHfSpUaR/Bw4SgExKuIHFGZCrlcdF2jrICO9L58Ip57bMZS567Qrmf?=
 =?us-ascii?Q?1xE1mOuEzl7ZfRONfUftq0Ct91vVpIzOBizvUFQHMVbreEKu5a0M5BNPHOsa?=
 =?us-ascii?Q?r/WgPG3au8HB4N9xHMvvhFbNngSM3p2oBlJ4TEI49QpbaRDNV6xRKWCpHrdB?=
 =?us-ascii?Q?9saQwM+Otcd2D4EQCzm0HZkaQDZpTJ4+HKF+oSGk3p7syKrC9lr05ZUmW52w?=
 =?us-ascii?Q?Z3uNUVtTPomm4K2uPLnUE+ehEzOR0EvQ7/+iMEMR7zi5/pWpR3DlwPOeppBf?=
 =?us-ascii?Q?2tY5WNHDY9JMdqumrWVjxZ/qbQLan2L+vmsM8yh7BraztWzG36ij9lqmFZxT?=
 =?us-ascii?Q?acRc+3CgnYOJxBIsrQWg/WS7B72A72CnD2bBrAClfEE1naw/ruEXWcjiAh6Z?=
 =?us-ascii?Q?JCTB7MyVi62DSPu5UuuQgsQvzdwbgQuu4vVfurld8PnoedAzIJAjqv9587Et?=
 =?us-ascii?Q?jLvSGUR97yshWqbJYgp52e1JsSCeaa+hX97sni7CgzIJf6MGzgUq2HrIBukM?=
 =?us-ascii?Q?JyqxnWjnaScDQ4DmvJDW5DhLsOH/QqVHdpDDiP+egZR5vNcTNuuHK23mLbqP?=
 =?us-ascii?Q?k6+TucShZjA10ROy789U7erNk0p4Obn6U02uGseB8xXWDcpjxXVaEFw+Nhwk?=
 =?us-ascii?Q?mbCC6RyndldTo4zZ6KE/ajwXcAuRSO42SwdButX3RT3744d9itkUvwuXY2Yf?=
 =?us-ascii?Q?sRO44X1a/UmX4k3DFi/cLuYz8MQPiwFCKPiEL3n4mvwlzskJJ7JnTRFcOYZo?=
 =?us-ascii?Q?oBGkPwZi1Q722EGe5MU=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(34020700016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 18:15:35.7488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c732a8-b6bd-4835-807e-08de18a97cf6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4426

On Oct 31, 2025 at 09:08:06 -0500, Bryan Brattlof wrote:
> From: Vignesh Raghavendra <vigneshr@ti.com>
> 
> Add the initial board file for the AM62L3's Evaluation Module.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
[...]
Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

