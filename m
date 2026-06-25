Return-Path: <linux-gpio+bounces-38904-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t0yFKPdQPWrJ1AgAu9opvQ
	(envelope-from <linux-gpio+bounces-38904-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 18:01:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D27E36C7412
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 18:01:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b="Pff2WPs/";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38904-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38904-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A99530D23A2
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 15:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E49339934A;
	Thu, 25 Jun 2026 15:55:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011025.outbound.protection.outlook.com [52.101.65.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E383AB476;
	Thu, 25 Jun 2026 15:55:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782402922; cv=fail; b=JYRO7AiAyyOxSqeuzw4lBkYK7ICegV+vX9EJfAXUr4QiVgo4KonxjhacjvKmEZ5rzjKT2g2BiBhbGrGWaWx4WX6Xh62LWQtg07m/bCci9W5naBf5j/PYstNfNW4m5LgtMRchlbkSqZ3fz3sFObmuH8TjCbcdAs/lC4rIrCVGUHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782402922; c=relaxed/simple;
	bh=rOJ4TsW6mkd27bCvYfk8zbTnxJxa9QRgaqBwcHq6UVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SN2rV7a8LmOTeQ/QgE84bK4r6S5qkCzt2xNZxLZwY4ZLbTbNxUIp2q+8u9iL8GTOY6/jUwlr9fPKp/sBKqCCVGZdmeBKiPpYXFHzoZ3chVgWmWgDH+qN7d8hVo/DWIgcFCcS7JJGsZsTPsm22VyiTyYOknkyEtI4B+S+YjEnDSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Pff2WPs/; arc=fail smtp.client-ip=52.101.65.25
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KBG9hkXIPfQaNy7U2opYsGKzwnMyIljJm+O24gO2QnS9kf/7CSkWvdFtNSdQBjVR4vs8Uf3+fwTw/bFKmjs3sIPOC471kR/ezKotst9mBy3SgHOgBtuuuSFjL+AgGVQVeX+eW/1tbL6gxn06y6ribikA/GnoHd+1hkTz5teZa+S2Y0HGLnFzamh0J+E4SMhIX2MV5F4+LLBPUYtIeYFGoyLOfmKKGxRYUjFlZTVXowczGVnUO/tk3QkL+jTPvkCfPuHiprtBknN2W0JI4/0z6dohjJ6MNeMkBIdPK+aG+hVZC3mPGvGNZvgeYv1xlpbMgsen5cBreqTLOCLkPwuSUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIRUCQ7GKInNNUZU2tddrif6egyV+j5CN9TUeXWm1mU=;
 b=fdl6HiwfJA8VBOs89Dky8LnSBPm6ynycAmDp59p/Ve+ocF1ZFAUmdAUWxKswSY9fsOv0gpj35uCZt6x9vuVYwAQ1hBELZZ0KMTGFHHwQ5JxdPdFROb+P0LOPWSYwpzJsgv8NXIucIowEHVEEU2ARO1UvF49jSmRIvfxrljiSkmIxbfbMxI5Rvv/to0u4gEfPbOI8AHLUnBu8qzY2jwXkAUnuHu5n5fNfUGKaosnolAHoFbGC9avetN9RZxuoo9do6pexenIr4RYcZoZzhp0uWZu5rwzhkkOgxpYZWLg/lX56BuHWNQWwfcf4bCg26RT3YjBa6kvTCQBB8nxUxZqQSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIRUCQ7GKInNNUZU2tddrif6egyV+j5CN9TUeXWm1mU=;
 b=Pff2WPs/zs+o1S4tX6IvMTcVoQBURlBByXFDDIlrPyeJBWK8ofmrTGLEy0cvkTVlg6MHxToAI9zzONfYD3HGTOS2Sz8mpV1o+Hrql1Yy6+b9rayy46IP1W+7oTZTIMS1BiTXTbhUJfAPV/ueWqGvnVL8XGuVBQM+3DBhaOy7W2FEBlSGK7xJlZk0qFqL6S4bHtVYcGRwYmw0pYxykblq0n1vyhK/yRgTMYCXskoqGyzm16YKuFAluXV5LqOuO0oLHrJ0eR6Ch3bnp8oLZQJJSphmcA5/1VmOiIjYxjXstpOQOIyLc4cWynjMm0b+5RH67FYRuNM58/AGLwxf52iGCQ==
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22)
 by VI1PR04MB9812.eurprd04.prod.outlook.com (2603:10a6:800:1d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 15:54:59 +0000
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4]) by VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4%6]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 15:54:59 +0000
From: Shenwei Wang <shenwei.wang@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
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
	linux-imx@nxp.com,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v14 5/5] arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
Date: Thu, 25 Jun 2026 10:54:30 -0500
Message-ID: <20260625155432.815185-6-shenwei.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::11) To VI1PR04MB7135.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7135:EE_|VI1PR04MB9812:EE_
X-MS-Office365-Filtering-Correlation-Id: 656e9174-4512-4df2-2224-08ded2d21c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|366016|1800799024|921020|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	b6nOsP+/8qOCJylFPsLVr21iuKxFEcMeGOX40CP/9RWrKhSsuMWfTbjpqygUvnEg8bQTWtHXFNQWJCcGYC+DxeRs9A/3J1Dz+KQrSh1XTPOkdvGWSdcMxhfK4fuWnmHhtvFwgvyrgz9I48f9KqagdxXkX/CxiUkbVkLjGM1OzS1/SSfQ0QcQ61rljwnxn5C+Yhpi+tKI1JkeFrbm8qER4VdRo8KeyNU36q3loYUVAFqYDVnkOMNuxmFHK3VrAzyCdxIVmm4VTx4JAss3z5pq7ubx/d6ctCokppyPKQ/cy9AZW9TUuBN1FgEKL7FENrqVlCrxuQNUB8uGgJn3trFQM1SP0tkwlkilfD6/NJ6POwYhw7/uKzAWq+kbxGj4W1zBrZoz/UKC/TY0J0FpqSsw7sSD/2L7rwxN+7zOstgvnEj8JgrkPx8Oa8z0SEZqhgnhfJD9M0NXyuKSVRzOgP4x46GLahKiB3UQQzUeuEElvrOehQ2vcxtGMx+sQMbUHhfiz1T6R22ytVYzs0WL8Amab4xOgcQ5yvN31XMiTPPHBbv0ybALs/4PHHNfWXC97HRFa7SzlKHZpBSinQUKWwfhOpK1Z5XtW0hy5CwdAxJSIg5/fj3q5OJjjM8ayceOe7yZYSwZ1REgw9pDVQN4GyyjAu+feJuGW2s16vzIuBvTOxOBHabIy91u3/QIDv0bHvOF/94Cf5f3ehU8EnY/NxOpOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(366016)(1800799024)(921020)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A0POuqLIGWVyuAZCUeRyIfcu42DFYr2Asj8NbE0uA36K8t4NSiD0C56AD2F/?=
 =?us-ascii?Q?+wfWr8NLtTlJqfqDAdMho8pPF46Y84KNA3GDoOT66s9Mkls/EzOUqn5j3Fh7?=
 =?us-ascii?Q?1th6j60Nh2sgGLf/HwzIy9TCq9P8n3ZvUO3dQfUJ/IdtwNw8x0gHV6kNnm51?=
 =?us-ascii?Q?4bTaf7a4+FN4zdszVpdT/5bGgGnk+9958Jh+MMnS7yFkTD8B7ddYScEKhW+n?=
 =?us-ascii?Q?CrpNvJWjgaCx1SqCbbWr1FuMeV9EVp3Ql/qK8n3O4WcOZ94UVpMwVLnP8HDQ?=
 =?us-ascii?Q?EkVOLyu1NGti7WLnBCPX4m9AFa8bD33waYZhq2sEPk+0a26KphLb1ep6NO3+?=
 =?us-ascii?Q?03DQBdfY7GoAPiQXmG6BD/0lnlTLCuhKLEk9ZD4S3QIG5n3pyCjNTVvV01da?=
 =?us-ascii?Q?J2newspTZ0PJmFfHGEpB4pyz7s6Fmo1ZKtMFpJAAP47cDUPAr1cn/N9M9+6n?=
 =?us-ascii?Q?uoz1ftE8UzFh/x38kVk4dR/hkpIju4zKEXKFkpeE9I35hYsjuc9mi4RGBPar?=
 =?us-ascii?Q?yCGzvZnwAGPDwkGSUfieBEIGTFTQA6R0Fi4FzpEpdbUaqWcXkNariHrdx9ub?=
 =?us-ascii?Q?OXiGLGR9/GzoM9V1ibwYJxLjnkjl+U58+Kj9gYKk4HCGoFMtAxSXaBUzN3gT?=
 =?us-ascii?Q?C5W69Rgu9K+GyMb/CLpS6Qoaz1flcxmP83k7/Xx6a2ZneenjQjKD3b0pjjNy?=
 =?us-ascii?Q?5BV0qh4o7S+CKyZv/pV+bvFndRvYh2keaWhd97TKR0c/MASoBaSuIq1Z3e60?=
 =?us-ascii?Q?L4xQ2SDZEO5QEgCXnIO+iVigi3uRL14uS5saP5Ck3zz3vSv6/PCiskHmwI0+?=
 =?us-ascii?Q?YGqE3ZT6a1Xb9IHXC3RKMzwxIH9Q/aI34nG076npUi+ld6gdi6xGAEyY3l78?=
 =?us-ascii?Q?ghw6YtB/7ZuemC7QT8qDj1GcamzztfERLrm5YG5Q9Cl8SZN1Jxs7D733wPUZ?=
 =?us-ascii?Q?NgZy+VhauWxvoTAPbjbKHMQ9M46qs1oHVEYgStgt3f9De8WFZhUIDzOFKabJ?=
 =?us-ascii?Q?qzBTiEHlWn0nrYEs8bnoBAPV0eXJ3ShhZE5VDqasBOiAeu1mN9jykKwreIt/?=
 =?us-ascii?Q?CV9sozzefa9TDt3zpt+S7wPuVfLmHQ07n1rysKw90iDxzylBU/3AGeAHjpih?=
 =?us-ascii?Q?hfRwRV5wO//m36HICvtSpOW2/4hxZP8IsDh9qd4hEphCoB2Z1HZpAsUCypuZ?=
 =?us-ascii?Q?d3khEB8KvkX9CS8xfY1o2Ca0UDlkO2Mvn0y8SrVDbNYPI6KuXB7Fr5OjFZkd?=
 =?us-ascii?Q?4LDsQeEn1jQYniKyjE5k5b79gaN4/jP94JTduYyEd0u78TeJ3uSK7M0Ods08?=
 =?us-ascii?Q?9oyaEYhZzzJvtUdUgyh5AzIpA5poaDcpTawIpauiceY8TcaqbrjdAG8xER4s?=
 =?us-ascii?Q?KEwULmMVVWLX9yjVeEyj9rszEGyJTxW99IEFEWrMigcb+xPT17toxGKkwdNX?=
 =?us-ascii?Q?sI0RDzi++0sHSZ/n5XQAKSyGjbvQLOCDxnhx/vOEoK501PLCI9IM1jt8ToQe?=
 =?us-ascii?Q?frQTsxNC6jpmSFNhK5qWI6YqHel1QqtRcK5gXvI658ybZD/8nsUPy9+zMkOq?=
 =?us-ascii?Q?ZZ27jKDZeKlBXzvNdsMN+C5u1G/VQXUMVf3c+56pVg22Xo8BHsSr2dni0Ot4?=
 =?us-ascii?Q?BC5VPLyIaCSJtReH0I5mRwerP1DH0ILWDKGPdBPC+wvREsk4vEAZILKLp9ZJ?=
 =?us-ascii?Q?HcCDOzkt55dM+Ahw9mDy2lruh8f/cfuO4VWnOP/N9bKGs77mYiBhKkevNrg5?=
 =?us-ascii?Q?bXwyPaJf6KZGm7/RZ5+zOyfO+/WTSwC6d5I5ULkzb0jHG8XMPPUV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 656e9174-4512-4df2-2224-08ded2d21c0d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 15:54:59.1160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4EOPq1TrBDmODIBDPjBORByiy9kdi6swRszwX+86H8CSPROXGXISOvV2hti73lWbl5BLn8BtkTv+Bn0T0mYkmigyxojvZpyzdMoRhTa4g+ljlMB7Btx7TPn29LXrocj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9812
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shenwei.wang@nxp.com,m:peng.fan@nxp.com,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-imx@nxp.com,m:arnaud.pouliquen@foss.st.com,m:b-padhi@ti.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38904-lists,linux-gpio=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,foss.st.com,ti.com,lunn.ch];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D27E36C7412

From: Shenwei Wang <shenwei.wang@nxp.com>

Add the RPMSG bus node along with its GPIO subnodes to the device
tree.

Enable remote device communication and GPIO control via RPMSG on
the i.MX platform.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 1de3ad60c6aa..f1b984eb1203 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -190,6 +190,31 @@ scmi_sensor: protocol@15 {
 	cm33: remoteproc-cm33 {
 		compatible = "fsl,imx8ulp-cm33";
 		status = "disabled";
+
+		rpmsg {
+			rpmsg-io {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rpmsg_gpioa: gpio@0 {
+					compatible = "rpmsg-gpio";
+					reg = <0>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+				};
+
+				rpmsg_gpiob: gpio@1 {
+					compatible = "rpmsg-gpio";
+					reg = <1>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+				};
+			};
+		};
 	};
 
 	soc: soc@0 {
-- 
2.43.0


