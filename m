Return-Path: <linux-gpio+bounces-28470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A03DC5C28A
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 10:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0816234571D
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 09:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C978930146C;
	Fri, 14 Nov 2025 09:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="ISZ5GNl5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010048.outbound.protection.outlook.com [52.101.69.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7653019A4;
	Fri, 14 Nov 2025 09:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763111057; cv=fail; b=RpbPyw2TmTZV2FkzV1zAeOYSl5yi7+nePoK9Drp/rJfHRyZ7qJkVjcLw2BIAO7mGGIyQt8BywwaXwkH0aXsg5CUeMQM/1wYEUY68qelyVjEQmTwX4u3++JFjG4p6kB35uC5w0+K0I4dOJLy6ccQpD8LdcOUUdYMghlqHISoy6+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763111057; c=relaxed/simple;
	bh=D0DO1pgbtKaTBwivmuoDZiRZ0HKoBC/sh/Jo6HFJMBs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eFrO/KriJnOremNNlTV5dBqF47HAXf/7DkjtO6ToB9vQ3kYmcRC7vAPAzj5sx6zqz6j4sN8+klG1LBywq2j/jFKfcSf6whiedcC+oT7qOPjBoNOBs4gIevGvNd7anEKfsoQidRG9YQ6XqeX2vuxn0rd+0HU7pcy+IWIMTCu7OP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=ISZ5GNl5; arc=fail smtp.client-ip=52.101.69.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RdmTxZCSKGHzNRV3w9tihIR0p8lTr5+8nYnp4YaLK1LpInqy/p2XY8qjqNxvDQtVyLfHUxF6mWJdMpgjzukP28NJCCCKD1vP/vw7LZyrnLD7R94/1JnjXh1V4yXwdYq262SoqjHqZakwyzN0Thn3VMeNsh6R4G0BDNb1bISPEWHR6M5W4CyQgqOPUTYai1g2hfQKf3y4x9JVBgqVn47Ga2vpWQF0N+2f7izQ5M/aDpHuMk5Ml+/1GaZi1R8luZ1CnlCuuIOCHw4I4Af58gjFijOM37xoPnqvVN9yXtlVQ9KO4y61Xy1tjCjYPmDe4Soya4MhJuhOLOrGe22YmRX8QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0DO1pgbtKaTBwivmuoDZiRZ0HKoBC/sh/Jo6HFJMBs=;
 b=WrpwZGoQKazMgFAcfHy6O2D4MLEIqHkMUea65ruxOwc4ubTQhPuXbxj7fpNnVR2afn4X+xslSrNhM5iQmEDXnalEN5KSP9fq1dZ+sF7377GCs+C4wmHyOW5d0hDWOAcGuynlhbGRt9iOL38EgoZbLTX46PY/0bkwBLukXsBelVBoza3WrAZCUNTQZHZGNVsLiIOx3BV9HNvz37XrWLFWGc0e34KfASugg5I+b749EKTczFVAyeVkSmk03VNq2bnqMB93qj3tM8CYfv0hIS36yfpbHwqmiRH+FLIX5gFrv9WmMUepnS8C+6eP4Co5J4+oV4sqLSIt+gpy646bDLOuCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0DO1pgbtKaTBwivmuoDZiRZ0HKoBC/sh/Jo6HFJMBs=;
 b=ISZ5GNl53hYM6j3PMgCl1aiVuqAE5m4LTYP2MoKh5r8PmGcB4gwlE1GV02s4cO0lb8SScwjQNfP+FGHpRDU6Pg1WfcKCsw5BZs56UsoXmjs+zRBxm4jdjbkuc9x+2z9AWyOCyTV0xNly+GTv30UwDFbZxdSbPF7PL5GTVo1JCaNpsuAfW4C6oTQcz7m+Mv6XmlVRm4nRwjyZ74FHw6PHHfaDMAQxSmaNfkwPXRpyO01QupQTKmAcFTAnTvwOmDSMcnFWwCa4iiv2qJDedu28N7ek0DWToaA6AwJh2H1DwMNIiWjpNZHbgXjTNYUzwXqnL747tcbRttMKpcyJgTL70Q==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS8PR10MB7018.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 09:04:12 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%3]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 09:04:12 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "brgl@bgdev.pl" <brgl@bgdev.pl>
CC: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"warthog618@gmail.com" <warthog618@gmail.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>
Subject: Re: [PATCH v5 6/8] gpio: cdev: put emitting the line state events on
 a workqueue
Thread-Topic: [PATCH v5 6/8] gpio: cdev: put emitting the line state events on
 a workqueue
Thread-Index: AQHcVOIjrD2ZGSCFAUCVfpPcNu/uy7Tx1YWAgAAL/QA=
Date: Fri, 14 Nov 2025 09:04:11 +0000
Message-ID: <20d48bba465d3e03d2dd5e57c4d2d15765356b7e.camel@siemens.com>
References:
 <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
	 <20241018-gpio-notify-in-kernel-events-v5-6-c79135e58a1c@linaro.org>
	 <5d605f7fc99456804911403102a4fe999a14cc85.camel@siemens.com>
	 <CAMRc=McswuxryKqh7-zSc+oKTubu-bKoV40mUMh1tUbTofHA5A@mail.gmail.com>
In-Reply-To:
 <CAMRc=McswuxryKqh7-zSc+oKTubu-bKoV40mUMh1tUbTofHA5A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS8PR10MB7018:EE_
x-ms-office365-filtering-correlation-id: 7fe73a38-3d2e-432c-d1ba-08de235cc745
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RXFMTEJqVVpGbG9wc21yT2tNNTdYeUducmtyU0ROdXRZNXhBbjJSRlZxNWlt?=
 =?utf-8?B?TUhmeitDa3NlMVRvSjkwdkc4TitYcVhZN2Y0eHJQb1lONUc2bmh1Z2swam9E?=
 =?utf-8?B?V01TNWtaNUFFejlhRyt4Rjc1SVFDaGd1NHRaWHNNZ3UyYzdYUWtXMCtuZTlv?=
 =?utf-8?B?VHNOcFNZK3ZOTStIYjUxTy9oUVczUVNWYnZwdUVUYnNWalU5d3o2cUF1NGE3?=
 =?utf-8?B?T0JRY1dCelg1bXlYNVhkSnR2UDJQWUg3aVo1RzNDMklhMDVQdWRzS0JueGNT?=
 =?utf-8?B?SGJkN0FISkExQ2JjT3JORWRNNU5xeGhhZEcvdmxBaitqZENkYnNwOGtLTjRi?=
 =?utf-8?B?Nkd6bU1mTk52Z01DVzYybGVtcndpQ3BnZUdFMHV6YXYzYWJNNWYzMlJ6QWIr?=
 =?utf-8?B?ZmtYQWYycnRqNTB2cTI5UCtvbFZkb2dwTElJWDhqTk5uZ2R4NzA3SmNkVjk2?=
 =?utf-8?B?Tnhmd21XeWF0eC96eDYzOHNWV3NrbDhHcFoyWUt2b1FscDl5RlMwQXZDamh1?=
 =?utf-8?B?QTlHamxMeTVibUVicjhCZXZBck00MWtMbmE3a3ZJVTRFYVlpS0NwN1U3ZmhH?=
 =?utf-8?B?UC9KdGdPRmlESTJxZFJ5VnVPaEtNaFBabXF2OVVaZWc5M0QwVDJCc2JHQVVu?=
 =?utf-8?B?c20vSkhNajM2Wi9iY252UDNtbXk5SXVUQ1p0RHZKYnRtK3hWWmFjcHhQZGRm?=
 =?utf-8?B?N3B0b2JaczZPc201Z21PN2FNRkpQbTR2ZzF1amNqSVoreHp0NWxEZW1PcTBD?=
 =?utf-8?B?YWNTSXU1UEU4THkzVWhFb1lzNzJ1THF0bkNUcm03dHI5U0N0aS9vdjQ3TldO?=
 =?utf-8?B?M01FZlBoWU9nSjNzUXVpcU5VWnowNjdBOHFEVDBjNXk0MU5JSFQ2MHBSZHQy?=
 =?utf-8?B?L0thaHpIQWhWeEhYbzdBRm5nckEyL1U5bmJGaHlpeTFERi95eDVpWjFhRm95?=
 =?utf-8?B?VE1sVmgxMnBaWFJSNkY5NldUZXpHeHh3UWQvU3g4RHhaSXFPREZkZmlEaUxW?=
 =?utf-8?B?MitXaElVdk12NEk1dEI4OG0xa0VhNmVEVTBlMDNkUWlpSWozYTd0bS9XUEpJ?=
 =?utf-8?B?cHpNam5mNnhHdktRbG5ZVGRGa1dqeklNZEFObFpiZ01qSGhFU0p1OEZmdEtt?=
 =?utf-8?B?dVFsSWlTV0sxWXIrUUNpeWFVVTdwRnVkUnhSODM1dEsxQlZLV2hDUTJHbmtL?=
 =?utf-8?B?Y2FOd3A5VHdmN28xSGdzRFlDZi9NTUxLWFhJa1Q4S3ZnTVpzQTYvUDNPNlNl?=
 =?utf-8?B?YVUwUDlHTjB4Q3lwVnQwbnZieXZkNmkwNURvNnNoRVc2UTUrVXQvb0MvbTZk?=
 =?utf-8?B?T0NXUUxoanFqTXI3UmhjMExNWjRrTUJHVUxFOSs0VjNCU25DV0Y4QVNaZ2lS?=
 =?utf-8?B?UFpTWnRsUWNrK3NyWG1lREdkbE4zeXNSNkNNZ0hNZ0ljK2lXTFdGaVNiU1Y5?=
 =?utf-8?B?RkJIa1k5L2ROWEJxQk5xcnVGYzBiM3Fzak16V2hvVDd4UVl6U2NCMU1yTHN5?=
 =?utf-8?B?VE45MjYwanVZSFdlOWNyZUFubUxYMW5BVzVub0VEaVkrcmlWSkhzbDk0U2Jr?=
 =?utf-8?B?ZUVjUzVWSVhsSVBnaHpzRURTL0RBWGVweEloYTVzM2kyNHN2YXdIY1JKL3dn?=
 =?utf-8?B?Y0RQcTl6d3VVMmdKVFBWbFd3VEt2U2RQVjZhOVptRFZtcnFieXk5eEFFbmk1?=
 =?utf-8?B?dzRvVCt6ME9jY1NTUjZiWHI5WmRuWmVHY20xb1J1U0Q4eHZOM29LYXhmMW55?=
 =?utf-8?B?a0tyQ3NBZlp3UytDd0NYZXk2a2lUOHZQVExCdFhpYW5RS2NUdXBTQWFjU3hD?=
 =?utf-8?B?NVRLWVRCcVhMUm5RcDc1QTc0UzhuY0c1TTUvRjNzc0hCdFVvUTFzZ1dXVmRL?=
 =?utf-8?B?cTluNi8yOGJqbUp4eWR3SjZBREJJMjJSWGswMWpYWG5tMnRGNFgraURkekZS?=
 =?utf-8?B?MnJHVFNkdGt3Rmk5MDdjckw4aktGQ0MxQmJRcEJUUk5sci9rWFNJT2N4QXVE?=
 =?utf-8?B?MTZaZ1BGc3I0SU9JZHVLMkNtaUtiNXJaVk1ldzVxYUhEd25VVkpaaWUxVVRm?=
 =?utf-8?Q?AeDvRQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cnVPRGJwTW4zMzhYdTJER1FUeHN3Szg2MHl1ZTMyWnVJNmEzVTU1ZkhFSTcv?=
 =?utf-8?B?MU9yTHZ3a1Bod0xEVUswMlI4Qkk2cGRHSytvK01sdWxWRWVmaFdqT1NnK3lP?=
 =?utf-8?B?OEc4Wkc1QW5lUTg4RWVPOHc5QXJXNVg2c2Z6VklUVmNhbCt3NFlzQW1XV0Fz?=
 =?utf-8?B?ZE9LMHBMSVd1elU5cFI2endBaXFpT051WGRIdTFpeVlla05GT3o3U1ZVei9O?=
 =?utf-8?B?SitPVUdkbXJiTW9uWTg5TndncWhHaVdka1d2R2NZV1dUa1VHS0daQ3VhTVF6?=
 =?utf-8?B?OUJlMk1zbHZqbVBMekVtck5kZ2FINTVaUm55emlscW9lQ0pxSk13dmtGajZs?=
 =?utf-8?B?WGYvSVNLSjNnajRrbWt2SXMvNDRoT0xweUVnSnlPc3prTENDanYvVzlCTGEz?=
 =?utf-8?B?SGx5c3Z1eHB3emZ3ZUJEMTFqelMvbERWMkw2QjhSNUM3bVg2YlgyNkdKaG1N?=
 =?utf-8?B?VjE3VW5yM0RkcmRtMEU1UDUrNTdtQXAyVUwyYkR1UXZpU2h0Y0NJN0tHTVlW?=
 =?utf-8?B?VlI2NlFuWkZvTTd2YTN0ejg4eitabGgzOTQra1dmam14L2NZL2JxaWZnWmor?=
 =?utf-8?B?VlRKWkRFK3lUdlZlVEhMUWpvZlRzeUlDS2RnQmJGTytIN055SWVzT3crMTg4?=
 =?utf-8?B?dW0zY3l3cXIxZFFLbEZqMVRzVFJsbUtTUWdjZTBuMmJ0MVNrMHAvbjRqdlcz?=
 =?utf-8?B?b2FzMTlIZEpQVmwzZkhNQ2dwOFZrS1ZWcVZ0K1YxZ2UvZm1LdTN5dm5idFhx?=
 =?utf-8?B?VVFITW1ERG5WYk0yWDFLVE9lUVd3dmQ5VU1TejhlZTV2UXRvSGxTRy95Y1dF?=
 =?utf-8?B?eUllS1NleWlzU3hvOW5tVHAvVkxyVE5LbXdtZkNzQ2MwRWE4dHVhRkRUTTdJ?=
 =?utf-8?B?c0FsaVJ1N284MEtaNmtmdldOeWpXSjZvNEMzdWJuYnF5RzVmYmtFT250Ungv?=
 =?utf-8?B?cVM4U1Q0RzJIenVuVXp0bzZVcTVReUR2VmplYldkeTViVWNicHNCM2dwT3lY?=
 =?utf-8?B?QU9KMTBTUVB1THgwc0h5VjJxc1VMcFUyajlBT2ZabDdTTjNINHl2cHZpNG0x?=
 =?utf-8?B?cGRjK0ZyRUVaYUxXMmUwY016TDl5OGExemNxVW1qbWp2WE1FQW84cEE0L0pG?=
 =?utf-8?B?SzhRTEE5VE1WK0VtTEV5aGRnZkdzN3YvNVRKWVc4bjVPaHN5MENBZHQ0eEox?=
 =?utf-8?B?amxvZVRLL1JKZ0JRVlgreDIxNGNLTU5ZUkhFalM2N2xGS3FOc1RRUlJOb3JL?=
 =?utf-8?B?SU5GblI2VVpweHNTdXJhemRyUGNIYXl2bHcwc3dOV1A4UzA5MW5uUFE4S3Qz?=
 =?utf-8?B?SVpHUTVvN1NUc0huRTZJcEkwTUxyQ0hxalkreHN2Ym5uS1BxSTE2NzVMb0lR?=
 =?utf-8?B?bzUwVmRMQWRwbTZ3eWhKb3RGU0hPVlFiRm13bkNISG5aVEErK3FMcjdDZzl5?=
 =?utf-8?B?K2pqSDVrYVJ3b1dycU9LVmVxNUpJODhwZ1p6R1VNUVU2emlQcjk0SkNPdkNx?=
 =?utf-8?B?dTdlR2tPUGg2WlBJLzMzdjNlQ0lTU1BtNjV3d1pVTmM3NTBlOXZwcW85ZktX?=
 =?utf-8?B?N2RQOTBpNG5xVW5DU0l1ZHFsTWlFTWltS0NJOUZTa3UxeERCM0Y2bGNsK2J3?=
 =?utf-8?B?UnEreTM2emFzVExUSWJvOGEvVk9QWk9sTmdEWUhRL2VSWmoxMHl5Ty9GdmFZ?=
 =?utf-8?B?VkliaDlLUzdDNjhOT1l5NkRqTk11ZVhjb0xCK0pxSXB0TXBFVDZ4MS9xNnVN?=
 =?utf-8?B?ODlXK3EzOTAva1VNcHNyd0JsQmgwMXRoYSt0L3NFMElxN00xSkRCSzFtcEJE?=
 =?utf-8?B?Nmk0ZXRLU2N1OTR1Mkl2eC9sNE01WlRXRmQ4VnZhRlpGekxTRUlJcXZmRkFI?=
 =?utf-8?B?WjNLanNBY0EzdDBOSlJsemROTWRRMzlsVnVTQnUyTU96Mjg0dytyTlBLWms5?=
 =?utf-8?B?WmVwSmZRSHUvTmpVUFhpRzhNYXZPMS91TW5PVzY0cEs4bzB1a21wdEVGbnc0?=
 =?utf-8?B?QXdyWTN0WEtXZWxBcFVNNFU1MFRPa3pranJSVUxkS25pWERPNnBRR0JpYWFC?=
 =?utf-8?B?ckpBc3FUTlgvK3VRUkpaYTJaMkdrZ3hKMVVVdnBlNWllaEd4TkNZbXE2WHVr?=
 =?utf-8?B?UUJrUVVCSDNTWXFLMG11UWFWQ1FkMVJpVm5wQk9qajNGNXFnSm00NjNRS1RU?=
 =?utf-8?Q?dE4BzWB5CTxrb9zrkHso0a4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <60679AFEB8265B4690989462D9765ADB@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe73a38-3d2e-432c-d1ba-08de235cc745
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 09:04:11.9701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O1BtRLP57uUJVKJP/Gbwd4zeOl4YqPe0/GCuzkLW6i/EO9BxEGlfmGV2t5irgeaqGVJphCz2G8ziUO3sP1hPvwFQwzjhBtJB347K/zG+4H4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7018

SGkgQmFydG9zeiwNCg0KT24gRnJpLCAyMDI1LTExLTE0IGF0IDA5OjIxICswMTAwLCBCYXJ0b3N6
IEdvbGFzemV3c2tpIHdyb3RlOg0KPiA+ID4gSW4gb3JkZXIgdG8gYWxsb3cgbGluZSBzdGF0ZSBu
b3RpZmljYXRpb25zIHRvIGJlIGVtaXR0ZWQgZnJvbSBhdG9taWMNCj4gPiA+IGNvbnRleHQgKGZv
ciBpbnN0YW5jZTogZnJvbSBncGlvZF9kaXJlY3Rpb25faW5wdXQvb3V0cHV0KCkpLCB3ZSBtdXN0
DQo+ID4gPiBzdG9wIGNhbGxpbmcgYW55IHNsZWVwaW5nIGZ1bmN0aW9ucyBpbiBsaW5laW5mb19j
aGFuZ2VkX25vdGlmeSgpLiBUbw0KPiA+ID4gdGhhdCBlbmQgbGV0J3MgdXNlIHRoZSBuZXcgd29y
a3F1ZXVlLg0KPiA+ID4gDQo+ID4gPiBMZXQncyBhdG9taWNhbGx5IGFsbG9jYXRlIHNtYWxsIHN0
cnVjdHVyZXMgY29udGFpbmluZyB0aGUgcmVxdWlyZWQgZGF0YQ0KPiA+ID4gYW5kIGZpbGwgaXQg
d2l0aCBpbmZvcm1hdGlvbiBpbW1lZGlhdGVseSB1cG9uIGJlaW5nIG5vdGlmaWVkIGFib3V0IHRo
ZQ0KPiA+ID4gY2hhbmdlIGV4Y2VwdCBmb3IgdGhlIHBpbmN0cmwgc3RhdGUgd2hpY2ggd2lsbCBi
ZSByZXRyaWV2ZWQgbGF0ZXIgZnJvbQ0KPiA+ID4gcHJvY2VzcyBjb250ZXh0LiBXZSBjYW4gcHJl
dHR5IHJlbGlhYmx5IGRvIHRoaXMgYXMgcGluIGZ1bmN0aW9ucyBhcmUNCj4gPiA+IHR5cGljYWxs
eSBzZXQgb25jZSBwZXIgYm9vdC4NCj4gPiA+IA0KPiA+ID4gTGV0J3MgbWFrZSBzdXJlIHRvIGJ1
bXAgdGhlIHJlZmVyZW5jZSBjb3VudCBvZiBHUElPIGRldmljZSBhbmQgdGhlIEdQSU8NCj4gPiA+
IGNoYXJhY3RlciBkZXZpY2UgZmlsZSBkZXNjcmlwdG9yIHRvIGtlZXAgYm90aCBhbGl2ZSB1bnRp
bCB0aGUgZXZlbnQgd2FzDQo+ID4gPiBxdWV1ZWQuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4N
Cj4gPiANCj4gPiBzdGFydGluZyBmcm9tIHRoaXMgcGF0Y2ggdXAgdG8gdGhlIGN1cnJlbnQgbGlu
dXgtbmV4dCAodjYuMTgtcmNYKQ0KPiA+IEkgc2VlIHRoZSBmb2xsb3dpbmcgcmVmY250IHdhcm5p
bmdzICsgS0FTQU4gVUFGIHJlcG9ydHMgb24gZWl0aGVyIHJlYm9vdA0KPiA+ICh3aGVuIGdwaW8t
bWFuYWdlciBpcyBiZWluZyBzdG9wcGVkKSBvcg0KPiA+IGBzeXN0ZW1jdGwga2lsbCAtLXNpZ25h
bD1TSUdLSUxMIGdwaW8tbWFuYWdlcmAgKGlmIHNvbWUgR1BJT3MgYXJlIGJlaW5nDQo+ID4gcmVx
dWVzdGVkIGZyb20gKG93bmVkIGJ5KSBncGlvLW1hbmFnZXIgcHJpb3IgdG8ga2lsbCk6DQoNCltd
DQoNCj4gVGhhbmtzIGZvciB0aGUgYnVnIHJlcG9ydC4gSSBjb25maXJtIGl0J3MgcmVwcm9kdWNp
YmxlIG9uIG15IHNpZGUgdG9vLg0KPiBJdCBuZXZlciBvY2N1cnJlZCB0byBtZSB0byB0cnkgYW5k
IFNJR0tJTEwgZ3Bpby1tYW5hZ2VyLiBPbiBub3JtYWwNCj4gZXhpdCwgbm90aGluZyBiYWQgaGFw
cGVucy4gTGV0IG1lIGxvb2sgaW50byBpdC4NCg0KSW4gbXkgY2FzZSBpdCBoYXBwZW5zIGFsc28g
b24gZXZlcnkgcmVib290L3NodXRkb3duLCBob3dldmVyIGlmIEkNCmBzeXN0ZW1jdGwgc3RvcCBn
cGlvLW1hbmFnZXJgLCBJIGRvbid0IHNlZSB0aGUgaXNzdWUuLi4gbm90IHN1cmUgeWV0LA0Kd2hh
dCBpcyB0aGUgZGlmZmVyZW5jZS4uLiBhbmQgSSdtIG5vdCB0ZWxsaW5nIFNJR0tJTEwgaXMgaG93
IG9uZQ0Kc2hvdWxkIHN0b3AgZ3Bpby1tYW5hZ2VyLCBidXQgSSdtIGhhcHB5IFNJR0tJTEwgbm93
IGFsbG93cyB5b3UgdG8NCnJlcHJvZHVjZSB0aGUgaXNzdWUgaW4gdGhlIGtlcm5lbCBjb2RlIQ0K
DQo+IERvIHlvdSBhbHNvIGdvIGJ5IGNjcGFsZXggb24gZ2l0aHViPyBJIHdhbnQgdG8gZ2l2ZSB5
b3UgY3JlZGl0IGZvcg0KPiByZXBvcnRpbmcgdGhlIG90aGVyIGJ1ZyBpbiBncGlvLW1hbmFnZXIg
YXMgd2VsbC4NCg0KVGhhdCdzIG1lISBJIGRpZG4ndCBrbm93IHdoZXJlIHRvIHJlcG9ydCBhbiBp
c3N1ZSB3aXRoIHVzZXItc3BhY2UgbGliZ3Bpb2QsDQp0aGF0J3Mgd2h5IEkgd2VudCB3aXRoIGdp
dGh1YiA7LSkNCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMgQUcNCnd3dy5zaWVt
ZW5zLmNvbQ0K

