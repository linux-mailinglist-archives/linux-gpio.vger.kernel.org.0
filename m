Return-Path: <linux-gpio+bounces-20896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7077ACB4DF
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 16:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34DD04A225E
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 14:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B876822424C;
	Mon,  2 Jun 2025 14:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SZFyyx4G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012068.outbound.protection.outlook.com [52.101.71.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F78421CA1E;
	Mon,  2 Jun 2025 14:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875400; cv=fail; b=XDJVfWnz6nV/VnFvRN6YPOjDAFnziEyKklopLTljNFgpQTE7sGWKMIunAl9ktyUYQppvGI33BqwvQ45g3s86WN+FrOXuLGlDLaux5gn+hA6zhlT1AKzRACfGGnw0UxJCvfBqYJg4+dgru6s1vTuV5DzgQKUqDJ9AslOD9pajRsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875400; c=relaxed/simple;
	bh=lAoYIjnEblCEacuG9ZdktmZwuZ9TnDxePT8zZ+zjP9g=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=R6Z+ICMUqdDnkHKPm9ZtG3aFlxiKnFvg88Zrmg7bTQcpLVAZKyFRsYiv6JB619vBDkF55kt6wUXeJhcUwNCC7FTI0BXYVI2SiAjAPIs4dJdGGSxG59vdkoRUXpG5lCHO+ypcCTUHUg3s+qqXLz9WMGs2e/zFgu6ELxRigmWGL3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SZFyyx4G; arc=fail smtp.client-ip=52.101.71.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyb3FjJaObXaMFEpsvkUQ7Rwy+3GYLFZSqfPseNKlazdpV/lhNOS6t5adFJfxlTK0THwwLvR11JofoZ7QlE5qDJLyf03WPfk7LKXN6lvIubcmQdSUbV15Iy6sjQE58vQ8Trpm6rsffKWhVmtZdXoJgeoQy+PjPEK6b6wOcO+BwmpsF+VRRKuQz6o12ZlWkhe1mavXlAiTWb+o48ubsHVLU8D7GSgqePe/C+N3cBjDMhYDaAdWylSxQ30XCOBTqGIyBdXKV5mLDw5w7xw+weCPNbOstgyZBJXeY4XqAj2bDpuiGiN14nuz0uAYEX2fjkwEdnbmL3qOI52ebrMIf1vtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCsxyhjh1JquqQOmUdz7eqmwJ/fJUADSbXlLyNcWpT8=;
 b=a3lz/zWr33BjmCHmTemCdsKQEwS82F2HVqAGxkCHkb0mlI7k1QRdx85NKLLv/qMHmzVjYXCSTRm0hDfwpL+bJv+zExbmcsL8mtC16M9k1piEsp0EPgC5RFS+5IQy58eVwKccIbkiioxr8rCR0kdV4ANzhERq+i7Gekh8FXCaqVi1ULUAcHlPi4RO19Ron744KSK6m7oP+gi84q+mQaNTT3UrRlrLnbcmgjSqw49yBJV2yCcNlR8pnPcecgw7mamMfzsHLEZ2iHNMI+dUGg4rv5lpnqGXdPyC/O/b5N9SRc5O/Mj/1YQLvK/FrwsGZ5IQz4v1exL2HKYtv63Cw4n3sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCsxyhjh1JquqQOmUdz7eqmwJ/fJUADSbXlLyNcWpT8=;
 b=SZFyyx4GJbB0ESt2pSpk7BhZME6XT7O+Hk0DRAjsZ1w791m4fBJVJDZVXvoFKUsfUNTNb0KwKxEC9+yzqDI6MdfsvBD1RzSDOq0XjfWZ9K2BdaSvNgLXnxKNM2jTwpNIYJX5yazI+Vw0GjaXqginh0PCnPZk9dUytxkS8X0l3nB7pmd2A25verPnQqoDZahPaZCSXGxMaOffX5CYk5LFNBymhE9quvMUGAlW/S50C40Bga/QZc2RfKs3rBTCYtgP9L1P+S9eLuuhvreJ1D37pX36qVW8h6dwtbB6nNGL2SAQ0o5SA8ahTzfz/d4sGmCakrgavjUc8BkyYfHE3DbRrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by MRWPR04MB11286.eurprd04.prod.outlook.com (2603:10a6:501:79::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 14:43:11 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 14:43:11 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: gpio: convert nxp,lpc1850-gpio.txt to yaml format
Date: Mon,  2 Jun 2025 10:42:58 -0400
Message-Id: <20250602144259.944257-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|MRWPR04MB11286:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a274e5-55e9-4d34-993d-08dda1e3cc64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fXwv6a7m/oMjtBkCfswhtV56ZkBHCnGIQCdU+FBSdfVWf0JFp4FaTI+qlylS?=
 =?us-ascii?Q?7KxA/P5yBegpiR4d6Z/sgfKgDjpn24BPwuSC6jF0l3YQ/t9VvB/WFtZtjI54?=
 =?us-ascii?Q?cK1+y6m0x7H14esCvq3X3GOSQvUKKDBCt1uj45ifkgJ/Xsz5kEYLIBZgQlOb?=
 =?us-ascii?Q?1Owbl3DcnUCsY1AxNbkh+7CzTuNoJmjWW+1xaYLma0pSXlpe3UIQBrbP7FHR?=
 =?us-ascii?Q?3WtQ/zwVJtff5RlykYVUqzHnm7QlY9HtLc0/cYK0F3iiSXhn5CQMf2UI2307?=
 =?us-ascii?Q?DbhH2r1q9oSnbnlrdcS+JSJObJU97MSlhMvHVIAUVSlR+59r/aYCXHBMcsWl?=
 =?us-ascii?Q?S2JAOEW7CNoURN226bKiPanjj134mYE/B144s7dXAr+6kk7pADIwpe/LUQyB?=
 =?us-ascii?Q?5Wi7cBvVHqhIKenTD7an1MJN6Jb08CyIrjRQsssT1kTpXlyHpQMru2aS8I3u?=
 =?us-ascii?Q?x36vojrxRqlgbUszSR5YgXrRiLIhKocjfH+9viZEwGTNDRkGQCtL/NPbtUZE?=
 =?us-ascii?Q?qxNAZ6plDRJYqZ8bO3I8IXunV9Pk3/CA6vJtJIS4SLW9x//jhpmIyhg9gJ2L?=
 =?us-ascii?Q?Pkw+kFagvUaRzP3nvMlvzHGm3jHWvLkSbsAEjusbs1QXo+4LQ/BSXvhX8Ebp?=
 =?us-ascii?Q?4CXZjf2DSovN7sit4qM7CM2vc9zLZXhXKRbCRcwfjBSaQUmhvjcBhEXAx87P?=
 =?us-ascii?Q?MnksUO24PjkxulQN7lRj7jzfqDtJ3J3+wpG034f1xYu4t6eBuBG/xUbCJ9KC?=
 =?us-ascii?Q?OJrbo76eMZyTc/TSqhNSPCvUiDsi1tuFLCJZx+/BoXkVWyo7mloiv/9KBmxD?=
 =?us-ascii?Q?eqo0L+Zb6ULCYPZkMktPr5GIpOYkB8EyOoVmOApsUpdiVpAvbHiIMpNcQuTI?=
 =?us-ascii?Q?U83l/JMdPB4UZFOIJo6vg53rm6Y7RzAMHjgc/umpJav4KWDFi4dj+MOGj2FK?=
 =?us-ascii?Q?CJQvyzgRa0iK6l4dCNyJh2Zp3dM8H/Yme8BHTW2TviOzLGqbFfZNpjy1OsPM?=
 =?us-ascii?Q?eEN4SLqEPsF0w4nWEi+opCnnbNsmBRcF5YrxVWFyMqMsrmi4cbT9DD6R4eua?=
 =?us-ascii?Q?0wrLQunDP38cl6fcalaBpohSuxHYlehX1SmiPwI2ZVRjeKFwNv5LqSVRLzd1?=
 =?us-ascii?Q?1w96byL5LxY6dgRlqWNJ9qvcKMhEga+KtoJjhItecChNQa17jw5+GjJthTKR?=
 =?us-ascii?Q?UAM1z3t580xDS/Me/gasMo4mCee/gjp6sboirSLzLoiyrGyToYemLPURTVvz?=
 =?us-ascii?Q?3lua+2blubxDSJ44OAlSkY7P8A/H1JtFTCY6sDTamqeQrnwTc9UNRhiScqzh?=
 =?us-ascii?Q?QcyaEZBxMw8yb977Qgd+OkWAqO4w7mm7pTFu+/eZN35COZKBA+Ez2V2AL5D/?=
 =?us-ascii?Q?iO71DMAgNizPAyW/rzuILTmYJi+keI+4cYznoACkR0n8NLuOdgnK7L5kIEgn?=
 =?us-ascii?Q?WD73Uq090RNcRGPXZzASJ7Ui8Y8a2k4E?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d1NYdAmhyS9dxcbclXFa5nOHYybaSqlC4RYhoIpchPAo4LOQM2u2D5dP8GLD?=
 =?us-ascii?Q?oBIG46ABvHuKAh4FtSRahDNqqdM4eCfMYzGRPBRJGqV8DD1P78HihoWqvOhs?=
 =?us-ascii?Q?hpz7Sdsr1RgFArlevuAcU76C3NZnZPIwNkeaIjHRfWPQ7DULmlg24f1jY1mj?=
 =?us-ascii?Q?w+eYu9ekgqCA1OZZPow6s3ihng7hoPt6104AKp+C+Rb26meB8tr28yE2K6I+?=
 =?us-ascii?Q?PO0QvLew9T2qunV6QNPILhXsRZUIkm/psPRnZVS/TDxhRPPoOIGGIrkxLuqD?=
 =?us-ascii?Q?L1+SXyMrWcCeBaljHX3+ig7P6p0VJO0RIV3zgJdw6mrEydOk1PeHnVBUWlxU?=
 =?us-ascii?Q?0mEvbGFxG2ik2AC+2tPUHrMBKOI9hVkdYCKhOZQ0NrYt1oJUcXkPFvyzB6ww?=
 =?us-ascii?Q?DlOhwi4nde0D8CD935mhLRy31e0aLd1LPnH+BSF7GlA6ZW2qznjkOt+Nb+X/?=
 =?us-ascii?Q?SenNe6SlmW6QhyDWcsHSke/S4G8IcBq8gSpv1M+hDiIGHhppw2CFrZtNSt4E?=
 =?us-ascii?Q?RI8wgUortZl5PywqQJs3A5vfU00ApgpKucMMAcx4PNwY3SHKoyllxqmCdzU9?=
 =?us-ascii?Q?YUy9sAYXQromv6ytI0CmorjO+jcsR8dH39oN6Q4gTB0mlDgKZAD80I/7zEYx?=
 =?us-ascii?Q?8GUxXj92suqGrG2UuRiHl4qmnQK6MNUfmBSDJdA9gHZ/7TAEDe/r/HA1MwN5?=
 =?us-ascii?Q?Kg2tuxTaC2FfJ2oWc3ienCe0LaBKGmrtxml4EaHgGE5CqoxKvc3kauPjnN4i?=
 =?us-ascii?Q?IVS8UlXwzCBoLYdN3KECQHN/Om1+v5NzOkcEqgGkmMiJnZJJvyoRVTHFsXjA?=
 =?us-ascii?Q?rYOrLpRqC1F956Kehvrt2Vn4iJeItjH+LBUt9KUXP2zs5stpj2LNLB0PpvLx?=
 =?us-ascii?Q?S6F6mf+eldpzOLoHZB4dp4P4k08FBDogyENJxOkpeDQyDwru6eJqXkiIt3iB?=
 =?us-ascii?Q?uLa+qSKjx+BeY1rHv2EJMPR9x/rJi8j1RvsRrasARJHPsuY77fV+RRxCrN0L?=
 =?us-ascii?Q?qqc36tS/7C460VEOZenDX+0vu94rnz4JNzfEU39IPmRcpQNmkmpa+Q6wcOV9?=
 =?us-ascii?Q?xWt20FcNfqMnohM6b+S+il5GiAS0ut5Jv7lvc/gmkMRdwWV3GQwBn+x/wrnB?=
 =?us-ascii?Q?NWT8CqNE+9+HzTA2q6NOfqR2c4tR9auHTSnjDiusETAltqBpKCRa5AolJOuC?=
 =?us-ascii?Q?YzO3Yf/0IX+/LycTcxJ6o0fjwqIlFEcDgDOZVyaEEag/216vxhkb8N6u5cRe?=
 =?us-ascii?Q?H+0kr3KwBdMaF2cdVJQMnBpWRzdVzffGOWBkX0lptasj1ZXxFeqEYcYq+EWS?=
 =?us-ascii?Q?o/Tbfuq++kairj289hu3ka83Rtm1JZIS8xHv6bt4iLfCZnLDXQ0kclBNnmwF?=
 =?us-ascii?Q?K8l8RlFpImJ3OkgiJDogsZQJ5djQASa790N1od5XY0yYQJSUu5OVH2lGWnEC?=
 =?us-ascii?Q?UpEm8hZPZUHxW5WeFbccgX263uvBwrAhyEUGwyLteeD6TOl5giAGzA3zd9xg?=
 =?us-ascii?Q?M01jRYrV4OJG2kDHEi9CA5OHElxO34jwb5wKN31b5kBxGLUZ/Ii3NwjdRNEY?=
 =?us-ascii?Q?z/+Vusmr/1fN2c8QqSxZ0sbsj9WHK1JLwtIBqUf5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a274e5-55e9-4d34-993d-08dda1e3cc64
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:43:11.8665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKEjxeC4rc90xhda5UWfjq8LwaRjbQTpzkcpjDECvetR06p7tzLIw4dbHWR7RmHkRa5Q8n9uhundIqzggF54Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11286

Convert nxp,lpc1850-gpio.txt to yaml format.

Additional changes:
- remove interrupt-controller and #interupt-cells from required list to
  match existed dts files.
- remove gpio consumer in examples.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/gpio/nxp,lpc1850-gpio.txt        | 59 --------------
 .../bindings/gpio/nxp,lpc1850-gpio.yaml       | 78 +++++++++++++++++++
 2 files changed, 78 insertions(+), 59 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/nxp,lpc1850-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,lpc1850-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/nxp,lpc1850-gpio.txt b/Documentation/devicetree/bindings/gpio/nxp,lpc1850-gpio.txt
deleted file mode 100644
index 627efc78ecf2d..0000000000000
--- a/Documentation/devicetree/bindings/gpio/nxp,lpc1850-gpio.txt
+++ /dev/null
@@ -1,59 +0,0 @@
-NXP LPC18xx/43xx GPIO controller Device Tree Bindings
------------------------------------------------------
-
-Required properties:
-- compatible		: Should be "nxp,lpc1850-gpio"
-- reg			: List of addresses and lengths of the GPIO controller
-			  register sets
-- reg-names		: Should be "gpio", "gpio-pin-ic", "gpio-group0-ic" and
-			  "gpio-gpoup1-ic"
-- clocks		: Phandle and clock specifier pair for GPIO controller
-- resets		: Phandle and reset specifier pair for GPIO controller
-- gpio-controller	: Marks the device node as a GPIO controller
-- #gpio-cells 		: Should be two:
-			  - The first cell is the GPIO line number
-			  - The second cell is used to specify polarity
-- interrupt-controller	: Marks the device node as an interrupt controller
-- #interrupt-cells	: Should be two:
-			  - The first cell is an interrupt number within
-			    0..9 range, for GPIO pin interrupts it is equal
-			    to 'nxp,gpio-pin-interrupt' property value of
-			    GPIO pin configuration, 8 is for GPIO GROUP0
-			    interrupt, 9 is for GPIO GROUP1 interrupt
-			  - The second cell is used to specify interrupt type
-
-Optional properties:
-- gpio-ranges		: Mapping between GPIO and pinctrl
-
-Example:
-#define LPC_GPIO(port, pin)	(port * 32 + pin)
-#define LPC_PIN(port, pin)	(0x##port * 32 + pin)
-
-gpio: gpio@400f4000 {
-	compatible = "nxp,lpc1850-gpio";
-	reg = <0x400f4000 0x4000>, <0x40087000 0x1000>,
-	      <0x40088000 0x1000>, <0x40089000 0x1000>;
-	reg-names = "gpio", "gpio-pin-ic",
-		    "gpio-group0-ic", "gpio-gpoup1-ic";
-	clocks = <&ccu1 CLK_CPU_GPIO>;
-	resets = <&rgu 28>;
-	gpio-controller;
-	#gpio-cells = <2>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-	gpio-ranges =	<&pinctrl LPC_GPIO(0,0)  LPC_PIN(0,0)  2>,
-			...
-			<&pinctrl LPC_GPIO(7,19) LPC_PIN(f,5)  7>;
-};
-
-gpio_joystick {
-	compatible = "gpio-keys";
-	...
-
-	button0 {
-		...
-		interrupt-parent = <&gpio>;
-		interrupts = <1 IRQ_TYPE_EDGE_BOTH>;
-		gpios = <&gpio LPC_GPIO(4,8) GPIO_ACTIVE_LOW>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/gpio/nxp,lpc1850-gpio.yaml b/Documentation/devicetree/bindings/gpio/nxp,lpc1850-gpio.yaml
new file mode 100644
index 0000000000000..0ef5f90f69ff3
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nxp,lpc1850-gpio.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/nxp,lpc1850-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC18xx/43xx GPIO controller
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: nxp,lpc1850-gpio
+
+  reg:
+    minItems: 1
+    maxItems: 4
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: gpio
+      - const: gpio-pin-ic
+      - const: gpio-group0-ic
+      - const: gpio-gpoup1-ic
+
+  clocks:
+    maxItems: 1
+
+  resets:
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
+    description: |
+      - The first cell is an interrupt number within
+        0..9 range, for GPIO pin interrupts it is equal
+        to 'nxp,gpio-pin-interrupt' property value of
+        GPIO pin configuration, 8 is for GPIO GROUP0
+        interrupt, 9 is for GPIO GROUP1 interrupt
+      - The second cell is used to specify interrupt type
+
+  gpio-ranges: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc18xx-ccu.h>
+
+    gpio@400f4000 {
+        compatible = "nxp,lpc1850-gpio";
+        reg = <0x400f4000 0x4000>, <0x40087000 0x1000>,
+              <0x40088000 0x1000>, <0x40089000 0x1000>;
+        reg-names = "gpio", "gpio-pin-ic", "gpio-group0-ic", "gpio-gpoup1-ic";
+        clocks = <&ccu1 CLK_CPU_GPIO>;
+        resets = <&rgu 28>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
+
-- 
2.34.1


