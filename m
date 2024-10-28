Return-Path: <linux-gpio+bounces-12189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D91019B267F
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 07:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A43B280E15
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 06:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31BA218E743;
	Mon, 28 Oct 2024 06:40:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01on2127.outbound.protection.outlook.com [40.107.222.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCEB2C697;
	Mon, 28 Oct 2024 06:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.222.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730097606; cv=fail; b=daQ8uXmN0I/v34t16gVf8lRP8MOBv52R8/LIh7u+oaWek3EO/moxJbz40JfBhVWstEQMEC/mGTpMqmIlVORseEB3A7D0z7vtO94n/AUKIZIQLKsN08vgJI8/NABoSF7CO+pi//zZMhfsevpyYkHHFfcMp0nGwUhGYxR5j8aZd1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730097606; c=relaxed/simple;
	bh=njfJMboeJhZbkSQmAT0hyy/0tk2iXeAsrHHviDP9Us4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HfQLUuURvs7KyKXqpb+IVqO+F0MzOBuDPUGvKj9Wm5882RcHyUCeBJhKFiqkLqdUEjYoyF+yF7xK8tzXl0x5GkuIxmqk1vDl4T1Gut5/m+p3WLp0aZdRkKjEQv99XlpQvlDUGoU6K8YNnmHK8vWqXNeVwZCvwHGh98yamsF0iw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.222.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQO6oGwaBOZ8c+eRLko+VufNqqac/Ve8PTTiYHammm6YdnrjNrqkgtiLkie4OOoMPo+9Lerh0KSZ66CP9ulKKfnVCsbdhOIpYUyEKbPP9eky2VCABz0rq/yDWwIGV3UemIUkkPrMX/qXG0QfUBSQ2drSnLh0nZDIBZekFUK3CcLFbqrkHTctBu6GwXNFwPX6ClRAUxXmejJYyrHnLGYzXHoi0gDhEQqNuSjPVTNYx/8f/Khh1SehtxvnN80GNrSEJACPqQHQEvVlJnC3EswjVUIeSNrOCV9WItYY3SKXPMaCOA74V5upAUkcaVwRVMG/LJDr6eU0kEZVO+bya979vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yf3rx+NeayroWSJAq8nIH4bmgh6yuV+pQAJkirVMYZI=;
 b=rzi3QJValZvn7pgdD1MXeUw8lXMUhyksf+aDNZOekRwFAlwOrAbUtfR3987oMDx+ZP5iZmoXVb65ZfOrKuwV0J1NO6yCo3Bbgb/LR6Z+Bkp3/ZNkEh+sJfcNFWin7h4Qi6yqQDKdhOnGzAhLBRMSYPsgUOwuJVSlIO789Yg7kO1A/n7oqXKJ4ajnsXMyAQvKxkIGP0Jn9rMitgVKdM9mRqz57eU/BD4VHK8nVD2gEOQZWkAMr98b+nIoIVybKClKbtw8OWiyzNWr/w7p2lWSiGuHYAXNDMseMHhH3fOQ3m1TvrNAyfIdVBj30wlEoZ7j5o9lA1P/B9+A/KWZsTT2DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN3P287MB1253.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:196::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 06:39:58 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::368a:445f:b1be:4bd6]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::368a:445f:b1be:4bd6%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 06:39:58 +0000
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
Subject: [PATCH v3] dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt to yaml format
Date: Mon, 28 Oct 2024 12:09:11 +0530
Message-ID: <20241028063939.6276-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::7) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PN3P287MB1253:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb2e368-1ebc-44ad-181b-08dcf71b573d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RGVkM5u9zj8ScHIB1rRoEZ2a1fRIpJn2q35H0vAmm41EjxSQ2rfWv2+tnpez?=
 =?us-ascii?Q?ZW9sjwizyyEoNlIhuZmGf2tnvyBrc7lrbXv8sbZ7UcW2/FkYDw1yCluOXUoY?=
 =?us-ascii?Q?PTQ91XxQqZivAr1SIfWtYeFRCWGBRlHVwnOkSRZdhlC2PC+dPBNbj/AhJ782?=
 =?us-ascii?Q?BEyGcSZjOlg2t5BDVATXm/tqid16II1E/90BGwHALv2l4cnrRPu4daxnK2v1?=
 =?us-ascii?Q?73RiB775vaeU0qdQrEsZcTmoZm231lLx5+gKa28hQP2vGWZ6dl2ru4aBfzY7?=
 =?us-ascii?Q?hruCKo/fBTzQpHRpvq/Tb4FeCo9e21ejapqGHtHJPC/AbS9R7Jq1ZSnIPGXS?=
 =?us-ascii?Q?AzIf8hj8XjSdyRTw/XTq4sVPylbUUFNZFxAvpqdm0PMtqU4BQuCri/BzSuWw?=
 =?us-ascii?Q?YIr7khkAfFNFddW6GSuni6L/UlPm6UiESxqO8AeXVJ1suQnutTAeOUbhB4Vf?=
 =?us-ascii?Q?U8CTrmg93hY6EmY2R7Eb2qETnky19zYdEf2cMR0fYCpaj9hgofvvkNXJrKHy?=
 =?us-ascii?Q?s7/80cyxpeYQnWyFaJR9z4Jd7TzSBP4ohmlO2MBZwPMY9I6VEAhNdWYVN+Y0?=
 =?us-ascii?Q?6fikh+jcTRg2qmqb3q2aMLmYIsHQ++SckWBmdzW+NSWDdOGWfFOPGXYVP81a?=
 =?us-ascii?Q?yW7YHFV8qolVPbb5xmtrY1Q1nEJAn/eMFvUMSuNP6f5iMO+DwYHd6H/E6sm4?=
 =?us-ascii?Q?C3SjH37bneCkeOlWd4SYTx1+7POUfVHwHi2MBz+H2dKj9mFNUswcKHNtHCfX?=
 =?us-ascii?Q?6uIPCZXqFFJX4GgOU5fFT4aelGvKLS1TRjkNgQDp8yBUTaZA/DO0WZDYk3Gl?=
 =?us-ascii?Q?O5ctpYVXHxSdwkftfpbxYdQWwajJsOUeAujd/p6aHn0B/Ai4J/OACmt8GXVc?=
 =?us-ascii?Q?d/0uO9NXoprHnjU0I7H8OH38lNOdUeaZuF9Dw6vdQiAQUAhRhNBTInaRJ9Qj?=
 =?us-ascii?Q?9DVo52Wjo3JrJR0q+ENdVa+DlP07ArRxj1THux35vGoBr2eZ1ujyJ2WCXeTV?=
 =?us-ascii?Q?JXcn4MO8H9ahHenIiFF9+C4lsZfuUCwOK45zlRvFHV5vlHKppetZrxpxOCHz?=
 =?us-ascii?Q?fzdTChY1546rmRm13Fm98Z/9+JQeVeED84A19fLZHrmYGJ6T2eX1O9rkvUnR?=
 =?us-ascii?Q?lHyezdjnKThu2+mBccPfGuPGq3mePnihigRxwR7K2YS4RY77hAmAgQ3pjE37?=
 =?us-ascii?Q?aWp6gppjZP7GEjNViKYthPrz5Pjt/y52f+eskq5KHdlnx7Fb+/u3UIOJZkXX?=
 =?us-ascii?Q?xO3/khfjYlsbWWDOCSOw1UaCQ1GOFyTqb6q2jl9IymNk7JyylgmJt/B5t2SA?=
 =?us-ascii?Q?lq4EoxVFxVAh1m+n5+dHcl/d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ltj3OrMOiuCXcGEfzghuafmYSITo8C/jyqd9aFV6f5NTEJavyqmn3jbXybKY?=
 =?us-ascii?Q?2zPdVIFnz04aAEe5yU1vHnvnMqs1xrMA19Gs5NVCoaLY92qECGgO89bNXvbE?=
 =?us-ascii?Q?TWi64EWsOTrEhcHpDgVH4KDhQZ2eAfEg4BDq3Lg29Hgp022hsc3xTn18LhTT?=
 =?us-ascii?Q?wabE6Wn/RoeStPqJSP3wmLAT4wLH05tmddZE0wkvEbsi+Xh32FtgsJsyee8D?=
 =?us-ascii?Q?2dNQrrmiAdol5ntcTYDlyxWzANjs/5ExKFFOYXQ5n6IPhnSmIX+SlRu8L84Z?=
 =?us-ascii?Q?BHCU7lmTcOpGejlPgMs6WOtrQFQyry3BcdzCpCmGl7hwtWV6/pK9KRPeTSED?=
 =?us-ascii?Q?DH3zMFbp7SnfqoKKznHbBcG0cZ+pmtX4ze+uwBac/zzmqWJubjUbpkd6+AbG?=
 =?us-ascii?Q?9tOkji3G0YodveQoq4isS3WQpSzdIbX09T9Ff9O1EeqpKdX1Q9P/MDReAotF?=
 =?us-ascii?Q?A1MYtrxsGQO/hBBvUfw8nb1lFalk8wnN6ewn+d4lZPozQPWuKhF4PotcxAxY?=
 =?us-ascii?Q?ti0gp26y13XYqY2MXYAQtnnq6FYI7NdnMam/4n2Svzw/cIhlgLNywTg37w8L?=
 =?us-ascii?Q?StLQoKKcsSeZMqJKwOO1tav7Xw6wuth+UDg/HJRjHiHFCcQT5eRhNS0aJFpt?=
 =?us-ascii?Q?btUT3LAsqIOI7IwOxcsdnHlLzovNUGF9UBy02DJmynDodprpxlOr5qNjGkg6?=
 =?us-ascii?Q?mdWh2aRzOIbGDxOUW8I5kgJpJniIr+wCHxx1pp7bU4MElARufW+KSKs+9q96?=
 =?us-ascii?Q?s4WKM1k/xEn7C/lN9hp4LVfdB+bcRLMgG6G9egN7lx3yaUKQ9t9Qs4gvJq4p?=
 =?us-ascii?Q?K/noHbvchIW4IuKBJAdsAcCZKnIMZP25oWp5loUAhGBOA0ubCZXGp2HnAkwY?=
 =?us-ascii?Q?6NScLDeD79pf4cUO/OX3iv7SQTO4HoJXLvKsjFOuxJsxpu1YB26LxgNq9dfS?=
 =?us-ascii?Q?vkddX/kl4e3w1JWmg/zykXOFdTHilXzYwsoK7ZLU36c4ytUKcQw53wgMJeZt?=
 =?us-ascii?Q?MZnz4lbFPlsWcQGbZ3KRhNG141IcbqMOjno1JoMI2Uk1fK4Ine7LZ9o09k9K?=
 =?us-ascii?Q?V09sC4txsuK5fkemA1aeZSvxRxFu4HYdXNZ/PXExq/iN6CYq8STV1U6wGlhX?=
 =?us-ascii?Q?ZuLMQFwhGxC6Pj28qFAGmeCdZXw3gFOkqYu3TI+PLQMhr5GMnPc10KEI5FMo?=
 =?us-ascii?Q?0HGZez46M2xpcTMDOZmpyzRJuQsRo+ED7DNPmiXn2hgNHop8pKn52mKAnUbB?=
 =?us-ascii?Q?ZZw707sskxseQ0jAiaICmSqzWYGpF++Qubt3BSbZBAkwF8NB28ojG31flIxy?=
 =?us-ascii?Q?VbJ2LBiaGobLZ7nQI5F18+iF7F5IYp6Mu5mhVkB0MXVbZD/oMHeAQ+JAIJrC?=
 =?us-ascii?Q?iOL/hyTJ5QDOc4CjU9gtMTtiM3Ypwpkjzwi/CBZe+570GRbaxV+Nk150AIr+?=
 =?us-ascii?Q?x7exhLUuNFLxqwYCg4KUBjwXQ65CKgmoT0C9phhS5tO/sqbGWf/Qiyt1Ui3g?=
 =?us-ascii?Q?1WiD+5fXyyDQkP3WPASOlAK8xjpYKqrRqYXN1VFaXdh+PR4oSzdWeMvOY8E8?=
 =?us-ascii?Q?6aREMXZr8Tf2NyJIes6axIzlRFxr+dIWX9P8foaHY68WLn/qmn9u8f1zCM8U?=
 =?us-ascii?Q?NcLjwJrNT1qa1SMjvGQ8vts=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb2e368-1ebc-44ad-181b-08dcf71b573d
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 06:39:58.2804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jVLCQzH0Y5XgLksITXG9ZJd38rw5HwRIasdqaUV6eMuUPmrBuRIbkP+Kiu8HZVr4GC+dpo0u2DwWLmg0pq3EhHpxNa55Q1OiNi0IaQPRoZy/daQli2Ii6yQ6bl/bNjV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1253

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

Change in V3:

- Use correct quotes (')
- Drop Unused label
- Drop one i2c example
---
 .../bindings/pinctrl/microchip,mcp23s08.yaml  | 161 ++++++++++++++++++
 .../bindings/pinctrl/pinctrl-mcp23s08.txt     | 148 ----------------
 2 files changed, 161 insertions(+), 148 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mcp23s08.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,mcp23s08.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,mcp23s08.yaml
new file mode 100644
index 000000000000..e07f4723de17
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,mcp23s08.yaml
@@ -0,0 +1,161 @@
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
+          pattern: '^gpio([0-9]|[1][0-5])$'
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
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio@21 {
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
+
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio@0 {
+            compatible = "microchip,mcp23s17";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            spi-max-frequency = <1000000>;
+            microchip,spi-present-mask = /bits/ 8 <0x01>;
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


