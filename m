Return-Path: <linux-gpio+bounces-9246-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6022961C61
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 04:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1A43B20E93
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 02:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE8282D91;
	Wed, 28 Aug 2024 02:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="TgLtbNGN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from outbound-ip8b.ess.barracuda.com (outbound-ip8b.ess.barracuda.com [209.222.82.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1C0482EB;
	Wed, 28 Aug 2024 02:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.190
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724813534; cv=fail; b=Nh7I1qB4LZZ5rElnGhzmJ5syzMXPnD1Epdnz3MvlQlRU06st9wshteIq4IaHHreDVeJr4THynXnDWW1ceNNS81H66cIIsamBrLgqnRM78pd3ruDjjYR/al4KGZpmFzry5bM5K/fJMPcFDdAu/aeDmCMfR3QIT7gN13DilQZKXHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724813534; c=relaxed/simple;
	bh=1JmGrimHF6dzu3D/YzZ/a69LgSBQ2PMzkb4ByI4nBqg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=YFFIQGZhbLUtAMEqi00/jF7xFsKhakskiBJDJy8goKQZlsI+1I9Ea+MQbMGNl1alHzlGXdUdJ4P0o33VDqVjuf5fnf7cGc/sO/5I3RtOMrykvfIE7YEzUj8ZnoRoIsPRZtB7af7fPOMwY2T58pflOIzF+5KYsebpdBbvwSDYkMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com; spf=pass smtp.mailfrom=digi.com; dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b=TgLtbNGN; arc=fail smtp.client-ip=209.222.82.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41]) by mx-outbound17-239.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 28 Aug 2024 02:51:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUrFv0QSsk+6EJztW97pTBr/xO/pzvfaP2pC+7ePnb0Mvehy0JKmJkirmLpmlNBgQgDUgFh04navO0aj5ia+ajGhtcKNRGa69402mj7DbCVCxV6I7kcQ+vj7F6v+NJUfIYhYXssG4Bbfav+D8spEcjo55d2ybOjuvcb/KzJXyOHWku8GM6XBLqzE5JDrugCCukAwEQlZmTDx9qcphOqQjEZCuFTe4Gsn5MwDd1cawQUPz0OpfHlvz3BkYP8wTvP9kvdwtFyFlzgQ3KUTrEPtr7Ls3fdfAGI8A555S0YDdZfMNQzu/+w+hBoLmblPuF/Pal6NC8dE870AODutNIl7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0Sa4Pg8E8QRxSnVNpNp/+bEUK3YZaGJYw4Uexnw3kM=;
 b=XG87NK9/PMxSOvCtnjzw9hVtMB3+YmhPeJI1a6lZURFMNAQhIDQk43I0pi5rTjcjeF+U360VazvHq2U2kDL4JYwmBs01NPoZIjKI8hS+exARO61jmcNaH0VS26Zh1rRL6oUJU+17c9blEMpGNzB4acvPowVMqtAR9uRzU4Aj6IeQyOceSmXZtdOSAMPEAxCPkfDkc+QgdhezCkBNCYP8O9NOeR1aBueHzZtlWyNBu+Q5nf0mtNuQVTp2dscokaT1V6ZB3mQbC0HucFywugoFfj+3mLgwJDFCAHEb3ylIgeTYayxcGSOJ66G/QvJxKZG81lVSaq9ClD0rcqarAI2iwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0Sa4Pg8E8QRxSnVNpNp/+bEUK3YZaGJYw4Uexnw3kM=;
 b=TgLtbNGNL9pPfnRyHYbJGBc7mtRMp09lOjPK+H9fJ6cceXvgGuSmi3L6QiGBQw/DZ2v0/EnxlSB8ECEkqvIWEVxtaaciRKUOkM7THLkQP8JM5wX+pPVyrGphBVxRvbXqL/hvdXGliWdtLh87ayqUuVusZEpVyRzdlxB1sMgyKfXox9rXQDNs3Ux6DBhZaZF8CA9P9HzlExAZ5Pu/Sz37gKNsVDGD0eO5ovqaSW8E2sWK32SoqX7O0PUKNFpYV1uXUXmBHOzrRH3cI+jvv1CficMwSnUMxrTOiFdbU8xMnrFe8YSSzJVZJRswc5v1727KmD4nLzSdBmNKLpuZnQZmFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from DS0PR10MB6918.namprd10.prod.outlook.com (2603:10b6:8:136::8) by
 DS0PR10MB7128.namprd10.prod.outlook.com (2603:10b6:8:dd::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.14; Wed, 28 Aug 2024 02:51:39 +0000
Received: from DS0PR10MB6918.namprd10.prod.outlook.com
 ([fe80::3697:c0ef:caee:24ae]) by DS0PR10MB6918.namprd10.prod.outlook.com
 ([fe80::3697:c0ef:caee:24ae%5]) with mapi id 15.20.7918.017; Wed, 28 Aug 2024
 02:51:38 +0000
Date: Wed, 28 Aug 2024 12:51:24 +1000 (AEST)
From: David Leonard <David.Leonard@digi.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
cc: linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>, 
    Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
    Jacky Bai <ping.bai@nxp.com>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
    devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: pinctrl: Add fsl,ls1012a-pinctrl yaml
 file
In-Reply-To: <6ddcd97d-7d60-8e4f-fede-42bf7f99e2b0@digi.com>
Message-ID: <557150a3-aef5-40e7-d656-73ca6bba5857@digi.com>
References: <a5c1eef7-372d-082b-066e-ecd5e001d1cf@digi.com> <pywfy4ypttq7y2llfkdgkwgpjfvnzk3lcgd67efp2v6qu6f2it@fdgiw5pac7uz> <f682476b-f7af-0d66-7105-1d064f5f1739@digi.com> <db12d221-d3b1-4df5-91e4-d31fb0acdb8b@kernel.org>
 <6ddcd97d-7d60-8e4f-fede-42bf7f99e2b0@digi.com>
Organization: Opengear Digi
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-ClientProxiedBy: SY5P282CA0103.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:204::9) To DS0PR10MB6918.namprd10.prod.outlook.com
 (2603:10b6:8:136::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6918:EE_|DS0PR10MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: 07222197-3b4c-43a9-3f07-08dcc70c5698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GDBjq0NO5axn8TsIVe1iuO0sBieQEj0yrA0w2h0K8yVZktov5hoHAb2T20rF?=
 =?us-ascii?Q?WcNOjMri2gN2VTh7o0SUIBXfqE7gP1lpjbIRCofAIMowfHkkhRP5DPDv2CFi?=
 =?us-ascii?Q?/miQeIZ/gBNIWV2det4P+Z3Hf9YqU3ovrRmD6LZLjcB7lxFWdDDc72187Ur2?=
 =?us-ascii?Q?CxpgVyiHehcXAAtkRotriGP257ZVvV8sa3yS+0IM/GJ4fYLHhUaG9/f5t1Ov?=
 =?us-ascii?Q?u/5YbHw+/6S4mmjKuToyzk5hPY+jfuNOkiNEvogRjy6u0K9fCG6cSMwVE2YN?=
 =?us-ascii?Q?wjnA0V7O/iJ4rAD+Xie/q4hNOaFiKBQ8UMdV0k5LwkPnCJ1eNDp03/VhEll8?=
 =?us-ascii?Q?UgubhNdErSknmBNnwpycyx2HpKXLihD9ecMhdaUCOd/8jVbzivUDM4MqA9UK?=
 =?us-ascii?Q?6DAu87TYCBz7E7J4YgbgdtL2oNORNj/xAg5l2myRMVGWotAF+naCLdAoJYOb?=
 =?us-ascii?Q?y/xadsWjCgBuFBZxLDZxiFGgoDVyQw+fxZ4UtDgIxXribBiRXYkd/CyRrmFM?=
 =?us-ascii?Q?dKU4BxO+Np4pzLE48NgJ1DSVw+FzG2PqysuJsKiXEgk1/Bhfp85yqSZ9Fx80?=
 =?us-ascii?Q?RkpNBHpEgJF3VQ9WneqvE8jIH38z7a8fIb1HvDDdRk9HhKXv8Ay/mpQhWXzY?=
 =?us-ascii?Q?i1bRq8id/xx9cjuOD3dYlB4gMUlFg8TtYq3r23CN8eE8zQHceETJC1MyJIYW?=
 =?us-ascii?Q?HC6DpZGUwzkPR5EQcvjaX2Tz81d9xjB2UeeMXI9enu8GeR/ApMhDFqGBMZ/r?=
 =?us-ascii?Q?5fvB8w4BdJGF6WdTWUWJTBo1DVXyLjPdmlw3hRQe00f1OllQx6sTbGed/HJs?=
 =?us-ascii?Q?gs0zcNmaliUVuzFr7InR+EhWlG+WunA/1BV59P+u6YsecguNwFHgK1WlHWkd?=
 =?us-ascii?Q?M4B617HXnSpTbbVlhOi6H1aO/sKtzjN9PjJKBnswuCfr0rrALesdao+iuE+P?=
 =?us-ascii?Q?cy/bqM8fltvElnrELwmWNyJuWzLFUk4YpdSWnYimB/FgqyG1WEMq6ofYGzxn?=
 =?us-ascii?Q?GM6LezjIOPhdtl5DD0ppwHrvOMsP2aHeMEruzKQho3rOztW7Lr3azuDV/wuL?=
 =?us-ascii?Q?VsXviCnmpcqVUO3WSKaHHpjFHWNmbUXMsQxjh2SipBEK8nPBMOVG9H7+hbLR?=
 =?us-ascii?Q?IELD9dEUqC3PqY9hUEBMRbbXWqQBNwH8rIITMSo/UHSSmb5VIbzw/xDFeJjV?=
 =?us-ascii?Q?cIp6KKPQMlfiyi9wY5t4lFkVQyuYeB+NZML3mb5RuZ3jyysnqvn9lC5Sg26R?=
 =?us-ascii?Q?wP/C8WsMwZF1urnzwckXjrQETbde2t+YuR6xz8PZoxDvnBfQS8jFGb52P8Iu?=
 =?us-ascii?Q?KTY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6918.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e6lQH9x7uOktCgeVOq9xscM2cauihOZMhsAVPxK6tgbr3cXuMkeyogfLlEmR?=
 =?us-ascii?Q?VS931BtgPoJS6KttMNjmuvBRy66UcrUcEqXaNfC2WrgduiQKgNU/TkOZrWwR?=
 =?us-ascii?Q?f6PwgO0qDi1/o8nydXRCGkxjm7FMzfuWarHiHZ8AU67nVREHHnAOqLBIlL/c?=
 =?us-ascii?Q?nQa9K8V14NubwGQBzLVucoiUxfGITsdcCkt7gcGRLbPIZ3RiSzbzuf6SNOy9?=
 =?us-ascii?Q?p0U2aSeKv7gX1ywqEyMQnEZnplsSgt75fWvUH0rGa2OQI63qy85mEL7FuwGf?=
 =?us-ascii?Q?lUuN3Rf9ZWJAtGHNOyBVTBtQ/5b8kxjhbefe5RVAwt5Y8JMs6tAdipVmBFhM?=
 =?us-ascii?Q?RM3Zwa7msKtDZ18wtLcXfKeEdAtwSSs/9u1XPhXl2qbw/rX2de/4OUJmfGpA?=
 =?us-ascii?Q?56Ik4MxlKs2z6Y0Wg12R6sbbS1DPdS6KWZXbtVa8qZlNlfotzCvOr/4ZWV/N?=
 =?us-ascii?Q?FBPEY1tnkCxp5+XssgkqrtW8rtIdfmpbXIx7JbrmNEilWujgza5zQbi+syg1?=
 =?us-ascii?Q?jT9siT4cnXMNxCAAVLA0tk7y/zsX5gQ6rQO1uEv9BoVTCns+vIFJT6OYn4zD?=
 =?us-ascii?Q?5zRksivYmkdmkwjzuoR/AXBl3wm5tffGiWzVr0YZ/e2P9pGJhlrr+BXvfk9y?=
 =?us-ascii?Q?gXC/f0ya65C9lmdks1S/zB6GsKqcf4rWQpwHJFbjzWkl8953Tu8l8kFN6Xhr?=
 =?us-ascii?Q?dJtxjOnmERPUI7KghOAj604oL8T0KW+GsPywD7a0wtNRwNJMM2kgL5LkdQql?=
 =?us-ascii?Q?g44td20EniNRRKRr3baCJhPgtZCG/D34QLQu0UrgTHDUCxvbx216RKNBMCYR?=
 =?us-ascii?Q?nsNhLzWA2ne/W2Ht32jcv64F34bfBA0s/MHwtOaepHRbxTzPvJFLXO5mkQkm?=
 =?us-ascii?Q?O3ijQ26WA0UjidkEAbJwPmKBaSzLtPC/VZcMpcoy9xfcxPn4DUnJDQDq+YIe?=
 =?us-ascii?Q?Fr4V1FyV7lYM8vOa0H9Om6DFpAmzY3StpZQ4CPJulmUBzcrXzlDb4NEMeymP?=
 =?us-ascii?Q?2QjKjIGjEgGhgaDVTB16aMh25rMwTb62e1ps2QAmsXdaqxIgQBmMs11COMg8?=
 =?us-ascii?Q?rjU87XKOW00kxsdUb6bbAt7Z0qhh/2AJvguOF9VQEKJb2C506MHkomXd6MMJ?=
 =?us-ascii?Q?VlOtH+VlefdAcnqTbpS0VNrV3zM6ijwM2hVJt9A18cRvp8AnVkQo8fQvNhoA?=
 =?us-ascii?Q?tqapgiRoikHNWdjRIHx1ItH5BPV6kzH1vVJLvPQpvtrCPB/rAQTWCKcq44xS?=
 =?us-ascii?Q?eNXFsbR3M4uZXLK37jNtiyNw0cxnGhMj/foNLkE4cq5adDp7yVZRqcyNi+Lx?=
 =?us-ascii?Q?FPkiMF/+Ak26981wMUCMBNhnutWDUFO971cGPnP3Hv6oVb/e4+uPHAE2xs96?=
 =?us-ascii?Q?MwRO7HZWuXxd02GvYP3UE1AfbNgg5alemwwzcK7H6rBSxFyWGrj9LxzMVP6g?=
 =?us-ascii?Q?MnsIytJBf2FtABW6SeGmBykCFuRRSTfDCkSP0Z+Mp/QGuPThCrANfhAHJueO?=
 =?us-ascii?Q?3KPTyWWhySV55XAIaGhUDcKA/D68l0GSeFLYXQkFUthRIBJVykkcPG95oc9S?=
 =?us-ascii?Q?QVOCDbF4Y+Y/s3KsZQ5dhe/Spe1M67aGVkjcHfAW1jlLjw2gnQKmfQGlAhb7?=
 =?us-ascii?Q?wGMWG7yW6ou3rjt/UrHr9aID6pZTVVugXq4CW2oUk7tm?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07222197-3b4c-43a9-3f07-08dcc70c5698
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6918.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 02:51:38.7585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iIv3vvKBHjT6FEuj/mMCLuvRhgKQuwdOmOL1lHWGE+ONuXXJYHkKu0LtL2PG5k9WwHeIYaf4bMi41mWqN2Y5ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7128
X-BESS-ID: 1724813502-104591-14060-28549-1
X-BESS-VER: 2019.1_20240827.1824
X-BESS-Apparent-Source-IP: 104.47.57.41
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVkYWRkZAVgZQ0CTVwtAoLdXMND
	nNIsXMwMDI3NIiMdkwxSLFyCIt2cJYqTYWAHCIYt1BAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.258644 [from 
	cloudscan12-18.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

On Wed, 28 Aug 2024, David Leonard wrote:

>> OK, but I still wonder why is it here. Without it the hardware will work
>> in little-endian?
>
> Well, it's here firstly because I was trying to follow a perceived convention 
> in
> dts/freescale/fsl,ls1012a.dtsi. That DT uses big-endian in child
> nodes of /soc that match up with memory map tables from the datasheet.
> (Not only do different and adjacent parts of the register map have
> opposing endianess, some register layouts also seem to be reversed
> bitwise, others bytewise.)
>
> The second reason is practical/dodgy. The pinctrl driver should logically
> be a child of the scfg node, but the syscon driver doesn't populate its
> child nodes. To get the pinctrl driver to work meant making it a sibling
> node with an unsatisfactory overlap with the scfg's address region
> 0x1570000+0x10000. (No driver binds to "fsl,ls1012a-scfg".)

Sorry, my examples had mixed up some ls1046a with ls1012a, which
must be confusing. Corrections follow, should the meaning have been lost:

         soc {
                 compatible = "simple-bus";
                 #address-cells = <2>;
                 #size-cells = <2>;
                 ...

                 scfg: scfg@1570000 {
                         compatible = "fsl,ls1012a-scfg", "syscon";
                         reg = <0x0 0x1570000 0x0 0x10000>;
                         big-endian;
                 };

                 pinctrl: pinctrl@1570430 {
                         compatible = "fsl,ls1012a-pinctrl";
                         reg = <0x0 0x1570430 0x0 0x4>; /* SCFG PMUXCR0 */
                         big-endian;
                         fsl,dcfg-regmap = <&dcfg>;
                         ...
                 };
         };

> The better device tree would be:

         soc {
                 compatible = "simple-bus";
                 #address-cells = <2>;
                 #size-cells = <2>;
                 ...

                 scfg: scfg@1570000 {
                         compatible = "fsl,ls1012a-scfg", "syscon";
                         reg = <0x0 0x1570000 0x0 0x10000>;
                         big-endian;
                         #address-cells = <1>;
                         #size-cells = <1>;
                         ...

                         pinctrl: pinctrl@430 {
                                 compatible = "fsl,ls1012a-pinctrl";
                                 reg = <0x430 0x4>; /* SCFG PMUXCR0 */
                                 fsl,dcfg-regmap = <&dcfg (416/8)>;
                                 ...
                         };
                 };
         };

> And this would resolve the big-endian property issue.
>
> There was a discussion of syscon populating its child nodes at
> https://lore.kernel.org/lkml/1403513950.4136.34.camel@paszta.hi.pengutronix.de/T/

