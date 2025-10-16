Return-Path: <linux-gpio+bounces-27216-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 021E4BE4775
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 18:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F0CB3A3493
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 16:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014C232D0D7;
	Thu, 16 Oct 2025 16:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GbrTAVAD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010054.outbound.protection.outlook.com [52.101.84.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F5032D0D5;
	Thu, 16 Oct 2025 16:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760630731; cv=fail; b=slL58234nT4Yj1FfM3hxQDu7Znmh56fRlkgfGLkitAYtak8wyMQU6x1U4pP2cT9bCRspkWBUHvwZCgQsMF/BAyCU1+pkfb8IKQ6hxI27+XHcVMl2G7QwLkaBtdvrCYIyHwNCnqLBNbBJ67/NJIT2pGGUBaYn9TV/Fimzgoud3Eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760630731; c=relaxed/simple;
	bh=Sv4gjcV0LwThY09EKKv0U3TPkhiAajVASvEzHMlu2D8=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=dkkwbMZkaymeXT+acGudBBETQRWc0d9eJr3nYEzOmQuzw5hSJI6betYYMwxQCD/35yTFzBHKHwbtpp0wEj97OESLoDH7Yi/zYDp8LfAn0aZ/bZlaJ+PYDzlr8qkrGsPRIihwbE5AgDEg+zgugj1YQQbmOJLgGZVypFDVbuETfsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GbrTAVAD; arc=fail smtp.client-ip=52.101.84.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWHM3hfSiMUM3k0dG8mf/d01Dl2++CO8uEI6HIjANu7E2KPmWfiEgf2GTvVcLxoCmHUY0rdsbtp3oS+uAEq/kYo3ou9vCaPR7co41TcluVwkMtA1iTQ6zlTSUK7aolPLML2Zp006x6t+oE86Eo5QZHYeJ/RBD85sbY6alnuD1p4oAW0O4eapqJvWIQnEkz+d9QfF7vDwfesQPQnBJOGePTfa6Y0nE5OnNb+g6ZkWkvgPq4vSMoUf9IcNRl1lqLpYETIqcJrWufGQ/OVO77S2J0rDirKlPLA8Oim418Husp0cvTdwKmV33q4QjLJzG36vJGY1ERrzZTsJHD57PyJvRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XCuJBexRCZa0Y/e77og0DYEMuhB60F187OltRxB+2k=;
 b=MqjhA7Mu3KMhqe9z3fH/2Lht/U2XNZx05xwuUdOFR41RX0QY4rt8YNzrpIyb2S9St7tPy7kBu4x2GX//JDQB8vCN1bMaWVKBfZ2DU9JSG4kbNYGpey7iByE2CIeYdMoSgPzdMqc/sSA6vty0GHMYqk8K6BVbULHFCPcRj/I2k0B1s25rAF6fvpfC6oeq5ym8BkdpGY60egj0DLnAmBR/XqpxtBVAnwuJ5hcYJnNbintWr0X2aafIYOw2JytCZ6zOGxzsYu0WAaRez3P1NXOu/riqMAXtu+LFpiGJHVFfPh0AIZ3auThKtF9L0W3MUBecBIfZcmVubZ8Wk192vXNxHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XCuJBexRCZa0Y/e77og0DYEMuhB60F187OltRxB+2k=;
 b=GbrTAVADUx2d4EVDJCzHR3S5iGUpaaFuEGoLYRorRDggxcUgegPfKols8l8JHzbOX5askCBaMti9dLdN8ShDnQoEJihPT2JCzZiqDNd4yJaSE6+cESLzfdwLwr/tWKq6NHKTSwM4Yd8wZr+FVgTEql2PlA9ep9d98u0i1sOJUIQvAVYtGI0HgUiBQ9GqWgUzRSX8XntpqlPD6fSTmN2cDoHFoZheNFZ+6bbCe35KUpG+Gt+GavGgj0d9UBVmEAho2uy3fWnMAZuEIkujkH7s+CxQe18VPWdMVc1nzdwKLC7Pf8aeT8450pxkUjXfH46ouEL4QvdlQqmwhPN+wOtJvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VI1PR04MB10002.eurprd04.prod.outlook.com (2603:10a6:800:1d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 16:05:24 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 16:05:24 +0000
Message-ID: <0c4bc190-7049-4753-b88e-479a3ff584fc@oss.nxp.com>
Date: Thu, 16 Oct 2025 19:05:21 +0300
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: pinctrl-scmi: Support for pin-only mode when groups are unavailable
To: arm-scmi@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR09CA0014.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::17) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|VI1PR04MB10002:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac59b71-2986-40c7-4bf3-08de0ccdd050
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXpnNDhWcUF0QlNob1RycGNlbnhSbmJEdGcrQm9RWis0RFIrZGJoeTVEdGZ5?=
 =?utf-8?B?NVlVVDlHSWlkdGFSNjNEektVeWsyMThGVmVJQzJkbnhRUjRVL2pDbVpwdVlB?=
 =?utf-8?B?cEYxN1VXUFN1MEtuTnYxZ3VBeUFNdlF6Y0t4ajVNczdxNm50NU1zeHFPSFRi?=
 =?utf-8?B?N0Fnc3hJcWx6cEFYTHdOVmI1Y0tsQkUrY1J5bVE3NWVNenNkMHZJNGM4Tnp3?=
 =?utf-8?B?NlF3eVptNEZ5UFBXWVYzbFFSUGVPUHovUklhbk94azdWV3M5U0hJRlQvdjNy?=
 =?utf-8?B?dnVKeDFNeEZQYnpuTnJENUhJeEcrbEp5SzVEQUlSTE9wY0tzTXZIUUxSUG9s?=
 =?utf-8?B?aVdYMkNaUkE1Z05pSk9OVGZGMzM1NVZjazdZdmZub0dVaktVeVpEVjZWdHRv?=
 =?utf-8?B?eEtWdkZIRkpOTWpRS01vQU84V05SYkV2S1QrRnE4OGlzb3dqaW1yVlBVNzVi?=
 =?utf-8?B?SjE3RnZ6aFZmeTZ4S1ZncUtJTHJKMW1zVHZONVRWNmlJcjAwQ21JYm1MVG82?=
 =?utf-8?B?TzZHMVhQb2dDRk56WW5nd1pEVDlVdWNoMHVOZUV5YTVjZUdpZ2JldXJFVEpS?=
 =?utf-8?B?RTU0Q1pveXZCYjV0blh1SnRsUDVWaENHKzJWOFIxRGhYdXk4N0xHY3dEUTNW?=
 =?utf-8?B?Wjc2UUdkMUR5VFR6d1BoWXJBcDNIRkp4amJuZ0NlRThOM1JnbHdmZGluaE9Q?=
 =?utf-8?B?aW5DTTRNcklpUGIrU1hWQ0FDUkV6QXBqZ0cvR0toT3MrQ2trR1RnVlpmUHhx?=
 =?utf-8?B?aEdrWC9sREtDM2luVm5IbU43NTdaMnJFcFozd0piVE9Rc3BKRkpQc0dYSE91?=
 =?utf-8?B?OUV3NWVGV2xIS3RiSTZXSVlISUFxVThMZ1dOOE85aGY1aExqR21VczFVaWVi?=
 =?utf-8?B?OE41b2RETWt1czkzbHZ5ZEdwTlBtQVJYL1FSY2NJOXBiSEtGTlZrSDY0TWta?=
 =?utf-8?B?SXY2ZU0yR0RHWE5CcE8wbUs1M2hWRlNFc3B4R080ZXg3b1hsekRYcCtOUzIr?=
 =?utf-8?B?aTAxMVJDYk5SbVZ0dldtOUdSMjFaakZjNkZMMnpqaE1pTU93djNHV2E4VGR0?=
 =?utf-8?B?ajZqdXpuTWg0MzFDTDA0TWVGYjlZcU94aENvR29TNVUwejRDd1Jnbk5iTmdS?=
 =?utf-8?B?MmxFSWdjMEhHK2cyWVlaTWh6bEJ6V29xbGtyc29IK0tkVlY1Z0R0T3RnMktk?=
 =?utf-8?B?Q2lzYmxtczJYbnpZVWVwa0dDVjBGQkNGZW15NVQvSUc5ekcxZmNjdkFpTFhK?=
 =?utf-8?B?Y2lHZ3AvRFR5SDB4REtwY3JGZ1I5anpoSFNyWVM3a0JwUzd0WVpMU3J3R1NP?=
 =?utf-8?B?dWhPMEFxMTR6UEhhckpmR1R2SXJDcndUN294dVc0bUlvTWVYK1RvZ1RLV2c5?=
 =?utf-8?B?ZE81SWNHSjYrekt3bzJWVTFOb2xBcGJ0UzJaQlYwTUhpZ1BQNmhOUkhzZ09N?=
 =?utf-8?B?QWd1aTVPQkh6bFRuaWR3MERGVHhzcHRaZ01lSksrS3VVY2VuVkxjcENScjl5?=
 =?utf-8?B?NllIRUdyK0tmUDUvVVRvRzBFSklnVWUzUjV3VzUrcEUrOCt0dHk5NEFRZFVY?=
 =?utf-8?B?VjBrZUxWclBYK0JsN29oeTVyWU1kak9QcThFZkZZZ09GR2RLcXQ2OFpzdDRv?=
 =?utf-8?B?NVdad3NIQWhlVVJVeDNDcHVYM0Q1bkE1enJaeW1jNWEzb05MaVEwaUNsUmVw?=
 =?utf-8?B?cVdoMTBRYnJySGJMdHVhTWFpMm5yN1R4eTc4emNGNXNzbHNtY0NpRGZIRHFn?=
 =?utf-8?B?aE8xM1hxODIrWHM1NnFGQWtOWHdjMCs0c1NPT2RxMkZvT0xhcytVYi9RbGRP?=
 =?utf-8?B?elhsUENqckQwYXJNaC9ZcUVGWjJBLzU5MnA4L0lDeHpIT0x0c0tjb2VGZTFF?=
 =?utf-8?B?VEpjZDBJb0hPRWoxQS9TVlZhN3lGSzNJZGxnUE1YRHNkQk8xMEZvaGs1QWt4?=
 =?utf-8?Q?HQFmTj8AGHLi9mf1wBcShRG5bbk/dp1W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3dLUUNjc0E0V2JCK25yVVNYNDRSYWtSeExuQ0txUGhVMEhOMlBTZStqb3gx?=
 =?utf-8?B?VE5pb0xMQ0xobStJaUk3M2QxeEpWdmVWQ0d4R25wN1ZLV29JRk94RTV6Wmhx?=
 =?utf-8?B?bGFDSVdYTVdIanh4eFAyVFBzUzhBTmFUUVZqR2ZwTWg1ZGZyUC9oVU9kNEFt?=
 =?utf-8?B?YitNTElWVERiRDE2dElDSmlqYXdueEtYVnUvV1hER0s2d2U4cXpNaXRnMG04?=
 =?utf-8?B?bVpDL3Z0TEVLaFlIdXllVjI4bVhTZjN2TU5ETE9FemZGalQwM2FOdEpWa01y?=
 =?utf-8?B?dWR2bEhLOE9nTWRDNnUrSUgwUTVRMEpYYzFNbHdvMDVoTndtSktmK2VIT1Zh?=
 =?utf-8?B?TmpSajNFVURTaDdmVVVrU0Y3KzRHMGZFbEpVcEJCSXBsTGlONWF4UWRMbktW?=
 =?utf-8?B?aTQxOFB5RWZXdlUrZkRRRzVKbmJrZ3NVNk8zV05VdGNpeEZZbnlLVmJ6TmV6?=
 =?utf-8?B?WjFwQ01ocnNDWFk4cFhpWHdzYnhsM01lMzVIVmluVDJrd3lCenlCVTBJVU5s?=
 =?utf-8?B?Zk1VQWREdUJXZkwxbk5JRjZVL1REaGh4OVhHdU9DcndFMDlXelJ3ckNBdWtm?=
 =?utf-8?B?NWVVRU5ieWpnd0hFcC91UDUvNHY4M0RscDI5WmJJOWJUdW45QkVjTmhxbU9O?=
 =?utf-8?B?Q2NEN0JXa0ZUcXVRUUIxZ1AwWnB2ZkREYVgwSVVFTGlabDV5NVdPSzRHNlJk?=
 =?utf-8?B?NzJJa3FwOEk1Z3ZaM2xjMFJIOGlKa1VNdk4zU0xIU1dwTjQ0bGdUcUhWT0Qz?=
 =?utf-8?B?WkNjdHVaQUVHM29FZ21XaVQrWWwyemJxbTBQWVBLQUlvaXpObXkwZ25lajN6?=
 =?utf-8?B?TCtEWE82Rm9DRUprZlhuWVh4REZFcVpndWt4ak9qNUw4L1hPTmZVdHowSFBk?=
 =?utf-8?B?ZVJJV2ZjdXNQaUpKOEhOU3F4RXRRai9OemRqbjVHU05HQzBRVWJkeEpUeVZV?=
 =?utf-8?B?dHJKT1NVdTRhZzJYZVQ1S3RuRFI2Z3JTL2p1QmwzZU5GcTFSZkJab0JyRVpl?=
 =?utf-8?B?b0s0YURHdXpwbUMyRUZLVXlBMTkrYU13U05oZFRvZWVjdjVpZTZ1c2NKWjVy?=
 =?utf-8?B?YUlZcE5BMW1WcUhBdHkrYkdLLzM0MFl1TzBJQmtydDUyVVF2K1RNWnYwbU9n?=
 =?utf-8?B?enpvS09WbFBqdlpaRTc2NEZaQy91U3p0RzBGc01abHV6Mm5vR0J5dnVKVlhx?=
 =?utf-8?B?MVFybDUrNUtpeGFEWW16aUQ4NmtPbmh1YS8ybld1a3JrZjJlNlBSYzdhWnRm?=
 =?utf-8?B?OG54eld4akdmcjA0WDczNmt3VWdxS1REOUdLQngyNlZteHVpUVpzUTBmOCt6?=
 =?utf-8?B?Ym1xS2NSM0ZLS3NjSE1hY243YnV5UUtheWxoc2p6SGlSei9maUpVQnY4ZnAw?=
 =?utf-8?B?NUhNK3RDenkvUzRkY1V5T0l1MW9vUUFmWFpwVG5TcjkxT1lOckJLMk84bTNH?=
 =?utf-8?B?NWRqWWt4NmxPbDZiN3duSkFEK053L2NVSTBOcUZjYjBVc2d0SFZOVkRjaC9H?=
 =?utf-8?B?UlhVQmFhSlZlL3EzK2FXbTZrbnpPdTNqQ2RvTHlBcVJQYkk3dTFPandFU3Yx?=
 =?utf-8?B?Q2xqWXZnSDdQUmdLRjNaMDd4THlFRUtsbEJrNTNMT2dRYnJhWEFyVHFnZURq?=
 =?utf-8?B?ZHVWTktKSklCVXVuRDM1U1FsdmFyN3hKbjBBek1TNGxPMGZLQkx1ODZ3cmNq?=
 =?utf-8?B?Tng1VFdNVUhFVUtNZ3JtM0tNcEJRUWRwMFUwTVRpbFByeGJlU0Z5cDdpL2px?=
 =?utf-8?B?UWFSRy9LQjZaSHM1Y2IxNndDallLajFmRjlJQTJIWDlvV1NoTHViKzlJQ0tO?=
 =?utf-8?B?aVN5Qm10TTF0SE52RUtqcU82QkZBWjkydTFJcUhKWVVFNWVIL2xFVVFKZldD?=
 =?utf-8?B?VjcvbU9weFVEakFmWnBkazFqeVYyTnpqWVUwdFVuaTg5RVpSQk5yUFZwQUpa?=
 =?utf-8?B?R0k1Ty90MXE5RFF6QmV1M1RtVCtndE0zKzhadzRxQkhGMGdhb3NlVjd1VWVJ?=
 =?utf-8?B?dXVxMEREWE1VcjJrdERPK3B2QSs4TkxpTDdZNkFGck1HdnIwVWN6ampHbllZ?=
 =?utf-8?B?V3Y2V3VuT0txcFMycmhkbWFncFhzdGFHdlhLQm5tdzA2c3l0ZFNxcXZuYlZr?=
 =?utf-8?B?Zk5lQlozNk13czJsWENDd2l0RGhQMDhRTXA2ckhaVUwwNXg4T1k4L2IxWUJV?=
 =?utf-8?B?OVE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac59b71-2986-40c7-4bf3-08de0ccdd050
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 16:05:24.0264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8pdcOvy78IMH8kd6HT3aHhV7oVEZuC0026pjFflmWgoVTbR3B0aHm88uv1Jw8nLbS3W/41FlPC5ByNjhsjx9BMAE7oZ4vdhmhH6nVVq/2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10002

Hello,


I’m currently exploring a solution to improve the 'pinctrl-scmi' [1] 
driver so it can better support SCMI platforms that only provide 
individual pin control. At the moment, the driver handles only 
group-based operations, which means platforms without pin groups run 
into limitations.

According to the SCMI v4.0 specification (section 3.11.2.8), both 
group-based and per-pin control modes should be supported. However, on 
pin-only platforms, the current implementation cannot enumerate groups, 
configure pinmux, or assign functions per pin. This results in probe 
failures and '-EINVAL' errors when trying to configure non-existent groups.

I haven’t seen any work in this area yet, but if nothing is in progress, 
I’d like to propose an approach that keeps compatibility with the 
existing Linux pinctrl framework while adding per-pin support. The idea 
is to detect whether the platform supports groups or pins-only during 
probe, and when groups are missing, create virtual groups from the DT 
pin specifications. This would allow us to reuse the existing 
group-based logic while enabling per-pin muxing.

For example, a DTS node could look like this:

uart_pins: uart-pins {
     pins = <10 11>;      /* SCMI pin IDs */
     functions = <2 3>;   /* Per-pin function IDs: UART_TX, UART_RX */
};

or:

uart_pins: uart-pins {
     pins = <10 11>;      /* SCMI pin IDs */
     function = <2>;      /* Same function for all pins */
};

To make this work, the driver would need to:
   - Detect capabilities during probe (groups vs pins-only). Can be 
implemented via 'pinctrl_ops->count_get()'.
   - Create virtual groups when groups are unsupported.
   - Add per-pin mux/config operations by introducing a 'pin_mux_set()' 
callback in the SCMI core, since currently only group-based 'mux_set' is 
implemented.

I’d really appreciate your thoughts on whether this direction makes 
sense and if there’s anything I should consider before starting.
Thanks a lot for your time and guidance!

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pinctrl/pinctrl-scmi.c

Best Regards,
Ciprian Costea

