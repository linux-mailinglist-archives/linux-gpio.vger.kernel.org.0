Return-Path: <linux-gpio+bounces-12264-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4349B3A8B
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 20:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0642C1F22140
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 19:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3562E149E00;
	Mon, 28 Oct 2024 19:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="E3R/+RHM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2050.outbound.protection.outlook.com [40.107.105.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A56B1422AB
	for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 19:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730144140; cv=fail; b=OPQwTZsoHQJyrPCTFDFP4gSalaZCxn28b5ilyQ3EtoczEqQmsv7DqJVZUsjjxY5UQD0rt8fClzCG+bT+G/CBb8Hr9FJEZKP/1m9VqoKqBol7MNGt0GWRVe+i79X0tTSf4EifVv6RNExD+SRpstMqkWuuLYlggtSnvz7oKNC0IL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730144140; c=relaxed/simple;
	bh=+psrGr9IGDq5n6aOBVipPQmaAAdS0DHQYgeis6Gksno=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iV8zJ/lLIL4p2cBFpSSNTuLOQR+ILnoxzEBWSSle3BUNZOtvnBPtUPDVRdfWb4fM6r5kWe7r/SxjMiI5gBcJsWIDfsONca2rC79D+zppGlbS3jSkrWeafMmdPb9weHVFjwAF3ZfHCFio6kQdVVZ/lE0sPX1zaAwyYSKesSd3io4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=E3R/+RHM; arc=fail smtp.client-ip=40.107.105.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwNjpL3GKnN4wBzE+YI+8gGHG+/exixQYdv4MwNyAzWui0qNGN5NkXkIrE4st6Fm8iIWBprVs4b9heXXksTp8zSh/Ar6xBD+ZG4Obk5s291LrU4uZCOu0WudQvEcLzZd8Ul3aYcL/wEBXYlc4Zfp1G7js/WQgNoJd75gZ53eUo2S7hdmS7w7lKwaEUqd18VoWRZpnZRck3LzNupVGRWlq51J0JG9PqZwZLHlj9uqSDGOfTVV4sDs0H0fT0lZpq6GoyQi2CtkUhk+jRXrO1lSKvoM6Qp6zn3CKMwTMGDWVMvC6cxxUL270TuiwACZNOiTxlM3oCzBp/f7eQAX433Hog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+psrGr9IGDq5n6aOBVipPQmaAAdS0DHQYgeis6Gksno=;
 b=aaH4uJZ/B1CKnlcAzvuH4XRulJ8+fXZssQvWQN1LGkZUf7R8OiETa5Q1rWEQS7CDmKBjeonFmS36tXUA6+caHTdXJs+oMvgPDAiJ8Sb0TFOb6LFkT0HHZQIy1cK4b/UsCG6DHRyB9FqXrPyEjGvntdzRvcyHd7brYyF4itDTbZ/TFRRVxYsYWoKiCKGqXAtKEK1J+u7kxKy1vCfZ5Qje5sM81IM6unZpkvb2gX4mjNHi2bUJevuGmPcCAz/TTWQbXQdXQIKiu2CrnKSjn/7u/jKpbg11EsS/bHOKkEe7fRYkDNyt1VBpE/2teYrvlzS4dTaOE53laNGk+1Sic7awxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+psrGr9IGDq5n6aOBVipPQmaAAdS0DHQYgeis6Gksno=;
 b=E3R/+RHM9pSZJW4uthjF/pnKOVnbHl2NoWKpwdhetQ1Cl8wjeV6caI68a+RwJJDLGqREHVcaVifRoQfOhEVUO7M3owh8yy6fqPbZ7wYHv/94opUO8E6D+gtwQi7GXk59rq/64zmEP1U+bHIzaaqvZMriWIogjFlF6hMcAGC1kZH7AZMHXspIAapOy+Pay7PqD2IixscRcXPca48+EhvJmpxExAELj/kQBi6sMHCQ15GGYd7Ctt1Ro0YsITrvgh+qwwn63/zgWGbFOJtPmGSt0QHTKMbzqT3YUpY5mv9Hgsp42pJjS3tJWe3weFIeBFgqwxQVlrQbJhmdmyN0s+Bwgg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DB9PR10MB8094.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4ef::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.11; Mon, 28 Oct
 2024 19:35:34 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8114.011; Mon, 28 Oct 2024
 19:35:34 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "brgl@bgdev.pl"
	<brgl@bgdev.pl>
Subject: Re: [PATCH libgpiod v5 4/4] dbus: add the D-Bus daemon, command-line
 client and tests
Thread-Topic: [PATCH libgpiod v5 4/4] dbus: add the D-Bus daemon, command-line
 client and tests
Thread-Index: AQHa7JDPFNYqQ01NbE201CZYmrX5dbKcm4GAgABmOgCAAAY/gA==
Date: Mon, 28 Oct 2024 19:35:34 +0000
Message-ID: <0efb4b35cdcc28298609a72eb8f856f8887334e7.camel@siemens.com>
References: <20240812-dbus-v5-0-ead288509217@linaro.org>
	 <20240812-dbus-v5-4-ead288509217@linaro.org>
	 <93c9d617df7cc3f6814a56d07d90aa3f98e352f6.camel@siemens.com>
	 <CACMJSetD8JeP+5AV9tcGXPVQQaUO=e3bG6ZNVd82kdREOqXUJw@mail.gmail.com>
In-Reply-To:
 <CACMJSetD8JeP+5AV9tcGXPVQQaUO=e3bG6ZNVd82kdREOqXUJw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DB9PR10MB8094:EE_
x-ms-office365-filtering-correlation-id: f888392e-c34c-40f2-591f-08dcf787b106
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bzZaaXMxN1ZZdXE2S01JT0YycVFEb0JzZG5RTjdBV1JxTnpmUkp6YmhCNGlO?=
 =?utf-8?B?ZXZJK05xNXZKZm5PSEZrQ2JhQnhtN25iSVg0TkFNVFJvU2RyR3NXZ2h3K0Vu?=
 =?utf-8?B?eVZtWEVhWEZPR0UwWmo4RnRFUHF2VEZCbkNtYnZudnhrY3R5RTlUVURIVkZV?=
 =?utf-8?B?MlE2ZW1Hd3pyM2dBUUoybE9wVE9adEtNZmNjQ3huTmorbEkzT1h1b1B0OTlS?=
 =?utf-8?B?elp2RkFGd0JKZnJRNk5OTlJDYkZIeHI2T2owOGxBSW5Ua2c1YjR3YTkrR0Nk?=
 =?utf-8?B?RytWNGlCd1hwaG94MHllenRpamtMSFJnQ2NleVVadzBpemsyc1VSeUdicE5M?=
 =?utf-8?B?dEFhYkd3VXdhcksrektKb1ZFajdXYjBkbmxHTGxTbWdjNkxPanBWTkc2M08r?=
 =?utf-8?B?RTZCSWNrcER6M3k0ZEFINlBBS05qYmRKS2l3QmZRVDB1S3BQc0QweGs3OEln?=
 =?utf-8?B?d0FZRkN2dnhzdkNqV2FkNS81cWFFayszKzFuNFJGNkZQU2p0TlRiZzd4cWwv?=
 =?utf-8?B?ZG9SUHY1eDlKWlBtd1piam14NHk4d2lmaWVYWktrSGdLdkdDUE5HVmFHWUVD?=
 =?utf-8?B?b2RpRkpZYTZqVjBpWjRwMnl6ckU4RnpGOHZUeDdDNklqclJjOFptMjE3MEZx?=
 =?utf-8?B?S3NnSURtRHV4dXVDVG1FZ293RXZaVnFsZTNkSVFHcW0zOGRDR1NqNXQ1am9m?=
 =?utf-8?B?M1VKaktLMm5yYUI5NVlYVWZqYk9lZXNYa01rQjJyeXFhanJFNmE0dVhudVpn?=
 =?utf-8?B?a1d2YkE4RDNZOUFYMGNzcDRRWW9Zdjc3RkFqZUFXL01WSjE5cWV2VHN0ZTlM?=
 =?utf-8?B?VlpMbTFqVUV5MWs2bDFCRWJ5VmswUmV4S3hZb29vWTVwMzk5V0xEMEwxWTIx?=
 =?utf-8?B?eTAvVHV5SWY3Wmo2dVZ6bE12dUZqSDlkQUdRY1Z6YVk5dlp0eE84WjBQL3Mw?=
 =?utf-8?B?elFLYnU3VWhSSW5JcnZVdzZaQ2hJWi8xTG1tNE93dHArOEVRUU5BbmZKNGZO?=
 =?utf-8?B?V0lMbTF3QTJxWndoM0pwa1BBTWNQeFJxS016QkZNZmQ3NjZjR2FySWFvQkRP?=
 =?utf-8?B?US9LTW9vR0hVYzVzcGlMZUtBNVNTQ2l6YWlKZlZCODZKUXIxMnk4S25vQXBu?=
 =?utf-8?B?ckhiTVJhWGpudG0zYjF4dER3RmhPSlc1bE10NkNlODl6ZGU0aWFPazdoR1kx?=
 =?utf-8?B?dTNXbzl0WDhpUSt5VWR6YmR4UDIrRjQzd2tvNmMrcTFIelpZamp5dEVEeWo5?=
 =?utf-8?B?WVl2cWh0c25YS051OUdwNHRwT0lRVzNKbzdaTHVMSFdGak1WRG9oVXk2REdz?=
 =?utf-8?B?ZDRiOCtQRlIwSkRVdDRUUDR1RlIrMFc3aVFQK3dXV2IzQ0wxQ2dGbTFMWDN6?=
 =?utf-8?B?bDBJVnFzckJENktObUN4YmJBZlNKSWk2ckp5b3FsNlNPTmhaY1VXYlhhTnlM?=
 =?utf-8?B?c3F1cmxGM2k4YU5yWmtHYlI1QjBEQlYydGloWjJuTTNaNDg0Rm1DaTl1dlN4?=
 =?utf-8?B?THNXaVZmelBVNlhsSFlYR2dKdTAxVVZwaHRqclRaaXJvQXY3eTV1dFp1dExp?=
 =?utf-8?B?QktWVFlXVW5jNHVvdi92OVZDOWo2WXpuRkNPby9IWGxpWUlqV25VbnFlcVZY?=
 =?utf-8?B?bm9iV0NYekhybll4MVhTWjdqN2JaaUpnbWhiWUtmS2ttZnliYXROdkdQM2FG?=
 =?utf-8?B?SDhKUHUxUGRMek1Ld1pjdzdTMEZFRncwdTJPZko5b3ZRd2NEZUJZSnFOdlp6?=
 =?utf-8?Q?KfHrM6PzM5i3gAbgw7Cn5O8urzbLhBzUMVhjY1a?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0tOaGtqYUJ6c1ZyTXgwV1A1TzR4WldERzg0YTBaanQzZjZWUk55cHBMRjJN?=
 =?utf-8?B?TjBQbHFSYkh0YjdpeDhTdk5UL3lxMWxhcEVIMkNQcU9NSHl0cDFJVDF0V0p2?=
 =?utf-8?B?U3g0QitVVjdHZllBV3VlbGEyYzZrSmZZQWhqcWh1UElJeDVLSmhWOEI5NVpZ?=
 =?utf-8?B?Sy9jUU5VMWtqMkkyMldrQzM0RmZTSnBWR2hnRVJUaktWL0Y4bkFGdWtwMG9C?=
 =?utf-8?B?VmVlMStlR2ZYZi9tQkVSNUJJS0JTQXVTUHJRcEFxWTR3ckk1Z1lDenhLOEVQ?=
 =?utf-8?B?aDJNWkFwS0ZNY2lsZUk3aDVWdHRrcUk5RitrYXFUZnYzclVuQlZoWjJDenF4?=
 =?utf-8?B?YXYyS1g5V3FEQmwzV0EzM3F2Rno2VmF3MHR2WW5EYytSTmVQLzJ5aWZ6Tml0?=
 =?utf-8?B?dFJLVWRROGpuVGVWZG1hMCtMS0ljNmQ5WkR5L3p4Ty92V3VYcDU5ZmN6YzRJ?=
 =?utf-8?B?ckpIQzZYQjkxamFTbnBMbUo0aDV0NHVIdjZ5ZnE5aXpSYitlUXh4R0ZsT2NC?=
 =?utf-8?B?MXpaejhTeXI3Rk9Ba3h2NTRjaFlkVWM5RmVxbStIYksyc0FydW5OMEFzcnMz?=
 =?utf-8?B?R1U3UmVENXl0NEc1M3U4RDh4NXpDYmtjeEJBY2IwWEtjc0FUTUNhN29uQ2xJ?=
 =?utf-8?B?ZVF4L05uN3QveGlBcUQ2S1ljenJYWXdvWTZpYzdXRkVhelV5bE1NemUyOW5t?=
 =?utf-8?B?WERSMTRiR2hKUXg4MDh5MTQwVlplc2dCTjdIQnZwZ2dxNEJGM0hMWis2T2Jl?=
 =?utf-8?B?NklUK3Y1WlpYV3ZlWnZGZzZSR3V1WG81QzNUUnBwbmhkY0tOTTh1VjBmUkFj?=
 =?utf-8?B?R3A4YXdQaG9tUUg4MjVNZ25RaXdnZG9iczNuUUF2R0JEMWQ1d3lCeG4zbTJn?=
 =?utf-8?B?ZDVOcHUzaS9GTWszSFVCaGZnK2Q0djA1cU1BYTFaaXJyZE43MWRCYVlmYXU2?=
 =?utf-8?B?ejVLbjIvSUxVTzVmcTd4OVc0cWhkaUlPMU1TUzVMUzQweFhoSm5RMHovTElP?=
 =?utf-8?B?ZDcwM01LRzZsN2lwem0rUFBuWklGY1dla3d1bTNSQSszam5VVXZkK3Q2eVlp?=
 =?utf-8?B?R1c3WmpsYjNuS3lINGplT05laENYQmkyTnVMbE5rWCtraElORDFNUTc0UTFM?=
 =?utf-8?B?RW1JbVJLWUVveXd1ejdLL29vNlhHeGxrVDdOWTR6L1RVcnZyVzkvQTc3SjdB?=
 =?utf-8?B?Q01NNHdCays5dWluYUQyOExXM3dWTHBvKzdoRW1xMCtWSWNsNUJlT2NWUVY1?=
 =?utf-8?B?TmxuS3FReDQwa0FSOVVpV1M5SlZzLzIyZXYxNG9CeUYyNk5xYXFHVUwwcDVl?=
 =?utf-8?B?MmlybzNuWXM5dGYzZ2RNYUJCZmRIamIzbzUrQ0tuOTBqNndyNkFZbkhaYmtK?=
 =?utf-8?B?a0NMOWlJZ3NCWDhjOHRqMjdtNW9ZTUY2WFladjNDeUhpWitjdUphenlheGNx?=
 =?utf-8?B?RkttY2xJUWZZYUNjUlc2OFBTOGxPSlRoL0FxYjFBbGVIcEVEa3IwaTNBeFdN?=
 =?utf-8?B?bjQxNW5NeURaUTAyTzdralUybzhJalFQUUpSbHZ0Nk0yTVpZUENwdkVxOVgz?=
 =?utf-8?B?YWlBNldxeVF3YlNONmhqbmZmMG92YXZ3L2gwdnk3N0RRZkVQZ0F4M2NhZXI2?=
 =?utf-8?B?Qk9wOWYxYnhneCtvck96VWlGZlRyMVFsR05SK3pSdE91c1VkSXFyWW5XZDFL?=
 =?utf-8?B?VU1BNmRhZ0FSZU9HbjVDaTVRampleFZseFhDS2FQb1QzK3UzN1JUUUVYUmdR?=
 =?utf-8?B?Qms1SzM4aFdSRWxzdUdiNUZjK3plTzM1TXNPQXhoSC9iZllndUlxSHpCNkVq?=
 =?utf-8?B?S3dDRzVyUlAySXlnTEFlb2Q3eGpvVk1FWE1vekdHMmpkUitFOE01TWFoZGl4?=
 =?utf-8?B?MzBBbm5HaHNrV2ZVRUtSc2dCVFd1WS9ZcFBGVXIwaHdnZzhXOU91R2ZpS0px?=
 =?utf-8?B?eXFBdHdGdUFxTzRBZUszNWdvNUt4ejZJWU1ycW1zTWFaYjdYY21wVHhHRkgz?=
 =?utf-8?B?c0dNdXg4VVVFelIwWHNwSGRjTGFKOFJNTk5JQjFmU3ZLYWJEdTZhMnVxRXd1?=
 =?utf-8?B?a2gvb0RQbjVJWUJRSW1mamtWQU9lQzhSUERmUlNpZU1wcHZkVGdleU83RXdZ?=
 =?utf-8?B?ckYrdXBzeEg2VCtKVTFlYjduc2VObWtDcWJrNE5FR3M0Rm9BTmhMaTkxSzRk?=
 =?utf-8?Q?3IHzK8XY3rlmq3qEO5e5irs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <875358482D8372469656601EE38ED633@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f888392e-c34c-40f2-591f-08dcf787b106
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 19:35:34.1802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NdRcqEtZ7LGHACd0zij3hkb2/JpezwJri0t6KEK/hx5bEa2R9SToyLXqOw9SdL7kfhtXxQBlVRm5mQxAwan3mTj0cXqKm8ytDhs9T9SObXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8094

SGkgQmFydG9zeiENCg0KT24gTW9uLCAyMDI0LTEwLTI4IGF0IDIwOjEzICswMTAwLCBCYXJ0b3N6
IEdvbGFzemV3c2tpIHdyb3RlOg0KPiA+IFN0cmFuZ2UsIEknZCBleHBlY3QgZnJvbSB0aGlzIGNv
ZGUgdG8gZGV0ZWN0IHByZS1leGlzdGluZyBjaGlwcyBpbW1lZGlhdGVseSwNCj4gPiBidXQgdGhp
cyBpcyBub3Qgd2hhdCBJIG9ic2VydmUgaW4gcHJhY3RpY2U6DQo+ID4gDQo+ID4gJCBncGlvY2xp
IGluZm8gLS1jaGlwPWdwaW9jaGlwMCB8IGhlYWQgLW4gMQ0KPiA+IGdwaW9jaGlwMCAtIDI0IGxp
bmVzOg0KPiA+ICQgZ3Bpb2NsaSB3YWl0IC0tY2hpcD1ncGlvY2hpcDAgLS10aW1lb3V0PTENCj4g
PiBncGlvY2xpIHdhaXQ6IHdhaXQgdGltZWQgb3V0IQ0KPiA+IA0KPiA+ICh3aXRob3V0IHRpbWVv
dXQgaXQgd291bGQgd2FpdCBlbmRsZXNzbHkpDQo+ID4gDQo+ID4gVGhpcyBpcyBub3QgZXhwZWN0
ZWQsIHJpZ2h0LCBvdGhlcndpc2UgaXQgd291bGQgYmUgY291bnRlci1pbnR1aXRpdmUgYW5kIHJh
Y3k/DQo+ID4gDQo+IA0KPiBncGlvY2hpcDAgaGVyZSBpcyB0aGUgZGV2aWNlIG5hbWUuIEl0J3Mg
ZHluYW1pYyBzbyB5b3UgY2Fubm90IHVzZSBpdA0KPiB3aXRoIGdwaW9jbGkgd2FpdCBhcyB5b3Ug
Y2Fubm90IGtub3cgaXQgaW4gYWR2YW5jZS4gWW91IG5lZWQgdG8gdXNlDQo+IHRoZSBsYWJlbCBv
ZiB0aGUgY2hpcCBpbnN0ZWFkLg0KPiANCj4gSU9XIGl0J3MgYSBmZWF0dXJlLiA6KQ0KDQpUaGFu
a3MgZm9yIHRoZSBxdWljayByZXBseSENCk15IGJhZCEgSW5kZWVkIGl0IHdvcmtzIGFzIGludGVu
ZGVkIHdpdGggbGFiZWxzIQ0KDQpJIHRoaW5rIEkndmUgZm91bmQgc29tZXRoaW5nIGVsc2UsIGJ1
dCBJIGRpZG4ndCBoYXZlIHRpbWUgdG8gbG9vayBpbnRvIGl0IGRlZXBlcjoNCg0KJCBncGlvY2xp
IGluZm8gUE9MQV9SUzQ4NV8yDQpncGlvY2hpcDAgICAyOgkiUE9MQV9SUzQ4NV8yIgkJW3VzZWQs
Y29uc3VtZXI9ImdwaW8tbWFuYWdlciIsbWFuYWdlZD0icmVxdWVzdDE0IixvdXRwdXQscHVzaC1w
dWxsXQ0KJCBncGlvY2xpIHJlY29uZmlndXJlIC0taW5wdXQgLS1ib3RoLWVkZ2VzIHJlcXVlc3Qx
NA0KZ3Bpb2NsaSByZWNvbmZpZ3VyZTogRmFpbGVkIHRvIHJlY29uZmlndXJlIGxpbmVzOiBHREJ1
cy5FcnJvcjppby5ncGlvZDEuUmVjb25maWd1cmVGYWlsZWQ6IGZhaWxlZCB0byByZWNvbmZpZ3Vy
ZSBsaW5lczogTm8gc3VjaCBkZXZpY2Ugb3IgYWRkcmVzcw0KJCBncGlvY2xpIHJlY29uZmlndXJl
IC0taW5wdXQgcmVxdWVzdDE0DQokIGdwaW9jbGkgcmVjb25maWd1cmUgLS1pbnB1dCAtLWJvdGgt
ZWRnZXMgcmVxdWVzdDE0DQpncGlvY2xpIHJlY29uZmlndXJlOiBGYWlsZWQgdG8gcmVjb25maWd1
cmUgbGluZXM6IEdEQnVzLkVycm9yOmlvLmdwaW9kMS5SZWNvbmZpZ3VyZUZhaWxlZDogZmFpbGVk
IHRvIHJlY29uZmlndXJlIGxpbmVzOiBObyBzdWNoIGRldmljZSBvciBhZGRyZXNzDQoNCmpvdXJu
YWw6DQpncGlvLW1hbmFnZXJbMzA0M106IGZhaWxlZCB0byByZWNvbmZpZ3VyZSBHUElPIGxpbmVz
IG9uIHJlcXVlc3QgJy9pby9ncGlvZDEvcmVxdWVzdHMvcmVxdWVzdDE0JzogZmFpbGVkIHRvIHJl
Y29uZmlndXJlIGxpbmVzOiBObyBzdWNoIGRldmljZSBvciBhZGRyZXNzDQoNCiQgZ3Bpb2NsaSBp
bmZvIFBPTEFfUlM0ODVfMg0KZ3Bpb2NoaXAwICAgMjoJIlBPTEFfUlM0ODVfMiIJCVt1c2VkLGNv
bnN1bWVyPSJncGlvLW1hbmFnZXIiLG1hbmFnZWQ9InJlcXVlc3QxNCIsaW5wdXRdDQoNCkZvciBt
ZSBpdCBoYXBwZW5zIHdpdGggYWxsIEdQSU9zIEkndmUgdHJpZWQsIEkgY2FuIHJlY29uZmlndXJl
IG91dHB1dCB0byBpbnB1dCwNCmJ1dCBub3Qgc2V0IGVkZ2UtZGV0ZWN0aW9uLCBuZWl0aGVyIHNp
bXVsdGFuZW91c2x5LCBub3IgYWZ0ZXIgb3V0cHV0LT5pbnB1dCBjb25maWd1cmF0aW9uLg0KSG93
ZXZlciBJIGRvbid0IGhhdmUgYW55IHByb2JsZW1zIHRvIGNvbmZpZ3VyZSBlZGdlLWRldGVjdGlv
biBpZiBJIGRvICJncGlvY2xpIHJlcXVlc3QiLg0KDQpKdXN0IGZvciB0aGUgY2FzZSBpdCByaW5n
cyBhbnkgYmVsbHMsIG90aGVyd2lzZSBJJ2xsIGxvb2sgaW50byBpdCBpbiB0aGUgY29taW5nIGRh
eXMuLi4gDQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cuc2llbWVu
cy5jb20NCg==

