Return-Path: <linux-gpio+bounces-27119-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8597FBDA881
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 17:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 411A1502926
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 15:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324FF3016EA;
	Tue, 14 Oct 2025 15:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M97Uzs4w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1667E3019A6;
	Tue, 14 Oct 2025 15:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760457259; cv=fail; b=UQ+XnRF5ZMEnffda+9ftMfmgFbPAgreyGnMpNMDbK0wDdH0lrxe51Y4FiAwSBfS+ZWBsqoM633doBqDG6z/3NG1WEc1jk8qBauXqc9OwxFhtN+Lp7q/372p+ePQX2co1FqXuSy6Iv0y2fUYG4VM7gQUByprMG+tOljaMBeePQM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760457259; c=relaxed/simple;
	bh=sPSRxTDlsSAcb4w5mfrYQTQMx41H8paSohh4cZg62EI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f2diSdrWQSEbKQDfQqponEEZfi9i23S1OTvUFaKtNxIa1xn+BMos6QZLfD4y1pe+5Dl2Mr7rYCr4Ytf/FGvMKHZ6oI/0Jcy6r/bUEPLojlTRlaoMLtHVyL3GdSEAJSwxSLPAIURYALl0jnQohLsd7cSZ4tKvpTugv1p/ux83QpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M97Uzs4w; arc=fail smtp.client-ip=52.101.72.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOsQq0EiGGSkgncSFEeA6dyzW602H7k6Vdz1VEIUyobJ0WatWksjPYfcBSV4OuhSEU0JYMeeSvqdiQekYE8sVPifhV9fICUjP38eWP63DrL9GjlfyxfA0Y36DyWiIBtrqrLG2CfCQkRfNi/Il2R4YWawJUcRRY5WvFaswOHlQdLGJcG3RKpgmybpsokJXWBeOltQ367mEDUGCSRac2B7ph7gt5ZB4mwQGqs1zNH9dO4TnEDcQqBojTpEN7qTfUu7Z/QYIRRGhJo4tu4CRRW5FFGkiWDu8otqhlVk8TV14BkE+zPj3JVf4fKifWsk15y4giD47f/MjQEF89QggKjlgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKEF/CD2Vq4A7A9F84fPZo4yPQC4CnwgacB87WWv5ak=;
 b=m9Qcp3COUbNr/ZpCryVAXxzXxqlq0EYdPdIi5vq31N2LOMVVtYpfLaV7yE5o/yyzQXsAj0kLl/c71ui/4ttSTghu9YC0WWnY/TxksAKoLO1elrwdiIyxX2sGg1OdeYkMtrakcvdWOxnG3CKNckH8Dm+zqtxZsrtGigLEe+Qe6FSBRKzHCBBFnv+RLaKLcIk8pLjFGdljdNfICBtca+176U9EWxmWA57Py/1N3665HccayqNrOdEjwYbcBYqBjm2cUOZCpd6HEv4P/Sp6tNYWPK3J4XO2m1GpXdJbzvsLuCiFqS7L+AK7tU+ZtCCEbbaKHwYWEEVTw0vHlAzMhYXaww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKEF/CD2Vq4A7A9F84fPZo4yPQC4CnwgacB87WWv5ak=;
 b=M97Uzs4wQ3QeVutxsydD0DJ6HPXDie/+VsyMLSpfWXx+o+HJC1rhnKdifyaz8ztfSVMEE332hmTnCF/VnGZR5yqGCdU3lRxA96oiRIK028Wohn9+U46IFiuwGMfFJRddKRn9LqOlA3Bkr1PNxBj9Hn7dPRMgsMDETXkEW2i+6vX4/knPRx4PPrEMvVwOvquPYMML9UDGTMz+TBP/AXaZNGIF5/f/ZVf5JqTm1Xc45JjG4mHo6ACVLHjWf64pSfQkmtAPogmIdrXtmC8EvU+3fGxZVlR2j6fVmDBdC0ZlBbw1J75KNDOxnSbJLirLhSBMKn0RLqOqVy+C6d7zKoEL6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 15:54:10 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:54:10 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v6 1/9] dt-bindings: gpio: add QIXIS FPGA based GPIO controller
Date: Tue, 14 Oct 2025 18:53:50 +0300
Message-Id: <20251014155358.3885805-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
References: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0112.eurprd04.prod.outlook.com
 (2603:10a6:208:55::17) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PAXPR04MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: d7719533-c3ec-43fb-b59e-08de0b39e9d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kugROTE6eSPawcZRIYqbDD125Zor09BH+GFHaVCKDdRodCesxFlPBgL6+y2G?=
 =?us-ascii?Q?LJs/BxnPtIysZcBhzD6SjLGfRY07P6ZChcxefPb82NeL3bDAWKRNlqgwc8I4?=
 =?us-ascii?Q?vOEHSZPlOAvMZXMDn/JInfOXLrAaWro0kz9ThAb8pJLPZV8yaVAbAbYUfC7h?=
 =?us-ascii?Q?eW+Iz3q/fTJwJ6lB7meI6Hp14OKYnjhgcbOoTzeGYBhceJJQLfG0t+ajBTsU?=
 =?us-ascii?Q?7kosYvwab5bxnP7OVxBNv0wXJD2toZzdQgx+3EDl8sj6iD5n7F7FOTBmnXNK?=
 =?us-ascii?Q?imy+Lgb0FBlt5PNc7mvdDt85sS1BgQkkFoHxfnotKluHNdkBkSy8AqPHDXVM?=
 =?us-ascii?Q?gBhJvyQMYqUnfoq60vhQn1D/lM8KXPfSAATAM1XMc9dtAqCzJcW4tXYpOXSM?=
 =?us-ascii?Q?MaWVzB6CFDazZsDRgwmlywr3r9lSQn/CNuDPWg7LLzpzv1KfUP/72pt2o+ON?=
 =?us-ascii?Q?CtwTAmZHijGdMnf+DZAnYBlBd8Z/D+kAgQIlfXXfxRH6A6cG7upStRq+cWcW?=
 =?us-ascii?Q?a/lRlQR9QGjWQTnryzqcj4TvxzcpcvM1hD/oNrfPaok4hySwLmBYB7DIUhyZ?=
 =?us-ascii?Q?54teU0Olfjjb29N15iyS5A0uD4Hwqp12kTkPVAlFQYuJ6iAP7O0QcHMyaaOE?=
 =?us-ascii?Q?0exWCzvdR6EF+ob5CI8Sd/OQ+ewcY+7C/FtfdqIWA+MJ8hFohXJayrKNm8S4?=
 =?us-ascii?Q?ThFPZDB6qYpIzuZsKYp/J5fehYsmomigAPE5+rYeoxJzwNUtooDzmKodNUZq?=
 =?us-ascii?Q?v+kcUEGNb2XlT3x/iBYB2LNZ/z962Atx6H3L8oEeiYcUjGfguRmagr411TVL?=
 =?us-ascii?Q?cmz9/r6KkY1Fg2W7nKHsnlpqTXGz+okOCx34GeDgbm5GPuVmF4oKyZyLadNW?=
 =?us-ascii?Q?3n7+675aG/UgCv7JnZChD2by/jh/IJ3zxAR5U5bsDu0XANaq/NxBvtcMztIP?=
 =?us-ascii?Q?PVSzwH37Kqg0sp98/6Oejw62NVu6PG0gCaxpijyKQSfNiQFhvdv3bLKlBkzk?=
 =?us-ascii?Q?W07H9HqIQdWeb2MAYFUydg81iDV4zrFRoQmhRYXEN8Yw4gApQrfcWKmcz8+y?=
 =?us-ascii?Q?xLpTrNKHfHmCRdnZa9w4qI1D+LSsj+r0lYayMKV0CXBl4TRRmAB2mBOdeaju?=
 =?us-ascii?Q?qht9QWtZReFfb+CHIoeX0E5H+VdLMzfcABecAF3Msi3V0fBWvNHCmvqqLnGZ?=
 =?us-ascii?Q?mHtrOZ3L4cu9N6PoDFB/3fcH06OXPJ19vsHrIxr7p6BJWL7kAzPtHVRzP0uf?=
 =?us-ascii?Q?K/X0tfU67e6Ortco5ZtymvlderDtfvav8i7B97PFmNoC8j+x26MU3aL2yelz?=
 =?us-ascii?Q?P1HnI0ZQ1LOSPoIWhjsogBRSHV0WfY65H2/FdM8VTbFTWfIe6y3iWjt7Dbyq?=
 =?us-ascii?Q?t27sLD+a95nwIkzLfDfq5yg7aXDS5Ht7t/LjmTpCmYnQRQxwwG1w6Nx/ARjk?=
 =?us-ascii?Q?MO0/7wdmU+5as1yXxmovU/vi84Z5UqsxJdcEtX4LeLDhM8d7jXA1gsI0SMLW?=
 =?us-ascii?Q?kHtOYAYFfiK668g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2sfRakmojdYlM7lWGfU0Q6e5cUYLFHft61ksXeUWF14rc8alO63p8Tujso5q?=
 =?us-ascii?Q?EUtsXpaNqbPHK32YcldmYlGUZ1WHxbeFlwJM6bpkMKuUgnOxmREK57wSQEYd?=
 =?us-ascii?Q?J1bUOiqCbpH2qcpIMbgUbQLMs23YsPEtW44THXmGDNkHobMBof9NGoyvVyMW?=
 =?us-ascii?Q?BxidAnYvLLc9/78y2tWq5HrsNWApLbcQO5FnFbqYQ/69viRUdfJU7nwMYGke?=
 =?us-ascii?Q?IyH3F3HiCvI8YSPPE3xw9wtbvzsvMVyv7dfbZ/i8xntu/BCpnyMi5uM1hzyA?=
 =?us-ascii?Q?xthPmK35H0cmmP3VQB8WB3voSqV4BPuntjjBWGs5Ag8yeM5kIUKh+gPH7a1j?=
 =?us-ascii?Q?IN6TdOfuFnfhk1t5Pf5x8Srch3T+TUadriYlTRDfQqnbRs1sRTaD7GzMjlYY?=
 =?us-ascii?Q?BjwUF83qr9IybOGATP9fp7pIZfaOYLuq6X5LZXjgXOtyM5vT/0cDxKRODV+k?=
 =?us-ascii?Q?BMNHiKuzjruvDfIcQcHVTZQZqSo7N7OV+igQx099b9T3vURL9BWJR/li1479?=
 =?us-ascii?Q?Kzazsueu6g4TbaVZt/jashgR74d/W61P5xv04Y7e8tmBSX8uAlXLNPJWyuEf?=
 =?us-ascii?Q?DAfx7yMiUaH4tAPofGPQf5ol3n/0zhSuW7cHJ1pBEK9CWesWBhvvca7Gmfa7?=
 =?us-ascii?Q?MNLXT1uSLJIIgwHAwkfhAWFuK5zWXFtZzoXu6OIJ6AfQxI9p5Gup4G83+aNO?=
 =?us-ascii?Q?Og/8l19r5uFuJ+Dp7CR7ieQBv9wJvHwiFx1FSKsKiPYmju2RIoXn6q8hDONW?=
 =?us-ascii?Q?0pQWowNViTMNFcn54OmhRYUeeGFf8YMKq1Xi0x1hZL0Myl+LST7akXd2zFfN?=
 =?us-ascii?Q?J3uLkPXzrXzuiNaY0RxY5hg92mORDxbJM6TQjtDlaKDFr1P8gSF3c3sUict2?=
 =?us-ascii?Q?8ubgxwBvm2DThN6S6PfhD3hs7htPD0ikiMM/aXHXGvkO8yt3rwaF2iWqNyD7?=
 =?us-ascii?Q?tNKPCh1SJXQ05umAUURKBFXV8Es6mw0U7R8TH190aWcjijtntI5a2ZEwOVXJ?=
 =?us-ascii?Q?JLkCsZ6tMYGe/EQLOz1LZNvlhDR7GjBsNrQpVPWu/q5Hl67J84hNBd00DxM4?=
 =?us-ascii?Q?oMKUW4KdzRTvaQp51tuLH2RZenvDz8Ngm4z1wBgk9mVMv6svf/5Yq4vHwGph?=
 =?us-ascii?Q?13ajsQxap1GANDRjLMbF1M1icpRM9JapW/aXsxtKfm8MNxaUoomg15vYW1Hw?=
 =?us-ascii?Q?ClTzLo8/djowhL5t2xE75IWNCAUKITa8sxZe0XhiSI7ILNkFHhCMPjABDMxu?=
 =?us-ascii?Q?vxny2mraxMrAjZc7yiNBJOFqpHb+kpC1WPDzi5X5AHCNLFSDNHu2ZpFgk5CJ?=
 =?us-ascii?Q?9j9aoCNmFfs6ViplepTvxY1K0BMfhOovuIJrREr/nL1jxhAYJ4R3Q56B6Qdd?=
 =?us-ascii?Q?TkRGuPylGbt7HZxeAiCTfi3picQx33LUsKdCVbOeOqlUbntjmHq4QSi7dni5?=
 =?us-ascii?Q?Va5f4Tp3fliK4MMPE1SiDD9wPOCSfGeV17fkdQZdh1aOkk2UKHBdwTSfZH24?=
 =?us-ascii?Q?wY53HSUbBtGDGC0J8LHqQGxsxBGQ4JX/BxE3H/9coeg/bxapUECCZIJhvC4H?=
 =?us-ascii?Q?oKFwSUYaP3O7vttc7PdIyV/TeA8BLPUUKov82FY3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7719533-c3ec-43fb-b59e-08de0b39e9d8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:54:10.1360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/4i+BLhsKEWox3OWKbxpd8C3fPsd/BmWXmp8pVe+71JKTP/b/hEK2vgF/XaUoMXuoRqM+00wxT8SbNusLeaCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9185

Add a device tree binding for the QIXIS FPGA based GPIO controller.
Depending on the board, the QIXIS FPGA exposes registers which act as a
GPIO controller, each with 8 GPIO lines of fixed direction.

Since each QIXIS FPGA layout has its particularities, add a separate
compatible string for each board/GPIO register combination supported.

Since these GPIO controllers are trivial, make use of the newly added
trivial-gpio.yaml file instead of creating an entirely new one.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Used the newly added trivial-gpio.yaml file
- Removed redundant "bindings" from commit title
- Added only one compatible string for the gpio controllers on
  LX2160ARDB since both registers have the same layout.
Changes in v3:
- none
Changes in v4:
- none
Changes in v5:
- none
Changes in v6:
- none

 Documentation/devicetree/bindings/gpio/trivial-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
index c994177de940..3f4bbd57fc52 100644
--- a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
@@ -22,6 +22,8 @@ properties:
           - cznic,moxtet-gpio
           - dlg,slg7xl45106
           - fcs,fxl6408
+          - fsl,ls1046aqds-fpga-gpio-stat-pres2
+          - fsl,lx2160ardb-fpga-gpio-sfp
           - gateworks,pld-gpio
           - ibm,ppc4xx-gpio
           - loongson,ls1x-gpio
-- 
2.25.1


