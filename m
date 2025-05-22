Return-Path: <linux-gpio+bounces-20454-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B23CAC0473
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 08:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 475D63AAA37
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 06:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEC5221577;
	Thu, 22 May 2025 06:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="loAZUlXm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2080.outbound.protection.outlook.com [40.107.103.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77315155A25;
	Thu, 22 May 2025 06:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747894595; cv=fail; b=XLKwfo4pWpsylWjXE2ssI/tcX+Xh4cw3Lgx4wg9ykJDZYPTlrV+oLU8Bw3+K6ZWOxL58CPGKYHME6wcS0IoFEhnFZRc2NgXGGrzt/mHRUz3dDzR3k5lxZPVEDMpsmCmpqp5pcyjj3OzWKQu/cqmDyN3zTihW+OVwo1Y8Ql+kLTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747894595; c=relaxed/simple;
	bh=VP/+4Cec9JDAHRNSLznZhCnoCk8oOhzh8io7GSPQbKo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fzGeGlKxR3+ATU3ST4Ka4b/bnbH3kBktYLlNK3LqwZTxqtspr/abS8705+KB8TmmTJj4Z58+CE37Lw7OkrlkAi8R59NWS70qJvqi3RFmupgoX+EwFCipK59K7slvAYk6eqo8y7hxA8fvOKyaPcXDSrGiKWIJHDucxAU5OyDmMWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=loAZUlXm; arc=fail smtp.client-ip=40.107.103.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BA6QHdGhWzNfQxU3IxcUytk8NrB7otJidI0pU0jAdpCR25hv+Hrz7kjLdnoFgotykP8wRVdiOT3Nz5lcyj7XKkeOVy5JsBujsDz1Vny6P2fgyRjs1WQFly2GVD0isTGlTUZ6nZtiAxcFwwVo00dMEEt+9QPfd9Ep5PXczwgj6jdy74qBEVyTepLBa2fKT7kGM0BlzE/f3+zxgpeOMyBH8IQJ6rzSnXAP9urieoc+N34PjGpzGe556Kw0KQFA31J4TiDSxC5ew0gjMa83192lEZ6fmF5VuM0tHINo/LL3utfRonwK5NuRiMYjuscL7sGj/mesisXdFCOXdI6nFB/EWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VP/+4Cec9JDAHRNSLznZhCnoCk8oOhzh8io7GSPQbKo=;
 b=myUtV+WoT9UYpEP13lx9mqIHaf6gyspUkcuVNXTtDnOfcuuy+ZaCil55/JaJTKG4iETui176zS2Vf4T0ARdwPy9zW5ig8xBSaz30dMHbyJC4FQc37H9JXxyVfstcpOKNTEs82yylQyhxg7LgY1LRP2H5t3Xy0joZpcl8LNjuzGm/OY5bvWA9LqDEZT3S+urkf+sA5pG1pFy1JcJnng5l34osH9VQd4UPZ8Zua69979zLi5/suHeUO3a9u2kvdTSNO2rK4ncEUUb4I93WYDQQ3GuwXcPUUsIf6B2XyaHoxDHSgJmAOGw+60AL/jmfRfTLL+n+8NlUw1eZP9tL0snf3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VP/+4Cec9JDAHRNSLznZhCnoCk8oOhzh8io7GSPQbKo=;
 b=loAZUlXm5I1cfobxkcRXh2DzvxNTQ0pXmRI+Mk/qB5KGh1U3FRuF6ELrmVkQmWtpq6C0Y0zPji8m1CzHUDwXd1y6kcryUJgd4Q3kjMJ66CMn72z5PV/CekUxT21QiUGPND7KyJccE22grPfyMQIC6HdC3V4/BXFX4mywoSvTm2HSy4994LPI2asoFLnVN5y2v4pJZcxTD7LBrUhXVLKL3/AMm2JOAkxrzvejqKUwivk162AQtsYbN7aX4EmBIRI72g+tAruQm6vu4FFxJBcu+LBZkRedzO0IARVNIhXh/9E0SW0gcrRj69hnBa/KKmI24Ax86jg2jS4IysiDjlvA6w==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10194.eurprd04.prod.outlook.com (2603:10a6:150:1ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 06:16:29 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 06:16:29 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>
Subject: RE: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
Thread-Topic: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
Thread-Index: AQHbyiFiAXGIjXNaiEKSziOE+hKW37PcrwSAgAAFRiCAAAX1AIABcsTQ
Date: Thu, 22 May 2025 06:16:29 +0000
Message-ID:
 <PAXPR04MB8459AB0F5740E3544499F0778899A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250521072416.57505-1-brgl@bgdev.pl>
 <PAXPR04MB8459CE5696113684FF076D12889EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB8459EE334B883AAAE22ACDFB889EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <CAMRc=MeqWd0uEM7=mjA0VnPM3VgZU820osTd+r2jGFF1Y8ZVYw@mail.gmail.com>
In-Reply-To:
 <CAMRc=MeqWd0uEM7=mjA0VnPM3VgZU820osTd+r2jGFF1Y8ZVYw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GV1PR04MB10194:EE_
x-ms-office365-filtering-correlation-id: 583671a2-e5b5-4409-e15a-08dd98f83095
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bG9WWUR1WUZaZGhOTmhlNW9aWTErM3E5OElXalVRWVJwNkoyaVBYYTMxNkJx?=
 =?utf-8?B?eUtxUkEwNkFBL21QWjUveDRncDJxU0tQd3YzWEpwVU5GQ0VoWnVFQnRBN05X?=
 =?utf-8?B?UERDRG5hQTJOODV2VmVDS21Ta3B6MXRhMDhNME1KMEtMdXROQXR0Yy9xT2Z6?=
 =?utf-8?B?Y2R5RHk0bTg5Uzd3cnZDRURsUFBhaXA3UU5BYk1sbE1UMllIYlhZb3FxTllo?=
 =?utf-8?B?V2p0SWdyVC9VTEp4dG5pcEVyT0ZWeFhWTTlFY24wVkhaTlA2SzlNeXNVc1JR?=
 =?utf-8?B?U2lYY0JMV1BrZURyVEROQ2VmZjh5NGZYTWFvMGN4WkJyMGg0VjA4em12OFow?=
 =?utf-8?B?VU9wL05seFpheHdFQ0ttOSszV2hTMkNXNWNla0lEdUhtdXNZNU1FRVREYlZm?=
 =?utf-8?B?Q1YraHluUjQxYU1pRXkveEdnQUl2MlIreFplcEMzL01GQmFDSUxQaFFYanpC?=
 =?utf-8?B?b2ZiaDF0c2tXbnhhL1ZEcXVwYllnQXlMTlA2OUhOL0I3cmh2SEptOW5UYmFR?=
 =?utf-8?B?UTRLQ1RrK3V3bkhCOTRSMnhFM2JqdnJYc0FLZmFHSXVOKzBlcThtY01WSFN1?=
 =?utf-8?B?dHovYlBDd1ZBNWtuYTdmNzd6VXFjK1QrRmJ5Rm55ZE1MWDZhZmhUVms5YXBL?=
 =?utf-8?B?OU9ncXJKRUFjNDJnOURVTkU2Y28wV3RmSC9Pam9Ebnk3SWxWNXBXZTVBSzVk?=
 =?utf-8?B?TXR3bzZLaE9WNWRFTERJQ2x6YVNNMnV5akRPNUU0b3cxSjJRMkFFM3k4cGpn?=
 =?utf-8?B?Y0pRaVRCV3k4QnhQbmRNRkFJTjJjMHBDVFpOWlZ2TUJQa3FHL3pRR1V4cW9v?=
 =?utf-8?B?RkNENEhEZklvWDY4UUxGQ05uclM1Y2lEaitMdG1oQ09JSnBpb1pVWFduUDBz?=
 =?utf-8?B?UGxLL0dIRXlqSm9tMDdsNkcvVU5XVExXL2VoMnZFaklDK3NJNjZqR09Rcnpj?=
 =?utf-8?B?c2ZWWlF2dWNQSE1OUHNoMG5vcXRlQXZxUGlpdlpEWTU0cDVmcGkzQWhtUisz?=
 =?utf-8?B?blZZMGJUaXU4RmlEUGJ0TnIvZFlKVHJocG5OSGZEcXM2a1E0RzJvSW1YdnQr?=
 =?utf-8?B?a3dsZkwwTjU0QXhJVDNKeUZVSGRIdmtjL2lhTHVBOEtJQUlXM2VGY0J1OWpi?=
 =?utf-8?B?bzFPUE1sajlBUlJoMkVIVU5ZQzROdXJjdmdxY25yNGk0Qmx4anVXUkZFNTlq?=
 =?utf-8?B?MnZUOHRCL2ZEYVFmU3JOMTd3WmpOdjArOWdkSnNydUJzMmlQMTFQcThmMnpu?=
 =?utf-8?B?a1p6bjZPak1qVEtGNHFUS3pVODJIMklkbXRBYXBmdStObE4wWFRaY0s2dkdJ?=
 =?utf-8?B?VzkxdHY0YTZpYTNyei9LdGdWcjJhOGRFdENXVm1wakdlbDR1dFZ6Y1BQOGV4?=
 =?utf-8?B?NVV6Q25WRllQb3ZMKy9zcjExeTVwT3VTZ2dLRzJ1UUx5dVRZSUxmT3JkcExk?=
 =?utf-8?B?SWY4U3hOQ1F2YWMxUW16bVh3ZDhYcjdWeTV4SWhBK1c2NHdIMXhkM2NMdHhh?=
 =?utf-8?B?Ri9mbm1SUy9ScXgwWDB5ek51b09PTTVYeU5meTE3NXNxN25qdTdxeUYydTht?=
 =?utf-8?B?blR5VnNxMmk2RHlCT3dSMFJpcjFpcnJWdWlBcXFLb1R0WFdKd3RZMXJMR3NE?=
 =?utf-8?B?R2N3d2c1bllKSklGWnhKMXZVL2NrMGdhSDlHQVdaVWtPeUxkSXhON3dhS1g3?=
 =?utf-8?B?VUNrbnl2RGlvU2h5M2pEem5vcDM5WGNyYkxrems0dlNUc0pYNzVPcWpDOFdx?=
 =?utf-8?B?QmI2MTMwak93SFRESVExZWdLTnB0aHIxY28rWDNSRXkyNnNPVmFKNVh4Q1hK?=
 =?utf-8?B?YmU4MElUdWxzRFdiaFZhUENLSUxGbytrZkpxSlFxbjZ2c09SVlpyOE0vQVRC?=
 =?utf-8?B?NFhPOXZrOThicE8rOUdpQ3lkdy9GbVd2S3FNUlc5VGNKdHczeGszb2xTRzlt?=
 =?utf-8?B?NUo5a1Q3QnFzdm4wT1ZTQU9SbGszYkRsclV4M24wcTR1ZStacTVjUTZ2YU0r?=
 =?utf-8?B?Zm5OZDhkam9BPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YUNvYnZjWCtsZU40K2s2K2pNVWg0eERWd0NkdW9mUFBzNnNZOEJ4c1FLalRm?=
 =?utf-8?B?aVZSaWw2U2lUYkg5RFppaGRacUhjNmQzaTUwcFdTNVBjSTVzdXNFdHhoalVo?=
 =?utf-8?B?MlVENExBZ2JQL3BVT1JoTGRkM053V0lTVk42T0FtOVF5Q1RoeXp5L0QyS0tB?=
 =?utf-8?B?ZUZYS3ZsK2lPMHdqQ214cTA0ZUgybjFUbTkwYVBzTkpFYkdjM2M2anVyZWda?=
 =?utf-8?B?K2ZiZlNBRlNkL1BWcDFDSFlqaFZ1ZENXdW1lMEF0cGhKd0N0WCs2bm9uNG9G?=
 =?utf-8?B?enhVZ1RhYnErek9MU1lJU1ZmTDFSUXBrdTkwall3cllRVFZJazZBZTlxY3ZV?=
 =?utf-8?B?QnppRmFGZGh5b1NhbURMQlNnU2M0L2E0YzZQSnlFWUNJQ1pneGl0WnlGK0dm?=
 =?utf-8?B?dU9CM0RWelljZUdKMEh6YTEwOU0rZGE0WXB0U0pGVHJHb2ZXaUNMMVJ4RFh1?=
 =?utf-8?B?WVFxdmE1K2NtN25jNUc0VGVkaS9ZU2pEalp5NnpJd1RxN3Y3Ylk1cDFnL2Rq?=
 =?utf-8?B?K0EvQnJBV1lxTDgwN3U0NzJ2QXA4UnBXVkFFYlFLY0llNDAwUVUwbzRqSTdM?=
 =?utf-8?B?VXRGTTRWSmRtVWhOaWJvSTVEaGtJVG9ISWZLTDJQOW45Zzg0UWVuTlBjQ0xv?=
 =?utf-8?B?Qk00MEZGbTZMQTRzQStHYzI0RVp0SHdmTlFKRnBxV0ZTT0lSVSswWXd1ZVJT?=
 =?utf-8?B?NDFuYjFLUWZOQ0c4ZUt0Y1J0QndvWFM2WjFORDhjd0lkNDJjODFnaFJ2TzFx?=
 =?utf-8?B?VmxTb3l5V3FudkhvbXNnRE1kOGoxeHFDZEN5U2oxeit0bzFUQTF6YjhsTnpD?=
 =?utf-8?B?c08wR2dVOEVUZDlXTE9ubVlxbHlxb0U3WXNMRitZM1hsQ0h4MmlpSFBqZzBz?=
 =?utf-8?B?MlFaVjdYSmVEa054dFQ2c0ZrdVc1TXZsRTl0T3J4eVVqMmNTWVhqdmdxb1RG?=
 =?utf-8?B?ZlNPYzVWRFdqVm5DSTFpcEowbG8zaStLV0pJQnViMjByTkZhKy9CWUZHY0U5?=
 =?utf-8?B?dWlMLzg4WW1lcU9LRHdDTUVvclhTUitKSVNsMDFvQll6ZlR2ZkRseGE4dDdZ?=
 =?utf-8?B?ZUt3MUFmOUR1SFdBWGx1YVRjWCsza2E0NzRkNFJQMzZrQmE5WXlWY0IrdHdC?=
 =?utf-8?B?ZmlocUlHaGNwZVR4NDUxRlRnV0JxYjhaZWMxamFxck5oMi9SN2IvcFVuUkQy?=
 =?utf-8?B?STU2RTJYaDdrVVNDbHVDRlpzT0JPMGhFWUxaSzJ1dldZb1I0a2dQTWVLQnc2?=
 =?utf-8?B?elNHcm5VZlp3SG9oNGVHNTRNTXRZYmlpb1hxNmE0U3krU1FBRWsyUVQ2R0x1?=
 =?utf-8?B?N3BNM0ZvZ3FiRUQ0VkhObVJUanVnVzlpdkZkNEFnNDFtdE1KZlJRNkY1enVL?=
 =?utf-8?B?NFVhaThkRldMNG9TUFM3TEdEaUd6RDJiUjFzUkY2QWF6d0VGL0lHVTRyQnZR?=
 =?utf-8?B?cnNFeW1zdisxcGJYQ2prcktJQU9QbUxPdHRHMTMvb1pPN2lHaUw4VWZpa0dk?=
 =?utf-8?B?ZVlYSDJBazNLR1VjdDFNYmtXclN1Wkl6T2FuNUZ5azFpVi83QkFiYmtuS1Bs?=
 =?utf-8?B?QXB5ZnVHUlp1cHp2MENIQVY4YlAxc2x0dDVqTk9nMDlDM2JCN2U1VDZXdnlw?=
 =?utf-8?B?QWluWTJlais3MjNIeFpVOC9jTkFBQ0tkNFFUa3ROU2ZhOWZ4MHhWR3NaY0FB?=
 =?utf-8?B?SlVsMytvaGZGczJVYUpqZU5TYXRteURFTWhjekZVK0NHTDlSamxKcEQwTGhJ?=
 =?utf-8?B?TkJWZTZtQUh6TklySnRaV2Jram43Yzc4NHlKNXVValpPK0E0bXZ0N3VWZ3J5?=
 =?utf-8?B?eXBER3hNdG9FY2p3VFVHcGt3THBUcnV6YlNQYjk3WVduSis1amlGM2Ezd2tV?=
 =?utf-8?B?NDFya3VkTTJKNHBrR3p1cERlN2dQa2tZeTlkdDd6S0VaYnFtRXB2ZU9GYWdx?=
 =?utf-8?B?MGhSUHhlNGQveGNNWFdWSWZRdEQ3a0NPSUZWUXhobFNlSUg5RUNPOGs1Z21u?=
 =?utf-8?B?TkRkMUVhV0N3NWRuWHcyYWZNbTZaQnFmZkFzaGxxdXJVTlY1N01adjhRRS9m?=
 =?utf-8?B?c0M3VWZtWXZDeWZTQnJOWHhxWVJGVUkxbVpyNEFHNVJyUW1oT05nRy90cVBt?=
 =?utf-8?Q?wB/U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 583671a2-e5b5-4409-e15a-08dd98f83095
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 06:16:29.0726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QRd3Qp/OlrOjiDkKpbGh+XEuKo2oRzToQ4O4OTAFuD/RAywNsJSZYbQC6qLScZ6uragFtP6lsJuSHR5iFSMcbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10194

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBncGlvOiBkYXZpbmNpOiBzZWxlY3QgR1BJT0xJQl9JUlFD
SElQDQo+IA0KPiBPbiBXZWQsIE1heSAyMSwgMjAyNSBhdCA5OjUw4oCvQU0gUGVuZyBGYW4gPHBl
bmcuZmFuQG54cC5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gSGkgQmFydG9zeiwNCj4gPg0KPiA+
ID4gU3ViamVjdDogUkU6IFtQQVRDSF0gZ3BpbzogZGF2aW5jaTogc2VsZWN0IEdQSU9MSUJfSVJR
Q0hJUA0KPiA+ID4NCj4gPiA+ID4gU3ViamVjdDogW1BBVENIXSBncGlvOiBkYXZpbmNpOiBzZWxl
Y3QgR1BJT0xJQl9JUlFDSElQDQo+ID4gPiA+DQo+ID4gPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4g
QW5vdGhlciBvbmUgc2lnbmFsbGVkIGJ5IHRoZSBidWlsZCBib3QuIFBlbmc6IGlmIHlvdSBjb3Vs
ZCBnbw0KPiA+ID4gPiB0aHJvdWdoIHRoZSBvdGhlciBwYXRjaGVzIHlvdSBzZW50IGFuZCB2ZXJp
ZnkgdGhlaXIgZGVwZW5kZW5jaWVzDQo+ID4gPiA+IGFyZSBzYXRpc2ZpZWQsIHRoYXQgd291bGQg
YmUgYXdlc29tZS4NCj4gPiA+DQo+ID4gPiBJIHRyaWVkIGFsbCBjb25maWdzIHVuZGVyIGFyY2gv
YXJtL2NvbmZpZ3MvLCBubyBlcnJvciB3aXRoIHRoaXMNCj4gPiA+IHBhdGNoIGFwcGxpZWQuDQo+
ID4gPiBJIHdpbGwgZ2l2ZSBhIGNoZWNrIG9uIG90aGVyIGFyY2hzLg0KPiA+DQo+ID4gRm9yIG90
aGVyIEtjb25maWcgZW50cmllcywgd291bGQgeW91IGhlbHAgYWRkIGEgcGF0Y2ggdG8gc2VsZWN0
DQo+ID4gR1BJT0xJQl9JUlFDSElQIGZvciB0aGVtIGFsbCB0byBhdm9pZCBwb3RlbnRpYWwgaXNz
dWU/DQo+ID4NCj4gPiBHUElPX1RJTUJFUkRBTEU6IG5vIGNvbmZpZ3Mgc2VsZWN0IHRoaXMgZW50
cnkNCj4gPiBHUElPX0JDTV9LT05BOiBtdWx0aV92N19kZWZjb25maWcgaGFzIEdQSU9MSUJfSVJR
Q0hJUA0KPiBpbiAuY29uZmlnDQo+ID4gR1BJT19MUEMxOFhYOiBscGMxOHh4X2RlZmNvbmZpZyBo
YXMgR1BJT0xJQl9JUlFDSElQIGluIC5jb25maWcNCj4gPiBHUElPX1hHRU5FOiBhcm02NCBkZWZj
b25maWcgaGFzIEdQSU9MSUJfSVJRQ0hJUCBpbiAuY29uZmlnDQo+ID4gR1BJT19HUkdQSU86IG5v
IGNvbmZpZ3Mgc2VsZWN0IHRoaXMgZW50cnkNCj4gPg0KPiANCj4gSSB0aGluayBhbGwgb2YgdGhl
bSBuZWVkIHRvIHNlbGVjdCBHUElPTElCX0lSUUNISVAuIERlZmNvbmZpZyBpcyBub3QNCj4gZW5v
dWdoIGFzIGEgcmFuZGNvbmZpZyBjYW4gc3RpbGwgYnJlYWsgaW4gdGhpcyBjYXNlLg0KDQpvay4g
SSB3aWxsIHByZXBhcmUgYSBwYXRjaHNldCBzb29uIGZvciB0aGlzLg0KDQpUaGFua3MsDQpQZW5n
DQoNCj4gDQo+IEJhcnQNCg==

