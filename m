Return-Path: <linux-gpio+bounces-28360-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56968C4EFEC
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 17:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B61733BA88D
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 16:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5190B36CDF0;
	Tue, 11 Nov 2025 16:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="nYfIPq5y";
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="nYfIPq5y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazon11020075.outbound.protection.outlook.com [52.101.188.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAF336CDED;
	Tue, 11 Nov 2025 16:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.188.75
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762877918; cv=fail; b=ht5WNQvArM+9JwhX4XPsCj/gJLbyOyZNTSbx/PXpq7JlF/IwZ119/9TtAS5pepz8PfIw2xHcqpdLCqd3Bush9Q8WXcPwb5fK6DD0msVdjicgIySH0ZSiw4UEXyQNkuVXUptU5J2H2YtVkNLcxhXu9yrRbB3qxLKJshkiLJak0qQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762877918; c=relaxed/simple;
	bh=J1W20KH8uuAVg142kIA6Kpviq3CtqcaSJXSA3H/8l8M=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=q0wdomjgz1S7InESiPC58SMbNHMeXq4Zlnv76J1bE4hC3sTrpU5QzjboDfRBqFDP5MIjXc+OAkbku2YG0OWSfj1I8SNHoq8KnI1A2a9Wx52fDc/h6zcHiBrjVgbmFlofZ4KWn/8U2Y1pRYKmXGlDL+6CKa3IxE5awt93dP1wf8Y=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=nYfIPq5y; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=nYfIPq5y; arc=fail smtp.client-ip=52.101.188.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BgS0K2bnUoK52CFjep2+Mx4rboB3yHEAOw9UFTQgiiDXZfCbUNKgWzdRS3Iu1LrmqB2lieD67hpLavnahrkjp+9wioB8PTlnbgd//JTdqHNk/XgUQuaH2VM460RWc5Xnk8PNtF/OgUzXiwE5/dNibnBgeCZXKAO6SDZcApyFrJBsiUWDNJNc+NFBzceOtQNn+pgnlAS8H4YxJFBH/XOdmRc5SEWHV0OfJJVfCmTOGMtS6s20OlRZEdoH2ZFsG+ms2Uc1pzstIuhC5kJE3lUrhVmQS9odnttso6+ICY+xs4jW+0o6WwWBOlkJB5VUGyt2scmgNephttUllEFdBjwwHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lRrXAbqIfe8smr9YOKx+HMxepweYaYyPU6ysnwRnqY=;
 b=jRVc2eCCEfiA64X9s5kCjr68I+bt4l38M6pIXxCiJUcu7pWhwcTT9msBfbv8ELagnc7LqFuxgeFijq6glY1IBN23EDG2G/vxy/eZxGBD/VQYUrJ5EX8OW9ChsazV5qL/C6COJTTahcOKUmcRjN3mjLod5azYOb/QlZs/sVatZq03deLjXu9V1eD8/DZQo/inmx1ebBN1xTc3d73hq58dkUpPT83bbACe0agaK4z5Sks4+dc9czrfC67BkLGL54lXWzegh7IEhQWFS1ZUm1Q8BWdyLPVEcFviGFRRWOXuhINxdyIpxwvWmoKgYymzdhWnhsyWf4IWMT3QqsknPiJD+w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 194.38.86.34) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=pass
 (signature was verified) header.d=duagon.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=duagon.com] dmarc=[1,1,header.from=duagon.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lRrXAbqIfe8smr9YOKx+HMxepweYaYyPU6ysnwRnqY=;
 b=nYfIPq5yjvD5WfHykZDqqotVIs1vOpV8cZqKkU8a1mVPUi2EDzKPrJbl6GFQHK9K5/02b6NH283V0GNQ3XDL8ZUJO2m636lzBbbOMTFnw9xJ0xinPUYs9swHDs/GHBp3WzsiN4Vdgv2NH4M62alU9zclagsS2rzonicArvKPjIM=
Received: from DU2PR04CA0175.eurprd04.prod.outlook.com (2603:10a6:10:2b0::30)
 by GV1PPFB1AC99199.CHEP278.PROD.OUTLOOK.COM (2603:10a6:718::227) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 16:18:32 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:2b0:cafe::58) by DU2PR04CA0175.outlook.office365.com
 (2603:10a6:10:2b0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 16:17:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.38.86.34)
 smtp.mailfrom=duagon.com; dkim=pass (signature was verified)
 header.d=duagon.com;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 194.38.86.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.38.86.34; helo=securemail.duagon.com; pr=C
Received: from securemail.duagon.com (194.38.86.34) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13 via
 Frontend Transport; Tue, 11 Nov 2025 16:18:31 +0000
Received: from securemail (localhost [127.0.0.1])
	by securemail.duagon.com (Postfix) with SMTP id 4d5WrJ2MJnzxpB;
	Tue, 11 Nov 2025 17:16:48 +0100 (CET)
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17012055.outbound.protection.outlook.com [40.93.85.55])
	(using TLSv1.3 with cipher AEAD-AES256-GCM-SHA384 (256/256 bits)
	 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by securemail.duagon.com (Postfix) with ESMTPS;
	Tue, 11 Nov 2025 17:16:48 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/DPfKi87gFgXKuO/Sp2ovdw+uq+g8HqmqovJGWWJdi0fuqaeh78F9AUNDP4OP8qS+PvEa1tY/gF9rCDEAFX6gNixy19HW3ikosLLR3gvGz5yxMCvuuqwWxp8IVaM5TpR8HOTm4RlL5qU96ucAYtOLXKfff0cxOC4BaKB+3SqE9UZ+sJCYUxlzlR+EDoqYRZL39Nxr7VQmoyYr4Wbtvf0St6MvdcRgeQRpzLBAeZXqn0iWVTJrCkZdz/z/uCdNfr+yDKKN9NFsWuC8qIUJFSuaaY3Kcarc0AyDIg3JP07oVgywdV+AKJpvOzJS9Wow9jZFWyQz6keu28QUdw9Wfmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lRrXAbqIfe8smr9YOKx+HMxepweYaYyPU6ysnwRnqY=;
 b=J0hySqpzzG+VTiPy02A/WTP+3GRXcfA7M5WAbYhPZB5sG1XEukw1PsIk9j3yYo7ZCICFtw0ycZpdRfxsbDluLaxZSWIe4fRko2HjyNtTBa5E+WBuGYjGUkNuaRGOU+uM31gM1Ot2ASpPN6wYPqq83iD57PkyxVi+VoAiZN0O/3HfHYAm8cM4zA4HUX8RHLUlUWlvgijy8bq2nGL+r40ckIDtf0sWcLGftRll6gq2oG+SKN/Mwpi3PV7NPqDHnTIOhD0juLoRADvOSHpUVr6DVQUB405swOzVnWNeR5TGNVcAOdXdRLQccKJTJcLPpb1p7kjwODwfTYl3S3Ioar13Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.79.222.204) smtp.rcpttodomain=linaro.org smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lRrXAbqIfe8smr9YOKx+HMxepweYaYyPU6ysnwRnqY=;
 b=nYfIPq5yjvD5WfHykZDqqotVIs1vOpV8cZqKkU8a1mVPUi2EDzKPrJbl6GFQHK9K5/02b6NH283V0GNQ3XDL8ZUJO2m636lzBbbOMTFnw9xJ0xinPUYs9swHDs/GHBp3WzsiN4Vdgv2NH4M62alU9zclagsS2rzonicArvKPjIM=
Received: from AM8P191CA0009.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::14)
 by ZR0P278MB0059.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:18::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 16:18:28 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:20b:21a:cafe::11) by AM8P191CA0009.outlook.office365.com
 (2603:10a6:20b:21a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 16:18:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.222.204)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 20.79.222.204 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.222.204; helo=de2-emailsignatures-cloud.codetwo.com; pr=C
Received: from de2-emailsignatures-cloud.codetwo.com (20.79.222.204) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 16:18:28 +0000
Received: from GVAP278CU002.outbound.protection.outlook.com (40.93.86.4) by de2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 11 Nov 2025 16:18:27 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 ZR3P278MB1509.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:91::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 16:18:25 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e%7]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 16:18:24 +0000
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
CC: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	Felipe Jensen Casado <felipe.jensen@duagon.com>
Subject: [PATCH v2] gpio: menz127: add support for 16Z034 and 16Z037 GPIO controllers
Date: Tue, 11 Nov 2025 17:18:17 +0100
Message-ID: <20251111161817.33310-1-dev-josejavier.rodriguez@duagon.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MA2P292CA0014.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::10) To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|ZR3P278MB1509:EE_|AMS1EPF00000042:EE_|ZR0P278MB0059:EE_|DU6PEPF00009529:EE_|GV1PPFB1AC99199:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f8eb256-efb0-4de7-d8b0-08de213df4c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?WALLtJPG/+XiTwtL5BLfaHhRqOlWvlHqSVfslfW+q/uCrwlhtWvF0LBr2EGt?=
 =?us-ascii?Q?t+g55dtsI59ucAnLCAEIl3gseiJx0jyRosojaGwOAWvtK84PoMoBt4VO1A0Y?=
 =?us-ascii?Q?U48+n22bTtoqxA6WOW/Zq0EP+r8zE2/sDAbCojAgEdO356X9j17mNmgwa9ru?=
 =?us-ascii?Q?zUSN/TLFYjqWv+Ue9BMEodBWGlFX3PDC6ogMV58D1pGhvdzKKVMINm7NRBPM?=
 =?us-ascii?Q?50WDqGoBaX7G8tmxZl9y8neAv5XDCKH2KidHvSuyTjrt+SIhE4jM0aaUICiM?=
 =?us-ascii?Q?//XDQrAkJOr2XxGkixBXhfpf14NosNJEYyDTf9qwBT+nXcU4JDYlc+DcLku+?=
 =?us-ascii?Q?YhFprd74DPwCdxfCrzBOzRcKn8FeftyVda8wSJDnI9C/aZDLk2j19GP6IKwK?=
 =?us-ascii?Q?kDEjBCYaP2hZ3zIQInkCjMn7+I9CFKsAlNNn1fDX6//vdChL5QxZaBKcbVmm?=
 =?us-ascii?Q?z6sjZcINoctpUWtf4fgIfkxKI7LQe6urC14vQAayX4C1DSnzDmZp+clvzvkh?=
 =?us-ascii?Q?5wmfy3MfcVHP0OPn93Og9BICdGWRgQA2hrnELyqWYOTxG/CdA9uZzLGYIvxk?=
 =?us-ascii?Q?lc55oAzffFumtx06svO6oF47L/ECJlz5zNOfyL4k7FB/QZC74zqba+y/7C+R?=
 =?us-ascii?Q?xPxZ0PlplwG6Oh1wATWHqpZGtVQTNRPjVA6A3fv5ET+9Srm4S0IzEveZ+pqk?=
 =?us-ascii?Q?PAMiXjIp0rNpjQmDWhts7zDF+VS21OvpCyQrUxruCPmzk67qOYh4bL3P8tUz?=
 =?us-ascii?Q?hNyyosqpvmAPD4b1DalToZebgMCtgBQ6ED7MKtSLVpM+yjZHD5zX01FZgMFV?=
 =?us-ascii?Q?HeRZADr8v889IAaz4RrCje1xZU+r3/PmjBXjC37HBg3hCI7alsCgBGP8c0vs?=
 =?us-ascii?Q?1m+Mr92FrECPQix/osuYD9QegEpzNWgoJOXwvWvN72ddeDHHq/a9TXe0hAw1?=
 =?us-ascii?Q?sLnlp5zmXwHVu27Dd1wGvm4yR+VOtCRMevsM8BnByMPKrWHGWga5kI/9XyoE?=
 =?us-ascii?Q?syhguIJ2p+CRu7B2ooDbpgfSswZKLbIaundjl8vgA4Gp4421XQP+/PXra1yk?=
 =?us-ascii?Q?AjkyrSOvJopYacd+DSRC59oPjbtkM5gOfXafwU44qJZ/mhtz8WOtxZmayOLS?=
 =?us-ascii?Q?At5X95tRtvwS0dYE3a84eU9APDuBsjx4GMZ6wX0BCxbvOh42OKrkGurcVhIS?=
 =?us-ascii?Q?jqXi/2k+bTeJKmGL7eaZo6Pk5twA+rS/ogMLoQtGGuVSZeVsYkZBwTkhXBdX?=
 =?us-ascii?Q?RgQMpBffKdzHgs089CHAPwT8ageHCp+cZrzBiLdfqgAxn4Z4WTMAAPYUHESN?=
 =?us-ascii?Q?Au/iShizsQbc28Vou1dUE/CguNzM8Bg8Ujn3RkLOAtH0CoTp/NYieS8wAzIM?=
 =?us-ascii?Q?cToctQ/UPJ6cFBJd92VJdKStmZpeaHm3QqDn5ml9IZGPP+XWNMNjbjk92M43?=
 =?us-ascii?Q?M0MDJmXXQkThR84EC0R/7u9sQ/Jts4Dw4tHbBlAYQzF3nPtcvvjEgOML2Kwl?=
 =?us-ascii?Q?FZuUHOianirBVc6ZsisUKvtzxBGtGpYJIyPP?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR3P278MB1509
X-CodeTwo-MessageID: c6e1fb0a-c672-4283-865b-a1edceb24a7f.20251111161827@de2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
 f82532cc-0343-487c-637e-08de213df09a
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|35042699022|36860700013|1800799024|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?NZ/qqlMyRLP1yKDYMCeLWcu3YGAc/+p1pRd+ICC4rT4AosrUH2L9LyTnliIw?=
 =?us-ascii?Q?+5dCAH5x5BFUBFdAkJA7vO3AF+DKQN4ibtirGdb4pxrG9MqBqzdBVqwwkqos?=
 =?us-ascii?Q?4rLIzuxmUIiA2jhWlr4DSuqsUPVSqm53u6syUiKVtwxBwLEivJ8yLt+IQL3U?=
 =?us-ascii?Q?HJE3ibStCvA8p1cKaclvWmaYHpW5UZwWDB9TGaDKLRG/lDGitEL47CBSEOaw?=
 =?us-ascii?Q?ARnUx+9XDioHFeKorXF5qHMsURGlZOm4Xi9CdnitHY+3qME0RkQX9eSXeGv4?=
 =?us-ascii?Q?JztNcUaHXUSnZNzJbfaGL0+feh+2Gly0k9M6jY30vfHPE0FpABDrIHq7HqgB?=
 =?us-ascii?Q?VfUjB8xkBwiiuK0698UggUSkwEVrhOG+CVQFS80erE3A+lGxWpzxNsDnqb9N?=
 =?us-ascii?Q?8irNHSjNwRFTzCHbpgtrTCGPUy/tTVwJu9OD4MXxQe8Uf3ETmln/GEN9Au6r?=
 =?us-ascii?Q?jC8mMN0CSxtZhhRqNnIbyirPwekmnpAL44rycrI026+4FsO7ItQ1HQocKuvF?=
 =?us-ascii?Q?ehmGiEtRUOBrrSuuVgZLm2cvJ5VVlwQ08qUS69NWImGFbVUrT0BGKxmLYwo6?=
 =?us-ascii?Q?tYCSEOf96NDX9V1w1i6conTqYCHM2dOt5IvikiMI/dSeEkGm7KR5azdubBbL?=
 =?us-ascii?Q?encLCbCbUzJH/KramtcUdc8dNPTgK1TQE/WvY5uX+A5vtIslHehH+Z8Hc5Y8?=
 =?us-ascii?Q?7maZ3ula6CclpicbNTTpu2urMnuY17n/PCO/W5Hv+XA2oosWDeXRf/K+5giA?=
 =?us-ascii?Q?qFi5fYniLGJVNUotYIijO5sr4N+OrwcWgChXLQst3YElT8pkqMNfXZ2QdW1m?=
 =?us-ascii?Q?YhwbSD/+BuS9weQjD4LBPYuNEVPdnXkxsd6LM4ftt/v7t88mEjF+BICo1bNn?=
 =?us-ascii?Q?eIXL7caqyRMbgRcn9OH3R1QoZOe/LerNDq659rCaqw6MzCTkyP9VVTTzXZ11?=
 =?us-ascii?Q?LKnqm2V5XI61BYAa7omzoJH0aPbGanjzH0D+81ZtRL63rWxaU+6O/XuUpFcW?=
 =?us-ascii?Q?U62k3cYgYFC5HUWhdUI62R+PQO6J6v3tbAYO3aUVxvTohvU+b0pvH8VAsbPC?=
 =?us-ascii?Q?DweM0Xgv7ONiEjZZDOmkDXlMt5LOlNkOHVkVpAEIQ04wPdoPj2D2yqaG5a/n?=
 =?us-ascii?Q?tXkJ2Cs39nFcI0csHry8PeMgnHgJG45/EYM8Wii+PIl5ml85spSiMO4IJ1cm?=
 =?us-ascii?Q?IZ6hl0SXE9vE1pCGRslLZcRVY4HKSiQ2pUsdryXPWFQilNHlv43flqO+p62I?=
 =?us-ascii?Q?9UqkFfCAnrFXb3KXpAK0eJSrrk5YazspUer+fhj/ks+oOJofWgOATrDNdfKd?=
 =?us-ascii?Q?1sAS516yVvFXr2vKriQaSUycLjC4r05k2720BbCIjQKhgwF3DRfXvBuKmSlj?=
 =?us-ascii?Q?0IOiFQ+ok3MTQIvgZbZfUaGUn4Tt4HPK0zqlcCHp77fRwcCSm3iItg+7QP7i?=
 =?us-ascii?Q?bzKYApx8bZnh5MU22Ji7b60VP/kRuQdyesHY08e2o2NWA769hq1htV3Z3gcG?=
 =?us-ascii?Q?LWR9xBATkgyVPrg4zR+2H5ngGiAbpsZU2KQHEZqEAfzTAxBRSo1+RxxFciMt?=
 =?us-ascii?Q?xpsoBnGJ0wYBWhglNV4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:20.79.222.204;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:de2-emailsignatures-cloud.codetwo.com;PTR:de2-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(36860700013)(1800799024)(14060799003)(82310400026);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0059
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eefd7c96-563c-43f6-3ed0-08de213df2bf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T9KF2o2QTqfhTHfv36E9/TDdkrnx1fTTBDlYANDmnEm1O+if/f9A1TKjTwR1?=
 =?us-ascii?Q?QAXKLHHLnrFgWzqqrgJZDRD1j8wReVpFT7qL/SdG/iNiW3lATAhZv3PrfQKl?=
 =?us-ascii?Q?oj5ErYbO7FMvaQIBy9XPTLQ0RvqUn6oKL1gkF7pKSYiANoDCBOb7qpG1j57/?=
 =?us-ascii?Q?ScX0OOLj9Teo60EjVk2GmcNPQJVLjJCCOuFY6qpTWNapLZ5Shc4dDnZDgJ3g?=
 =?us-ascii?Q?FfD4leSOuq8UPVnpXy3TXl/ssjpluH/WeSkuMAw79onwQm38d63gQqtvP/PZ?=
 =?us-ascii?Q?vt4PjkxhSPDbUxyFDiR4FIjnZ+ZOBQXj/IyTklfH4vjWnle42Uk/kk09nsPQ?=
 =?us-ascii?Q?SBD4Xl/1fSXok+89JHqotzKMWpI6xi5194nrc0O0ZS69p+AFxcQWj2fi1VmY?=
 =?us-ascii?Q?m0xMX2y8d8We2rfeUbcnHdzWc+6UkP9w8w9BtNuwmkNsWFWpUj3cHqBS9ONe?=
 =?us-ascii?Q?XH/iwxI1Bd+PkDSsJ4fH3PEU8yY9QVWbbAPif1H0mcq7AkmeSYA7QQG4KY8O?=
 =?us-ascii?Q?ZkQQxqs8uqypqx6/OUBqaTAYLktVdrFgqQD4DM1xRSMtOLZtUdCJQ947fDg5?=
 =?us-ascii?Q?AXLPNcxBxpDH9aGUurXkTW6rBwCgSVfj6GpyGoV1Inp1NQ7vFs/TIzjBTcUl?=
 =?us-ascii?Q?Vf+FTCpwyshqaLs45fNrJAE/saZbNaGR7IvbcdbQCx6y6Lj2ueoJH0AvJ9I8?=
 =?us-ascii?Q?LYhAq9BKJDTqZ9wzryFSd0YqAa8eVeXhJMJ1tyXG+P2KzLE1CP5LhOpba2DG?=
 =?us-ascii?Q?qbvoUYIJ601MzLHqNe9u29MkeSccQmYZI6cg38LazZA+hzSo5optyB8L6r9Z?=
 =?us-ascii?Q?Nmq59JatGnDRA28BFj9qzo9o7GUuKdxECwMosFd6pabTgb2WLiVVejjFe4+O?=
 =?us-ascii?Q?NPMNlIPX0oGhfzcEotS1YnrPHbUly2lrwYwoVlK4F2CWn9vfUkK6JEQkilAB?=
 =?us-ascii?Q?EGtZNl5Eh5SS7UxKpBAa2oDdsV+TQrW8L0VE+oq+8sqYXeys4TGo0N1YBPaV?=
 =?us-ascii?Q?X/59SCKqiYYDhFctuSLKH9jOxufill3nJdnzb0ISNZPRQbunwsv99SZve3tv?=
 =?us-ascii?Q?YdnmR3PSVDojCGNUWVyI0RWYue3x/E6IfhZA+uwG0SQ7N4qYinBex4k62gDg?=
 =?us-ascii?Q?EIm0jbQ4V4PQkVL1gkGZMihxmeWdsQsyAGRPdW7LeK5C+CKKcT2Ajmdfs/UT?=
 =?us-ascii?Q?hr5mp8Ddp4PwkzNvSJsxRS01UnZYPnswQzmNs9z6nJt8e7+5u+TKYPTx6o9f?=
 =?us-ascii?Q?cNhvdQDUngHum7VJsSolMQsAxnk3JX+/cB1x6JI698vPGrS42j6ujUGgUs0H?=
 =?us-ascii?Q?lD1tDKgxR3h+Va/ch1HvxM8hlIr4acUytG+jzSYgqVeFGeusTg2uwrBFhRv8?=
 =?us-ascii?Q?dSqTMEM2ZvxhVKwrN7/TIkyxOCVIvhrlcJmsMwtib1UNrHtqpOud1lgXyIlf?=
 =?us-ascii?Q?dQ+3znxVcATV5jwgQFYHo1mobC3lsueXl551jQTJFkJoErVZZv7RQtF44TVb?=
 =?us-ascii?Q?lpvRtsu3eUzXHdysXIERG1H5J5E1utn6EHGm3V2xj/AFkwrunkDPxBDgvkfH?=
 =?us-ascii?Q?z3ZuAXOkaPvazeRdIo8=3D?=
X-Forefront-Antispam-Report:
	CIP:194.38.86.34;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:securemail.duagon.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(35042699022)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 16:18:31.3336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8eb256-efb0-4de7-d8b0-08de213df4c0
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[194.38.86.34];Helo=[securemail.duagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PPFB1AC99199

The 16Z034 and 16Z037 are 8 bits GPIO controllers that share the
same registers and features of the 16Z127 GPIO controller.

Reviewed-by: Felipe Jensen Casado <felipe.jensen@duagon.com>
Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@dua=
gon.com>
---
 drivers/gpio/gpio-menz127.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
index da2bf9381cc4..cddf16980817 100644
--- a/drivers/gpio/gpio-menz127.c
+++ b/drivers/gpio/gpio-menz127.c
@@ -24,6 +24,11 @@
 #define MEN_Z127_ODER	0x1C
 #define GPIO_TO_DBCNT_REG(gpio)	((gpio * 4) + 0x80)
=20
+/* MEN Z127 supported model ids*/
+#define MEN_Z127_ID	0x7f
+#define MEN_Z034_ID	0x22
+#define MEN_Z037_ID	0x25
+
 #define MEN_Z127_DB_MIN_US	50
 /* 16 bit compare register. Each bit represents 50us */
 #define MEN_Z127_DB_MAX_US	(0xffff * MEN_Z127_DB_MIN_US)
@@ -140,6 +145,7 @@ static int men_z127_probe(struct mcb_device *mdev,
 	struct men_z127_gpio *men_z127_gpio;
 	struct device *dev =3D &mdev->dev;
 	int ret;
+	unsigned long sz;
=20
 	men_z127_gpio =3D devm_kzalloc(dev, sizeof(struct men_z127_gpio),
 				     GFP_KERNEL);
@@ -163,9 +169,21 @@ static int men_z127_probe(struct mcb_device *mdev,
=20
 	mcb_set_drvdata(mdev, men_z127_gpio);
=20
+	switch (mdev->id) {
+	case MEN_Z127_ID:
+		sz =3D 4;
+		break;
+	case MEN_Z034_ID:
+	case MEN_Z037_ID:
+		sz =3D 1;
+		break;
+	default:
+		return dev_err_probe(&mdev->dev, -EINVAL, "no size found for id %d", mde=
v->id);
+	}
+
 	config =3D (struct gpio_generic_chip_config) {
 		.dev =3D &mdev->dev,
-		.sz =3D 4,
+		.sz =3D sz,
 		.dat =3D men_z127_gpio->reg_base + MEN_Z127_PSR,
 		.set =3D men_z127_gpio->reg_base + MEN_Z127_CTRL,
 		.dirout =3D men_z127_gpio->reg_base + MEN_Z127_GPIODR,
@@ -186,7 +204,9 @@ static int men_z127_probe(struct mcb_device *mdev,
 }
=20
 static const struct mcb_device_id men_z127_ids[] =3D {
-	{ .device =3D 0x7f },
+	{ .device =3D MEN_Z127_ID },
+	{ .device =3D MEN_Z034_ID },
+	{ .device =3D MEN_Z037_ID },
 	{ }
 };
 MODULE_DEVICE_TABLE(mcb, men_z127_ids);
@@ -204,4 +224,6 @@ MODULE_AUTHOR("Andreas Werner <andreas.werner@men.de>")=
;
 MODULE_DESCRIPTION("MEN 16z127 GPIO Controller");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("mcb:16z127");
+MODULE_ALIAS("mcb:16z034");
+MODULE_ALIAS("mcb:16z037");
 MODULE_IMPORT_NS("MCB");
--=20
2.51.1


