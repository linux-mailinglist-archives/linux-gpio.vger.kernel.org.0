Return-Path: <linux-gpio+bounces-26465-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C242EB91ABE
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D6B82A571B
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0CC24A04A;
	Mon, 22 Sep 2025 14:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="i82nm1GF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C1123D7D9;
	Mon, 22 Sep 2025 14:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551094; cv=fail; b=gPP+lgcepAssHoWtQLaYSPlXPKvkInZ766rUhunmY5l/1gb6NIy3KPmsPxWUWcFaqdp/YDiK7i6m3ynFp0olTwbKdLTplny3EFmgkMm+evqsWOuRcwhE40736ZPM5XC8vKt+/AMdluMiBpuZajixugizAL6TUS066DQAAlLNMuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551094; c=relaxed/simple;
	bh=FWeQuOIdjnnm5BVC2A0c2T5yxIQNHWbaCRXNqM0ybU8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nRswghWLAFgKS/NmK8wPJP1X5I6xSe5xyJiuCrIXBhN+3X8zXBGyW4/ZHUtj92ulAQcp2a0gGYIyZZ/2xY52ISoU0nZzln371qYkRnJhUzdAe1QaDiUOHPmOt/L9xueUWWWGMvB3NQ4s6n+PHBBLex0lMsrH5Ao90yxQNTI4V9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=i82nm1GF; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PF/kq9Td3I+eT+HUV2NEzY8vOR5HCGOkLmQK2QDf/k/A3bIDg7daQhn0jqS7vd5OnyyUl/tYURTVmKNf4imYFxLZLHGDMqkc8efPa782MF/RgWOHFPYQfDrq8M4wX/mgrsGZflPHI+xNN0MpQHSHRVuQ2rt+lq139BVj0rIahhWyGMX1B/9mJ3rvxXVOT26Cvj13dh0N63EPc3TUfjhTqgi1tzsBJevCdIIxpJbNPbssWyef51THaE4IJgSJx1C8gF8vKfBq3VkJy+gmRx2spWnT6Pk6w/Xa4arPDjdNGTBgTX8synrfTDrOTX6tO39y9r0eppx5uEdma+XaNXu1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7ZcHHfpcXT8BvFcQzDSEK1SaXSk0Xhv13RQmg5bprk=;
 b=ZdGqjsB+ZdDcl8M7HEr9jC8EtgfypKYmDZhkuA9aBQ9tl1VV9WxU3uKSeZZHdSXbHSMc9/KnkGHVAXwJCcoGGcJgbXSK+H2xHV0hW+os7jUgUiU7u5dL3C3DhFntKWTh1OKdi9uRq67uE26vs3O0aIsaw05ivfW8mkrqHA6AuTo6/ohBz6Kthn7gzS6MRxf1FulV3Ez5Xy0hngz35mfcdFYGai6Uy1IdRquOImgNpjKF02x59qLmuoK/b0pLgCXk65D2ns1QcwlFMvd1z9PG7VPpp77R6MCNfb8WTXjmaquP0LebuSjQyeEOAsjuMKblxo4addChgX+1wcsRhzuSDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7ZcHHfpcXT8BvFcQzDSEK1SaXSk0Xhv13RQmg5bprk=;
 b=i82nm1GF2iONE7puQO5TL0cg/wzPK/EMbFmguYzIOnUIzCTCU9ImokhSD4rl+MIkaQJk33c79YKIAHWf1aWK5LQOaRl/387wsnOXFAgfbxIGRUtwiNRdt4W4rEiCS2TXk0tnaCghUownXMQ/v8QJpGztHh9dhhwiZM29j+fwd76GGQKJYKvV8VoujVS9YpGb1RvWRk7H/vfxaqnlVl2c7T94STt47vqBw1Tl3ZW9w9foBpSbIs/nruYI1ldIk0uMslmixmtUD4Nk0/YuD1Up4Vqu1fNQnZLh2m9LKmgB81OGZtgJePtLEVIOZA//zZcbxPtOGOfY25Cz2MkEHQIN7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB9062.eurprd04.prod.outlook.com (2603:10a6:20b:445::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 14:24:46 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 14:24:46 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v5 03/12] dt-bindings: fsl,fpga-qixis: describe the gpio child node found on LS1046AQDS
Date: Mon, 22 Sep 2025 17:24:18 +0300
Message-Id: <20250922142427.3310221-4-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0044.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::13) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: 606c6f93-df4a-40a8-f63c-08ddf9e3c7af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AGe4BOnPsOIonX84Dh2FV+1nQV2W48aqL9VQJIvnJsdK5WdVSmCyThOGDeqv?=
 =?us-ascii?Q?2finxK1XA6XWvquIrgetmF6UdXSSA5fp3tRkn3PV+o5ogU8mrWpwNsf9jl0a?=
 =?us-ascii?Q?tI+8yvFwpfwBukTBFUHv1MrYtPSG/sXBNv23F52N0+9AUL22+rbpMvSuH7mb?=
 =?us-ascii?Q?mzBVLt97NRn16Fq5C2uFqmlGL3F7qgTPs0cfm4/rqkE2hrCqSoXCj4ghknOT?=
 =?us-ascii?Q?oTC2ME/7Wsaq65kJMXzVNbqO5NWxerMieD+YSC6eVeO2KYzQMSuTFumG/v/I?=
 =?us-ascii?Q?pYWmPEe3V9+jeX6tWDYKf35MXso+ATdvbhuWzAtDJkVZAjIz5fywbWMcrZyp?=
 =?us-ascii?Q?VrGo9i79ZXoy4dvi3ouhkY+G+1QB6WjVHRXiXK4HIHoEsWidUsmdK0/Ee+Bl?=
 =?us-ascii?Q?uGeIwl8TZ4q9dTCADlydSGPhKEKlBNe0iPW7uNO83seXnH9l7FZ4pOWSsk0s?=
 =?us-ascii?Q?rQUhZ26/DsWyOl0yj5T7itlENdTqK9v+u6vXb+385/RXhTCSdIUkB15/VTPT?=
 =?us-ascii?Q?4GrF1HpSJQw6ymhYvJNKEuPL6e0siPug2G5CEDIDcZbevcpsR6I2EwyDcm68?=
 =?us-ascii?Q?xY5KCY9uKHrO1i4m7tD0FRUH6PsKgDJKDOh6KtgKama5Q4rAsNEbdoSFRyQj?=
 =?us-ascii?Q?Wo6Z3u9vbmxPVQUxRhWKHcLKd5NFDHdLhdqCyh0swMCGnj8nQMeWcpSxgfl/?=
 =?us-ascii?Q?T8d4HGOO9TQ/MWaGNDEseIDe7laRXLk54Js9V5X+XAtH/oo0cvIf7Ch13kXv?=
 =?us-ascii?Q?rKaPEyaUosoxnYHBFYRRyQv/0lAtV8T+vG3LLgzlFaTyBq/sS4AYD+23uTRO?=
 =?us-ascii?Q?/F1R5tZWmkurIDnQ7LxycPME+XEGNx0EEQU95VTt7rud/a35KSvB2BvOYcf+?=
 =?us-ascii?Q?BkotJTcVdGJMkh1doSKrwXTG4PxtuX4n+qtAKofc5uRqcyHBNJT9ywsVrow/?=
 =?us-ascii?Q?8pMpfEh2Vx9Kuy1b+OGsbx6wDKyNUqTzHgwaAfnX2xEWDoUL4Yt9A0WMN39s?=
 =?us-ascii?Q?xkmSeNrP3PIgjtJCCFh0Y7PQrZolqeAQPl+psBxRgHolBaNj3Njlc6HuxsMm?=
 =?us-ascii?Q?A+h3ycO+3mBzjroi8euvWsKYGqr6MAzlsqHtJwqzUt72dGoAdjvcRDPUViek?=
 =?us-ascii?Q?DwhyQXWcqgqNlEh/1uMZPho9NoB9cBDGCEZspFd/GNoSEqAnsMAdJs0tia5z?=
 =?us-ascii?Q?aXVjzmyApnBdAGV7zKyxiShWE4qbnkxzNece5R08gOZWHiR0edvijT8duvdY?=
 =?us-ascii?Q?hHN3bTEJrYG9nwnsQCJqo9k5gc+7SAmz7xgls4blnrw5x5HHH2RrlYRROuXW?=
 =?us-ascii?Q?8jrd/tFUSZQdEYW1687Hk246yQQ+0pcsPwmCzv95PSsoKC6WSUs+9G9RdkAw?=
 =?us-ascii?Q?S9FxrGBDI3fcQGXDMcYNagDWSl7FehnW6f6YX5fRFmgdkwA7P6fA8Uxl0Dy5?=
 =?us-ascii?Q?huW+Ab6KxdGRz8bn+LQ4lQgMHBOiH2RthaPDXmI5hFjnYmzSMrR/fw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rjMvDt+nMSx1qm/YC1UlTApLli30uU+hu1//AUjLI22D+kFMSlfoJWYA5UXv?=
 =?us-ascii?Q?JNQoFK5UD+NyvAZvDzyAJFS4FkXrWFRmJXcU0pvFeh631EyoAXPKIMMWxOo9?=
 =?us-ascii?Q?mvzjg2tEKmW4Jga8aGkJtNCCGhY+bTw1e80b7jZo/gaX5p+BFxOjgu+/DV87?=
 =?us-ascii?Q?sT9k2ZSEaoTOwRRkNsHhaZ2/rHrhW1Hhz8Q7e7tOfkNp/LCb/ROBpTNHVUM/?=
 =?us-ascii?Q?2xDeB4EsBwXGaqmxZkfuiFqvIzdHSoFKCAILHaWJIPr0WGfQSh/7xQG2Yeoq?=
 =?us-ascii?Q?SLj81DpQaEOn6VM+qTgAk0px/io9pFw0L6Xn33ZUT1rPdzEFeBVypJsuZ6Lg?=
 =?us-ascii?Q?JsrBOxmGjr5zRR21hrQmxaBi69walOwbTrCPuYaNIaeYU7U1AnuEJ3i1BVd4?=
 =?us-ascii?Q?e6zgD+jxpZVqQ4piUAHfTZ8mWuLMoujLQEaVj0BhMNZ5esfMd9FJvQ7571eK?=
 =?us-ascii?Q?LsLfbo371gZXZ6T74NYYZiRtGWfy/pz0Nda7ZPNbS4108787hqJugn1IZHkC?=
 =?us-ascii?Q?BmQkPJF0YmWcx1zQetsOzlb/5EvDBoAxpfX6jvoh4zC1yBoanmDLKuYeRArN?=
 =?us-ascii?Q?knzMOjIDrOxquAGfO8ZrPYFJiB1zkUCADPfzR5UoP1CDqWb/Wb3i1rzqqC/6?=
 =?us-ascii?Q?MoG53x1J7vIJEm6fLfk6xGTVDE4wEyMTFF02NXxa+lna9gnBSPmeEIirEmrD?=
 =?us-ascii?Q?RSMjTp8jkCB1znjLFoilHPVlpgfzyT6QC4IISHK+Nj9/Uyoj4vWuh6AKGVlX?=
 =?us-ascii?Q?+SS9C6qHGKqUvjSfRaaVb8T1COqLuXya/mRZi8kSPi8rh00khvLG42u3fF5T?=
 =?us-ascii?Q?jBmvoZanSnnrr9jzDTlo74FDtrm3Cqgol5MPPQnpLGPDx4QCSREF0bYqRiKh?=
 =?us-ascii?Q?1ZyeRuPxjVaqe+hG4ELAr0WcLilR3dQv29Q8GXEvC+8t1lv8I+bM+cGZ+sw+?=
 =?us-ascii?Q?/NTdLx4GwIMcEsoLaKR9oZjTqtAlFZn0TMik2CqQPwQB3U96swojFFBV+xbk?=
 =?us-ascii?Q?prKCeVnBFr3LuzIOUzCj1qMFWG3MxOBWEWg6T6N97yuPCVgkjL/CHr5txbZH?=
 =?us-ascii?Q?+UalVp+Y596M0HswXTtpvPPrJapvjuu3noINOqnnZSbeOTpRjB46SGWSWUiP?=
 =?us-ascii?Q?vGtjms9ZrWHeRhUHtIjgVauA2mCxTj65jDISYc+d3CJTyjMpKT6bfwZdwaXK?=
 =?us-ascii?Q?AG6DDu3rKFiMAlEbMoeWvtWY/YZebu9r3kcfLOCzNZ9LFYIJ5S2Hvp+O7apx?=
 =?us-ascii?Q?ZHcRmS1T5MtuwPENjz/T0L+TNb51CPAjYBoNL6lM/npHbff8VH1x0fpWxJlK?=
 =?us-ascii?Q?4OuSpYYSh9iJxztyzjJdbLMiQOwU+k+3KHTmlcM8urU7su7iIza3vxLZA1lx?=
 =?us-ascii?Q?Cm76gzpRXk1B/ZdMg5Jfjrs21//P8Aqx2tmSE8BoF3h4I1oOipaxnl16pJhY?=
 =?us-ascii?Q?plc0TSCt2SvbporjcLovXIw5O5oJfz3zcnqwbiRwZOIkTfhJ1NL0e9xVj4QM?=
 =?us-ascii?Q?0bZA6iF+ZzYHQqJUfnlOGp4RQ+45EuxJM+kuV1dsE0Flg9ktJ04rtW2RkNXV?=
 =?us-ascii?Q?aRontIDek49LoFkDDzc57RtcJf0dDiGoXnxyHluC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 606c6f93-df4a-40a8-f63c-08ddf9e3c7af
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 14:24:46.0795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nt9/1+wzTbdJhySCis0TPzbO3WcEFKmvUiysKsjALUlO0XDwlAAbiudv+58BfB04ZRhWpXzVm+edWW/f7zG3PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9062

Extend the list of accepted child nodes with the QIXIS FPGA based GPIO
controller and explicitly list its compatible string
fsl,ls1046aqds-fpga-gpio-stat-pres2 as the only one accepted.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- new patch
Changes in v4:
- none
Changes in v5:
- none

 .../devicetree/bindings/board/fsl,fpga-qixis.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml b/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml
index 5a3cd431ef6e..2eacb581b9fd 100644
--- a/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml
+++ b/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml
@@ -57,6 +57,16 @@ patternProperties:
   '^mdio-mux@[a-f0-9,]+$':
     $ref: /schemas/net/mdio-mux-mmioreg.yaml
 
+  '^gpio@[0-9a-f]+$':
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        contains:
+          enum:
+            - fsl,ls1046aqds-fpga-gpio-stat-pres2
+
 required:
   - compatible
   - reg
-- 
2.25.1


