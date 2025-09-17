Return-Path: <linux-gpio+bounces-26288-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0E4B7E1C2
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29B0E326B35
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 09:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873B1315D4F;
	Wed, 17 Sep 2025 09:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="k+LXCaPz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D81E30648A;
	Wed, 17 Sep 2025 09:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099898; cv=fail; b=A1dfW/cByN96/24pXTPC9S7YRdSKLoIfP1QZhP6tdXHpJoPKfwqcMDlQHhhTr4Z6VqXVrh8GoM4v67b9jZsgeQHQ20lyVQ/RRgr/aGyi8R0z6K7ZWUeerbxahgXjQfvY6xsKYhUp2h2eTaA35Bks7RTt48ovkA+Mn1L0G9rwxJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099898; c=relaxed/simple;
	bh=qM37cXikNZTV/GFv09zp4MF7YHvubVQgXE6/X3e0/cA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XinViNzJa9x3/+gtLszdAN8R/ctoDDOveyiXoeTTFI/tDwSq62OsZwqgGkFq2jHeI/mRZOvFNXt5H9JhsWz8lmcNNDzCniAwdQqCzPXR+mdttYKbTnkehhgsjs28vYP6Cwz7jyuswg64/BdXceq0EykBEJodasCwtsYPCQW+8kE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=k+LXCaPz; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNJIOE+Aq7J5O36BjAElMHN22dt8Apk2NcqsRdzCG6Ir3Upal0GFr1e0Sd2RwCFWFxIpFPPvS9RrdfsBwey2ClkoPotDrVIczoe9oh8uFhsEfWQvw3KdyTNoAfYeQmN4qBga43MBG796QKkiAp36+DKP1RQ0VuM5HQDY9bjUwdnmZFQJMTMhJSIdD4s1e/BWdp7816cizeEWNwJdkINll0t0Sw7Rj078E/fiqMqumA9XSqOlP4lxFUbRQkXvfQB07Q297PlSXkvLJWRUDkWvuhlVuSmGx5YkzAQPTFzxfUOWU9WdGHoOTsgSnJV5e822iuUOG2losPXE6unKA6v2jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brmMD+Flg6+nxw7zBw2cky0vRnxouR+kKR9x3GMpeBc=;
 b=K6zhAhOp4VjZY5QZOXaJfDE1aOFTv1hzlldCf7qvMoHhmfaNJuzy8xet8JWe6pR4baY81Q17CEUB5Dqg40EiF2QO0wFTzqIYl+fqyt6H0xOA6RVW2huL2gesNs2bvAYNqxQXwB5yiApd0riU/ydDDWqYitlPDyRxM8zOTqvmv4rzgwN68R7D4DAkriLmMTKWeyC7Ro10JfPZazk1sFdKnAHPhRqKQbN93hmveh9hj01Tl2ooo4GN7bSavbf5rzEtKeTMLdYOwGtPksKJdJ2lWxuNe7o++H42EnUW7btbhmigC6rUssa4PyQWlhx/qAOcg7vz4zx5xUZVSqkBh+cBxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brmMD+Flg6+nxw7zBw2cky0vRnxouR+kKR9x3GMpeBc=;
 b=k+LXCaPzkoZPzzcZV9YhcOtDd9NMwnegthPgSKwNwIPCHzgwkaacAsxPIgl6AWzVkG5IJQFnZk1lSKwbL6zMsriiZxZSp/NvR3W6ghuknAUUz/MlisCRDyXvEojqhPmSWQvnaJ7X+u0IhSF2Jywm1prilNBbTg8ivtWXqvC5ys6+98QJWRpKHaz2opxtCONlFuVN0t0ttvbN3BfGlXaM13gM8HQGyao0pS/QnRfIjncJkV6rtvb9O0MuKPPQFX7ixnJSoVT0ahTUjiExd4DJRarfXmNMhHeyuFXXqQ0tJOoLEMxVK6OwY0m8JqdpPVh1XAdSYjpZmfwXGGV6N9hlVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PR3PR04MB7387.eurprd04.prod.outlook.com (2603:10a6:102:91::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Wed, 17 Sep
 2025 09:04:51 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 09:04:51 +0000
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
Subject: [PATCH v3 01/10] dt-bindings: gpio: add QIXIS FPGA based GPIO controller
Date: Wed, 17 Sep 2025 12:04:13 +0300
Message-Id: <20250917090422.870033-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917090422.870033-1-ioana.ciornei@nxp.com>
References: <20250917090422.870033-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0010.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::20) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PR3PR04MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: 562a0c84-bf6c-44df-d470-08ddf5c942ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RlLqvsfvt0MKlSPUzowuohg6CN2n3i0aMR0GUUHWlzr/gB6xIierjySAh0DR?=
 =?us-ascii?Q?AiD59zMbrWyZ+YDJ/fZnr51pdHqLam/0CSv9WFpOiv9nlos9dInGm32BqcNh?=
 =?us-ascii?Q?4E0w8XZsBRfeJkpESUqUcTVwe/Q4gIq/2foI86OM2SS1YPF3APwG7dhBLUIG?=
 =?us-ascii?Q?Zx3fzvwegG3eZTO6atf5vY4y9r0BbUCnIXyscaTkSHyOSSY4oEkzz45Vzkd2?=
 =?us-ascii?Q?F1NcTqnO3iIL4THzLV9EV7ayHJtDL3KGKM/8XcbenXvb9EpjhqxraGTb9e9l?=
 =?us-ascii?Q?HS80ZyQP34h+NkpVIVX6USew/hpJoeJ5cWDDCZRSu0+WoWzUg9OgDJriK9yv?=
 =?us-ascii?Q?KZrmyZJbg02iXG0j3YwxqoIRk4o6j4p5q+GsZEn+eQL8VCRjYoy6iwejCx43?=
 =?us-ascii?Q?zFV/Zzv+QvGQrHObh7nnC4FhgWH7B1DFvNvl0qIPl2TOWKjtOEenlwZwITWV?=
 =?us-ascii?Q?wBzDrAPwJzV/zG4F3Y6MiUwHGcm6N2Vnpfnz2pzhLSBb/+7lrSgXJ+0QQMxm?=
 =?us-ascii?Q?B74/NFRLBRqXDcRla3HRjD2/rEcVaM2U5KFaQEw8EP1BJdpgiZvOzcaIsFVa?=
 =?us-ascii?Q?gm2VE2COz1AsgL5/H42X3HmgNhhdOmFw1aW4TPH9zTj8qgHznCDeubnVN2fO?=
 =?us-ascii?Q?ZXi2pC/TT4pUPaZVpdyAfEWvL19IO8/oW0cQaZgqCpHsYKk9eY7V6eZJe1ry?=
 =?us-ascii?Q?FQt7eaVm4I1R5fLwhq/pcUoewdyG2jDw1bbJ7h0UkUsEoxCfn0hRTI+/YCdc?=
 =?us-ascii?Q?l905Y1Q6OnxcG9uoyXZAKe0kuuWza2gXDNWzUqHujtudtRswQ5nlniOqI+4n?=
 =?us-ascii?Q?GLZB8ne84vu8gxVN+kMS/6119Ti0GAzdwFO3g85txTYyG5eDhfKqEwj48XoU?=
 =?us-ascii?Q?WuDr9s0iZ8MlYBpsFLyDW6quogi/EO4BFRntWMOg11IQkJTLa2xQps0D7oE0?=
 =?us-ascii?Q?GrrtJC0HPkdNbAg2VMjGLPJNO6+6holczj2PqQ6cwhrNPFWaZ2hX29JV6xXK?=
 =?us-ascii?Q?u2oa0l1AhShiyZ67yhpcoFEHTlUu43RGH7WJHdm5DQSkrVJ7Nt0+8Y4HrWhG?=
 =?us-ascii?Q?7WE2EVRmuy/D/O9w2GZUa0FqCS+Tu7VSKScVxM4QadgtmyeDaG9wEfghEZ/A?=
 =?us-ascii?Q?BTRU4WyyPNI2rW+jqVgHR7qVGONVsc/4FPAYtfYo9trmQIPSaccSPYfkRYdA?=
 =?us-ascii?Q?yvUjO9IOTRXfPykk02kHqb3NKlmP9ZyqR7Gg0vCILS+T4HctxMU54JQFNpgJ?=
 =?us-ascii?Q?Xwhyo2ja3aH25m9HF0v53pAdz/+O9xE0Na8ponN6d52IRL8RMgnUcR+LgIX6?=
 =?us-ascii?Q?0iMp+qYLtD0b+j69UnWyGhydVJYdgB4jrTy1DVOaiMWyXiuO4HA2J0/53p/n?=
 =?us-ascii?Q?f6vYzSWqSBuDF8HiNEgmVfEgq6xXEKcX+vRh0ZFVX0YgzNMgGsZjwEkqWS1u?=
 =?us-ascii?Q?BQ+UNS2Y1FBJUVeNtDPD1/6HMoPzwI+t?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I2E41Z4rdnjBK1+Idq3kj4R/4xyUNHvxSVkBsPANLq2FXvfXS7gwUmI0eDbd?=
 =?us-ascii?Q?+fRHgQEFt5w0u34x4cBl36TmZxYrULoQ6rQD48SDLzxhsvRbVqMPi708HQqG?=
 =?us-ascii?Q?yBz244rUUFv8ig7us2BBgcpCA+kclv4weuzH2uNAnI3JthcsIE8BTcTB2t+C?=
 =?us-ascii?Q?q/GLSoQMcSp05rDu/AyhvdLlGQNBN8HcpOnbCi4AlUiUvXyrimQYDZclS50/?=
 =?us-ascii?Q?L7UmjmlXvHx6nQlkPu1J/HBcbxS8zVBtSOkc18IJ1XciX0Euwz/Lu9ntOLNL?=
 =?us-ascii?Q?IjGqITJtQRPk5bYqzu0fbnMx/xC77yjtja68BJGB8FNDLCuCyY6PCWX18kNc?=
 =?us-ascii?Q?9Ve8iFwcMpnl2njMhaHwgxccGS7ACu5XuBvi1J1GCUxz8yNbM5MUVKc/75Rr?=
 =?us-ascii?Q?AHmKQKELM04mm0xUZXoVYVzORfq0L4jwy7dAzXcSjF+Ge6vCo/qEbv82i/i5?=
 =?us-ascii?Q?N3CSQjbL+gfZFaVYXL4Zph9dvRhuvYDOqGaY3oWBUKlDlTyoTD+e5DZ60GSQ?=
 =?us-ascii?Q?CO4ks+O2ZaQ04BqOzWBhatgjg6B009kMOfTZiQrN6Xeqm588LNOVrQ9RsOOJ?=
 =?us-ascii?Q?avNXVEn/vUTtKWkl4gOt5/uTnEsZx/eXK1Bw/qfnNbRoCxJiFOhbVvRMQ5wA?=
 =?us-ascii?Q?lWxOv/YvFfufiVvneNYkfYjlvqWg2ewyKJRLTAm8McUHsC+Tch8uupES+ZAH?=
 =?us-ascii?Q?ySwZHHwrF2C+eKLXT/fcNhpBhNNFbvCTIyXO35YwR7cOsBDRuj0jxCi693wA?=
 =?us-ascii?Q?INr0YhHCfecBNzqjk5pHgOnBlXzE18Ki/5sJB75ZlBLeLIX9HLVGvKHsr1pm?=
 =?us-ascii?Q?FmOZ3TWV/exv9lyM2Vj9FbHnY/vxfp8XQjL1Ie/yDmXD/Yo/i7zz9/FCSgvC?=
 =?us-ascii?Q?FjJ2zgdezC3FJPDTliHE3KSLbl7S42tHXs+zJE4psmQDKcoE31iqIThF0kLX?=
 =?us-ascii?Q?uhmr3sa+Mb3jNRg0rs6mN1Dj+n2q4axApQHtqg0/VMFdCGzNrnCIVuPFn7/L?=
 =?us-ascii?Q?HHgLcMei2ln0NVpRJk7b/rlpT9c0UVQKAr0qko40hk/W6XqjgcF3dDH/0ELp?=
 =?us-ascii?Q?Fl9gDiF9U+fxtnxi30Eo88+eF5/ANhdgxsrrPSVuDVUx9AD8WsRJfW/3mXE2?=
 =?us-ascii?Q?0CEaE4MujRXNtGzKpU5wsPNPEiQhLpoaQToHF/M4UqilfTWor9HXvjCN20mo?=
 =?us-ascii?Q?2OiqwIEhP9aDuCWyI5MjDxUZTML356zlgVRzbuhM3Cd9UUXe6opgtuLB3g0A?=
 =?us-ascii?Q?kkUoQCuhq1B8T1CUvTYbutylKm6ioVyyCpR2dCvyt5eU7AEZwh5AnaFkI92B?=
 =?us-ascii?Q?NLfFc4YZ/B4yyAYlhJ4fdoytaire/TrCSYOHTgM75n0H9sQBeSPIRiDo/vJn?=
 =?us-ascii?Q?TpKgV0RasnH6+AnxX5st/bAhXVs0X2pUm1KpPBpPyB1KfAbczH9iRIDByW+/?=
 =?us-ascii?Q?cDHAGjA4Sj68cczY+8/XCWbdLlKHWe3qPcQivUkYy5JFqFNLea0o5GujEaCr?=
 =?us-ascii?Q?Rbt+XI8rQ2ZWZ4kYk3x8t0yJAebC+ZC36/S/pHyqhIrgE69EncLDarrEpotZ?=
 =?us-ascii?Q?dgmNBZ8/o+uhvj+lSS2e76E7FvZs+CYhxiXOc73R?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562a0c84-bf6c-44df-d470-08ddf5c942ab
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 09:04:51.4719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WT/S/2fwrl25C9hSJ6OePg8JrE3A8puE2qJKC1UJffQG1wsUOF35S+vYJm/qxcy7iAnSI5FMiw525MtX2N2Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7387

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
---
Changes in v2:
- Used the newly added trivial-gpio.yaml file
- Removed redundant "bindings" from commit title
- Added only one compatible string for the gpio controllers on
  LX2160ARDB since both registers have the same layout.
Changes in v3:
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


