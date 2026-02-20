Return-Path: <linux-gpio+bounces-31941-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EhbMU0gmGn0AgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31941-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 09:50:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EAB165EE7
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 09:50:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 59DA53007AF0
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 08:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA42B3101BF;
	Fri, 20 Feb 2026 08:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cAXdN91j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013029.outbound.protection.outlook.com [52.101.72.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA7D30F93D;
	Fri, 20 Feb 2026 08:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771577416; cv=fail; b=oxJYGj9M1Y5w6iTC9kqk+8JBcLraF/0Lme393s1Sgt8EXvn3nczvX2aM1bktMUrq9yn1gmoUwQOlMPltVfPgvblRLXO8OpaBqiotK8TbcIC97x2VVum7aoA8WEbS00lX3WQqypH7mpFdv3hXOO0O1R9oPUI/0AxdoD3u+yPfbwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771577416; c=relaxed/simple;
	bh=PUJoYRXozHvLqbSzlrFteQITOfi/BQirdPeU1Z9Ngro=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uUmBCjkhbLNxcPB9Z5W+1Sra/NFljDVCZeu3+WktgseQwTnlGIv5SMS29Wf0o20vKUq2pzjAhWmBQEEZvr7m9lr2YVzTVJzrNDsgYA/7KN5ru/Ksx9ccNIJ41Kbka8EGx6k5cg21SKsc51Olka98SlJvfClfw5OWrlJ1OI3fyyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cAXdN91j; arc=fail smtp.client-ip=52.101.72.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rm/wmNB6NactsCiDt7fCHr0c/WWYmMjhFKncA2Y+YQXFnpdRHmqXZQc6zK0olvLjzqSobJ6+KSGayiqaa365OmghdCGssCW9NNPyC4t2AbtY7tL7jLX8GUVpMaCA5UxniI+vlOshaTyX2A97E2GNNaZzCLQq9UFnrTK18v41VTjN7zrulWLkOT/O0hsAz2Cupt/jh/B4eMPlLlTEn8utOvhkAW1Q3F3y5jXXeahZQQK4RKU6AofTuPev5Kf+/Y3MKawEcLQ4AqMgfkKQW387ciNQY0YKKYu8QU4TreHdx9RiRHX85KMK3nQ1q0571lhkc7Qou1bG82LqSciRQjNXZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUJoYRXozHvLqbSzlrFteQITOfi/BQirdPeU1Z9Ngro=;
 b=euJoaiDrKk2a4OvnFVhAoHcyLI9uh2MFji8WegPKjkIlO6WorOLvb6gvX41Muda41Ob2tIqk0BcTk4CBrpgxlrWxdTNKGHB0bA+X+EB/dnUsUa5vVojG0c/bZ0Lu234RmhpG5vJ+4Ecx3lYlnji+i0FuRs3FO1xsB3l3B2HGvZbbcDJ45PG81w2g2QLSEbkfKH08r9nalE7KhtXEUz2SyQ+NvGq4pIJYS/GT7AUqLKOf6I88kPPtR/5lyj+oN2uG0zcftCDYEEuPGc9U6j66t0BXSr3DqXT0Z6vi5e3BXqeOcisU37SGckaSdwwJMovTmoHw7dG3BJunm/6Z7Hg9KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUJoYRXozHvLqbSzlrFteQITOfi/BQirdPeU1Z9Ngro=;
 b=cAXdN91jYxgBghieqAMCv8Yl2hqED6Fy1HzM9J1UI1EI/vtzp7gPNK3SR5rgbaiJLg4QY1oRJkPD/fos+cZZTII3MpGPjW6FvGTrwsyOYywJi54bBepW/WJAdb4DzKATp2cjYxWzXjHeogogrCZq+Mh5szJUstc4PgWatYvhwvq3APzztoQrP9SZztC4VG8TLfgcUgDD6mNnwLnpBGeGEug6tyw6p0rvLDf85tpmlYXs+WCs2IFx+G1h9puOCt4bUpnrPQu5ixhv9C9nUuyjY/AHrYAS2wzrwjOeipNF7GVG9NaYm+opg+pYlZV+fLqL4TWiV0thdCPgSkly5hUoow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DU4PR04MB10912.eurprd04.prod.outlook.com (2603:10a6:10:58a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 08:50:11 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 08:50:11 +0000
Message-ID: <637bc57c-d388-40ef-9f49-3c2825099405@oss.nxp.com>
Date: Fri, 20 Feb 2026 10:53:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: imx8mp-evk: add board-level mux for CAN2
 and MICFIL
To: Frank Li <Frank.Li@nxp.com>, Peter Rosin <peda@axentia.se>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260219-pinctrl-mux-v1-0-678d21637788@nxp.com>
 <20260219-pinctrl-mux-v1-4-678d21637788@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260219-pinctrl-mux-v1-4-678d21637788@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0189.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::26) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DU4PR04MB10912:EE_
X-MS-Office365-Filtering-Correlation-Id: a2fb88ae-4fcc-4239-b907-08de705d0ea8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUIxYjEveFBrMm5UMEkwR1lrblM5azR6b09raGYzTFZySUsyWDhmeHpxdFMy?=
 =?utf-8?B?WWxaNDZWTzN3VDJBTTNSRDdjS2lMSWo3V204NzlMVW5iUCtiYS9GQlhuMnBO?=
 =?utf-8?B?NktBdWw3T0N0SjR1emwvM1VpYUNqWjlabE5RdjZ5Zms1WGx0eEYwM0pid0J0?=
 =?utf-8?B?WEpkSUpoVWdFUDA5M2c3Yzg5UEd3QmU0Q1ZIWkRZNEN5L0R4dGlNUkFpbGZu?=
 =?utf-8?B?LzV6MHJCME4xSlR1R3NTaGhSbFRIdmswVkYybjdJUjBYTkhtZ1Bud1IxYVRP?=
 =?utf-8?B?TkxhY2ZQMDNvamNEdmtGUzFZTk95amhGWVhiUkt3WWt5VkRKeC9wQUpYS3JV?=
 =?utf-8?B?ZCsrUnpHc3ZMaVVPb2F6cjhzMm5CNHROcGJ3UTFZRDVNbHRycE94QTBZcDZQ?=
 =?utf-8?B?VDNvU3QxZ1M1QUpLdnBYSzJBamZtK2RDOXRhNWRlYnlWdVZsNXhSN0I5dEU0?=
 =?utf-8?B?QTcwMlR0M3hWSUtUdjNsQ0hoTjE3eklHeUtHNG83S2s3VVROd2R4RUdGbzky?=
 =?utf-8?B?WmpnRm9TbDFKNkNtUkkxOGRLRUFXdDkyWEFQbGIvYzBieUJDeEJtOW5zR1p2?=
 =?utf-8?B?cE9SdnpRTFhaenM1SWFKOGlUUnduZXl6YlJURTZCZmpQb1NtYVIyUDFvM3BF?=
 =?utf-8?B?QkRObDBEWklBcnlMTWJscXJzR0hyVGpFN0JzVElzUnJtUUJHUnRhQWVoRExZ?=
 =?utf-8?B?ZnRHbVZZdW4wMHBjZm9MQlppUEliZ25LZ0EyYXowTjZFR0lhdnZKT1o3L0Rj?=
 =?utf-8?B?U0J6SzIrQmdjWHlGbjBnUkgzOWJpVW9VTi91SHV1STZnNW91VnIwQXFlWldv?=
 =?utf-8?B?N0Jkam0xdDVXOHlPN3llUkh0LzlZejJPZDVUNHJsZFE1U2VHcm9JS3NnTkNX?=
 =?utf-8?B?Q1VzM28wZlFTWWtjTmFhNVpnQ0ZDamdwd1gyRkpPcnJOekdYTWo4U3MzQksy?=
 =?utf-8?B?ZjYza3VvV2NxY1RlRW1QbTNmS1cwZlV5blBsSzNObFR6K0NFNmpqMFdQVVBG?=
 =?utf-8?B?d3pCY2hERmF2aXBlTDJMZUoyTEFYd3NPSnV5WTZoQjhjeTlmc3d5bUUrcEs2?=
 =?utf-8?B?SWtsY3JtVVRRMGxWYnlXczhnRElJbmNCd1ZweW5kamVWY2ZDSlA1Y3BUNXFT?=
 =?utf-8?B?MktMa05uc1FnNkQyOUZab2dtWmlGUmtOUElkV2ZDU3NORWdZckNPSGhBZUMr?=
 =?utf-8?B?emtNYTc0N1RQNFRLVWN3RUVWNHkyRWhvUTY4cDZpWEgwU1ZRZXR1Q0FEZ0ov?=
 =?utf-8?B?MjFqSHc5b093cXdsa3MxalBnZzV3c0tTZTA3QjEwVG9wemhMT1BIZDh1a2ps?=
 =?utf-8?B?ZmJ2WHYvL1EyR2RVNXEwcG9WL285cE5hdjh4Wnk3SSs5c3NXelIrYVQ3cStH?=
 =?utf-8?B?aU1rNUU4c05TUzlQWXBHUjdNaXhVSWVMeXdad3lIK2tUT1ZLL3JUaEY3Rlhp?=
 =?utf-8?B?ckxCZlZWYkJiaE9NVzByemd3cHh1aElEd0dyWEtqTFRQYStrcEY5U2piZXZn?=
 =?utf-8?B?N01pWDBvdUNlVE1WOUowVkFIM0ZObWhWOE5xYm5IdExiRWtKTisrWjIxdzdJ?=
 =?utf-8?B?dGUrR3g2QVIyRFN3TVNla3pZcDRqSU5qUkd0R05Rd1FWZzdkQTJOajhXc1dD?=
 =?utf-8?B?cUpBK0g2UEVTOXZuUVQybjdyYTdmUzh4Z0JFOTc5ZElpdkJKN09pRVZZNk5Q?=
 =?utf-8?B?ZmwreDV4RzJadjU0dHpPNVZGZEFpK1Z3SVpLcGNCMTNYalp3S29KTGl6SDJI?=
 =?utf-8?B?K3JXMEFyRTBIbVhENlZCcUdLUnY3VVgzdlRLVjVaTVZQY1pScjBRQ2JBTjFl?=
 =?utf-8?B?QXZVL2krbjlNa1NVU1Z2ZlJNVVhmQkRDV0dCWldldndVQkdpdm1RcjBFWE15?=
 =?utf-8?B?a243S3hPOWNuMXZUN1F4UHBwV01Jcml4d3J0R1p0YjUvUENyVjZZKysvSTU3?=
 =?utf-8?B?TVArb0RRcUVJOXZ0ZkQ1aGxsN0l3YWZaSTMxUklzbmxhWkxvbFFFUGxueStW?=
 =?utf-8?B?YmkxdUVrZEFGbHNGTW9mamw3NWN4UjJGZXpzTENwM29YcVoxMU1Jak9oZDNt?=
 =?utf-8?B?QlVvbnRNMUkyanVhT0pQd3BIOU5JWEVzbG13eFNOWmorOEFrbGRNS1Q0UWdh?=
 =?utf-8?B?STVhQTQxVWROcStlYndLdXFQdUlFSGxPaUNuTnQwQm9rVjFaTkVzNUdIT0cy?=
 =?utf-8?B?eXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2ZoUldiUTdGRnBIRHBDMndaV1RYR1Z1TmdmeWZ6Wi9TU2VjaWFXRHhQMCtx?=
 =?utf-8?B?OEQ4RDlScjNnUXdnYTFOQWxENW4vZ1V2aDVpK01QSy9MbmlpcE12eUVub0Zy?=
 =?utf-8?B?TGpkTWJqYnJuYVFmVVdBRGhiZDNBOUFydVpoR25yZFpvM08za2s0M20zUjY2?=
 =?utf-8?B?Tmo3ZnB5Vm8yYzU4bUVBbG5MZXVJZzFqUWpwWFlHUWFudkl6M1JXN28wcEtZ?=
 =?utf-8?B?MTZEelF5d0gzT1Z6SDVScVdpRWFvWUJ2V2JnVmkyRGt4L0g5U0w3ZXVJQWZq?=
 =?utf-8?B?YlRmcFA2b3BhZVBXTUN6N2VlMHMwVEsyL0ZVOXMyWGhNeUtlTzJFWHlQYUt6?=
 =?utf-8?B?Tk1CU2YycnpNdmFxeWNHcFJrZWMvOUZpcmJ5VGhzTEtHclhENjcranV5V0kx?=
 =?utf-8?B?TDhwaitlVWVsamE1RzRySWhTU0d6VXBBVHh6VWdFRmxScnJUVkF0TXJFcy9o?=
 =?utf-8?B?ejB0eStWaU45bUdZM044cFM0SlQ5ejVMa1dQSjgzMGpaMkh2cFREWEVoSVB3?=
 =?utf-8?B?QS9MVnloUE1OdlRnQmFyZWo4dTBKY25oSEpUVnc4Z0xWbzdlbzV6cnprT1FI?=
 =?utf-8?B?NjkwSW5VVXBUVEVabktTSmNOcmNmY0dVRVlDa3ZreHQybllrcDNyZFB3bVZH?=
 =?utf-8?B?K1VGbllzZWVsT05uY2JtQVNmalErM2Z4UjZWQ2djRUtGcS9YZExsaDNFNTdG?=
 =?utf-8?B?K1B5TmpMdFE3cnBNaGZ5eTJqRDRvMjdLWElzTWE0STNnNkZ6WmY1SUx4cHRj?=
 =?utf-8?B?MjAzSEVoL0JqQTlxNERwbkI5MXVoWjNWRDN0c3gzelRDckpMbXJwdWNxWEV5?=
 =?utf-8?B?VnNsZVd5YkE2QXFiZUdyQkNzQkdod2JHSE1wZ0xFUEpaK1A1a21STk9pbERq?=
 =?utf-8?B?S1lXdHV6Unc0WTBEa0FYcXB3VWNVc1lFSWZ2UlpBc3RISWZKZzVYSVpWbGpD?=
 =?utf-8?B?bEFEdVlsYmwrNlhrSHNUMFBTRTlTQThBaHVncUdQaStLMHNvSHBLMEJqcTRM?=
 =?utf-8?B?TVdQNUNzQ0JSUCs2U0ovaUJpamV6ZWlnZ01zSFZRbVk1NmphS2JmOGd1TnR0?=
 =?utf-8?B?VDJ3UXp6MXdDWVFBZVcxL0poNFNYdVlLK0JIbnB0d0lUWnZ6aFVrMW5WcjRL?=
 =?utf-8?B?czRHdFJoVENPczlWYzVmWTE1MnVXanMva3BJYzZNYitnbGZBS3llLzQySGRy?=
 =?utf-8?B?c1A3NW5TeThZdmRjNEZUQ0Urd1FaU2NJR1J5aXF2R3JHRktydk1PVy9oOXo5?=
 =?utf-8?B?K05UcVA5bTl0eHBlM281L2dCRk1nV01EUEZLcCtFOWtydDgvc3dPRWk0akpJ?=
 =?utf-8?B?dndNaUNJTi9WdjVPNkNwcU56bUJoSFZERHNmRm9xM3ZNSmd3Q0hJN2hUSi84?=
 =?utf-8?B?R0twM0NUYm5CVHIrcDluZkIvUWdJVzVsdndyd0Y1SWVtcnZEMmh4YkFhczJP?=
 =?utf-8?B?eUxya2prNnVFaUJmVkU1VW9wWUkxQ3I0MVdONWNDaW9JL2hMZXd5L0VkSHNR?=
 =?utf-8?B?Y210cU5SMmQ4NVcxQkFVYjhnUW9HVENLRWw4TkVxRmRsb1B0Rk54N2FQY0ZL?=
 =?utf-8?B?eHFUUkpMWEhpcU96ZkhaYVQ1NG5MU091dTlJeVZ0RmkvMXRnNWdJeE5UNmVH?=
 =?utf-8?B?U04zd3FLRExvK09nRGpYZzdZUXYrM0hxdVJJN29HMWxBRHdZODZlV2VtaTZu?=
 =?utf-8?B?TlV0MWdwSjhqT1pkT3o2eHhiSnJlMEErdm5yQ0FnbnpjQjRnRkY1MFlSTHlj?=
 =?utf-8?B?SXBMN3dFNytGbXoyZmFQMzltY1RoSjdNQyt4UU5ERDZqMjVNN3FaYmttOGMr?=
 =?utf-8?B?aUE5RUlTeHd1MHlNMXk0alFWTXprajVvSnJsMDBKZU02Z2FuK1hWL290d1Vp?=
 =?utf-8?B?NXFWUkNlSDRmYXREZDhibVR3Y2hpTVFZQUR6ZmFRQVZyMTVnL1lKbDk5bld6?=
 =?utf-8?B?SFlBMDQzcTNvUUhzWmkxbTA0d0Q3Q0dkOXRZb3l4aEVOZUpoRHpGc2hrN2FV?=
 =?utf-8?B?bUdBR2tKRVdyM0RhblVNOTJxU3drRUZMaG1Qd3dyekQ1VW1VdUE3QXhaaCs5?=
 =?utf-8?B?U2xqc3R2TlR5b293Rk1sTnZNdmRyalg1YWNQOTBKVzdsTG5EaGplTm82Qmdv?=
 =?utf-8?B?TjZ6NGtQSXVNMXpndXFwdDFxVktvV3U2a1p6WEdLUXhLWUFkaVB4U2ZDRmNh?=
 =?utf-8?B?OE9GNEV6M0dTaVFUSnUxdjNtQkM3ekRSc1FxOUpRbUYzSklveVhBTmh6VU9x?=
 =?utf-8?B?VEtVNXVLWUZwdGo3RmFkdHNWTkkyblN2RExlN2JPdXQyQTRMLzByb2x4c1pJ?=
 =?utf-8?B?akhJMEJ1ZlR1VWJ2d1JVTVZJbmVGMll5WEphZzlBYTJEdXIwK2h6UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2fb88ae-4fcc-4239-b907-08de705d0ea8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 08:50:11.4947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjupQaMjpdKzmUJ2O7Pn5g5GhlRoPdHzL1dG3F/HCeczsawHZQ5Rf6yWqAwhe97JCTV1gQg2Sw9MHGC9swHSyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10912
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31941-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[nxp.com,axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.baluta@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 34EAB165EE7
X-Rspamd-Action: no action

On 2/20/26 00:23, Frank Li wrote:
> The board integrates an on-board mux to route shared signals to either
> CAN2 or PDM (MICFIL). The mux is controlled by a GPIO.
>
> Add a pinctrl-based multiplexer node to describe this routing and ensure
> proper probe ordering of the dependent devices.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Can you please explain what is wrong with the current approach?

Current dtb imx8mp-evk.dtb is used to enable PDM MICFIL and

sets proper pinctrl routing.


