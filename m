Return-Path: <linux-gpio+bounces-26463-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81363B91AAC
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B07319028CC
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582E723AB9C;
	Mon, 22 Sep 2025 14:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jt7poj6V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEE920297E;
	Mon, 22 Sep 2025 14:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551092; cv=fail; b=bZ5qVFGcbRsJJzhOnEn1Xd4KL2vPW2g15EXEuIE1HK0bVhtT2gtuDGdy5d/utG9t9TDEhkh9sOhzNJlonLze71spafNdeTjSoOaO7z+8v2FgUZbKUM6BTefRsY/ug+L3hWegL8IyTulL4G018ThDvQPncj7q0jLmVUvOKTnBB2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551092; c=relaxed/simple;
	bh=a5a5GnqrW7gcLQpFT+BRm1c4bMNrWSI2JBvNZezJOi8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MQXOCW+iYkzQKUuaQoSw4qzzxS4aOy/cK+kZRFEu9FSNmtUbTUeECxYAbAAWsXJ1Gd/2Ud2WfBlwSJfAd9qfe8J+IEK95n9AhE3/wCAFVoe4/GQ/L3AMe+wAKB3NiRzLQLKwku7/4w1GcqyAqleoR9CW9iaruvIRV3sDcZR931M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jt7poj6V; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFU+X5wUOIjrRO3mXvYSK9XRlHALGPopFawP1wDv75zbtpxDcfX/HQjMjqqdbtRdnESbhmS4aHWhlFUB7qCmfrhc7vMDIKB1h2Jk90mKi5Yo62UWp3TNuVBjYDpuRurmSSUzL/tL6baSGnPzMyFWUrwNPy0aFzGoUAPh8G0DxPhj2xJIeotnw85Zj8kVE9J6n8756AEpcmu/Y2RD5Jfnfgi03petX70uXUQ+E08opuKoj+UAfWI4VnkA6PH0jHD8S6qyvqV0ozWYK56WgrZkradlXrwCw9R1WW663EBykWxwl2YG+WPs6nbtyIayqpyBi5fkYaRDWC/dvRy57QCISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuxQk8VmRlYROLxP9gNPJE716JKyau32Hubg6tbfEQs=;
 b=SixfAGWGmx54bsbCqodRH8N2N/+tYo3ypy2ONnKi8yPY+kKYj8zDRm+pwiZ3TleT4rNgFDmX9xBIX23pCC+po45HPrwn1kDEaG53VVkIHeR/oJenPBxCfqPOEm0aOB07IekcVT4AePvxWJUNtlQKahtOKA23bHxeZ0clXAfUaF7jauYxcg0SFaAgIoAQ0L+5i44fGjkn0/mfZUcjUs3YA30ApBndzm+fZBaS6BBCHr0PoxnMrZNkXMrGvfWctmMFe7dpyLhG2+0r9eOZlqdEdZ22Id9COHnINITIcDQX4/5SEHYjKlB0RqXnEj0Hitl+XOYMc12lX2sMRNUd6daTtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuxQk8VmRlYROLxP9gNPJE716JKyau32Hubg6tbfEQs=;
 b=jt7poj6VwCbJ0ZkQAR6VV916sqdZmxy7IMRomgNN1HTMamduOuBJXsOykL2bY4JzzgMMGSNKXS5Gj5HbLOz89bVOvpT3YjzUK4W6zpLMPtn5nkjWiDIBGGNL3xP7nJzKhFyWICD5BLQbIrFJFZa2SwAyJrJPNQegIK23FA0edLnfdF7BTBAWAn1w4+UCWI8NGW0yyRnDWF/NHKl1RDzsdHSgMB4/C+EglObQpG6YIrBmJaJeQ6i2p7aYEaSzT9qxAytZuThvzfGaZMiX3edqNJhnVsiXc2xl8IrrM5eMny0pnkP9EdamIfXgGu3PW1Rzyc1dMoPqGNlTvJcrJitM8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB9062.eurprd04.prod.outlook.com (2603:10a6:20b:445::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 14:24:44 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 14:24:44 +0000
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
Cc: Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 02/12] dt-bindings: fsl,fpga-qixis-i2c: add support for LX2160ARDB FPGA
Date: Mon, 22 Sep 2025 17:24:17 +0300
Message-Id: <20250922142427.3310221-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0043.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::19) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: bc7b1928-30d9-498b-01e5-08ddf9e3c6dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GpkbqIK18rixYsTHBwy3gCVpZnXSQSnKAM7CNkCKLtK4NnTmvboDWCCq3cjE?=
 =?us-ascii?Q?aeW4423fMdFt7JUQcD8QkujyGY6uTe6ppkHVYW3JXNYx9TRjB+HYWjDIbJef?=
 =?us-ascii?Q?zNOrhxRiu1uTfXiWEwJSaZ0YhRFZiPAGbpVtg12fX4VAg8lXy0JBGamUTY5R?=
 =?us-ascii?Q?5CpCSL1HyJtcHivc5IrCTjTzOBwLzSr1VBDZwT6XMKPqaYzLuWMD5PKc6YB6?=
 =?us-ascii?Q?o2hgMp5yE5T73d/wJmjEopZ52U92LshOy0ikIXuk2736rwH+3CX3iYFlYscf?=
 =?us-ascii?Q?0E+VzPMJb15IIuz4iFBZ/eIKVWf/rlDO022H4nHSHFhPeVq3H5mH19rnOLQE?=
 =?us-ascii?Q?PdAXH95bCDB/EarhDd8opTBKHk/bZR9FFjbrhmBidlZitF5Hie80eg4kkt8s?=
 =?us-ascii?Q?dlQKp8kHTeMCtfbSbe+Sio3jGHlUmPFNEc/jPDr8IFboUXjzgVlfDoGXnj7P?=
 =?us-ascii?Q?Kl035YPVDP0HMLeDFl4tDI13MB5zIlyW3ve/20llOl5kLJ383pPPr9KOlvxp?=
 =?us-ascii?Q?AFZz/krd19EXBo5nA5vSn6SMFuOqP3+w9APb3d0hv6alYYcLmuMt0RBwGCw1?=
 =?us-ascii?Q?qdFG+4snCkX9AZ/3GyRdhmrtn9I++/0CqenxHORmoCmdE+ejlFqg2z338Gu6?=
 =?us-ascii?Q?/mxoH/KX8XMNL5q8dXsxtzwg+vwCDfyxYldgsBGGRb+tG1jPyQ4PfBTOqSRx?=
 =?us-ascii?Q?GcIiRt1yfcnDQUOxjtNUFD5hzZG+JEMRsGchtm6aXR4aT16QUoWtW+KDboJQ?=
 =?us-ascii?Q?W+vM62OsP47i5ijU6KICdVC/tgA73F1ypaCfyuQO966R/QzHlL2GboZqxPII?=
 =?us-ascii?Q?isur+C0GtcO7dgcRAiOqekRPEsziuYhJDEH53fc4RbH/yOt6HZcJw3HVi4dY?=
 =?us-ascii?Q?/RcMQXT7U6TUpAQ874eDNRZBWxTe96SBX3AFmGHi6oKNJIrEh1BC5EUHhOm3?=
 =?us-ascii?Q?BolvaHUAZbv5UTEbfjBVWvOLknGAdyvWmXqdkFirSMW3rOFsGaPm/A3ZBexb?=
 =?us-ascii?Q?1BK1uC2vDMPz60PEsL8ttL9xYIQaa7ryQDrgC8w/LD4AAQ/xU5PBS3DZ0wG+?=
 =?us-ascii?Q?n9tP/OfCx1s8UAAHy/zi+PSIVFhUrOFcr9F/y/KbbqwBjj02vTTW/uXjJbv6?=
 =?us-ascii?Q?oBoRYXJVLi+eu84uVx/vLpWY0kf2+PzqsCsIHKteM85Q9H2tCGez5hCW3vd5?=
 =?us-ascii?Q?lI0ly6E1Ecb+BwOp/4DTqGFrcktRMQssSudv5g0C/CT62S1acF6jsNpDjRyd?=
 =?us-ascii?Q?r0kR7g8T+k1OFTkUroje6TNhNWyM/E2+DwL65pshkl+AUeaPMoBrZt2fuITE?=
 =?us-ascii?Q?/oCWTSvERYSMYT4ymt39efEzNyeM6wF8wT5LzIhMKTR2AO7yW2IDZOeGaYgS?=
 =?us-ascii?Q?GBj/sLbTZIfvmvtIcb8F18QT95cgqTWiG/FoKB40j5eGBxg+4jplpqqXHzb2?=
 =?us-ascii?Q?qgIJA12STrjh49+ff3N9Nx9GbkZ7RES2ZwHY9nOEUVMhanyOtefIQQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/gNYWCC40lBx47NhcrjWWwkMdRQBZibhMvY8zUwyUfPSgUJW19lewiG24u1o?=
 =?us-ascii?Q?SGwYh5w3c4Ny+edu9mj5xTXjPUC3V4/iJdxeMoJVV+mm9l/5QKUJD1Vltu1W?=
 =?us-ascii?Q?QNwwZO0smzo2piJGz0cjxRO71NlI8IodyqgCZirbwBK2A6RvK5Add5HjeO2t?=
 =?us-ascii?Q?aPk6fb+Vz+zGe+hXzgohBtlNnzh9o3JBR1jDry2AXEN2fXP+bQsob0ZZhhFd?=
 =?us-ascii?Q?f/HqpXAennGUiZKXldbpv2fgshCsGtSFCgWag+gpsDRZz7siTQRdvVyOdkdb?=
 =?us-ascii?Q?iBD/sFd8DQ8hJHeGDAhVCN78mstmRmwzneyJwu5ijL/olK5G9B4W7Jpp3yvt?=
 =?us-ascii?Q?GPiD4WkZIEwj4fDUJWK6iKAtYYLBHMGMYfrdW33KXhSh2Evc3LyoOOxMx8jn?=
 =?us-ascii?Q?kytshE62sEIbNj0jVa795gDZhw7OGDoPQkRdCDajk65yFFpD7F8nlbtXFbld?=
 =?us-ascii?Q?rR5WjFxz19a85RHFmuAbC5fu8Ef5UsK+ZUO0eddDFGP8B+x2QqiSAcJ8n1t7?=
 =?us-ascii?Q?SgCdVhXhjtkPXmRT4KXcmtRgkbSK+cTkhc4F+aTD84fszXwUkD4kJootsEwc?=
 =?us-ascii?Q?ar98NAtzPT04ayyNCXSMsQ659iDNrEooOiG1oVte4CW86HKJTR2SYhafuRHW?=
 =?us-ascii?Q?sKTp/+F8fzky3/o9orE8FabRHfbT3SqCI41SEvKZqEGz9R7bbNOnmLiZshwX?=
 =?us-ascii?Q?Za3+g33nkfAuN370qzAN4nmQGSdrEyUWPIeeUv1wRdXMO3fRQ36gpR4jQwzD?=
 =?us-ascii?Q?ExFm2RO88kxZxmjaL6WSt4KblJ+Vfl7D8v6YMExBehYgNLE/8Lg7hLY5PxRE?=
 =?us-ascii?Q?ZkQN7b7c+TegYtxBCe9/YSpIAYA03GY7YRWs7rlHvBtYkmfzQjs4NPy+yblx?=
 =?us-ascii?Q?0qjChwRMH0+U0jJR2efTNgPQG6FbR8ARarhpBOqb/io8Z1vJ3c21fk1Pu42b?=
 =?us-ascii?Q?/cbhoRW5I+uNcaJFyioSXee9z1QIhff63ikkltFo1B34ZcZJy9cQl9sgUO9H?=
 =?us-ascii?Q?3Qz5vQfNh8dCsXwI3ZJ5Mp3u5FO4WpjAbhCgMTTLE0zl/CJSbOrY9cQfk1Rv?=
 =?us-ascii?Q?my4U6li+GwZ7+q4DeoGQuDYHxfjeXWFuh676m9u5aXWz9Kiw6/FwRPxP11Lt?=
 =?us-ascii?Q?lZf7OBUG27YoHxwiGETa4R7kYLRrnAGZ3HmN2TtZMBjXiUeqOwz5ZtuF72hp?=
 =?us-ascii?Q?bWPd40ql5PnK8sqT5p86dGF8gR9oa2bjg9igEWHXT1nmFr5Kho/iN7DAnrc+?=
 =?us-ascii?Q?41mAcON8cClMhrg/HNdtyNZQu0YQs6C5uGJZ8lermuRg5Pubc6fq+VCWJT4f?=
 =?us-ascii?Q?a2HFHTRaRn6E40AI7LP9bv4cXVKRKixQ2LwegUuNHWewOPmlJOnS6XYVeeCf?=
 =?us-ascii?Q?gZx+y5FvquEaikempbWoUc9BUltnrrj0u2VcmNNJe6xF3apG2pyUQx+O2NfW?=
 =?us-ascii?Q?8xJIROoKSBEpIRTIi7n6ePVrST7qowW/n1AuVtLWu5N6r2hOQTMgAv17qGdD?=
 =?us-ascii?Q?xZZpekuJg52uiJW83WPKEAyLkIjFMLAuFlqnNdNV4JE62+9lX+YIJZAX0fyI?=
 =?us-ascii?Q?+/owEMzYsghPBk1rYfSUAyEkUpYDvKny0gmmwOsr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7b1928-30d9-498b-01e5-08ddf9e3c6dc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 14:24:44.6846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UIIp/Sc1aCgl5uMjesRLlYvCVJS1T6eg+bFOYQSQ2D761lU2g9AGx96FryIOLw6n4GsfxhDu8G/XFazbKV2OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9062

Extend the list of supported compatible strings with fsl,lx2160ardb-fpga.

Since the register map exposed by the LX2160ARDB's FPGA also contains
two GPIO controllers, accept the necessary GPIO pattern property.
At the same time, add the #address-cells and #size-cells properties as
valid ones so that the child nodes of the fsl,lx2160ardb-fpga node are
addressable.

This is necessary because when defining child devices such as the GPIO
controller described in the added example, the child device needs a the
reg property to properly identify its register location in the parent
I2C device address space.

Impose this restriction for the new compatible through an if-statement.

The feature set exposed by these QIXIS FPGA devices is highly dependent
on the board type, meaning that even though the FPGA found on the
LX2160AQDS board (fsl,lx2160aqds-fpga) works in the same way in terms of
access over I2C as the one found on the LX2160ARDB (fsl,lx2160ardb-fpga
added here), the register map inside the device space is different since
there are different on-board devices to be controlled.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
- Enforce a unit address on the child gpios nodes (remove the ?)
- Enforce the use of unit addresses by having #address-size and
  #size-cells only for the newly added fsl,lx2160ardb-fpga compatible
Changes in v3:
- Replace the trivial-gpio reference with an explicit mention of the
  accepted child gpio compatible.
- Reword the commit message.
- Add the 'else' case to the if statement.
Changes in v4:
- Add an extra paragraph in the commit message to better explain the
  context.
Changes in v5:
- none

 .../bindings/board/fsl,fpga-qixis-i2c.yaml    | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
index 28b37772fb65..e889dac052e7 100644
--- a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
+++ b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
@@ -22,6 +22,13 @@ properties:
               - fsl,lx2160aqds-fpga
           - const: fsl,fpga-qixis-i2c
           - const: simple-mfd
+      - const: fsl,lx2160ardb-fpga
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
 
   interrupts:
     maxItems: 1
@@ -32,10 +39,37 @@ properties:
   mux-controller:
     $ref: /schemas/mux/reg-mux.yaml
 
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        contains:
+          enum:
+            - fsl,lx2160ardb-fpga-gpio-sfp
+
 required:
   - compatible
   - reg
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,lx2160ardb-fpga
+    then:
+      required:
+        - "#address-cells"
+        - "#size-cells"
+    else:
+      properties:
+        "#address-cells": false
+        "#size-cells": false
+
 additionalProperties: false
 
 examples:
@@ -68,3 +102,27 @@ examples:
         };
     };
 
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        board-control@66 {
+            compatible = "fsl,lx2160ardb-fpga";
+            reg = <0x66>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            gpio@19 {
+                compatible = "fsl,lx2160ardb-fpga-gpio-sfp";
+                reg = <0x19>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                gpio-line-names =
+                    "SFP2_TX_EN", "",
+                    "", "",
+                    "SFP2_RX_LOS", "SFP2_TX_FAULT",
+                    "", "SFP2_MOD_ABS";
+            };
+        };
+    };
-- 
2.25.1


