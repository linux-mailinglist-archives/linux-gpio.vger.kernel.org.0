Return-Path: <linux-gpio+bounces-35565-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLnAKIRk72mHAwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35565-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 15:28:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C81473639
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 15:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6D4D2301E9C4
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 13:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8EA53CAE70;
	Mon, 27 Apr 2026 13:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="F2OLHMbv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0054.outbound.protection.office365.us [23.103.209.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7E53C6A56
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 13:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777296403; cv=fail; b=GOSfkK8/9MI1RRKQetE/ftwsUELtEN5CkkeUtFPgRv6AUb4TnJrcRAMYcey1WWrClFhA4Y7Qf1FgJ1fv2Qgbq2LnYxdaXiGvS4S/4R0rlQer9/+uuj2NCkCNpyv1egyWJZuTXsnXDtDA+19ffj2YrxKKZwXr9zfu38KYdTQV6gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777296403; c=relaxed/simple;
	bh=/HQusUsuyk+XJPfLmhlHfUq/d1aKCb8Fpud5RtMURho=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VwVRE4LbsmeU70UvQihaZUrb/HOUhUpCRrIKIP67G0MLkOafPKf5tgcu1BSTJq2hGpWs2AlLv3soCJPG2HkfdWLeorMA04nc7DGgAaamTZxf1t4bsxBNSY7g9/FUVQJlt//PFVRZTULTzGy/LJGw4nv5n96tE5DGl6MTEOSQEdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=F2OLHMbv; arc=fail smtp.client-ip=23.103.209.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=zBDrUk2odzEvRvOVeyijiryi4/bOjNWbd1XVMHepg+Lbm18AK/6VNZ2K/ewC1L56aqWyO3kAoXCD2rsaTFm2rrs1EXX5uLVN87FU8Y6ugyBROZuMgZcj4cbrqkwDE4tRlZIrwANhbnfFZBVDibSerSZbV8li6vXWu60DNBTkw/SBw4e0mlSfCmIB/PJu03QSCVcbN+elGCH2mu+pmZr0QgjIdAszDRnoTkLGfkeWGxPdQcwLCqGKCPez1TG0lHer/TPi1fkRTMZ96mEHhfzPChbCdLjK8LbZZ4BiNPe01TWMwpmOOG/4vfpzLj34CZKj0WdglxXxuh0QEACXlL/Vog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HQusUsuyk+XJPfLmhlHfUq/d1aKCb8Fpud5RtMURho=;
 b=zioPcbCaIoCH5EL/VBQV8wPFkRew25tHHpBCmjtfDxF354SS/+UU2y5LnjViSySi5T/tRB+IxqKRq1HbAHOQTiLo/OhnVnGd8ErEimmoLebyHVFgf9Wk7mdVdYFAJWXThPOI8Z00TNWOCJ8oAUC4vmM0o7zJwMH2dhwMGeyRsg/JKQGdr/hGXObIyzP3yWmmt/zeO0O16p704KsLeNa4xWQ5cjDhc2Ae+7idRPXzr7ffqeTfKRYightZ1ax/35Sjs5FKGImnrMzG1SFH0Dp3zzLYtC9G7pBkXEZuG8m1XN+WABmOvix9iORXlPJPw8xbHLZJEH5cBvarT4JwenCAXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HQusUsuyk+XJPfLmhlHfUq/d1aKCb8Fpud5RtMURho=;
 b=F2OLHMbvGd8kNZoOLo4vXBWu2YUmbeJGvRcM9yMAs08squRxj934hbJ5zNlsZkYlUMWDgSFDb4AwZs2q7NdmLSXsIOAnHRziFZShC13qlZIWkiIpCZ0i7RmovbEIO1ZCU/SPE7HM3LoxxtuK/4f6h5GcgmY0vgbU18rK+LKZuVj9xSj8e8La7yqp8F4N5oEjrkzEumQl4q/IO943l9GXe92kT75WL0431IcaNkEhKsKGPYrRVAR5wCki7u8+HZsOZaLWDPI1BNRmGhRZOgjzNvam5uErgVLwi0ewr1kREoSwGnXkRCmbtbQKx1ZUE08jGiseAvkC5u8y3OQ9BeClRA==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by SA1P110MB1438.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:194::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.24; Mon, 27 Apr
 2026 13:26:27 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.20.9846.022; Mon, 27 Apr 2026
 13:26:26 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij
	<linusw@kernel.org>, Kent Gibson <warthog618@gmail.com>, Viresh Kumar
	<viresh.kumar@linaro.org>, Erik Wierich <erik@riscstar.com>
CC: Bartosz Golaszewski <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: RE: [PATCH libgpiod v2] build: replace autotools with meson & ninja
Thread-Topic: [PATCH libgpiod v2] build: replace autotools with meson & ninja
Thread-Index: AQHc1klzyAKjoMFf20qgINBUyH+J7A==
Date: Mon, 27 Apr 2026 13:26:26 +0000
Message-ID:
 <PH1P110MB1603950AADB3F49485223F1D9F36A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260424-meson-build-v2-1-d45fdfb8b7f6@oss.qualcomm.com>
In-Reply-To: <20260424-meson-build-v2-1-d45fdfb8b7f6@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|SA1P110MB1438:EE_
x-ms-office365-filtering-correlation-id: f6a81027-9e6f-4391-39b4-08dea4609592
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|366016|1800799024|38070700021|56012099003|22082099003|18002099003|55112099003;
x-microsoft-antispam-message-info:
 VdakC4fH2sPwcH7fQcODQeVgahufvwHkoUqVGzMC4iDl7CONhxboEljXp43R+M6Kg0dOIor4qIAHGOViFKI1DDznuuvp/8JTaPXz+dIs6VHZ4vxdlNcb7qUP3S2iCik1cnIS0N0icQNFxiA/4mNfYj3qJfvc6JyhWZvikvhv3abeMS2E7cRGYEOpcI2XREzlAtXqY04lOhvMgCTygGR1Dgf4BtxxkcAY3Xwkm6r08z9mvYtF6aUVy23w7d+4zx97DdX4P5sVfIxxzVIxs+paR9oyb8SY+t+hMxjZ6iOxqaZOCFs+Z8MggWh5pjSTKqUQdehv4B52aN+7LqElp7A0sE9bjP8N1lB/SWYn/LVtuFNDj5i3Kgb7HLbMeXQC4Yx8ltlY0ryCSWoQoDZLAjAYGOhtzsjUnspHQzth0kOt9ovcE0UoYfZZMUODaVnbMzLiDxaO8AuO4DTc1InqMx4QPPt5EBJdGhSSWw+w5EFtDXY3mcZlNA7pfiIEGFmwzuUgaEY1t5aV/HS2QKrypTBVqoRJCnt9GhS3L2FqyKu8DZqDkkuQu8Q0IDU2sy7zRgeWx+zsCUUqZ4DMewG0+rZUNvUWDabTWvzEYZEm3Xl9sOFtxyY/t7kc7Gx1yukbM1hHEtju6nib7mWuAextHs+BSD7NShcSuoXqd1zKzy4VbNJntPvom3e5QBVsRQy2epYvVeFoFCo267uFXR6/Zf/CX863KKfTgyMutimZWycZ/r9iljrM+qjrkaOf7Z2zIBvS
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UmxMSTJnL2wrK0dlVGFWOWV3TXJjQ1BFZThiUzgzdURsQjhlYVFBVFMwQjJL?=
 =?utf-8?B?MmpFRGpsMGJ0VGRWb1RYeTM3bE96S3krUVNUdmx1cENCNFRmZTlLVnppREFl?=
 =?utf-8?B?aVBqZEVrK3NSb05aRUVmKzZZREp4bkdKV2UwOWp1eFg0TVJSdmpQdjlRRGIx?=
 =?utf-8?B?cFpmOHNra0wxYWJzM2RXb21kc0pIaWhwMFdUdGxHc1hWakt0Vi9xVGRhZ3dm?=
 =?utf-8?B?amFRRHZyUzdEQmRLZ0JLclVQdHVwcDV4bVRaSjF6WlVPSW5TUDlBdkhPL1M2?=
 =?utf-8?B?Z2lZeExSejJJZHZ3a2VqUGVXWlp5cWxyMko2SEs4eFBtQ1M4U3RoNU1yUXBI?=
 =?utf-8?B?NkdHUmlPTzdyVDFGQjNHRlAyc0JhOU1relhzdk5hQyt2aXA1QlBRUjVXK2Mv?=
 =?utf-8?B?Z09qYTJpM1hPZkZ1TnVkYjNhUmhVSUQ0SVJKNis1NzJKajk1U2NCMllHTjRi?=
 =?utf-8?B?elk3UGVoWjJidnZPUlhHQ3YxWUVQSVQrZElUb1BrcmtlUW80WGd3ZHdlYzdp?=
 =?utf-8?B?amdTVDdlQ0cyUktiWTUzQ0dNY0FkQXBQWjdTMTE4d2ZLVHVRWmpqSUVQdzNt?=
 =?utf-8?B?RkVTeGxxWWErdURPMis0UHF0Ui85MUt0cXkyV1ZzNS85MlFkQ3phR1QxTUE5?=
 =?utf-8?B?czB3NVRVSkVSbFp0Q1luQUZZQ3pNT2Vid3BEcm5qb0EwZHdzazF2NlpBYzVF?=
 =?utf-8?B?cFJwUm9XOVE3NGR0elhPSXBXQ3d0ZmJ1c1VIRElzYUdLTG9DZmVDY3dSQWty?=
 =?utf-8?B?R1dXYTJVb3MrT2drVEhnVXhhMVRjMzZZVDhOSFZCeE9idmxLOEdJOFhDbVNB?=
 =?utf-8?B?S0ZBeE5WckJObVFvRW9ZODJEamdQY0s1YXJrOU5SMWNYZkJJWTVJUkNhSHhB?=
 =?utf-8?B?NGFuVEVQL3FydzRKdjFrRG5acXFlSnZLZjQwL0xKcTViSHY3M29PTzZVYndh?=
 =?utf-8?B?d2lRUlNTVlBNQWc3eGVGQit5V1h2Mk1ONkx3VlczQ2k1QTFQdWgwU1c2Nmtt?=
 =?utf-8?B?d3NoVTBNeVpCM2RmcGlvWUhXU2VGM2FIckE1dkR4NGNMY0NuVFZSeTBBbXJU?=
 =?utf-8?B?dlpiMzUwSm9aeDlCd3JnYlR4WTJ1ZlYzdEZLbDVMS0UxQ3BsSGliVUVBLzJq?=
 =?utf-8?B?ZGlJOW5USG0wdWpOR2pGNTF2UWxOV3V6YUgrYlgzYVZxQWphUVg5NzlYRTNq?=
 =?utf-8?B?ZVg4M1htTFR4MVZJeFMxcldPZ2V0YktoQzhqWTE0L2ozWlNTb25LaW5GV2U5?=
 =?utf-8?B?dm9GZkVzVjZaaE1iS2N4cFFwVXNpYm1qUEhMZHp5bld3OTFzNU1VNytGWG45?=
 =?utf-8?B?T0gvWkR4UldFNFR3cFB0dEJHdG1QWURadGhleDh5OUVtRFAxMlUzRHpLQjkw?=
 =?utf-8?B?UHNoTmt5WWp4Z2VnWXdqT29IUUd4dFhyRDBBNnNvSDFHV2FFbTlhK2FaMlY2?=
 =?utf-8?B?bVVqQlJTTTNXRHJkWlVMYW01enRaZkJHM09ORFVhQXh0b1FpN1FPbm84YThE?=
 =?utf-8?B?em5hUzFQTEFFNHpsSE5TWjVJaUNBRHMxWUxsS2FJbytXWkg5QlNXK0lzdDR1?=
 =?utf-8?B?cDByMEx4eGNSZlgrdHVIL0d2TXJ1Q2hwSmlKVjdGOHFxWFpkTTNjUzh6aUQz?=
 =?utf-8?B?YUR4S1N3UkJRVm1neUNkYVpKYi9LTUdlMHgrVkdoVVBrN3hrc1BCUHpZejZL?=
 =?utf-8?B?bjBQYm5pb2xmdjFOV1FqNThLVTBnbDFqMThEWWlsbC9WaFFpamZCa0tiSXlo?=
 =?utf-8?B?UTNQeTNPcEZmeFRxaThoK2dXZVozWmtBOVlNanRQY0QyM3h5MGZKNytPTlJw?=
 =?utf-8?B?TlJ3MjdzZUVYWEh0TzNIdjBOYU5FTngxNFhmVzlwa3ByUGJwMkhlRURpZm4x?=
 =?utf-8?B?Y1hUTWtCNTlmeVpEQlhjYmRidmxCMEFTWGxteEV6eUtGZCtOVWs1NnBMK1V4?=
 =?utf-8?B?RjdWOW9GTEpNOFpnaXFMbHJDOUdaaTgxYzZiTHhvNHZlZ1o0Q3hjNWk2MVlP?=
 =?utf-8?B?Skc4LzBWd1NqTE9pZ3NlcmtLeUoxdWZyNHI0MUFtaE5jNDZUYUlLWk5XRTJp?=
 =?utf-8?B?RnVCZFVCNmNBWlhLcS84b1M2eWpMQlpVS1RSN21QazRnakMzTmtvVU1RT2RP?=
 =?utf-8?B?Z1pRZFRaUUxOenBKSEg2bGQ5RXduRm13cHU4L3NUOFhOeFVmdVEwUGx2WEVQ?=
 =?utf-8?Q?r50P8xCe7Dutb7UgqUM0LYeHr70ECKLUyfkOg8WjohCv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a81027-9e6f-4391-39b4-08dea4609592
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 13:26:26.6210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB1438
X-Rspamd-Queue-Id: F3C81473639
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[xes-inc.com,none];
	R_DKIM_ALLOW(-0.20)[xes-inc.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35565-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,riscstar.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@xes-inc.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[xes-inc.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,riscstar.com:email,readme.md:url,xes-inc.com:dkim,xes-inc.com:email,linaro.org:email,PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM:mid]

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdz
a2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4NCj4gU2VudDogRnJpZGF5
LCBBcHJpbCAyNCwgMjAyNiA3OjIzIEFNDQo+IFRvOiBMaW51cyBXYWxsZWlqIDxsaW51c3dAa2Vy
bmVsLm9yZz47IFZpbmNlbnQgRmF6aW8gPHZmYXppb0B4ZXMtaW5jLmNvbT47DQo+IEtlbnQgR2li
c29uIDx3YXJ0aG9nNjE4QGdtYWlsLmNvbT47IFZpcmVzaCBLdW1hcg0KPiA8dmlyZXNoLmt1bWFy
QGxpbmFyby5vcmc+OyBFcmlrIFdpZXJpY2ggPGVyaWtAcmlzY3N0YXIuY29tPg0KPiBDYzogQmFy
dG9zeiBHb2xhc3pld3NraSA8YnJnbEBrZXJuZWwub3JnPjsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5l
bC5vcmc7DQo+IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1
YWxjb21tLmNvbT4NCj4gU3ViamVjdDogW0V4dGVybmFsXSAtIFtQQVRDSCBsaWJncGlvZCB2Ml0g
YnVpbGQ6IHJlcGxhY2UgYXV0b3Rvb2xzIHdpdGggbWVzb24NCj4gJiBuaW5qYQ0KPiANCj4gUG9y
dCB0aGUgcHJvamVjdCBmcm9tIGF1dG90b29scyB0byBtZXNvbi4gQWxsIGJ1aWxkIG9wdGlvbnMg
YXJlDQo+IHByZXNlcnZlZCB3aXRoIHRoZSBzYW1lIHNlbWFudGljcy4NCj4gDQo+IFRoZSBnb2Fs
IG9mIHRoaXMgY2hhbmdlIGlzIHRvIHByb2R1Y2UgdGhlIHNhbWUgc2V0IG9mIGZpbGVzIGFzIHRo
ZQ0KPiBjdXJyZW50IGF1dG90b29scyBhcHByb2FjaDogbGlicmFyaWVzIHdpdGggY29ycmVjdCBT
T05BTUUvdmVyc2lvbiwNCj4gaGVhZGVycywgcGtnLWNvbmZpZyBmaWxlcywgR09iamVjdCBpbnRy
b3NwZWN0aW9uIGRhdGEsIFB5dGhvbiBleHRlbnNpb24NCj4gbW9kdWxlcywgRC1CdXMgaW50ZXJm
YWNlIGFuZCBjb25maWd1cmF0aW9uIGZpbGVzLiBUaGlzIGlzIGRvbmUgdG8gZW5hYmxlDQo+IGEg
b25lLWxpbmVyIHRlc3QgY29tbWFuZCBydW5uaW5nIGFsbCBhdmFpbGFibGUgdGVzdCBzdWl0ZXMu
DQo+IA0KDQpJIGVuYWJsZWQgdGVzdHMgYW5kIHRoZSBweXRob24gYmluZGluZ3MgZXhwbGljaXRs
eSwgYnV0IGRidXMgZ2V0cyBidWlsdCBkZXNwaXRlIGxpYnJhcmllcyBiZWluZyB1bmF2YWlsYWJs
ZS4gQXMgcGFydCBvZiB0aGF0LCBteSBidWlsZCBmYWlsZWQ6DQoNCm1vbi5jLm8gLU1GIGRidXMv
bWFuYWdlci9ncGlvLW1hbmFnZXIucC9kYWVtb24uYy5vLmQgLW8gZGJ1cy9tYW5hZ2VyL2dwaW8t
bWFuYWdlci5wL2RhZW1vbi5jLm8gLWMgLi4vZGJ1cy9tYW5hZ2VyL2RhZW1vbi5jDQouLi9kYnVz
L21hbmFnZXIvZGFlbW9uLmM6NjoxMDogZmF0YWwgZXJyb3I6IGd1ZGV2L2d1ZGV2Lmg6IE5vIHN1
Y2ggZmlsZSBvciBkaXJlY3RvcnkNCiAgICA2IHwgI2luY2x1ZGUgPGd1ZGV2L2d1ZGV2Lmg+DQog
ICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fg0KDQpJIGhhdmVuJ3QgaGFkIHRpbWUgdG8g
ZGVidWcgdGhpcyBidXQgbWlnaHQgYmUgZHVlIHRvIG9wdGlvbnMgYmVpbmcgYGF1dG9gIGFuZCB1
c2luZyBgYWxsb3dlZGAgdnMgYGZvdW5kYC4NCg0KDQpBbmQgb25lIG1pbm9yIG5pdDoNCg0KVGhl
IFB5dGhvbiBiaW5kaW5ncyBSRUFETUUubWQgY2FsbHMgb3V0IHRoZSBjb21tYW5kIHRvIHJ1biB0
aGUgdGVzdHMgWzBdIGJ1dCB0aGlzIHBhdGNoIGRvZXNuJ3QgdXBkYXRlIHRoZSBwb3N0LW1pZ3Jh
dGlvbiBkaXJlY3Rpb25zLg0KDQpbMF06IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aWJzL2xpYmdwaW9kL2xpYmdwaW9kLmdpdC90cmVlL2JpbmRpbmdzL3B5dGhvbi9SRUFETUUubWQj
bjExMA0KDQotVmluY2VudA0K

