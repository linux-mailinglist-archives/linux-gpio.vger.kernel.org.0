Return-Path: <linux-gpio+bounces-26378-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D13EFB89A67
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 15:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 788011C25B4C
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 13:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45EF329BDB9;
	Fri, 19 Sep 2025 13:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DD59MhYU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52952239E8D;
	Fri, 19 Sep 2025 13:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758288372; cv=fail; b=GDnb21VnZgJPVAN7aad/QoV+hMENusu8X5C8quot6Ygk8nMHu01SvmOe2Ca648HNQzvqsj38bsr9gspUFnDIBpPqy6zI5DTp7Ag4L0wPLlInDS3utrj51x3+oa/umG0rHgzhIOlfUOCB86M0aN+F4S7ajIEyYl2/f65WUpywfVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758288372; c=relaxed/simple;
	bh=EobsPfmPH0Y0WIzeDqdicuiWz+Mn595KoAYvsBuLkRc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HWsWR8DmKr4HGEIOmi+nbnZ/ieKM9UAWISFVjeKNXBiivoYwPXh0rhmPCpqN6u6WldRsqMTXMP1zVqVwDi13aCU3XPXAC5jxoDfSdnqPldrQAAycTNwc1UHnuI3ZyH/agVO5EBQdDL+/XSyqBoDLHcqM5txhLV9C/fhPBqk3LSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DD59MhYU; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIq6dhQj/tAgwWNfaSgHeeBkX/tSr1u3xT2tXjRdUQ+wlymqDgYzZebFWoDSO6HARPzO+Jl0zwwgRytMhkm7JnOM9neW1lv36TeBjzbkv9KACc92PJ7qV5Tk4GEARBvrmHq/knySwlOltmEpiIdvj3/3UvHfr4QaMsrv6mSN/GqiVH7JaY2plDOy7yq0oZM6z3dVFotHlIBsJgDK3bFySnb3qQa8whXrDvT70GMkYQREQvc9oXaHTsnnyC9ueWinfOFHPRwsiLxP6QwW36hIhQLbsnDOhKiXUcpvAG/qixwFRzoGCc4bbWCUTn0FjOgn+t0w3yfXVHgZcKpKN96BtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oW3Ye4A/dL4AxO6rt5U5EbS0T8yE3CBLKfflaPd6Ndk=;
 b=zB14iQSc3/8GmsUQ1UmvfW+IHhdDDo73diLiG5PbPqzSNBk4BNOZHH4F4g17JjhBrYIHho6b1SJFSdMRhzzyiCTi0+za8X9X3L09RlJSC8aSESXpGai3+TFxQ6RDEmAqTETVPnIxlR6mgDSNQr2WWhtkxxkHavASnZFuIYKaEttXt84CLHPn8BXynVLrzCIQixw50hBlcgQBZhEll9h/ca4k1+BnWazNY8KWKngufjMamvMlM44SKN8cgY67yCAK3bMQ1OL1CJxpcDmfnnv1c2yRAga6AxRZNNWm3Jma8RSIDyvlIz54AEFJbIEb3kinq5TKJ8/klbRHvlYDFsV1iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oW3Ye4A/dL4AxO6rt5U5EbS0T8yE3CBLKfflaPd6Ndk=;
 b=DD59MhYUpmk6aKrbvQP1/2ABJKrptgT3hry49XydBfk12jRLZntOMXVsL4QCt8vIEBNZawDsmC/xOPI4lOuspQzkS9hDt/jjMNce8Y3A5lc9Z2fQZswje/Qcv9NTDz7lWcoWfBYAw1hjjdhuyjWtOT2OupLxFK1AnKnMw78d1ApNRfc/8zyoqhyhuZK92pUZ8Q6xIZyHTsrWOOaiJUjl+roJczzNOlnSZwFAmq5H0qvElc65hg67SJhDGxnY52NUXACYagV5famy0Pwj9iXhfangcaf0Zkh2sNnm7JTj+6DP6yKw51Bs025d69oiAFLbw+o0xTng7QZ1WlP8xcVf9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 13:26:04 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 13:26:04 +0000
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
Subject: [PATCH v4 00/11] drivers: gpio: and the QIXIS FPGA GPIO controller
Date: Fri, 19 Sep 2025 16:25:04 +0300
Message-Id: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::16) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DBBPR04MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 69f21e9c-06a0-4372-e318-08ddf780158d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vxbGYisEAqeWan2quL46FTdbF02c1OHXA58c+fDudHXiwW4t+P7rQO72yXNY?=
 =?us-ascii?Q?0B9rF08Sm8ontJmDoZQJAZBRWlowXUhB/aiBuyttcyeb2X6csGl+HtrMoLYA?=
 =?us-ascii?Q?XCaEdInkY1XRzxyvnq8YmyDrVpbadC3rKkesBnNLTBigLbPgtoHfk+9b5C9X?=
 =?us-ascii?Q?x0fIVOnTZATssvhQCSRxq99VMPR19MqlwoZJmnR0NW4VOyTUcSV76zdTnAAQ?=
 =?us-ascii?Q?4YfPhzsmp2QmgfGrlvA+DRIEG1U/HUmQnH67wLhm6Vu7Zr9WyecXt6hAXKQa?=
 =?us-ascii?Q?POaDaGenisBWEgDFjNyh4/mkY4gErrw7kIZf1bgSQETomL8p/W4nqqdRKxcH?=
 =?us-ascii?Q?/v2bSadJIrv1SkmqdiTmPsxXlhzRNvrJzSsI/PAF5amB0aY3xFSI3i+iMlgl?=
 =?us-ascii?Q?tOpkcBTHbmxndEqjhjY3LyglNhe0eNV440mKp0FHxRl8hlGBklkD70eiLm/5?=
 =?us-ascii?Q?/cENpRFy3AK2uX0Jd1VTsRnGcx+w9ZDVPFcRCLxFK1lVto6g9LUbcr9gmk5/?=
 =?us-ascii?Q?2iZpVoTDHBC+Sc3oMZgzoXEBmtnv4Cl0bXrqHcoUBZbikmKGE7oXPpVUPocJ?=
 =?us-ascii?Q?aHljVX9inW1loW0LpBsKVMNXHZdGmKWWSZL91Io+MfLyt2u9jaqmOtBIJBB2?=
 =?us-ascii?Q?3iaDnyJPEWnfmhWKC0r/37DnbBOo5Occm1YLmw8i2B58I7t7HXUqKRaW5O0p?=
 =?us-ascii?Q?cYcjjC/slpzCj3mgPOfTIvEJ3HyZU/diCjGQw23GfUb2SfUUMtNRTaa/BJbt?=
 =?us-ascii?Q?+/oY3434Cj0NAB+ea7V3KJxNAqfpVILJbzL0qQzvjjriwskJ9nNOBARGoyBy?=
 =?us-ascii?Q?DQ9nMh4ctCjN9EpIkZEsYQVceUVAIwciNHuOh/VP0LaR/9m+6uHPV2Tdmdjp?=
 =?us-ascii?Q?fVj7lmDSmp4MWuidLddw4G6b18cQePTtjTT4gu82jAYTA/twNsZWajlqqpzy?=
 =?us-ascii?Q?VufDF4DUeZ2TJeXkPg9mffCRJP2qiSJi7p4JpZfyE9rfS6aSwNn2pSszTiWG?=
 =?us-ascii?Q?Pj/146M8/wZ27i0v3uXDI3NQFOpSJdrp9YFQ4dc2f/YNhxrUe2tjbWqq2o2D?=
 =?us-ascii?Q?kcttcjyjVix3CCDsMFaBtZlzQ5F6u/oSubIvdjj1CCB7je3jNVR5nmS5pbXQ?=
 =?us-ascii?Q?WSMHqhw2tybmdYQTG1NsiaCROjENGJmpFxo50fgWGakf2cRcIfsCj4TfxHzt?=
 =?us-ascii?Q?qmasqVtWPJxIMr3TnwTdAMYUU3JQYqs3rhM1u1wiwqhJcpocujBqurDfIbVg?=
 =?us-ascii?Q?OEFuhrCx0clwRtpUTwu6NAHw6GM6y3IOL0L0VQPJULM1rwaAqnkeblxnsKTR?=
 =?us-ascii?Q?koxqL6+ObJCTory7xuD2Xofdi5oRjQy27ixoNSapasP6C36Wxm9FIx9+PteJ?=
 =?us-ascii?Q?NRDXXh5sMREpqv6isoPi0zxyWGew9dO2BmR/ngIzHurnmsyC1gl0bbDJ2MqR?=
 =?us-ascii?Q?N6j3lRu3vK8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NiNlQjY7gZZgtOzmQtCmWSZ1TfLoXMt5pDBDuF+S4m3M/qthqXBUFZoeBE/S?=
 =?us-ascii?Q?n8CU6GT7P8BxQPUkrfcK0+bTqFb0tXrLIvIEVRD1Xr2zIPtryPaakBA8+RHR?=
 =?us-ascii?Q?VSEa//dIgJ50r99zKquI+v50LI0yCQDWL4KnZzjI6JYLA990hXU3maXE994v?=
 =?us-ascii?Q?sgOUMa1FmXuq/R+j3md6lD0ZtCTLl+wgEqDsr8mSv8l7rlMLVtkd27GAkGSk?=
 =?us-ascii?Q?uacsoLkXgHYRTMkbQZo2Vg8GEMWT7ISN5alA3a8hM/D7GbtkXdPhw/W/V4bZ?=
 =?us-ascii?Q?UW82Z4CpcMyJpm9jnk5jM1Exlksbm2FqREmzvLtDc0QuFtgmkDmD3RbwXbG6?=
 =?us-ascii?Q?WB3xnEvJ/wYD1mjOMULoB9zyD/bigJQxCuZhYB4Ma042PgiwyDK5zT6oQUYB?=
 =?us-ascii?Q?qQhBgH2/1tO0ueozY3UczziL7oMek/2oruD6WWKIUJEbLARnDMpKwMO1CEVU?=
 =?us-ascii?Q?Z/NhtIm2YUobWG2nxcK9o+vIJuXsmGDNHeiwsZlDreVclVXacqY5oKIBc6lU?=
 =?us-ascii?Q?4mxTV7QjmpVlnGapQMAslzUhTz6cTAPCgbqEdwEeyubTzx4fdd2CREMJm51f?=
 =?us-ascii?Q?KcBWxLyjNfh4lVM7yLplH8gCKfvWHGO665ZbYaKtiG+slhAY7QD5d8bsYgyS?=
 =?us-ascii?Q?a6gPGcvMCUq3OYIGCDv2maacUc2tkEesyMdkbARx3gsEXwWrMqG1BZszJNTG?=
 =?us-ascii?Q?lHFBIuEnmMFQfuhz+z58JQtNxCd07Zhro7zz1sNyS2ZSrjZ/2RFXgUG9c5s4?=
 =?us-ascii?Q?91SW/Xxo/1roiZ6r5NgWkJodOukKzSVN1xDgUU41cB+ZPUQU450PtgTbodiw?=
 =?us-ascii?Q?GGg6Au51OXfujMGJa86rWz//dMGV1XRirIoIQZhVTAG4Jz9jUCZlXjvaLJ9G?=
 =?us-ascii?Q?kLV8hHFXd7QbM/cGHZSNSpLUQ/YbnsybjDICvzMzhzGeY3o9MMgRn/HqBBSV?=
 =?us-ascii?Q?Cu81tFLGGBjI6JDiN/lrCDwLz4Lkf0hLUv8wEuy/DsAQr4zBj3JloYyDuMAA?=
 =?us-ascii?Q?ZhaAgskCcu8AN2x0tENhDoijLFO2RCE7ah9ZmNSEtEjZQZu0v/SZ307ZmX3e?=
 =?us-ascii?Q?OUKKzBzDGYb9LhtoTJNkGkEZobKzLKxn5jWn1VkInRYLkH07whQjUuwdDtgd?=
 =?us-ascii?Q?limoRGqsjZiW9iHxIXcQ84mcAmryKjq0gI2BWsGtUvtg/paAXlmcuZrppvXp?=
 =?us-ascii?Q?XUmmLZ/rh8iO9znLnwfk20cp8ygasnionLeOoyhmmujG0iagbHreABwyboEv?=
 =?us-ascii?Q?4bUCY6WlVLcnT5Th8lkDOxMTq2gGBQaUGGl/pUaDlCjeg8JKG2rNs4T+4nXM?=
 =?us-ascii?Q?7Xxh23Ktnl8sv7qty1qiHcK0Viu5JK7R0CtrTOT19Sw7tAtf7SOHAESjmRLH?=
 =?us-ascii?Q?y3EC2SL9DJBv+8tIOjbMYEWQ6ytCCoI96/u22heCuLA0vlJcMSCXJ20mSQP0?=
 =?us-ascii?Q?5IEH1G+1X60RoRLQlI+1AwATmWocZm1Vutz9hRFERQJA4LNBv/7JVujQxndk?=
 =?us-ascii?Q?/G/YKvv1FRpDMw4r51yZJrccNU0kGcmgexrPEaK/zskvwjpsgncOQhKEkOBU?=
 =?us-ascii?Q?NC3/LGL3Y3+sstjSv522GW5Efylj9KWTJlvuOWh7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f21e9c-06a0-4372-e318-08ddf780158d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 13:26:04.7820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V88usYzMESIWEB/iOP1mgNdAxHAVyy6C89WSJpixPLwMSeIaEKuD92ewPX2sEM/UAL5EwQ/PGc7EfyWdzQprOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7737

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

Please note that CHECK_DTBS will fail without the following fixup patch.
https://lore.kernel.org/all/20250912165916.3098215-1-ioana.ciornei@nxp.com/

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

Ioana Ciornei (11):
  dt-bindings: gpio: add QIXIS FPGA based GPIO controller
  dt-bindings: fsl,fpga-qixis-i2c: add support for LX2160ARDB FPGA
  dt-bindings: fsl,fpga-qixis: describe the gpio child node found on
    LS1046AQDS
  mfd: simple-mfd-i2c: keep compatible strings in alphabetical order
  mfd: simple-mfd-i2c: add compatible string for LX2160ARDB
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
 drivers/gpio/gpio-regmap.c                    |  24 +++-
 drivers/mfd/simple-mfd-i2c.c                  |   7 +-
 include/linux/gpio/regmap.h                   |   6 +
 11 files changed, 350 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpio/gpio-qixis-fpga.c

-- 
2.25.1


