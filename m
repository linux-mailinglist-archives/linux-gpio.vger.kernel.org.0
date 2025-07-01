Return-Path: <linux-gpio+bounces-22542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF306AF04D6
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 22:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 264F54E3FC1
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 20:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBEB2D9EDA;
	Tue,  1 Jul 2025 20:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="Gjs6FoIl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2104.outbound.protection.outlook.com [40.107.94.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F06E2EF671;
	Tue,  1 Jul 2025 20:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401676; cv=fail; b=H1nfFFz3NaN4DhMlxLS2GqOCyxagRniKrefUFCmCa8i9HUaO2gdCw5A/iUx/lrstfqmcU10KH04FFuTOC/m3FCQrpa6nVifuuuxBud5wg38niF35bOGP1i8fr+cf/CFSbTvoYn9klzroPwFybEospRzLT7juK0X1BYt+WvSqzIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401676; c=relaxed/simple;
	bh=ezSeO5cfCe+Dt/bg3fjtSXTxawA6Gq+CrrOEaKrDr9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YvjfNGxaa408BCNoa6EHH5sKI9+K8XOWg/g28D8ROXPoNoWhjUMbH1nfui/094Vd2byKISEPYEocTg9ZoZXk8L0ejdTxd9x/Hz+p5kfC30jQCVpvsLJ5Dl1TqdUC1KWFeug4b9YCqxUeyYCBY1zTd8XiSpE83AKE1l9vYKyup6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=Gjs6FoIl; arc=fail smtp.client-ip=40.107.94.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rz0vFJE9Xcl+jkYXe6Q/DlAkRRwJIElsUxHnT+dAwatb99zwTJQwrrE/e7nHKtNYWmStg4CNlDYQG+PiWFPfXo/T0VbfjobsZQYmHUxixoVL1/qg0v1jlLl6AB/ARfB40hduVFzODO7SS+0yHQqtvjMDValgJgt+T7o4iq+thkdmBFldXOtWx364bKX5Bz4J0XF8i7SU+Fm19xsh7QpSnDIYFatEQwouIqhD702f9KiHrbOMsixh3BR5NIWGM0SNqAAHG16A0C7lzx2qq99oIdv8ICr4iQc6wYzmr9gaASkHTEda70lFWWnV3uwMC3muhkwd7RhbkspLRC3NzCgJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuEPDDknz5zorBmpK0Wq1gjwEpBsu5EMQApjVHV87Vw=;
 b=NWsFKcZApvhp/wazfuEy/a5c92arBgP2APf2kyUqNQSg4T0xXoPcGQV1G/2EUXaWpVPtYXcZbwT+sfbcMCMqqX1/rsQ4InNWEAiD+Ddm0/9Mn3w4PB4PbST/hB3NL0U60DixIvJpADiqncG6xZmVkoSgy6mHgTVdhpCbuXJXTkDYsd1okXjENUSwkAKSSMQlHrZ92HYWW/0HYYAl315hPsKKDCRZaqwqR2DsAsh6oZOY8M5PgR0VA/QklpXNSNqm6VHaMNytOPKXdJw6VKI8fMnhrJSWDrzKD+7EefG+2GLQ+/jVNBpPL7ms7icW3U6+h6LlaRg5eh9hyMlyJY9vsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuEPDDknz5zorBmpK0Wq1gjwEpBsu5EMQApjVHV87Vw=;
 b=Gjs6FoIl+Yxf0qDkk+DMP2NyQ723vU/uJr1YKYCF3r55yRJ7ioT91P4aML2IlqJCwMIb3V+fyTaT72mq55BZ40GGw/WUydEBGP29qwj/uC/gOLMC29MdfbYPkwX2crIQcL3+1J9YnhfjNCpujMT16uVsS2x25cuYg1Kar1ExTwh93TCdTMxNHr0kx3wP31pJEuNQZSR1Gw0T6qpp3opK9Lt9zquPRAp+c2ubZ91wzm3qNGiEysolUIiHmWB4lqeHUazzxtneOXxqt2skp6vXPn4lLgFZX59XRk1T3wRY9JhKf/Y5t2wBaDGRjodSltAvI9W+i9zAFf6ZToYlLYwBLQ==
Received: from DM6PR14CA0060.namprd14.prod.outlook.com (2603:10b6:5:18f::37)
 by MN2PR18MB3656.namprd18.prod.outlook.com (2603:10b6:208:26a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 20:27:52 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:18f:cafe::69) by DM6PR14CA0060.outlook.office365.com
 (2603:10b6:5:18f::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Tue,
 1 Jul 2025 20:27:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 20:27:51 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 01 Jul 2025 13:27:29 -0700
Subject: [PATCH v4 05/10] dt-bindings: serial: cdns: add Axiado AX3000 UART
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-5-11ba6f62bf86@axiado.com>
References: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-0-11ba6f62bf86@axiado.com>
In-Reply-To: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-0-11ba6f62bf86@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jan Kotas <jank@cadence.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Jan Kotas <jank@cadence.com>, 
 linux-serial@vger.kernel.org, linux-i3c@lists.infradead.org, 
 Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=943; i=hshah@axiado.com;
 h=from:subject:message-id; bh=ezSeO5cfCe+Dt/bg3fjtSXTxawA6Gq+CrrOEaKrDr9U=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZES9NN8owZnypYPmPHR2Vy3peo0qyXREi40yj
 /gLNeRDRxeJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGREvQAKCRDxWHMRoTLV
 +6D8C/9TFmfatk5n3RtaGqqTCp2gGwHw/gEQohpBKLKTrXy1RjqQoGp/No4yZIbZUfjpxJ01JJI
 yAqugmT2kXwUyrFTPMkhRGg5Ts7Y6+npbUlGSeIvtVKfa3Fetkxkbu7DnuuDuREeBWb/GaGsUWf
 ASEg9EP1NG6sdZepoIC1vH1g5/vOZWtzz/HH9PKB79W0opOGVfjxA+9wCoyPhaeqs7QvjpsRFDP
 zOW406Yhi364TTfdMLccomtLsPNGyuFZr4rWJKWYLX6L1isK+J55s2QN+zbGGVnE8r63HUVcflE
 M3dPpuCu+P4T77JNd5aa2UG1x4hkWD0w6/RbKXoLXIj4ajY7Pqvvz6ONEADVE2uWiVUeR4wL1Oa
 wtG8vxbyhMTUjjOEt9UGrgi3MuXcbOZZtSB6/K/tHwXo+wXV/zK11JtWU57v60plwEHMtSzjDkw
 R+2UNuAxoeupdP+POkLxP8EvmraaMyolYj3kuzKb00kee71/snwxmoH2Cy9ZieI/kBnKQ=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|MN2PR18MB3656:EE_
X-MS-Office365-Filtering-Correlation-Id: d64c9614-5bf5-4d35-4bac-08ddb8ddc15d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WERhOFE3QkdleGo5N09TdGpzVGJLYkM0RXoxTkZIV2lhd3dqNEhYVHJDYUZJ?=
 =?utf-8?B?WmwwcnZNcTBiVlBLeDBTQmt4VEtncHJKa1AzSTdmZlBUU1draklXaG0wK0RO?=
 =?utf-8?B?NFdIL2J1R3BSWkxrRm1qWE1ETTBUeEhDUWlwcmRTb0hYNkl2dmtlL3RwdDVn?=
 =?utf-8?B?NG16UVJlaWM3blJVZ3BEL1JkUEFwdHU3NHJWbmtqRnZWSUdjUFYwMnBKa3J0?=
 =?utf-8?B?NG1ocHVIVUdGcWdUYTc3cGo1d0t3amlXdlZCN0NuSkc1Q2xzdU1hTTBnakJm?=
 =?utf-8?B?RUpHa0VVSkZRVFdwSUJxZjF0TEh4aG9EWVZNb3l3eENBY2VXNWpRWWd3cTEr?=
 =?utf-8?B?U0NnM0VibkVuaTJZVmtNSTRUU2x1dFlZWXdWSWhIZnZ0WXJ5RndXVHFjWFFt?=
 =?utf-8?B?OURzVzFaNUh1QUR6RThVb2l4V0FSZk53bUhqbGFKT0p6bHVRb2FFckcya2JQ?=
 =?utf-8?B?cXh2ZWpHd3piNCs1cFNEeENCQzVFTFJkUUFXZmdxNm9xWE9CMWtITUNDWkNI?=
 =?utf-8?B?VkhkZVNsUjBjeWVIeVlIL1BXam1Xc3NieFFzWHd1ckNLWjA5TlhiTHNWWmg2?=
 =?utf-8?B?VVMwYzgxV3hHTVVER1NuZ3NDRVNINWxYWGJQRy9Ubm04MnJzTWd3TXhOaWdv?=
 =?utf-8?B?UHVRS01sekVMbTBPelpDYnNmWFRsbHREd0ZyL21UNzBTbTNzNGdOTEhKT1h1?=
 =?utf-8?B?eHJ0MzVXRDNScys0T1VlendzSTFublZmV0E3UlRJaUllRlAxMkNwSUsxVklI?=
 =?utf-8?B?cHh0MFd3b2Z6WTJUd293K2F3K21kQVcyQ05TNGkyM05uWklYQ2lwM0NBdjRE?=
 =?utf-8?B?VnIxOWZxKzAycklQaG4xdk1lT0JYQVVEQnQyVVIydytrczZIQlhzWGFMQTdw?=
 =?utf-8?B?VWtvMitQYjlCY1lqZllDOCtxeHlYRXFpOWt4OU9KYytvaW1IWHQrR1VzeFFC?=
 =?utf-8?B?R012UmFsc3NQeTRTK0ZpcHhpUlUxOHM1ak9jekx5Uk1LYk94bm56czVVZ0U5?=
 =?utf-8?B?RGYrR2pzOHFNR0x4Ujd2VURVaW8rMHNTUGRRbktUYTRHOTdDY3k1djFVSUk0?=
 =?utf-8?B?ZlplOVdCdnNSSnVLLzNWRGJMdlRwUmxBTmMvblVaN0p5U01NZSsvU1FNd05N?=
 =?utf-8?B?bDVhSHFPYmNqczBkSmNJT1dLMEtPaG10VzY0encvdjE4MW1DSkZwOGM3a2Nk?=
 =?utf-8?B?bUJKZFp5MS9oazF2OHdaSGF3WVVQUEdiNUpZTjFxSjNyZFNMbDFvT1lSd2pZ?=
 =?utf-8?B?WmVvUU1aV25VbGJjZ1psVllzbFF3Z2tOMHlGWE5SRDVXTyt0MFFQd3JLU0pT?=
 =?utf-8?B?SXpabWxjY2E1QkI4dXFPUk11MExLVFEvMFJ6cDE0TnRCUHcrR0YvVVVweHV0?=
 =?utf-8?B?T013Qi9FOXNaTmFaVHNoaENCWDdvME5qZnpDbmE2VHYvUGVLRlRlTDJpeXZF?=
 =?utf-8?B?QUhHR2JlVjIvNzBWWFJOTkJxL2Z1b01VV3FBVVZ0aVpxVHB2VlFja2ttWkxo?=
 =?utf-8?B?c0ZpTm9xZXNXK3dCZDBSd2Fjd3NveHBrWXVtUXY4YTZaK2N2N2lZWkNtSUtO?=
 =?utf-8?B?SURPNHh5cTJhWkdtdFMwalFuZVM2dzN3SStTTytpOEN5V200ZHM4bVN4S25u?=
 =?utf-8?B?ZU95OSs0dnlSV2hSTkFUTm9ENWs0Q2d2SmZBQW5WWmtRN2hkNnAxNXBTRmJ3?=
 =?utf-8?B?alhjOTdMRVFhamtFalBCdTN1aGY3cFBkR2ZpcTI0bWlMeHNtY0tnVjdKWVUy?=
 =?utf-8?B?ZlFvODdUbmVzbjIxSzdtTmdxK3VjWjFkd3c2WWgxV1J0NHdyaitpMDV6WmRl?=
 =?utf-8?B?YWFycFpwYjRGNjN5VGRFUkZlNy9reXpxbTN5NkNwbzJ3WERSMkVNaEtsTHVp?=
 =?utf-8?B?TDJsREtuZkZrU2gxeUp5L0hORjFFcjU5V2JtRGVrdVZuWFQwWjhyS3AwNHgx?=
 =?utf-8?B?SXE0SHd1NDRHMzF5YVhac2N1dXI5YkRaVFlTWjF3cTJ2YllrWXJ4bmV0T2Qx?=
 =?utf-8?B?eVU0QjhGc3lUQS9LajFZUGpvdHRIU2ZKNHZTZnB6YTVOQm96c1BIVnhrYU8y?=
 =?utf-8?B?T09HY0xjSEFpYmNyUkhOZTVmVmpkd3RHMFBJUT09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 20:27:51.5799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d64c9614-5bf5-4d35-4bac-08ddb8ddc15d
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3656

Add binding for AX3000 UART controller. So far, no changes known,
so it can fallback to default compatible.

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/serial/cdns,uart.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
index d7f047b0bf24c444e2d81e0156fb01a89207ee2a..4c8b4953c3f32ed46996accd0e1caf6e0d7cc251 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
@@ -20,6 +20,10 @@ properties:
         items:
           - const: xlnx,zynqmp-uart
           - const: cdns,uart-r1p12
+      - description: UART controller for Axiado AX3000 SoC
+        items:
+          - const: axiado,ax3000-uart
+          - const: cdns,uart-r1p12
 
   reg:
     maxItems: 1

-- 
2.25.1


