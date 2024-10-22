Return-Path: <linux-gpio+bounces-11732-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7869A9924
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 08:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EB06284F03
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 06:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE25143723;
	Tue, 22 Oct 2024 06:02:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01on2132.outbound.protection.outlook.com [40.107.239.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACE013D89D;
	Tue, 22 Oct 2024 06:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.239.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729576947; cv=fail; b=S9eyn8AQpbjPK2Ezv3PPTjXo0v6fo9HEOV0VGmBmO9bUEKsMT4atpSlRVOWSjIKsw5vYF98JXaIV57RGl/PwufAmo/4RRfYsHVB7tiQsoIrN9U5jM3h3VwBW2344bar37Xntw8vsA0K47WxpHV/hiYsJ2KVwauV4cYVHUlULvAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729576947; c=relaxed/simple;
	bh=SoDpkVuHdbubAoi+rNOSjLnobcAo23GXiUzxzt55rEc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WFjdxaLwDNfjuN+aLL2tEusrKB33qOcxr2IcGcXPoorL7tEcZaXJBtFEjuj4a3Fn5PozB5KM1uT65p3+pJLpI/NX4wetGchJ7mMXOUaRLozlkWr2m7xZzvYgLgmZfkDItUEvKqD4DkWDvVb3E7nc7m4Ce0WRovcHzwqF3ckjHaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.239.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2W8Ru4gusC22PMI0wR4cSqacUhDOhP1TyLx1CUM3r8VU2wxZfKplnq5cXdN1rBSEvry2AitbTXmkR13oIcBeVaa8MCguW03fjmCTPFwvc0DeFPTle6pBIgt7ztSwHjrvUIbpak2u05RYw4l6YTxDJRtJbP2+54eBYsES/g+jTTPbpGSx8i3CFPvIxESowSwd907ttYsy+fBRyZz9xV3lkyjjyJBIkgAiXhlHlrKKPXsYrE9V7IOFp1JB7XvkQNdzX4vCrU31/yQO/zKgOtHE6YVN4hSJj3JMIJ/+unZwsVsFbfX3I1AQfxeHw88SHUl3fNOSuCdHcLqEDIYOWerMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obKS0nVaG9w06EQHkCIoFe7sDTP1JIfNnLgbuU5t6oc=;
 b=OwWH771aQDB0JOg4Yp4oX6G2MG7yL1d98CVYDfnucoMNUhOhvPDo5nmthoRI4vRcxRmgRmhkk+CEZVBbbqkhAfOTqCUP+xNw+1FBvPa7rUZQGnMjueEdtiXNFpqfn16G2zTgriU8O8maWAgo5vflNSnVoLugtLC+AVZtdHQ4R4OAK6U1R2Z3RDxMlMxcFNlcDDHbzVndCs8pmvldt5vZatJ9HXm3ZyFFq+TErnIb83Ddl3hbaH+JY4ChUy6Uyt6RA7r8qTH0u+OVp2vumNrg1PafzNgVCl4TxqmvdlHiZ6jlo54csVHZhv9Nj8W6bIIp6wgRblDKvBB/h9MF29mIiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN2P287MB1711.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 06:02:20 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::368a:445f:b1be:4bd6]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::368a:445f:b1be:4bd6%6]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 06:02:20 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt to yaml format
Date: Tue, 22 Oct 2024 11:31:27 +0530
Message-ID: <20241022060157.36372-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::21) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PN2P287MB1711:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b105667-106b-40d9-f94b-08dcf25f173b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sVXtrNflOU2oabbMw6qRUCLmEn/6l7zJL81pKeqMbL3OTOd+MszWqYFCTlTl?=
 =?us-ascii?Q?LGBbBajYFS+S4AQJd77f4tFtIWll78P1Bg9/wQxGJp8vtH0x3My3XWfyybTP?=
 =?us-ascii?Q?2YZZhKl7edNYNYqfVkoLKP5hKTlYe8mqWDCIFIq06AUaX/IXP1tUrnHzAvLi?=
 =?us-ascii?Q?8cmMbkrEQQCRvQIG/R8JvbS200VCBgvshn70zZzfsaVQ+WhIQaPJ7ttNol7C?=
 =?us-ascii?Q?XE0M0xpZmoZgzlQIrBnmsyYb0cbrGVOIy+52t+bhVrJJ0Nahq4PcYLRvjBba?=
 =?us-ascii?Q?dxZYZjJv5Zh+pOjieErAG39P1C9iABXc7XGo2dbMBKUt7yE7kPP6BpeS3VOF?=
 =?us-ascii?Q?uBfb4ubKBtFgOZOxHMK+k/I9vhElMXrt6Y2Ucj0d5gPUxCVcGWbWiWv1xlK3?=
 =?us-ascii?Q?cJwJ1ssFv2IQpXQlES3krQNGPsr8cRrOHDuGvAmRnNVbtqf4gooxd98SOGon?=
 =?us-ascii?Q?1smZQReUFKQ0pHjOdPooM0bn+M2aBKL2U0MfgAiSCqWLNkD9W3Fjg/hwIpw8?=
 =?us-ascii?Q?kZYL3eI2G++sicTMRdjg+7y83JHYhx8MNwFoA88lkfvq8AzDca51mU3HusKX?=
 =?us-ascii?Q?4jbExB0gKhnP7PVg8K3Gh2UmfKIcKSjfU/DYAGef/jyy8vfUM6f+9zWXeudE?=
 =?us-ascii?Q?GMl6XW+DW9ZfzDaDa96veOiUJqr9e3iNI/SmrWIOOSNku/7XlNbHyj6azLFI?=
 =?us-ascii?Q?MF//XP6gxw6wunq5elDt6NnxLg7jHqfAs2O6V0bVopeqRr7GeXdaQ8psQW/M?=
 =?us-ascii?Q?JfHXouwLfQwpjU4mbDWVXfZW6lGAV0rbqThmHTUnOSgL+sbZTXQ6+3LnFzmB?=
 =?us-ascii?Q?AlSwlR6ItS+U0vQH1bO+ZfIHWkacNm9kplkq7vD05EluYtc8eZt9QYweNFlJ?=
 =?us-ascii?Q?Mc6yVC871Yp9TZnXx3TM9Z5a1aPfbYoC+yAvTEnjfAZqcO1JhuWT1lAMU5hU?=
 =?us-ascii?Q?MlvgF4R5HOjX6F+fAYrguLnP3Lue5w/dJka09MH9jKjRDUisVptIpQzZ70Gd?=
 =?us-ascii?Q?tOSSJkLaTXy23/tilx8eCYThU+NPQgTPcjGlTLHMzxNAnvwHFER7dB3w4bcT?=
 =?us-ascii?Q?LW8CNS9NL9Tp5A/45H5bAsnrsqtKtzkRmP3CewQFm8rSCV81uGpBDK6Wy+Yi?=
 =?us-ascii?Q?xIWZWKypbgka1Bd09tIQSrjG39NuyzfAzArvfHjk8+t6nMaZBF0Ljt9WB5MX?=
 =?us-ascii?Q?yNy7QacO+zrdCobzzub9gKRmSJO8NGhPInn8hAAU8c8A7aSFmdYSeC31/MfK?=
 =?us-ascii?Q?wVimCkdeExrZPMRwWjCKs4z6M/HTH2+LOyv5m1cYtAYkwnYDo8jIfedDbAWi?=
 =?us-ascii?Q?f2/p8R0OqyaaIoztUw2S87Fi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r3GyHls5gcYeqUpQy77QxwTnkP2ogk8A6Tm9Bd40apaZwKmhCpOH61jNkV1C?=
 =?us-ascii?Q?poVJuTZozbD0nHbL4pQ0031FEvzWO9AaZa59FNj8Sx2aasJa+tteRmO8gzzP?=
 =?us-ascii?Q?peDNr1iYqunw3toMr4XOyAwquAYcfPGcdLaapPCU2C+Wz0xVtZpqXzJeNXW0?=
 =?us-ascii?Q?r+A76iH6Uq8bwdFs+ANTzDkFlyvAcWvvw3MKkARINvjE1QfloOW0t9gvExML?=
 =?us-ascii?Q?FFTfHEDrrVBTNzwLmtTc+IftD1uh0qsLrBLd9rcHTPmpjZHwo29X41tgXk0l?=
 =?us-ascii?Q?2CEl869YKfgygxUTQZ0SHvn8yRCNMy1FFGgdJ25DNfNekOniRXKGLKlmVOgT?=
 =?us-ascii?Q?lZrYF9LQtmH7iueI/tmRbstlUBXxqrCAOQ2JCm/Xc7c3O604tgm+xYgBgowe?=
 =?us-ascii?Q?LPxs7k93FfmvTzijPAtwQqutKommNeXHCUx3lhia67PgSVI3/lO4rWRCJJ88?=
 =?us-ascii?Q?RNI1Vfn/cBtaZ+y2zc7xoObH+yiUfm9cbNoS7cyu9MFk5jX9vGmxLCSycgGg?=
 =?us-ascii?Q?8HfuXnm9kJl/t5Kghc4wrFPZnNVn/0kKLg6lZt7EPEx0RaK/Zq8SliksDfAe?=
 =?us-ascii?Q?pYjF65tOM1KXM8Yox1EE+k0nFrMpv7TOxnZumEjEjpeklpXrBnCPoDjN0r/z?=
 =?us-ascii?Q?O1ssnF2dXn+g/0ad8iDKERdG1pD8np99SZh4NxqEmsDwIQKU17pkYMxDI6jF?=
 =?us-ascii?Q?t/0i0stNUMuw4KPCyTaAk7azjpFW2ZvUiAgDfWrBw00eBR0xTUvu71mzcSO2?=
 =?us-ascii?Q?Ve/EfIY8m2K2K5yLpKZtHAKYEpZtqtskZmL9Vqeao3JkeAaqB6yVF2T5kaPC?=
 =?us-ascii?Q?M7di7olDBzpQeos58EN0R5NpV3ru5Muhlwl+UfoW5nrUzOw2L8ZHNgd6UEjP?=
 =?us-ascii?Q?mOrFkekS2ZKPfWTkuZB7IyomtrArZXdc/RxpfxE2ixpn/g9+Yby70EquKU38?=
 =?us-ascii?Q?MH1KIHnYq9zcAGFpYarAthKFOROqpBRBq1of3N+Ks+cZyWl0Oh/LmsLXmGV2?=
 =?us-ascii?Q?HnOzihwCKsBVS2FnTtMG5vjBDPjY2JOYZlhvOLulMpZuPsc3W0kWj3cy6WIp?=
 =?us-ascii?Q?0TtQbhPl/lRWVL9k5l00CLZp1nD2Hd0/4bWaK6Y0bVAgfqd9mvzPr6lwjwl0?=
 =?us-ascii?Q?rcNaWTV6UTatvjqezfGTm8jKDG+rXX6nh2l3rxy06FYfbXpGZtUe9auH40fJ?=
 =?us-ascii?Q?9qOc+3dzc2kywE+CCXRgJxO54dydm9tsspCVsbVZ0hwjAmUWQ2FJa6kAieh6?=
 =?us-ascii?Q?4yNWJZCH+5LmsMrEtp44Pt7QZQHxxduc/SLX5vobDcPJ7YW8nZuexn9F6SRf?=
 =?us-ascii?Q?UCtdOOxuXCW+5Ug8PKZSVYT21UbgZyfzrhzKhJwsY+Z6V36soBuGrtuSif4P?=
 =?us-ascii?Q?myj3U4RSSx/45i5BWcScCs66bJo0yeuXRRCFQtEEoYRL0tj322ng8tW1Ocp/?=
 =?us-ascii?Q?6Dol358Iv0/KIbW5nnRVLwJGxiHJSL/h2P+dgVG1oFW5mAVk05Qq9tqwoNUF?=
 =?us-ascii?Q?EVVc9nggJg13Jon8Ob9vlzt/lJZz6EJGpsWm4tIHM9A6i3xCqQ7/k/z+ZTSR?=
 =?us-ascii?Q?WcRVg+ByJFbpf6syjQ64lPQ+TuiVoOUNK9ET1F+hiTtqNlelXedfzta/yXSi?=
 =?us-ascii?Q?8CHKfRk9Gz9UHaicNNYbLr4=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b105667-106b-40d9-f94b-08dcf25f173b
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 06:02:20.6814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQlFlS9QhYXppE3UYTuGHyREo32jJ5zEIa61j/bhckWpzoFFT4JacD/Ne8QdU9Sok1W1z8NqsPaLl5uVit8qvIhAmAf+XWm4UXlRq7X35rpfJ4rcNwFzNTApSuyIDbaJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1711

Convert the text bindings of pinctrl-mcp23s08 to YAML so it could be used to
validate the DTS.

Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
---
 .../bindings/pinctrl/pinctrl-mcp23s08.txt     | 148 -----------------
 .../bindings/pinctrl/pinctrl-mcp23s08.yaml    | 153 ++++++++++++++++++
 2 files changed, 153 insertions(+), 148 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.yaml

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
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.yaml
new file mode 100644
index 000000000000..3904b8adba44
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.yaml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright 2024 Silicon Signals Pvt. Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/pinctrl-mcp23s08.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip I/O expander with serial interface (I2C/SPI)
+
+maintainers:
+  - Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
+
+description: |
+  Microchip MCP23008, MCP23017, MCP23S08, MCP23S17, MCP23S18 GPIO expander
+  chips.These chips provide 8 or 16 GPIO pins with either I2C or SPI interface.
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
+  spi-max-frequency:
+    description: Maximum frequency for SPI devices.
+
+  microchip,spi-present-mask:
+    description: |
+      SPI present mask. Specifies which chips are present on the shared SPI
+      chipselect. Each bit in the mask represents one SPI address.
+    $ref: /schemas/types.yaml#/definitions/uint8
+
+  microchip,irq-mirror:
+    type: boolean
+    description: |
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
+    description: |
+      Sets the INTPOL flag in the IOCON register.This configures the IRQ output
+      polarity as active high.
+
+  drive-open-drain:
+    type: boolean
+    description: |
+      Sets the ODR flag in the IOCON register. This configures the IRQ output as
+      open drain active low.
+
+  pinmux:
+    type: object
+    properties:
+      pins:  
+        description: |
+          The list of GPIO pins controlled by this node. Each pin name corresponds
+          to a physical pin on the GPIO expander.
+        items:
+          pattern: "^gpio([0-9]|[1][0-5])$"
+        maxItems: 16
+
+      bias-pull-up:
+        type: boolean
+        description: Configures pull-up resistors for the GPIO pins.
+
+    required:
+      - pins
+      - bias-pull-up
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        
+        mcp23017: gpio@20 {
+            compatible = "microchip,mcp23017";
+            reg = <0x20>;
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            interrupt-parent = <&gpio1>;
+            interrupts = <17 IRQ_TYPE_LEVEL_LOW>; // Check this line
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            microchip,irq-mirror;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_i2c_gpio0>, <&gpio21pullups>;
+            reset-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
+            
+            gpio21pullups: pinmux {
+                pins = "gpio0", "gpio1", "gpio2", "gpio3",
+                       "gpio4", "gpio5", "gpio6", "gpio7",
+                       "gpio8", "gpio9", "gpio10", "gpio11",
+                       "gpio12", "gpio13", "gpio14", "gpio15";
+                bias-pull-up;
+            };
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
-- 
2.43.0


