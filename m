Return-Path: <linux-gpio+bounces-33339-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yH1zCnDqs2nadAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33339-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:44:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A92281A9F
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 70C83302D9CF
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 10:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754C7388388;
	Fri, 13 Mar 2026 10:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="f6I1//u8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011046.outbound.protection.outlook.com [52.101.125.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E4E277CA5;
	Fri, 13 Mar 2026 10:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398635; cv=fail; b=dzidBdkYTdWJ+Xr9nio8KUVfwYPp9EPA0HD7k+l5vvdnuvytuOVWDL0Aqx8HzUATw6vHbk13jbDSAGB11ppTjVCRCx53hxqnuAA8NB941dxIk0RgrKj/cF5JSTnXE0H0zkAfyAWdeapWZEseYSU2X3SFaKStCw+SsXTb795bjxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398635; c=relaxed/simple;
	bh=FXaGwhAmcinLlRqGZL7nXE8FbaenCAyO1cv2G0rYQVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VDlqjrKuXIcgwKsxsmA2gJMyX0kfH3nH1Xd2z1FDw+C4ZhYgHoVhtNgSKf39TKYmnXCEMXCh5qwmybkQrmTdij0tzLwh+NNwRsGWICc42PKu89+WPfGDH723g6uGp4Ts1J5otoCxi4OevcIor0iAtOlH6FpW+B7TS7knJ8HkYq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=f6I1//u8; arc=fail smtp.client-ip=52.101.125.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4tAa0rCMFGY4yawJHxbPERcBF5CmucOnTFtv0JS+92wCpfhjEf+Wi3IFsS6+5UOnpE5Psg8srlAIqdYWeb2tzqKYAf/SaKOEyQMQ7qX9+r7Nm8PQkobqzKtqfncfHEz2Q/h80BYawamTnJuxpAHJ7nDGBsl+Y4QOom3rDE8M5RW/sMMOSRL1uZtq6EQQW52HofyBQDjrAdw32EzBv/MxBWzWuSoNVf5qtZ9jvfJJicgAqjSQwr6N0etgUmgJIhcHggzKnC5Bkmy0LcucniON+aZvFNsQkSliuiCG0oFfNz1bcgeiGd9mYOqjAoTc1ETCs1G+o1aJZ7RIRyLvnNa2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqwklELkW71XHAxls4/I7K8NUBNwEd/+s9L6b2VZIfk=;
 b=N/RLX2hLfgKWJThwCMkfHFSMYgbtYiTd69gMeWAkLVvUuxq3z4CEtYcVGRlH8CQ+34StMRWiOiWn73EFspmuQX8XC+6DjRqS9eBv1NXY8Opu2NSz672cpfniFxjL+o2V25nOGMb21ySMsJkk9dFdfVLbCwB9ZK3ETw/IsAMpHzesvDMqINRwOK0X3ig0GVntCj1sC7BO/JYMpqoIOjRrbEs2TWT59iDTjRlPJlEKnbIYHn2EBtTfPz+5udEkwC59XbmFWRnBsRhTOyCY+0160YcD0bmpELYbCyZwWXvSIHbW6qGj3F349Z9SJ1O33CAORHRcOOxDYlz+UkRZU+q9Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqwklELkW71XHAxls4/I7K8NUBNwEd/+s9L6b2VZIfk=;
 b=f6I1//u8115yQj62nZj5seTV0PIR0fN0ZHRqrdMvKGzXdGHRJqP8GOES17VPP+arutY+JFJoyZXQ/sJOZxZizolQ85pd6U/6drdhFMet8KIJfZds8rFJMiDBd4TKPlNS27+HTEcD7N/MzV7Rymo775kjgfKaiqF0JM9v8VbSqkk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYYPR01MB12451.jpnprd01.prod.outlook.com (2603:1096:405:f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 10:43:40 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9700.017; Fri, 13 Mar 2026
 10:43:27 +0000
Date: Fri, 13 Mar 2026 11:42:34 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>,
	biju.das.jz@bp.renesas.com, tomm.merciai@gmail.com
Subject: Re: [PATCH v3 4/7] gpio: gpiolib: fix allocation order in
 hierarchical IRQ domains
Message-ID: <abPqGvy5FqJ0a0ug@tom-desktop>
References: <20260309134920.1918294-1-o.rempel@pengutronix.de>
 <20260309134920.1918294-5-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309134920.1918294-5-o.rempel@pengutronix.de>
X-ClientProxiedBy: MR1P264CA0208.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::8) To TY3PR01MB11948.jpnprd01.prod.outlook.com
 (2603:1096:400:409::5)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYYPR01MB12451:EE_
X-MS-Office365-Filtering-Correlation-Id: 17de5af7-257d-4d31-b0a4-08de80ed5e2a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IHTxUUa17okWfFf7/DssuIye+gEa1EYdbJCHDNJq9i7AuSQAnlH4qEI3jUSvwGSXQtWLBBgzbDcUCddjQia3ZlhJuQRxAdr/STrTxjaamO7ooXfHsSYyEum5AKtIG+LB01znah5zVBpE5XAIJ2sQbdDL6S+bhvnr9Bkm0bt9kBRjTMxWxA7Ut/vF3lUX+hwAEnaaqGHWQYxtWauNACa1QCGSyybOyFZSiJy607UHwvTuCHj9c5RsIJlIjgz9z5cWaSnAN2AT6ijnbXqpCC71j25uhCAvM6p8P9kvdIBZsBpcGCkExr013Rf+A6dNlEB/oZgncJob6VJoC45cRf7PHoNLJf7ZgShfN2Q7iR3fWUvD2Rmc13Bh2IlBZ9f9tQIpPui2TIK4sURiOsiztIrTL0qY6ekoP2GsHAea/EpFAT8aWXqUCQkmG0PYGi6Uu9KAu7NkKAgTrMcQ5xc1Dv2hTcTyqiKGs2sN0sf/haoDNGdrbufyzZe9u0qT1wUDrW0wZf+QjD9/Bi/NWTKq323Q7frpukTqHrpMWreodxb4OGXGxN+JoDKT6fEIBbaWhl7dRdSiwXEfTcTqwE4LDdI7Xr6K6UYL8a/75jTahUzI1JpLp+rkXpBDhhwiBFo1GPvHO+zv4FqOk5lhXbe0jLxg2CMgIMR5oYk1u6TnDS3PI5g6A0uermNFPHWS0C9UEPlEcx5znjXPxpqhIMcR65YtiZ7rIQGwmwgAWIOK5mLTuVNat4Va5vp1/+Ht6U8bs33ZIuPGElcrsqkmH7Dl+VHNqsQxUrgrkcb9ovEscS7rhKw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w9dQRv0WYbW5VxrRTLiUEzFt8hX7mRo90nfrHdrLRz5pOOH+zDxVPxuiKPPy?=
 =?us-ascii?Q?eFtSnGH5J9MvxT3pFPJSFnuw019+L9XV5yurw8w4aVl/vzPXKPGzIN7ZrPwM?=
 =?us-ascii?Q?+PVDFPKwTMSc5XEwskZCaHm2NHe+hWpQmTcUEJ/cfff9JIj4rotiArOtfeiw?=
 =?us-ascii?Q?fA7WMeUtOsH/Gvlnb61j3RtbbNIPbGDwQqdZlkX1ET0prFsuQLgVGdVah38w?=
 =?us-ascii?Q?0PyXRvt9U8xGFYP7Pk2Up6HtaXsskei0GN+v4zbGodnm08fZRyxGKGCXfOHl?=
 =?us-ascii?Q?EEQHfRQCv0HnV9BQIDJCDM97UevaxK23kaA2AqPyo3hZNepuihC4vKQIMWxH?=
 =?us-ascii?Q?yLNhKszdME8WhT9wyCVkfcYR57hhks2G2NkHpW+Q2WrShcWSKScIGZBU1nSz?=
 =?us-ascii?Q?TUMAvRbto+UCdRl2zDTcKcp/pbPB1domezL/hh++Z9V6egM2NbaW+ogboQRW?=
 =?us-ascii?Q?KMrlQlSwmPam4Bg39alXAtfyGiFsSLywcqmQRFoVJvlPcmrcoYhN2fmkGx6x?=
 =?us-ascii?Q?QYP689tBJSsRFV+bVrWxGM2sUXhhn/Am0j4sHLHC2KEau6R7FTQ3wNwnpYTb?=
 =?us-ascii?Q?dBl6g1WIDB4SW/uO4RICVKSTMb0dVWn8eBK3bEazBwHWWV2cwmJOG9wgVLq9?=
 =?us-ascii?Q?bGix1ui+G3uoaQwPSPNFQvHciJkNIb8o3ujYakTph1g/U+Z3QuXtxAR37HEi?=
 =?us-ascii?Q?HY46hPL9IdhNeNs3SH7znV7coNQ7IgjYvfA3waEhO/1HGbhRU7mQZmGG+Lnc?=
 =?us-ascii?Q?K3o+AR0TOm5AoaOOF6MfmIBr3YQYHoeiKMrIIV2b/1hCO7OByUqnwhLE3Aei?=
 =?us-ascii?Q?AESzP4GoxOSS8ksUVqN3vt7gJxm7dgbC2wEBNevy7Me3fLINSdDEHzFfGUTq?=
 =?us-ascii?Q?GPUVLg23awD497M6EMR1BE1E2V20fOxrraWfIGFjPCfTOlMshlGQ/3CF2tFF?=
 =?us-ascii?Q?dbwbsDbXylrCr4MAQ+xtltkfjvzDTyetpbFUgNlmnV7xijNAmnfjxN86jnf9?=
 =?us-ascii?Q?V//NjjPvusZ4E/VCll41HFKx18SkIS2QCFEEvCDugIEIqb47z20Ztf0IjhUZ?=
 =?us-ascii?Q?eVjWAcMSKcmRakDgN/dcTdtSdcy9A7C+wsBLjdibVAvk1ZTzwRRih4IMZcTO?=
 =?us-ascii?Q?hY082zqoqhFxvhskjFlYKKJ//W+Gsz0beNaiEaRYpPDHHkGmTruhBfcUBysf?=
 =?us-ascii?Q?h7tcHzPTyhMP2wR12MdvkMkpSVtByzy9Rut1LZTysOvxdgDRzW9GjU9W530p?=
 =?us-ascii?Q?bZP+y2L2Fj1CpemNUVDHip2dMnYlAc2nZByOGy7jgkiie7kUtTHZ1m94Bkne?=
 =?us-ascii?Q?ZPwYGcnMvXVo6fllwro0fZ180GX2+UuMOXjcd1KY6R3U8hLH8YxdhvAErODA?=
 =?us-ascii?Q?NdHZ4Ucb6IRZKBd8iv8tNry+dPW/8M6OidnEbKGhx+S6AZiOTcur/3DlxMs/?=
 =?us-ascii?Q?pe5wg0g/i23rPz6zOkaVnl9h508AUZkfqAcGshVYtYV1nKhjPNkdSEHJttgJ?=
 =?us-ascii?Q?BPcUA53TZqawgiWByKtfw5WgjnHFeAIkPPbu5eyBbWHVwFd0n0h8xz6V4XZJ?=
 =?us-ascii?Q?zP2Yusy/MBUFa1NvWmFCwALqPZSM+KeBfnKvLe+nGbtK6SmRQ81xQv7fCEYI?=
 =?us-ascii?Q?rUmuubuxzzqyNfgCXvazka4B7kuNk9w30CkLGro0WTSCIIUZryc0zJ7RfwQX?=
 =?us-ascii?Q?YxPW0BlAsADyGYnw5LfBAVUgTTg6etMHA8k37TkTfx4KQeD5ADi7CdtXZumW?=
 =?us-ascii?Q?1PmUZdyqWD5BIi4DGVcUsEIA6a0FM2GvoAo6N4KJ3iuN9ZglmaKJ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17de5af7-257d-4d31-b0a4-08de80ed5e2a
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11948.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 10:43:27.1965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ESp6KV6fwQ6YR4zaKR0hgyYL7EWO8p0FxTKbvxpcqKGkuVfyE9Lj6le8i9YXedPNMQQ5TJGgRvtnxy0Y6PJ7vo/2TQL/cpPO5Sx7CEw67hPGZXvgNblqInmITH8tpMe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12451
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33339-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[roeck-us.net,kernel.org,axentia.se,pengutronix.de,vger.kernel.org,protonic.nl,bp.renesas.com,gmail.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pengutronix.de:email]
X-Rspamd-Queue-Id: 07A92281A9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Oleksij,
Thanks for your patch.

I'm working on DSI support for RZ/G3E

from this morning rebasing on top of next-20260312 I'm seeing
the following:


[   19.230966] [drm] Initialized rzg2l-du 1.0.0 for 16490000.display on minor 2
[   19.240377] rzg2l-du 16490000.display: [drm] Device 16490000.display probed
[   19.250504] irq 165, desc: 000000004f0a321f, depth: 0, count: 0, unhandled: 0
[   19.257630] ->handle_irq():  00000000a74f5df5, handle_bad_irq+0x0/0x25c
[   19.264223] ->irq_data.chip(): 0000000057261646, rzg2l_gpio_irqchip+0x0/0x118
[   19.271328] ->action(): 0000000027be85a3
[   19.275227] ->action->handler(): 00000000e5c70c61, irq_default_primary_handler+0x0/0x8
[   20.645894] ov5645 0-003c: ov5645_write_reg: write reg error -110: reg=300e, val=58
[   40.257787] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[   40.263915] rcu:     (detected by 2, t=5253 jiffies, g=3325, q=241 ncpus=4)
[   40.270632] rcu: All QSes seen, last rcu_preempt kthread activity 5255 (4294902363-4294897108), jiffies_till_next_fqs=1, root ->qsmask 0x0
[   40.283054] rcu: rcu_preempt kthread timer wakeup didn't happen for 5257 jiffies! g3325 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x200
[   40.294351] rcu:     Possible timer handling issue on cpu=0 timer-softirq=1342
[   40.301309] rcu: rcu_preempt kthread starved for 5262 jiffies! g3325 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x200 ->cpu=0
[   40.311657] rcu:     Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
[   40.320771] rcu: RCU grace-period kthread stack dump:
[   40.325821] task:rcu_preempt     state:R stack:0     pid:15    tgid:15    ppid:2      task_flags:0x208040 flags:0x00000010
[   40.336886] Call trace:
[   40.339345]  __switch_to+0xec/0x1a8 (T)
[   40.343236]  __schedule+0x360/0xe18
[   40.346763]  schedule+0x34/0x110
[   40.350029]  schedule_timeout+0x84/0x100
[   40.353997]  rcu_gp_fqs_loop+0x114/0x420
[   40.357963]  rcu_gp_kthread+0x100/0x114
[   40.361843]  kthread+0x118/0x124
[   40.365122]  ret_from_fork+0x10/0x20
[   40.368740] rcu: Stack dump where RCU GP kthread last ran:
[   40.374223] Sending NMI from CPU 2 to CPUs 0:
[  113.405786] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  113.411908] rcu:     (detected by 3, t=23540 jiffies, g=3325, q=259 ncpus=4)
[  113.418711] rcu: All QSes seen, last rcu_preempt kthread activity 23542 (4294920650-4294897108), jiffies_till_next_fqs=1, root ->qsmask 0x0
[  113.431220] rcu: rcu_preempt kthread timer wakeup didn't happen for 23544 jiffies! g3325 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x200
[  113.442606] rcu:     Possible timer handling issue on cpu=0 timer-softirq=1342
[  113.449564] rcu: rcu_preempt kthread starved for 23549 jiffies! g3325 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x200 ->cpu=0
[  113.459998] rcu:     Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
[  113.469112] rcu: RCU grace-period kthread stack dump:
[  113.474163] task:rcu_preempt     state:R stack:0     pid:15    tgid:15    ppid:2      task_flags:0x208040 flags:0x00000010
[  113.485229] Call trace:
[  113.487688]  __switch_to+0xec/0x1a8 (T)
[  113.491581]  __schedule+0x360/0xe18
[  113.495109]  schedule+0x34/0x110
[  113.498374]  schedule_timeout+0x84/0x100
[  113.502342]  rcu_gp_fqs_loop+0x114/0x420
[  113.506308]  rcu_gp_kthread+0x100/0x114
[  113.510188]  kthread+0x118/0x124
[  113.513466]  ret_from_fork+0x10/0x20
[  113.517082] rcu: Stack dump where RCU GP kthread last ran:
[  113.522566] Sending NMI from CPU 3 to CPUs 0:
[  186.553784] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  186.559904] rcu:     (detected by 3, t=41827 jiffies, g=3325, q=268 ncpus=4)
[  186.566706] rcu: All QSes seen, last rcu_preempt kthread activity 41829 (4294938937-4294897108), jiffies_till_next_fqs=1, root ->qsmask 0x0
[  186.579213] rcu: rcu_preempt kthread timer wakeup didn't happen for 41831 jiffies! g3325 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x200
[  186.590599] rcu:     Possible timer handling issue on cpu=0 timer-softirq=1342
[  186.597556] rcu: rcu_preempt kthread starved for 41836 jiffies! g3325 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x200 ->cpu=0
[  186.607990] rcu:     Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
[  186.617105] rcu: RCU grace-period kthread stack dump:
[  186.622155] task:rcu_preempt     state:R stack:0     pid:15    tgid:15    ppid:2      task_flags:0x208040 flags:0x00000010
[  186.633219] Call trace:


I found out the the issue is related to the interrupt of the adv7535
bridge:

        adv7535: hdmi1@3d {
                compatible = "adi,adv7535";
                ...
                ...
                interrupts-extended = <&pinctrl RZG3E_GPIO(L, 4) IRQ_TYPE_EDGE_FALLING>;

RZ/G3E is using:
 - drivers/pinctrl/renesas/pinctrl-rzg2l.c

Reverting this patch fix the issue.
(git revert a23463beb3d5)

I'm wondering if someone else get the same.
Thanks in advance.

Kind Regards,
Tommaso


On Mon, Mar 09, 2026 at 02:49:15PM +0100, Oleksij Rempel wrote:
> In gpiochip_hierarchy_irq_domain_alloc(), calling irq_domain_set_info()
> before irq_domain_alloc_irqs_parent() causes a NULL pointer dereference
> for slow-bus (SPI/I2C) IRQ chips.
> 
> irq_domain_set_info() locks the child descriptor, triggering .irq_bus_lock.
> If the child proxies this lock to the parent, it crashes because
> parent->chip is not yet allocated.
> 
> Fix this by allocating the parent IRQs first, ensuring parent->chip is
> populated before the child's .irq_bus_lock is invoked.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> changes v3
> - new patch
> ---
>  drivers/gpio/gpiolib.c | 32 +++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index ada572aaebd6..1ea9531934cc 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1628,19 +1628,6 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
>  	}
>  	gpiochip_dbg(gc, "found parent hwirq %u\n", parent_hwirq);
>  
> -	/*
> -	 * We set handle_bad_irq because the .set_type() should
> -	 * always be invoked and set the right type of handler.
> -	 */
> -	irq_domain_set_info(d,
> -			    irq,
> -			    hwirq,
> -			    gc->irq.chip,
> -			    gc,
> -			    girq->handler,
> -			    NULL, NULL);
> -	irq_set_probe(irq);
> -
>  	/* This parent only handles asserted level IRQs */
>  	ret = girq->populate_parent_alloc_arg(gc, &gpio_parent_fwspec,
>  					      parent_hwirq, parent_type);
> @@ -1657,12 +1644,27 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
>  	 */
>  	if (irq_domain_is_msi(d->parent) && (ret == -EEXIST))
>  		ret = 0;
> -	if (ret)
> +	if (ret) {
>  		gpiochip_err(gc,
>  			     "failed to allocate parent hwirq %d for hwirq %lu\n",
>  			     parent_hwirq, hwirq);
> +		return ret;
> +	}
>  
> -	return ret;
> +	/*
> +	 * We set handle_bad_irq because the .set_type() should
> +	 * always be invoked and set the right type of handler.
> +	 */
> +	irq_domain_set_info(d,
> +			    irq,
> +			    hwirq,
> +			    gc->irq.chip,
> +			    gc,
> +			    girq->handler,
> +			    NULL, NULL);
> +	irq_set_probe(irq);
> +
> +	return 0;
>  }
>  
>  static unsigned int gpiochip_child_offset_to_irq_noop(struct gpio_chip *gc,
> -- 
> 2.47.3
> 

