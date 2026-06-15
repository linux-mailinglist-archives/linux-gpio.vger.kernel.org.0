Return-Path: <linux-gpio+bounces-38509-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KqRUHyY0MGp+PwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38509-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 19:19:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F3198688C8A
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 19:19:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b="slj9Rc/S";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38509-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38509-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 72A8A300E161
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 17:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCD740B6DE;
	Mon, 15 Jun 2026 17:19:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021129.outbound.protection.outlook.com [52.101.65.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A85028E0F
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 17:19:29 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781543971; cv=fail; b=fskcckErwWvBzrHD4t72aooO0bc4pdnrKnHXJE0pyzhFO+Forus/5KGkbYkLW657WclkS79BNYFT1aFmTgLyOK2ucvtgUdi9EpO8PdQrCEiCHuymZ09EjIkZ7BSJFZ49E2VmL7xvxGcwDVOqNSTZZM1i8ITNtnelRSZamcKMriY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781543971; c=relaxed/simple;
	bh=d58Ud3ZA7mZtc4/Sulb0S5KhnPSF3RqfP82xqy3GhQs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=irZrsO6PgzxhnHJ1Gx6Rep/ZZB9X30I5QbdGZMxXzQuxeLeum85HQfenzWskxWAao9AmJiJA/kRy/kbKkZhlexUTevpGvZrW/en605lWXpxIWc/UpyiySM20SFfHUsTLelIuoXNki/duQyFj/dr51nWrZh/tFO8P4cw1aKKQQLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=slj9Rc/S; arc=fail smtp.client-ip=52.101.65.129
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WepoET0d///Pg4uPI37xuf+XH4r9DHNGzVXfHfemifBJeoVoRVMY119F8E2xTiiIao2CgN7MhfwWLE2FX5d3+W79ai1KKuL3HBgtlE4G+88x1zMJo69i7dzhVyrzTeJzZjqAinQRAKxSWuADPIY1Qz4GnJ8GCIwGWy7TpIjOdKdukWWEQfm70fMcsnhFz83yKl2EQRNa8xKCKGZQFh5dF4z8pWRfFWzYJtyp7o1OB4Asto/1r73ZyTspiLZdJKaPfFJ23rEm3rH8QrhRGBMlkAyKWkBJ7s7uKkZqfcfhZYarFQoE6Q3esOoSC3tv9IAnDQOjO9FTnP5MYnhV3N1yqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckyEL1pGhf2JhcF03cY1SWC0frEvx03r+Nza1UNz6m4=;
 b=UjPvxEvNR+bUuE0zTmbiVHaaSADh0pGPEEASQsx/csZZofYxmI0JTwN0KzaECI2X80sQtC2lt9qCwDmr0sPPk+3YAI8iGlzd5fxKeRmp366oAtlUcWhqVoE2zTrLmFxIwrrhbvOnEMAORRKsbKoTLBEqtn8eN18FJP1bhDLXE5v3MiQUvyvjDinMvAkxjmva4DcSv+NeVFFkK9zv0QrMLmjojLw+A5kokC+XyTlBPcEr3etQNEk+JoYo/lWVQwGNImXrjLOZBo0LAnEznPiAjXW1UN/AT+jpFWkRZAArmBY78oSBTSip6Bam7aP7Wn8k3tEtKkFy/lO5AW9Ob5AMUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckyEL1pGhf2JhcF03cY1SWC0frEvx03r+Nza1UNz6m4=;
 b=slj9Rc/Snis8yDpiCQJr+38u57cnrUehdWU/rLvIIo2YraBDpMQubkQa5O7RhS03h76/+eRQDJYM2KFCMDdIkCn3ZX4PjYiQ3FwxUOipa02D0T5E8JQbm/lqEJg5TuAGrZuXsBS4wck+PMgBDrFE/dQbYUDBa1D+5CB4v3bUERPGzqLPLRE5eynDIv21wFWETy1vaWl9lrsLLYe/Einy9Ml7/rUpETwy2U3ereuN1YmgftN4A0cDJOKQixa0vswJySyVpTc1iuXKVGcQCMP7hsgLZtaLlNqNF27mWYybBfIf/6PwPzPdoCqYjnDjOhAehU+sC0OtjYgMJ8g9yEEAnQ==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PAXPR08MB6558.eurprd08.prod.outlook.com (2603:10a6:102:151::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 17:19:25 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Mon, 15 Jun 2026
 17:19:25 +0000
Message-ID: <6477a7b8-f8e9-4db1-a5bf-921b10965c8f@iopsys.eu>
Date: Mon, 15 Jun 2026 20:19:23 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [06/11] pinctrl: airoha: an7583: fix incorrect led mapping in
 phy4_led1 pin function
To: Wayen Yan <win847@gmail.com>
Cc: linux-gpio@vger.kernel.org, lorenzo@kernel.org
References: <20260606020342.1256509-7-mikhail.kshevetskiy@iopsys.eu>
 <6a2ffcc6.2afc2531.35ffc5.cfba@mx.google.com>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <6a2ffcc6.2afc2531.35ffc5.cfba@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GVZP280CA0060.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:271::16) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PAXPR08MB6558:EE_
X-MS-Office365-Filtering-Correlation-Id: dc76b3a0-bbcb-41ec-4e2b-08decb023fb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KeluBCsJAiizR+JpEQBXiB8qjQRfmRMyVFoFpaUZmyDeQFb4UHuI9xlb6bECvXL/GOLzkUpr0tcZksc9WfNli3ImT/aC5RbD63cFxpJEMn3Sm0hvnoXLMEudUuS09ESwW+9gc6kNd8ihpOKvqZhHG5dFbHjYVcMWEsSXHET8cuzGvJhAU5m4L2ncG9ImyUT+Pz82GFZvCcK/df0da4uIHCZTIDEqTDCS3Y475WPa4A7Yk4DcFGjSCXeGk2f0qhNXwSER8Z9WyyVX2CzT35W4xUGwPn6z71DFc5eu9NxPC1UBs0IGDyX1JVg3CPGqrY/OzhrexPuRoB48LA6q2haqD53HSJaAY45YDFuhH8SV0C8khj5HBIgOHVqbO92LUD4VvkHHkhkzxfgfLYfWU25QBy8tENA9rRzUT195aHGo3GnkgOYWG+3EZD24nORetgf2JSJ6vSrLePYvdRakHp/bg+zKWQNJS8M+Se+I7JvsYsfB8es2P67bDHVr9OwjwjqEBoacx4ZiDG+NsdPKyqEaIdZcNTWWTRXZH6teawXqQ0gySNoBrESykmBCOyZwcnkXRRZjl73CpFCbIy58Iwhk7cRG3ad3eufgJel/dzraIv56mp/wgP6c8yyRYPmWcc50c6ZF1dX0Ell8pSANJt2yaNhM15dWyvo2LD74LamhrkYjHvkhD9ZJY8QMxTqa+SsU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnlDdTJ6SWtGS1ZIODVnWjlZTmpTL1lsUzRPVjNwbWRTNFBmZElObzVwRjhC?=
 =?utf-8?B?Z0xXd0hieTBQbUd0MFNuSG5sNkk5ZEpaMUx6ZG1ETjN1TlNWalE5UlNzQzM3?=
 =?utf-8?B?eXFqVEppVXZmeHlZM1c3Tnc3UktqS2xuZ1hsdXJGbmlJNjJvZWpiUUljUHNI?=
 =?utf-8?B?Vmxjem1xVzdCSTdRVndPTHFUVW1peVpEcjRNYlg4MWljbzFGckVBT0ZweFpE?=
 =?utf-8?B?YWhJS3RCTDZyNjZRTXZGUlMyMTdxa1NhWWRBdWRCVmwxMjErRXFRYVgxd0cw?=
 =?utf-8?B?ai8walFhTjFadml3eVZEb0F6eDlBM2F4YjkwSVZRbHBvbGlta2Jmd05WbjUx?=
 =?utf-8?B?NHJja1p6U045WXViOUFFaHYwU29Da3dqa3JZak00SkFEM3Fhbm5FS1BxSS9p?=
 =?utf-8?B?bm1TV003RXRCa1ZTNmZXVjV6WUIzenFJZnFNMnJLdC96N1FndDA2MDBJdlk5?=
 =?utf-8?B?RGhubHBUeWxoNVoxcTlTbkFoVHcrU2tnTHJTVTlFVWU1QXRBSWpqd1A4VDho?=
 =?utf-8?B?T0VuSjhQUjFkMW1QM3U0T1pPZG1mZ09VcEZYVmkxWmlKV2xqWnc3NWdTUW5o?=
 =?utf-8?B?VVFNVkU3WnZ5L0w0cU9NQmRSc0ttVlU0b0ZuSTY3VnZUTW5tYW1aSzZvSFdD?=
 =?utf-8?B?WUZnb09RS3pkalg2c1RCN2toSGc5QUhBcExybGdWeEFLN2h4d0tsV1gyd1FL?=
 =?utf-8?B?MjJhaFRKU01OZTdkWVFESmRTMHFpNVkyeFhtOUpMbTVBdVo5SDdGbEJTb2xs?=
 =?utf-8?B?VVFPVUtxU3k2N3JMMlFxazZpWlN4VmkrU3U0a21CeGd1Z3VYUm9NQmV3TW5J?=
 =?utf-8?B?SUswVVV6NWlJMC9vRzFhN0I4dSsvVTU5aThxbk8rQnR1elhyUUxIOHFIb3Iz?=
 =?utf-8?B?QzNPeXdXOUxEdnorUTlPR3NuWlc4eGprTDBYZS9lT2tGWjQ5YjVnK3hJV1Jk?=
 =?utf-8?B?MjZ1dXRGS3pISEJpK0ZwSWljdHh6MUFITUpCRStIU3BtMkZSTTA1YmZLUUhp?=
 =?utf-8?B?NlNJQmtxaTBKbVpkMWQvdjlXd1BraUc4VU85di9yZ1dPb0FEMUpJZGpVN2tp?=
 =?utf-8?B?eGtuaDc5N0cvbXZ2ODVDMnc1MTkvQWVBU3hHS0hrME04L0crUzliTkQvWkN1?=
 =?utf-8?B?Y3FBZ3hQR0h6NVBpSSttMFdFakxpYjBPV29LMXpnZ0wxMFdRd0xCdE1PVUlD?=
 =?utf-8?B?N3huSTVKeGZkWmh6QmdZc2RuL0dmb1J5a3Y0aXd5UVVrakQ2MnQ5VEdNU01a?=
 =?utf-8?B?OU1Ic1hxaTByRTQ0MUU3ZGlPaXVCOXgrV3MwNDVSNjdZK1BmTnhCQ0loZnQ3?=
 =?utf-8?B?K2FFZTR5TTdtdllLdFB3R1dxcllZN0JWM2hMMEtzUFNndXdFazlxc1pneUpn?=
 =?utf-8?B?NGx1cWNlYTMwQnk5UWdFT0srdER1L0l2V0pucWExZ2F6eEkxYTIwc3ZONTNi?=
 =?utf-8?B?TFBIN24vcDdMcGg5TW1sV1RieU1EYllscDRUYWdZVWNVMmpnMms4R3A1Mm9x?=
 =?utf-8?B?eEFCalMwdlBmaXBwNGtQY2JVdTY2NGk1eTdsK3hleFNTbDk2NnNqL2trbDQv?=
 =?utf-8?B?TU1POGZZNFdNSllhdkVBQWVYbEFHWEJ2L2E1Tm9nQnJjTDFSRjc4bFp1dGNO?=
 =?utf-8?B?SVVlZEN4TmE0NDFXVFBPY0tsVDhpRjJTbnoyMXZiZ05hVU92VlIxakp6RTlt?=
 =?utf-8?B?VkJtSGFoazlSSjdSNHRZVHdCNDI2TUFPdWljaFBWcGgzMDRTb3hZWHFON2ly?=
 =?utf-8?B?a3U5Vk5sd29aNHRiYzZDOFFyN0JpSHZBTHdUT0psQ1ZYcnN1QjFtMzNnZkdr?=
 =?utf-8?B?cDlBVnRUTXpNb0w0RGVEUlRETkNtK0h1a3lYWHM4OVB5N0p0MkxQcUJ3T0Zv?=
 =?utf-8?B?bWlXcHNORmtBTWU1eVpVMHg1VGVkUW4zK1g0Nno2N05iS0hPNy85aUlIMnQ5?=
 =?utf-8?B?M3F1UVg4ZU5DcElSdWhLZUVMdUJMMTBnUG8wdVBiclRsekt0ZzRGOVpiT1h1?=
 =?utf-8?B?azV6b0FKTUN6SHV0YWIxQUpTaTR1R3gvQUtOM2FXZ28zT25rc29WSzNKbzEv?=
 =?utf-8?B?a213cDVxeHZDazFkNi8zUGgwT01zQlBLZzllYm91cHlVRnRvcTZCNVNteExH?=
 =?utf-8?B?bVk0SlBYM0JpTDNWRGdzUTRQWjFNRnNUNkd4SWk4UGQwdHZxRjZJVlZBcENy?=
 =?utf-8?B?eDQ0QlNrV2EvTWVxY3QrbnV4VUx0M3pIMEVsUUpzSzJtT2x3M3h1YjZCQkhW?=
 =?utf-8?B?ckdYWmgrdXhFWERVQXpFRjcvK2RIVEtKWlEzUHVTVm5QK3o2WDVzdFM3QTRO?=
 =?utf-8?B?cFlJMUVhYlRWYUdGU1BSYWExeWxiTUdVcTBDSERxbk9BV2hLZlVpNjNyWXpW?=
 =?utf-8?Q?qxpf95zBkpRB7YjY=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: dc76b3a0-bbcb-41ec-4e2b-08decb023fb3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 17:19:25.5047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPbgPSJxLAr/xm1KM0dGMz2d+J56svtWoGgcqv1OVCnHPYAYWQvq0wpPsxUwmNH615LL95UoiEnzb5KxOUmpmSRpN6Sk9n9Xsslpo/Ld260=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6558
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38509-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:win847@gmail.com,m:linux-gpio@vger.kernel.org,m:lorenzo@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,iopsys.eu:dkim,iopsys.eu:mid,iopsys.eu:from_mime,aka.ms:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3198688C8A


On 6/15/26 16:23, Wayen Yan wrote:
> [You don't often get email from win847@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On 2026-06-06, Mikhail Kshevetskiy wrote:
>> phy4_led1 pin function maps led incorrectly. It uses the same map as
>> phy3_led1. PHY{X} should map to LAN{N}_PHY_LED_MAP(X-1).
>>
>> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
> Hi Mikhail,
>
> Thanks for this fix series. I noticed that the same MAP(2) bug also
> exists in the EN7581 phy4_led1 table, not just AN7583.
>
> In drivers/pinctrl/mediatek/pinctrl-airoha.c:
>
> EN7581 phy4_led1_func_group[] also uses LAN*_PHY_LED_MAP(2) — identical
> to phy3_led1. Should be MAP(3) following the PHY{X} -> MAP(X-1) rule:
>
>   AIROHA_PINCTRL_PHY_LED1("gpio43", ..., LAN0_PHY_LED_MAP(2)),  // EN7581
>   AIROHA_PINCTRL_PHY_LED1("gpio44", ..., LAN1_PHY_LED_MAP(2)),  // EN7581
>   AIROHA_PINCTRL_PHY_LED1("gpio45", ..., LAN2_PHY_LED_MAP(2)),  // EN7581
>   AIROHA_PINCTRL_PHY_LED1("gpio46", ..., LAN3_PHY_LED_MAP(2)),  // EN7581
>
> Could you include EN7581 in this fix as well?
This is a previous patch in a series, isn't it?
>
> Regards,
> Wayen

