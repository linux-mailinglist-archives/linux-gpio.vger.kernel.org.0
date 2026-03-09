Return-Path: <linux-gpio+bounces-32854-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEGLEew0r2kPQQIAu9opvQ
	(envelope-from <linux-gpio+bounces-32854-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 22:00:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A91424140C
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 22:00:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99CE830063A0
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 20:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A674340FD84;
	Mon,  9 Mar 2026 20:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="neV3iVLS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013012.outbound.protection.outlook.com [40.107.162.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B0C36C5B0;
	Mon,  9 Mar 2026 20:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773089773; cv=fail; b=o2OP/K03auPTQbt+1K1ZLFFv3CkO6pbC27IqfEZYNYEKc0V2iRGZ9+3xqwmAM15aF7TFfOX37A+5on3wXcrUsb++KE9XoEHO2uH/uhHsVHU7RD/uqwmIbYIbdl1yeimJDZlECXU2P0ecAEbLWK+Fiynu1vYeMelpenkTorDdeUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773089773; c=relaxed/simple;
	bh=F256R4URXu3lHqDWd7p7hOvCZZzb5sZPqBfqsL+8/GA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AQLrdvJw4PrDEFvyuS585jm1Niheqtw8uSi0JORg+yST0jZaiLV8olrPOG/AbQ2WA01kZJBIUmCXwi/cJA50PZz6yzUmoPO2S5ZS+BIyVvZCiiXzrPVDvGvbWYnFuAwgeawX+k56mi9aYR7SJ+D6iGEqdYRatQsrlS4+fw7xYlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=neV3iVLS; arc=fail smtp.client-ip=40.107.162.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBiNRR5UvxHP8XiQjLQfmIPaxTmHBYWCi6w7KrrxCGb6kYYNqQVNHgva0o6SzvklK2meI6SQPwPpJ7pF8N5PzJuY0y2A6Glqj8EqQ+fHSehVRpffFmP5aHP72hjh2K/b4UokHnLwda24Bf5V9JVEjD9QRn4+gdcNZVAof6qUS/7lqoibbMn6uxHfuq98IBfUDH7P0wuP8Imj4SkQ76c+i2sYTkRj8MJgdWt51w3cMmJ2zrLDSLQcyY2Rw5R14wa4Pjx7HEJn4tc7I7cqnEdVbz5tSruB77rJvBqEPxn6kAn67ko7gUo5n00cHZq7N0Z0trC2fVzvKffTgHZ9vIqf5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMzBhLJHG0yoStzHCWSD5rkv2htm1phy0NlUssi5SQg=;
 b=P0RmEWv59KAW7E+aYRjOxS2BTdtpdTpsxt1loHuuTYwr5msce9uAiM1WjHEKVe7VdeRr4vImSL8GLzigWw7BQBXFniey+WGlzZnDNI4bCmxfpvgmAYGIv7Qbw3cTd5bWJkZ8chFOck8B2nI3rhwP/LxOQvGPGBj0/eqngt9/GO1cRFqKzMW1wDiltxCYXbfhQI6gZ6AkOpvVrfRS7DFlYgRWI45+rP9mO1wO8r9QTiUm5oMxwGmxBdYvt0OLO1LgHoy3vx8Gf9bG22xfxvFkNaKi1EMV7OauqUxWIZMjxYtJmvVLv0I1IHijplnXophnOjOVByVObP0O2CG++AtrHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMzBhLJHG0yoStzHCWSD5rkv2htm1phy0NlUssi5SQg=;
 b=neV3iVLS+kFlKMhye5i36dS38kpxeEc5hBUFXczOHxs1MioMUxJuHSeYKJHSDMwKm6f+9FY+6aI/SCAgNOadPbmdV9urvzc3AUiOJ7+aB7LvbjVBsvFIttoCRICrYkQLMSqY7xLrinEJPUkAG1KTeDY/i+I0x+A9b4pDfEvpDQVdoAMoZc8c8wjL99hi/cnNy+d+XddQbQ+uqoYnW8h71G+hPZz8MK9MwEb1m1bDLQS/ScEUznCPxX/VpLEcKcuWlhKHxeFpHPLT1RWeT24OoZC6r4upyuk8p9mMcPuJDSnXF6HxsI5cFzljAqcqmhpTanuQ30ouCKovh1iTI+d/ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DBAPR04MB7335.eurprd04.prod.outlook.com (2603:10a6:10:1b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 20:56:08 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 20:56:08 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	arnaud.pouliquen@foss.st.com
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: [PATCH v10 1/5] docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
Date: Mon,  9 Mar 2026 15:55:28 -0500
Message-ID: <20260309205532.1794202-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309205532.1794202-1-shenwei.wang@nxp.com>
References: <20260309205532.1794202-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0001.namprd11.prod.outlook.com
 (2603:10b6:806:d3::6) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DBAPR04MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: b0c3fc67-2ecb-4099-e0ae-08de7e1e4967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	/ZGbYWXIAXJdwdBMnQKjyBRBanLuhhNl4qFNjmFfrGodiloqzBRW66KdxS+g96ryoCvF0d01qzJNIhzNAUUScBpNidg3kUutCre5XARmAbGP40aFu1kI4Vm/gpyzNXZwbMS3CRBDyfcLbwfvO/0owvobtP38DcA2kxJDLp9TU3/NBEfJZdWQtrDl0LwzenK9aM+VgNQh4zh+3To7I9sog4RBzKVy+xAwSgo54BZQLEH5yJx80FuBzvYsCXK61ljPb8jI20rH9d3W2FPxMO6y7RhdvXbvto2zOouJrruSBro3v1anQaugjhfhqbGCUnpIKN8q0nU9LwFw/PB5FQk9yi2BfNg3Sp71lMFPPe2CY6G2XNfZzwyhv7sKgun+KR4QhLDoqWUaEideSyzsrE5ZDqYXB7nL0INKEudR3jnSjrTyWmMPSfAlVSzLFh5hBozb66tAlfjPP0vYatBfeWMwF5w3e4+fYY83VIVq0MW5EdcudFiNnkYoYpB3+TesOqgY7uYpEwnReOsSjhLFL8X1BmSEJijNU9HqoImUrlimwmA2EEeDUTiTrdTnZd5gyyyFk2tXS9mpVTV/hjI9ZkxFR2TdNmqFGEtOen/cb3ofcYaX04ixyw/BS4It2beTNUdsJZrhJFrtAGdm2s0UmisMRmpaJne6Fmv9UV2/mGhS7QU+XlPYEB+6FOfQcdnpjJ+5mYvnoO5FDA62U4VXts7Sl8JdaaSUboXkd56jZeuVQMKW4qiJdDqOzArR3vzvn32NC081WoiCi1H55rPIcRgvd2i6njj55Tt+Y+FyqwsTfXBAKE7zyIsD0GIlNzaa7Q6d
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PnF/knk/h4XJVBa/hnRHy9cMSpM+LavPo029D4XQfqfBFufflNe5TI1syaVz?=
 =?us-ascii?Q?+XljLkKRpsAT+j115PX2dn2FsqLmKRQuU7M+qQ82r8a0SnBtldND3jIpJFKQ?=
 =?us-ascii?Q?D+XDh691vRn/yYmSqdGSwMOmJSuhqgxA+1EhODjxIUthT4CmYQTB51aJ6JI+?=
 =?us-ascii?Q?PBfzMlAf5TmYH1vNGZRL6o7FcBB0N+d/hA+huHv9i+5o7fdM8bDo/zwgOHoQ?=
 =?us-ascii?Q?d4sgVBE6kBROTchfKeWVjvyc7tdysSYvs7vXLXGcGfXtt6yWuueI64yCD/NF?=
 =?us-ascii?Q?naO/Wjs7vmUdf8StW0afGv5m4OljDrwJyC0YqAVfeC33FMQYSeM71l7kktAB?=
 =?us-ascii?Q?H1amb1HGnXwOJihJ/EVGlzxwPnZiIjEWFBGFpAcdC7OTu67DgP61P+LkBbQj?=
 =?us-ascii?Q?7NVM65XtBZV7YeYfwxJertCEb0cLv5kan0S21YFbDHm+YuDJKHHrCegPHcmf?=
 =?us-ascii?Q?HrscbIT6/F7DDAyyLqtd1kBg8QPeIwqSUtVokX3x74I7hgbHQqZVQiV02dfa?=
 =?us-ascii?Q?E4blyPxnx0ROPiPXY+C5r8J2a/dvDxlIODv7224PIb8ZsaknCx2mSHGpoe8n?=
 =?us-ascii?Q?hWRL93L2L5hOvWTHQAwGBaZ+XJjQEZ1+4gYfrrQVGs4wf5a0Zn4OO2jrLbva?=
 =?us-ascii?Q?cfGb7jh/0PlyMq8jE07iDbGwBgL5AftiMU1FK/ppcXqvLxOl1sGacpXmkN9Q?=
 =?us-ascii?Q?NqlvrRA0J6cDKhWyLksPe+g03xm+bx/jRIci5raitRZ+TzUc8cPYyiiHlSLw?=
 =?us-ascii?Q?z1RhbhZr5hM8hJaffArZcN263FyZzWqGBiySCfGMbBmqXspP/V20H02gg+UY?=
 =?us-ascii?Q?IEpRoSuo4Orqs7LDZdO5yKX/MmNusGIgDs2+AsAkHJLXwT+79rFGBpKQ9MA+?=
 =?us-ascii?Q?RPOseDjo2sumZMm4Xi08z8VjQdK26e7/HexDad3eWHpMZ1n9G1T/w3gGoByh?=
 =?us-ascii?Q?y2S6nsED23W+PVYMnVzn5Yt1oTpOa3Oun4lmPugmFMHy8PRpj7ppGA+RBO+q?=
 =?us-ascii?Q?yvtqFVF5unYtVu8YvYT+ia9meN2guz9gO3sHGcvbWSxwCUzsh4IbctzD6c77?=
 =?us-ascii?Q?GzQRJjncszsYu7ri3yUTD+05TfHoCV0BxhC6SsSwZ/PZJnrQDKU/2L9LD/8I?=
 =?us-ascii?Q?3y2p2l1gW0ybuPUfHE8pHNUSASYmmRQO2qkgJ3VR9QH29gK4iiQq+AC/Fj7q?=
 =?us-ascii?Q?1hH6jojjwEelKsAiehCL9+PA7eONtWtsIdYpY1Dkysnea9X2qzVRNUVx/UNn?=
 =?us-ascii?Q?PotErGtqzStcno6pnTi0X62w2xcmw2kzDmDFkLxpUpklXryvt93mJltwi+Nf?=
 =?us-ascii?Q?o19hc74Fi5KYKnSdrXSLaV7Q212HVbFdlKn0J0LPyPKX8p2I11p3iTo8lL/N?=
 =?us-ascii?Q?sd0AgtAmROy0V4p2O91XOmGC4S9q7P/qFZDz8bKBJMHlRDecC62XRuZtxloH?=
 =?us-ascii?Q?FYwMU+M5fsisLIzsoqltUzz8IDfJDBSnZP0bTvZuYoYylGDzXjMXl8dJrJRA?=
 =?us-ascii?Q?COUf3lTJEqLgArbrYAgFwdRy0KCOxkSzOU8L9z89+4LKRl2GgthoL+lAiWbc?=
 =?us-ascii?Q?1UGhJa5uM6tDB6dMnRBqvre/9ju/HrDJyHQxjR5lWEYRoKd/zECFJ8D7GVjB?=
 =?us-ascii?Q?NIK5kEf1dVSo+Hak9q1zntWA/SB0Nx6zTba7oKN92VcElxTSnN/VfhZLZo2T?=
 =?us-ascii?Q?vjSkWPT4kGMFTGDfxc77ZV28++sGEDM1Mksxn9D8kU87Vmzyht2y0dTc6HSz?=
 =?us-ascii?Q?R+M7QjXWkw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c3fc67-2ecb-4099-e0ae-08de7e1e4967
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 20:56:08.1229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kabxmRg7Q87AM1eok4grCqcsuuAPUD5uHjqWA53Bhfh9Y5IcCjMmbJeE+kq/s8M6y0tOTOBk3LVPvXLHP8TRXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7335
X-Rspamd-Queue-Id: 9A91424140C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32854-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

Describes the gpio rpmsg transport protocol over the rpmsg bus between
the remote system and Linux.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 Documentation/driver-api/gpio/gpio-rpmsg.rst | 266 +++++++++++++++++++
 Documentation/driver-api/gpio/index.rst      |   1 +
 2 files changed, 267 insertions(+)
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst

diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
new file mode 100644
index 000000000000..0f0a3ce3806b
--- /dev/null
+++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
@@ -0,0 +1,266 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+GPIO RPMSG Protocol
+===================
+
+The GPIO RPMSG transport protocol is used for communication and interaction
+with GPIO controllers located on remote cores on the RPMSG bus.
+
+Message Format
+--------------
+
+The RPMSG message consists of a 6-byte packet with the following layout:
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   |type |cmd  |port |line |  data    |
+   +-----+-----+-----+-----+-----+----+
+
+- **type (Message Type)**: The message type can be one of:
+
+  - 0: GPIO_RPMSG_SEND
+  - 1: GPIO_RPMSG_REPLY
+  - 2: GPIO_RPMSG_NOTIFY
+
+- **cmd**: Command code, used for GPIO_RPMSG_SEND messages.
+
+- **port**: The GPIO port(bank) index.
+
+- **line**: The GPIO line(pin) index of the port.
+
+- **data**: See details in the command description below.
+
+- **reply err**: Error code from the remote core.
+
+  - 0: Success
+  - 1: General error (Early remote software only returns this unclassified error)
+  - 2: Not supported (A command is not supported by the remote firmware)
+  - 3: Resource not available (The resource is not allocated to Linux)
+  - 4: Resource busy (The resource is already in use)
+  - 5: Parameter error
+
+
+GPIO Commands
+-------------
+
+Commands are specified in the **Cmd** field for **GPIO_RPMSG_SEND** (Type=0) messages.
+
+The SEND message is always sent from Linux to the remote firmware. Each
+SEND corresponds to a single REPLY message. The GPIO driver should
+serialize messages and determine whether a REPLY message is required. If a
+REPLY message is expected but not received within the specified timeout
+period (currently 1 second in the Linux driver), the driver should return
+-ETIMEOUT.
+
+GET_DIRECTION (Cmd=2)
+~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 0   | 2   |port |line | 0   | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 1   | 2   |port |line | err | dir|
+   +-----+-----+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+- **dir**: Direction.
+
+  - 0: None
+  - 1: Output
+  - 2: Input
+
+SET_DIRECTION (Cmd=3)
+~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 0   | 3   |port |line | dir | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **dir**: Direction.
+
+  - 0: None
+  - 1: Output
+  - 2: Input
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 1   | 3   |port |line | err | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+
+GET_VALUE (Cmd=4)
+~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 0   | 4   |port |line | 0   | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 1   | 4   |port |line | err | val|
+   +-----+-----+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+- **val**: Line level.
+
+  - 0: Low
+  - 1: High
+
+SET_VALUE (Cmd=5)
+~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 0   | 5   |port |line | val | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **val**: Output level.
+
+  - 0: Low
+  - 1: High
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 1   | 5   |port |line | err | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+SET_IRQ_TYPE (Cmd=6)
+~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 0   | 6   |port |line | val | wk |
+   +-----+-----+-----+-----+-----+----+
+
+- **val**: IRQ types.
+
+  - 0: Interrupt disabled
+  - 1: Rising edge trigger
+  - 2: Falling edge trigger
+  - 3: Both edge trigger
+  - 4: High level trigger
+  - 8: Low level trigger
+
+- **wk**: Wakeup enable.
+
+  The remote system should always aim to stay in a power-efficient state by
+  shutting down or clock-gating the GPIO blocks that aren't in use. Since
+  the remoteproc driver is responsible for managing the power states of the
+  remote firmware, the GPIO driver does not require to know the firmware's
+  running states.
+
+  When the wakeup bit is set, the remote firmware should configure the line
+  as a wakeup source. The firmware should send the notification message to
+  Linux after it is woken from the GPIO line.
+
+  - 0: Disable wakeup from GPIO
+  - 1: Enable wakeup from GPIO
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 1   | 6   |port |line | err | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+NOTIFY_REPLY (Cmd=10)
+~~~~~~~~~~~~~~~~~~~~~
+The reply message for the notification is optional. The remote firmware can
+implement it to simulate the interrupt acknowledgment behavior.
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 0   | 10  |port |line |level| 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **port**: The GPIO port(bank) index.
+
+- **line**: The GPIO line(pin) index of the port.
+
+- **level**: GPIO line status.
+
+Notification Message
+--------------------
+
+Notifications are sent by the remote core and they have
+**Type=2 (GPIO_RPMSG_NOTIFY)**:
+
+When a GPIO line asserts an interrupt on the remote processor, the firmware
+should immediately mask the corresponding interrupt source and send a
+notification message to the Linux. Upon completion of the interrupt
+handling on the Linux side, the driver should issue a
+command **SET_IRQ_TYPE** to the firmware to unmask the interrupt.
+
+A Notification message can arrive between a SEND and its REPLY message,
+and the driver is expected to handle this scenario.
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 2   | 0   |port |line |type | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **port**: The GPIO port(bank) index.
+
+- **line**: The GPIO line(pin) index of the port.
+
+- **type**: Optional parameter to indicate the trigger event type.
+
diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
index bee58f709b9a..e5eb1f82f01f 100644
--- a/Documentation/driver-api/gpio/index.rst
+++ b/Documentation/driver-api/gpio/index.rst
@@ -16,6 +16,7 @@ Contents:
    drivers-on-gpio
    bt8xxgpio
    pca953x
+   gpio-rpmsg
 
 Core
 ====
-- 
2.43.0


