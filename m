Return-Path: <linux-gpio+bounces-15131-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4EBA240BD
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 17:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3D833A2EBF
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 16:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A921EF084;
	Fri, 31 Jan 2025 16:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XY+9tFBy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2938B1EE03C;
	Fri, 31 Jan 2025 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341271; cv=fail; b=GX2JC/QQtpQwcvEhQHyFJCP3vS6Y248T5fvWtus1J5EJN70cRSmJmuht9Re9G+u1gV3yEn1NJixLcSItwasU8CFwRSQgaBXm3yuFk+1hSnLBpvqfV215zFLlFIQr7TIw/J02rw+3iQwEEjEMjqv2yEhZ4jyvNm4KWH2vFIOwrK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341271; c=relaxed/simple;
	bh=JGMiLOPliWJYCOJ/oSKwmppPItKLP7OAecIbXnUpgNI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=EiuApIpQzEQBgfE9TDuTAT/YNTk41LeUpyXK59B4MQHjHUsf4BD/T2nMq7woaXEEgdfdwKYs3ngRMghZLx2smsk/cILoCTDARWuUPC3KonVFTtjrQvCRe/hLkV1tzzCtvaCdr8DF2BnHMSW8gNCzBwKVWyWkliUKCk92SWj+2yI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XY+9tFBy; arc=fail smtp.client-ip=40.107.159.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgCUbMn6fuBqIpBC7YcZYXfsY33iLkcWclpcWu1PZ4zHHSUROywuuxzy7L7B/qTK8z019GTOXJP6qv7UAR1ohuavdqslmZEw8HRWLBdZ/Dqg11dsw5dhppS/AndV+AN5soHLdnieUD8RWdabVrRn+yLcIQ7rWbN/GnmSCpVVZfxBbJbd1lcK39LHKADbKB4+hGOFTgyq9IbkqohyBLPKfoBKQtu647xf7RvQ8PbiSVK4i87+tBocK2XYjXpUifwd3UCR0rkWZLP88rLPuQBlS/Wby/v97yu/N6dh74U0yxbfUmJGjFlFuW0QatpLyVGzu9QoaIG1MImaLaxP/gej/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qn/3wXg5+hOb6JQc8b09u4aVJDQBmKYi9pOk2UgKa8=;
 b=NVR0MZEX0dyQSwTUKIxtOm+/So/YI3JCgXgqk7YhLKAQrwcDVWgbKLHNiKnovLsRL2Y3N44W/8fZjiL92cKJQvh+9EmMEVQbHgCg3U+upwsz9V+gwccRO2E8cqf0DKtT0jothZYWHsJPF98/IdRDCQteIZRiGTkXTMSSqTWgVXYS2otmH+WwY5/5NJj1vkPLjKcWo6pfLFqqhQlTPL68xkqM+6ni44pjD7C+aQRGCRin+aNK5+0sbYwQoimkdloNHHfd0shSr8i3gGi77iXfqRKiyp+zpof4bXUF6aL0R5VPVtro2iS6gCKpRXaCGYUdLIfeyd1Q3af4KV/5Q7BRuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qn/3wXg5+hOb6JQc8b09u4aVJDQBmKYi9pOk2UgKa8=;
 b=XY+9tFByEYdsryYscqH1Sp/N7ns4sSkdRezmYlfVVF6syoV8ISfw4EwyDalS44zDtV1u3WKW372NUMfsNRQVmG4TQWo/q+/OwLCI/+nLVo+04ft6UyAib1gsXtqE/MR6JPlxX47dXwWmZ4xYOFEpAmZBCfFUeffHvEYbfAI8s/9D98htD0k37b5EmAgfc8LBnChYbtmo73nTnXVprpvQbZ7EUpQZhmDi/cvzk8z1SwGs5V9SFCQ/2KFtIMBwXpB3QBYyjURG+nQJvLutp/K04vN+xl9dqCwXxP+NvGRLZJBl8QSqCWfkYjEuurAsb3SOG5uVHTHfMSDKJFGEcCqMjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS8PR04MB8529.eurprd04.prod.outlook.com (2603:10a6:20b:420::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 16:34:25 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 16:34:25 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [RFC 00/12] staging: media: max96712: Add support for streams and multiple sensors
Date: Fri, 31 Jan 2025 18:33:54 +0200
Message-Id: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0002.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::11) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS8PR04MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: bd6ee848-56f1-417a-48a2-08dd42151fd4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?xL3R6dNgsIhwOfyJWT+pAxaU1DEYKQGxz4OPxP6Nu5qK5EkU2pOakJ9BlST+?=
 =?us-ascii?Q?nEAEPbLloGRK2JqyS2mGDQc9PPrM+CEqEzko3cndBnIBY6dY9kRZEO42OO67?=
 =?us-ascii?Q?4ngpzfpSfOpBMSjCbvBy6XlxWGd4lJetgU6W9k9dq3xhTBS3K6A5srK43Ul0?=
 =?us-ascii?Q?Ly1T9r6OeGlui3w367FiTY7guTeXa+Eg3+kkfpove3dKkuFEEnbJMwe810Ha?=
 =?us-ascii?Q?0ANT673YiQrvGGCSOKL+/YHRpEsxh+K7ZC9vm2e+YOoWfJOruDWFhbIXyz++?=
 =?us-ascii?Q?flnzeaqKucp67tP8p8o8hyBaowMQbD2jinTpEnSqZCNyudUz38g8E8ZFsfYt?=
 =?us-ascii?Q?kljP0pGB25FQa78P0aGKUNwX4CVQtpx27QHpiTnjo6raTeO4AMuN+yPIUy1e?=
 =?us-ascii?Q?xjAxebfj4GC7ZufI56M93bfhU/YzuD3NbMs3OU7uAJiKiThCR7lYqQc1zDsJ?=
 =?us-ascii?Q?DoIKPyISl2g2lUy3ckflbbL6nu98OJ+dlsGNDDzHAUS7SEOIdqBOUJ1Qd2D3?=
 =?us-ascii?Q?sCsw3O4pV11QjH5fGFbCJwG2zHM8Dv1spxsq1gwgnalW5lNsd4n6aDWkwLHq?=
 =?us-ascii?Q?5UlKUoCkGaG+RY+fg6MZmD1I7J02IYmNCmNxpqgOIZQQJ8iBNKskf4INnOsY?=
 =?us-ascii?Q?6V7IranrrBEgtS1dyQ3JJhTkOX+KELaTSOPbWI/xNGb+L1HA87akXyvRqrMt?=
 =?us-ascii?Q?dFUPTVTmABoM/625G2p7+pTYBifQV4HBQAUL2yHENB6WTdnQ3ygdE8Uz5JFg?=
 =?us-ascii?Q?sVHDybgErlBYMbL1XAB6l0QMUeTb9JxpmRoQ3wIjs6EMAb31FnNpKCSsRAUd?=
 =?us-ascii?Q?BteULJ3i4hq+8oCimUTrOylhQWkiYol2LhmqYboKtDOhppYoLPjIUE0DeWTI?=
 =?us-ascii?Q?UFfOc3rseO66UjgUz17Ypa5jDhW2bf0TqOiKrF66lEXuS5xHw1vmKLSwsAzr?=
 =?us-ascii?Q?wp6KBvUnMmMxmBwtaOAHjVVf4QE2JD0w1qHBz9jrfS9sWGhIAAu+6t9vjUd6?=
 =?us-ascii?Q?YCtw2DdptDAWqyI9OQbbxOWseGJlijeVd9LvL4IEHWlp8dk3TYmjv2/IlO12?=
 =?us-ascii?Q?hmjH3komg19Bho4zwQoQrW9AfnBwtvJ8cnJeBPzfgvAwhCPJx3QDB5f/FF7b?=
 =?us-ascii?Q?BvHd3tvPzPTJdBKqKCbKqjZLCWL+aGwKzS+4yoRzsMR5DJK05FMZlQuJeFKE?=
 =?us-ascii?Q?gt9/83jzYk7xF6ZZdQQZ//04vaH3mKpYya0BNNuJmUaZHAY4PJSs2h5+forW?=
 =?us-ascii?Q?V86lQwD5VwwoXar/ZWi2Id5uDVyea4oEHVHumbJpzB5hj7XAIfg2qE6Mi1EG?=
 =?us-ascii?Q?+74/Me2sDamxD5yxYEg2xuwaz0x8wOuRQwzmatSmaoIgmBXZ1FkiI0Kw2cig?=
 =?us-ascii?Q?eTq5syZ983/P2j0eK9MYO1Q4duBZ?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?yY/WnYlyeNCnHxTh37VReqWEcHiPE9pJ5sey/h1qbzo3Qsl1J8JOV161wNDy?=
 =?us-ascii?Q?F6H2zuOt2gOkq8tL1q/V3pzNIvbB69/hKSVUdRTjXyb1REXpozQLBSe/9SU6?=
 =?us-ascii?Q?gCC4zd72DD7mJmylBiwcNFPzQXvzPMBXb8qK57KzPTJlJAISprwBvosLzCAr?=
 =?us-ascii?Q?TaChGSvHvTz4USjqc9oAkGf7k8d0HM4KE0OAkNvUDiZbCLdMQyGTKlZlpREC?=
 =?us-ascii?Q?lZAVufdlSZBWt7G8ky58cDwtvLBkADM3gqlI04neiR7L1sjUbbbiZZuXGcoz?=
 =?us-ascii?Q?Phyd1Pqrr5/2WwklMKM0t4LzdGIV2tpknqfAdmo0vPxJz9iz6fdbdOMD9SYC?=
 =?us-ascii?Q?nvY81FPeH5Aw+XeOjzeYhDSynqoouewGJmpLff5d6/AuFJWXKwSRcKXC9KaX?=
 =?us-ascii?Q?MZXbSFWnAdYV+Z87zpqzWgytFMnt0nPmUVDSQT4VoauG0p1efhp9DrAM/16M?=
 =?us-ascii?Q?1vw0hcnTCCVDAS38w+SuSHw7zSy5s8RY8T/PEYSqnyiAt8rReXAQtkp1oXMx?=
 =?us-ascii?Q?oQHCbDhPHV0K9jJTxZDlrP2UxMJoApMShoHOVluEI4k8HXcDrQQlhk6UUD9c?=
 =?us-ascii?Q?5lUeXowrJXrYsECWDJ7IDkYp0zSHgp8YzDZRsEqbYIVeYCGicRzfnlPBM05K?=
 =?us-ascii?Q?LhjTe5gFDML0bgmeXj3ONScS62yfcnv2JMJKAK5e8TVNaon8Ad/tCkZyT0vS?=
 =?us-ascii?Q?todAeIXCCrq4aZvYF5i/joqDsWTHSaRW0aKTBQKnPm2gOqdfL3fCP1tWd6+p?=
 =?us-ascii?Q?btHhrCPmboP8y62CdgB2utPm3KNIqS4DJX8WSrszA0LrajXC8KJhs05ufTL+?=
 =?us-ascii?Q?63n4IYFFUzGls9g25MnFd1oGCUxLd0ieK4ILFjfVN7fQmJ4oWoOUHU3q6j4F?=
 =?us-ascii?Q?Fwv7eSAsGFw5cGMm6trD5OruGRjfpHmPrNXBFZiQtJNdoeOBsY7cMPseocWc?=
 =?us-ascii?Q?eq8F3S6aN6OP9yIRFt5XHvMKEUUKNBgo6uU4rJxa9AHEQar3hKM56Xvx6xu5?=
 =?us-ascii?Q?hg8xBIoO8SEtUt+vb+PQhvD8VKAj/gvV629A3Hot6bRxkLjLANAygCxKoIES?=
 =?us-ascii?Q?7wAmUVUVYEd6R4yrhRfp1GbRA0SZCSeVfCD49Ut1z/0AFPjh9XRl6WEl/GKq?=
 =?us-ascii?Q?TuBqounkSNgVuJchfwmjRnNE0FhzkKs+qPgcUkLobXwYYl4jxsj0NRCEgQye?=
 =?us-ascii?Q?GUeiWPL/+VYWnUmUQO1uPLbJm9ByCky6uTfc3lHeLStCmRnWUuLNaL1Z9RBA?=
 =?us-ascii?Q?NCMtlzuQXE7OwLoXYIX31fHj/hKULF0080hzbp8QtwxnGxYJ1jhXJDcHgB+P?=
 =?us-ascii?Q?fzIfPCdnJflX0KhadKVB9ZpuXj7ajvE27X1Fj7r89R1oWHq/60XPIFoVGls7?=
 =?us-ascii?Q?8wgLvMMNhI4F2exF2jCauFjQwvhvrnaxMiw8j6sny+3px6rTcVNCAKOnKdQX?=
 =?us-ascii?Q?4DSLQEQOwqusAMjTX3WAgpcpKykPnL6ZRHkQBDrNN/vMXERsxfmEwle8VLBY?=
 =?us-ascii?Q?U2MW9+uTv5guipFrX9FjA4dAonQwMdZUKbZtdFDmncD17hjzJD5xINQ/a7uT?=
 =?us-ascii?Q?VM6erv/TdhFtik8DAFfdaJC2T6xKTn2LpS8JMjBk1mSD6cVrbgW55/TU0MjD?=
 =?us-ascii?Q?ug=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6ee848-56f1-417a-48a2-08dd42151fd4
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:34:25.3813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rKKTJHugETBgOCZDY4tefbLoHCviAFNiu7YrzRsd/58ZI+e4+phg202SirGS7MC2B+QlyU9N0BxwAi4hjAeFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8529

Hi,

This series adds more functionality to the existing max96712 staging
driver allowing multiple sensors to be connected through other
compatible serializers. I tried to split the changes in smaller logical
changes to make them easier to review while not altering the existing
VPG functionality but I could squash all of them together if needed.

The series only supports tunneling mode and uses the first MIPI-CSI
port. Support for more functionality can be added later, if needed.

I sent the set as a RFC because it depends on Sakari's pending internal
pads patch which is needed if we want to have an elegant solution for
allowing the user to switch between streaming from sensors or just
video pattern generation.

Also, the set depends on my previous series which was not yet merged:
https://patchwork.linuxtv.org/project/linux-media/list/?series=14255

Thanks,
Laurentiu

Laurentiu Palcu (11):
  dt-bindings: i2c: maxim,max96712: add a couple of new properties
  staging: media: max96712: convert to using CCI register access helpers
  staging: media: max96712: change DT parsing routine
  staging: media: max96712: add link frequency V4L2 control
  staging: media: max96712: add I2C mux support
  staging: media: max96712: add support for streams
  staging: media: max96712: allow enumerating MBUS codes
  staging: media: max96712: add set_fmt routine
  staging: media: max96712: add gpiochip functionality
  staging: media: max96712: add fsync support
  staging: media: max96712: allow streaming from connected sensors

Sakari Ailus (1):
  media: mc: Add INTERNAL pad flag

 .../bindings/media/i2c/maxim,max96712.yaml    |   45 +
 .../media/mediactl/media-types.rst            |    8 +
 drivers/media/mc/mc-entity.c                  |   10 +-
 drivers/staging/media/max96712/max96712.c     | 1406 +++++++++++++++--
 include/uapi/linux/media.h                    |    1 +
 5 files changed, 1352 insertions(+), 118 deletions(-)

-- 
2.44.1


