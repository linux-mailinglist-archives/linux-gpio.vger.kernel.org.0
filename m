Return-Path: <linux-gpio+bounces-25010-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F26A3B3783F
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 04:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9A84362507
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 02:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6D92D24B2;
	Wed, 27 Aug 2025 02:42:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022120.outbound.protection.outlook.com [40.107.75.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4F628BAB6;
	Wed, 27 Aug 2025 02:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756262552; cv=fail; b=errA1EEs0IjY2UsvL/uy/tpkNfAccbwQC9sVw9qW/kQmGtF3EudPjBEKt2KnJbRlSzQl+Ysm/lpxiKG9yIcQKioaldVa7XP43LfPmd0XzkNSiL/DS3662TFxqlPOCUfTmP2d4mHNr3iuEU2RpyUYrI9agi209L+r9pS118geF4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756262552; c=relaxed/simple;
	bh=bpigb9gqw2DHVrc3Uemeh6V9K1h0LgC5+Ny3Bd/Ae28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZcmX4n/O1Eel5MB5abKL8nf4VNZy8wiL23kaDhiSgx4hjwv2WejKomv030dGGovxRUN/Nk+IR3pcH85M8ISYPFzOW8cvMT4VPxFZlni/WMae7BQYkBfeVg16ktqQR3KUAWPMbbd76Maw7QTJm4SZkhNpOUN7YsZKWNCkySXZs1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=woiP0SQK33IvRH65mX5VhKJ/STylv6oirlQa5qCmBEKzmIJMnW8DYllfW0PXpN6NTFKwDQ9A+JLcPDLqjviMLOFSZUitPtKQuSPXUWDXofQBCKwxWOedWM6znp69PB7LCdqTlisxD0ogIWB4xDaFef+J940s5RB95rO0i2mhLsbVz6K9OdZLqtLKtNQsDtZSBoCZLQpDPvpHuK4akYZ6uicQYKWQF6hTVI60oz0Z3pCj+kaF/+3925rwN9tAs/kOByJIraryX7ohFu4VgcGy7EVeFoVg/PzaY5IVQpfh1W/Zs0AcaUrjGi4JOG7OvCp3tLEZAY7uwge4z+TxYgTqSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6e+/puKfrOJUXwbMVGyHJaCNu1mqtUB0u9H5cPXqFsk=;
 b=pl/l6Vxhr4eFTj3thO75KtCeHV+Om7NnUFyErXgga7zBsTBzF14Kvs710JvHKfEzLa+R71IG0ljXPfrAD5BTCEohZKc0s/g8J+KgNhNm2OMwn73fSEJ5mpZRFIK+Ep6zquSFp+SydZ9E4fKvH//m/JfVoBf+VGF7zg6eTWYWlyfMF3YDmoQA+boxj+5lnS6lullBkW6AohkGpq7r2HbJEHNQ7EUfGW9R8x8wV4uX2Yt6EQq3iYkxlxrrwdlRvoSGyG0/DGdOs8NdtldHxppUqZhOcpMkfq3ohOwEz5cGs/kWtDC17SaD8VZPDouLni+jBf8Yk06qLwx//bgshQ3scw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4P286CA0048.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:36e::9)
 by TYSPR06MB6526.apcprd06.prod.outlook.com (2603:1096:400:481::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 02:42:26 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:405:36e:cafe::eb) by TY4P286CA0048.outlook.office365.com
 (2603:1096:405:36e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.15 via Frontend Transport; Wed,
 27 Aug 2025 02:42:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 02:42:25 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E0E8041C0142;
	Wed, 27 Aug 2025 10:42:22 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH 0/3] Add pinctrl support for Sky1
Date: Wed, 27 Aug 2025 10:42:19 +0800
Message-ID: <20250827024222.588082-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|TYSPR06MB6526:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: baf268f1-dfcf-4062-aa89-08dde5135b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FnhujdRg53+u/FoGmN2itPsgZD9UnB2PyjUoVOk/us4dJGMFRxq0NLGCJSIy?=
 =?us-ascii?Q?Hv+e7jybrh8uvRDou5DOpqnruRvE6VC4EsX7IJ5G00NLGhouTv2cKrZ+0KDQ?=
 =?us-ascii?Q?7plul8XA5MBtTdd3zjgi9o4r89VBhaEkBX66I/k6Xw1ckewmb6xcrTtx6pxS?=
 =?us-ascii?Q?5berZGl5alU6FwNU9FdCdEw+dwjLDiN5wFrYF4j9tTVedkw8ApfzvDkpBpCr?=
 =?us-ascii?Q?7OjodTDc3dq499eN7LTIdV0d0K9NvWGv/yk8LbgWwg8DR9uVrV8W8tKZGf3e?=
 =?us-ascii?Q?drTdHgpgQKbfkEQ3hRVkMPHobV4Kur8ECpla2W5yH0n1vCcUeYKv0mv/pmD5?=
 =?us-ascii?Q?URSn6zbEpIY2rbJW+x24CK5B+s/KU/0jyTxcL18MPKxOMXObi9mkMvpW5puZ?=
 =?us-ascii?Q?EV1r/BPKNvL/lkuAcr9xyQMEj62kXzsLjjqAt6r2pBqwAsBZBHrcbDsy1Ouw?=
 =?us-ascii?Q?gtqlwPZuEng+ONBnmvFs0lGx4l0bSKBzccRxtZrO8gsLAT7Lu1RM31pEQqtk?=
 =?us-ascii?Q?2SceUh4lycVtAXVs/qwefGI6k9Qy2+GUh2kwk/K2H5ejCvPKddgniJZ9Z/JG?=
 =?us-ascii?Q?gFabHO/K2acCIMPeYNDCiOdRhk89zeTeWMTv3ASBoC4xCdlmbV5l8UrHQYhc?=
 =?us-ascii?Q?UY/RGm1t1egpr4dBBxrch2JQqDViKVx6iI8qpXrarkTmGmGULN/2i5K9x42w?=
 =?us-ascii?Q?75OFV8ZqFi8p/lAvwKAKSQ1w9WTpY4C9J5vjRvusto6JUShDrdoZqvwdz2ak?=
 =?us-ascii?Q?rb3aIubMbYTb5Fq7qeLuxY3bPT3d3nhI0PYB1wFEXHt7QPvO4AkPOoWdBada?=
 =?us-ascii?Q?J/LAf8Nm46yrQ3cySkNeTsYx0N6CK1wmKFQcSnHgOwTN+o+6aln6YdogoM1p?=
 =?us-ascii?Q?K99qyADRFe8b254BbP6QQx/4s2gqlKy2Ybi0RBI56IgidBhv3gZOeb8xko3j?=
 =?us-ascii?Q?1WEpHmLy+wU+TCguJyPDmIaJoiImoMKVE7ucssYEneTwf+CvVnEbqinPc5bm?=
 =?us-ascii?Q?e8OSdoHcqbc7kik7nA8NxE3piFW+qh1Y4zmXDTjSRMMmdAuLJiLO8xj3NOXo?=
 =?us-ascii?Q?bjwbZ6HyVBbG2gMWahSAlh2bXlEi5n0Vz3bNYHw2DDi3zEGkKtFkVKE88++z?=
 =?us-ascii?Q?LJ2M/buyhHn8NoDfVr/CbNnavye0JMSAiZxBuHWHeppjxFCnbs9TyKBQWseL?=
 =?us-ascii?Q?vr8RSHJip6IZLsSo53B00O/u1yEbjODliTHiczBC77Ce388B0Vjrgjf3QB4Q?=
 =?us-ascii?Q?WNTRI1PqelGshM9/s7jQ+ZPsNafs2i5zbXcmXxVpSHqYyLQl/faaHNmR0Wib?=
 =?us-ascii?Q?9QH/qfw2XTdyj0TUSlP+FcdYcqyxLYZgxx0sb6adBYd29wKVRnCQw5kiSibK?=
 =?us-ascii?Q?6HL14aG6buAW7mPdVYRW4bcciuUeZJFxLxuugSBea2HH9+B0MxUchOqjAp3r?=
 =?us-ascii?Q?kvLD8K68bW2xFKfQzGKRMvDUUARIxrwmdX8Nj1gw6Rq6bReeAlwOgZiD8Auv?=
 =?us-ascii?Q?jLibKoAGAR0V87nXMRgJtV/cQMvK1TitN3TX?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 02:42:25.4387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baf268f1-dfcf-4062-aa89-08dde5135b7b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6526

patch 1: add Cix pinctrl driver which needs to support pinmux and pinconfigs
patch 2: add Cix pinctrl nodes and header file
patch 3: add yaml docs

Gary Yang (3):
  pinctrl: cix: Add pin-controller support for sky1
  dt-bindings: pinctrl: Add cix,sky1-pinctrl
  arm64: dts: cix: Add pinctrl nodes for sky1

 .../bindings/pinctrl/cix,sky1-pinctrl.yaml    |  77 +++
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  28 +
 arch/arm64/boot/dts/cix/sky1.dtsi             |  10 +
 drivers/pinctrl/Kconfig                       |   1 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/cix/Kconfig                   |  14 +
 drivers/pinctrl/cix/Makefile                  |   4 +
 drivers/pinctrl/cix/pinctrl-sky1-base.c       | 622 ++++++++++++++++++
 drivers/pinctrl/cix/pinctrl-sky1.c            | 502 ++++++++++++++
 drivers/pinctrl/cix/pinctrl-sky1.h            |  55 ++
 include/dt-bindings/pinctrl/pads-sky1.h       | 592 +++++++++++++++++
 11 files changed, 1906 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
 create mode 100644 drivers/pinctrl/cix/Kconfig
 create mode 100644 drivers/pinctrl/cix/Makefile
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1-base.c
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1.c
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1.h
 create mode 100644 include/dt-bindings/pinctrl/pads-sky1.h

-- 
2.49.0


