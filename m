Return-Path: <linux-gpio+bounces-28044-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8364AC32EAE
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 21:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 667564E650C
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 20:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD2F2ECD3A;
	Tue,  4 Nov 2025 20:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Lj1HPcxs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010004.outbound.protection.outlook.com [52.101.69.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECE12DFF3F;
	Tue,  4 Nov 2025 20:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762288470; cv=fail; b=GyoqNMzZUHikS0m0rWa5Dy4i7f47xEorG7GXWPoQkZQtFPGHubgmJKTBVFYhX4mJjgFcfKXak72fLFKnmCdtdsnQSl7Cxa+2ke9C09bXz5wWcsnhQTa/DfI6L6roY7IX0d/BKC7FwxqPdqFaSGm1oH4OI+EBIhlluOvJVII90Bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762288470; c=relaxed/simple;
	bh=rcra+zcdcIQdRSJk253HojFgBjJWvMVPvEkZ6oUrNNI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VaT0lPofngMlo+1KhtK5hOLOSRYQ1soREjypIiU5O+4q3ZtXrgtWyxgmgb0Ly4WRfYdGjRQlZEHVo+/ZacAlYXcq4QNQ4FQp6fYXbXhirHGA1EwGNpWCPrcYWpj/ZaLmOWh8MqrlpmKIckvEnfjzGyNtE3SkXQFay4OpwNWGBi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Lj1HPcxs; arc=fail smtp.client-ip=52.101.69.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQ5eaf9J9Eth/Bxm0SBBtM3lHvEnv+SxvwvwF786LwA+D3aQKdQu75pXAIOQw27HRcl9i7+AVoeDDRb46F+2VdTgedeqBS66P20YmEgN4mQc6cxE4eiNfdEqMhQNh5aki16CA9Z9HovKqaaJbI0nuVXl1MnkWZOsVZpg/4Cuo3IseoV7QzFBOL+AHV4yI1IOsWPYItXKczhv2qtc00rscKSf+zhHQ1HhxTuLZz7AH9R6v+JPcHygrNJSMPflqEKHhKJjgsp/hPQb8Bzhdm7u8PCnnQ/PbHzxpyqcvcjVv/4yQnMHXY22/aniO+T1nHGy/ts7ZeTFCUWeWqYXO3CgGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+JUwOAxQbEhzqc4rjZ+9gbKfinC0fcZW9YKszRfgWw=;
 b=JvXEstZUB4l0NF/Qi+OR9YcD34TetNnGcZFDnB6RC22PxDQYc6rM+MTjbpPi+/Jf7sJ+qOFpjv0xb5Qn5KzrB6KYdbewOEn9ECt9vykEPFAsHr4mKxCXfeaAx7wwBY5E2LoodsVJvAXOv3iRSCBOVzb+3r/Pa+4RJCQTGbsbf+OSmALM4rtO0I1UMyFUiGOgzVqsPhNPO/cpS+7ZCt52aCWlytHvH7fO1iRK6thnRmSchVRlh1NG5wpgQ5r4WCONLeIUzWoM9aHQ7uEfmUW0GrkEozEdK0msszNrTaA29jnbEa9lLLcTgSmo3gI+48Ex8xIhzNUZx1GyGI7iz5pK2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+JUwOAxQbEhzqc4rjZ+9gbKfinC0fcZW9YKszRfgWw=;
 b=Lj1HPcxss01fYf1h8vnntmeEYM3EbxXL3V3uWs5yx5LNW9aB0uAsQp3dMCDZjrm+CfO23eBulTZLqofeZZHPHxkAAEUXi/Y7u9yzkwF1p2X/GhIS5Zi1KUqqChH9ARdCfm+bGgBaqSgHu2tq9ui75FygvNEX5RRYAvKZk8jqoEOpziA6Ziy40LfxmMi18pZZvwUSrEiDDsFmPL9RqMPMSerJbwuuAUHeCrwxtrkzGdL5a9UUurhyyZZ82TQGNOJaTyxyEmvQPDksoEG4A4iMa/fHRPP54NOjrTdjKc6LE3FoUWvOb5lAxlcL1CTH8as+EmLtchb0i6W/PQv20FSCAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV1PR04MB11516.eurprd04.prod.outlook.com (2603:10a6:150:284::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 20:34:23 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 20:34:23 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-imx@nxp.com,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Date: Tue,  4 Nov 2025 14:33:10 -0600
Message-ID: <20251104203315.85706-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::33) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|GV1PR04MB11516:EE_
X-MS-Office365-Filtering-Correlation-Id: 76986ac9-c238-47cc-2ed0-08de1be189d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|19092799006|376014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IoQZimF4pmeoM2FA1AKtIcNQk/KHltzysX9IpIQuZHkWZPjS0ywhp2ed5+MA?=
 =?us-ascii?Q?omVze4TnJcgJcwWybz+hnNgPfb5hP18gMhIjDrSZcfVBAhbh/yElIDpgIDp/?=
 =?us-ascii?Q?A9A525ppHEWHlwQndq0c7hy6jJ+i+IVQPWhNGyZZQ4dPdHrWeWs9TnbnFAgB?=
 =?us-ascii?Q?qFWW93SQW1IxgEKELw1AJNHtb/9CKYqWBgkW+qh/uCe7LtElWoXPpFlHlIdW?=
 =?us-ascii?Q?WE0O/9Ibk004ybVYY7Zp4m2FpFcvAn9zKXVdHBAovCbGWEptvbtoGi6lWaxH?=
 =?us-ascii?Q?w7F6/XbfwrEaRhceMPFvDlycfRfmwEWdoclrYP281kUOmRPiJYWfPNPvLIRx?=
 =?us-ascii?Q?07Do2P6hKqREeaWZVd7Lcd1YWer1FCm9cA4ravGMR5SNzx85Qks+ZWFwMFLn?=
 =?us-ascii?Q?O1eKhhRraaENDmADtXRFwKyY81Y6Dn/vThH9IXolQkO/6nWJ7fvti5Njl7U4?=
 =?us-ascii?Q?q8EzGCHqL4JtmOUoI3QkWDu7uGNk/o+/wLdxYSAVBpM1374Vb+oH8CcR2urj?=
 =?us-ascii?Q?bcS0tfvbsE13Hi+fpCnEicrYOz0rDmlnORGSLb8h/oJBVhoHtbp+DwAGY+KS?=
 =?us-ascii?Q?2h5uHdfgF/71O5inxNvHNHAXLRiPViXBUPvxfB3m/QOrKYwCzHHdCFIHmaIO?=
 =?us-ascii?Q?p4GrQaDna0gn1sMhA9+nakeqqNxjUF3S1osd2uX/9aLX7H7sk85JwL/q7RD6?=
 =?us-ascii?Q?GcDaYuGmrWhhkyOzSveykQtsG0CtLWsWsnJVpt2AyQ0P7DMGotVnf2R1DbSN?=
 =?us-ascii?Q?F94brAkT5pst+iHiXZDWb3LjloSUMAxXJNlk7h92jE2E6wHOrHuKU+PphZJH?=
 =?us-ascii?Q?w2ZnWUpDFJhf7OuLX5CLvVNGF6W0x3693BsT7bzkx8/wF2oOQtJAda4rFZNc?=
 =?us-ascii?Q?KbLBH9IBGDOjRBW0OTztm4qrG6c9zZh08kIcEAsRtvoL7eq0sGiGbGzatW3i?=
 =?us-ascii?Q?LnQGw9Wbj1CQNcRrkQrzN31mshCm3ehMmdHniKLJy4cuNQoNtOdjga7Xf8Hs?=
 =?us-ascii?Q?f4eOrifopT7wzMoqn5ifVFy69urme1DMWXYGFnN7V8ZhvR2TZyNy2ARqFH/w?=
 =?us-ascii?Q?KxYlfu9k/U7K67D4L4FwEUFvwR46zh53tJw4mWT+gFM63y0Cfv0RCiY+ehAu?=
 =?us-ascii?Q?IKs4hzEI4/bAVgzdC/i84EycLPA0859LxensXdT71/JpiK9+7mBfFeCtGj2K?=
 =?us-ascii?Q?1wVJnLGPYxKBZaBc1SL0BqORQNcJcMS2IHpm3aAnrmarovGmxV4qaF79ZZj3?=
 =?us-ascii?Q?AiCTsTCTHFccSgqiUyeLCM0dGk6rZs19y3eHBLU+BVfDL2lfGTlxC28+jpq1?=
 =?us-ascii?Q?kaTHNGNMEWuOzlp1grt3qOsThRiw2hZexyrMeNsxNU9Ueku6KLYBX+U959E0?=
 =?us-ascii?Q?2OwM1W13n/G1fJIrs1pUOPumuRNOlcRH/pv8oCvLg6oZnSNW4pL9HuyVxCU6?=
 =?us-ascii?Q?c/dg2E8BOTAT6bDDVZoxP2S4cx9L1FYwaE/bI5ukPoeXz0boMWXHiRkZ6gMu?=
 =?us-ascii?Q?7z7kJyAUZr185Mb5jzXHyHpn/pXtqJvm2S0C?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(19092799006)(376014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1FUU51fUDdVWlEFLjFGbAEZX5Zz5Te+qg1AOfbL+yiL9b1fbrKH9PoLuv6DX?=
 =?us-ascii?Q?yhyYWw+amrRKq/6M49w8vpazjTqnizNDn1c1PBMHyKXCFfAfYh/RV2OQkKpo?=
 =?us-ascii?Q?KO/N6QJ+R2uzobCkb89huuDCHc7fqh1wLUfvPIcwASYV0r6IFUaYtmlKtQAi?=
 =?us-ascii?Q?Sk52ZCZgPZNbNu9/Z9qXW53+I/GVSzzNLuGAdBkKwq3MUsqBW+XG0C4x90iQ?=
 =?us-ascii?Q?YzRP6VFGIyeyA4cIm1H3DcpW2uUqkE4MZ1Nj6k/qVNcKinxIQe4ADz3Pxy7p?=
 =?us-ascii?Q?IQfrZKetTahZy1byAjLaVCLFyPOlrvuS9cL/vI+MPUb4JDqeH39tdM2VbmeI?=
 =?us-ascii?Q?C+C442EgjhDmVDtPZ0QMJ+ek+aOTlHV6sBe9bk9Ufvn0uX1wajEKagvlkaPx?=
 =?us-ascii?Q?PeiVnpbFy+k+IX1abZPhyIwjKbJ/0bFttp8Uzy9WzGPkXPo0sPpPOQKduxI7?=
 =?us-ascii?Q?cSGj03IAashWuAyBZkRE6Jur2VyL2hjYvzyJvauitQwR/ix96a+Fk8qQ9U0s?=
 =?us-ascii?Q?ON0s0vfXdmrtmLgPm4IIpzeTWxNKhF2uTfXPOvY3a5fXyLVBYppEWMTin7kN?=
 =?us-ascii?Q?xnxboUUYVX5ALMKrVxjJekd1Dgyj4VkhS7EwVL4O1OmuA6ekSqC9ljBz692R?=
 =?us-ascii?Q?zAF7Rgcdn6htRS3CiNgDTU02tnt91M+bBjOQ7gNu2N7RW1/KZxeOzWGlgHjt?=
 =?us-ascii?Q?U0M8rt+zD1UAk7yTC0TtMAsuoCqUAU2owmRWYPvWvzXouBSTUfvrE0Pit86I?=
 =?us-ascii?Q?X31CNUIX30vRvq65MURNTvajHhe7wwm/mAaSWdJtkys1NXP8Hh0MFmGdoft5?=
 =?us-ascii?Q?yVQxLVFQsF6GTARn8KT6muDLeE3S+szZUY0wn/GiK6Jd1OWbuJepCHWHbxH2?=
 =?us-ascii?Q?f+sgr29Fv98Q6HNjMyg4hfCJn/RPCDtuIOvy3qRZVi1R3aLE9c+4kj4q+cmN?=
 =?us-ascii?Q?WKJk1qcEDCfOv+cpRYP/07/xKr1XZwH8q2o/OZXNrqR43UbfQVVE+YJ++9Ow?=
 =?us-ascii?Q?uM0PevBUN+RYExxnW0nP8YLTtK3cM+ze+kLlLBHadFx+lMnO5ehuliZEEoy+?=
 =?us-ascii?Q?Cuf3eD4FWvMW9NLguNBBscteNMh9V/B45hVW6plzBwSGG/61I1IONhaJIR7i?=
 =?us-ascii?Q?h7iJ+9/fZdl3vYm4+NTesijp2bnj3nP7szJT9FKlq7uIdo9q1a0iRYaXN2nO?=
 =?us-ascii?Q?d/iEAne3j2sbiGjzaoIMUnk2d474uVxfoOSVCjIIBAc1LT+ZeR9Ap0jBVZ2h?=
 =?us-ascii?Q?1n/9p5WiVoXAvqcfbl1Fxe3ry88gD0SLzeZ0efLjI+IbOUa3/MNnj2kynR4a?=
 =?us-ascii?Q?3SKdosCifiFEtZrXoFMYrZAGhl+nlhUHB9xF1rcZXMn6OT72iRwZrl+33ChJ?=
 =?us-ascii?Q?ehjPxPHYcw9GTXRivkO1IPfYrp56XA/EIsRMUKDyuIwgBs19+9NodzOwh85j?=
 =?us-ascii?Q?q1Q8aW18ajOJ2DIWEbqD+zR4K58OhbEm1wndgw1bK7efWxf5jrp0e/E27Za4?=
 =?us-ascii?Q?6L4NtFIiGTvSxiUYkeNEw5uYJ+0dabOeztgvFBad10tcHcb1yooChI0Zzsxm?=
 =?us-ascii?Q?G2rR9+sHFjgp++3PcLILKCVoKE5F89j/LigSLkgJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76986ac9-c238-47cc-2ed0-08de1be189d9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 20:34:23.0497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8u9ueF0AWyBhQLHj54VmRSrI+5pENu4nKbU1YIU9QlvUIEqMO2bj0nLVimgIIWvBEe2fh8HEP0M+jW9MQN/pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11516

Support the remote devices on the remote processor via the RPMSG bus on
i.MX platform.

Changes in v5:
 - move the gpio-rpmsg.rst from admin-guide to staging directory after
   discussion with Randy Dunlap.
 - add include files with some code improvements per Bartosz's comments.

Changes in v4:
 - add a documentation to describe the transport protocol per Andrew's
   comments.
 - add a new handler to get the gpio direction.

Changes in v3:
 - fix various format issue and return value check per Peng 's review
   comments.
 - add the logic to also populate the subnodes which are not in the
   device map per Arnaud's request. (in imx_rproc.c)
 - update the yaml per Frank's review comments.

Changes in v2:
 - re-implemented the gpio driver per Linus Walleij's feedback by using
   GPIOLIB_IRQCHIP helper library.
 - fix various format issue per Mathieu/Peng 's review comments.
 - update the yaml doc per Rob's feedback

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

Shenwei Wang (5):
  dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
  remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
  docs: staging: gpio-rpmsg: gpio over rpmsg bus
  gpio: imx-rpmsg: add imx-rpmsg GPIO driver
  arm64: dts: imx8ulp: Add rpmsg node under imx_rproc

 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 123 +++++
 Documentation/staging/gpio-rpmsg.rst          | 202 ++++++++
 Documentation/staging/index.rst               |   1 +
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
 drivers/gpio/Kconfig                          |  17 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-imx-rpmsg.c                 | 475 ++++++++++++++++++
 drivers/remoteproc/imx_rproc.c                | 146 ++++++
 include/linux/rpmsg/imx_rpmsg.h               |  48 ++
 9 files changed, 1040 insertions(+)
 create mode 100644 Documentation/staging/gpio-rpmsg.rst
 create mode 100644 drivers/gpio/gpio-imx-rpmsg.c
 create mode 100644 include/linux/rpmsg/imx_rpmsg.h

--
2.43.0


