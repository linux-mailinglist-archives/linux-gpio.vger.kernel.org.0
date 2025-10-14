Return-Path: <linux-gpio+bounces-27120-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD91BDA803
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 17:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB05E3ABB16
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 15:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647033019AB;
	Tue, 14 Oct 2025 15:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KQgyqrFI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5E33019A8;
	Tue, 14 Oct 2025 15:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760457260; cv=fail; b=ry6vs4bozZ5FNgc3kKWa4X8x4O9rLLCaYDI+SAED4pvck78KhtT0YkFODxVP/rTHjArj+Ja83KAhHosW6vQjzqRI6kyan2oJI3TWbAEN72zx/Fqe7UOkt40XHh1xbaGhSRMojOaLFU8qBRKB6GaWgJ/dVCkdLf0ccEx7Wxzm8mQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760457260; c=relaxed/simple;
	bh=ck2j86CoJgQ1My/N+cjlyYqbkKYATiZ31qZe5/oTwxs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=PyL2FGVQV1WVc9ccHKsY7igvLOUlnw/ld1PT6a58Ya86iL2Ru2JysoSvdra56IqFTDocqAUdYHUxKEoh3hNtZN5BubqlddeG7WDG4/zfG40agga8nleWNIiWJhZaf8MkMKAqw1P3iMgGLxD6vscSuzF5A+RmRCI/8VW1uxSS7Rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KQgyqrFI; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dW54GbOG7h+IKa/KkS51CNUq/WhRQnBlZ12HjOOQI1MZrX3XEyr32XEOwBZlQ43eIEZLHbUu1QxAGFnJucUkHmmS+KAFHvOMDdkL2nefbPMBGVEb8SHHfCFmKRv6XCxm4KMGH0i73g1Nof1aNvnI8BGxAsGVwTIYVODgp42at7xGx9HVET5jfDKJSvVQlYTHOTyJ050KF0ubAMxTPJyWIrQpmZNftvEWprwhTALunXS6KAeZPkxbigD5H+YdNu5vsvz2MhSrbIbsfSeOefSL2MhfMa1kkxQRyQPadyjx49D6pZQS0KE9+0u3+RXmz6n6kkzYDftZilDztHCFIZmC4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxqoc14qIYbIKxurVgXkkKao33LSKfa+uiogQUbZGD4=;
 b=TcC+js5Ap+5yNckAv4m/kgQvgHWlknLTa4aZOXfqszYdf6dEUq9FINGeEO0z39MhSaLJUMl40c/i4AXx35Tt8qDy+i9jvsiXdRf+cBOhHz+4uiFLQ89T4z52FOLm1hNuhoJxIsLDEflFZBCeiY/6JlVvodON6I6NW8BJL+WCG8BLvl1/afRiwd0KTaj5UzBnuG8VnTyK6TKvJrWwbzISmf3ei3sTCqAqu6dF9XmvzWScRjlbOAGG/tvj65oz6cv22Hqlg6RZnTyKJ53XGR+iS9oK2lfyV6HSO0ccAE6iqWTyx+C3+M6/SO5OrB2VF5aPQNjRUSikQH6qMhb6tG3UbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxqoc14qIYbIKxurVgXkkKao33LSKfa+uiogQUbZGD4=;
 b=KQgyqrFIdWtwVMei3HemNrzkQAlyi+elhhena+MO+TSS/aJIr2qGvcr3j8etN8otAEUn9Ia+49UDgXZnnMU/BPn/J4MsLN9SllXSGmkHvmrRmVjcLxi7/Rou3qMOuCoOnsfmD/k/wpmIfj4lqIjXYYUhO8UYAxDPt5INCBQqHa/vYX6YaEBFnzccfLT81iuYgDs7WCghpkCeGAcyfyVeVHvtCgcMkZzrGE7ZZH+9cclqwkmTKU1m04FewukHBT9LWSphLCBZpkWj3YXLZHMrOtANjK9M8A5Fp1cvJF2FGsqSpak8ViHC0DGMBq0ungHfkY1nivUw9pmvJPukq648EA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GVXPR04MB9927.eurprd04.prod.outlook.com (2603:10a6:150:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 15:54:08 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:54:08 +0000
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
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v6 0/9] drivers: gpio: and the QIXIS FPGA GPIO controller
Date: Tue, 14 Oct 2025 18:53:49 +0300
Message-Id: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0130.eurprd04.prod.outlook.com
 (2603:10a6:208:55::35) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GVXPR04MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f19f26-cb17-47c5-a471-08de0b39e8dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L9SU6273UNNWwCetERLH0blPUkn9eHNEtztBHvnzvWfqBAqk+idJtQqWuEc4?=
 =?us-ascii?Q?5f0Mq7F+eQf/zfsKXsm/7W7poxycUyzFZjrN5G6Gv0DLhoivjlEFgJKinGQ7?=
 =?us-ascii?Q?7hZlVhKMxw/5XXVw4fL1qTcSG1lIdVV+ZqfEj/F7mvOfJ0CTnaAXEtQHEmQz?=
 =?us-ascii?Q?UNPgyzWCkFmibyVyK34vDkZa91zjW+wzapVb0bedFDS0c42rSG39QXjDzVU7?=
 =?us-ascii?Q?cDzbqlshNunHMT0AO68MEjKRKDE+BIHK1gpiertDUWMegFaI9Uugz6zp7sap?=
 =?us-ascii?Q?RiYJxJlNEPW7In4zaggtOMqs09GOuEtTAmCBMORIbQLJO9HKgoCFHDL1RITI?=
 =?us-ascii?Q?olLwzoWlKU7o4l0+iIIX7sItBdBUk8Hj/dZuZe4cTQE0GPVcuyGxokhWSHul?=
 =?us-ascii?Q?OCSioxJsdZj5cx/DV7+f6KUcAy/frg3LUpNYit5BsFyGB//8n4KEG2LXQmLU?=
 =?us-ascii?Q?l8kNMek7OKDGSNVGBevG1h+koW2IBferHMeA7YAjbfWnCAA78XBBGrZ9+Jv6?=
 =?us-ascii?Q?DhOsndQmqKOxBT9/FUwi2I001WvbeTK354zVHgCGAKTajf1lJ7FvSBfxuKya?=
 =?us-ascii?Q?F4dkqqT8EO2Ii/N3nfUapsPKRS//FUZlFIxIGaNjYsunHcLPsgHH/+wgYuWc?=
 =?us-ascii?Q?5EcQGjtP7ZzAqeU0zcWV6VJyd9H1l97Wmi9yo7ALmZ40l+53JQ8LwH0hTXzf?=
 =?us-ascii?Q?BQghImGbLfXljl5+709hUUUL6deIazw7MIq6+eC6Jg+Byow92uMNrvM7MjBs?=
 =?us-ascii?Q?z0hFYLt/WeHBnJNLcId9tvKyne1fXrVusKXxS6vGOmwvCHTh5sgUKjT+ArBs?=
 =?us-ascii?Q?o/s/iwt0bERgw9icoqGe7i49b/dQKRgFKYCjMxuoaiV2eyd9ua9Duu1tDB0q?=
 =?us-ascii?Q?DA2QFlZcx0BbvuzlhtEEDknPpmHO0xVtuRukkEsLZggRa1sUsg9XC3JV9Tuv?=
 =?us-ascii?Q?HqAO+rcyMfvqF8HNBin81VBihG7cWMA2TEcYK20tn6jf0HZ2P6J5RZ05o+PI?=
 =?us-ascii?Q?XL0pNZSSyG4SKO4DfaU7gDP6x8uwKhSVtUvItVaZDL0dXs6NYyCmvU7c2EJ/?=
 =?us-ascii?Q?tAxq4zGY2o/nh1zasWJ8QXw0ZZV1Ot8d6O9R4hhckDKDn2YSc3xG3KcCvk94?=
 =?us-ascii?Q?/EtcRGeUgD/LJlVhhzBSYuimG/CyVRP+mDpcsQPxtrX7yxWcyvMP12K0WUVd?=
 =?us-ascii?Q?DAHNVSDLcELI84zFMMEDc8et9w4WOETCyF8pAGSuGooEjzMG8aKk8GmcNdKe?=
 =?us-ascii?Q?bO3goPK0OX8BZ4kHlILEr7Me8JMXC+p1hO7p2ihUdhZcMCrB/jQ8sqvPNoSH?=
 =?us-ascii?Q?izh4jy7G5NXRaQLjdElMF3TicnWUDhz/UxvcW92xwB55MnFWDOKEfVPax7UU?=
 =?us-ascii?Q?u+2kuS16pmseosy8W6Mjvrfh0NGhftcecXtE7vMITdqqEvAi012xxp+NKElR?=
 =?us-ascii?Q?Vw7y+DvZEB68PYKbtTAZGYDHGKMcAqvzI9PMqQZiaESUdh4e1lcvLY2QhK76?=
 =?us-ascii?Q?b6SpCXBXC9T9HME=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t0iPurcwm5FjExz6DD69khEYC2LGKhx2biJYNBiB2RKNZ6l+WwynRo13Tnkp?=
 =?us-ascii?Q?6pkaOsA1u3k3+Hk54E11FdQaZaO8Fq1e9AWZUiYNwF0tN7jI6MxR681oVnoB?=
 =?us-ascii?Q?dfWg7kDDh/YWGdhUz3/bZ1SC4Lv5dxepxAT91i3ByAybmO1aJPGee1XYM56M?=
 =?us-ascii?Q?Fjxb9Ah+9rqhZ3PNCTGdhGPLREbH426K4cxozksvAsgzgCkOp/rhxqhyD0R1?=
 =?us-ascii?Q?yl3+V/TKIsiGoIr1djoNb+K8/mBywLk8Z5Knzay+6y83MDzHwF4S5MmCzgGI?=
 =?us-ascii?Q?LdPtpcg4NYiKyd/Sri4Ij0cL700tPpJ8TRWNOeDaJyGHbTIPVC79jb1AAi02?=
 =?us-ascii?Q?gsFs+K81hFODJk/2a+gsLKsXRUS/m6MFnyVrd6/LUJCAPpKtXMWumQj+xXd/?=
 =?us-ascii?Q?qyNbIOr5beaTi20W/gnuVJDTVf/psCCfBkw3S4AVP1NkqtDQKyBDpwVjPbRD?=
 =?us-ascii?Q?5gTUFFpft/rEi5/LbDIiAtBe4sNuDeU5boow7mh7wh2kuPTvTR5sKJYhrddX?=
 =?us-ascii?Q?w7sThXq2Q/YgPMNcg+6q+Oiw3PrMzlg5N9MRCTErYReHSGZs6RLvRTbUcoC3?=
 =?us-ascii?Q?GjE0Lzo/OlOPChHyHw+eftHwqy8MPyNL6z9wQS2RnGvbBCEjw4bvDFHvzipU?=
 =?us-ascii?Q?30v377fuCuWoXILtLvgkrLCw13mzRiCB+aHFn74laksHSSA0nMuJLPuH82Eu?=
 =?us-ascii?Q?/d8Qzp/tZjh71pn1cH1RK91X/NyvvpLXAXiFOUvVq8bnMaRgba0TD7dD2Qla?=
 =?us-ascii?Q?If36Aj85CA5xDw+PKn07GWm4JgqyECzCK0KIBfnGBZKR4k1aqelnQPleBMJC?=
 =?us-ascii?Q?9p3sqDG353qjmUem9YhAcRyb+SQoZtdxm1vY2hIdM1HJYLqhYGa0N2hBrKYP?=
 =?us-ascii?Q?5l0uHVIvSl6COx+JEW03A3VtARVgJlyHZZjMffaopruzpkfNijAHW5HP4Okq?=
 =?us-ascii?Q?VMHmM2pdr3QarEnS+iNm/OFcysfL2DD+qEwDp1rPgkVF28wHtimDDvnR0/Uq?=
 =?us-ascii?Q?6r/0TkwIXpGgnb36WFGv1ZcuSOsQmGEYmUJOWpxDeAaAbfd2fQN7Ltr34AKX?=
 =?us-ascii?Q?Hh+x1fm7uK5vS5DeuuUwWADKghvgNI5D3Xawk0fkZLPkh7ydX173fV5wa71w?=
 =?us-ascii?Q?dlKpIN9UgeeNCYJlAkYJTm2hM46yyDWz9z+N+qGgFpkwES4/PFWZQWtUYJy4?=
 =?us-ascii?Q?fGS701Q7fMI9vK/yHgUIhE09o0rdVosh1R37+viulVFsTzcpV090EHfnUd8X?=
 =?us-ascii?Q?M0o7UdZ9O02nBt+XUxreC5ynOk/N5v8JHKS8CUDI56P3tRcjnw6qS2Cbehya?=
 =?us-ascii?Q?P4xfY11Wotwx4r4cPlSAEKTWVInJCtCZvY9YAiWn+jmHayG0XBXUpEC7tZ6s?=
 =?us-ascii?Q?zNkYawBWICJVqwxRWa2ja1gJr7cAEvkEwwapLO75wCINMoVuLVzMxBeS0UNp?=
 =?us-ascii?Q?/YNV7OcsUa1azr2QIOhjRs91a0WDrFHozUwFoMFZEfhqco2QoXudKVtslLUB?=
 =?us-ascii?Q?2zyOP2Gexgrbs6EBczmWQSUCH9EUO/rU5eiUGyzeEKvG8aSQsBhxuJwVnkGp?=
 =?us-ascii?Q?m/zRu/ASfXVD8M+d8JLUI9AYlZhTCIyD4TamlLQF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f19f26-cb17-47c5-a471-08de0b39e8dc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:54:08.2937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZdxUUB/9FAeffMNJnDh8JYVAkuy3MOmule6YWDr0Ec3mmYMz6VnDQVEC0WONc390swWCO4wLuunoBmlqaKcqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9927

This patch set adds support for the GPIO controllers on the QIXIS FPGAs
found on some Layerscape boards such as LX2160ARDB and LS1046AQDS. At
the same time it describes the SFP+ cages found on these boards, which
are the users of those GPIO lines.

Before actually adding the GPIO driver, patches #2 and #3 add and
describe a new compatible string - fsl,lx2160ardb-fpga - which would be
used for the QIXIS FPGA found on the LX2160ARDB board. As opposed to the
other compatible strings found in fsl,fpga-qixis-i2c.yaml, the
fsl,lx2160ardb-fpga imposes a unit address for its child devices. This
will be used in the next patches when the gpio controller node will
define its unit address as the address of its underlying register offset
inside the FPGA. This requirement is described in the yaml file and it
only affects the newly added compatible.

Moving on to the GPIO subsystem, patch #4 is extending the gpio-regmap
with the fixed_direction_output bitmap which could be used by user
drivers to transmit directly the fixed direction of all the GPIO lines.

Even though this patch set touches multiple subsytems, each with their
own tree, I submit everything at once so that we can have a clear
picture on the overall intention. The hope is that each subsystem can
pick up the related patches since there is no compile time dependency
between them.

Changes in v2:
- 1/9: Used the newly added trivial-gpio.yaml file
- 1/9: Removed redundant "bindings" from commit title
- 1/9: Added only one compatible string for the gpio controllers on
  LX2160ARDB since both registers have the same layout.
- 2/9: Enforce a unit address on the child gpios nodes (remove the ?)
- 2/9: Enforce the use of unit addresses by having #address-size and
  #size-cells only for the newly added fsl,lx2160ardb-fpga compatible
- 4/9: Add the fixed_direction_output bitmap to the gpio_regmap_config
- 5/9: Use the newly added .fixed_direction_output bitmap
  representing the fixed direction of the GPIO lines.
- 6/9: Use the same compatible string for both GPIO controller nodes.

Changes in v3:
- 2/10: Replace the trivial-gpio reference with an explicit mention of
  the accepted child gpio compatible.
- 2/10: Reword the commit message.
- 2/10: Add the 'else' case to the if statement.
- 3/10: New patch
- 5/10: Make a deep copy of the new bitmap.
- 5/10: Remove the offset check against the ngpio.
- 5/10: Added documentation for the new config field.
- 6/10: Remove 'drivers' from the commit title.
- 6/10: Remove the qixis_cpld_gpio_type enum since its not needed.
- 6/10: Remove the NULL check for device_get_match_data().
- 6/10: Use a bitmap declared on the stack as the config field passed to
  gpio-regmap.
- 9,10/10: Moved the reg property before address/cells-size.

Changes in v4:
- 2/11: Add an extra paragraph in the commit message to better explain
  the context.
- 4/11: New patch.
- 5/11: Insert the compatible so that the alphabetical order is kept.
- 6/11: Replace devres bitmap allocation with bitmap_alloc() and
  bitmap_free().

Changes in v5:
- 6/12: New patch. Fix a memory leak.
- 7/12: Rebased on top of latest linux-next, change the extra goto
  statement.

Changes in v6:
- 5/9: Moved the Kconfig option for the QIXIS GPIO controller under the
  MFD menu
- Removed the patches that were already accepted from v5

Ioana Ciornei (9):
  dt-bindings: gpio: add QIXIS FPGA based GPIO controller
  dt-bindings: fsl,fpga-qixis-i2c: add support for LX2160ARDB FPGA
  dt-bindings: fsl,fpga-qixis: describe the gpio child node found on
    LS1046AQDS
  gpio: regmap: add the .fixed_direction_output configuration parameter
  gpio: add QIXIS FPGA GPIO controller
  arm64: dts: lx2160a-rdb: describe the QIXIS FPGA and two child GPIO
    controllers
  arm64: dts: ls1046a-qds: describe the FPGA based GPIO controller
  arm64: dts: lx2160a-rdb: fully describe the two SFP+ cages
  arm64: dts: ls1046a-qds: describe the two on-board SFP+ cages

 .../bindings/board/fsl,fpga-qixis-i2c.yaml    |  58 ++++++++++
 .../bindings/board/fsl,fpga-qixis.yaml        |  10 ++
 .../bindings/gpio/trivial-gpio.yaml           |   2 +
 .../boot/dts/freescale/fsl-ls1046a-qds.dts    |  52 +++++++++
 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    |  78 +++++++++++++
 drivers/gpio/Kconfig                          |   9 ++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-qixis-fpga.c                | 107 ++++++++++++++++++
 drivers/gpio/gpio-regmap.c                    |  26 ++++-
 include/linux/gpio/regmap.h                   |   5 +
 10 files changed, 346 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpio/gpio-qixis-fpga.c

-- 
2.25.1


