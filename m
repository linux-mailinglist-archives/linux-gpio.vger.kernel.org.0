Return-Path: <linux-gpio+bounces-10707-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB42E98D8A2
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 16:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 322B31F242B9
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 14:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A27A1D1E9C;
	Wed,  2 Oct 2024 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PzO3zbX0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2062.outbound.protection.outlook.com [40.107.105.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6755D1D1F4C;
	Wed,  2 Oct 2024 13:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727877589; cv=fail; b=Syu3IGgyBICwO0k6dORlYl3qGglgLj6GO97TcAtXC8EDujF4mb8RTLWD3bV06AfEtD4Cwie3IkrjlAf2eE8W33UfoH+wElsSVJhWVlWSA5j4vHT/C7pYH/2NCroYX8PgKaKc7ll8CdUeWBIyCNv+ZbG3gKnYIenXz702kZbvciY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727877589; c=relaxed/simple;
	bh=jHvAOGWY57WxwggQqZgesb2FOQD2znDBDHWriJmyWo4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FZuXpXvYwteluPFk9x9TawD9VFx7wK6kIaH7oPT/9ebJ0snDP7RGLa2T0Pfajm1lLJdTd5O4kajJTvrQJQJ1aPFaBxH704H7rVnyMJOU27irNdL72ng5fn5zS1GkyJAFD2eVVd2qaUlJLFQ5JPNI3aEPX3qjxQjjMhfgw+jrCl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PzO3zbX0; arc=fail smtp.client-ip=40.107.105.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXqRSvacTjKPpWvlnCPaB60R2XiM+pAlKG4pMGLdesgMU7bJw3ebxZFnGDFCC2ZeUalAPAb2TUDU+QWYjjDwIuWg+l2Mnj+g8Wk+mSn11BIUDZrhAqBFEjgReGxJ9mW8DO4oN3413/FyLthXbwEG1Bc3OIkNrz3KlJRZehnAej27BpxApClapUE/hB2V0HgRqhGt/mjL9E6krxPXDPvnI9lkl9xd/ylKrxPA382ANL9wD+1qnoqbfGnkrQJfoeVbOAGCLJgSt3vDgEEDMnHSg8DT4XbXGG7ZfP+npqQIKZe6idHl4zenCvTfL8Lgzu69gr31oN5IVzAG7vfK/Iyv7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RABrwhh4lml6ccs5r3/RpDCmzSgYIEhcoM2BvV/2BoY=;
 b=xhKuJBME4GnZGsi9Y7b0H5vZyaLFPY24HPPzVsPLtZXD+vdKgZM1cdFGOIG4gaZeGlwoR5SCSKWB13+FunRgmbbE/WE4xL3TBYWS6A7BI7xfcl4j4yTsN+5pVlyUYR2jFmZqvi4P6DfLLmj7+UdUScezhl3Jvy7967HvS8r5UsnX6Jodw/0FLt9iQBCXKUJgeyspPb97RwyzotIKaPOFPQ5aHowgdqaMz3T4WcgGzDsN90J0qG16fIuw9BxCwIaZJ5Zoi9Y+hdnNJHthViAqLovJKIlc+SVm4gpen2bYM+8dxuKbkX+hEZIfmcf+uzMs1ZCWnxNSR1IckyI59lebug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RABrwhh4lml6ccs5r3/RpDCmzSgYIEhcoM2BvV/2BoY=;
 b=PzO3zbX0TBc3dhSXzYq9f9zKoONmh3EAbRKcVj42MU9Wz3VyHChuLkQWtpyeFTw9TF7/CULkErd8ON1MXCllE2DsnN/354YZxXO8YgcBlVnZz6cczZfOp1amYyn/s2WoAoXa+gdSEfjZ4R/flzysqCj0DO9yBFCf3eX7t0hAaLFJ6cyYTtzx5BCoHB4quSUMIIefMt6/QZ/7k4GM6HrgNXfk0DkefStr75PrZxrfs/PV8LpjFdzRCaUU+Zt43IKhEXX05cMokbAJzI5PElvjx2YGh+R5X+nRIx0ZmGziuLsN1y2zzefCucjqYnVWp7Z3U01j4xOwt6Slg0vRAI4bog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by VI1PR04MB9739.eurprd04.prod.outlook.com (2603:10a6:800:1df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 13:59:43 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Wed, 2 Oct 2024
 13:59:42 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v2 0/3] pinctrl: s32: add missing pins and an S32G3 compatible
Date: Wed,  2 Oct 2024 16:59:17 +0300
Message-ID: <20241002135920.3647322-1-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0007.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::18) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|VI1PR04MB9739:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e4ca4e-7ef5-457d-22d2-08dce2ea76ef
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjZrUkEvQ0IzQW5Nakx4amVBeElqb1hFaFliZGk5M0lBb2NGWWJPS3VIOUFn?=
 =?utf-8?B?QkJVd2hXdGx0dkJ0SG9NSnhRcFByZm9iMWp0S1hVZ0FFNENJVkxvSDFaRFZ0?=
 =?utf-8?B?VWEyMzBBYjUzTlg5eVVRQ2RpTWVoZlpPb1BOWmtBTzdrSVFSblJkalVETjVK?=
 =?utf-8?B?cUpLL2I4NndMY0loaGlleFVFeHk4aVQvM2V6Vmswak5iRVNHY2p2N0M2T2Zz?=
 =?utf-8?B?MkdmVFlUUyt6VFNjR1pZNDRCVkZSZTM4bktaUGIvcjFnZE8yV1hjOHZGeE5i?=
 =?utf-8?B?WEVhSkp6cFFhTEovdzZkT1dWMjdaVUJmTzJNYWZTZXc5MkJWajFGQUxjSnN1?=
 =?utf-8?B?S1JtSFhZd3UzaTZ5QVJRbjUxdG1OTFBJMlhZRnlLL0V6WGFva2RLb3BTOFFq?=
 =?utf-8?B?aDcvUXVnbEprWFlVU0hOd3I0Z2NWbXUwdTBxKzlLT1NGMUxsQTRHd3pkaGlX?=
 =?utf-8?B?NTAzUkZUWWo4cDZZODJEMWQvQy9tazhrcWxPK0hCNXZ5K2Vtc3J0NDlzc0NP?=
 =?utf-8?B?SlZjeTVHd0daVFQxMjRMVDZwY0Q4VEQ0QUpCdUw3bitNbVBZUEJWYnovYnJj?=
 =?utf-8?B?WVNKMS84eERJRVA4R3BmNXVGY1FxN1hVOTRMcXNVM0xGNEVrM1FwS3FnRmJ1?=
 =?utf-8?B?R2VXUmpKQm1OZ292eHN3ZDhQN3hpY3FTZlBJQUFEKzhFV3dzaFhvQ2lua25D?=
 =?utf-8?B?dDRlTEQzOXArSU1TR0FvMy8veXBDMVhEbHlmekhBVGljODdhR1V1VmtYM204?=
 =?utf-8?B?cUZvcWVzd0xKYXA5dTlvbVVkQ1VxWm5UVW94b2pFSmpNak1TajJnOU1xUFR5?=
 =?utf-8?B?bjJhRlN3ZU1CcWl0T3hheUZkTVRRWHlKQkQwUzRIZEhBdWJTNWpGQ2lMYzdM?=
 =?utf-8?B?TVl6a2pObjNHU09Ja0Q4MmIzaWhsdXZSQWh6L2pZVE1ObTlDNkpFRlpzVFRO?=
 =?utf-8?B?N2dVam5GWEVXYVdpbzc0RHA1RFV1TGtmV2lINTgxd2Y1cDdWMElKMmVXcHFj?=
 =?utf-8?B?d2dtTlNhd1pQTUZJSDllTkdraFBPQlZYTTYzNTM3QjVkWVlFVDQyTDBtbWtm?=
 =?utf-8?B?UnFQSkdWRGZvSFN1bmFKelRqUUNLYW5tLzM1WFQ0WitpcmhWTnczOGVoTUZz?=
 =?utf-8?B?MmhzSC9tQ3pjcWVweTJpN0VuRFlHL2hpYmFGK3h4MC9sTy8rUHBQYjJ2d0hv?=
 =?utf-8?B?anFKemZvR0drc1kzRjhTOGNjczdKNFI3YU8wM2pCNk5Valhyci9qMzFZSzE0?=
 =?utf-8?B?VExRZXpPVnk2amtxUUFLSXJ3T3lSL0FHZzk2UEtxOERQQmZrclFNN0FBTlcw?=
 =?utf-8?B?TTZ3cEVhVzkralB0SFhMVC96WldrMU1sMS8zSXlFSlBWT3Y0TGdOSWFPRm5V?=
 =?utf-8?B?ZHBRdUt5bVN0cnlRcG9rWG5nd3lMVHZyYjRvbmNXOE1RaE1OTTRVZTVGa1RY?=
 =?utf-8?B?U0c1ZEpJc1lXQy93WHlnREcyYnB0Vnl2dXMzeURtMmpmbjdxOW5Qb1ZFeTNr?=
 =?utf-8?B?S1ZEeC9VVnMzeDRIT2loQS9RaXcwdXRRRGNZd3BMQXJDVmtRcWFPc2dkUnEv?=
 =?utf-8?B?U3FSNWQzUm8ram92R0IrVUV3S2NweEJvdVRXNFg1Ny83dTd3T0Vaem5YdFE4?=
 =?utf-8?B?SjNKRkV6cStJS1JBUFdqZWdUOGI4ZHBKdHp0ZmtSTUt5eTVqVXVEd2pFbzIy?=
 =?utf-8?B?VE5pazdxM1RDc2NlS2pUYnQ3c2h4bzY0SXJNdngwaUVFdGRIWjNKZzl5c3FL?=
 =?utf-8?B?WFdYdnhBTjAyeVIxeDZWUXJXbXFpVjY4em04OUZlR0kxeDRNbmszMndTWDFI?=
 =?utf-8?Q?eiOLYdUqk4ikmmc/+UlERmjRKjaXYm1+KVNzA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUlEaFZSMHZNYzRNUkxGZTNrOFJVN05sc1VHT2Fxa01jWFE2azNKR3hVc1pR?=
 =?utf-8?B?VHhBbm5uZE1aUFNpVDRncHVsK09Xd0M4Zk1yeHRHMGU4aExkVk0xWUNOemMz?=
 =?utf-8?B?K1BrOTBRYmx3RkdxUGMyWEhFOWlEY0VWUTUxZ0ROOW4zYW1TenhwOTZMOFpj?=
 =?utf-8?B?TmZIdkhHbXhwbU0zUTh1elNzQ2l5V0tUMDNyUEI5M3lQZktidExHSnNjWmlu?=
 =?utf-8?B?cFVLSjBncGlqREFML3Y3aVgxS0lDazJiSmx6L1FzRm9ZWmsxWGJyMm9jeG1m?=
 =?utf-8?B?Ums0allobWR4TUZJakhZVDMxRXJxR2RWYVNRQ1hVbURwYnRLb1BMVlhyWjFX?=
 =?utf-8?B?UWFYdUZEYU1PL2E0Q1pVT3NtYTR5OWl4R0hDaWFFUGRYd0s5K1J1S0JSZ3hD?=
 =?utf-8?B?eDlmTzBpZzN3Y3NlM2c2RTltZE9jclpBN00vYjJwWWx2VGYvK3VrS2xPWG5a?=
 =?utf-8?B?WWhFZW5hN1FwT04vVzA2U014bkNUMVRrcVA0RkJpK3FWVFpjWEN5RjJNWElM?=
 =?utf-8?B?SDRvSEhIc0ZoSys2NW9UVnhiejNKVDAxUTI4aGQzTStrTWZueU1xQUtENi9N?=
 =?utf-8?B?ek1CbWZsOUYwUUFCZGd1WnVXSitpb2ticDI4TjFucWFqZFJjd1BybzkxKyti?=
 =?utf-8?B?MHltUC9YK09wdlFhQjNTcHZORGtIMWU1OHpyTWppeXB2STN6dVphc3FyUUlX?=
 =?utf-8?B?SFBZMmxhS20vd1hYT1ZmdEduVjhaZVBBdUNMeTdHazhnUXYzcWwyY1dUWjk3?=
 =?utf-8?B?UFZjeVplY1JDZzhOV2xGWnNPcTFIaVpjNjB5aFlReGRLQ3pHY25UTk5VWWY4?=
 =?utf-8?B?dmRmOVRPRHR2eGRabUJNRURSeDVwMi9KeDZrQnc3ckdDRmtrVk9icDQ1SFpp?=
 =?utf-8?B?V1Z2blE3RStYaEt0UTN0N0h5ZVB2QlgxbXpncUlBeGNLQXJ2QnYrYnBaOUxG?=
 =?utf-8?B?b3BpVlJxbUFjRUJiNTNPMHZDNy90REQ0UTAzKzVOQW5nejIrOXBFL3RoclB1?=
 =?utf-8?B?SHhaa0toWUhsTTY3YlNTTkdIVXBycTR5UkhTMGIrZk83bWNLWi9YM1dGdlFq?=
 =?utf-8?B?ak9mZTNjcjlsWUs0TVphNWtiWDkyV1ZkbG1vMUVOaU9ENktGTlg0elJ2Vkxw?=
 =?utf-8?B?bzNFYngwNUJHWk5hTmZPSjdCbmd6U3dMaG9VY0JKb1FXMkdvdFBSS2o5NUlP?=
 =?utf-8?B?cW1pTlB3Zm5uK3ZrYW92SlJva09jRkpUcGRsTjl1UUIvNGlQRmJyK3RzZ3g3?=
 =?utf-8?B?NEVsZEtScXQwYmttQkpzSXJqeklBVnJKMnI2aTJhYjZYK056QWwvS0dLRzdD?=
 =?utf-8?B?dkdQcm1EV1JvQ0lrQWxMYTdKWnN6NUY2SUdsaTh0RTAyTmhuUEtEczN4dHFq?=
 =?utf-8?B?bklhUkt0Zkh6M3p6bFhCRTR6RXVHYVNJcUo1R2hSVDFSMnU0cmN1cHRIM3Bp?=
 =?utf-8?B?aWF3WHEwb1dITlcxdEJXNnh1QTF0UXNobXZ3K0xZY3B5b2NKY252ZTlaa01C?=
 =?utf-8?B?aXdBRzFtS1J6bEFtOHFacHNSOFBTY3BMVnlxaTNTOEQ4NzVjWmxSV05Qa2VQ?=
 =?utf-8?B?NVZYOUdRcmVUV3k0TldXbloyU3NzZlhuWHZxaFREV1Z1NjRFRktjdnl4bDZ1?=
 =?utf-8?B?ekgvci9QL0tPYjFNYUdERU1LVkFQWEdTVk1RLzBkd3lvM1ZEYUQzM2pRZDU2?=
 =?utf-8?B?bmRXMnJWRGd6a3Q1dTZ1SWlMRVZqTFdqM1FQa1JuOTU2QitPeU45T3hJNmw1?=
 =?utf-8?B?UGpYa2FvQjlzNlpuVVdrcHBuUDBNQk5ybXA4YzlLMFBJU1MyZjRkVGdyZlVo?=
 =?utf-8?B?UUNhUHBidnB4Z24xWjl4YkxRRUJqNENDMGRrTEI3VFlvUWZyQndIb0psSVcz?=
 =?utf-8?B?OC9Zc3NCZjA0K3N1Z1BNM2NZLy96dTlRaWMyUDg3elFHTWFFMFBwUkh6N25Q?=
 =?utf-8?B?QXkyM1ZkTlhBNzBQSkNuT0p6L2ZSU2oySmpFL3ZPYW1nVHhPUUZmdE5LQ2VC?=
 =?utf-8?B?cm9MWTA0SEgyblhITzRXNXdVc3ZIWU90TmV1QlVWWW1tTFVRb2hTeXo0ZG9Y?=
 =?utf-8?B?UTBQVjNsU3JHZ2Mzejdjbkt4NTR6Nmc0R1MvTmtJK3JQS0UzQjh5dE9sbHkv?=
 =?utf-8?B?VFZ3ZDZJQVBvWitLU3R3T1V2aFp4dUhiMC9WSkEzYUFNcit2TmNXdmhhbFR2?=
 =?utf-8?B?aFE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e4ca4e-7ef5-457d-22d2-08dce2ea76ef
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 13:59:42.8778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUO8M9ll6qyDO6Dw2Nxqj/zlDaKlsBB1jTgj7OnBaII/yENmYNAEEYvePXTJTMFDFm92hCAwSA3Z148KbBw7buRvBh4Ay4WVIlDPjtnIrVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9739

This patch series adds some small fixes to the SIUL2 pinctrl driver:
- Add some missing pin definitions.
- Add another S32G3 compatible and use it in the s32g3.dtsi file.
  It will fall back to the S32G2 compatible.

Andrei Stefanescu (3):
  pinctrl: s32: add missing pins definitions
  dt-bindings: pinctrl: add S32G3 compatible for the SIUL2 driver
  arm64: dts: S32G3: add S32G3 compatible for the pinctrl node

 .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      |  8 ++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  3 +-
 drivers/pinctrl/nxp/pinctrl-s32g2.c           | 52 +++++++++++++++++++
 3 files changed, 60 insertions(+), 3 deletions(-)

-- 
2.45.2


