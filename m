Return-Path: <linux-gpio+bounces-20273-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E25ABB4B6
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 08:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1ACAE7AAD3E
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 06:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CED20E32F;
	Mon, 19 May 2025 06:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RlHvvevC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9876C20E000;
	Mon, 19 May 2025 06:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747634525; cv=fail; b=pQL8eBxi6pt+b1rypAhx8rsD7zHTo7Xwy9K/slFr+99uo/Fpy1EvLsdilePCh84nBgFT7Ikks3v4SzbzC27k8F6uNEvdbUg9FTsd+/Sby8FYg3FCYq7YdFJFd7Qx4fnFp5+QoVPF6nBdQqioKdr6sY2qqorK5gYwEsHNEfZ+bac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747634525; c=relaxed/simple;
	bh=qsa1Xp6h8D/12L2zsDSkDHr/Jkg01/XZomK1MN7Q9C0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=inysj9DgNQol0tM2EVnWNxyviAsGZQWj2iJXq58legQgmDVnkb6jCyp3auZlYEOWhg5yvIwaRDdGnbksAf5Z4b5s73w7Sh1or97DbiVYxODsrLxklIm+nHL2yEHW14D3MfbXFRGAdtPn/vsBb3gi/w4JElHZtjRAWWJMzdZiZFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RlHvvevC; arc=fail smtp.client-ip=40.107.20.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyD0a9jTPJSJadVgUDSlvCB0S/8FCm+xgQpe8XKlbWRPlOnT4N90WH4w0IknZg4EjatuQW0iE0t0um+pD5GRDx3wHJ9zJ4t4HM997yax5JuC5AnR515sc+mIV8xndDAYhAUmS/0OH/jmZua9FznJ1+F+M7QJlP/uefNp0Qljr/412zskPM7wwnZJZgltZ8lguwHkRUdg9rFpiasKPnTb1gOlqvcXSdrX2a1De1LpF2VUKYQRPS8+7fBZlTpW2ZD6XOwxdyXwvRFZf4vDcRjRU3yvTyWHEsK+yjrBt3aNo6y5izfj4o9xdNlpMQU8VX9leiD8riKJmTM0clV3zakRNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTaS7VB9lTGCoBbEgQzCv1XNuRFMIV4u28f5NVY5HX8=;
 b=PNWwZXSzc59nOhttH1RRArVnwZPAqqLZidRa/5GV+cV8G8r1zzpbtkKM7frXHjmWdhN+WeBV6vmZx3I0bplt5u1S0H7515T0vvHD9enM90R/peXlRCs4nflzLwUATcWWFU5fjc++eUWtSzVXB+p5FzfOZQqaIw7FwiuyPVbMw3q06orimr4PmX5Rz1D8D11qPx3HUtYbs+S/eDrbf6nfFakooCeeI20akOHTOwzCiQDesjvgR934/96uXtPj8y+csnmRI7RqnnUkW7MwS7ENlvaCANEpavONjc6X4p+EQdLPC0w9VcKj91OiFTwiCDiSsqOcUqLutm8UASFgykktlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTaS7VB9lTGCoBbEgQzCv1XNuRFMIV4u28f5NVY5HX8=;
 b=RlHvvevCt1GsyPOru+SpgcgcWd5ULaQqBoegoz9Ns0Th9w7X4SaDlf7fcbnLzdn2a7x+sD73iYpAuSe/aL0WUSDT7LqYrlLMNfAiv+mQKR3+KBS6EX0l1ftrhoR0KqAYLz3C646iBmGfageZvAWtB6K9fTL/X1yIhQV2Z9PjPvjncn78XyHlSC/c8adoNuKy2GGAbk2ZHNi53ZSzkJPv4TWnN7ZXPLBba5blrtZxpsdOCEVMAJaxAkek7ojY4R1z3m6j/y+4OYDIMzow8YEuwLILtfByHIKgj/sCBbwXlA5bCF5WyTtOt9DMp0x1jxaQ/LWR+7AW1BfqyaodZwNjUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS8PR04MB7686.eurprd04.prod.outlook.com (2603:10a6:20b:290::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 06:02:01 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 06:02:01 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Mon, 19 May 2025 14:03:43 +0800
Subject: [PATCH v2 2/2] dt-bindings: gpio: vf610: add ngpios and
 gpio-reserved-ranges
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-gpio-dts-v2-2-b9e77173e9c5@nxp.com>
References: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
In-Reply-To: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747634649; l=797;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=qsa1Xp6h8D/12L2zsDSkDHr/Jkg01/XZomK1MN7Q9C0=;
 b=FeCS1GGuQootDe/gKsdS9QFea31FOA5I29lC7AE/c1M3b/aFDQC3KDFqhAll+UBhhSDPEGaZT
 tUSPPe0J6j5D5XvXzseTuFXREQwOV8EE/167Xl/fPT5lI1NqHYRNYe/
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SG2PR01CA0191.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::6) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|AS8PR04MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: 75301c5a-8b2c-46ea-c09d-08dd969aabfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkEvZlR5WlVpeXFJWUZKb1I0UkFZaVdxTkUwelQ1TXhaM2VSWW96NEFxOGRv?=
 =?utf-8?B?bFJpRVBUS0FFNzN3RE9zenl1eksvQWtHcjdrR1VNOUg0cTJyT0w2bklrbmNP?=
 =?utf-8?B?NkpxNnRYOXI5eWNwK0I3eGJlV2tKNFlBMHlReTNqZ0dTZFRDSWpFS3dBUFcx?=
 =?utf-8?B?QmUwUndaZXBJTmxvY29oT2xGZ0x3NTA0VHBnRWNCL1N3MHVlWkJaVkFqNnlW?=
 =?utf-8?B?VmxlOVpxT1dGeUtaU01IRExWbFVneW5hcERMZzIrdzdKMmpVQlVsSFNSQXE4?=
 =?utf-8?B?SGFDZXp4eVdybXJrRlVMZkRKMnYzb2JMUlJWS2dpOXdONDYzUTBzOWdtTmpz?=
 =?utf-8?B?MHpCWERDTG96MW96UFVMQU1la1ZSZWtDV29oenNIY09RcTNzL0hqVUVrZGl3?=
 =?utf-8?B?QXArdm81dTBhRDhvcVZWSzA5TU5rcXJoVHQ4YmRseC9VWjZJSVZVcE1ZS1FY?=
 =?utf-8?B?UGIvM3ZCWHBQOFU0UG14Y085M2hZZDEwSGYxWVMvK0NFRUtHclRHOGY0YTc4?=
 =?utf-8?B?eFFxamw2YWJwNDd3YzZ2YzNhV2k4RHNIRXcxR0gzeXFFZTE5bjVrcWxYTFdo?=
 =?utf-8?B?amNXb3V5NnB0dFNQR25mOUVyR3FGSTRWMVRnOFB6bUJ4cFd6QWJYWFZndG1W?=
 =?utf-8?B?akk2VHRaUnFCbm1CUlo4RlZuWmpnNDJiNHkySWlDZUF0WllXZ29UYkxvTnpO?=
 =?utf-8?B?ZEtMRDFTQ3Q0NHgzNE1sNW9lNGN4cnZTMVArRnJmOUZ1eVZhTG9EQmRMSFNO?=
 =?utf-8?B?eG5nbGJoeGU1SUpGaSt6ejRIWWdTUmdiUkQ0eXhVYll6OVErcTNMT1l2b3Ez?=
 =?utf-8?B?SCt1WVB2RXI1VjVSUUhUOUVsbHhlNUgvSmlvaXVQdHJQL0pLQ1lyZmlIRUpX?=
 =?utf-8?B?RVQ0czNYT25tUlN3Ty9nc3E1UXllRTZzb2xaczk1Q3l2N1Z6b1VjeWhQKzU5?=
 =?utf-8?B?cUphRXJTUEtHV2NqeGdESTRjUndQUTFxeUtjdG5hbm5WNjRlNHBYSktiK0lH?=
 =?utf-8?B?K1R0Zy9sSFdxdjY5anM0KzZwSVNlTndycmd3S2FzcXFqWGIyWlQyaDRDNnhx?=
 =?utf-8?B?aHRMZVV4clJ6T2ZmZ2tzdU1UbWxpdzV2UERJMjc0MG1ibDhEVENIbnFFcWV2?=
 =?utf-8?B?cHN5dHFpVU96ZHMwU0NKOFp2UDBLUmJLbU5aTU9yU0dPdk50TkdFV1I5Mjhw?=
 =?utf-8?B?WElmb1JpZVh5MEMzNitBcktqejFMdWpjMmdyRHFRODhnSmc1bUkvSzgvdUpF?=
 =?utf-8?B?b2hZRG03OHhsWWdNR0o4M2psQmMzN1F1dGw2b1dsT3NGWGw5MzV2a3djc243?=
 =?utf-8?B?U0xmVHpPMVRJUldYMWM3bEQwM1h5Vmh5WGtyNXdoeEVkK0pBTFBoeU56L0Vz?=
 =?utf-8?B?c1VNL0NCNXIrUWhsM3hQKzZ1UUduNmtMTzVyQXcrK1ZrbGV3bTVGYm43M3A1?=
 =?utf-8?B?ZVlpaGVRNHU5ODUzRld2TmR5NENVd3hoYlo1UHM1RFVwWG1Zb3ZRejVHOWdI?=
 =?utf-8?B?ajBnbE1SS0JNUDNaRFRkT1kycS9EeEswdi9oT1MwZC9ZSFBqYitoN2pTYTNU?=
 =?utf-8?B?OVhyblZuRmxpR2lCbkMzZHhBMU9xd1ZEQTZuek5CK3RJMzMybFVRV1pJeVZh?=
 =?utf-8?B?ZERmbWZjOHVNc1Q4aVE3ZnVGNDA2TVVFSkNZVG5kQXdYR0Vsc1k0K2pUWlZ6?=
 =?utf-8?B?Wk5FaDRzTUdobjdBdXFEWnIyWldQMWs4Q293dzl2MGc4SDBObHVjMElRb0Zy?=
 =?utf-8?B?UG9GZXdvT05CZ2xod013bXI3TzZvK2dGWVNkbXlMR0JKcTEyRjNuZkRZVFhs?=
 =?utf-8?B?MXFzcWNnRUQyZW5rVGNXb0J2UEoralNGNWkrOERiSUh0NUg2dUhRY2JpeDFx?=
 =?utf-8?B?OFlCVm90UG1Vdm44cHl1V1IyckM0QWE1REp6cnQyamxQNE5vV21jR29xaEZq?=
 =?utf-8?B?dGZ1WnYrUnZkcWxwODE3Sk9qNW5yeW9wa1QwQVJPalJIOFdieUtMMnhPRC9t?=
 =?utf-8?Q?2hmoP18pApB9D6dTubxk/bkzjkLDxg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3NnZHlXK3FEcDdsZUxtMEdKS1dQa3FDVysvWDVSYnVnQ0ZRU3gwd1N2S01W?=
 =?utf-8?B?TmFPdnU3RGY3eTNWaERuQ2UwRUZHYzU3V1VtTGZSNWJ6ay9ZUGZPOS9YWGJ0?=
 =?utf-8?B?dXNlOVZSVVB2YVkvR1o2dnEwNi9OR091ZGhheG4rOWREd0NwaTNJZ1Q1ZDBn?=
 =?utf-8?B?WnQyQjdENXZSeWZjWjdCVnBQUS9oSk9pZWlMQXR0QTJNak8rWVRsZHlJVVBO?=
 =?utf-8?B?eS96UXNqRkRGMTBxdzNTUndCdHN4WGpzVzl0SHA4TG5zWWllODZnaEhLTFBQ?=
 =?utf-8?B?TFlGVVpUSGM5bC82NUc0amdUczVkVER4eXI2THQ0UTFPV05COVVuRE9JMlUz?=
 =?utf-8?B?bTdUSnBUcjhrbkFpR1pFSGNoT3hyejY2NVBXUnJTSkhLQlZ0OUx4MlhQdnZh?=
 =?utf-8?B?NGZCTTl3MWgrcGJqb3h1QUZXM2dJSm9kTWlpdFhDcjEwTVVsQWFqL3R3OHQ0?=
 =?utf-8?B?enBtQWxrUTRpTVc2Z0o5S29iVm91U0pzSzhhNTJOOExXOGk2TjhVa2cyVEZZ?=
 =?utf-8?B?U0RkZTRtbUVNdmIxNmRsalhpMmlpVUpSNGdwSmRGQVBzZlUvTmQrS3o3Yzk4?=
 =?utf-8?B?ZTQ3a0RFNFRHd3VRSlZDN1o4Slk0SjJuaUc2L3dkTjJRQ0NXMXdwQk80L05t?=
 =?utf-8?B?aWZZSDYyM21NMXJCVzdCSDkzZ1RLY1grUm9YeXhIREkyR2l2QzVGbjZmclpB?=
 =?utf-8?B?d2QreU5XYTZ2bmtLZzZPQVVqMjRIVjRLWXV2cFZXWFJCNk1sbml4alBjbFNu?=
 =?utf-8?B?VEdqbm9iVW9mUHFVTlg3OWd6Z1lZTEVicXBuRTlQVjd5SnFVMnhRemo0YlY2?=
 =?utf-8?B?bmJZTUF3dk45TjhCc0g4dkdLTHdWZFl6aFNpKzE5eXhqcDhOeHV4L2JmSjZ2?=
 =?utf-8?B?VTVUMkwxYUVmQko4ODVaUXVqalpaVEc5Qjl2Ui8zR2VaNHRrMnBwalpaejJn?=
 =?utf-8?B?SW52UWZOZDZnZTJmZTBZaEt0ZXBNWjRnZE9jbXIzRVBvZXlzYXU5WkFjYklv?=
 =?utf-8?B?SDBCelVYOENFQXd2SytsTG1DanNpOTF4VFJvSEwyUnpMQlR4VTU5S29xTEVx?=
 =?utf-8?B?WVkxYVB2QVRYTWZSbFllbm1PZVpDYVBxWHZyK3l4dThkczRwQ2ltZEVhS2RC?=
 =?utf-8?B?MVI3aHlPMzFMVTk2YXkxZmMzT093RkpndWNReHNnbi9PeGNoOUxMMUR6ZDFx?=
 =?utf-8?B?SDUwTUxBbHlrNDN0WXBlT0ZpbHVHcWdTRHcvZ3A2d3JTZ1hEcWEvYytBcDZa?=
 =?utf-8?B?a2NtbERDdHlGK2pVYXMyL09ueWlvTWFEZStaVlJZUDFqemtNZXpiTis2eStv?=
 =?utf-8?B?dDhUV3c5b3p3ZmZMcWc2eHBTbE9LV3BROGE3VkhBM2lFZDdtVGUrY3Q3bnBR?=
 =?utf-8?B?UnBzMEsrMHUvbDdMdFhaczFqb00wYVptYmo1NkF2dFF6WnNDbDd6SllBczdU?=
 =?utf-8?B?WTd4VVNPd2tBcVhXbCtiaEp3WGp1V0ZoSk52RXh2OXZXK281WW5GcHdQbGUw?=
 =?utf-8?B?M2k3UkNoU2svd1NUaU41WmhsSDJ2YkJNUXJQQkRSZHA2U05ZVWlmdmpFMmFT?=
 =?utf-8?B?WmxZRTI3ejk0RnUrTUNDcmJrUFVyTGJndTNwM29XVDVzZW5TejRxQnByU21p?=
 =?utf-8?B?bFMwa1NqQk9hTDFuQnA3UENtNDZPaTVudnYxcSt3ZzdXVkF0R2pST1B0ZVJZ?=
 =?utf-8?B?OTVJcGdmN0JmRGhtN0dnMGtlRmtOMWRzemJaOWRtM2V5OVQ1UnhycGRkN0Rs?=
 =?utf-8?B?Y3pTMngxZEhrSktXT2hOUngxeklveDRVV1dQM21DNFpmRUdRRVd4enU5R29x?=
 =?utf-8?B?OHlPN25jUUFpVnZ3V3JlYTFYZ2Ztdm9qMTBhaG1Ra2ZmYVFVWEZSSWZaaU4r?=
 =?utf-8?B?cWNrUlM3UWdVZW84ZUNZenl0eldIaE1YQW5PU3FIQ3pTRUVlSldDOFJrQTcr?=
 =?utf-8?B?SWtOYmxmTUtnaVBVWURiU0xleTFQdFhWM3djZFIvemVPbUVKNm1BbzhuNDho?=
 =?utf-8?B?K2NodzVhUGl0aFo2RmM5Qk0wVzVPRUh6Nm80cEZyTUVESGZncUowaXA2c0tQ?=
 =?utf-8?B?Q2U4UnVrcks2L3JQZFlFY00xWEVTakp1bjlKc1NPTllXNE5jWGJxRTdwMHVl?=
 =?utf-8?Q?W2ZKi/otTPX2uhu0+zL98Yqnb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75301c5a-8b2c-46ea-c09d-08dd969aabfe
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 06:02:01.3073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5TsZqQ83tdrna7Az+mMfP9vl4C094Zir34epMd6ZHRngKsVYuLQQjZI4WcyJpmvXCKDhYzmytefXgE2319xOGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7686

Add optional ngpios and gpio-reserved-ranges property

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
index 4fb32e9aec0a341a50088f3e4352ed4d36f649d3..5b98228466c6414be681c49417bbdd82f2c45756 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
@@ -70,6 +70,12 @@ properties:
     minItems: 1
     maxItems: 4
 
+  gpio-reserved-ranges: true
+
+  ngpios:
+    minimum: 1
+    maximum: 32
+
 patternProperties:
   "^.+-hog(-[0-9]+)?$":
     type: object

-- 
2.34.1


