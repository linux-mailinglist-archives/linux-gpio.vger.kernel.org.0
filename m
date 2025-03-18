Return-Path: <linux-gpio+bounces-17742-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F080A676EC
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 15:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AFED16C5B0
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 14:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6EE20E6F6;
	Tue, 18 Mar 2025 14:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="f+iUHXox"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013012.outbound.protection.outlook.com [52.101.67.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEE61586C8
	for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2025 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742309506; cv=fail; b=EzNM0lbxFnEgjsy54sy7am0DBXO03GUSCsQzv2ULwKTMNBEaGIUHM9L1ksPOlokJqmRE67etmsa0KYqVJDRzmP4IGYiUEgXN0RtGqC1uVwo/iLOcnho56s8niTGvOD/CgyJP6688HORwUGkUkzmQ0iH4KTDIo1Hg4upMa4rragY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742309506; c=relaxed/simple;
	bh=Iw3tIogvtPhH6ab82yS3GleHpsXrfveH5lpleyIbzbs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VlGxC7ROOBbVj8BSW6bVYhqXopu5zgx2wB5cNkx57EXHWhjLGdce5YHsCZNa+xNw6hvfDEI9bNsrgggfSD00ukXASr+Cd3uOAF5+A6CNKksQwiVSvaz/qz75xh3VOeAXTIgA+SjdumshUFwqEmjnF6vjV0nWC4DoULQr/qe3mG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=f+iUHXox; arc=fail smtp.client-ip=52.101.67.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKXHTwAwNv7won4697zIcWh4OafMyb52X3iap7iHNT3JuGUiyz+xT/1F+58rkyxJac2xyl/IkxZ2d69/ALznNLMy8c3NT5Mp5vzccEx9nGeW8pZYK02RMeCJU2TYC/sOKHEgdgopSQaXu202cgPmmI31otTxY6gn2aGNw+dwysjF2rs8UScPCS3+WMzPjBqYcAXQAlypsb0nlCS1cALNjtr19QccOe0q0HGm531gloJr8byMZFi+ea6+jqSYhCZOYdzSY5P3Ou7LlOeh3vlqQY3Q0eJ2qqqRWWyOZCudS1YvyL883WBtS8Dafq90HuwqMIzNLV90U4XDu+U+1pzQfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iw3tIogvtPhH6ab82yS3GleHpsXrfveH5lpleyIbzbs=;
 b=BJdO0cgVAKliYyuQ9EExakpOW42KgLPm2IpaadKEhO0O0iqaf0BicZ7Ad+O9nWrTv9UOdZUDnWS3pDszz09Lbi9TNb6PMkWUwBZzv8FgsXSYTUNzmtsKA2kXRyUUz2FQEnxp4zBpjmgv1fRHph8v/1Q1Ul/ZMDEUrY3LY6Ml3Hxo/bUpsCaOtFdS6G26GRYf8pPzJ90VGJ/umvqcpwoNMVAJycvHh4o50ieHI2j8T++ox4MtS0RkGoSQBC+SHiM+pmSBC6kMj8e985Df2dOZfhXBOwPwNsN4RWiTVk+KazQTdlGqkDyhx/nhoWlLY9sup0QHw2LDHPpbxSZTFcCgZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iw3tIogvtPhH6ab82yS3GleHpsXrfveH5lpleyIbzbs=;
 b=f+iUHXoxx+9oPO30+rsWLE5j2AuSgxh+GyHusW8l5KkVImfE8UC4tMAlhT6NMFQ7odoB779hAkgIWiOzGVfTqylkQTnYVGFMkHb3qCnJ+OXhDZocPT4e7kysyN+A862yQSlBzbbEGBn3qaMetbMxljzp1eqwlSp+nGlYF5hjUHQkUjO/2bXArRdAq0iEzDq7AMOdImxX+hTOsXfqhkcGbG+j9I35TsobhceN66zIZoJsGZUGnowNkXl3YsaKHwdgCyru3YiKkKLmQ3mrMzFkBvVQMvF5ERbDIJkuxOMTr38GqpbbfRFqwbdcPc+3DKKwXGtRgY24FR+UXkxUkzBzkg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10164.eurprd04.prod.outlook.com (2603:10a6:800:243::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 14:51:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 14:51:40 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "brgl@bgdev.pl"
	<brgl@bgdev.pl>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: GPIO TODO
Thread-Topic: GPIO TODO
Thread-Index: AduX2JVnMdEdC/ApTkOWXjYXYxLUeAAE/bsAAAClQYAACJGJIA==
Date: Tue, 18 Mar 2025 14:51:40 +0000
Message-ID:
 <PAXPR04MB84590CCC9DA69172B665B71188DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References:
 <PAXPR04MB8459BEB700FB66FE693EF1CF88DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
	<CACRpkdbHr_CpoqGwE+mXxV0My30ZcBRJmK9313fXN0rbPDPbDA@mail.gmail.com>
 <86v7s6myka.wl-maz@kernel.org>
In-Reply-To: <86v7s6myka.wl-maz@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|VI0PR04MB10164:EE_
x-ms-office365-filtering-correlation-id: 76039d0c-3abd-4b1b-1ac1-08dd662c6483
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dXJXTGNDaXp4ZTdkZUdDUy9aU2pFQ1VXejZlSDhvYXVRVW9yTXgzcStJVkhS?=
 =?utf-8?B?TjBoYkxheXMzcldhMUlodmZGY3B3SXAzWFdEQnlPczdKWU5IRm9YS3NaMFc5?=
 =?utf-8?B?bjAwK2luOXJlUFNVRWRDc2tBRXhYZ3N0VTBHMXJxK0FacW5mK0hDQzU3eEIw?=
 =?utf-8?B?OEErZitDNEVldjhxUC9pY2xCSkUrNUtpYVpjd1ZwOXZFbmR1b05lK3VESDdl?=
 =?utf-8?B?bXltNUw0VVdoMzJ6Ykx6dFF2VW5XMTcwb2lFd1Fwd3pkNUNjbU9sbXFTeTNO?=
 =?utf-8?B?QlE0YTFFTjJzRmFNR2MzVkltU3NtdkY5cFlrVXNCOHpXVUZkN2IzMW9RWm8v?=
 =?utf-8?B?MGt2c1JxNWNpS21iZWtoSWRvSVNOQXYzZG9HR3dCeEdiZm9QYUxIcXZlM3pU?=
 =?utf-8?B?b2NMYVVHelNMSllqOTU2aUc2NXY4Zyt4L2FiOUxuMUJLRTF4a0dRMFluM2lI?=
 =?utf-8?B?TzF0NHFmTmV0aGs3S0hsMC9wRWtzRysvY05ZZDVqSHJWazM0a0lqdmJZbURU?=
 =?utf-8?B?OUx5TXhVMlVNSGk3Y3dONllTNkpGSlVVMkhrSjNKdGVXclBHSnErTHdraEVB?=
 =?utf-8?B?azNmeTc2Z3huSUxxek5QZEYxWk9VeG1YOWF2UEJaZGZYNnlMK3NpeXovdzk1?=
 =?utf-8?B?WGtJemZHTnRod21FRi8rWGFTeGRzb3lWUjJwblQ1SE9zQ1BnblMrTExDMjBz?=
 =?utf-8?B?WThhMjYrWUU5ZVpFODR2SUVwbWw1dkx5bzlZOWk2dlUyN0pOaHpJZ0Jwakty?=
 =?utf-8?B?dUxXQkRkMUJTbUE2eEVZT2UwSGd4dlpmOVI1ZzNyRzNkM3pMR3I4OFVXTlZv?=
 =?utf-8?B?aTIzeUI2VzlqUkZiUHE4NCtMOGtNMm5WK09ocFZxNnJmNkEyRmo1N2EwVGUy?=
 =?utf-8?B?UDFxaTRCUTNPVjE5NzNFTkNoWGE1dktVakR1MXdEeXRmSnk2WFdvS0l0QzBH?=
 =?utf-8?B?aXI4M290QmFNaXNvTkRjWktkK1hURWtucU5lWWhHbm43amdCaktiNk9PWEFo?=
 =?utf-8?B?RVNkeDNUcUw5Q3pwdmRtL2ZQN2h1d21meDRDNXpGZmlBeTZVQmNydFpxRHNq?=
 =?utf-8?B?SXhrN0tXNzRRUjJ6OEQ4WkZkMWs1ZUM5YzRnQ0h5dWlzNy9oc0thV2lQUnRQ?=
 =?utf-8?B?YXpnZi9tNWdjSVJFSnFsZHJNdjR6aEhoMkFVcGFweklqWUdzZkN2RTkxQ2tu?=
 =?utf-8?B?dG1rK0llRHFoSFRldE1qQXl0K04wQTNsU2tjLzI4YTRpUmM2NzNFZTRXNjd0?=
 =?utf-8?B?MVpuRzZueEVDZXVua3B1MDFUaG0yYytpMXN6NUcvTWlyOXBvUHBjaVV4ZFJ2?=
 =?utf-8?B?aEFzSjcyT1dmY2tXUXhKSlQ0OXpIZXdmdEVKL09yM2M4eVVaYlVxcUFXZ0Za?=
 =?utf-8?B?b2JXcXJyUHU2MnlFUVBUTTBxalNMdVNZL3VVZERCbmMzNnhVd3B4V1FGWURC?=
 =?utf-8?B?eG5Ta2FhQk1nVnorc2xSMnNRLzZEaHVUT1hwQkdNZERFa0hYbVlxWkJTQ3Yv?=
 =?utf-8?B?NWNRd3hPYjZPUWgyVG4zcnVwZmFmdWVaWTR5NmVlbEJ3UWludEdMYmlJaUxC?=
 =?utf-8?B?K25KaVJ6MUNSNUkvTEkyNDBnd0xPT0dIYk95NmVHZTFlSENaRzNEQUZXc2Yr?=
 =?utf-8?B?Zm1YeThUUStFRVlHVm0vS1Zsanp3bnAxejJ0Y1l5MVBoREdXSHdtUFMyc1ll?=
 =?utf-8?B?VlRGaEswVkdOVkdQcS9jMjY0YkRpS1JXT2Qwek1QeVoyWlZjSnFpRUZvK01X?=
 =?utf-8?B?bkxSdi8vV3c1OEZKcUJ3bk94c3hPTU1CVjh4emxTRkhIaXovV1lPY3BZc3V3?=
 =?utf-8?B?elFXTStJZm5pYS9SdXl4bEg3VFhzZ2wvV3Ntd1BWOXN6QmdnR0Y5d2F5clNI?=
 =?utf-8?B?MEFDcW1VdWtHbnF5L1RZZVhIN2ZaMlNCd1MzdU56U1IwUkV5VksvKzVBNFZv?=
 =?utf-8?Q?9A7rIhldZhdeFViM0npF+pJgOgrIvnMY?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2pHNGNnc040dHorYkhFOGJDVFdtbWg0QkMyWWlWZ0NwOWZwQ0Z3Y3c5aE1x?=
 =?utf-8?B?MEpZU0lLWlpkUm5ITW9LSWNpOE9wYUxoZ2NlT0RvdE9naVJVSVplRmJCc0h5?=
 =?utf-8?B?MHdxbFZwaUVqZlFMamhRTXdZRjMvdUFwK1RhZ3VvcEViMDg0TWlEelEyNnhq?=
 =?utf-8?B?VUdwTlhPdUhyQTlxc041YmtuMkp2WHFJdDlPTk1hcHphUTc3bnkvcVRTejJa?=
 =?utf-8?B?eE1vZVhnZkg0T01aNGFXZWpCd2RmWHJ5Ykd2VHNuMGpORFg5VXVTQkJIem5y?=
 =?utf-8?B?czV3SGVCb0h1Zk1BSVBEQWdHRXM4VzdUbnE4c1FSVCtrcnhESkpqSWhhdDhp?=
 =?utf-8?B?OUpCa0wwaXh4a0xMNmN6amN1NDFVTzFnaXRBSG1kdXJXaTRIYnhqZVEyaWpu?=
 =?utf-8?B?YkRKamlHUGRXNTgveEJ3U096VUpIWGpnc3ZKS1NObDhuc3ZTU0hBeGNsYVRQ?=
 =?utf-8?B?RXN4czJNUUN5NGF6NjROcU4vbzJGc1ZqYU9Za0JtL05Dd2xaYjlMMlRQQk5t?=
 =?utf-8?B?MEovSG9TdEtlYmxRbzhlN3Nkdjh0TVlWRHdPNTZ0ZUphL1d2Q2p1dlBZa0VB?=
 =?utf-8?B?cGM3V2V4NTR5b1VpOEo4MWNRRkpUd1FkbGlxRFMyUjIzMzcvQXFHajdQdGNz?=
 =?utf-8?B?QVZxYjRiL3Vsa1J2R2ExSnJ2MUhSUHlQUmp0VU1LN3lnSmFPUE0rL2VrWkli?=
 =?utf-8?B?VkY1c2VzZ1d1ZjJScWxLMGRrQWM5QjV1bTNaNmUrdXgwTVh3UEpaUUtZMWNO?=
 =?utf-8?B?dE5GU1R2Q054dUdleXF6T0hqaER2d3RhWk1RNlFIYkZvRXpzY1UrTVpWZ3Ez?=
 =?utf-8?B?QWlOejB4N0ZxRFpNYkZwVGx2N0hydXMrS0hkM0daUTNKU3hsZmthYzNuRDEw?=
 =?utf-8?B?UVNvK1JIUm9VdHErUE9tMmxHbTBqZG1rV1ZYdlhMT29yWU1iYWs5aWpzTmVB?=
 =?utf-8?B?MUpBQ2JyOVhoVWhMbVk0WWY1VUwzSGpBSE1EZ1RFc2xUdUFXN1M3TTNVOHlZ?=
 =?utf-8?B?NlBZU3BUakE0YnpqeStsZGVUNjZUb1NiU2JwYXIwaGd0NlhJUXN6K25odk1I?=
 =?utf-8?B?ZWUvM0lCNjR0MVNTNkFnMnJ2azhrcmdITk4rWG9HQ24xMHdHZG8zVkY3SnRl?=
 =?utf-8?B?TjIwODhaM2s5M0FPSVpDZENuaWM2MjlsdExRcW5pZkNBbERWOTNJS1RyZTV3?=
 =?utf-8?B?SHhnTzVSK1d5WWFmK0lsR2NTWm03SXpXK2h6R1pld2NOdmY0MC9uYTBvMjJE?=
 =?utf-8?B?T2ROMy8wL2ZzbHE0YVVvTFRRR2VUS3JURkt0YUVPcjU3bldZcjlwSTFseGRK?=
 =?utf-8?B?ZER3dElsNXdEZEs4TEpLdjNYLy9pT0plQnc1clFNWTR5bWNRc09ia1VaTEE1?=
 =?utf-8?B?YUVSYXRmTWNLalZQMytvM0F3SXB4clJRb1IxUVVETmJRUUhvVGZqelp4Zm9C?=
 =?utf-8?B?dEtuSjlrMDZwQmUrb3FML2VZTjlIeEJHMmM1WTBEOERaUnFMU2xNVURwQ2gx?=
 =?utf-8?B?YlRaeTRiSzZXcW1WcFR1SUhobWo3S213MDVITlpMc2NJellXQVFad25nTnE3?=
 =?utf-8?B?cHVlcHFkZkRYcnFDVDBXRWR6emdQeStjbVdtb3NvV1NwUHBRcmtZSUwrY2My?=
 =?utf-8?B?dHhYbU5xQ1d2VUQ0VlRSRFRoYXRCb21IRHZiUDkzVzRodGhYZ3hpSi9FZFpV?=
 =?utf-8?B?YU9kQ2JqN0xOT2NwaGlrM3FoTTUvblY1eHh5QnR6S0g5bCtBOUZUVHRSaWR3?=
 =?utf-8?B?c0t1NzNUZVduYVNyL0VYZmI1aEFlelZpdk04RGFWbitQaVd6RUsxRFFiMG9G?=
 =?utf-8?B?N2JNNFZ1ajl4TjN5bndIMDNjNkFJQ21UbE11UmErU1NuNVplUjc1YXdpRjc2?=
 =?utf-8?B?VjV0bjJXcnkyT0FPWlE5VmFiNDRsNW9QbnY0dVRMWHpIbUUvenpoMnlFTVRh?=
 =?utf-8?B?TU5EOVREU3JjeHFOZ0hhOG5OR2w3MGJ4OE5WVFRpWHVjVEkrVXo2ekRLOG9N?=
 =?utf-8?B?dnptV3pIYUY4Y0JjQ1pBcmtjSmsraTJZTWxaQlhyelpqVHZNSzdjQ2Jla1I3?=
 =?utf-8?B?OTdwK0prdDBiMTgrNXh4NU9VTHdOMFJwSGNnZHYxOXpnYjZqd0YyblpnN1pM?=
 =?utf-8?Q?TNGM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 76039d0c-3abd-4b1b-1ac1-08dd662c6483
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 14:51:40.7331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zDdCxn7ONjsumWw1tPeHyX6DNYZuTkmba95lJ6E4SnO2ZWLau7GWI+UmSGj/jhP/ef8D6QZ60qgkdiuwqVJH+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10164

SGkgTWFyYywgTGludXMNCg0KPiBTdWJqZWN0OiBSZTogR1BJTyBUT0RPDQoNClRoYW5rcyBmb3Ig
cXVpY2sgcmVzcG9uc2UuDQoNCj4gDQo+IE9uIFR1ZSwgMTggTWFyIDIwMjUgMTA6MDA6MTYgKzAw
MDAsDQo+IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6DQo+
ID4NCj4gPiBPbiBUdWUsIE1hciAxOCwgMjAyNSBhdCA4OjM44oCvQU0gUGVuZyBGYW4gPHBlbmcu
ZmFuQG54cC5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gPiBCZXNpZGVzIHRoZSBvZl9ncGlvLmgs
IGFueW9uZSB3b3JraW5nIG9uIGltbXV0YWJsZSBpcnFfY2hpcD8NCj4gPg0KPiA+IFRoaXMgd29y
ayB3YXMgaW5pdGlhdGVkIGJ5IE1hcmMgWnluZ2llciBhbmQgaGUgaGFzIHNpbmNlIGhhZCB0bw0K
PiByZXNpZ24NCj4gPiBpcnFjaGlwIG1haW50ZW5hbmNlIHNvIGl0IGxhbmRzIHdpdGggVG9tYXMg
R2xlaXhuZXIgdGhhdCBoYXMgdG9vDQo+IG11Y2gNCj4gPiB0byBkbyAoSSB0aGluayksIGJ1dCBy
ZXN0IGFzc3VyZWQgdGhhdCBoZSB3aWxsIGJlIGdyYXRlZnVsIGlmIHlvdSBwaWNrDQo+ID4gaXQg
dXAsIHNvIGp1c3Qgc2VuZCBwYXRjaGVzLg0KDQpUaGFua3MuIEkgd2lsbCBnaXZlIGEgbG9vayBh
bmQgc2VlIHdoYXQgSSBjb3VsZCBkbyBoZXJlLg0KDQo+IA0KPiBZb3Ugb2YgY291cnNlIHN0aWxs
IGhhdmUgdGhlIG9wdGlvbiB0byBzaW1wbHkgZGVsZXRlIGFueXRoaW5nIHRoYXQgaXMgbm90DQo+
IHlldCBpbW11dGFibGUsIG9yIHJlbW92ZSB0aGUgaXJxX2NoaXAgcGF0Y2hpbmcgc3VwcG9ydC4g
VGhlIGtlcm5lbA0KPiBoYXMgYmVlbiBzY3JlYW1pbmcgZm9yIHRocmVlIHllYXJzIG5vdywgYW5k
IHRoZXNlIGRyaXZlcnMgYXJlIHByZXR0eQ0KPiBtdWNoIHVubWFpbnRhaW5lZC4NCg0KSSB3aWxs
IGRvIG15IGJlc3QgdG8gYWRkIElSUUNISVBfSU1NVVRBQkxFIHN1cHBvcnQNCmZvciByZW1haW5p
bmcgaXJxX2NoaXBzIGNyZWF0ZWQgYnkgZ3BpbyBkcml2ZXJzLg0KDQpSZW1vdmluZyB0aGUgaXJx
X2NoaXBzIGZyb20gdGhlIGdwaW8gZHJpdmVycyB0aGF0IG5vdC1jb252ZXJ0ZWQNCmltbXV0YWJs
ZSBpcnEgY2hpcChpZiB5b3UgbWVhbiB0aGlzKSB3b3VsZCBiZSByZWplY3RlZCwgSSB0aGluay4N
Cg0KVGhhbmtzLA0KUGVuZy4gDQoNCj4gDQo+IE15IGJldCBpcyB0aGF0IG5vYm9keSB3aWxsIG5v
dGljZSwgYW5kIEkgc3VzcGVjdCB0Z2x4IHdpbGwgZ2xhZGx5IHRha2UNCj4gcGF0Y2hlcyBkZWxl
dGluZyB1bm1haW50YWluZWQgY29kZS4gT25jZSB0aGF0J3MgZG9uZSwgeW91IGNhbiBkcm9wDQo+
IHRoZSBpbW11dGFibGUgZmxhZywgd2hpY2ggd29uJ3Qgc2VydmUgYW55IHB1cnBvc2UgYW55bW9y
ZS4NCj4gDQo+IAlNLg0KPiANCj4gLS0NCj4gV2l0aG91dCBkZXZpYXRpb24gZnJvbSB0aGUgbm9y
bSwgcHJvZ3Jlc3MgaXMgbm90IHBvc3NpYmxlLg0K

