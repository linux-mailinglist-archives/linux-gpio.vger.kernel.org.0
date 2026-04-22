Return-Path: <linux-gpio+bounces-35360-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDIYNIvm6GkHRQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35360-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 17:17:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B3D447C32
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 17:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FBBD306970A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 15:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFEE33C188;
	Wed, 22 Apr 2026 15:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="dDTCxW9n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0042.outbound.protection.office365.us [23.103.209.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71124337110
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 15:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776870966; cv=fail; b=MAbrGOWl1l9ghOZt+MqQriYwuVQXlnLbI4GYQBX3Q0ySWIOdSHVzCjPCEuQSA/qSszjN3hvwD+y7LrT92XeGivafUt/qAkvHBjuvabpZjrX6oL0elbqdtLDWHukO27H7+/SFNzOd9nh+RQqxceq6zOUOyN7FUo2p4jzDVdS/Vgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776870966; c=relaxed/simple;
	bh=g7BXb3CQpNHBMIuNmFht5MJYm3HXFLIZDxrBGy+v2ZE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aQ2xRfClXLHZxsIoFzBTMpaLNeiG02XhjjUh9017i3n+I09u92EKxbGOp98wZEghp9HTmzDovPHYuZqlfCz5quh4lfBeQ5myfcFVL/YntI56EKOKlevJOgII6KEn6sMlBWcMJQOG8zmoBIEOfkx8AMYyPrmd1/g8T/XAA7m1qNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=dDTCxW9n; arc=fail smtp.client-ip=23.103.209.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=iEUmvwMFDLyWkURXa586+SYhdJadiFlzaZmBm6fCdWlbcSXGsf6nIHyPVQIV4XrR1uNoz43Uy7iKSDMw8hM3HtmJU8Tkjby6WDdZnv4Y+r4X/n8AT1LHLSnUuPhT2WFTFTz/prh7RT5QroHSZC42g0ISyQ+8uh6uAAzFVjYVsA0ONBMnE362lRuHQ2TgPHYRo2wecKs6P2Y55Wm1T0AulLi1GgB5+cFk6cu9hv0HG/JJjAK8mfvjO1KmTW/wViAhnZuy2CZaOARC/Tqgv7YeUy4RwIDbpIvDzwkaC5DhQZpeXKeEqC4Im+B9Ia+c1hpfaacsCSFvcRZL7nrAtklRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7BXb3CQpNHBMIuNmFht5MJYm3HXFLIZDxrBGy+v2ZE=;
 b=KiKUevJlWW1SgRQKGn+oeCw7ym631pIufu9rpLypAmATriggFs23Rw+sXKOc9Slf2I0+Kj2jPC/wUOTbrF7iF1Cnq2dSmbWZ/L2bgKuyFkgTBhOTvJ6Zm451r+DIAqEUHJOC8N6btvxErICXtLLNYUU0mmw4dEG19OxwzL9/Rth4Fb7251wp0O3/4BEfbH8XfjDld7Gte91agxQGLVyZPbO+LKepQ0l5g70VoZBjUdXjTwPjfbJRlh7DlX6fqT372zaC9Zm9A46gHnH3TxlN+3v+QCjdVGW4I6Wj5Dvcd+XtxeurYSl3bcsv3Hvb0o0o3hPYiMGc1R8rRuKU/ephmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7BXb3CQpNHBMIuNmFht5MJYm3HXFLIZDxrBGy+v2ZE=;
 b=dDTCxW9ni8U4HCZLO4FinC67y5/F/tLPp86tlHdwy7AQyLICZFCRREiy597gPXtQklpf/soAMa5z1bSS4sHyZpd6hxmAjrlu0yGjNl3Go07fMalMcRm73MKqCnVtxlTDVMDtSljW2KcG5tW632qqo7V7rgz4/GbgkjntfJGbQ3BEJUJucbXeiODPshERrYlxSztA0T6DYhk9pGh9IdhD/cG5QdtkrtYIGA0qC9eTOsqJ5bDbT1VaHB86pIM9m42bbQANJmuRzQuV64qS4DECARmw1960EQzxOr9N6aIlw5IxoeBVxk6YffPpUa/C9laONYRf7S/74thcz42uQu8DjQ==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN0P110MB1077.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.55; Wed, 22 Apr
 2026 12:42:16 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.20.9769.053; Wed, 22 Apr 2026
 12:42:16 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij
	<linusw@kernel.org>, Kent Gibson <warthog618@gmail.com>, Viresh Kumar
	<viresh.kumar@linaro.org>, Erik Wierich <erik@riscstar.com>
CC: Bartosz Golaszewski <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: RE: [PATCH libgpiod] build: replace autotools with meson & ninja
Thread-Topic: [PATCH libgpiod] build: replace autotools with meson & ninja
Thread-Index: AQHc0lVzVxblHjwTDEupiv1mdwVKFg==
Date: Wed, 22 Apr 2026 12:42:16 +0000
Message-ID:
 <PH1P110MB1603A69C8E52B65F2164B4109F2DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260422-meson-build-v1-1-a63a7a8b0d2f@oss.qualcomm.com>
In-Reply-To: <20260422-meson-build-v1-1-a63a7a8b0d2f@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN0P110MB1077:EE_
x-ms-office365-filtering-correlation-id: 5b7ccaf6-367e-4f85-72d8-08dea06c95df
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|41320700013|38070700021|22082099003|56012099003|18002099003|55112099003;
x-microsoft-antispam-message-info:
 5zrKCRvpGzeb4GGxB6ZwVmxU85AClAoAy+tT5lQUcTD858sscWfa7tRccVt49KElDv5vj1EGTmZ9P8qyaviBOwvCRVR6xarzMUZ6XOsdQcxaW0mrGaOvE1z1EfqCJDSy1LweAJjtY4nAb8qZiN9qpenrFO7cnh+wPXzqTpmaya/3XGkJ39DmWfF26cJU5n2N6797K7lkHVVb/z+ytq7ZmDAWdLUthmHX1u95HZCHS6LPEqtdFfkkOxjB0swR0ALc9GfQdfmRBNePQ7HA3Vb+QqJ+m3T0vluCJ4CEeNAE26KnWBmzsQm62m0/NObn+cV/uFU+b8wq5jT3xhzeTHWokjeMkMw+NbQ5S4x6+sdpSyAa35M860FEG0L6CuE6Nd8gC322I65FqSBMnYwAgybJzBA/BwPTAoWZQSBEmZ7tVShWxKs/FuZe4ZYL41jNMtEMcqjx9lzeMLg5WAthgLwbo8t8eez0YISCam5fyNhQvC7WK3QBi1uO/T2RxB22y7Uhv7Eu+n/jiT3lpEDEsStMYi/FyQXBdsdDxWySTJErBbIj1k8AYxMG6SmgfcBiNChs9lSG+3Y6YTaweTU0WRLznDf92nzmnwe/O2XB8R+QkxeOgBQVrN97TFA+XbtVDOBeSSb9fZYsjrgfX+upZauoryjJqeWWaSGB5nc0i/Z7NBUk+OstsxAcaOjhuc7+4eojR0ZdI0Ael5lwdEWxPSYnoU0ceIp+DmkW0cqhWsHNLQytLEdzn/uHviUdLG5Xytdv2sX60b5aUzjdWJK9PXiqn+hiBCXhMlZrSHfg8QbXzRE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(38070700021)(22082099003)(56012099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aTdYT2hCeEpGUm9vajNVdUZEWDRJeTBFa3hza3lJcytLamdsbDBDSVo1R21B?=
 =?utf-8?B?aGRLbG1rK3A4REYxeG9EdW1Mb281WTU1ZG1oMXNhLzhEdEFLaGU2ckEyUVgw?=
 =?utf-8?B?QUdzUWUxWHcxVzZwSEllRDUyUWlLRTY3SmlFSFhsa3ZBL0kyNVJtbmQyRTRl?=
 =?utf-8?B?dHFDeXJzb3o3S2R3OVRFbDkyZy91cXROSmpqR3dGMlVJa0RKRzVBdnd1bTQw?=
 =?utf-8?B?UlZmRUtWTFNERmZVaWlObzRpZVVCUFkyMFo5VG5iTWdpYytvUWFHUU41Skpn?=
 =?utf-8?B?aTl6WW8wa1Rqcnc1NWZyTTFnTmE5VEpJamMrNTdUbkowemVqNjN6eElVczEx?=
 =?utf-8?B?Y2dQYWI0NEo2bEQ1c25zdEN0dkhDS0FmdC9YSGN1MklMUys4L05salJCaXFB?=
 =?utf-8?B?bklpcGRtZEdEU0gvbU1UcnhpNmxubFprbkxOMG5HdG9XT3hoMHVNU1RjcXpN?=
 =?utf-8?B?SkpSeXJETWlGQ1F2QUZRWDl3d0I4T0xHbUNKZFdHcE5mM1VlcHF2dWZ1a3M3?=
 =?utf-8?B?UEplaStIWG9QV3dnTU50MDB3M2VVV0JCSGgzZUZwUCtlcm5XcEpTWXdva1BU?=
 =?utf-8?B?M3YwTGZhWmE2WC9JdmcrVUxybGRVSWFLbEZxd2J6eFVxSG11VTJJZ1RDTit1?=
 =?utf-8?B?WFVjS3lwR2tHZEl0N0V6R2VCMWJUU2x0a0ZjdTJsNjlFNUJjb0xoOVB5UmRI?=
 =?utf-8?B?U2NhcytqMklSUnBHNFk0TklCSWxUbEdSUHYrQzRGVG1nb3hRM2doMFhEQVM5?=
 =?utf-8?B?bzVNMmVSazlzdEMzTUVOTmFFYTRVWTF4YWswUi9yZUR2RU5kOWp6QXY5dnA0?=
 =?utf-8?B?dmgyYnpPcThLUm5GV1RmdkxxMURGazQ3aC92eVhnODhLTU9xcXAzUGNIMFRQ?=
 =?utf-8?B?dzBLS0ZseUZnTVdkOXM5bWNMYnFQR1JhYklUTFFySnpoV2JhN0xGY05GZ09s?=
 =?utf-8?B?NDhiTTAzQVNHek9YalhwMkc3V2pLQ0tPQmpDTmNLczRYTFd0TDllTmkxQWlO?=
 =?utf-8?B?Z3Vyd08xelVDaHJFR2RDOFlheFl0NERGWER6b1JhMmlvb08zUiswVGdSRC9K?=
 =?utf-8?B?UEtTNS9BcTVVSXl4V0NBcWdHV0VrZ3ppak9ScmR4L0pZOEVVWlpiOW9VZkRv?=
 =?utf-8?B?OHpqck9TejR0OVdFbjJNL2oxeThzeEtUQWhCSFdsZU1GdFBCcjZsNlpKN3Jv?=
 =?utf-8?B?RFgxTFBINUs2NG4vTStVUjRUdDA1cmN6Qk5OZzFUaE1ER2YweCswT1BnUkFx?=
 =?utf-8?B?c2xpcmxWaUxUbnlTV1NzeWdxVGdqNWpBMEg3SVBwU3FMOU1ZbVV2ditPYXZO?=
 =?utf-8?B?eVFVUUJmZzdmWnZ4dWx5Tm5KL1hPSlE4TStKdFhXOE1Ianp3eFdvNHcvbk45?=
 =?utf-8?B?NXBlK0RHMjFpUzlibkFHRUpQeUdDYXBnM3EvRlh6bks3T3FQYXlUOGFlUmR0?=
 =?utf-8?B?Sm5lS1RYSzlEdE84cmpSempQeXNZNUV4TitDQkJaWFQvK0hFUXhpb3dhM2RQ?=
 =?utf-8?B?d0JKWnNJSVRJUGk5TkE4ZXVmejJtbUZ1czdKT080eTY4bDdVTlVoNHU0Y0Rr?=
 =?utf-8?B?TWRYUlR1VVkrUzJHSkhGeGRHZnlBcWYySG1hWFRkOWxwbHdYRVBKK3RiNDN1?=
 =?utf-8?B?M3g2YnJNMnZyaVNpejQxYjdLdjVQZ1lIU0Y2SkwycU92V2pmaW43TE1BMkxy?=
 =?utf-8?B?Nm9SS0wyczZDVmtLK3dpRjVzYUsyZE5VRU9sVEJrZkY5bzZhZmxHZzYyQ1lo?=
 =?utf-8?B?WDNUMEJsT3Q5QWFaajFRODV4ZWZUanpsT1QwZ21wY3RPQ3ZqeWdRWmRZY09S?=
 =?utf-8?B?T0ZvQ09vWFdhUEJXSCtMSHFlWEoySHVqY0M0VEtOdTgxVG1TaHFmbTJwZ2My?=
 =?utf-8?B?R1A3UHFrSGZBeXJaeUJQSWVIaW5oM2QrZnZ1alFwZkN1eFExNXdka0VEdE5Z?=
 =?utf-8?B?L0l5UFNodW9MVVBEVWNyRFFMMVZtUVg3S0dYK2dqUk1ZeG9PVjdQS2ZXUmll?=
 =?utf-8?B?VTU1NDBRRWpyS0w3ZGp1dzNORmUyczJqSzF1UnU4cUd4NFBlUnZFaStxcjlS?=
 =?utf-8?B?UTBjS1Fvbm02cGhDUXZ3Yk9YbmJqdGh2L25NNUtDNVZkQ1AvMEdSVEZmSEU3?=
 =?utf-8?B?N3dHMTRuZW9uUkYrN01MR2VtZ1cvSm1VSVJVck5DR2JaRVphS3hjRlhkckRV?=
 =?utf-8?Q?Ah6xMQYWS+bx/GsMnFOsgc/nc440ASKr5s0xNlGP5wxK?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b7ccaf6-367e-4f85-72d8-08dea06c95df
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 12:42:16.4205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1077
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[xes-inc.com,none];
	R_DKIM_ALLOW(-0.20)[xes-inc.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35360-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,riscstar.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[xes-inc.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@xes-inc.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 51B3D447C32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdz
a2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4NCj4gU2VudDogV2VkbmVz
ZGF5LCBBcHJpbCAyMiwgMjAyNiA1OjI4IEFNDQo+IA0KPiBUaGUgZ29hbCBvZiB0aGlzIGNoYW5n
ZSBpcyB0byBwcm9kdWNlIHRoZSBzYW1lIHNldCBvZiBmaWxlcyBhcyB0aGUNCj4gY3VycmVudCBh
dXRvdG9vbHMgYXBwcm9hY2g6IGxpYnJhcmllcyB3aXRoIGNvcnJlY3QgU09OQU1FL3ZlcnNpb24s
DQo+IGhlYWRlcnMsIHBrZy1jb25maWcgZmlsZXMsIEdPYmplY3QgaW50cm9zcGVjdGlvbiBkYXRh
LCBQeXRob24gZXh0ZW5zaW9uDQo+IG1vZHVsZXMsIEQtQnVzIGludGVyZmFjZSBhbmQgY29uZmln
dXJhdGlvbiBmaWxlcy4gVGhpcyBpcyBkb25lIHRvIGVuYWJsZQ0KPiBhIG9uZS1saW5lciB0ZXN0
IGNvbW1hbmQgcnVubmluZyBhbGwgYXZhaWxhYmxlIHRlc3Qgc3VpdGVzLg0KPiANCg0KQnVpbGRz
L3VuaXQgdGVzdHMgYWdhaW5zdCB0aGUgc3VwcG9ydGVkIFB5dGhvbiBtYXRyaXggcGFzcyBhZnRl
ciBtZXNvbiBtaWdyYXRpb246DQpodHRwczovL2dpdGh1Yi5jb20vdmZhemlvL2xpYmdwaW9kL2Fj
dGlvbnMvcnVucy8yNDc3NzYyOTQyNg0KDQpQeXRob24gd2hlZWwgZ2VuZXJhdGlvbiBzaG91bGRu
J3QgYmUgaW1wYWN0ZWQgYnV0IHRlc3RlZCBnZW5lcmF0ZV9weXBpX2FydGlmYWN0cy5zaA0KanVz
dCBpbiBjYXNlIGFuZCBpdCBjb250aW51ZXMgdG8gd29yayBBRkFJQ1QuDQoNClRlc3RlZC1ieTog
VmluY2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29tPg0K

