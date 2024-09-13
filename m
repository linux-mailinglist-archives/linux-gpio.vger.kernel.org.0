Return-Path: <linux-gpio+bounces-10047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7797B977AF9
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 10:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3473F2895C1
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 08:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412C51D6C4E;
	Fri, 13 Sep 2024 08:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bBGiHGgf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010019.outbound.protection.outlook.com [52.101.69.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FA6185925;
	Fri, 13 Sep 2024 08:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726216220; cv=fail; b=ArQ/7AiRFDi6qj6ptgDMcLLg+FJhUUkJdLOAHX13LsPieRzc/e0ehNjAc5CsmYVRDQCnGcnQJ+S3vE4/JklxSXfaMfwWEWPRGFsuU5aMY6vFYPCO7+u7I2MKOSUDOiW/YL1j4xRwMShpXP1lWT/MWRa+NMz0zUgHnujeocmDThE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726216220; c=relaxed/simple;
	bh=EV0Kotmgs7Hxx3OhpROYuVdyDbXkMCuMGBy4yvVh7Vw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=f+UVtu22ZYuY52fPuGL0ppOhozD8NVe3XM/QKLrBwHV+qslSJn8Ew4UkV22GEboBfAp1wlDV3FpGF1Z/WklYkk3ufsXJvG1NJSi5EFcHNcqWkTy9jypTbD6/hs8UjmqsP3oEsyR2D+2wexPRO5zeOcat0iDVllI89omLKrg/5YU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bBGiHGgf; arc=fail smtp.client-ip=52.101.69.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MO9+El2hLxLHF90eJNldZzS5K2gvf2mvqfWw23+Vs/9gIg6XAvvazxsuOUyJEhsGLZx8KZN4zSX1fnv9D1SB23AAQaPBktotdVpJ3U+UrS0xDqgSO1dGdf5mM5+Yc0DC9P0kVSGy7EYiygrDwWtAiL8GpFCGygi41LusOoTobgXZR0vQv6gWyz/5zwNryEmTx5MtNWRdZcwp51urEsGjtS6Kz53bTR4GcXj79BUU2Qd6IpUnqdWVUHEiGJoVmaPEd5G1JdZp4fxQTQVMb7ubxNJ6OIfwp3HzqAXR2qxPDNofc5GjWMUAAFqoWkmXtBsfUyUKVz9AF2tEBUbjg9PHAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ft4JzMtF4WyexVGA09i7K0sU/PAYWSx9myYsoZ3erz4=;
 b=PIavqcCht/ZdoG/VrG/8XKWukwfwfG538tphXKrp1YP7Lt5BwFtESn8+H7e8qbWc+f+ZpSiB2GjR6EtWp80u5YkbKMWI2Nz3TtWksLGdN6GKDR/iUcPG6k35JwqDaCPCxQTvP5prAdrlmwKO4nzPDcQJ0S5EU42dt85cH8EplxP9M9gtoqThvbFnIbXeBs//tHzMkuaxz4mlawWVNUnoYaRG/g7MLPxalgz0D9GtHNKh5E2dL1zRQ8MTUFZOxy+jDmMuHqBLf/q+ZH504ou0uI3ZikmSbX3siE1cTLKQEeTk9gw6ltqGfoDp0tmhWoY8PagM6NzXM88qtPVEF/lVMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ft4JzMtF4WyexVGA09i7K0sU/PAYWSx9myYsoZ3erz4=;
 b=bBGiHGgfxetzj9/ExARs0bbI+iUumROTp5PxZnUfqZ7bBs4hbBfqA5/vwCeDWUdmcjDA3dnfX2oxwKXFra1sUtFfahWV5oL51QTqHGK56zu8qqQByrPQqsJhRFK8kx+6gKLcvjA68qeRmFDfAZ+Fz+4qqu8HWeaQdFOgEnRmMynqF3sOH1O92fHXN25ZJGk/APFjr4MbQHaTp60grEDL8FZ10wcz7c8k8KeczUNhXoi+YOJ7qmQPMYFOK/zbmYtPQv9aYmg5NBie0+jq+32xzeXxPwvAqEkFwMy2d3ipZ0QD9/Qvxq7cy7GB/BBcbCd3u9y1sgGiHUrYNz0CRglc8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Fri, 13 Sep
 2024 08:30:13 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 08:30:13 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v2 0/4] gpio: siul2-s32g2: add initial GPIO driver
Date: Fri, 13 Sep 2024 11:29:31 +0300
Message-ID: <20240913082937.444367-1-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0134.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::31) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b87dc77-766b-40ea-e0cc-08dcd3ce497f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkZvbjlueGFaYXJwanNmUHh5R05jS200Slo3K0tvNE1xbUVSM1JwVXpnekxn?=
 =?utf-8?B?aTdyODdDQVhTZk13MDdpNXoxbnFZR2RzRE5HZ1Vtcnp1UHBtS2w2WFFLbjht?=
 =?utf-8?B?RFA2TUIwTHFPbGR2aTB2bHVxMEo2Mm1zS2lacWhVZ1luZGFGOVpYNSs2NDN6?=
 =?utf-8?B?akg2WlU2NXp6TG5aLzRjaklxMEhtWlhFdkE3bmxnL2J5NXQ4KzYxeGhxOEFZ?=
 =?utf-8?B?YWdld1VESlVOeCtxemNra2g5Tm4yOGthRTA5cFp5Y3FHM1h6LzRTL3l2SElu?=
 =?utf-8?B?OWYrRkVEblNzWlFOZTMxZVZzNmtFWFRjbktxSWRhTERSSzJvVzhaNmtBUko3?=
 =?utf-8?B?UUZPS05vMnR6dHFQWGdobHdpNmo0VCtjcnl0dU4rZ25vcHZ0N2VjY0l5VGpa?=
 =?utf-8?B?RU8ydFowL2I2SGlLYlFJMWI5MlRxVklDOXZXNlJSZ3ZhQmJDUzdpYm43eGJl?=
 =?utf-8?B?bzJqZHppTzNMbCthR2RYT2ZaVC9kTk1vd3Y5WGVLY2R0QlkrM05JVStJWCtT?=
 =?utf-8?B?bWlUNFJUa2JDdENCeGdTTm9XR0pRSUdPektIQzFRUWJuNDdoSDBoZ3N3cXhz?=
 =?utf-8?B?eVBuamdaUGFVakRjMjNhaDQ5akNkNVNhTGk5eHg5YUNadThYZmJGY2VQMVlk?=
 =?utf-8?B?QWVtQVhFTFRDRUIrWVNDT0YwVnFIb1FUd2hOUnVwNU1IdGdYajlYUWlZbHFu?=
 =?utf-8?B?bWJUMC8xYi9aRUdUQVl4dDV4ZUJmSTRkb3hTM01vcmRORlZndEJrdHV4ZzBn?=
 =?utf-8?B?V2UxOW55T0NZMHJnb0YzUFo0bjhmd25ZZlFObGNjUjZVM3B0K3dXWkoyNlFv?=
 =?utf-8?B?WW96MlAxSXM2cjV0clRCam0yK3JiaGUyVFFKMytuMzFHaFBPWjBaL1hYbmd2?=
 =?utf-8?B?T3gvYmpUM040Z01SS28yQUhmSng4ZGN3NGdBV0M0SmR0Nnh2TmMxRk01YlVY?=
 =?utf-8?B?K1BtZC90S0FucUVrUzUxbmZmdUh2NlE3OUpIK01xbVBCUENYVE5meGZzZ3lX?=
 =?utf-8?B?c3loblVmbEQ2T0svakQzSVpnSlRiVXFqeWRJSEdoeXErcjhlMGk2ZEJJZFlZ?=
 =?utf-8?B?MWlZWXpsdzdzZEVLdXVNb2E4Yi9wbUwwMWFmOEFsNVRpRVd3MElCOHZoY2gy?=
 =?utf-8?B?YzRzT3hsNnQwQmJ6RWo4QWxLdjBYdlhWSkFGUkU5Smg2TGI4MUtMaFN5c3pE?=
 =?utf-8?B?Q1Qya3ZtK2RLa0VCWkoxMnVxMVowOXhrWTJXcFhMSGlNUTBQbW9hUHlQRlRG?=
 =?utf-8?B?TFVYdVREZDl3ekcxeFErc1JkazJaWVRiUmo5emZhUWk0a28yMTZINkJSUlBY?=
 =?utf-8?B?QmZteHRFN2VmVVo3UHcrWGNHZXBWNmNnc3c1TFpNS3NNM0IzRERWNjVDbFBH?=
 =?utf-8?B?OEluR2V4ekVUMUo5N2lmQlYycE5oby9oWnVBWDgvMGZmaklUL0VKN2tzUlVL?=
 =?utf-8?B?RzFIcTJkNjRoV3pUTHAzK2Z1NHpCUDU0Z3pxZG9lVEZJUVhUcEUvQUNWTE9G?=
 =?utf-8?B?K1BJaHd0alJELytJbHk4cUN6Qkhhd3J2bVEzdEVuT2pVREMzcVdDZ2VETDNY?=
 =?utf-8?B?SXF3UFZYMG9nQWFGMHNzc0RoejJxcDd0RmJKc3QvVTJKVHVrQlQ2OWJOS3NN?=
 =?utf-8?B?OUJOV0tVckN1dkYrOXhubkhIRkFjTzI1b25WZkRhdXZhL3JqeCs0TjY5MlZa?=
 =?utf-8?B?V3VEeW5kK3VtRmRQOVh2eUFrUTJsWTlsck1vUFdNZE15eWJVaG0ramVoemRk?=
 =?utf-8?B?RGxSVkhaRjhjRVRTVUo1a2pweTBXc3JjUzV2TDR6UCt3aXJFcktMcFRDMzVC?=
 =?utf-8?B?VjNndFpzTU8xczB0Q2JCaCt6K3REbk9YdEJINDRiUGkvKzdxWHdBMGlvYzBn?=
 =?utf-8?B?bExjdGtsS0tDL25NMG05a2ZiNDNpNFp0WDFYYWpPNHZkdUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHh1Tm1henpZV1ZWL2JVS2J2Y2RMam5IQVNIU0kvWlNINitRVjlDQW1NYlNZ?=
 =?utf-8?B?amdPdmhXd3ptdzM5MUlydnlpbm1hbXA4VTV0NTF0ZkNGTjVqVk5sRnJJTUtY?=
 =?utf-8?B?ZnRvZkl1U3FYcWt4VStUWGk5eUxLMit4Z1JNNUJlbEYzdWNzc2JHaUpuelNv?=
 =?utf-8?B?NlFYNjA3NVhrNkE3T1JvMk4yL2g5NmtzYkZJWnZHbUFDd1JGOXh6NFdFejhP?=
 =?utf-8?B?d1ZQUlFmMmpJZDFDZmo0SjhMbzJSMDNZYlh3UVNuSkVkV3N5TU9oQXBaSDZY?=
 =?utf-8?B?UUpmb2dMSnorazRDdWVNR2M4SjBNUVZJL2JqZG91TXhHM1dUWkxTVytoM2lB?=
 =?utf-8?B?UDdwWXhHVi94TkZVUVpaTG14dnNaMThtY0w0WjhBMmRtYklHaXg1Y0JzaXpV?=
 =?utf-8?B?VktIcTZ5RklmUmcwaGhPWnl4RG0vUjJHRmE3NmpneDdObFBNUU1UWWZLbFc1?=
 =?utf-8?B?dVdZM095UDFYc2d0QUZLVW9sUDh1Y1FsOVFQSFR5VTJkVlJEckQ0NmlPakFp?=
 =?utf-8?B?amxPK3hZMHpKT3NoSmZNV2tUWVFUK1U0VTd3TW90dXR5WmNRT21uYjRPTnBC?=
 =?utf-8?B?ZzJLcGpoM0xweDAwbG9oVWl1MERGYW9TRTJldExBMi9RTUxVVm9WQ3hDTmR4?=
 =?utf-8?B?Ly9LcHN2L2FCMWhMeGtVYnZpS3p2dEhQRFRHdTdBOWtoRTBqM1c2V3hNWmM2?=
 =?utf-8?B?UWMwSDlQWmV4MFJYMURyTGM5bTd6Tk8vcU1iOVEzTnNVTDhaY1p0S1ByTCt6?=
 =?utf-8?B?N200S2M2bTlRV09wbjRjaDlIQ0Z1YnNDK0VXVytSZ1Z5NTVibDY3Y1V0TXhG?=
 =?utf-8?B?amFiK1JZV29jVjFqQ3ltVnBIZ3RxRkRzNDJQWERsNWZPbEtrTTFrWWJCSEpH?=
 =?utf-8?B?WkJqQ0dkQzdxZE9LUUJHSThEaDZwWndLUERJejBwVXlIR0xDd29wb1YxUlU2?=
 =?utf-8?B?Y2g4MlN1cGowVWFmOHU5aE9qdjlIbHFsZUVnaW9SNzBvL2xJQ2k2VHNXNXBz?=
 =?utf-8?B?cDB4QytFZjk3ajA3empIUnJKeFJYeTJBdndQRmtyRTVHSGFxbnpLN1VBNWpM?=
 =?utf-8?B?YjBRdjdmd1JzOTYvbnFFeFhPVXVmc3hJNEkycDhkazRwZDFiMG5OVVJJeXdO?=
 =?utf-8?B?cWVpMzd6SC8wbkhNRFNoZ0pCY01rWW9FY2JpNU9BL2xCa2VDNXBqakU1dVJj?=
 =?utf-8?B?ZFJScmtlNG5zVk5MeXJwMjB0TWorbW1IMlJwcjNoYjIwb2kwOTMrOU1rZmRa?=
 =?utf-8?B?cHRzeCtUcWZ5TXF0Q015SGJzMjhwRUh0aFo5aFFlWFpMYkx0N1Y3K0svN0xW?=
 =?utf-8?B?OXBSMXpUZVJ0Nys0bW0rWG5HcnFyR2RoNVZYdmViR0szR2dzRGNzU1lUY09F?=
 =?utf-8?B?Q0VzVnJpc0NOOUVsQXg2Y05BTGFXbmJBa1lUNWljOEFqSTY5YjBMZUlUZitu?=
 =?utf-8?B?bkl2YkRNeGJGZ29pbEswcEZ3RGFtRXB6eWZQMWJJdU1jYUhYcHJZVU1YaUt3?=
 =?utf-8?B?U3N5NmpMbUhUZWREYUtETjJ6enhWOU0xQVdKWHdrMHBZMS9VNWdCOURLV1h6?=
 =?utf-8?B?SFRTL0NlWUtPVHdNUnhsUDdhUkQwYkZHbFpGalU3YkZzbXJmeG1EZHg5NzBP?=
 =?utf-8?B?YUNIOWFEdUN2cWhGUlFPa3NRYVNmTm5TSldhcEpXN3VqNThaVHRNR3B0QnBP?=
 =?utf-8?B?NGtISGRLZDEyL2JrSWVNaG0rWmlpWTZ1aEJMZTlsL05ic21MVXZNT0UzMHpx?=
 =?utf-8?B?dW9uN2hqTGlUT3pReVZhOHl1eThDbWJCMFVBVUxYNGcySXZaSHZrbzE5bTlz?=
 =?utf-8?B?aGdILzRRYUR1S0VabHRRN2pxaDFpVXoyNENCUFJHYzcrc3djZE1ZWlQ4RFNM?=
 =?utf-8?B?NVl6MFd0RWUwNnlSaWlYbHp2OXVHQXIyemEyeVdwWmRsSGtTTDZEc0xxcnN6?=
 =?utf-8?B?aDlqUEd4TlNaaFVvQiswV3VoRU5aV1liN3pacmwzeVF3ak56elRDNkdoYlpx?=
 =?utf-8?B?Qy9iRUZhb24xRTFsZ0FLK2ZYMlU3Wi94dkpYeFQ5cmprdFMwK25rZGJFaDN3?=
 =?utf-8?B?WW9reWhVOGRUQ3lSaE90bHA0U043eDMyMkdEWDhNc3UzYkdHWHk5aDNDMUVz?=
 =?utf-8?B?Rys4cnhiVWVVWlhhSUZtdnRPVkxNVHlpN0lxT2g2azAwWDJNWDA5ZTl6bytE?=
 =?utf-8?B?aHc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b87dc77-766b-40ea-e0cc-08dcd3ce497f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 08:30:13.1708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEJwlBpE3HG0D3TtjsbD1H2luIYyHVrXTDtiNGOk+JvDoUt67QzLM7syFu7MuKfJi0WWBgplgiY8wVkKogpEenwM+s2EAPz5E7YLOQcRzE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966

This patch series adds support for basic GPIO
operations(set, get, direction_output/input, set_config).

There are two SIUL2 hardware modules: SIUL2_0 and SIUL2_1.
However, this driver exports both as a single GPIO driver.
This is because the interrupt registers are located only
in SIUL2_1, even for GPIOs that are part of SIUL2_0.

There are two gaps in the GPIO ranges:
- 102-111(inclusive) are invalid
- 123-143(inclusive) are invalid

These will be excluded via the `gpio-reserved-ranges`
property.

Writing and reading GPIO values is done via the PGPDO/PGPDI
registers(Parallel GPIO Pad Data Output/Input) which are
16 bit registers, each bit corresponding to a GPIO.

Note that the PGPDO order is similar to a big-endian grouping
of two registers:
PGPDO1, PGPDO0, PGPDO3, PGPDO2, PGPDO5, PGPDO4, gap, PGPDO6.

I have other patches for this driver:
- interrupt support
- power management callbacks

which I plan to upstream after this series gets merged
in order to simplify the review process.

v2 -> v1
dt-bindings:
- changed filename to match compatible
- fixed commit messages
- removed dt-bindings unnecessary properties descriptions
- added minItems for the interrupts property
driver:
- added depends on ARCH_S32 || COMPILE_TEST to Kconfig
- added select REGMAP_MMIO to Kconfig
- remove unnecessary include
- add of_node_put after `siul2_get_gpio_pinspec`
- removed inline from function definitions
- removed match data and moved the previous platdata
  definition to the top of the file to be visible
- replace bitmap_set/clear with __clear_bit/set_bit
  and devm_bitmap_zalloc with devm_kzalloc
- switched to gpiochip_generic_request/free/config
- fixed dev_err format for size_t reported by
  kernel test robot
- add platform_get_and_ioremap_resource_byname wrapper

Andrei Stefanescu (4):
  drivers: provide devm_platform_get_and_ioremap_resource_byname()
  dt-bindings: gpio: add support for NXP S32G2/S32G3 SoCs
  gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs support
  MAINTAINERS: add MAINTAINER for S32G2 SIUL2 GPIO driver

 .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 106 ++++
 MAINTAINERS                                   |   2 +
 drivers/base/platform.c                       |  28 +
 drivers/gpio/Kconfig                          |  10 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-siul2-s32g2.c               | 581 ++++++++++++++++++
 include/linux/platform_device.h               |  13 +
 7 files changed, 741 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
 create mode 100644 drivers/gpio/gpio-siul2-s32g2.c

-- 
2.45.2


