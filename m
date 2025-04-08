Return-Path: <linux-gpio+bounces-18435-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3DDA7F638
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11D973BD823
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585C7262D14;
	Tue,  8 Apr 2025 07:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=barco.com header.i=@barco.com header.b="bq+tqXi8";
	dkim=pass (1024-bit key) header.d=Barcozone.onmicrosoft.com header.i=@Barcozone.onmicrosoft.com header.b="G2CsdA/S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa3.barco.c3s2.iphmx.com (esa3.barco.c3s2.iphmx.com [68.232.159.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42077261594;
	Tue,  8 Apr 2025 07:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.159.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097147; cv=none; b=p7LTxrJ6UJcEvynv2CkTYGpFIDdObr48HtFMT0VAmd2F5AeH17NaB9J1SpehZEIBs/psJA9kOb64dXQiKLvmh8V6XEvdo1wMfJokqkUJdsEaPMXM/y2QpFooPqYwek75j+FMKv0D4M74pZ01t3XVFik0KL164wudtW+3MqI5k2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097147; c=relaxed/simple;
	bh=lueL+JTNm+TS+oTCRtAHp5/k83HaodwGQaFyRV0pQNQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tsp6dlOcHhr7CNff6TAHRsF/sgeVmjUT2K1KqBedThiDEoZCu7s5djzvFJ3+Jims1C1DwVupN8M/U6CrdWMkA4a+Y+2W0Z+vTx2GqJJbg1+wrrGQ596wEuq0T2ginwPNnw3lTxhsW1TbpvDGT2F57cvMnNKT5mKwsOvXZbgYMvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barco.com; spf=pass smtp.mailfrom=barco.com; dkim=pass (2048-bit key) header.d=barco.com header.i=@barco.com header.b=bq+tqXi8; dkim=pass (1024-bit key) header.d=Barcozone.onmicrosoft.com header.i=@Barcozone.onmicrosoft.com header.b=G2CsdA/S; arc=none smtp.client-ip=68.232.159.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=barco.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=barco.com; i=@barco.com; q=dns/txt; s=ces;
  t=1744097143; x=1775633143;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lueL+JTNm+TS+oTCRtAHp5/k83HaodwGQaFyRV0pQNQ=;
  b=bq+tqXi8EysmpEgfPO/ckAWLOZqu69d/IvnVaCdZe57xAjc9swm7KEOD
   rZc3L6L696ZjckcM1GQnS8eFtAKUPRcSAj18iJZ0SkCX4RU7DE2V7W7RT
   rK/Ho0IogpDagOwxDuL4zcZoRHp2EcYOoPfpULaGDtt7sdIvQfZmyUPqR
   myQ/8RRYb+dS2GZvQek/8S893M/6oIry6VlwH3va4w2BXEZEnzcVmpRlB
   e1d6xKg9AC2nF0Ht9isWv8G8PAQD10vcs3+GFTlTi5plGqs3LF7I/21gm
   Vw1F021c2YofZCRJF091waPu/ha/qfvorDazmoeScN7uKHFTm+OwXMglD
   g==;
X-CSE-ConnectionGUID: 21F8/AdqTwm/CIOXPFGWDA==
X-CSE-MsgGUID: 6M0qTo/kT6637nKVn0Pp0Q==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.15,197,1739840400"; 
   d="scan'208";a="8886807"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Barcozone.onmicrosoft.com; s=selector1-Barcozone-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lueL+JTNm+TS+oTCRtAHp5/k83HaodwGQaFyRV0pQNQ=;
 b=G2CsdA/SJoA7zKzrByLHNCscppTsAEiv5Uhs+fdfALvcnqhqTn/myGGlUHfTEAmbED7KGQgzF8dLRxESJRs29cANW4+xztpr0pV6cpCp2wReqgk1x/yOFLtqFUJFkFF2fodhmk3Xjs+UjKMLZzg2qXivn+9Z+zINVWJjmmAow38=
From: "Korsgaard, Peter" <peter.korsgaard@barco.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, "Yadav, Santosh Kumar"
	<SantoshKumar.Yadav@barco.com>, Hans de Goede <hdegoede@redhat.com>,
	=?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Linus
 Walleij <linus.walleij@linaro.org>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/3] platform/x86: barco-p50: use new GPIO line value
 setter callbacks
Thread-Topic: [PATCH 1/3] platform/x86: barco-p50: use new GPIO line value
 setter callbacks
Thread-Index: AQHbqFaj4G7ltSz0fkKYEhMLxpGWhbOZXY1Q
Date: Tue, 8 Apr 2025 07:24:28 +0000
Message-ID:
 <AM9PR09MB5105D56FBFB84C50CC97CCE9E4B52@AM9PR09MB5105.eurprd09.prod.outlook.com>
References:
 <20250408-gpiochip-set-rv-platform-x86-v1-0-6f67e76a722c@linaro.org>
 <20250408-gpiochip-set-rv-platform-x86-v1-1-6f67e76a722c@linaro.org>
In-Reply-To:
 <20250408-gpiochip-set-rv-platform-x86-v1-1-6f67e76a722c@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR09MB5105:EE_|DB8PR09MB3627:EE_
x-ms-office365-filtering-correlation-id: aab5e03c-3478-4771-80f8-08dd766e65f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?kk0fWQRyJpeizBlMfKAe3+uOG0Jt6vc+DBrN03FuyA1SAl1ZuGTQq+E782?=
 =?iso-8859-1?Q?L0XJLRMiE/W9l8+t84Dr5AbvrDzYQaugA0AxdJSeJFGgnaQgN5DJRtNyzP?=
 =?iso-8859-1?Q?4nyzZqelIqAMoZWY7CiZbg+M0JNf5CSGRI/KZUFvX8zmORga2zJdJjvE6G?=
 =?iso-8859-1?Q?DDvMw6feGesh7oDauFXK8ntOLJ48hs0l6rMnQ+g+JsANyx5VO5Uy5P3kO8?=
 =?iso-8859-1?Q?dScIQVPhNAdPLu7HeNxRnBh6h9obqUmwxSOA6rMavCh5vwwF0bBW+uz1r5?=
 =?iso-8859-1?Q?CmtekToW/YhjygGJvlr25gvJOhDwcYpGYJ0g3mQ6ftlp8Iaf3bM+AvfTZd?=
 =?iso-8859-1?Q?qP4Jw011N+dQH0g3dzvHv8UfQurtG4nUXCb8cEZcnhVRrjtS5UZnQhx9DQ?=
 =?iso-8859-1?Q?yywt/5EeEdHe4rojw0VXk//1VF9XFv7AlYFhbboiingoUB76f5BrZkAXl1?=
 =?iso-8859-1?Q?569HN5juAUaEE8ZkCHOfv/eb4rTRr7fujaq4k41jqGtTetZxNMEcZvF4m1?=
 =?iso-8859-1?Q?ut9njK/oIxd14uAhS9eGoHLq9B1VbYFNNJLp2UFNmPXH87Agag5UajTTeq?=
 =?iso-8859-1?Q?vd4lbRL/VkmNUjKupLh/LLNafHidnDwaY7vPLKbp293n9njr7P3CHo2Zxy?=
 =?iso-8859-1?Q?dZCWv6WnD/710CDoGgT52JwvjoOEI6lKnpVA0ADFMSOcmg31Mm+SRZw9YH?=
 =?iso-8859-1?Q?LBYoD7lH52YzcLVrt6DANWXw4SWzWXcMYf3kV7ghCaRqjA97FT7/JgsQzW?=
 =?iso-8859-1?Q?78Ou2K3eeAlklH+CpzIoo/9cXYg9vKLSc/RlLaLWqMu7hxS1IULr3c2n6E?=
 =?iso-8859-1?Q?k3+tOreyr1MlAdV7+UrqtDpg2Y1NDHhW3KJ7KNZdKU98wlH4lXEUmNlNmX?=
 =?iso-8859-1?Q?xsHcU7NPD2yL8OhvVczJBAO0VH2QH2ArINRKdOWFK2VRyIzZBbDF38MUbM?=
 =?iso-8859-1?Q?GCBsrAIl+qIflZ8N0eVKG0Q7y0PWYzuwNukQbof+b2FkZk+/LLLLr0DL9F?=
 =?iso-8859-1?Q?uUK58g6hm8Qs1U20DUQ4kryhWVUBciWtVQJrZW/bJmbcMy89sCD8QaHrMP?=
 =?iso-8859-1?Q?7Adcs+fLlUQmUeBOMRM1gv+3tltrNKLcKgLPyDhAqSpMhL/wWazQC4p3vf?=
 =?iso-8859-1?Q?OtxioqT9XGgzilixtoizPnkZffkbFxHPR7Nf6viYCi7JB2YzGzZWLJHviv?=
 =?iso-8859-1?Q?DRo8msVg+qGtEQE+yZkWhSjPt1S3XiVSdkPeL7MMS1y58cKgqJWzHjCiQf?=
 =?iso-8859-1?Q?lgls4H6zjrGrFzMTjkvEgr+MX1ivk7CA+350N7XsBTTXlgdV4ZC8bz36Nn?=
 =?iso-8859-1?Q?QJ5nnmjhUeh3W5LeBGwCZEmEYFTNLRzqiT2f+8Lls/zw95jEh1rgquLLUP?=
 =?iso-8859-1?Q?l7I1z0+7JP40GnVIrEQzXjhoHC9KKfvWiXyf2qjI/7kGa5EHrc2tKJw+0K?=
 =?iso-8859-1?Q?sZ/MRBHX27BcELfuUZZV2p/BeeU61v5LbjBsDu5Fk+KDHZj4668gcKz9oT?=
 =?iso-8859-1?Q?W8Yqv4EJfu2aXFPSh6wABVgLDm9N5I5nHAYgzYjoUn8w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR09MB5105.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?CwQWWCPzi9ozpklkZF0dyMylX/OHM+UH8cQyP7p63tMNiYFlw+k6PKgyDX?=
 =?iso-8859-1?Q?irK8ub5gUqIabtPvO3cFIKrIfloRpmehQD9wnpLSpaGRUHoocBbInckXNz?=
 =?iso-8859-1?Q?bX1cHhMovKnC/5gVH4VC/ReTYVhQJnBBgC53LzLu5whI8vGiJD8HsbIdK5?=
 =?iso-8859-1?Q?48F3EoCBRWqlBcQj86gk0SXQLmWQ09lo+XYUu1GgypLhLolPzTdhbEU8yE?=
 =?iso-8859-1?Q?IJ0Pa2WUYZ/zYuKaAqcIp/UsdHA/ztV06ABHzF6AWojBoExiWsu8zPfWAN?=
 =?iso-8859-1?Q?fk23DY9p6pPYPTgexY8L12Can1c+Q9IesAiv2ujVC0ZtrTmd37muSb3e3X?=
 =?iso-8859-1?Q?HWRhocp6blNlbqgimhYuri06wR6MIH2iEChnymBx4+Wwb91g71KGjhXJzX?=
 =?iso-8859-1?Q?+4mp22IQo7i5lLCYytWmaNlWOYZsiFLIZC6Vv3yX+LgIM3rpIs4CFXKIt5?=
 =?iso-8859-1?Q?p1pTTKG4R47y3dCdaHuQ0P4I91rqFNYAOqNiWvyQT4Zn0Pdm0w+hgiMNmP?=
 =?iso-8859-1?Q?kNUQ0/UwchSgIZxjYyE8Oj/5vacASzPwArD8UKthGLCaM8FZVP0NmqMA3J?=
 =?iso-8859-1?Q?6aGn2I7v5x4wiPqLWjxoGwkukO20SjlRouKFoEWy/P3Jj6uzS5JdN1aB2M?=
 =?iso-8859-1?Q?uJ5o1AOqM325dYJPfIAnU35/HNz0BNpHtwHSagZkskPGSDSkQpGx8pOQut?=
 =?iso-8859-1?Q?oI7QRSkjSUuIPAAwzkSqpwnuyzoqoHpQ80dHGbuLOAVYcEenhq0j2irDL5?=
 =?iso-8859-1?Q?ihNM/WDKEZj8Ug5kaIGDpIepVlC7xuu4EiwoKat7hqK2/l3G13gdnhYMJW?=
 =?iso-8859-1?Q?bIPe4sB8KyY2taSi9Uw3CB7qgPAhtqepS7uQCfe2zYDdJACwBI5qUIskNt?=
 =?iso-8859-1?Q?+DoNw3CzehQGzjSpmTizGRBk3n61KFG9+HPsWvPqtT3+nMnvk5yramm2No?=
 =?iso-8859-1?Q?hMpdPcvd5pYzyZb/pCDDA5WgonJiyCrrysKa0uZbTG3BwTrJqHG3NoI941?=
 =?iso-8859-1?Q?BeMcFrSI9CovczUmTZDgJBK6NcL2E+sPqvjgcrlzFdf+BG57V/VU41n//i?=
 =?iso-8859-1?Q?mMbVPcxUK1vPPBPkEQwuPCiNo3GDO4ZP8OKkud1XehWyl1B5IG3RrfQizr?=
 =?iso-8859-1?Q?d7KYMvkWHm9HlGo5RMzbb9wSGmmGXltGsGzhmy3NDcBWcve8xLpbJtNniC?=
 =?iso-8859-1?Q?FAV+ZQbcmScKdDunOp6u3QiaVUSj8RpmumZebVPa02Ja2Gop6I/1zSn9Da?=
 =?iso-8859-1?Q?/qat2pGiQ5GAqHwKSUHRiq4ID7KgBMVNEM7p310NOT7XKVfwzFVRPr/d/D?=
 =?iso-8859-1?Q?FydtaaEAtqeGWIVJuqq8qfZufgkBTUHyUrekgq/G1iVAeP7P3C7jpeMqml?=
 =?iso-8859-1?Q?ABFnIDEvpIxcSyVvWkkZkknApWj5hOsEsXI+N2IhqQ1+bH1eG/TAJHYF8J?=
 =?iso-8859-1?Q?sclvtK2QD5Gh+41G3r+kg6c96nT3Y+Os173nuNuba2zVtuFd3xqPLpbf39?=
 =?iso-8859-1?Q?DqvDk/9XV85md6P6Y+8vJHDDKgXvQp0cyyc2M+SepsQoVDvkzd3L4CXFiz?=
 =?iso-8859-1?Q?SA3OIF2QcKQfOgNedobY5KAyiZhC2w+fTuyIQqX+mEI8PHdt1KKMee8/Bj?=
 =?iso-8859-1?Q?tU/7m6cUx705pWrC2J3WfHvF1m/Yr08D0o?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uAeCoZbLazYLLNx7Ov8adxUWiDo7D0YJ90cp7AxOLrVqmVNXmvIVeYYDziAq1L3cC+QLhSUNX6fGKNssbPh5jKygfF4sGjhT8Sc3Buueg2lCXWC+/vxfeFfJWNQ9pXk3QZDwhY4KLU7GnaikIzs/pe/7bnCv60HzPBMPYK+/tbEnJ/G+1lVSHJhRF6Cr/joHejZEydjtDHiRZtIaW80eSrDoBANu0w9cyRPsN6vQszo9mP4EZMW5jZXN6EtHqlagbHoW1Cfdhdf8xTA+0kgTL4tntkcpKqZDMyBRGXzeRIY/IETIWYFaVDl4+NIgu6ltwOAICiqScfHUn8wsLzznAvv3BUJyN/kksQ0WZja5SGAfL4XttnbqkdaP2+g5dRiUyeV+3+dyKcz1uCmwVoce3vebRJMh5qTm/uQxjO483smK81nSh8SpXrakNU8kzNaFUc3RW5eNl3NyH6vJezpuMK7HzUMKUsNx0Nfvi9f7ZkzwbJ/qqL6uuQQ8Z5AOvdOf76bS0JVzWo2H5MchIIVZTPpXIYDSXwyFW4vdnlo1+QinM1wXQkPNNxdqjJMa/swaf1HEGpkLgLpWkd1Ci2Qb1Wtm8l7FSl/cuDWmhqu0Memdzu0S4TJ4BLU4gj+3sK7M
X-OriginatorOrg: barco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB5105.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aab5e03c-3478-4771-80f8-08dd766e65f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 07:24:28.5159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: aeb84c91-6270-4446-ada5-d71ceba1d535
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T2EWDib7p8Hd/BmTTEP1yKSiyNoRPb4wYteR21JzKBL/jSIfjXtT41rDLxAt8Z4JhYdTu0nx6+b9djlc7AVZaKWWpD4DjdgK28CM0MjRod4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB3627

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Peter Korsgaard <peter.korsgaard@barco.com>

--
Bye, Peter Korsgaard
This message is subject to the following terms and conditions: MAIL DISCLAI=
MER<https://www.barco.com/en/maildisclaimer>

