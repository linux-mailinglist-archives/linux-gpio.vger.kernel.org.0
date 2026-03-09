Return-Path: <linux-gpio+bounces-32857-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBGfGXo0r2kPQQIAu9opvQ
	(envelope-from <linux-gpio+bounces-32857-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 21:58:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0162413C6
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 21:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD6F9310809F
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 20:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7496D368968;
	Mon,  9 Mar 2026 20:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Pf+V4l92"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011011.outbound.protection.outlook.com [40.107.130.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEDC41B378;
	Mon,  9 Mar 2026 20:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773089788; cv=fail; b=f3X0vUReOfBE/l4XFSW8T4ne4nJtG56ikuAMKuRSibM1BPWdpXjWxXy7WOCgN31X+O+puc7+j4upMUpBuvlOZu1hVkvVRGM8SdkcIdZ5iijuY6uqb6AVZzCC7sLVbMeIyJ5jQevRQ9nLFNPG3ZD/6w8UkBBDk6GkuyXPHdC21g8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773089788; c=relaxed/simple;
	bh=g5yyKa3IYXjMdI7rvknEj7BfgCvDEvVt4dhuy4IVChE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EMcr1dQkpWkLHhgd8q9WgYaefthLxX+NaUY0vT1hOOJ6nZzjQwv4izOeTbqqWvjkH5cd0uAdID2KvJnaFJOD+EMUgIHKRFCjq109IMD9EZwUxg4iTNAhazHCImq20rbIYrJSrNsHxOfYJ27Gg70VuvqL2kOezA1Ps75MhO7ji0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Pf+V4l92; arc=fail smtp.client-ip=40.107.130.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gd5yk6T2nobwIwDFz0kszq3entCzSxhEM+3Uj5vSM8LpgRqwFWwVsbZqvRvp/trRPRgMC309lCIlp2ywGU/WbEo7HWPnNBOwcSmdzCUZYbfgQX3Wira7QSUmPVE/qLb77hdS9t6Sp21W/YTQQSkNg9CL8M7lq9Acf7x5sT73G82PLHLjUlPGu/lPfXfWhxHRUFBzRXTFCYpQPMU7rqrEQEtX8JVv+twq2qPa+DWlBweigw3p1AH+XEAs144PYLgs2/h2u59Xvm+j4rOS6cxZRpymCVlSAbWbp7ZJWyny9L36Ch9Drvit/mi9QlD1TWvbPMnw5395MrfsDU7P2LLcRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5moIam4IKb4wSzM8JvecfNVmA5fUzw586N+RSwOttEA=;
 b=ccTv6QZigdr8r+i0K94V0QUFmUjz0NEGtjq9VbFhOHE8JIiygjlLG9DG2W9LQINMOAoG8Jv/HNAMN0tQUu4XObZoKs661bBzWsWfMc3+247xlywze0xJPrFbiZHzYSCVd7xeEDnZ9ndFgVspeMpBqFwnjJTVCwIRqdoMhtjwK4TllqTMwkR0C8bnVZreXlDvtyAhBnu3cUdjG/7SOp1PyBtxhmHnA6RtFa5lYeZ6AAlY/tSq/oyEeepdGsq6VfRA0vq8w0noMWQjOuPoyKdbHy8SaE2yTTXrShvF+3BnU3UUy4xrb3580fqmQhw3ThZCgbOTzCeYzHlSk5yoCp7f3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5moIam4IKb4wSzM8JvecfNVmA5fUzw586N+RSwOttEA=;
 b=Pf+V4l92kf92qZ0ljtZJmh8JmQoilZqqsiCZ6udXe/bvAy1T4uQrULSg/Nii2/ipCFo5+DdK6E9cGtfOW4+A5aWlLL6Yn9M22V+WKnl8GLcPipI1G1qDGxA0SyA2TDKd4lwijP0jwFOLKfGiS9LKpxyBkNfW3/uGoxx38QcH2CVdPx5AEpeVVMIsNr0NZt4a/WFyaLiijwH+Uj9Ciowjot83mR7xg8EW/+oKDBRQPPq82qPsb9NwcWybElMQg0Q9StgEdYn11j4l7pIzsMHc9+QT0oH71vpeBCR6lKXL27MHw3ukce3mXQOpA4Csxf5v4mmBJIwvUvjaWCUdUKDMgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DBAPR04MB7335.eurprd04.prod.outlook.com (2603:10a6:10:1b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 20:56:22 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 20:56:22 +0000
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
Subject: [PATCH v10 4/5] gpio: rpmsg: add support for NXP legacy firmware protocol
Date: Mon,  9 Mar 2026 15:55:31 -0500
Message-ID: <20260309205532.1794202-5-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309205532.1794202-1-shenwei.wang@nxp.com>
References: <20260309205532.1794202-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0144.namprd13.prod.outlook.com
 (2603:10b6:806:27::29) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DBAPR04MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 096228cd-5f92-4490-73ed-08de7e1e51c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	aSlmHSD8e3tc5Nnl62zrt7jIy1Rayee0dAw82WDe1QySXQCmfZyp/x5zo8AO/kmVJKF09+5bjpRQb+Ve7hLwD319TTOkZ8emOjYlViOC3+ZUz18f03Ub2d/vjjraDdxD74gVSSExUA6cUSRHnGzgdu7PXhZFLt/c+SUCYy695W7TPLJnlE0ft8rTYzr0gcTQDpAo9NTa3SlV8eigybEU6JbOhJx56xk7EXCq5mg3KrusDPq0KAi3a7Hw7aBJnlnfag1AeuGEUJNKzPHjaz6PPd7CATX0AVCYpdGVuOg8ujkdzlEsURj2jM0ebwDwQ61SLGpfw0AuZuheFxZvSesgqyyEHzbRatHY7bSzKJ943XMIWPabbLudy7+PPKNem8vHlHGj5UBosgcZUmrv7diWvbJXHvS8byZi1G/MqFPB2S144SYW7nUjVRfW0iWb6FUE6N/itS0Tr9mOnZNBlfbaSCuL+CojrvmVzXlONG4C3aofFH7RyTCyhS0+2gY1wvmHEjrz0/pMnbT22g/sT9ZGBogNIbo20iXlP2J43qFQzt8XPOSpU6GinZ4CNOGHcFThZOAhd2Zu5jN/QPwvdZ98Jxq6JwSGOmwQildImEgjHdeBpqP/dWnCMfS6FFoboRwMDYPtjs1IyF6O8AgknGEsGcKTzHtCXqP8O0NA9nHV1HB7JW9HgvsvkpqwxHwVdyzA9/lQl7r7YWB48qS/FebOEsx4qg+tse4eA8TGMJ1vBwqRt2tvWyE/4EJmu9bXJHuDH6fVvdYHQ/d1S8DQew+yA5Yh5X89aCm2R6eVfP6WsZJa6ZyFSKj8MwyTqyhauikl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sURNOW4XGi+G5nb+2ifcgS43KCJhnsxd2vr1YYkTzvWBiQjMWZjAfEgcTJfA?=
 =?us-ascii?Q?qRNrBphwE0nxcUWwet7sT0B34sW2oeGQNodGvQyJGtnZNsTLqhHa+YYyKLN5?=
 =?us-ascii?Q?q+njy1Rzjvv/uRGfZG3bCL7Tlb6EOOGSq9d1QzEj7Z5yajW5g2Ut+X4U093A?=
 =?us-ascii?Q?Jq4ScA5G3w6FN1bPsC39FR8rCXJrtVn7o8H/9SRXiWEDkWvVbmYcwBK7ToIr?=
 =?us-ascii?Q?+iwRwlF+bx/lXSGqbCKleT82rwo/S9bKUS//zuw9eZf0cPW2vbdz0iOZL3/l?=
 =?us-ascii?Q?PCAIZh+rK8a4MzJG5W+r4XmwEWIp8KuT+2OL8N3g+S7q/1Sbg4Po7xJKrpN0?=
 =?us-ascii?Q?IcGwp/FabCuOlKVpq8dI+X0sVGz8r4tS91CZLwvvdY/I8fnNTFPtbzPkEJKT?=
 =?us-ascii?Q?Ygl4zr8iWBp8w/087WXGXjqw4KlvTboTvggnYSbp/xZkR8hfCwVO87XcsqUR?=
 =?us-ascii?Q?ospWEliLSiJxCzoEQZ8Yp1pf5yp//FpNJ5lt4nuFYXTVEO1B8c+gzZLgvyVN?=
 =?us-ascii?Q?1JIlgifWLkNZ0q0AUqLEcIEhlul9ry2EjYWzhBsCPg8qjEWtY3byuDfAAwG/?=
 =?us-ascii?Q?FSw3umO2oe7AgAeEg6hUca/C38HdQEM5csY9CSod3W61QAFIhWMiOgxamh9u?=
 =?us-ascii?Q?G7i2M7RIUCm5WFJLZd8B92cw0nRWbpXugqf1BLL3xMDdTQ4TIYHhWG25Njfj?=
 =?us-ascii?Q?hBR2Hm7qCluX7hGtubrBTj0dK8h3/cKiZo1Oc736L0ddIe9OU1t7DCHzoIiA?=
 =?us-ascii?Q?wLlMgM7rtVcqJX2nwZBreLQ1iHO2G2pmXs52S0uUm+RP4FJb/8Adfw8moUj/?=
 =?us-ascii?Q?NFfZg6fgkLWkDCR7vRNbjqzdGgmqVzoHRwzta0y8sH+sHdH1yVMD6LKgEc2p?=
 =?us-ascii?Q?Trl7eCLKVyzQDyx4rxpd3f37RcLwgkAtm1/y7WkxutOK4EKkaS7D0lYKDfF9?=
 =?us-ascii?Q?gJh9jMt6Fm52WjcUeplRI+mD2427uH/KiXQEzc5mXNxmh0S5RmGbgbEuh5DM?=
 =?us-ascii?Q?6wp2dtiWvoEkoDAAZHFOarbZABF/oljOhg67oGwXbOCw6LHmUnn6qdDQrCAx?=
 =?us-ascii?Q?9y2d/txQ3jUC4RDsrLraSaaDS9QwTwqJKzh6Ss/xb/8k9/1aZ+SEGxX0QWFU?=
 =?us-ascii?Q?CWV1RcFDHIOes3ZBmojj2QIR23G0Z4u/IxvAsRYePXLa8RZ0LL77e4G6Xuhw?=
 =?us-ascii?Q?dE22GADTk3qK8xsYs4n36mTdicKx6wsawMPWycJV6Pc69F22vn7zN6+wS9L+?=
 =?us-ascii?Q?TGt/EPl0sSkjGpT5S5lUgl6UCi+bruWNQjIqbdp1QyjCsDKA3+/wIoW5mw3J?=
 =?us-ascii?Q?xNV2nBLYLMIQXBggw0725XeNMKAxMt0uvhJWl+7gViZzsPI3l0zd9lODF+Cz?=
 =?us-ascii?Q?z2r/Kh8MYdWiAJP6Rx3giF+2Je90usXEFmUskcuS3neTBr3cxDrb4+9R1f3V?=
 =?us-ascii?Q?ZVCnVoNtAGFwUIMgRaViIC7m4lpL/EzF5nPtmza/PN6VCTXz8dQC9qf++xdA?=
 =?us-ascii?Q?w0kBkJXzBjPfvdxgeWBKKUady9G61V02VKI+sYKEq/xvSBw7tLfxcIcXqap3?=
 =?us-ascii?Q?aWWXEMyIEfc7OTrGTL/zPZnUaIaHFEk/yP1QGQXL6LI0KunoGnZ1O+LuKuHD?=
 =?us-ascii?Q?jeNEQrWP0NnekUoQ88W8SKTBR+hkRpsmg77rCR7mCpU3fSk6oE6Tq2LuM668?=
 =?us-ascii?Q?TFYi/w1Xv05du4PKQQUcKcuJYTieALTBCgQ4O2bf2+vLOEJcCd7q42QZH4tE?=
 =?us-ascii?Q?b9Vw5dHRUA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 096228cd-5f92-4490-73ed-08de7e1e51c4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 20:56:22.0616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwAfhUiWblH37+KEZONuSPZ0KMiWefjNKIXYuwOoAvX/aE4CkoE+jfKl/E0OlibqsIx7T8wUDOpEaEkRZNzAtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7335
X-Rspamd-Queue-Id: CD0162413C6
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
	TAGGED_FROM(0.00)[bounces-32857-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,imx_msg.id:url,i.mx:url]
X-Rspamd-Action: no action

Implement fixed-up message handlers to maintain compatibility with
existing i.MX devices that rely on the NXP legacy RPMSG firmware and
its transport protocol. This ensures backward compatibility and preserves
functionality for deployed NXP systems.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/gpio/Kconfig      |  15 ++++
 drivers/gpio/gpio-rpmsg.c | 147 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 162 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index cff0fda8a283..cd0ac5bf4443 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1907,6 +1907,21 @@ config GPIO_RPMSG
 
 	  If unsure, say N.
 
+if GPIO_RPMSG
+
+config GPIO_RPMSG_NXP_LEGACY
+	bool "Support for the NXP legacy firmware"
+	depends on GPIO_RPMSG && ARCH_MXC
+	default y
+	help
+	  Enable support for the legacy NXP firmware protocol used by older
+	  i.MX products. This option provides compatibility for systems
+	  that still rely on the nxp legacy message format and allows
+	  existing deployments to continue functioning without requiring
+	  firmware changes.
+
+endif
+
 endmenu
 
 menu "SPI GPIO expanders"
diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
index 9c609b55bc14..be263c09a1f0 100644
--- a/drivers/gpio/gpio-rpmsg.c
+++ b/drivers/gpio/gpio-rpmsg.c
@@ -84,6 +84,147 @@ struct rpdev_drvdata {
 	void *channel_devices[MAX_PORT_PER_CHANNEL];
 };
 
+#ifdef CONFIG_GPIO_RPMSG_NXP_LEGACY
+/* NXP I.MX Legacy GPIO RPMSG protocol */
+#define IMX_RPMSG_CONFIG_INPUT		0
+#define IMX_RPMSG_CONFIG_OUTPUT		1
+#define IMX_RPMSG_GET_LEVEL		2
+#define IMX_RPMSG_GET_DIRECTION		3
+#define IMX_RPMSG_CMD_UNKNOWN		0x7F
+
+#define IMX_RPMSG_TRI_LOW_LEVEL		4
+#define IMX_RPMSG_TRI_HIGH_LEVEL	5
+
+#define IMX_RPMSG_ID		5
+#define IMX_RPMSG_VENDOR	1
+#define IMX_RPMSG_VERSION	0
+
+struct rpmsg_gpio_nxp_packet {
+	u8 id;		/* Message ID Code */
+	u8 vendor;	/* Vendor ID number */
+	u8 version;	/* Protocol version number */
+	u8 type;	/* Message type */
+	u8 cmd;		/* Command code */
+	u8 reserved[5];
+	u8 line;
+	u8 port_idx;
+	u8 val1;
+	u8 val2;
+};
+
+static struct rpmsg_gpio_packet *
+rpmsg_gpio_imx_recv_fixed_up(struct rpmsg_device *rpdev, void *data)
+{
+	struct rpmsg_gpio_nxp_packet *imx_msg = data;
+	struct rpmsg_gpio_packet *msg;
+	struct rpdev_drvdata *drvdata;
+
+	if (!imx_msg)
+		return NULL;
+
+	drvdata = dev_get_drvdata(&rpdev->dev);
+	if (!drvdata->recv_pkt)
+		drvdata->recv_pkt = devm_kzalloc(&rpdev->dev, sizeof(*msg), GFP_ATOMIC);
+
+	if (!drvdata->recv_pkt)
+		return NULL;
+
+	msg = drvdata->recv_pkt;
+
+	msg->type = imx_msg->type;
+	msg->cmd = imx_msg->cmd;
+	msg->port_idx = imx_msg->port_idx;
+	msg->line = imx_msg->line;
+	msg->val1 = imx_msg->val1;
+	msg->val2 = imx_msg->val2;
+
+	switch (imx_msg->cmd) {
+	case IMX_RPMSG_GET_LEVEL:
+		msg->cmd = VIRTIO_GPIO_MSG_GET_VALUE;
+		break;
+
+	case IMX_RPMSG_GET_DIRECTION:
+		msg->cmd = VIRTIO_GPIO_MSG_GET_DIRECTION;
+		break;
+
+	case IMX_RPMSG_CONFIG_OUTPUT:
+		msg->cmd = VIRTIO_GPIO_MSG_SET_DIRECTION;
+		msg->val2 = VIRTIO_GPIO_DIRECTION_OUT;
+		break;
+
+	case IMX_RPMSG_CONFIG_INPUT:
+		msg->cmd = VIRTIO_GPIO_MSG_SET_DIRECTION;
+		msg->val2 = VIRTIO_GPIO_DIRECTION_IN;
+		break;
+
+	default:
+		break;
+	}
+
+	return msg;
+}
+
+static const int imx_std_cmd_map[] = {
+	IMX_RPMSG_CMD_UNKNOWN,
+	IMX_RPMSG_CMD_UNKNOWN,		/* VIRTIO_GPIO_MSG_GET_NAMES */
+	IMX_RPMSG_GET_DIRECTION,	/* VIRTIO_GPIO_MSG_GET_DIRECTION */
+	IMX_RPMSG_CONFIG_INPUT,		/* VIRTIO_GPIO_MSG_SET_DIRECTION */
+	IMX_RPMSG_GET_LEVEL,		/* VIRTIO_GPIO_MSG_GET_VALUE */
+	IMX_RPMSG_CONFIG_OUTPUT,	/* VIRTIO_GPIO_MSG_SET_VALUE */
+	IMX_RPMSG_CONFIG_INPUT		/* VIRTIO_GPIO_MSG_IRQ_TYPE */
+};
+
+static int rpmsg_gpio_imx_send_fixed_up(struct rpmsg_gpio_info *info,
+					struct rpmsg_gpio_packet *msg)
+{
+	struct rpmsg_gpio_nxp_packet imx_msg;
+
+	if (msg->cmd >= ARRAY_SIZE(imx_std_cmd_map))
+		return -EINVAL;
+
+	imx_msg.id = IMX_RPMSG_ID;
+	imx_msg.vendor = IMX_RPMSG_VENDOR;
+	imx_msg.version = IMX_RPMSG_VERSION;
+	imx_msg.type = msg->type;
+	imx_msg.cmd = imx_std_cmd_map[msg->cmd];
+	imx_msg.port_idx = msg->port_idx;
+	imx_msg.line = msg->line;
+	imx_msg.val1 = msg->val1;
+	imx_msg.val2 = msg->val2;
+
+	switch (msg->cmd) {
+	case VIRTIO_GPIO_MSG_IRQ_TYPE:
+		switch (msg->val1) {
+		case VIRTIO_GPIO_IRQ_TYPE_LEVEL_HIGH:
+			imx_msg.val1 = IMX_RPMSG_TRI_HIGH_LEVEL;
+			break;
+		case VIRTIO_GPIO_IRQ_TYPE_LEVEL_LOW:
+			imx_msg.val1 = IMX_RPMSG_TRI_LOW_LEVEL;
+			break;
+		default:
+			break;
+		}
+		break;
+
+	case VIRTIO_GPIO_MSG_SET_DIRECTION:
+		imx_msg.val1 = 0;
+		if (msg->val1 == VIRTIO_GPIO_DIRECTION_OUT)
+			imx_msg.cmd = IMX_RPMSG_CONFIG_OUTPUT;
+		break;
+
+	default:
+		break;
+	}
+
+	return rpmsg_send(info->rpdev->ept, &imx_msg, sizeof(imx_msg));
+}
+
+static const struct rpmsg_gpio_fixed_up imx_fixed_up_data = {
+	.recv_fixed_up = rpmsg_gpio_imx_recv_fixed_up,
+	.send_fixed_up = rpmsg_gpio_imx_send_fixed_up,
+};
+#endif
+
 static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port,
 				   struct rpmsg_gpio_packet *msg,
 				   bool sync)
@@ -576,6 +717,12 @@ static const struct of_device_id rpmsg_gpio_dt_ids[] = {
 
 static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
 	{ .name = "rpmsg-io" },
+#ifdef CONFIG_GPIO_RPMSG_NXP_LEGACY
+	{
+		.name = "rpmsg-io-channel",
+		.driver_data = (kernel_ulong_t)&imx_fixed_up_data
+	},
+#endif
 	{ },
 };
 MODULE_DEVICE_TABLE(rpmsg, rpmsg_gpio_channel_id_table);
-- 
2.43.0


