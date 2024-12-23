Return-Path: <linux-gpio+bounces-14181-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F03BF9FB844
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 02:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 666EC16552C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 01:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F024C8FE;
	Tue, 24 Dec 2024 01:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="lKr7P2Ml"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-BN3-obe.outbound.protection.office365.us (mail-bn3usg02on0087.outbound.protection.office365.us [23.103.208.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941DF8F5B
	for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2024 01:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.208.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735003715; cv=fail; b=jfEdp023agrYYB92mv/sZ7xNaPmn74Mzb4rXL6cLQbYfrv8EotnsYcPtJEXhihf417k4Miv0zZ+EecqRXPYy4DcY10HsyFYHdZS9MBw3FFTsPYXmgQn7HzldXVdVx0xi/iR8j8WmM1x3JbQIOH/cayUzCcAbt+aTL3BUzgW8OjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735003715; c=relaxed/simple;
	bh=caHEV+kGRUEl7eCAiEsVaZN2MTcPB/H+Po9pxA0322Q=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=j4BUvxKigs1lKx+D68fuLbtg18hkJKfGpKDzVLX/j0nFXYuHAepf9dQ71+TrWuWgdn4iTp1S/Wy77GEEeF8oOwrUqZg9joReHlYvP+W3jP1KNLKJSSMVy9pBkPtLO89mNC18BIh7KFg9/cePUZaljRiDaaJ9bSNEkOMdygCArb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=lKr7P2Ml; arc=fail smtp.client-ip=23.103.208.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from PH1P110MB1002.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:176::14)
 by BN0P110MB0999.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Tue, 24 Dec
 2024 00:55:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=SlbIWuVoEK7iu6LEjnJeSdo7/9JmrJNL5aWnxKlZwah+9QTY2G0esFk5FBmS+vsmfoXCS5BqDac1t6rFVYlaMllBqkZJrLHeo94YYM/MOIkNImrEKGMAORcfTglaoZUQYdlWhkiwLN187aoyzEs9/S3VRYqw+fFlAqi7xxP7ZxT4dUl9Nmb5VHbl3iV7MJ5TaoXLDW8N5p/H1WIvoApr1fA6DG6ge2/OwsOKKEV8/SG+egBL/y2oblkIX2q5kY5F5uIExAqFzkjdoCZuwa2zKjGeYJl68GmBMU4LjTvD7TWRmGudrqeXNgynqYziRugt16/ms+MBAlSwzZoKCynhyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=caHEV+kGRUEl7eCAiEsVaZN2MTcPB/H+Po9pxA0322Q=;
 b=TJNmSoehg/BIJ233qT/7BJ2rKuDObEFK8cLS/6WDafDON6KqVxm1OYnopAYLTXh+dW7nsYBnnTyDdnYhJufF4xWOA2oh22WOPzCRh1enpHaCp5KSffOV0RWOGzLYgASXphEC8QTupgdCfNvcXhNbOpiG/8HfpXuK9iJFtN4Z8LXfD2AIrvuBZvxwm567EZNwfKRIN9Pm7bdbma0bJ/QQ1+a38tGpKNUnSWUwiMslvSZcoo42fWiolbd58n+GJG/uD6W+mjiiVSdq/hZD/HCgsU+3+qksaannQTlHGeJByQXEUXvSl6P4KWKGc1puIqnVNz0CDQ0+KMVeAkEskArOAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caHEV+kGRUEl7eCAiEsVaZN2MTcPB/H+Po9pxA0322Q=;
 b=lKr7P2MlFbWHVivb3rhTtbtIIuB+FwRDNbBgfSPqeImT7MA6tUayK0wuID3eBbDe9nWDsB5wbjtWT+Tm14AAghJF+5MgcEnax1Sp73XvF4jReAC2M1EJDFEXuZq3TJbvw0WSXg95XbEU0ZukznopeJr5NzJXpSf/tQiY2dbM0T9WXrHtUIYNjEabsLhRh29MubkpNxDclI9STcQMx+VB+x6JufR0d7D1QW5VRxVSEz0PUMaBhLv2WNG3Twp2B35AMjpRROkrLjXp4mBgIJSdzqqcfMTKdsc4e27e8BtYWPFtVTH3f/s5voIa+IkmHHKcf8DGPRYb373RTOwVExwegw==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1002.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:176::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 13:46:13 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 13:46:13 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, Erik Schilling
	<erik.schilling@linaro.org>, Phil Howard <phil@gadgetoid.com>, Viresh Kumar
	<viresh.kumar@linaro.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH libgpiod v2 2/5] bindings: python: doc: update the
 docstring for gpiod.request_lines()
Thread-Topic: [PATCH libgpiod v2 2/5] bindings: python: doc: update the
 docstring for gpiod.request_lines()
Thread-Index: AdtVP4/GL9l3zs0qTree5c3Py6fl/A==
Date: Mon, 23 Dec 2024 13:46:13 +0000
Message-ID:
 <PH1P110MB160346515111020E38610E2C9F02A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic:
	PH1P110MB1603:EE_|PH1P110MB1002:EE_|BN0P110MB0999:EE_
x-ms-office365-filtering-correlation-id: ea558ba1-5c81-4576-5c7b-08dd23582a96
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|41320700013|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SVFQaisvN2I1UnJ2U0RxNmYraWhaeVNKdWM3MklDekNlb1pyb1ZUb2NIeXVp?=
 =?utf-8?B?YWRiQytuMTZXbU5mWDlGd21sNjIwZGs4bVV4TDZpcFg4WksxcXhYemVLd083?=
 =?utf-8?B?UzRUYVIwejVvMGF0UFUrNnpseDV4T0x4ajVxN3doV2MyMENiWEl3ald1Qi8x?=
 =?utf-8?B?S0hQTUhoU0dOZHJ3TEFjRmU5VlBPUmhza2xUbUc4UFVSZUNlazlMcDlvTHdx?=
 =?utf-8?B?VHhZdFBDeXpBbDY4T3ZUUnduWkRpMEI4UkdhWTRzNDc3TVdCeDhuUUQzUzMv?=
 =?utf-8?B?RXBxSjhrM2t3dXVaNEJ2RE5pWVpZREpCcks5QytmaktrbGhkT1JwSDJUVTVN?=
 =?utf-8?B?RFI3WTRKQzErc24rMnlaWVRkRTJNSU5HSkV2a3h5MmJGWmpLc0lsdE9lTTk3?=
 =?utf-8?B?bU9lRjc3RzloZGRoZDBlZU1wdk52c0V5TkRwbElkMkdSTis5cGlZSHpOb3l3?=
 =?utf-8?B?dXJaSVNXazRvMVRSa3hyUjI2cnQzdDdHZTBVdzZSTW1TM0VTbUdzNGNYbkZJ?=
 =?utf-8?B?dGNkbU1UOFQzUTd4bHFsN3FVbmt4R3B3RU5BblFmV0ZMSkMzck1SbWJ3MWcz?=
 =?utf-8?B?OW52aHBNblZ6N0k4RzZBMEdHNnhvdDdnVHJGeUxQZWl0bUZTWXFhcGFPQWIw?=
 =?utf-8?B?aXN6dUVhdTdJTkk0V003YzBlNHBoM2FRcFkvaVl1bTdsdEZ6VUNzVmM5V1pH?=
 =?utf-8?B?TWpNZWlSYmJ0UzRIK3ZtQ3hwck9ZbmxnOFU0aVB2dG9TZE1pZjFKK3BYcEdU?=
 =?utf-8?B?eWJ3bzdrYUl2U3kzMXc5dkRZS3RCNFlrUXJUVDJXKzV2ckNNQkZlbWdrWThz?=
 =?utf-8?B?WTJ3WUFScWcycHhRME90eWRFNGJCZjhuVGs0VFZxN3Z0Vjg2ZHV6Y1RTWURu?=
 =?utf-8?B?dEFTZnVLSzV0VVlROEpLenZ2L0QraVMwZG5nbitYbTMxK1U5bmhQV1FrMThS?=
 =?utf-8?B?TkdZanowQ2tPVHVacXRsWTZuWTB5VzVnc2FBS1pLK25OUUNReFc5MEhSVVpt?=
 =?utf-8?B?UEgvbFhJSy9MMDdvQ2ZpaDdqYTEvakltL0V2L2Rwazd3NTV2TXB6WGR4OWhl?=
 =?utf-8?B?NFUrSmZaZTB3OUQ2a3Rqa0p6MkZBUUtPbmdxRGtkK3RjZ1c5eGlFL2xFV2J4?=
 =?utf-8?B?U21vZTU4Tzk2aGtSWWRTdmF6azh5UmR5Y0VoNVJMNVNTdWxnQkxqaElNQlVy?=
 =?utf-8?B?ZkdhVkZwTGFLaHRiMmJQcnFvRTBMaUJmOUR1dE1Hb24vV1FaV1JuQStrbjVa?=
 =?utf-8?B?YjFYYjhkclRFNU5vYWZQWXJtT20xcTNtaFppL0tTMjRlTDVzT2VnQzdkV01t?=
 =?utf-8?B?Q1VYVlEyd1AzSmRIdWFXeHU2VzF3TUVmaUZxY20zeGFZL2syYWpoYWJUS09h?=
 =?utf-8?B?KzIxVmNoQW1CSy9uWEp2Z1BPMXgvcElMWTQ0MHFrem4waGw2VkN5S1BLM2lC?=
 =?utf-8?B?bmRBV05CTnVFNUhzUU0vWHd6MzZKVVpMUE5ZQUhMaHQ4bVZmOGxBbTVKWFZj?=
 =?utf-8?B?LzNZTzdsZ0VOQS8vNFBQRlFmOGdtUXFxOGdDaDc2dG8yb2dLdFV1RVRFSC9p?=
 =?utf-8?B?bXNFc3Y0eTZocjZXWnBZdHRqdUZoNWJtdUtrazA5L0tOMjFPSzlyeGF5OGJV?=
 =?utf-8?B?T01ZNEZGWC9XVnBQOW5CSnFEZU0xZk5XdlQ3WVRhalBBMTZjVmlYQzhqTHVk?=
 =?utf-8?B?c0RKU0lWWnRpTXRNc1IySEhNQjR0OVkyWENRckg0R2ZmQ0RtakdueTFzMVBj?=
 =?utf-8?B?bmlFVGl3UnFxcTBjeFd3NHVIVW5VV2dqY0xQTmRiRzFUeGJJbDlQL0U4b0Vq?=
 =?utf-8?B?Z1NSZ0dwZTlPbjFzSHVLemF1L0Z5a251UmdNbEZCd1BxcUtmcGl6RkxiY25h?=
 =?utf-8?B?d1pvMG1UdWhDWmlZU3FvY0l0cmlLbXBEWEowZmo0WmhJbmhvSXIwMHdlUWFv?=
 =?utf-8?Q?Bk4V4i8w3hg2rwwkC3nM1c410Nf2//IS?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a3orbjhyVWc1UnZiUlBOckV1Y2I0TXV5bHJWT1g1TTgyVnR5Q3JSVVBqa1lP?=
 =?utf-8?B?TjhZMldUMnpJc01vbzErL212Z2x4aW1HSlRWTDBkaVZoSmNvTTdMNnQ3SWV1?=
 =?utf-8?B?eUlEbzJ6dXIxaDEzdXJyZ0VCeVNTSkZiVVVTeDhlTUxJL0psdVQ1WG9NeXF1?=
 =?utf-8?B?YTlzOW5iOFlMblArc1crWEJ4SnFoV0c5MExVdkFzRkQyRjJPTXdXaCtwY2FE?=
 =?utf-8?B?OVlUQVdGWHBndkk2QWJNM1gwYTRBaDBkb09HYTFpbmZGY0ZNVUY5eVdMRjY2?=
 =?utf-8?B?NUJkVHFzV3g1bWZ0U3ByVVo0bDdLdlJreEdSRnpWdkZKS3dQWTFwMDBjV2Va?=
 =?utf-8?B?UmZCVGFkallDMklpSXI4eFhqMDV2cTE5QU8yb20yQlBENTUyamQydEtOQzBC?=
 =?utf-8?B?aGw3ekFNeWZreTMzWnc2djR3M1FkZVhyK093VjJTdjBkbGFLNlFpNUR1RndX?=
 =?utf-8?B?U0ljNS9abmtCdWRtLzlWRU9TZnRrdFZlU1FKdXFNMXNqNUhVN2RiajY4MHlz?=
 =?utf-8?B?T1lnY21JV2JWZUw3RWNZcjlubFczMFZ6NVlNNzdIekd0VzZWaEcwTmdyR2dQ?=
 =?utf-8?B?UHl0bDZJOXpqaUtvYmlLYjRGTis2b0t2cmY5NTEzV09wQlRFbkVEcktFMDlq?=
 =?utf-8?B?ODJOcko3M0J5WkppaHA0RVhwVXl2Nlp0Q295UDJDQzVCUmxtdW14bmFGRlRU?=
 =?utf-8?B?WWpFVzRFTXBlZkxQZ0p2ZzF1bWZFTHphTkw4U0xjbjZCUU5iZmhkQkwrZVpV?=
 =?utf-8?B?YlJ5Z1Z4ZlVuZ0FmN0EwUnpmb284SU81Y01ITER5Wk1SWE5WcENZYzBGS1hi?=
 =?utf-8?B?RjJqNDFhNjkxdjRrOVhsMmZRYXppZGZjUmZzS2JvZXpLbFNWejhZTlZBYmlD?=
 =?utf-8?B?SXRHaVZnYnRqZndCVU9aM2lGWUxuZEJhNGY5M2xDbTlObXJVQ2R3LzJSV3ly?=
 =?utf-8?B?SUN0SDl1NHRZYjlhLy9OUHlWVnpiVGxaVVFaYzFSbGZDQnJTak1RWDV2R0cv?=
 =?utf-8?B?anRtRzBaaGRRL1d4bSsvYXh2NnE0eGQreWU0QkpqQXhvU0xXWkhuZDF6OWZD?=
 =?utf-8?B?b3hIcXYyM0VWR2p1RkdwSnAwU0JvRFJmc3MydUtEUlRBeFNiR0JieDRZaDky?=
 =?utf-8?B?Z1ZkSnFLWVZiTzV2TkxuR0NnOGNwb1BCalpRV0hHdDNTa0VNTjFua1Z6SnJF?=
 =?utf-8?B?ajZFL3d1c3ducGxwWVd1ckhKL0FwaUkrajF6MHgzUVBWOHVIK0VNTUpjT002?=
 =?utf-8?B?MkYxeUFRUnBWNmpzZnZ5dWE1RXIyRCtHZHp1b1YrQTRDRkZmMzZLTSt1Mngx?=
 =?utf-8?B?ZHR4MDUycy9ZNFRabnVnOG5UVDRmWTlvdXRRYTJaNEUydDdQYmY5ZTJVSE1t?=
 =?utf-8?B?N1NRSWNVM1ZqODgwb0VZQ1hqQ0xmTlpoRHR5WXRHQUtBSk5lRHg1WGlEZmdR?=
 =?utf-8?B?RFhMZmRxS2U2d05nSTlNdG9hZGN5aFM4L2NoNXVGZGtTcUF0S3FwVEVDcGpk?=
 =?utf-8?B?cGxudENrUlNUako3S3p5SnlrUGFKUWNVZ3JybGF6eEZRdU5kOCtGbWYrVG52?=
 =?utf-8?B?TXJSUHVRUXlHRHMwNlRXZ2hCcGNSdVBlelladExhN0tkM0sxbnFVNVFaMFRG?=
 =?utf-8?B?REZCOUJnK09INU14TU50UFk2b09IVUM1bVZRQnJYQ0ZzNVZ6bjYrcU9SOThy?=
 =?utf-8?B?cVZ4ZS96dkg1ZXh6UmZTanhuSjVPdFdmenNOblMyV3hLMGVOalBSN1pXZHcr?=
 =?utf-8?B?Mk44Y1FEdWhCN2pRQVQyZTVSZTV1TUtPUVRUTnhQZ0FqajV2TFllTDJrQnR4?=
 =?utf-8?B?OHg0Sm1IWnhveHNTcXVZQU42d0JLWnZ6MlgydlM0VXdtVDR2UzZxNytyM3Yy?=
 =?utf-8?B?U1NpTHY1TVRJb0srdlJ3SUVtdGFYOTVTWVhPMjl5bkNibVcxcndUVi90eGpV?=
 =?utf-8?B?U2l3bjVlWFg5b3dmaW81VkVzS0k1a2hFWFBWQVdRQmIvc0FrMDFjaHh0bXJu?=
 =?utf-8?Q?Jwj6nCm3iX2HIoWy7JzlVxZmmFJ2IU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ea558ba1-5c81-4576-5c7b-08dd23582a96
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2024 13:46:13.4866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1002
X-OriginatorOrg: xes-inc.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU2VudDogU3VuZGF5LCBEZWNlbWJlciAyMiwgMjAyNCAy
OjA4IFBNDQo+IFRvOiBWaW5jZW50IEZhemlvIDx2ZmF6aW9AeGVzLWluYy5jb20+OyBLZW50IEdp
YnNvbg0KPiA8d2FydGhvZzYxOEBnbWFpbC5jb20+OyBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+OyBFcmlrDQo+IFNjaGlsbGluZyA8ZXJpay5zY2hpbGxpbmdAbGluYXJv
Lm9yZz47IFBoaWwgSG93YXJkIDxwaGlsQGdhZGdldG9pZC5jb20+Ow0KPiBWaXJlc2ggS3VtYXIg
PHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPg0KPiBDYzogQmFydG9zeiBHb2xhc3pld3NraSA8YmFy
dG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPjsgbGludXgtDQo+IGdwaW9Admdlci5rZXJuZWwu
b3JnDQo+IC0tLQ0KPiAgYmluZGluZ3MvcHl0aG9uL2dwaW9kL19faW5pdF9fLnB5IHwgMTUgKysr
KysrKysrKysrLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9iaW5kaW5ncy9weXRob24vZ3Bpb2QvX19pbml0
X18ucHkNCj4gYi9iaW5kaW5ncy9weXRob24vZ3Bpb2QvX19pbml0X18ucHkNCj4gaW5kZXggODE3
Yzc1NS4uODU0ZTQxZiAxMDA2NDQNCj4gLS0tIGEvYmluZGluZ3MvcHl0aG9uL2dwaW9kL19faW5p
dF9fLnB5DQo+ICsrKyBiL2JpbmRpbmdzL3B5dGhvbi9ncGlvZC9fX2luaXRfXy5weQ0KPiBAQCAt
OTksOSArOTksMTggQEAgZGVmIHJlcXVlc3RfbGluZXMoDQo+ICAgICAgQXJnczoNCj4gICAgICAg
IHBhdGgNCj4gICAgICAgICAgUGF0aCB0byB0aGUgR1BJTyBjaGFyYWN0ZXIgZGV2aWNlIGZpbGUu
DQo+IC0gICAgICAqYXJncw0KPiAtICAgICAgKiprd2FyZ3MNCj4gLSAgICAgICAgU2VlIENoaXAu
cmVxdWVzdF9saW5lcygpIGZvciBjb25maWd1cmF0aW9uIGFyZ3VtZW50cy4NCj4gKyAgICAgIGNv
bmZpZzoNCj4gKyAgICAgICAgRGljdGlvbmFyeSBtYXBwaW5nIG9mZnNldHMgb3IgbmFtZXMgKG9y
IHR1cGxlcyB0aGVyZW9mKSB0bw0KPiArICAgICAgICBMaW5lU2V0dGluZ3MuIElmIE5vbmUgaXMg
cGFzc2VkIGFzIHRoZSB2YWx1ZSBvZiB0aGUgbWFwcGluZywNCj4gKyAgICAgICAgZGVmYXVsdCBz
ZXR0aW5ncyBhcmUgdXNlZC4NCj4gKyAgICAgIGNvbnN1bWVyOg0KPiArICAgICAgICBDb25zdW1l
ciBzdHJpbmcgdG8gdXNlIGZvciB0aGlzIHJlcXVlc3QuDQo+ICsgICAgICBldmVudF9idWZmZXJf
c2l6ZToNCj4gKyAgICAgICAgU2l6ZSBvZiB0aGUga2VybmVsIGVkZ2UgZXZlbnQgYnVmZmVyIHRv
IGNvbmZpZ3VyZSBmb3IgdGhpcyByZXF1ZXN0Lg0KPiArICAgICAgb3V0cHV0X3ZhbHVlczoNCj4g
KyAgICAgICAgRGljdGlvbmFyeSBtYXBwaW5nIG9mZnNldHMgb3IgbmFtZXMgdG8gbGluZS5WYWx1
ZS4gVGhpcyBjYW4gYmUgdXNlZA0KPiArICAgICAgICB0byBzZXQgdGhlIGRlc2lyZWQgb3V0cHV0
IHZhbHVlcyBnbG9iYWxseSB3aGlsZSByZXVzaW5nIExpbmVTZXR0aW5ncw0KPiArICAgICAgICBm
b3IgbW9yZSBsaW5lcy4NCg0KU29ycnkgSSBtaXNzZWQgdGhpcy4NCg0KUmV2aWV3ZWQtYnk6IFZp
bmNlbnQgRmF6aW8gPHZmYXppb0B4ZXMtaW5jLmNvbT4NCg==

