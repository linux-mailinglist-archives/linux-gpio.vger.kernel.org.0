Return-Path: <linux-gpio+bounces-29488-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 720B5CB8DBD
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 14:03:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4267B3073FD2
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 13:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44919321F5F;
	Fri, 12 Dec 2025 13:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="PXbc6xJE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023116.outbound.protection.outlook.com [40.107.162.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A843B1F0E32;
	Fri, 12 Dec 2025 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765544623; cv=fail; b=cSN7GAzLNcfEBRB9CBZEyyS1q1eab6TBi2v3Va5RiGmxBZLCRIl3N0BJg9VeloXKCWvbyQ68Jw/K+pTOaszn5Zjj9sh3AWqrOWwFDxjC5ESYIIXnEo2MsbWtEpvgk0sKUHlcy0w1lJRq4gSyvT1crjlrTpxfypmXAGeBuRsxeDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765544623; c=relaxed/simple;
	bh=JpJRAodAivd1PmSqiDYD3a4jQ9z/mExBJdkGX06g5y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bOmFX8xvu1AlFbtjD+noA9esTRKKRrsMIW0UaNTqOSiQyTd+2dawfCTKy8oIqvAMiiC5AWha1JATRe49weRQTVApFF7kmkgTae/PwpDQLU2HU7ljAKTE5NJDEL49oLYVLZanuTHrVA28DitnMgQTh6vMwGzxAF8AMJt1CNUbJ8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=PXbc6xJE; arc=fail smtp.client-ip=40.107.162.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yl7LTkKFESxZLG6/InqPt95YGVGmK/q5nfg7hTsI347nquteWLoD6IiPp75xaOPlnyoto/tw458F36FFbdvaxsLwpFY21+KjGie+WYsZsxY6I0SzBy6o4qyd/PXZRatznfU+Xd8Or4ZMx7qHwDnK93lPRiJPnM926qS/iKxJN7xb3hFQxo0L5yIt9LBQBrypdR/pcbP64TtH0E7XNydcXdh2iTOhEOFPtpCa1GkFNuyM8+A8TwWGzebW/uZrueoJUTsNpv/aMIEO5gEH+oFTxk9USmz7Gaf2QlmhUJemM3ZfmaZlcZc73o0etmg8DKJdSn7nxhnMc+4EHRqSXhgNDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyzWep2w+Bh6EsF/FiPPpHqMF+KGam9JwV0q/uKgapM=;
 b=IzscP7nx56zXfEcsnjDdOo7Oyc8haggreYZ62kDQJKUbFFhudmonKu+L6Fw9Yp20BD3Wd/bLoGg+JJONHko1Up77EP0Z/cv4uvSfp1Va3gimno2GFyOYBGgSa1XJZ0duGei6QoMdGntSXScfyIBkdwv+/GIUQMAMtKl5l/Utl8WI86FSTIUty9/WzuQrwBjtgbZpJwIGpMGssgL+YoiltYaV5xPhxVjnoVyBNgbGGnyk8iCXKKkCo4w9T1j42z2osD4vO6SfG0sruiznLqKb9ZFohUtbw2DmOOvGBdZSH72M3Qnt2tabUN1B+GJf83ZldIfT9hj7D/n88+Gi0rjqbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyzWep2w+Bh6EsF/FiPPpHqMF+KGam9JwV0q/uKgapM=;
 b=PXbc6xJEjbsj/GOUGc30Qi+8xi5CpA/t6Shp4H/v5BRqk0Nj4/tue+TPetVFOO56riFMG9fk3J4ioosT+E+UivfAaIRJGjz7QcJIx6kLUlv4nW0zB4sxkJVx9kp2MjscjEukugO/XVRCaxrXjc471X9cVEzgQv9aTFD2LA6rVm9XAXX9EK9/9oy6iQBxyH9m0RJLJCSCAqCjaQQdriKTuJeCHgg5nWempN2JkD2r1MiNAkRDQebCyU2hB6nhYjbk4OTL26jla/cuL1Uxw0CaLStc1aTEe2v4SjoyYUC4LX51TZeEHEcAdGChFHIdQh1Tv8/OvSn1C8zfknMB8yNAAQ==
Received: from DU2PR04CA0233.eurprd04.prod.outlook.com (2603:10a6:10:2b1::28)
 by PA1P195MB2497.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:45b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 13:03:35 +0000
Received: from DB5PEPF00014B96.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::e3) by DU2PR04CA0233.outlook.office365.com
 (2603:10a6:10:2b1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Fri,
 12 Dec 2025 13:03:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB5PEPF00014B96.mail.protection.outlook.com (10.167.8.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 13:03:35 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 12 Dec
 2025 14:03:33 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Fri, 12 Dec 2025 14:03:18 +0100
Subject: [PATCH 3/3] dt-bindings: gpio: gpio-pca95xx: Add tcal6408 and
 tcal6416
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251212-wip-jremmet-tcal6416rtw-v1-3-e5db1b66d4cc@phytec.de>
References: <20251212-wip-jremmet-tcal6416rtw-v1-0-e5db1b66d4cc@phytec.de>
In-Reply-To: <20251212-wip-jremmet-tcal6416rtw-v1-0-e5db1b66d4cc@phytec.de>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?q?Levente_R=C3=A9v=C3=A9sz?= <levente.revesz@eilabs.com>
CC: <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	<devicetree@vger.kernel.org>, <upstream@lists.phytec.de>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B96:EE_|PA1P195MB2497:EE_
X-MS-Office365-Filtering-Correlation-Id: f57b9dd9-83fb-4e69-b340-08de397edc3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1NsV3docGRMeFlsd2FlOWJWYjFhMEtEbTVSYTBXSkJDcWFFMmdPeUxISzhC?=
 =?utf-8?B?TlExdTRycThETGFHQkt0RjYzaXVvRmlIQjBQdDIyVTRKekhvRnV2TmhiQkE0?=
 =?utf-8?B?QUt4SHRtT1NBME1ZY09aL1didEtVMXJRckcvcW5kVXV1bHFOckFhQks2d2xW?=
 =?utf-8?B?WFM2aWRJSmtPSW5WWXE2Sld0aVBoY3M5TDZZUE4rUVNXN2E4bE9mWTU4dHhs?=
 =?utf-8?B?YVgzWjJ0RnlqQmMvWWdBZUJ1R0NpUHYvYXZJQXdFeVQvUjVjczRJSUhjOTlm?=
 =?utf-8?B?TFI1WkRaMFRTZXZML1c5M0F3ZVRoRW8yZGs2Nnhwd1V2QjJxZVVaUGhBQWw4?=
 =?utf-8?B?UWh4NGhFNFU2UitjYlVzK00xODRWR2E1cTF5WEpjcDJkbUdMZWF2ZlltYUQv?=
 =?utf-8?B?dFZrMSt5NVdVK3ZQRlkxQ3cvcllwQXdPbXo1ZkpKVkdmSVByMExJa01ad2FH?=
 =?utf-8?B?SlczMlM4M0MzSThuRlpQcmNYVklFdFJJSi92cTVBWmJDVnhOWmxxNyt1M29m?=
 =?utf-8?B?ZzR2RzRpZ2lmMy9hNXNwdC82TVFHTDNFNEFvaVBTd0tFS25QL3d4cXpGcVlC?=
 =?utf-8?B?R29XcmtXMjA1ckplVmhHelV4dVFQN3lxTlFQNU1PZkxyVkUxbWpBeFpjR1Qv?=
 =?utf-8?B?c0xQM1Q5cWo4N01nRzFEWmJJY2NNb2RKRGVhak9MeGV2ZjBsYWVVdmFpcjVS?=
 =?utf-8?B?NDc5R0J3dEJyR3NEVm5kdDBFcFBpclBCdGZTekNXcm5Ua3V2b1c3Sm5PZmlL?=
 =?utf-8?B?dnVxbkE5MmNCSHZqekhGNlg5dHZrSjVUUGhjMkNTZG5iOE5IcEtObmhIZWFV?=
 =?utf-8?B?VW4xNWUzdjgwQlJ0ZklqSjRvbk8wVXJQY29ibWRodVV3VkJvWWRWR2p5VjBF?=
 =?utf-8?B?Y25mOXF1MWtabURHTzlWTkQvQURHcGp3ejRsalZXMjArQTBPNlFTRmNrVG1K?=
 =?utf-8?B?K1B5SzFIZ1FsSWFvQXJSd3VJUzJyQkllSjB4dUVIdTNPbWJxMHFJcTlWQ1NZ?=
 =?utf-8?B?N3ZFYTArOUdSaWdkYngrWW1STzJRdHZzNFZINmNlTmFVempCa1BMVXk1TzZF?=
 =?utf-8?B?OHBvaHlibGY2QjNLVTBtY3hoNncxUWtBdFozMklpcDkxWGZhbnFRRFo5RExC?=
 =?utf-8?B?bnYzeTFxV3huazFwb1p1dkZ3V0QwQ3lkZEVKaENRY0hWZGJQV0oweDRyNFlS?=
 =?utf-8?B?dEtwT2hDVTB2K2RNNmJNZitQM24xeDN4L2NMcC9FdEwzV1VidHR2WUlyRDlK?=
 =?utf-8?B?QjZjVEg0a0VyN3p3OHVzM20vc1dtbTVkK0srU0dzVURXVDRSeW1kZEVaKytD?=
 =?utf-8?B?bFdnZ3lxazg3YXp0dHpncDd2YUlOWStObUpPQk13MC92TXhyQVR5Uk1FQmNR?=
 =?utf-8?B?WXE3RUxRWGo5cDhHYzJxclF4ZTdNb1RpUWphZkJVSERSVHFDM1dIVGFaaWJz?=
 =?utf-8?B?bXJMcjVpTGsza3FybHRBUXNkOHdtK2NiNk9CeGlvS01yKzIrMUxyTjY4YXJJ?=
 =?utf-8?B?VmkrN1dPTGE3M2FzR2RiYjJjTDVnWFRwa1hsYzNhUGpPR0JGWXRKeTR5NENs?=
 =?utf-8?B?TTN3a0dLRVBrM3djaHJOc29IdE1ueFV2Y3hJbFdENlhXSUxRVjhGd1B2a2Zi?=
 =?utf-8?B?Q1NrUTJKTmVTNzFKMFQrYjQyUzFBcDdhb0x0VDZBOWhZZDdIdVdRcGxET3lz?=
 =?utf-8?B?N0dvQmdRaEpxallNVnRzTlU4ZE1jcTZNSDlCNWxzdnN6NlFLMFBRb0pCcS9a?=
 =?utf-8?B?c2lObzNPT0JzNzFKdGt3d0FOeUM0QktvTHFBZUZjMnE5WERwcFpuL09SNStl?=
 =?utf-8?B?WFNxOXVQYnZiK21OeWx5bkZqWk9wM2RDNGR1SkxZMFhpTDZjN0F5YUdUVWFq?=
 =?utf-8?B?TEc4NDZoUmo4ZDR5U3RYeGVSZ1lNYUgyT2JvNGtoZFlwSHd4dlBwbGJUSTVY?=
 =?utf-8?B?cERqc3BDMW9QR0NDNENkNENNUnRveDZwSjRYVWUxdkI1NHl3WTdtcG0yMFYx?=
 =?utf-8?B?TlZvNUJEUmp4V2xBQnVqMCsxU00xV3M1eUwvUkoxUmtkYVNKOFhTWFBGZlh2?=
 =?utf-8?B?U0tmZjROcmFUcDJ2Z2ZSY0ZpSXhMT052Rm1aY0hZNjNYY2tKdFNlcmE0SEZa?=
 =?utf-8?Q?vw3k=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 13:03:35.6011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f57b9dd9-83fb-4e69-b340-08de397edc3b
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P195MB2497

TCAL6408 and TCAL6416 supports latchable inputs and maskable interrupt.
add compatibles ti,tcal6408 and ti,tcal6416

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 12134c737ad8fb85980ecee225b8bcf5d1bf6b41..4f955f855e1ab8ccfcce9f465727b1b095e80ec6 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -74,6 +74,8 @@ properties:
               - ti,tca9538
               - ti,tca9539
               - ti,tca9554
+              - ti,tcal6408
+              - ti,tcal6416
 
   reg:
     maxItems: 1

-- 
2.43.0


