Return-Path: <linux-gpio+bounces-36085-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMrwLO7S+Gm41AIAu9opvQ
	(envelope-from <linux-gpio+bounces-36085-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 19:10:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 271D34C1C7D
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 19:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3CC3301BA7C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 17:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B09282F10;
	Mon,  4 May 2026 17:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="E440B4c9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011034.outbound.protection.outlook.com [52.101.70.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB8C3D3487;
	Mon,  4 May 2026 17:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777914567; cv=fail; b=PqW0VP/ZYQZRCaZ4hLkHc1oZAsNuhEUza2nCjBymbP5bq7R8eXxH1b+6AVPXaD0XoU3Vwi5uYxYkiqiUdwArXtRlRXlR1QW2ooPsXlOmaTTtWl7yJUDhPFqLFTX3NMPBApSrD9i/z1Dlieghp9ctJjGtPUBFsMY45mKRpDo9ENc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777914567; c=relaxed/simple;
	bh=cCl3BXZeC7z5Roi9o91ZRExRwWvTUHrNrd0+hVDil2E=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nHJ0CplhDSWsaCqi+OnZYJSXLKDFIXcvtz2C3WFE5rfkqo5hbQhP1SHOgUEeuxCq7MeOEtJxy44P7KU+lZU8Q0arkhUXWDEEz4cdTIEdprH4E4VzTzYqhn6hXtD8miEuvD/p6w6sAXIG3r9Zgell2up0Sw+kOgZGrJ9X55+RzzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=E440B4c9; arc=fail smtp.client-ip=52.101.70.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yALOatNR4jkCwnFk7KdxOc2GJziUHOC2YhxZw/uCzTAoF84UV7IF2JScDtW2gavR/iqiMDast4mnzraK0IkhCg9IbxF4J2gMH62GWGO4mm0TAZ+T87x6lzrw+hKlBTOW3b2cDsKx0OC9ZxpF9Xw0kNy/xIP5vB/xF3VKysrjs/im5ZpacO+L73XzHxB4GFIh0IvaULkz7pwdDct/0/1ibKFBmUyS51zaOyoA/s8+i5Ii7CKduscFTH86anwTDRIt2y8te68LQ5jies5ENW9iCNHxaCAAM9J4yw4qiFdMpbkIQSuQSzM7WRf1peh2bj/cwN0rgE76jj1sWM4oAg+xfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tzh+AwxA4/9jl+CGARtak5XFqCUajD4/x5a1uMP4slw=;
 b=UcnPmcTBhjLOAFRt6w1jJBTnJLkrcwdXEYhTtnNKM9bEd1zeoUcz0nR7fkLEZ/kDQ98d9WpjcyOKuIcbzfhiuGN/d1EuRvpl5T1XjQIbK/tRAr5zTzQGatO4/5Xbty1kT9hwwLmN5pTdeZicohfqLgRUqiolcqZ8U29Z6wiX0jlSlbUGcFlNzT/kFFsvPYqD9Xl3jknGm/4P39uhVLQI4SINsoWlZNLK20j+03a0pr8POf84TTd+Ef6r+8KpzBRNvBn3T12YwFfnsPJ1Wo0xGo1lM1WNHOINCt39PHwK0L+9y9fb/b6437RGLqW1mujpQdBs7TNQ5lgJ/po8tPwxoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tzh+AwxA4/9jl+CGARtak5XFqCUajD4/x5a1uMP4slw=;
 b=E440B4c9XS0PMs3LzD9l6mcGnoCiYkY1HZ88Id2lNHKDX9AZPgGZjkpdrraO0uU3D6MxGSL9zswIQtLSlApmCfs1RAXIxwluulRlGsctHNFlhpBFY6HW0tpO2ONWYWmxL8kes2C1FstGS590b5E8Sf5qc1FrqHIvcJI5uYrQzwrkeOB5GNeDzBdEyqJiwW8fZzP45BPeqqo7fFEwxyncaWEr4bydLahWLYbzaIvBkb6tyABWMde1RZW4yoLwsayg1mGsdsqH9RK9aWQYvTJ8RR+uhu7n+AjVfwclKrZ5T2k4eUr2f2MHroac8bKNNX+Qw0faNiwmf1XmbwB4LQ2vLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB8202.eurprd04.prod.outlook.com (2603:10a6:10:24f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 17:09:19 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 17:09:19 +0000
From: Frank Li <Frank.Li@nxp.com>
To: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linusw@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROLLER - FREESCALE),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] pinctrl: imx1: Allow parsing DT without function nodes
Date: Mon,  4 May 2026 13:08:35 -0400
Message-ID: <20260504170836.1794372-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 08769e9f-0f70-4499-24de-08dea9ffe156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|19092799006|366016|56012099003|921020|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	U27hKmnUq1cVNxbnNN5NtLxfgwuLUAtER2+nJlJe4b0ibbn4GXt2TB46Iafr+K/SprZK4DguPWsSffpCPlYIKiBm2psyL3bDsPtVykz8kehULqWcevAnLl7nsUNMiK8SmGqPdhn3P7Yed+I+YikL6H+FpTSnhPv1qwKiyteAO/gwY72cAI9ruVgMi4KknjZHxgQvvETPP3VafI2ZyI6ZXXvcZpZIFSHD9NgbuR5c3XuozalEz0gJrfRQ32XNAXW9XGx2O/gtqv8791TRlNnwggpkFcYbzIqtiM3K/fGA7jj712iq1tBku71j1QgE4IIdJkcaS7Hfm2NR6u7e4iDoSQQxzOj/2TSRdcwNccefoIAKCbww1EqcEaIZO9DoIbAVUey5ArSQywnA/QUFnbxQmiyP+yUFrEIF6S/4WhfhAEDYwDdCYt19O9rQWrZ0ZAW8/rmDHnYfrfG1d6ZDm/qCNqGXrwlJyANCR6fpBCHApBX5Wr6DeTCck+MCKyH4sPkEWWsLIU/wwkYafpQICDqEs7V1h957V6UqG2XYX+aJhPzn58u09yY3hINqJZmeKQq8pZxH1f84B1g1zsw2o8MTmvfO6SLnyvYVgNzMRZ/DuhWj0KEBi6VOz+167SGCEuD8NNxUlTZNrLcGbUyec+oz2C5suqxx8iRoS/z6AEnRuFmvgWtJe4/zeGQg0MFrCHl7Hgwd2FR+V6bhIZCEGFHtPcmMYQQjMYhJ+W81kZqh7l8DteOLWko4Ky5QLrLcPBrUBemssWnV91MqyXR8E5n41Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(19092799006)(366016)(56012099003)(921020)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUt0WmlBdHlOOHd2V1NLVEFtK1dSWktqbW0wTTErbVlQV1FLZnRqWk5lUmVH?=
 =?utf-8?B?SlBCS294Q2RyK25OWmRGY3FXeHJ1VGlYRUtDYXo1QUNxUm9NdG82S09vam9y?=
 =?utf-8?B?ejJQZUZzRzdhaGhEZjhPbWdSemZ1ZjFLSFI4aytWdVFyL3JUU3Bscm1VVTB1?=
 =?utf-8?B?eDdQaERQeUJuWjdFRDBaQnV5TFhkczZpSmMzRFV1d1VKUWZwQ1FSTDVCSlJY?=
 =?utf-8?B?d29yajdQcGRpQkhuTTI5NGZjK1VJMEx5LzYwNE5zOUEvbFpCbEs0WWo4VC9p?=
 =?utf-8?B?RkJvVkxsZHdjbXJuSmdFcmU0dG5sUEFrVEZobjMvd1BZa2FVRUh3MG13TjZx?=
 =?utf-8?B?YmNONDFHYmdiZ1JHeXlsT1NwZkROWmNvWDltRm9wejE2Um4rN3BURzh2WURZ?=
 =?utf-8?B?RTZBaGpXaXozbU1oY2k4N09JVjA4SHZINWVWZWZRUWcveWljejRQc2pGUmwv?=
 =?utf-8?B?bEwwRnRNTG9Nb2RXYUJjQy9mZVJEY3JWeG9PVjBCTFVWZ0swMTRtaVJJenVB?=
 =?utf-8?B?czlIaXgycUpaV0pqV0RNZnc1alJocGVNeEJWeVRWQWduZytWVHJ1RHBvZE9T?=
 =?utf-8?B?NUhRMGNuL21WWWdHL25FL1FlQzQzbU10VkVoWFpwVkZkYjZIT1lmbkc3QUlt?=
 =?utf-8?B?K3F2T25TNGZOV3BqZGZ4N043QmEwWForZDZDYnd6OEZRbXdrSWFENi9WWmhL?=
 =?utf-8?B?bE84UmpUczZ4cGVNQnR5ZTN3SUk4RGdYVnIrRlR2Tm1rZFdhVHdUNmhkZmZR?=
 =?utf-8?B?OC9iODhoMXV5eXkxOE9LQzRiM29hNnE4WkRkaGZwTG1rWnQrOWRRZ3oyY3ZR?=
 =?utf-8?B?VWpqazB5d2UrQnNXOUFWWkZnSTRTbUNtSEJUOVFTUlVCQjJKTGlwV2tGbm11?=
 =?utf-8?B?d0J3ZFk4Q3QwaitUajE3V0RsbUprNGJYdXl2ZUYzK0xwNEZtL0dtUFVENHNX?=
 =?utf-8?B?cmpnRm9IYUY4eHFFaHQwc0hFVCtOVkhpZnhHalBMU0g0bW9iK29zQ2Z4UStw?=
 =?utf-8?B?U014UENRN0JlYjFUNnFiTkxNeld5aEV0bThXdHZIQXRBNlB0UnVyeEpTMXd2?=
 =?utf-8?B?TjNOcHNTUWpSNTRqS0hCek5PQXpxeWhZUi8vWHBabFRZeEJOaHlyMms4ZElI?=
 =?utf-8?B?YnFIVDd5Q0prS3JIWGtjR1UxcFFUQUFOL1d5Qjk1LzRtT0ZsKzY1aEdjeUNU?=
 =?utf-8?B?RWRsTXM5TC9Zejk1TTRmOTllV0NCQWFaNGR4MXcxRVcwYVhvWTB1QjRGS3Rl?=
 =?utf-8?B?OHRWM0JDYi9xNVpva2JhS1BNWnJyMHhRN3RNSDZ4WVQ0WWZSL0t2Yk5FUXZV?=
 =?utf-8?B?c0ZnNTZ1RW85bXFHYURPVDYwNGpTT3NKUGlPOENVNmRyUWJJSnFBNWl3dStE?=
 =?utf-8?B?TEhYdWdoZnUxY3ljOENjYUJSWVVhelc5Z1BZaUlFMEF6Mk1TYTlXZHNZMXE1?=
 =?utf-8?B?MGs1NWc2NkVLMlE3RjlZaHE3VHVZKzI5UXFFWlFQTDBwM3JKcmE0Nno4QzhX?=
 =?utf-8?B?b3ZOSlBLc1hMS2EzUUxkbFZJUnNXcENQKzRnWXpEc1ErV0N6VWxNK1MyN2w4?=
 =?utf-8?B?UWJ6azBsc1FjV09Ba3Q0WVRPdm9NaEJxZjRhd0krRzJaa3kvWFRLYmhQNDh4?=
 =?utf-8?B?L3JVSFVVSFB0dHFmVjk0dnBKdkhUWGdhMStNOW1OWjROTElNQXJEc3lCaERn?=
 =?utf-8?B?NDVXVk92cEFPekdHcGwvYWNNWW9Jd1U2TW1HOE1DdDBSVXNmTHd0M3FSQjBw?=
 =?utf-8?B?RUZDckxWZzF0MXl4NmtHNWM1N2lGZzEyNlY5TU03Q2NkOENZZ25NQ1UvZ09a?=
 =?utf-8?B?aDdRQU5lRnlMUEhtZUlJTjhGK0RLRmpNNVRDWDU5L0xrVGsrMXMvaGtEeGti?=
 =?utf-8?B?azVzaWMzVVN5TWdVYzZLN3BRYW5zZHFzSDVIdjlUWjZPMDVYKzNkL1QxLzdm?=
 =?utf-8?B?TEU2N3ZleGpZNjd4N0xPdkVNekljQkQ4SC9mQ2duZmsrVVprd0lqSThFRjdE?=
 =?utf-8?B?b3VlVW0zRE5BVWl2RmpwVVBLVFpaYjZ6L2c3amloUmxoc3FVS01oS09xQmVk?=
 =?utf-8?B?OTJreUZTZk9VOHlDRWdsVk9ic3J0ajBIOWdnZ0tjQnUyMXZONzNTN2dCWExy?=
 =?utf-8?B?QzZHZmV5ampIamdvRUJrQUw1SXBwTENLUG40SFUvU1Z5MGllTkFsVWFsMXlk?=
 =?utf-8?B?V3I2Nzl2dHJnUnE2ZjhRMHRrVTU2QXo0WXhEQk1UWEJsZnlQVUN1RVdHazVQ?=
 =?utf-8?B?WDNUeVVWT1Z4SFd3bXN3MzdSY0FZOWdTOVFLMU9WK3RHNTZNUE5XNWFaSkRB?=
 =?utf-8?Q?H9Eq+KBpNuxcMDAfiA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08769e9f-0f70-4499-24de-08dea9ffe156
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 17:09:19.7069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2AaQhXQ5+o11LPTyEv7oXu5vIBsnPsQ3HnlnILVUQQPJ9eWfuprF0nGTngF4ZRCco1shf0hK9CWCObw0CX9lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8202
X-Rspamd-Queue-Id: 271D34C1C7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36085-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[armadeus.com,nxp.com,gmail.com,pengutronix.de,kernel.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]

The old format to define pinctrl settings for imx in DT has two hierarchy
levels. The first level are function device nodes. The second level are
pingroups which contain a property fsl,pins. The original ntention was to
define all pin functions in a single dtsi file and just reference the
correct ones in the board files.

The commit ("5fcdf6a7ed95e pinctrl: imx: Allow parsing DT without function
nodes") already make moden i.MX chip support flatten layout.

Make legacy chipes (more than 15 years) support this flatten layout also.

Fixes: e948cbdc41d6f ("ARM: dts: imx: remove redundant intermediate node in pinmux hierarchy")
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
build test only

Sébastien Szymanski:
	Can you help test it? I am happy i.MX27 still alive.

Frank
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 48 ++++++++++++++++---
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index b36c8a1461b7c..bf07e0c64a098 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -540,10 +540,34 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
 	return 0;
 }
 
+/*
+ * Check if the DT contains pins in the direct child nodes. This indicates the
+ * newer DT format to store pins. This function returns true if the first found
+ * fsl,pins property is in a child of np. Otherwise false is returned.
+ */
+static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
+{
+	struct device_node *function_np;
+	struct device_node *pinctrl_np;
+
+	for_each_child_of_node(np, function_np) {
+		if (of_property_read_bool(function_np, "fsl,pins"))
+			return true;
+
+		for_each_child_of_node(function_np, pinctrl_np) {
+			if (of_property_read_bool(pinctrl_np, "fsl,pins"))
+				return false;
+		}
+	}
+
+	return true;
+}
+
 static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
 		struct imx1_pinctrl *pctl, struct imx1_pinctrl_soc_info *info)
 {
 	struct device_node *np = pdev->dev.of_node;
+	bool flat_funcs;
 	int ret;
 	u32 nfuncs = 0;
 	u32 ngroups = 0;
@@ -552,9 +576,15 @@ static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
 	if (!np)
 		return -ENODEV;
 
-	for_each_child_of_node_scoped(np, child) {
-		++nfuncs;
-		ngroups += of_get_child_count(child);
+	flat_funcs = imx1_pinctrl_dt_is_flat_functions(np);
+	if (flat_funcs) {
+		nfuncs = 1;
+		ngroups = of_get_child_count(np);
+	} else {
+		for_each_child_of_node_scoped(np, child) {
+			++nfuncs;
+			ngroups += of_get_child_count(child);
+		}
 	}
 
 	if (!nfuncs) {
@@ -574,10 +604,14 @@ static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
 	if (!info->functions || !info->groups)
 		return -ENOMEM;
 
-	for_each_child_of_node_scoped(np, child) {
-		ret = imx1_pinctrl_parse_functions(child, info, ifunc++);
-		if (ret == -ENOMEM)
-			return -ENOMEM;
+	if (flat_funcs) {
+		imx1_pinctrl_parse_functions(np, info, 0);
+	} else {
+		for_each_child_of_node_scoped(np, child) {
+			ret = imx1_pinctrl_parse_functions(child, info, ifunc++);
+			if (ret == -ENOMEM)
+				return -ENOMEM;
+		}
 	}
 
 	return 0;
-- 
2.43.0


