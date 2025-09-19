Return-Path: <linux-gpio+bounces-26380-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F0CB89A7F
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 15:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECC0B3B35C9
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 13:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF40B31064A;
	Fri, 19 Sep 2025 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TxtZ/kZw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9F630E83C;
	Fri, 19 Sep 2025 13:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758288378; cv=fail; b=jM4PoMUTPLp2BR6KOe3grh2qzn97GLnQxR+VQGJNc4s2fIhuL8hIg00+VYL939sMFKk38urnlv33dQ3BFwetYVZphNBvmBcKupIhQCO3bmlWbtG7f16WkrQ/fgqWQZ63sQaLKurE49eiFCvlbPG3NTd0dKmrNwShq4PEu5B+cls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758288378; c=relaxed/simple;
	bh=U2MjCP3kzTGNZ31gKfmVbKWbMiKEEdcwCl2FO2OAsvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kTbqiIUKtN7++MoINsf+D07pazq8bqAUHsm6jLI7M/s1he4GEepN/ldcIAw03fB6K+g4sVTa/jH5f+GYzrLEw+qOr+euRcxh0IZTWY0pP23RXrtQR1o8iaO3BPLskgkqsz9+1BrJB70MaErdQxnImXFkgkwGz3nGUJptiOLfCVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TxtZ/kZw; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFu+oJ0r8U8AtcAo2eZaWxGWTARvgmoop1/ZLlKv9LuE0n4vFah5T1IQVss3o9vfY20si00WPCeAAbaPDyGVudNWka8iXZtrg8954CvF8tmy7ctlpBo6y4Dgqn2Wdvzrjxk6Dvl7DFhIZZDM5bZ9iV+I4kBjfkf7WhYAjulNCn2FYiikH0qN6bRV2jjHjxPfa8Ljxg2f7QIQ35+8/RBhxuS77ZsirJqPTG4NCinH4ddlvM9nB5sTmvslt4EceP/Q6rmD0YwHUqnXn2Jimw2n8REhBa7jvTHAKxmawTy4/G/9hiWZvLojaCpEA+qhJ8j1YARefO/dIjDpnoj+hYCLPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoiYUqseFeimkOzEph+o/8k1t85ygMr07hOBlo3tcO4=;
 b=mavA1RwdgcOpBeRd1X85DFj89fhWS4ooUBqDZiM1ZOdYU5ikI+SE1uYOTdBpKa+AUM8Y2K2mESymXNnstj8lNvBzXBGO8FhxHqq9lgmv0ErMhRXQO2ij84WvB8VMX4q/9P5xFyWQTB7g6vvKmkLoxJBNT8YVm/S4uXyxVxHUJPMTo4g7l9C3JTOrtXvCvemR1NxL8bhO2k/bWmP9YvCmHINvxudvu/K/KZmCSxAZdDNMYFpeEqXcFcOHK+X1R0NOJHTIPMQ2Uu2EooSVSDtyhRqGVzYNNYoDtNHMVpi5QoHP7baWeAD1MWdyrhLUYVr/vVMBla/IJ8dDAbJ/P9eZNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoiYUqseFeimkOzEph+o/8k1t85ygMr07hOBlo3tcO4=;
 b=TxtZ/kZwKJYTmqbQp1zxU7/fHsP2MiV7WEP138ShlYUWCSM1OnNkYF97tGdJIxagtVesCwimzOzhN13c+ue849qubjnEMlnDGTmdvlRvq2ozdwknKk6uunWGKolPxSrnc1gq8nBWxztoQalZRY5oZXpxsyYLeqt95cXw4svmLLIV1kyjHTv9g1AcdNCa5CiiYq8WjJqccPLN+S/D3pyTGcwBZpAvedPFgDVRLkjypcMarKIaE7yqdDwRFyUTRqjRcNLL7Fu+zmeat92DRm8mRvk16/0UT/DwTtXuRI6BOVREsGBaapMpHgqihP4LhL3q4LCj0yGUa+Cazm3aAfMo+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 13:26:09 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 13:26:09 +0000
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
Subject: [PATCH v4 02/11] dt-bindings: fsl,fpga-qixis-i2c: add support for LX2160ARDB FPGA
Date: Fri, 19 Sep 2025 16:25:06 +0300
Message-Id: <20250919132515.1895640-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
References: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::10) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DBBPR04MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 451c8869-998f-4708-1c51-08ddf78017b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3mA4KeXb4OmwrClVZbKVGFTlSNPAis9vdm8x3AIrvysI/N0IUboF8RC3PKuP?=
 =?us-ascii?Q?h87IJwovSZyGEKMc4lGqMSXT9tDVXcbHpFXLGQangDpl4pTmuZGkZKSeZ4le?=
 =?us-ascii?Q?57+xA1LS5XCQZIdTCFb5VadDZRSiHEKi2x1rmnrIWHxjZ4lFPFgkGSk00DNf?=
 =?us-ascii?Q?698aAPs5eRwNS+H2x1Vv1WLnQp6gvGvz44G7TswBpogshqVLhuHtQTk4DJz4?=
 =?us-ascii?Q?seturrW+YZOVXB9g8LkAm7SOmx3csJD5Skh59U09+3Yjb4T442dC1SZx0mfb?=
 =?us-ascii?Q?jrO5yJUpEB5BNpj11k8UApsmziG8XPZhlTsJbBs8OwqaQdA3Do+kgq6EJqZk?=
 =?us-ascii?Q?sZobj2EzuK8UE+A4aOB3x+27C5COB+4eELQ9PtCLKLfjCTxNyCBeVReciNxq?=
 =?us-ascii?Q?rhtQDH/WABbiw9ULF4LH4jgrzy609ChOPWfqObZa0l4w6UCexY8PLopA2qMS?=
 =?us-ascii?Q?ZJzOMMavwGwKRKgPfN61TBvlcq5bhA7XFDT47nkme6emFnYZR6wc1IiVM5vF?=
 =?us-ascii?Q?nTt9jIipL6qQHjHY7HhTmdSrgaFAUIHxtWlUdy/4ewB61otbhGYWhoe3uaBi?=
 =?us-ascii?Q?xYirRgSbYQoTWgOjyWaUaabf/4YpCcdJXGUaeXpumiYPH3iFpHj6+uOjB7AG?=
 =?us-ascii?Q?O7AwfB8ILeRly3rccB6O8p2i5wKJ7nqK5XmbpIe3arpIFzTDoFkSoO1CsYDQ?=
 =?us-ascii?Q?xhfk7BfHjZOTPzhcDMSt4FDNY1YMWYlW2AtJK5bvp479g3K6JQ6fVz/ZFfqo?=
 =?us-ascii?Q?TKifMdRysWWrUzVTcz2Xst9QmnEo1iNOSiglhZN0WYve+lHjnOo92sutMKNs?=
 =?us-ascii?Q?6tXu+cjItsB4piv4G3brCOeZS6e4RjQGpAH0e7Z7nRnkwg/tzvRTaRNprl0/?=
 =?us-ascii?Q?S8Ivf4RlAvteTwOFLzf9ijjLu0GYjwVV6NdJ6hazq9EKyoOxZLlmnFhqLwVm?=
 =?us-ascii?Q?As7AzuLhxPZgyrBkiZy6fhGbpO4GJoYxK6T8krtnRlcfLE6HkMqo3QnzHyRd?=
 =?us-ascii?Q?dOiynUS8oROASevn/rBVPMjWc5Ju2KZkXC9Uxc9HUhGoo+HdRP/JtdjxBLrW?=
 =?us-ascii?Q?3v3YnGM+mK8Sx3pDgBW2YeNmuYUZRIbq6fKvk0rZYPhqguweqbcSVd3bZlJ3?=
 =?us-ascii?Q?NgdE4/3GLOIk+5yqQyB9+e+6/KNrdDr92czWmu0uaBURPYtvOSGoMSGxEmWr?=
 =?us-ascii?Q?jniSGiAF3LRHlkRp9w6PCvRFvtVG4ZWAcGxyWGBxsBy9NaGPJS4oe/qHNHWe?=
 =?us-ascii?Q?tlToc2NDSTbhIBQYNfAhc7j7PCi2EUZ0MUW0SaEYjXHoifgYiANiosElTbuH?=
 =?us-ascii?Q?TqbX5WKGNu3sklv/n9zp6mH0kLPfvBHaQIb4py610fuexlYaAFbwP0VjHgdK?=
 =?us-ascii?Q?xGqHw36hWSG+VIM6ECyiv8tbkOBOkNqFAxZ5B2klyELDPCSKYCC9eIUFoIEU?=
 =?us-ascii?Q?DZztWMgVWbj9WNWCwVytLzUIoJaHkEf0+mvVT52DE4W2FwEZAyD/bQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/eDRtCxuqsQzzBi4Wv7C/nG9RmDFeT6mkkKXlULw6HX22Sbd6I9gRyBx2GFz?=
 =?us-ascii?Q?TnDpuCpwUIdZicSz+MwtOs4zbbs44ICwehD6MjbGCQZcWF+K1dysIgGEVL2k?=
 =?us-ascii?Q?jAtBFGVaK8fOOsQzPsS35JpRqQP6x83/fq2VfhDERr4todMVEt9CQC61oNUw?=
 =?us-ascii?Q?8BAfzXWP9/ZdIhzF6NdGshLcCOmZOsrwXuFZYemMus+UZU3l7cqZ1ol7Feo7?=
 =?us-ascii?Q?rLzjcl5V19SBWRU0CZra3KeihcmXvtaNUrHUEH31KqpqSYD8PXhy8eEfSiHt?=
 =?us-ascii?Q?vWxmtQ7qYh/xQ94xXsjOdh+NL5E75DmRn2bnhpkhnuK1nKNzs+j2f4YEv6uv?=
 =?us-ascii?Q?VJ4Pb/aqJc4ET0p/djG6OKXBSuaoV7TfwnOo9NH+ivR68Jla5Vwe7HXrq8yn?=
 =?us-ascii?Q?eKGdxpEiAQT8N3o2IEVqtmh2Jz59lJ/259GjGO2wQRICY3O/AlGQWPVBLDK8?=
 =?us-ascii?Q?At8otrRMmgLxbvwFF4IqAioCJfvzYGZaFaGNxrPRma5WdoX0mV8CpFnkT8eu?=
 =?us-ascii?Q?gkTx+Sr1KQ/OV8AYpGf0Gs/iNEEa9K1IO2RFsdLluZDk5zL340ZCAotD/Qnt?=
 =?us-ascii?Q?eLt/NxCxnPtvHs1NG4p+aqOUu3Z5SDo2v18aBMq4Gs0a7btyNqNaADNBRVLF?=
 =?us-ascii?Q?1PHynQOwFgHrwiLaKee1D8QVwEbpoEYel/QHuTqpLS5LzN7Zut2Ehe4DpYVD?=
 =?us-ascii?Q?ij93bx9HzSJgb8KZfXCkOni+uNCqQJsmmKFDOC5MvC5iEcRRwQRu/WLVOBs0?=
 =?us-ascii?Q?wRSsAcj+6SfvpDepSllb2AXzG+yqwRRMrlkbROTXMKq/AcF0TjhSssar1yTP?=
 =?us-ascii?Q?w1lGfz0qAshZ4JWIkhSJ7m11+pZkCPVIrQjNxxvhop1xm6GYW7FEk03P1ORo?=
 =?us-ascii?Q?lKIxa8xQlBGMIU1nJdpwBpgzSp58hBcp+bI7GkK5z1r+kF1MAok9B8hpWTtL?=
 =?us-ascii?Q?vaH4epF7LBDFiyEbz/gTyRWUh4CqiD61Hg5seg/ZW+eAvWfkNaz9ExgK2jx4?=
 =?us-ascii?Q?XK353nw072biaAnCMYu+31+zrYHzR1/NlG2E+JbHSNHmTU6LaSxOhLR6RVr5?=
 =?us-ascii?Q?arFh8zEd2WmPQ4e0dzXXr17qm4Mi+7X8p2Rl5boKqfmr9vjpyO6+K3wcpuZK?=
 =?us-ascii?Q?q5Rx5S4xq2u1bocY4GX2xQerXT1sM0j1yUyVr0FqGVsJTWbmAk96ARwsMM+c?=
 =?us-ascii?Q?YWAjN8skMGX1g7Dh/qDAyEJI5v2L0LGYxmi8JSXUqGnw7AFeWp/5Ln2enktG?=
 =?us-ascii?Q?JavDy5CMGzF0rd+1gScOmaO7S007lN33i3V5S7N7qJ9BscitqbC5wFhTK48W?=
 =?us-ascii?Q?ocW/wVlqyQ7flUfZEaj0EYr7AYLg1RBF6OFxqTjmU201/wVW6k8ShIrZ5cBa?=
 =?us-ascii?Q?MKx6XHUKtbMjF1HPFTkB0lxDBrfPYEFgvyZH7hEtN64vUTmyBuI6K18dj+ld?=
 =?us-ascii?Q?CBp39FI4Zxn29yHiqXhs1plF47HvLvfPnd9hdeZ3DXYtYSvEeapkEDBPLlah?=
 =?us-ascii?Q?zcAyLcyQe5MqT6Yn6NM0twfPAYt1F2MPMKOhkl6aiWzXs60x1viGdFDhkIAB?=
 =?us-ascii?Q?R2PKDtjSb0WiOD76ORcK+Kf5BzplWQkxdmCb+W7L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451c8869-998f-4708-1c51-08ddf78017b4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 13:26:08.3254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kEzPWYhb9pcq4FcpxIUPW6SV5gSd5YVLUEnywUDtLGvr5oEkf1ngoZmiKmLGtkR0SKCK1YyGpytZ7m9C2kKCow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7737

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


