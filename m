Return-Path: <linux-gpio+bounces-11951-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 727FB9AE556
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 14:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB9B41F23E40
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 12:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906B51D63E7;
	Thu, 24 Oct 2024 12:47:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01on2139.outbound.protection.outlook.com [40.107.239.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79BF1D5145;
	Thu, 24 Oct 2024 12:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.239.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729774045; cv=fail; b=jloMxZb+Gsa8iYAwv/TJEFrZW9V1IEuFpu+v0cNXG6spRr173gHA/Q59RfbRihlknMmQ3G7meR/T3wTYK0ZaAz6aiFOzCRS4P6G5IhwpwNO4EPp2q/LgN2EzYHH5j35dftO3t8XbftGbITzFIFzHJqe63JU9rrOUoTS3pEw9ePc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729774045; c=relaxed/simple;
	bh=EiMlN6NJ1n7M/uGasPts+HJX93Xg00wqqZRdTDKdb4I=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=syLS3rccEbgwBJ1PTlhxhTBn5uFU4jSdor2B7mp+aW7QdnlKFC8yh9PC9WS4OUNrd0fWe3oTJ7I/mgSl+FDp78M3Z34qjp0Hp7zagpc/xLgkc6ESwM+UWGenUeD7TNA1xzblj71db2xAuL4QeFzLLFYEC53hZJzJWLencgBo2x4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.239.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3wXr2H+YSO/i7sSdGYDmct/z1+dcsPjTCFSotfd2/lKsmS01IUKpBadLuKOQioVjIrAKHwWA+korjoBRQXyiBuz+kjEN2jDdXQ2JPKoBKxCnICACbdmWwFprHZgrun+w3vLVPRBtkGHh2tKwjv5aX9oJsfamHSVeLDnLU3P2oywYijIBp8jLsppGDytJnXRv9cQFar+0a4dKqw8ZA3YSW2K+mSE9KFBpuDVKPwGr5oAP9K4v7YrHaoZUv7J9PMlm6NhGpSHnsDDV4V+5vnhPgaGGkZQMzLCeXqLLlXUtL6Wv/DLOzFBzUuqX8aY2f+rS3RtTCZaqR3MQKtUQhxQxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2dtPmIGRmyQbQzQfFr9Ae8ykmLhnjRQNLMWH3VBpzg=;
 b=SH6blNcya1CP0pgm+SrsgSfKZMlza4ySM+GNJJFMGQqZdzK0gZcufy6vi/P5Lg4E9SU0R7RQYmqiQSPQGufVNZ27xMKMPr3s2eTG3kHK6ehQaATp2mjF1WhlQ2IcDcGF5iIUpJjsBDVvITBXx3uDcsDYnYrSBKyFAOtJzb0P1/kHDJPPF9CNbvuQZvvJX2iSn2K9nFISKKOXCn8bYLadA9TsGifbToBzmOllGxcWSUoxw5fJpgf+hKzqgKLGBeWXSHDfAs7H4+DIxud4V2aDkyvn5qF6rIl+B7b5FKIKJtjqSKnVyG/gQRCQJTF9T49gYOc237XylzLt27XMZ/1QeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MA0P287MB1769.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 12:47:14 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::368a:445f:b1be:4bd6]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::368a:445f:b1be:4bd6%6]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 12:47:14 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: tarang.raval@siliconsignals.io,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt to yaml format
Date: Thu, 24 Oct 2024 18:16:18 +0530
Message-ID: <20241024124654.26775-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::35) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|MA0P287MB1769:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed27e4e-1425-47eb-6dbf-08dcf429fc45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DY8pR24Q9HWKyB7Y8R/hHjUIshmz5U49PIYo/sDxdqQEJZKm7GTC8eV9xatp?=
 =?us-ascii?Q?/+wB6Ge0F28Ia+P2t/WbDKHSBKBoWoHg2SvdJXYtMFZW/vmy8jp8p1HW0my1?=
 =?us-ascii?Q?QYeRUc3c7qUwCBCTb8WnU1bzQnugT0JDcyktmOeogus9ioNAl9esKyJh1gzM?=
 =?us-ascii?Q?1yUYqn4VuFkHhq1/FUsKfcPHl3nWZyGeFIOnVvC231KsHrK0VeeOxGM3XlK4?=
 =?us-ascii?Q?uOuZuA5Oandw0ZNYaWgEvZcYo8HUtrt2DA8pPBsEVwy7EloNWcbXZqA+lsmw?=
 =?us-ascii?Q?ATPd/Phif67FFa+hPqvvwKmwZfFnPEJISaakhLM3o0KGTJO/SbtAcXYCdVRA?=
 =?us-ascii?Q?XEz5k7Qeq9Y4PnMUXLVoxB2teXKi2xeJLNpJgYIeSYqqxMFiY8jR4GtTPuMd?=
 =?us-ascii?Q?k+50jcVkDF5gXxyKGe+NaeO+NQV0bBJiNqL1JJw30GBlWyrZCGDI3MsAnoUt?=
 =?us-ascii?Q?CG7MsW5TrUy3QTQj/AWu2fX5zaBB/jF2YR7ZNswi8RjbL5M/BWOEyvXxT6O2?=
 =?us-ascii?Q?bk8lFLvtGwSXDe/L59MbURDAGonU/q8xtvUN4Cb+ri7fM2d4a/dm7uSCAZKS?=
 =?us-ascii?Q?wYBJFYNeZAfhZ3XL8FX7Xh/LRz7l3WOmml4AGoJFl+fvqU4m8QPAp4vCGcm4?=
 =?us-ascii?Q?fA985Y8Fifl5VaZcz6hUlJ2LOXm2S8BxkrXR1VBitTo2cEIRyoGGzHv6TsGH?=
 =?us-ascii?Q?xsNTO3O9zBYFzem6mT/yddov8NLkWYNRdoaZTIy8Ayxr6FFfC2DyrMmovD21?=
 =?us-ascii?Q?d+l+s4ZuI696Cwd8cXTHdD2GpqiZ9h3pkzK0ZaXM3TLcbccAVx5QYTQFO2O7?=
 =?us-ascii?Q?B4UrQ1unhm9yTUxq0qq8eNs7CNYvZNJm2365P1kQW2LnLgxF4SqeEt4mtRrO?=
 =?us-ascii?Q?FMtjZyVvZTtpyqUJgjl/yAnKhwVgMGc/jC6D4ENWSaYHwm8CASRADQKoKem4?=
 =?us-ascii?Q?5gdxiF01SUhQz1ue1n+n2vLGd9M21xrvXm5ptlo9sMwo2g+yFezTAhsaE+p1?=
 =?us-ascii?Q?XO3tfE0dPK+bLOrwRztkUUneQkQJ1w/2G0T+7Op1Od7paxNTzm0RdboxLL5T?=
 =?us-ascii?Q?SRYkqMWZewx5uf2kbpyP5e8WzV6E4tJb95Kc9xCV/j1kysc2vI3IiofjH0IZ?=
 =?us-ascii?Q?Zn7D0vcJoGJXYEPg1QYLpshPQjazHu6QBzXpN2HEFTZRNy0RaT4wdPJ5Yt7K?=
 =?us-ascii?Q?YrgaoDaEpBAWAOmfZtKQyvCp0ur2xhH/HoiSIz7qD9nRkrZzVhChiYDBc/X4?=
 =?us-ascii?Q?L21UpuuBjgITsmgQRkQkyJuWufrgkS9U9gf9HAApXM+OZP3ovFIFDR7o2GDL?=
 =?us-ascii?Q?VnN0B2HMDnWysldFDlnhKl+L?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ESNUG1lv+AiNRU3rZA2qwEAXFFugR3i36SfLes2W/2IUM2j79fBvP4yG2hTv?=
 =?us-ascii?Q?JD0sLrKuTEhMBkzmun2om9050bt7WmF4SQBOcPzPNWSHx/UiGNcrsQPjfi6B?=
 =?us-ascii?Q?TA0TLMBwGFfxOCrZLsdUQFSbR7v0iSBcCB60up5+bXTzdCcZkdxJomcWNZvO?=
 =?us-ascii?Q?nreNXKQJgF1Am3rtxYI32ATTymIk9068pe/VnBjgJFepWUaZz6H1Fi0yG4Ym?=
 =?us-ascii?Q?wGd23x4yuoVNGfMWx7tDm4kk0WkIREuYkrBo4CmEirTg2idpqp97UEOz9lnD?=
 =?us-ascii?Q?d8VXlqExW9Z348IpVey2+qf3SiSingI2GQZj+qEDzKnHn4F/zKeKJ2RkGxQd?=
 =?us-ascii?Q?hDtk9cmcaiq0QH9gDUYzdBu/4MRY+TnY6bn+Uk+A6Mr4HewTSuWnoje/lEow?=
 =?us-ascii?Q?lwGzVy37BLvE4Y2b5U2nTxWOv+EXDxR4lKJiwpQiZbmz2SY/GkgTmYUI8jq8?=
 =?us-ascii?Q?TYIwps0C1c6qO+tWn6ZSZWP5oiWq72zPtQm70tFqsu60ctZpK95H+HGR5dzU?=
 =?us-ascii?Q?2FkPs+tUz4fBpFlu1NNf3UdSSVBs4o3rQ2tarzDIZfVJzbqcCWUFEpiQVmhX?=
 =?us-ascii?Q?YsRMd3aOdjHw2STuZccMUMwNN81NVxWZV36798nra22U64Iyzs/1A+WkQbEu?=
 =?us-ascii?Q?BszSV/u2kyt4oL/bu41K9qtbsv5RZ1K4uQ5OY82ct0C2SPmbYWEg/jUW0qn9?=
 =?us-ascii?Q?5IfVPQvUkoVK3EQUweXX93YTpbbQgQELLgkoOHkXwiPxuJiItINNo0/SqqYA?=
 =?us-ascii?Q?BpA+InZupnRaognutdZyyRnbqRq0INtJoV1C6vzZLNsSqX44RJ+o+oe2KTqP?=
 =?us-ascii?Q?9Vb1MWrCDAPZFEbDcPapH+PPPxfOpP1mxSGmsVppwsJBP3btT5J1Ah/6dSAy?=
 =?us-ascii?Q?3evykX9X1//3POXKOdSGwkEGlE6NNLAFe9gHIyalcSplxE1D48M1P98KFVKy?=
 =?us-ascii?Q?wag+Zhni8B9GQFMpyatWdNBh8okpIN2i6jSsrx5NpCJW1ewyuR9+hK2ew7Xd?=
 =?us-ascii?Q?AohD/QHtjUpyG5XF28x/+nTTnPEat7nUIDmHM7PaHTd3Okvlv1TOYHnwm/W5?=
 =?us-ascii?Q?Gpcm21ppfPhdLOZH5uSR7Bwz+rfBFK24Hfk+hMI8tzOQbhdQQjTyntT8H9CB?=
 =?us-ascii?Q?agN4ffypuzuQUYEGuAL2OiE4lO8cBWmu8TpICgqL4iQqHVJVhIhLSr5bEtnQ?=
 =?us-ascii?Q?f2jNh0ABWhU/7qsuPRNEQCBkS7jJzdMSvEmVLzcik88/iFIBU1BW3u4dZsNh?=
 =?us-ascii?Q?nmnhk9ZpcbyikG4F2itOOwK04to/3y75Ck2yBxmAGemQje8Y8dc3XFFHbgzC?=
 =?us-ascii?Q?iyW8sQXdD9ufM61u5SrIM/pJvbg0EZYYHCXi+GcpPDIIYG2eep7hsnDd3fxL?=
 =?us-ascii?Q?a+sd610B33K52RG+tsvhii5nXARsjV/QHZ2Mv3GzPxQF1fIRCLby0lO3RnTT?=
 =?us-ascii?Q?7/HSzoZOKZ8/Tdkp9yKlz5dqj6cnQ6DaurO35TVWm6VkBomZ2tVwHj3d5RBN?=
 =?us-ascii?Q?+rX2so+RtuO37HymZ5EvfaxlfRSklBJkfpkIm5hHtSxhfuNCkDTmOL9RFhTL?=
 =?us-ascii?Q?iNdrev2yJ3AtkdPKYdwQKfusWHq03vsBkEym4Xo+oqVKN0b/jTH1j+6FoMz7?=
 =?us-ascii?Q?ws3BRKEYkfRFP3H8wdOpvEw=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed27e4e-1425-47eb-6dbf-08dcf429fc45
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 12:47:14.4334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDI2MSnEyOFBboc+ROI8E6/hHAaDLiGmZpQeZglQbQz+nkWtJS2fwLw3Uo02o608CEyVIfBhjrVKnjxfLMFR0RCEPwMPSh1UE19to5X+AUv9KuHloTV/beHqe/GTrTI3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1769

YAML binding file provides the conversion of the original text-based
binding for the pinctrl-mcp23s08 to microchip,mcp23s08.yaml.

following compatible strings using the deprecated mcp prefix have been
removed from this binding:

- mcp,mcp23s08
- mcp,mcp23s17
- mcp,mcp23008
- mcp,mcp23017

Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
---

Change in V2:

- Change the commit message
- Remove copyright
- Change the file name to microchip,mcp23s08.yaml
- Remove '|'
- Add 'spi-peripheral-props' reference
- Remove pull-up from required properties
---
 .../bindings/pinctrl/microchip,mcp23s08.yaml  | 181 ++++++++++++++++++
 .../bindings/pinctrl/pinctrl-mcp23s08.txt     | 148 --------------
 2 files changed, 181 insertions(+), 148 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mcp23s08.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,mcp23s08.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,mcp23s08.yaml
new file mode 100644
index 000000000000..7d721ef64c01
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,mcp23s08.yaml
@@ -0,0 +1,182 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/microchip,mcp23s08.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip I/O expander with serial interface (I2C/SPI)
+
+maintainers:
+  - Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
+
+description:
+  Microchip MCP23008, MCP23017, MCP23S08, MCP23S17, MCP23S18 GPIO expander
+  chips.These chips provide 8 or 16 GPIO pins with either I2C or SPI interface.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - microchip,mcp23s08
+      - microchip,mcp23s17
+      - microchip,mcp23s18
+      - microchip,mcp23008
+      - microchip,mcp23017
+      - microchip,mcp23018
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO specifier for active-low reset pin.
+    maxItems: 1
+
+  microchip,spi-present-mask:
+    description:
+      Multiple SPI chips can share the same SPI chipselect. Set a bit in
+      bit0-7 in this mask to 1 if there is a chip connected with the
+      corresponding spi address set. For example if you have a chip with
+      address 3 connected, you have to set bit3 to 1, which is 0x08. mcp23s08
+      chip variant only supports bits 0-3. It is not possible to mix mcp23s08
+      and mcp23s17 on the same chipselect. Set at least one bit to 1 for SPI
+      chips.
+    $ref: /schemas/types.yaml#/definitions/uint8
+
+  microchip,irq-mirror:
+    type: boolean
+    description:
+      Sets the mirror flag in the IOCON register. Devices with two interrupt
+      outputs (these are the devices ending with 17 and those that have 16 IOs)
+      have two IO banks IO 0-7 form bank 1 and IO 8-15 are bank 2. These chips
+      have two different interrupt outputs One for bank 1 and another for
+      bank 2. If irq-mirror is set, both interrupts are generated regardless of
+      the bank that an input change occurred on. If it is not set,the interrupt
+      are only generated for the bank they belong to.
+
+  microchip,irq-active-high:
+    type: boolean
+    description:
+      Sets the INTPOL flag in the IOCON register.This configures the IRQ output
+      polarity as active high.
+
+  drive-open-drain:
+    type: boolean
+    description:
+      Sets the ODR flag in the IOCON register. This configures the IRQ output as
+      open drain active low.
+
+  pinmux:
+    type: object
+    properties:
+      pins:
+        description:
+          The list of GPIO pins controlled by this node. Each pin name
+          corresponds to a physical pin on the GPIO expander.
+        items:
+          pattern: "^gpio([0-9]|[1][0-5])$"
+        maxItems: 16
+
+      bias-pull-up:
+        type: boolean
+        description:
+          Configures pull-up resistors for the GPIO pins. Absence of this
+          property will leave the configuration in its default state.
+
+    required:
+      - pins
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mcp23018: gpio@20 {
+            compatible = "microchip,mcp23018";
+            reg = <0x20>;
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            interrupt-parent = <&gpio1>;
+            interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            microchip,irq-mirror;
+        };
+    };
+
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mcp23s17: gpio@0 {
+            compatible = "microchip,mcp23s17";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            spi-max-frequency = <1000000>;
+            microchip,spi-present-mask = /bits/ 8 <0x01>;
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mcp23017: gpio@21 {
+            compatible = "microchip,mcp23017";
+            reg = <0x21>;
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            interrupt-parent = <&gpio1>;
+            interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            microchip,irq-mirror;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_i2c_gpio0>, <&gpiopullups>;
+            reset-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
+
+            gpiopullups: pinmux {
+                pins = "gpio0", "gpio1", "gpio2", "gpio3",
+                       "gpio4", "gpio5", "gpio6", "gpio7",
+                       "gpio8", "gpio9", "gpio10", "gpio11",
+                       "gpio12", "gpio13", "gpio14", "gpio15";
+                bias-pull-up;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
deleted file mode 100644
index 2fa5edac7a35..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
+++ /dev/null
@@ -1,148 +0,0 @@
-Microchip MCP2308/MCP23S08/MCP23017/MCP23S17 driver for
-8-/16-bit I/O expander with serial interface (I2C/SPI)
-
-Required properties:
-- compatible : Should be
-    - "mcp,mcp23s08" (DEPRECATED) for  8 GPIO SPI version
-    - "mcp,mcp23s17" (DEPRECATED) for 16 GPIO SPI version
-    - "mcp,mcp23008" (DEPRECATED) for  8 GPIO I2C version or
-    - "mcp,mcp23017" (DEPRECATED) for 16 GPIO I2C version of the chip
-
-    - "microchip,mcp23s08" for  8 GPIO SPI version
-    - "microchip,mcp23s17" for 16 GPIO SPI version
-    - "microchip,mcp23s18" for 16 GPIO SPI version
-    - "microchip,mcp23008" for  8 GPIO I2C version or
-    - "microchip,mcp23017" for 16 GPIO I2C version of the chip
-    - "microchip,mcp23018" for 16 GPIO I2C version
-    NOTE: Do not use the old mcp prefix any more. It is deprecated and will be
-    removed.
-- #gpio-cells : Should be two.
-  - first cell is the pin number
-  - second cell is used to specify flags as described in
-    'Documentation/devicetree/bindings/gpio/gpio.txt'. Allowed values defined by
-    'include/dt-bindings/gpio/gpio.h' (e.g. GPIO_ACTIVE_LOW).
-- gpio-controller : Marks the device node as a GPIO controller.
-- reg : For an address on its bus. I2C uses this a the I2C address of the chip.
-        SPI uses this to specify the chipselect line which the chip is
-        connected to. The driver and the SPI variant of the chip support
-        multiple chips on the same chipselect. Have a look at
-        microchip,spi-present-mask below.
-
-Required device specific properties (only for SPI chips):
-- mcp,spi-present-mask (DEPRECATED)
-- microchip,spi-present-mask : This is a present flag, that makes only sense for SPI
-        chips - as the name suggests. Multiple SPI chips can share the same
-        SPI chipselect. Set a bit in bit0-7 in this mask to 1 if there is a
-        chip connected with the corresponding spi address set. For example if
-        you have a chip with address 3 connected, you have to set bit3 to 1,
-        which is 0x08. mcp23s08 chip variant only supports bits 0-3. It is not
-        possible to mix mcp23s08 and mcp23s17 on the same chipselect. Set at
-        least one bit to 1 for SPI chips.
-    NOTE: Do not use the old mcp prefix any more. It is deprecated and will be
-    removed.
-- spi-max-frequency = The maximum frequency this chip is able to handle
-
-Optional properties:
-- #interrupt-cells : Should be two.
-  - first cell is the pin number
-  - second cell is used to specify flags.
-- interrupt-controller: Marks the device node as a interrupt controller.
-- drive-open-drain: Sets the ODR flag in the IOCON register. This configures
-        the IRQ output as open drain active low.
-- reset-gpios: Corresponds to the active-low RESET# pin for the chip
-
-Optional device specific properties:
-- microchip,irq-mirror: Sets the mirror flag in the IOCON register. Devices
-        with two interrupt outputs (these are the devices ending with 17 and
-        those that have 16 IOs) have two IO banks: IO 0-7 form bank 1 and
-        IO 8-15 are bank 2. These chips have two different interrupt outputs:
-        One for bank 1 and another for bank 2. If irq-mirror is set, both
-        interrupts are generated regardless of the bank that an input change
-        occurred on. If it is not set, the interrupt are only generated for the
-        bank they belong to.
-        On devices with only one interrupt output this property is useless.
-- microchip,irq-active-high: Sets the INTPOL flag in the IOCON register. This
-        configures the IRQ output polarity as active high.
-
-Example I2C (with interrupt):
-gpiom1: gpio@20 {
-        compatible = "microchip,mcp23017";
-        gpio-controller;
-        #gpio-cells = <2>;
-        reg = <0x20>;
-
-        interrupt-parent = <&gpio1>;
-        interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
-        interrupt-controller;
-        #interrupt-cells=<2>;
-        microchip,irq-mirror;
-};
-
-Example SPI:
-gpiom1: gpio@0 {
-        compatible = "microchip,mcp23s17";
-        gpio-controller;
-        #gpio-cells = <2>;
-        microchip,spi-present-mask = <0x01>;
-        reg = <0>;
-        spi-max-frequency = <1000000>;
-};
-
-Pull-up configuration
-=====================
-
-If pins are used as output, they can also be configured with pull-ups. This is
-done with pinctrl.
-
-Please refer file <devicetree/bindings/pinctrl/pinctrl-bindings.txt>
-for details of the common pinctrl bindings used by client devices,
-including the meaning of the phrase "pin configuration node".
-
-Optional Pinmux properties:
---------------------------
-Following properties are required if default setting of pins are required
-at boot.
-- pinctrl-names: A pinctrl state named per <pinctrl-bindings.txt>.
-- pinctrl[0...n]: Properties to contain the phandle for pinctrl states per
-		<pinctrl-bindings.txt>.
-
-The pin configurations are defined as child of the pinctrl states node. Each
-sub-node have following properties:
-
-Required properties:
-------------------
-- pins: List of pins. Valid values of pins properties are:
-		      gpio0 ... gpio7 for the devices with 8 GPIO pins and
-		      gpio0 ... gpio15 for the devices with 16 GPIO pins.
-
-Optional properties:
--------------------
-The following optional property is defined in the pinmux DT binding document
-<pinctrl-bindings.txt>. Absence of this property will leave the configuration
-in its default state.
-	bias-pull-up
-
-Example with pinctrl to pull-up output pins:
-gpio21: gpio@21 {
-	compatible = "microchip,mcp23017";
-	gpio-controller;
-	#gpio-cells = <0x2>;
-	reg = <0x21>;
-	interrupt-parent = <&socgpio>;
-	interrupts = <0x17 0x8>;
-	interrupt-names = "mcp23017@21 irq";
-	interrupt-controller;
-	#interrupt-cells = <0x2>;
-	microchip,irq-mirror;
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2cgpio0irq>, <&gpio21pullups>;
-	reset-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
-
-	gpio21pullups: pinmux {
-		pins =	"gpio0", "gpio1", "gpio2", "gpio3",
-			"gpio4", "gpio5", "gpio6", "gpio7",
-			"gpio8", "gpio9", "gpio10", "gpio11",
-			"gpio12", "gpio13", "gpio14", "gpio15";
-		bias-pull-up;
-	};
-};
-- 
2.43.0


