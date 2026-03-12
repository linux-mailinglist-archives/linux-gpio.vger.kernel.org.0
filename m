Return-Path: <linux-gpio+bounces-33292-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wB9vC3UWs2mDSAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33292-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 20:39:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BCF278327
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 20:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5352C3014881
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C383AB291;
	Thu, 12 Mar 2026 19:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bA1IBAGo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010005.outbound.protection.outlook.com [52.101.84.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959AA3AD506;
	Thu, 12 Mar 2026 19:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343834; cv=fail; b=ftWH0HBQ9lQOPkFBOuDSDlTiftTrJdkFRYYqyUYIB08pPYwPfXrGNYZVDIBE44/WHvivFgAf2/AlHMi/qKEQO9qSCB9PUDIlkfPg4A/zDSuu4HTkK0TEvHM1RSdvQJ3sZdESyl6+NAbrjKg+Dt8d/cf4a/cdOjGXp8WrWJjVx4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343834; c=relaxed/simple;
	bh=RH92b51tVl4lPvgsN3xwDPDSSuBcTAj1TYWf+w9L2RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sdv52AP4W+xuctJGeNtNbBGAvWiL6GAGZblaorieYRlvBzP+5ItaZuYlAD5T+eIfitzScFZ4uov+XQatkOSMZ1J89pEyfuo11pvLq2YevKA2ZdttPvQoQEuXmoOA+E3ed2yAHZtNLDqz85Xwy2ZrUYaip2/KqAi7xVdyAeijBlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bA1IBAGo; arc=fail smtp.client-ip=52.101.84.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYSLkfNDdkTxCQTxfz8I3YsSuVe+D1hqLWCis9MeQk+mY8cJf7qL0AUNYVX4TuTvBrrOPj6X5DMKvspSWd0jASmXVoL6ZiSV1KmnV314BT7ke5OS3vi5FR3PszFEEHDPCpLuYlQFtzm/VvIuCQGId2vJLpvWlgXRabTeqeDX3B02oRyndAJ1GQuWzElAIsj7j/2wfN92gYiFoCBXxhBMus7Qbec3pZSXv2W1DlVQCYkbS8bUu5u9gqblvZ9lfCC9XjVqnK6+kPqS3EodYHV1ANSWIsIsyBcr91e+3LBh56N91RY/JjuVovVvAKK04LWZJpJGIFaeowSQXKlKTbs88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R084z8XPuAWJHOHm6em2+5vpPlDRGRO9uYzE1KcrnqA=;
 b=af0vQf669gSj+r3o4Ye4XU7/N8l3AtPyiE5Do1mp3LhHjXdXix5yLab1yq21CEpKx3XQqoBJ5Qo31FPZqRbV5gbiqwO6J/734/A93z9Jt1OHPZkXxSp6afGHAdZHMsJ7OPhRiawIhkU16ACXhDtuCyFwBsHQZ3O0/klgQ79aK5fAOfKwtgA14g2yGNdRNQYNU3azuNjiQKJ4Mxa4RjiocG60EXCc5mAbW5DfmeHP+O2Klqw6IKVdCrkbV9Yh5M+mu43Y2yvdqs2QP8Ad+JnK8Tlc/MFGjTPaKdKrm4s1WIeHw4cPyHclTg1FSTV4pFDZqjVFGDF5H+vrm+GXkbtQkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R084z8XPuAWJHOHm6em2+5vpPlDRGRO9uYzE1KcrnqA=;
 b=bA1IBAGoq64tpqNyQlt8gXAaEdtL6bhyBmuxfm3F5xTpcBWpZFEKg0t1RbbG/0s1Z9gjnGkgpsKljA5ZQFzMiKfmNd1whmUT4uEhaWHstL2zZ6j8MlnoqfPrz/AHPYbsV6Qs7vSCP+E6CkF8j3bmufTKRJg7kcgmSEDN/moXrWB7YGE6Twm32ej2c6H3ZIbLM2xMnx6kjTEGD/5LVNNU6W+sp+YxCJQ7YafEaNeDIfhxxNja7c3RajWEIjjGs+uxTufygDSWiPesiucG33kDCsRODlRj7DvHdF+5Xd2f3ALeJd9jLv21lHcUbmfWV4jJoYUUAhlGjnaIGq9ToAU8Pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PR3PR04MB7468.eurprd04.prod.outlook.com (2603:10a6:102:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 19:30:23 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 19:30:27 +0000
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
Subject: [PATCH v11 1/5] docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
Date: Thu, 12 Mar 2026 14:29:53 -0500
Message-ID: <20260312192957.1978329-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312192957.1978329-1-shenwei.wang@nxp.com>
References: <20260312192957.1978329-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0048.namprd11.prod.outlook.com
 (2603:10b6:806:d0::23) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PR3PR04MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: f5392a74-b24b-4ff8-2b61-08de806dd09b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|921020|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pbwTeToqKJ3lp5GXzcx3jElS8E9rY9nz5yzfsiwtlzr7GU7sDUxyw2AK+nrLMEeT7AvZfW290qM1UF9Waq2kJKGNMQZixlFnIUNqx4l5HRvy583F7kB0I+KsHmjeicc7FPQcaHVYMKgQeq9cxDPlwS1/BVYiyoixqFIVnjy5r2TMB0+5VZutDKxk9xmjipjCqifse/YUzC9lLgd6VEY20qw600GEKwZ5sNOWo+JyMnuZynPdzlbNM7t+H0Gta9SXJsA3Xv7YXNSzMA8GPSwRiwI5wq41OmhGQKqxmWKDMT1OYwBYkrtrfHAI/w5n1Kb1x9vNkIp5BiQpU6YoZdTLYVuqD0OnABq4TSWTzNr39I6QLfrF1DCiC9JKF9sw0r+8er4ZTSdY/mK+k9fh8YFSSdpuNEoRhbNE6xvQs7FEKbK86i9ec6B4HsMxyVtL0axxa9CpGtC9nV+1uI4uEZJWLn+ZFYp7v8hE+zEXKiHwqxGfs5ZFiFw27yVNfgC/uRp0EfIqVzZRQJoNJecvwW8iSgkCGFDelDMb/XWPDNlHsU7eg2CSTiFm1FlNy7nXd2P5vD7gs04JBJWc4algQa41pA7CQ19PcDBhkrUJ2w2+YK+xjIx7X+2s5tD0oUC+9usVEnU/EeS8TqF0hNuKNVHjHN8wTX58wkF82xnOkyKYnIWu8R5aHTLv0jL8aO6oKvt3CTApHN7LdaLn5S0gV6j5PbxNNQDeOKYUeAZOthMTufhwDhbABqFK0HOtxpQcNBV+jJsfqeAmLGlOEm03YVmyLjJAxCIxGb+pq3UcpWIRGGun4SKnXr8aX0AFQ2jXtHtg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(921020)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0r5simX2M/uaH/t/XTGRPgn9IcaD07zVQD98pZvzL9kgRkUw8EXzt2i9SxxK?=
 =?us-ascii?Q?PxKZJqpRZp6eZ3+1QCgYmgdkS/+iU2Kx5wUsxCXNdaWUWvV+Ak+IbuNvR9sd?=
 =?us-ascii?Q?eUIV6dl9LD+XKFo5G6lJS3y2K3gme7NK0wfNe1PYyDbNGjw4zXUlGbljCGV/?=
 =?us-ascii?Q?Ey5ATdyVb6TAUek/+TpTX4X/K99tRfcTChUaQMyI9uo0eMaaIKwJ2qk6WI2n?=
 =?us-ascii?Q?pPXXC475/C8uejyWhDdytp3EJ/5pH06H0tjfgEH1e16Het2nDR48EN7msTH/?=
 =?us-ascii?Q?5ABku37W23vTy8aOZ7g58TpcQzTikHQ6LLF67fNAj/z8onAAavXCS6L0HCIW?=
 =?us-ascii?Q?WD1Y4fZ3oyAfrfFaBFrrMdPcY9rJUFYnniUmqF/WrarkPWQvj1SQN7seaPH2?=
 =?us-ascii?Q?qdcLkT/2zYPP3iOKnMgHX7emPQQ4HjryOK/vMAtpNrIrH1XDleIkMmmBa2sS?=
 =?us-ascii?Q?kH4iVwdo2pl+2FiyxUY0udHDc+P8hHJ+66o7O/S9ozphJMzRU8aE3Jdco2/l?=
 =?us-ascii?Q?iK1YB30G+999PQSP6jMUO76W9f59E4uJ2damGhpCZX6O5sEN8JsujhUf26k6?=
 =?us-ascii?Q?Gmv0jq7o11fxUKS2s7DUsyXuGZHnRJrGl1s84FiaCP1/fK3iopjENYUOky21?=
 =?us-ascii?Q?1nq9OCIS6EC/Nw0eCKRbyh0HP4qxE3ovJv7kqXLlvDDOM2j8Tx2+89ZFP79d?=
 =?us-ascii?Q?42xGdDjaj7mWfwgukVlv8Fehd2exxNdtNgz9fxhzXnmKviCQxyooxkVA+NeE?=
 =?us-ascii?Q?8i4JDRuSW0VLPOkPbjfNjVsRWt/65P2kYiSvU4U5ztfsc9QWAWXO2/uz1xqW?=
 =?us-ascii?Q?bDSnApd0zOuFQNTMjZVOa6QrxajOgUcQSYY1shfcmC8VqGCFouvlHTx1sD47?=
 =?us-ascii?Q?0oesgW8tEcvbCaJUDiPEm0rX//3QtkmTIO93j3VUlT68NucisbOMegTbf9mx?=
 =?us-ascii?Q?s5iTyqp2lKyaV7mrxlU2CwuJ7JkU8GcyZCHcxFu2YNYvRcZzi8ekZlsQ5tvc?=
 =?us-ascii?Q?gtIjlHF4dtyAHoQBTn6mJIAPQrSB8TeNWuwyFctFN8bVxblb7QnHpufa6g5b?=
 =?us-ascii?Q?zu0QFlVTt/v1+LC5HtTF70I2ufLE5qfKKVLjEOuwdqfjLHkcz5I7l76QlyMQ?=
 =?us-ascii?Q?IroX4brMgG0OU9QmATEh62b8tJA3x6cQ8t/kspcs0baji4xszTdN5KqGGAfQ?=
 =?us-ascii?Q?aoRPLTPGCXAeruuPw05mg76ERuXq+XWX7kjzV/hg1S84ugEmVi+KBSRs1vUd?=
 =?us-ascii?Q?n59JZt2dPahSjkP/B/N7D8n17+A+lxhMnVYblbnH6IL8qvVTJSVCq0XoKplx?=
 =?us-ascii?Q?gwbxnu4um7HjMguFPD+vfrrpunju0sJolgGHiys+JtrDAiOjjYw6lkDxSmYH?=
 =?us-ascii?Q?XTN3aXGL8E40pQEIz4NZMr3+O1ql546FCEGuXRf4v34u+W8F7xKCQtwaRpl7?=
 =?us-ascii?Q?s2OKVGeduD7FswkKdYzbapLK54CzjBHR7324YEoK+ZJlU6y0olxVoJebV5XE?=
 =?us-ascii?Q?mzONBGckUHi4KtvbEe/lZ4lhy3wWm5xYjV2CSoD6ClVpHLMe4bhrjmil0Tiv?=
 =?us-ascii?Q?D26vH8mtQef/TsKcTJ4zLPSkJ26rQrYXJ5iHX3l8sMGd61kjkvt1NfFTmArR?=
 =?us-ascii?Q?55bZz8ZKoUNAilgSKt3mtIfroqSPQ8eJAxPGfMf76Z3EFxzVtKhABy8w0wAa?=
 =?us-ascii?Q?a3f98oobvQwmRrmxI6C0/oUUZyKIsZdh+Xj6Uhwuey8X5aAv8CEihotdximR?=
 =?us-ascii?Q?SdWzdHkWSA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5392a74-b24b-4ff8-2b61-08de806dd09b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 19:30:27.4759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMWhYB7AXzCggjY3q757OKpXF845ihjW61zde9qfvoHMPg4okd/aoS/ryB1/JvnJFHddi2MTUFo//tpcp6NBDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7468
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33292-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 68BCF278327
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 000000000000..b2daa387143d
--- /dev/null
+++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
@@ -0,0 +1,266 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+GPIO RPMSG (Remote Processor Messaging) Protocol
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
+- **port**: The GPIO port (bank) index.
+
+- **line**: The GPIO line (pin) index of the port.
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
+- **port**: The GPIO port (bank) index.
+
+- **line**: The GPIO line (pin) index of the port.
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
+- **port**: The GPIO port (bank) index.
+
+- **line**: The GPIO line (pin) index of the port.
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


