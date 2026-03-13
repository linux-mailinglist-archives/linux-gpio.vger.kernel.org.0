Return-Path: <linux-gpio+bounces-33396-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CsKJ6FstGmWnwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33396-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 20:59:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FF72897F7
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 20:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB5AC31501B0
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 19:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2260237EFFD;
	Fri, 13 Mar 2026 19:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Rg+lUy86"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010048.outbound.protection.outlook.com [52.101.69.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048F53E0C4C;
	Fri, 13 Mar 2026 19:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773431920; cv=fail; b=csI2QU1M5syIP5oLvDJbnpqNZkz9i9Xf8iV+eO5KaAAi2AzlKEjO7g1TP9PiKeJkEy9sxp8g58tcOMNpOqoygYlGNAjOrK2WHiXQj+soir+pL7fqkTT71BCWIIYHt1hvL/3bjVWckp0b7NJfqBYI5IcCtZgWvMJuyWjQ1Oqm690=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773431920; c=relaxed/simple;
	bh=Sq6M/k0DD9yIAkOdFeotr8JNq5GxkDqXAKkY8xcFaCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Juc7hMa97iD17yh3IARrdrO6YNPohdq+JVxYrURDoxYYDm6879GyJVkCh0QcTILrpSSC32GNAyfKRrOsuZGDxe/NOt4S9bxEDnK53hb/23mrx8ky7wrSUbwcuwHD4SFQmybrDT6QOZd/7HDDMEbyX2XY17tfHl5xUQ5b0GD18lE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Rg+lUy86; arc=fail smtp.client-ip=52.101.69.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGugxkQyr+HjKTA9p7J53u8sla0oRRZYc3PPksqay4jiM2YZESLmyv6FOKdKNUiWJD/VNzJzx1vNEwbj+3VPnDOc5ih4utSUrWCXRdmE2EPl6lZiZSnXc9nyPoJJP5e60pksEVG8uFVZG5j2H7KoXMW1y7yEJCMRGR8p0iL4R26F7px9uD3KPzt5238J8p1c1Uyf82XVB8XqBIQo8S0k41tBLpCYIShK1b8iCEyPZmWnWPwjm4YTcPoYXWVpMtAOwm3AvS/fuyeyZ9oTCk6qIJI2z/ZSaZVws5VjPzM+QJJA5tfSwe8b3mUOMxcdPInHUIWPXMsZB2WlyXl+2R858Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKHDLdvg1YJf9UnmktdQnTqEYCINMhF05ST4Y7Kk+6Q=;
 b=M+nCYAo8D/7sKh4F8FVAt5Qwub7DG/BsJcmzhpQG5DVB7h4rP9CuOlOBuQC6y3HMe+3UrOEx0g0uALaoBftFLNvOhqlI7H6Wd2TQ6O3yfQitnvWBGJuqZz3a3vOxFl4k0kqx6NYa1aCoohHHY1dGKpys2Gb/kgYvdcMPWgmtgKdVdGmn0iz08G5tN07sqv0X8D/pgcz1K2grtBxOvT5btSQy7ou6kDXFFqbbFlMR4s127BtqUvvE9IH/kb25b82Sdi/1Sr+2aA8hDGBsO+jaLhCKcr++Abuw8z2idRc0Ch1ASNIMDD7AyhNyk85b7tBKoA2cJ0Uy5yaMIFUxbu1WbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKHDLdvg1YJf9UnmktdQnTqEYCINMhF05ST4Y7Kk+6Q=;
 b=Rg+lUy86i9rcUyXncV1EkrhizoZjYZqXzbNN6CIJDXxonPF4SExSAG6oPem8+DA9jz36u5bb4PiEXZ0NWeIe2eSyxeGiTCbYljB/V3kYx1YUm5EE27qOPFaQnOWBTbjzCVMZ2ZQruqdMC+OYZ/6NiM5oUEOK0oZ0RnMu3Pgwa8QYkXmuGPwnzVuCVO9XZAZo4CtrvQXEoo6t4LPAWB2AArA8wo2cMgNNbsa4i4BcD9fS1mKHE67T0f7IYC5aL6Q0kV/bD2tcv0x3kjUFb2wWQ1hsPtVI0PV5xnzcATuhk7d0646FXooOjb73eGrSmvUSh173QmiljlKeRQxVD3OcHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS8PR04MB8755.eurprd04.prod.outlook.com (2603:10a6:20b:42e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 19:58:34 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9700.013; Fri, 13 Mar 2026
 19:58:32 +0000
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
Subject: [PATCH v12 1/5] docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
Date: Fri, 13 Mar 2026 14:57:57 -0500
Message-ID: <20260313195801.2043306-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313195801.2043306-1-shenwei.wang@nxp.com>
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P223CA0021.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::16) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AS8PR04MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf77ffb-a08d-4e27-0796-08de813ae741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|18002099003|22082099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	eVyzSCz7LwW1h3bOy0TO9LYCCUo7qrKlRjqZGVfjYqwXwV2cJgasdBxrMBIw7g/1pR2k+HRsLYn/fsE5Yre/UanKvFQ+55o4dZzJnuvTh0uaDP91Mrm2MyYWzQEWo6iBwvahW10wXvk+EbvsPciVtM674w9ZL9dOmnpDZY7CKMhAHPgVK//5nZ291kHOg0RyNQ6gFnbIFzQdxBVM7c6SbF3CL6VLuvfmXmKsNMgU6LFaHhsOThf4DVLwJ4ivDHLgzlkJSJHPKFXo6f8tP7R/rYkkuLPhTnJh9vveNlv4idehKkCqcAbG3yiuU7NrHso51bh18/EOdevEzXCFuavTVC8B+PqJvy/piV5m9A1htV+F4DjrhGDO9APAD5PcrZYlmkDccvTM1tbINe5eOO8AIDqKy/UdHD8avUz/FVml6rZfWW0I3WSn4SAz/CSn/rTde6r2RbKQyfqViQdIFbYOm2+adIrq3lFqXska1LbSfpeYFgMU4/0GEcZIenWyLU7kP20AVrDSeKYpa3J56NTdvplJHbdKKcu2ens2T13ZIqu95RMeZPjpHON6I9RaV4fbbiYE/REPUc9vv92HXrUL0VHDHMcc9Gr2lrvkh6erzpAiIiixB2R6RH621Twafe6lMKB0tcVMu0m/BVw4Gx1//DHKFhm8HATS6AlQXVkFAzY50/rDEco9ufVhIBTm9UxVSDLmrLls30tTrg2dBkDjLE7zJESy+3z1S2mheTgspcaoIiAQGj9hd8Vj2fPvoEhxqdlI9vPSXZ1i7iMA5Rti0Bu7ELDkI+7dKkh0rm2i4N32HqiMSZtIbOXqt8RcNawe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wWvrNj4hrLAIIs70ro3JRuSNy1gMTCmWJr5ZNlXzjO5ijHd6DXzWSMC33sJy?=
 =?us-ascii?Q?22CDN+/52m2jJppOos4qvH/McHa+ER1uMzhyOqPz6BFQ7ncHmBV4+OfNz0Eh?=
 =?us-ascii?Q?kidqRQIOEXeQoG7HeJoGmOQZelIIqO259w5mcJcqAtvUs8FVlGAcbZDrQSlu?=
 =?us-ascii?Q?LnC5+QQFpwiyAOcEUt/nkdGxNwyv16EvIKohamsAq2UCY4nqOHKEWLPzQaN5?=
 =?us-ascii?Q?78AqrLhCrusH6nbqK2EvheidEtpJPFsCp2lGvy4cCy7nOsvyddb8dEyTKUOH?=
 =?us-ascii?Q?yDSV1AEEdNasAV3kkxVzXnbYzCoAbkCXAL7WqcfrecDjJVX9sii5Ot2GvoXM?=
 =?us-ascii?Q?nyzgwgRiw4zXp773Xx7k8RCqX9A2E+oR30PnojIIsGQhotaSSHrkHPUvVni2?=
 =?us-ascii?Q?WERmGGif4gHmZVQMAYtYMybErcn+GZ1msbKhopzInZOCPNwgDQPBiI9deWwC?=
 =?us-ascii?Q?Mi1wE/XywcdjCc0Ct8VN5KnBx4KZlMEQLzhRPjrZF3hUoeRmEPDUR9IgdLSf?=
 =?us-ascii?Q?2rq8wYUynmw4KOeSzQoehH5ydKVmxwNEdELdM+FZ02kqOlsVE2kxrt3wX5uK?=
 =?us-ascii?Q?8jmVHLHTa4qoAh5G11XzJpsVtbxq/1tO56fJCb4GMmgcgJIjnP2raqNAILwv?=
 =?us-ascii?Q?r0M5OkJTG3eHSg5O56uFSJFsit1xugkgkJwSdV7shUeU3TeWM74KVdZ7CVsj?=
 =?us-ascii?Q?jRx5MWJe5yJDctE285ATTda2nyNCkv3HPta7FVYnxkEUrdsB59bpHWQJ2GWe?=
 =?us-ascii?Q?/NK4scausDo/YMbZzXE3jTQLZEuyjBN/xA+yYG9XTMivn7HUnD6J5IlmTkir?=
 =?us-ascii?Q?9gQGSSH2le/WUk8UMioUZVSGNgH9bOOH74x6YRTnp1NudpIOgJQHyfY7Qhbl?=
 =?us-ascii?Q?EQ+Enwg/lzdfOxlQynoasxvGlKDWaLA/o50uVYbzII0o2SPbdeNOtsOjB+h8?=
 =?us-ascii?Q?s0rqKo3m3zZtPzP2/CsP2VD3PFgzBhNPahRIKf22WrGV1hpeU1irRhWqkGNh?=
 =?us-ascii?Q?o5p3uHaoNw7REzQDl8KbF6i2fB9qdvGql0+SB7yzGN7wQ3uLFTkbnzahB4pu?=
 =?us-ascii?Q?TwM3sjhMA/iIlPtewbLD+yPCXAg57xvcaPASk8yRgKRqByvE7jhAh4YqQgNK?=
 =?us-ascii?Q?19bkrjeZ8usCflakxg68KBTuFdyD/Cw1UHSfmhz1BIs9cjVsch4cu+cRoirh?=
 =?us-ascii?Q?u5WzYbNb2I3/XZAMvYEsyJbJWFf3Gg3ofvrzDdsCuQVEaLFXsv27m0H2kMpb?=
 =?us-ascii?Q?PCSH43N5jP+wMuVm0O5L4heYfJqHdZ1bDqHmrBBFojQfae0A0SUd0rv2FWv+?=
 =?us-ascii?Q?C8jJRZc35yRup8PL4VG+IAhesOht8K6mjScoAlnSTe01zrnRCTvXHnrlKRHD?=
 =?us-ascii?Q?chjFUwN61d45vKNuMFJ0QT67+2vaPLTObGoOHfK8vk3NeWmqaChgDOcscUmv?=
 =?us-ascii?Q?g+s3ddtFqlxAUWa/iktI2GUC0V+ATAMgiVrkn8uHuF9I0L6r5TaUtsW6QGGa?=
 =?us-ascii?Q?hKelUJ5SE25ezYXRIxPEXGGG1QVW3XHfXuoY98LBur4nCR8EOP/S7Emj658D?=
 =?us-ascii?Q?Y+/T5WHKHJlbyz5p4YWPvx1N9Ik28KsjxrVHXnxSlRMmmJS4msh9mHBqhRj4?=
 =?us-ascii?Q?o73P/gDuIUyOgo2CYQjeZiP4z+y04nQpew2R1cjPjSpsGJ4x47bQ6kSrXzzc?=
 =?us-ascii?Q?LvLYhMpJdcEun69mK79v9h0qJEwSLCXEyfH0LgWH97mLkZeO/Go+TLZ1AqHt?=
 =?us-ascii?Q?uepIV7BAcA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf77ffb-a08d-4e27-0796-08de813ae741
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 19:58:32.2452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFovGU5OktiDT7HFXxEwYfuG5jYEDTQJcVCGM+GIEedXjkpVmxvTE5dExYNN+8wveq6Nlx6bprZ5GCZTqZsrHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8755
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33396-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: F3FF72897F7
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
index 000000000000..abfde68c9b0a
--- /dev/null
+++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
@@ -0,0 +1,266 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+GPIO RPMSG (Remote Processor Messaging) Protocol
+================================================
+
+The GPIO RPMSG transport protocol is used for communication and interaction
+with GPIO controllers on remote processors via the RPMSG bus.
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


