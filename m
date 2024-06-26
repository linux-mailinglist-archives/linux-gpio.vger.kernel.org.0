Return-Path: <linux-gpio+bounces-7742-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C269199E0
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 23:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B296D1F227EF
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 21:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9239A1922D7;
	Wed, 26 Jun 2024 21:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n3xXO5TI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA34B180A7C;
	Wed, 26 Jun 2024 21:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719438329; cv=fail; b=QsvOMbDaB47SPPMQ9i6QLNaP9MA8ECt0sjX91a9zS9LTiLaO+fUVxjKF2rmQy4Ia0eYOq/BTXpUP86OuL4R+Q713z65fS4p+zXk4IP9TgdMAobwb/DVjuuO44k+vPvrTCd2A3UG9BQWsD9j+I2mr/didhROavad+xQnEp9ul1XA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719438329; c=relaxed/simple;
	bh=Fn03jL9bBjYTIrHmKj4gVzNWSk5qps8BD2HxykeZqWA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tHy3mdVDaDrug+wnhkyCJyCpV+unAtG0SiF7LXkb8q3b93VEaamJCPbH/v859v6uKLNuJHFVlfbgcZtinzEu5uRsTWWFstW57wWWbiJLLj/Lc29kjkA2F3HiK8TS62cBepCDGaQkeYaSONmGi0DNwKjasV5+0n2T+VDhAgvAE24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n3xXO5TI; arc=fail smtp.client-ip=40.107.223.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RF2ChnaBfLekerbH7I4XZLSA+8U9545sbUR4MwsQKQEeI3LfjnpJ/TRvRXQKnaM+jUgVZwwUeBPQ/6aa9txmH0jlbS5rUs63oriwFu/LlUGZd0SqwLQc+oChpar9QqtCC5uag1iwRngJwUfr/BNdrTmsi8nUF27gLCMiI9ByHGdqaRcCLrtWronC+9rcUJc2v6uWJgvRDGDA+jx4AO4BKewyJb4C//Xrgl95DS4l80qJyv28bbou642PbNe0naV48MDe7I9T54K/60aOllkYSdo9m1QlBXv/cHyCwod1VHcb8taMlC+7tUD6hJBTOAmujW+oC5WPKtjmhujEaKkyvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fn03jL9bBjYTIrHmKj4gVzNWSk5qps8BD2HxykeZqWA=;
 b=b4VexV18SFwk85PqGcxFCzCV9UWWE8HPSY8Ja8DPfSya07Rc+DPwkBBncm/L6C990fUZq/1RNBbD6yKtH6TQ0aPA3ubRATZHunmUPfr6x2Ok1qyIa+doDttpURvtXpD/wUyGXPHC/GV/WXs9ccXadeOR8A8rmJoBl39uWCNjO0qPEHGl/XHUSWgZg4HTJuUlsCdyrtGGafnThMbUA9ATYKZ7yLFxlsvb8Wj2Th0JiUtOqdA6wiCVQ+Ov64/x/r1e+KVfrYY1zYuITUcXxuJgWF/wMBMevImorDTLdS41sgMHYgKCPDH/UdASIRhoxCjbJP7POljnOL3DH2QYXXU7tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fn03jL9bBjYTIrHmKj4gVzNWSk5qps8BD2HxykeZqWA=;
 b=n3xXO5TIqUnfJGprEHNrFYdKwO6aQZPm7/Ps6aiMA/+POSC+fKDbwsPkfFHdP3kryVY7eehv2RJDyqSqkpkMjlwRXTzq0nktwAKExiDaXDWZORFTHEuWHN7nyKb7/ajNWt/76PDZ+m2D+b0yDaeHOTU2/rUprH3DC0cIdpd9uztmsdNxU6Zf7VkIIqk+332lB/MY7UeGAYVpmvYdxAmIUYmxPNhCn0BxsoN17CkDD6IYP1BFnqnYA4vn9K9xIGEbhqYHaM0bxO6XTmrvcKiZx6W7ycF37kjmNr+3Ybcv00oRniFG1Zm/t6B2OrlvdEBBmmOQnliXnq/BIXRGis2XFw==
Received: from PH7PR12MB7282.namprd12.prod.outlook.com (2603:10b6:510:209::7)
 by IA1PR12MB6530.namprd12.prod.outlook.com (2603:10b6:208:3a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 21:45:23 +0000
Received: from PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d]) by PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d%7]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 21:45:23 +0000
From: Asmaa Mnebhi <asmaa@nvidia.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
CC: Shiji Yang <yangshiji66@outlook.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko
	<andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Mark Mentovai <mark@mentovai.com>,
	=?utf-8?B?TMOzcsOhbmQgSG9ydsOhdGg=?= <lorand.horvath82@gmail.com>
Subject: RE: [PATCH] gpio: mmio: do not calculate bgpio_bits via "ngpios"
Thread-Topic: [PATCH] gpio: mmio: do not calculate bgpio_bits via "ngpios"
Thread-Index: AQHaxp4vrmshrWYuwESVGOzheqoT1bHaJKDggAAG/gCAAAFHoIAAU7+AgAAWM5A=
Date: Wed, 26 Jun 2024 21:45:23 +0000
Message-ID:
 <PH7PR12MB728290AB15E7F027186306EBD7D62@PH7PR12MB7282.namprd12.prod.outlook.com>
References:
 <TYCP286MB089577B47D70F0AB25ABA6F5BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
 <PH7PR12MB7282BBF9E42265E18CB72E09D7D62@PH7PR12MB7282.namprd12.prod.outlook.com>
 <CAOiHx=nssvX-VYySmpLZ8bvBmitT87bX2AYspdkH3y9iWTB+kQ@mail.gmail.com>
 <PH7PR12MB7282028713977D608DBC046FD7D62@PH7PR12MB7282.namprd12.prod.outlook.com>
 <CAOiHx=m5bqsCV984L6M11rsWgrW-wDj6jFh9tSBDyKq3+ixOgw@mail.gmail.com>
In-Reply-To:
 <CAOiHx=m5bqsCV984L6M11rsWgrW-wDj6jFh9tSBDyKq3+ixOgw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7282:EE_|IA1PR12MB6530:EE_
x-ms-office365-filtering-correlation-id: 16606466-e219-42c3-1b25-08dc96294881
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230038|1800799022|366014|376012|38070700016;
x-microsoft-antispam-message-info:
 =?utf-8?B?aVh5eTVsVlBlWC9scUN5Y29LV2JDMEZsZTN1M0E3NXE5UGRxTXZwQTl5b1pU?=
 =?utf-8?B?a2FsWlhmMVNjQXpPMGRrNGEvUGIzUytFcU53bG9qY2tqVXNFZzBaR1dLMzZz?=
 =?utf-8?B?WTE5OFJxVWJZMnFEbzJQLy9tY1E3elJLN0EvYVpMbldnKzN1c2drWEhqdmYr?=
 =?utf-8?B?Zkwwei9ZWFRHSDVUUkRwb2IwQ0U1Z3dHbFh5NzM4MjhPNmZwNy92WjVrYjdk?=
 =?utf-8?B?UWcwM2lXa2RDbXBDcU5DS0dWRThqRWJvdktpcDM3bWJwSHYrTW4zTWNWQ0x4?=
 =?utf-8?B?Tko5ZzBlaFJzMlZHWllvS2pZMG5sU21uU2NYS21oK25QbmlQdVEzRkd5Vi9r?=
 =?utf-8?B?V2RhWUJaelBia0RGd3FlRlAxWTFVNmhvcFRCRysyMDFEUTlJVDJyczJ4d0FR?=
 =?utf-8?B?L3c0WUVqTXdtRnQwL0NtMzdsdThqN21hVlA2Snozc1FyK3lZYll4MXJXUWpU?=
 =?utf-8?B?bDdMdmZ6VWp3WmhyaldiUThldUIwK1ZvUWJHWFJzSVh4dnRKZlk5NHM0Zklu?=
 =?utf-8?B?Q3J6aVhJV2lvdmJ4WUR1c2xrY005a1puRXVQcytqUzdhTC80eW52T2NlbWFF?=
 =?utf-8?B?U1RhV0NhUHo0ZHg0RFMxbDFSTWVNTmZJbm9CeVZuNjlTRXJZZHJMck9XeEdQ?=
 =?utf-8?B?NkhKSkd4Uk5rZ1ozazhLcW14ZWtmRzgzWWtidVdXOW0wWjRCWENZOWZPMGFv?=
 =?utf-8?B?YWJ6QjEycUtBTzlnczB3V0EvUVFVQjA5SEVhL0ZTWWNQTGszWlJJREZHUm5W?=
 =?utf-8?B?dGJRVjIybUZMUWRMaHl2cVpsOFhHemhmc2F3S1dLbWxjallKVkFiMEJHSzlD?=
 =?utf-8?B?c1ppZ3FXd2VYc2tobzlFV21wYzRVOXV5ejlXa2d4YS93V3ZSNk9NTGwxUHgv?=
 =?utf-8?B?TkozSW9pdU5KQlM1TDBsSHRvVWo0V3lta1RBVWVobkNKeExFbklKMFFuSW9l?=
 =?utf-8?B?a2w4dkZMWDRRTGxwOGZLZ1VTOGhLUjJ2RnpST2FKT1I0WitwalFSKzNtM2Uz?=
 =?utf-8?B?MXd6WnN4cTlucjFiYitkS0c3QXd4b3Fqb29vSENnOG9GbzNKUEtxOWU1cFRV?=
 =?utf-8?B?SWs3THhlR0JxUGFLTXNkQTFuekhEa2NzV3h1Nmx6VDBkYmtSNWhaYW9tSW9x?=
 =?utf-8?B?ZExwQnAyYTVEK3BtYjlRcmFmWWd4SU5CUFJRK2M4bnMvQ2trRzI2VWd1NExU?=
 =?utf-8?B?RTVuK3lsdy9PVmZmS1UycW9UYmdVd1Y5TjdJWExUUDFnNW9sKzI4Q0haYjdj?=
 =?utf-8?B?L21DUzZsSzFVUDVkOGVQaThWSTFLelVJa1o3Mnk4d1dxVVRnQW5WRExXMnI2?=
 =?utf-8?B?Q3ZtcWFVY2wxWkRaaHJtRzlDVG9oajVzbGdDemh4ODhkckd2VHB0T3JKZkZO?=
 =?utf-8?B?VVpmNEIrUHd2dnJqR1ZSMTBJNXhWcHBrM0FLa0kxQldvTVN3S0FteFNaZEpV?=
 =?utf-8?B?ZnJ5Q0VwenI2VStmcTQ1RTl5b2FSdDBSZGVaV1ZkWGlSYzlTK3lyTllZTzhq?=
 =?utf-8?B?RXNFUm9HUHhhOFhQejRBeWJGS0twMHI1VTFOaXBFQ1hwQnoyTStpbFZNZUVn?=
 =?utf-8?B?b0trRGlOTDBvWU9kMUxSS0JOakFRbHBFNkxLaHFybWdVbTNVcVVqYTd0eVAx?=
 =?utf-8?B?UVZGQ1lrZ2NLcG1RSFJhMm5Zd1BkTm50MXlKVW96NWtGUFFCanptOXlINUNo?=
 =?utf-8?B?WFNrZytiZGdPUUM2OGdNZTY0TUlxMlRyVXJrU2dUUWRDNVhGQTJCZjRYZmti?=
 =?utf-8?B?VkhLQ0ZZU2xGT1BXWGUvazRvL2lEQTJ3ZXU3elhhci9IRWt6M2Fiam54Mlh1?=
 =?utf-8?Q?SoABodQhGmcZDCpi7b7X2FlA8+I44mnEXIZoI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7282.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(1800799022)(366014)(376012)(38070700016);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UmZrRjJYVG9VbFNLaGNwVExPVjNaVEVPMk9NZVZNb3JZRjE4dnFTK2JpdEJi?=
 =?utf-8?B?UnhRMk9XajMrQnM4dVpCUmRLWDZYUFFzdUpYN3kyL3JSOFVMSDJTSlhtSzk0?=
 =?utf-8?B?bHdTYkJsaVJ5MlRPYWJoRG9zU28yQ3Jya1dac1JNcFNCOFRBQVFSNzlBaHJY?=
 =?utf-8?B?cTRzUDljRnVwNVJvN0dGU0VMQklmalRvcmtoTjhGVmphbm41cFBEOE9qVXU5?=
 =?utf-8?B?d3VjdlhFa0l4VjBoelNnRndkdFovSGVsYmFKUll4VHUxZ3M4Yzc3dklYeDZp?=
 =?utf-8?B?eGxVR21ZWTJGN3ZMM3hqYllmSE02ZWw4dVQ0SU1hcWd6T050Kzc3OFJ6bWZw?=
 =?utf-8?B?Q3VLVXIrOEw2MlgxaW5VdytQVzkydy9qbkZOU0FzNjd5R3M0QXF4TUd1TFIv?=
 =?utf-8?B?cFJGQmNiazljSGFuV2lvTnp4S1NVcmtNMmlDSFQ0Nnk2aXlYZ3M3eTFzTlJp?=
 =?utf-8?B?ZjJVOGNxd3FTSzRxOHRtRHdmaE5USmRnSVZTaEdrL3pCZEJGRTNzcWhhWlc4?=
 =?utf-8?B?cWFKcjEyVS9aTU45OFVJSVVUcXEvRnI5aXZoTVFGRklCWVFtWHBFU2FhZTdL?=
 =?utf-8?B?WExGTGE0KzRZcHNkTVY3eXZDczZVQlpZeDB0djFNc015MFV0L1BOakNuN1A3?=
 =?utf-8?B?dFcxK21SdEthY0U0RGxadVIwWmg5MFdBbDU0MFEzcWJlbjZuSmFRNmVFMHVS?=
 =?utf-8?B?dlhLT3FsT0xHWGovNFlkcHNiZ2Q3UUNpUm5EUUQ2N1NpaEZWdTI3RlBnNkVP?=
 =?utf-8?B?amFFMjlCUnhxYUpxYTFmOERZY2xjYlRnRDV4TFFMRUJ1SnRsU0FHdk93ZkZt?=
 =?utf-8?B?MWpwYmxUdVRHN0NNRFpzOVlUNFZMK2pxdCtJWUpvTmNZeVdSOHdvZGpnWFI5?=
 =?utf-8?B?OEdBYmZMYklTTXY5ak1wUnJxMndDWEJRZTF6Qm4vcjdlN2lFSDlmUFoxdzcw?=
 =?utf-8?B?QVdNRFMzQThhMkpaTjBKUWtackpmaHQyZ0MwelRBb2JPajBCZ3ZaUHhjRzBJ?=
 =?utf-8?B?cVowMVlqdDFGVy81L2hFeXQ5dW5XQkhsRXNrcS9zWlFtM2Y2VWlycXZSYm0w?=
 =?utf-8?B?UnJOZE4yRmlsRVRtcTBrL05rc0IzeFNXdlBZSklrcVpJYXFEZlJ1elJwbFk5?=
 =?utf-8?B?SEk4N09ESVphdG9tU05mYWRSdTEvU0tYS044djRMc01zMnZuaFQ5WXowRmRF?=
 =?utf-8?B?ZCtsd0VNV0tWWEtsTk0xOGMrRjIxaDZ5TDUybEhvTHk3MHUxRFAxbGdOS1J0?=
 =?utf-8?B?TlZjMEtCTDJuL21aS1RYSHlYNnhNY094aFp0T1lGYS9CRkY2UGs3SXJYUU1N?=
 =?utf-8?B?V0x5TVJaR3NpTUhyMnZqZUo0QUZXN0pxVmd5YlNQRzQ5L24rY2w2ejB5cjU2?=
 =?utf-8?B?a3RhckgrMTZXRHI4NVFRMGZsZHJtbUl1bk0rYUFmRWVqZUJXMDZET1ZlQ2VX?=
 =?utf-8?B?VmlSMDJWV3RvcHo4M1V3YkFhbllGOGtyK2JaTStkWldiTE9tT3R4V1ViempX?=
 =?utf-8?B?MDQxR1FsenN3RTlBdXE3RDgyWGlKbzdwb2I4UVVvcG5BbXIzZVR6OVpnR1Ja?=
 =?utf-8?B?K3grb2l4ZjlxVnlKZWtjYkNiQVJOQ0cra3ljU2E3MTRSTDZXamRIa0hLQ3Fi?=
 =?utf-8?B?Z3p0c1dGajBUTytzT1l6MUwrelRtb2I2MklpcHNWUFp6dks5aHVYU3pEamor?=
 =?utf-8?B?R0dVeE1WeWFQNnhlRWY3QVA2ckF5M2xza2poelUraUpacjZhcm4rOXoweXVk?=
 =?utf-8?B?R0x3dVA5bnY4Y0hOOVU0RU1UbDhUZmJjbGpNRExhWjJ2UFNhbWUrQlBkQW5J?=
 =?utf-8?B?Ynl6YmMydlpuSnhiQ2w2VEFNaHIwMFU4SVNnSXlzaU40UXBtcVhJMkZBbG5y?=
 =?utf-8?B?eWVhWThsRmE5U250M05uSStCRUJEdkR6TDE4WHBHTXR1NDRqajRkR1lPVWEw?=
 =?utf-8?B?Y0p5d3FWazhtWTRHaDNPaEI1QUM3aUZCaCtGUnNtam5uaGNoWXdYVG9VTWs4?=
 =?utf-8?B?cnNmYS9aRWI5ZG8yZGpueXhmOGgvdDdXcytHUlR4VTVjNDkyM0dmdFFrQXNj?=
 =?utf-8?B?MldOVGFOdVg5V3ZWeDUzM1M3U1hWYzJxZFo5WHVmYVZrWHQ4ZkozZloxMDJH?=
 =?utf-8?Q?PLgE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7282.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16606466-e219-42c3-1b25-08dc96294881
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 21:45:23.3509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HhkkE8lX08hq9z6vpjdi8lniBvWbmrWJLvjMWV0ARdgtrLNXw5VNXRhb/bcc/vlB2CgOyFd2RKc6q00Cp2yPqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6530

PiA+ID5JIGJlbGlldmUgd2Ugc2hvdWxkIHVzZSBvbmx5IGEgc2luZ2xlIHNvdXJjZSBmb3Igd2hh
dCB3ZSBuZWVkLiBJZiB3ZQ0KPiA+ID5yZWx5IG9uIG5ncGlvcywgdGhlIGJncGlvX2JpdHMgc2hv
dWxkIGJlIHJlY2FsY3VsYXRlZCBiYXNlZCBvbiBpdC4NCj4gPiA+VGhlIGV4cHJlc3Npb24gZG9p
bmcgdGhpcyBpcyB2ZXJ5IHNpbXBsZS4gU29tZXRoaW5nIGxpa2UNCj4gPiA+cm91bmRfdXAobmdw
aW9zLCA4KTsNCj4gPg0KPiANCj4gUmlnaHQsIG1pc3Rha2VzIGhhcHBlbi4gQWxzbyBJIGRvbid0
IHdhbnQgdG8gYmxhbWUgYW55b25lLCBiZWNhdXNlIGl0DQo+IGhhcHBlbnMgdG8gd29yayBmaW5l
IG9uIGxpdHRsZSBlbmRpYW4gc3lzdGVtcywgYW5kIGJpZyBlbmRpYW4gc3lzdGVtcyBhcmUgc28N
Cj4gcmFyZSBpdCdzIGVhc3kgdG8gZm9yZ2V0IHRoYXQgdGhleSBleGlzdCA7LSkNCj4gDQo+ID4g
IE5vdywgaWYgd2Ugd2FudCB0byBub3QgbW9kaWZ5IGJncGlvX2JpdHMsIHdlIGNvdWxkIGdvIGJh
Y2sgdG8gbXkgdjMgcGF0Y2guDQo+ID4gbmdwaW8gaXMgdGhlIG51bWJlciBvZiBncGlvIHBpbnMg
c3VwcG9ydGVkIHdoaWxlIGJncGlvX2JpdHMgaXMgdGhlIHJlZ2lzdGVyDQo+IGFjY2VzcyBiaXQg
dHlwZS4gVGhlc2UgYXJlIDIgZGlmZmVyZW50IGVudGl0aWVzLg0KPiANCj4gRXhhY3RseS4gQW5k
IEFGQUlDVCB0aGlzIHBhdGNoIGRvZXMgZXhhY3RseSB0aGlzLCByZXN0b3JpbmcgdGhlIGNvZGUg
dG8gdGhlDQo+IHN0YXRlIG9mIHYzLg0KPiANCkxHVE0gdGhlbiDwn5iKLiBUaGFua3MhDQo=

