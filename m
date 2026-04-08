Return-Path: <linux-gpio+bounces-34904-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SC7bAjzb1mkPJQgAu9opvQ
	(envelope-from <linux-gpio+bounces-34904-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 00:48:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE1F3C48F7
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 00:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDAD8301BC00
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 22:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A4234677F;
	Wed,  8 Apr 2026 22:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="ogiMmN/w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-BN3-obe.outbound.protection.office365.us (mail-bn3usg02on0061.outbound.protection.office365.us [23.103.208.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB11D18DB37
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 22:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.208.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775688503; cv=fail; b=Jk3Da6t6+HwE0KRP3T1bi0RufT8Y3WbmRKzjThmmvDD8p32hY4cB6lgN4zIAH4rg+E8V/+Qz5FqEayYO4oCxx3A6+La2/u+8qmKTrrVvfaY+sx3dy+iFhOL2sUUuGXSZ0dmD+V46OHBQur9LEKh6U64tjW67aKxCOjNDrGRSzTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775688503; c=relaxed/simple;
	bh=zqMELVm04eG0nYzeSfZhjgXAW0JNOsmAQAXuDldJGas=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Mh/rGKDg+unza6k6fW8XS4953kNFLhu2n0aH2WX5kN3dwsjqK1vBcDySEmsh3VCytDC2CzItSu4lDbVtkFbebPlEEhcphL7jwrh0aY7/dWO2sdLapurXWINy2C6WwSh2wG/qQRuf/hrwni8hx8LyBqlom9CbDe1e0y4C3Tk+veM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=ogiMmN/w; arc=fail smtp.client-ip=23.103.208.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from SA1P110MB2203.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:199::8)
 by SA1P110MB1909.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1aa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.42; Wed, 8 Apr
 2026 22:48:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=JpEKfbXEDUFCkADyWc5X2gn00vSuVxW5kofSv0x97G9DOuDAFIMQ+1lMzCoLaKrgFI5bYi9Fd3vKsfsv3pkAc0LeKWSpd9bENjAiPwXJunxTZ8sYaIGX7aAukHEVdHLv70wsvY+V2Bziu0V66FPpI/91W5UxvKr9uezQaXffAnngJsudOSUJf0lyIWktMxlqaGBgKuSqRjOIyuFDXeKgw4P3+VRLISaJJE2BhaN/qqQ2rLRq7Q765bkXZ2Y+dxwBdx5skjWf3Xc07cMSPZ/yx6lE3dw2li6M1b9h5CqFot+g5tGxMslU+uVZP2wGm37pwuBp/svBMNT/pXffYWNVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqMELVm04eG0nYzeSfZhjgXAW0JNOsmAQAXuDldJGas=;
 b=mVZ9wkaYToQuDRcirAG6KCkP9Rdyu0q+orCWHn6XuIbKkQB6xdffP44RtZrP/COlOAWJkjVdJSl3SgbCNYGjOfv0JgACCN6SgtGr3z4xcqf1D3Bktbo0agLJa5Do4m4prs7Ewno1DrcizKiLptthw+qxckAt0S61hqjO2lQtFmXqC4u82mp+0awEaYrb2Rtm+pHOemGydaYYXUPE4iI1kOGF85Zy4MSK2816X04bXu6kg9owv2ScTxSP38NC9oQUB/TwKQY8Ut5ivcJLEGPyzlJHQeMhTD1gMb3kitGj9rOVVcZ3/gu92MTMgN8e5pEshUcfJZnxAlg7gy6KY1pHEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqMELVm04eG0nYzeSfZhjgXAW0JNOsmAQAXuDldJGas=;
 b=ogiMmN/w2oh79bpsO4bIieVytGqFbX7/mrrml37rJcHlzlJDkLPAIFqJyIBxUPFQViOZx4uZkUj3+gooxuYBWHBWvah2CvMEWfQi8M4wX3NUBozJ/PFeBuclkVHAaOz/6K1aqiVzFzSBSm+OO3q2mBENogf3tZqZMkpDli2AOlu+VidbLnpGNhXZNzkw6QsHgTi5AzPOKk69hzlYTDgI4qKKCHLTrNkHx8JRkVMcoqtS+gTy7bGmJKj2fb/68D/n5QaQgIfL+O1Y3DA7WlWOuKX8Ry0PhJqGT/CDnR/vI2JGNRCGOVdR2X4B9zjiv+QiMbrxSbzLExPPekN6FKXLyg==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by SA1P110MB2203.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:199::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 11:45:01 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 11:45:01 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson
	<warthog618@gmail.com>, 4fqr <4fqr@proton.me>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Vincent Fazio
	<vfazio@gmail.com>
Subject: RE: [PATCH libgpiod 00/14] libgpiod: assortment of fixes
Thread-Topic: [PATCH libgpiod 00/14] libgpiod: assortment of fixes
Thread-Index: AQHcx00i8JJUpgdxtEapleVpsIZDSA==
Date: Wed, 8 Apr 2026 11:45:01 +0000
Message-ID:
 <PH1P110MB16035CC2882BE1139F3B4D819F5BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
In-Reply-To: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic:
	PH1P110MB1603:EE_|SA1P110MB2203:EE_|SA1P110MB1909:EE_
x-ms-office365-filtering-correlation-id: 45a41394-b5f4-4ade-b776-08de95644498
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|41320700013|55112099003|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 Z0b967kpkPiNB6ryNE2qHppTeDjEOJ5zR6qhVBlpeeUYDdvYBwOwSe0fXAr7kBPhcA9io60mOddzE2SovI9lrF4a84uywRkzl2ydL1prAGRAUNtNXT0eJEFDPswxtAIRiOgzgql1ZP2J5mbi+ikKJB+M3hb1OiHV4KheG6y2OUEdROvYftHZ2NhynVUPljGZpXIWZNjGu2yaU6gZF8Rc592wqxzOzXLV812qy4qiwFhz8OkjScQnKZpbheXC2AWLzVdoyLa6auEEJYdx3wA3ea8Rw+7Eae+wyJnTykZjQo5PMYReo8BKdhTb0JphciCxiaWpscnyVi9PYmbvpDisyCpNxWiUhGsnq5ddzbKHtVh6Xvxw6kuY8gyEwq8ZxyM+yp/cjSmXvTiLqCZW9CLjoYzgsEr1/h055HZ5Q4QG5SShdpDMbkRqPdUsvZIFIbk+XgDuPJRpdmnovCj6SheQcyYRrEPm/um2pgIntsLxSzvI7hiNV1L/4uP0agqFP3H3Nltwq+ssoE0DolR0mYMR+OfSxBzT54mqNiPztqg7cAa/EX8HYsDI2OY59lSYJizjk9rkx7kSzK6zVXGlhu3bvK30BWgrzvYjpuUlq53sfPKe6vfXXIce3Q5+O/H/JLOFIYSR6GYGrfuLLAzLDjePrBfhwHPKRjkCgt1a2zk3rLB+JeCOwi3zzefkjSBMksaADjtQlZEjCKJ+ZHPOJLBUa/OpOIRlp3iatNPC0AlJkY1yBWVk+1GMrWLT/1BxtGLtP/mWGmPPQqnJM5JULnLJT9JttkQZ/MNT+MsxT6p8M08=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(55112099003)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eHI2dmFIcjU2SFpJcDNKeE8wOWs3TjN2MlJwR3dyVzRuRFF3SEYvaXYyZjlJ?=
 =?utf-8?B?b21sYTVGNWIxajMvRFlOMFVuVEhSZ1FlOWdIZXVNenExTnE3ZHJIblRqMUJN?=
 =?utf-8?B?WHptZGJwNFFORHNKWVpJOGJuZ0NXWitPTWFWd1YreWdXVkdGSERWQW5uQWNH?=
 =?utf-8?B?K1dHZ3ZnRVJMUHQwYTRvWnRoMzNLK1NWQldFVXZRb0lqMXdKYk5lQmhTcXoy?=
 =?utf-8?B?NFNoc0NtUEpSQ0JGSWdRemtPSFozT0gyMEl6aUZlM2wyS1dia01xT0t2QUtW?=
 =?utf-8?B?OTdLbE5FUzhZWmhiVFhuQzFWTDRBWmV0alJNRmszM2J1QTgwdzZvTENZTmZv?=
 =?utf-8?B?bDlkN1ZqdFJYWldJTnJUUUJTNEFqUGFNbXBtMmgyMjVBRlNIbTRoeVErYk1h?=
 =?utf-8?B?eSt0am5jSCs0dWdHOWpuRUdUS3F6UlVwTmt6Sm1Gd1JPMWh0Wi92enpuMWtH?=
 =?utf-8?B?c2RPR1BteWI0MWwyZTBPY1k0SmJOMnVpeStPbFBham50eUNMdnhScU1nUmNZ?=
 =?utf-8?B?czJpTWlNTlZvbW9DYTdHK2hFZVZ0b0tsWGdtQTdxOGY5QzNUdVc2bjBZZHhm?=
 =?utf-8?B?aEN5NGo2QlJmeTZ2aU9rcDZEUTN6dVN1T3grNTZ2QTlGMDA5QlZVWUxaK1Uw?=
 =?utf-8?B?aEVyTFBGTkh6OXZEUEZTTm5FVDcxVmJEZXQ2dVBuVE13WmlvSTQwMmYvYjlX?=
 =?utf-8?B?TlVoc1ZMQ3ltVFRUa1oxYWFkUUZPOXp0bzJMclphUHhZUUJlOTFOUTg1ZDBv?=
 =?utf-8?B?UDlldllZRDQ2SkJxOXRsaUhpUXk1eE55cWpSWk90NXVGSFg3cU9INTEvZDhO?=
 =?utf-8?B?OUdKM29wdEM1aVJjVG01N09FUEpuSUxMSVBQODFEeVgzdEMvS0IwNlV4WEtN?=
 =?utf-8?B?Ukpta1JhV0RVT1hhUmZRZzhSV2d1ODgyWm1Oa2NTakxFejFCaXVIV1VPZ3RC?=
 =?utf-8?B?MitBZTJTTm0xaFVNd0k1Vld3LzBlQmdpbndTLzFLL0lMQjRMNTFUZ3RIQXcr?=
 =?utf-8?B?bk9aYU1nS2g3ZWQ2V2NLc0oxSEZ6Ny9VU2o4cEhUVmQ2ckJWWDVVK1lPdEc1?=
 =?utf-8?B?QjVsSnpTNGtuTnh2T25nL1QxNGdmTk9oWVRQTFFlbmpPdXlFZkhlTm44QjBr?=
 =?utf-8?B?VnU1VnNiOE9LcWs1S3MrR2dtWVJwSE1qUEx5NE5zT2ozRlpOSmJPUm5NdDMy?=
 =?utf-8?B?dlMyVmh3VjVIRVdvbzFFV0QzaER5WFZKOFBiTjlVemJRNlNuckhQYkhYTUNP?=
 =?utf-8?B?aG8rajFwY0ZSZ0w0dEtNRjBOcWFxWkdWRTBqaWR6MzFCWW9HMEtrNm9hNTFh?=
 =?utf-8?B?U2NHVERNS3VmMThpYTBlVTd3V29QTHpRQmtmNElPLzcwamVwUEsxR1cwUWVh?=
 =?utf-8?B?T0NxZ25Vd2FUUE1XTmxra1pSYkF6SHQ4WngwdkZPQU1kbzVPb1VGQlVDV2Zl?=
 =?utf-8?B?RUlRWjd0L2tuR2tnc01nZjZ0aDh1cENnL2N4ZEFZc2JXd2t0VFViU0pVZkxZ?=
 =?utf-8?B?RlNqTjUrN2IxZTVjMHhxTVF5NWVwTlZkQ3VpL0lNRXB1aEwyMGxmRG5jcUI3?=
 =?utf-8?B?ZUppK2ZIbDN6NVVJdTIxQmIxS3hTdzM2cyt6Y3hpZFVoaVpkSlRUdmFuL3pk?=
 =?utf-8?B?MU5wTmdRL3ZmaWdrWTl0bGdqS3k3dkdrZEdCd0RYYUJzOFlwckRxNWorVE5v?=
 =?utf-8?B?c3M0bmEwVDlmU1FxYVZFK3R2RkFBTDZ2eDVmTVJIenZUL29pMTlLTG5UL1Q0?=
 =?utf-8?B?NGdRNWc2VmF2YkFid211aEpSSzBjNEQwSmZlSzhUQzU4SE1rck9kakRFaHhH?=
 =?utf-8?B?VjE5OU5ycENiT05QQnlQNnFoYU9jWWVSQ08vVmovWUluNnlaWnVLWWYvVGlz?=
 =?utf-8?B?cUh1RnFqOGNHMHA5NWpNMFZkVElvRCs2Y3I0N0g1TEN2SWdId1ZYR3pBb3pr?=
 =?utf-8?B?TXdQODdzVnQ4TjNURUdHV0w0Q2xZdUZoRkIwQlM0aklWZllaaEJHTktWajlN?=
 =?utf-8?B?ZVN4bS9uT05yRGNPb0NnRGV4RUhSUkRMK3pJdnZodHVtTFJpdDFzRE1NUDFM?=
 =?utf-8?B?NTgxV3RrVW5yS0NRTldYcU9JbEowc2RTVEVnb0dPQTJWdnNoMnF3MytGUS9r?=
 =?utf-8?B?eW1QWGtLZFVIdVFTWTltWVN6UC8vOXdjWnlPcU9VYyttdW1EQUJCT3lRSDZw?=
 =?utf-8?Q?S7G0hUQVT2/hsTgcqK5AHRgp/GEGXfRCn7nct6Cbj4x/?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a41394-b5f4-4ade-b776-08de95644498
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 11:45:01.3117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB2203
X-OriginatorOrg: xes-inc.com
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[xes-inc.com,none];
	R_DKIM_ALLOW(-0.20)[xes-inc.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34904-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,proton.me];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[xes-inc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@xes-inc.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 4FE1F3C48F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tp
IDxiYXJ0b3N6LmdvbGFzemV3c2tpQG9zcy5xdWFsY29tbS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEFwcmlsIDcsIDIwMjYgNzo1MCBBTQ0KPiBUbzogTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5l
bC5vcmc+OyBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGtlcm5lbC5vcmc+Ow0KPiBLZW50IEdp
YnNvbiA8d2FydGhvZzYxOEBnbWFpbC5jb20+OyA0ZnFyIDw0ZnFyQHByb3Rvbi5tZT47IFZpbmNl
bnQNCj4gRmF6aW8gPHZmYXppb0B4ZXMtaW5jLmNvbT4NCj4gQ2M6IGxpbnV4LWdwaW9Admdlci5r
ZXJuZWwub3JnOyBCYXJ0b3N6IEdvbGFzemV3c2tpDQo+IDxiYXJ0b3N6LmdvbGFzemV3c2tpQG9z
cy5xdWFsY29tbS5jb20+DQo+IFN1YmplY3Q6IFtFeHRlcm5hbF0gLSBbUEFUQ0ggbGliZ3Bpb2Qg
MDAvMTRdIGxpYmdwaW9kOiBhc3NvcnRtZW50IG9mIGZpeGVzDQo+IA0KPiBUaGlzIHNlcmllcyBm
aXhlcyBhIG51bWJlciBvZiBidWdzIHJlcG9ydGVkIHRvIG15IGJ5IGEgcGVyc29uIGdvaW5nIGJ5
DQo+IDRmcXIgPDRmcXJAcHJvdG9uLm1lPi4gVGhlIHJlcG9ydCBzZWVtcyB0byBoYXZlIGJlZW4g
Z2VuZXJhdGVkIGF0IGxlYXN0DQo+IGluIHBhcnQgd2l0aCB0aGUgaGVscCBmcm9tIHNvbWUga2lu
ZCBvZiBhbiBBSSBhZ2VudCwgaG93ZXZlciB0aGUgcGVyc29uDQo+IGJlaGluZCBpdCBpcyBhbG1v
c3QgY2VydGFpbmx5IGEgaHVtYW4gKHRoZXNlIGFyZSBpbmRlZWQgd2VpcmQgdGltZXMgaWYNCj4g
SSBuZWVkIHRvIHNheSB0aGluZ3MgbGlrZSB0aGF0Li4uKS4NCj4gDQo+IFRoaXMgaW5jbHVkZXMg
c29tZSB1cmdlbnQgc2VjdXJpdHkgZml4ZXMgaW4gcHl0aG9uIGJpbmRpbmdzIGFuZCBhIHNsZXcg
b2YNCj4gY2hhbmdlcyBhZGRyZXNzaW5nIGxlc3Mgc2V2ZXJlIGJ1Z3MuDQoNClB5dGhvbiBjaGFu
Z2VzIGxvb2sgZ29vZC4gSSByYW4gdGhlIHRlc3RzIGZvciBhbGwgc3VwcG9ydGVkIFB5dGhvbiB2
ZXJzaW9ucyBhbmQgdGhleSBwYXNzZWQgWzBdLg0KDQpbMF06IGh0dHBzOi8vZ2l0aHViLmNvbS92
ZmF6aW8vbGliZ3Bpb2QvYWN0aW9ucy9ydW5zLzI0MTMzMTIyNzI2DQoNClRlc3RlZC1ieTogVmlu
Y2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29tPg0KUmV2aWV3ZWQtYnk6IFZpbmNlbnQgRmF6
aW8gPHZmYXppb0B4ZXMtaW5jLmNvbT4NCg0K

