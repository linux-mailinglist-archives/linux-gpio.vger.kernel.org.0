Return-Path: <linux-gpio+bounces-32514-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEBLGVOiqGnKwAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32514-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 22:21:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E33BF207E85
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 22:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7340430E7851
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 21:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C325238656A;
	Wed,  4 Mar 2026 21:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="X9DkTcAL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013038.outbound.protection.outlook.com [40.107.159.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF3B35F602;
	Wed,  4 Mar 2026 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772659152; cv=fail; b=bwopxkZGgr/urFvVE9cokmfPqkahGN4buI+oSkGyU9LimjcSGKld0dsYDIOOamdwr7emlFWRgguTypo4/qmkW6S2IKW9LnNiRSu99AYvOjmxac7WcHjaFo68atTNnDfiskY2AOQ8V8/FMr/BITIQa71t9/cx4mqhL/rxc0IRO2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772659152; c=relaxed/simple;
	bh=4c1PR6W1yG6hkvKEfSsgAw1tMrLLUMH9K9h1Ql4heCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aKOntifMcvZN6bkZZTTTrmeyGyvbeo+YyoC67lO9qqf9LTDwt3zZGcg+rhgZTPuRO7abdz/iJchSEardcRKPUM2RVk7cOEyvC7kOetATMmZ2uw6+g24gRWu5oku9lVJyUGFDZDHOoxwaFfawLhBj1xl1rWI5bqzLsWk7ZWJrOOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=X9DkTcAL; arc=fail smtp.client-ip=40.107.159.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvJ5Z4OYolbeNZDX/UulsAPWOOhNa5zlgACU58qNVcqusQALMvS5KinmBYpwSOaZlkbZ7tvhLPJjrJjxyJT8wjnjcBZl0knb7XEoSkOEeD++flFXJQQJKfPJNktmhcSDpAvQJp1Cm15XJeqHScvcqssmlYfZY3Cqb2N5FH+7AeWLmQ/qfWuF2ngStwe7MWVQPVe+vBk6JMHiDGPBftia6HUFeiuDmBL8QIO38wCJYW9Ag3wEgu0fc5QppkayLGntckaUsjwRzKpZoaSDxKVWmQfkH9Ex1CeQfGr46Kvo4o6Jkyr3ZrUYmmtEsJwLWF/YC/5mDuovXVbCOdKF/znUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRo7Npmcifu990vtgJEdSnvgOX1qNx1gRYgz9chAqa8=;
 b=PWGD8IfteLqXOzuCTteXQT9B1ospAd6Cp/f8JfYjo+ySFpdrgIta9dZ5zfk2PbnIPWia+By3jAGtsySSPPaL0lpIKItQMassiPGT6djuPgWRqMLPfNi6gCbvi2ZAV1VslOPwvNC8dk5RwUjtGXm67658s+2eC0XkKTpUHohnnVsoU7q3UoaeB+CPLvHQCJ5HBFrsjX9xEUJ3nJ71rTIDr0bya/pzDnF31Yi+GQMpc311j52/JZMQcGfpQrb/jJeVlJe6GuoQ6ck81Hd6IzExrdJFjaCQkWjJmqJgaLF0dGB3GLxzsK2L73n6v3TZvliMwHS/5Tf6+lRDLcDNGnYv0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRo7Npmcifu990vtgJEdSnvgOX1qNx1gRYgz9chAqa8=;
 b=X9DkTcALCLoAXG0Eugf/s5qwsmAqPcySZ/KSSd3vqmddjVqMv23ZShLBK672ucAC2fo3xoEXeNfqXhYPaacebf35atzfbEWNbq5bIvUq+jO3yTtFERxG/3ciyD0MJHyRdP7g5fWHAgygpEQIeY8ZPpirTveBp+CCBTlQCUhO673Mh4IpbXibbcPh81EhbzZIU6163MjhYi4oZWPNGnqbXu4Uzb+Cjy/X9iGluoe9L+0sKK6zoTtL3f0fxX7sWFpH9fPcULvmZXeCpPCAX7B83Ck6zQEGgmNsxUsbvuzU6R5L820cSIJ5P1tXODXv96kA3EOIBhBakQkk8UOLET8mJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAXPR04MB8206.eurprd04.prod.outlook.com (2603:10a6:102:1cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 21:19:07 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 21:19:06 +0000
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
Subject: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy firmware protocol
Date: Wed,  4 Mar 2026 15:18:07 -0600
Message-ID: <20260304211808.1437846-5-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304211808.1437846-1-shenwei.wang@nxp.com>
References: <20260304211808.1437846-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR04CA0090.namprd04.prod.outlook.com
 (2603:10b6:805:f2::31) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PAXPR04MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 6743b80f-e223-4bd4-0286-08de7a33aafd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	FF3fVj1J68y64FJNfZLZqFqtjpQ+p7kWI19Fo5lTLFmSCWGLG0/gpbSvFZDe4Xw85MvNs0QgCpYyA+0WwVrJZInUUdEKXHqyLWPaIoC5Tad/WbwsFn2Vefn+qOvd3QDTghNsRFNwBYdkbskX91eqPgoL1M3FNNoeIzT9DJiTCl7sU+cqxOrLMt+PnwLplilb8dT+sHGBSd+gUUmBj4p/8N9SSeC886FPLu9KzIIbe30MvN2W7tjIuasuHeVDIubDu7j93obkBrnjevVETDK2QkNaB4KVlRvOrMUcWso5SG2zD0OFzAIWzH9wtIpB/+FZISgOKE8Wq8QJqHko3s8e5OgbzUnJVIHJBc4IeegZXFR42EqyA1lsasvvqkccT9auffiMvLBVbdnmkuUJOsBVAPoGaqx7AIlhWvG24XBax6+L+U8ln8bqumlyL+0atzeMGjjQc2vd56vBSg3xkU48t8/3GC0XLxVbUn7/OeDWeBzsqWYitjRZEdkrD2KhfVTvOA8UYYxR+iwp5ycEPPsCEMuF9yEESk3R8vyIHfoQA/lvWoxeLkGnW4PevmKv0mi4DrvDQbyslah6RAAIC8MLHH3DSwaukQ3crwVjaeW6jMqD1p+d2j9Al8/gWbKO+jr8LB9DGj9j0uRrIMLHm3DNzGrxoGrAu3gfrpOD6Saz/5QNulZYLlAWXbpv0ce4vAzwPm/OFlZKa4Ys4ZdudkQGm1Or8yy1rbS1cza9HYSHTD7znKQKExPktRF+jk9dqLcltOJuFFEEYki4zH5AmDxXT9OyruRbJ1/U9xOJS926S/7dAiqV55GBD/UYy1ssV4v/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p7PKDCVyrGtgimXtHMqMpjZd8MdAjn7nkwTzL1fMWc8/dCs2nX8eEfhGGeWu?=
 =?us-ascii?Q?rvEc2FnpQMXrr5cbt1DRrQx5OLkyKx+ZFV9alpm0k4k428MU3ogpLkGjkufe?=
 =?us-ascii?Q?uUQ/DooB5oSGz5pQ/Fk7MyMENARebBKAZYoEj/dDoWwKxeHkzrSDGzOFGeyZ?=
 =?us-ascii?Q?OSqdToSy/j6bHH0NGqd+D3WB9FDHpzxyNy3ZnpPp7aYHCHvuHVTox01Tl5tY?=
 =?us-ascii?Q?360DOkUJsEtsPvbeoIov2geytM1fX4Sw+C125roETGINscoqaKzoEME50vZ1?=
 =?us-ascii?Q?gcCS1OWPbS29ukrjhiZr6pz5tDHpBfVFyN9wvuKgwf39vMn/JSmV6SXxqqUp?=
 =?us-ascii?Q?bHfarU0sGoquT9NAiW+xHdc/ATAHwE8CM+8F+xJRyCiNeskjb/nTASB1uD2K?=
 =?us-ascii?Q?EeqFuPLhdjdxM6bBkfscI5dolbK8FunytMkq7q0VpQwfyCZmHzwD1cHdF/ER?=
 =?us-ascii?Q?dzxK4oRC4Z4z0+l/wOqQoJEz0XIpL7Q6q3qmpGr6LuzrJ4kd51iOfxxZ6geV?=
 =?us-ascii?Q?pFdyEg2De6hquf75t/VspahDnr8fROk9OZnmce++ejGZHjEHx7L6e7FYeQrx?=
 =?us-ascii?Q?4YiuGnVSxTZap5rp++q5GshvuMWUsRul6vbw72ZeKUF9WrCIuOZOQvfz27G0?=
 =?us-ascii?Q?/yymK7Hh2mVaKRdIkmRAAlh3jafdilQsUGJ5V9BIBzPI/gbWGMppbjGWhBYm?=
 =?us-ascii?Q?xP+7GQ7Xh1SUpCYm3dCB8ZFpKzvEFoeimXoY9/H7EK6QSMIgF83kwcczZAU0?=
 =?us-ascii?Q?6sf8N4lpcZMNd2V/Gl6C/ZbkPoUWogFh/+Hh4Y1s8ViGW11zDTxW2oWkJvSK?=
 =?us-ascii?Q?1ufSZNAJyfs3FxECnXVxB4vrnuGDLyqSJSkEgVUaNT28v8KoqptdKHGHDzk/?=
 =?us-ascii?Q?gbX9tkSLQaQm6c6P7XCf6jmc3g29j58GmGc9wsr6LEnJoj1+/Rz0FS32uWwp?=
 =?us-ascii?Q?tHbyAlVJZ/uMVhKxqErQuZFMJNeAzYx3CMFh/+wAf0D9EJbTsD8L7CkN7Vpw?=
 =?us-ascii?Q?j/nCEiK/7MJBgXtVbgY2D79PqSda/vgtQSi5LFET2XequIrPNM2RpMm3xQyV?=
 =?us-ascii?Q?kZjRr8rc/JJ0DZ/DQSetJOVn0Mv32QjJy65LRm39eRP3P/G3o/y5/nUYiCJo?=
 =?us-ascii?Q?RM92US1Rq+DzaZQF6UYCeakpuOIY286Kw1/OOssXyE++PUcRSWf54ZG3Am8T?=
 =?us-ascii?Q?yR4Kqog7mvJIV/cEUp/9szzGhLUm8XIlzJvVPADlvZ/K22c2XeJy6YXSgIhS?=
 =?us-ascii?Q?0jZNO/gbS9uK8Fp1UhyYdkgGZh8DnXCOh49zEGlamXZgHjUZTQaAHF1jfbHH?=
 =?us-ascii?Q?8OUc6Q6xDIz2xLhf9RCjdYXlehT0RNkpCKzgv75afJV9MoNP0HIqAQENcbNd?=
 =?us-ascii?Q?E00SbKTVAlw2d2yEuyLsRs+mXWSULmoVQq/HP7CIiKVaElfjLI+YE5flUYBw?=
 =?us-ascii?Q?RszAsE1lBuDOSCeDywFOEzTstCdui8DaHj04u3YIWFy+KCzsmumseMECTunr?=
 =?us-ascii?Q?LfvKj7wrEa3sTH+GdAiNZUm5nVuehPQIJ7+1RMAbP+PuXRbdimJ83nfJGaza?=
 =?us-ascii?Q?C0KgSuW6QLIm2ckVTWAJK4fUKf1VmKkWkKxpSJZnGw0hkh7AHXl81k8gEA+G?=
 =?us-ascii?Q?lxXhjNXrC/QDdxrtPL0gdYMPoiELlZT7sw20Y8kFzyJKzqhx7R9mo0VNGVG4?=
 =?us-ascii?Q?WXh2JXKescKjI3AgYjMXGE7VrkjyLhol7WC2BpUH6Gwq+VKppld97ad7Vnly?=
 =?us-ascii?Q?7DrlBU9rVw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6743b80f-e223-4bd4-0286-08de7a33aafd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 21:19:06.5561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UrkR/tQkJVq21e2M7ls+3PTUimbptpw9QJV/KJEYvypSuleLUpLZbEyLDnpALXzPqjCyR3QdUTnuIjCRKFcgew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8206
X-Rspamd-Queue-Id: E33BF207E85
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32514-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,i.mx:url,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

Implement fixed-up message handlers to maintain compatibility with
existing i.MX devices that rely on the NXP legacy RPMSG firmware and
its transport protocol. This ensures backward compatibility and preserves
functionality for deployed NXP systems.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/gpio/gpio-rpmsg.c | 143 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
index 1accf56a0f79..fcfca658cb8d 100644
--- a/drivers/gpio/gpio-rpmsg.c
+++ b/drivers/gpio/gpio-rpmsg.c
@@ -84,6 +84,145 @@ struct rpdev_drvdata {
 	void *channel_devices[MAX_PORT_PER_CHANNEL];
 };
 
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
+		drvdata->recv_pkt = devm_kzalloc(&rpdev->dev, sizeof(*msg), GFP_KERNEL);
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
+		msg->cmd  = VIRTIO_GPIO_MSG_SET_DIRECTION;
+		msg->val2 = VIRTIO_GPIO_DIRECTION_OUT;
+		break;
+
+	case IMX_RPMSG_CONFIG_INPUT:
+		msg->cmd  = VIRTIO_GPIO_MSG_SET_DIRECTION;
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
+static int imx_std_cmd_map[] = {
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
+				   struct rpmsg_gpio_packet *msg)
+{
+	struct rpmsg_gpio_nxp_packet imx_msg;
+
+	if (msg->cmd >= sizeof(imx_std_cmd_map))
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
+static struct rpmsg_gpio_fixed_up imx_fixed_up_data = {
+	.recv_fixed_up = rpmsg_gpio_imx_recv_fixed_up,
+	.send_fixed_up = rpmsg_gpio_imx_send_fixed_up,
+};
+
 static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port,
 				   struct rpmsg_gpio_packet *msg,
 				   bool sync)
@@ -572,6 +711,10 @@ static const struct of_device_id rpmsg_gpio_dt_ids[] = {
 
 static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
 	{ .name = "rpmsg-io" },
+	{
+		.name   = "rpmsg-io-channel",
+		.driver_data = (kernel_ulong_t)(uintptr_t)&imx_fixed_up_data
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(rpmsg, rpmsg_gpio_channel_id_table);
-- 
2.43.0


