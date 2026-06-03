Return-Path: <linux-gpio+bounces-37894-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6SUxGIQjIGpTwwAAu9opvQ
	(envelope-from <linux-gpio+bounces-37894-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 14:52:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5081D637B3B
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 14:52:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xes-inc.com header.s=selector1 header.b=QKgHEGGx;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37894-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37894-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=xes-inc.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81C5F301E3E9
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 12:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47D947DF90;
	Wed,  3 Jun 2026 12:40:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-BN3-obe.outbound.protection.office365.us (mail-bn3usg02on0059.outbound.protection.office365.us [23.103.208.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3024E466B58
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jun 2026 12:40:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780490414; cv=fail; b=YhI4Glnye4bZJV8jNX9OUNAi2XmpoN7yXIse0wKMIIxJFxg+70wODk1Uqx/zVzojLNzF0mWwYx8fNBO2znqdaXp3/+0R4GAj0FuGKGCjUxVOdvdPeLUqbxsJBYAh4XkqtmyksCJKOaKRi0pc9Bze5o0F+DxfBUWIvpoy8dOiAoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780490414; c=relaxed/simple;
	bh=Z3NF+ijEboYuOsK8bwb7vU8OZ2Aoq7pL2FOxnPNrODc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O7r9Vh3d/H+/J7uM7/N+MZP8LbPeDe8Rsjy+OjNHU8xtv99H1DtuGqKeUW+0YlQeu1OIXCANZjYfNrM2/D8cV0VgOGLpJiX52UrNPHtg/JkPVSltqVeUIgAvniH7Te5fbVRpEMi3gy2hznHKXxVSJMOyMW84DireyxUMZO7IGO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=QKgHEGGx; arc=fail smtp.client-ip=23.103.208.59
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=zyFKn4zN6l27G8ZqLbQDqRm3WXEq8tTfk7/LT2spqqmCT/PqbaIkusG11C/zFV8MG6dtkS2dYcelss98s8mr3wEOPuDK+17qtavkeiO2XYpJN2sYqBO0aoYFJtEMJegcJvepMzL5iW9wZAKM4N6GdkOjPwLP7GI9oIBQGhnzGH1JBzDjNIZQB6qbGkG/M6GxqM0L0oZ6VET90L1GNeBuBbWnZHU+ABgyWhKO501UI8bphA7N3N1iPErAat5+3rjPDFKxZF04sd7ENwmfcvhK9peR7wQ8zOf9zwxkZ7FtiCwrsqSBsPb3c74lL+ihp9Qw6LHNZW5lXudLr0gtQrrRAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3NF+ijEboYuOsK8bwb7vU8OZ2Aoq7pL2FOxnPNrODc=;
 b=u2WcaT6EW4oYrrqkpIhbx5BbN4Y131+GP0CX/+FeuE4vxmbHzAKIfOBU+2pfmjh1TWQRyzsnO0eZdLyR0k1TNr0OU0jH8bQVemC6jNeXI6hnN9k8jnb/1MzsFVhDM8bQPgwq8lkUEb4W5GsrVpLjKxBK/C8VJN8iG103wKyYVfVkuZcWQMeKc01weSqTtlrL184r6z9CETI22U8aIxsE+nTOBTFHA4l7zDXHRng7PIpHFO3tuViTR0UbFNAv3joZvwOn8QFyeFcYbZlRRfvAfhu7i0Mdvfg0JHH77rjNIH+zOYdtVREmwdEJCeA9IYhGavjUIHclkJNJnMZURj3JnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3NF+ijEboYuOsK8bwb7vU8OZ2Aoq7pL2FOxnPNrODc=;
 b=QKgHEGGx0pHc6elLhv391mI6rASy0mHYmrbS9On867WAxxAa78DpEpiXY6jJJKBVNZydGRsZg/UYcAgJeL6aW8lmdoi3DIUzr0nEHxtOg6czyyvlzBhKdbZl7e25zgO/6+xZdlcX6hukJFGh853oaPOICQFwbQzdD6wXEtPmxcPYCEG/IuBQ0oYSb2LZ4N8Jt6msLcXge1sVKGy9CRwJiq4NTMmJNASIklc5mPuDo4la+0zfkpMNCzg6iuH8wBT3td38w/qvE0aj8B0lQTYnTt2XJXJV/cjvg4iclg/Sbb4spHDkc1I7Bfv1gHyLTup+i1SjoNQFcaZgQC0D+dZvyg==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by SA1P110MB2572.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 12:24:07 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 12:24:07 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Kent Gibson
	<warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>, Viresh Kumar
	<viresh.kumar@linaro.org>, Linus Walleij <linusw@kernel.org>
CC: "brgl@kernel.org" <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: RE: [PATCH 0/9] treewide: an assortment of pre-2.3 release fixes
Thread-Topic: [PATCH 0/9] treewide: an assortment of pre-2.3 release fixes
Thread-Index: AQHc81PfgMkctvimeE2ejkcI98UGfg==
Date: Wed, 3 Jun 2026 12:24:07 +0000
Message-ID:
 <PH1P110MB1603AEF37FA8BDDCBB7092AA9F13A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
In-Reply-To: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|SA1P110MB2572:EE_
x-ms-office365-filtering-correlation-id: 18dc5e96-b82a-4856-b139-08dec16b0229
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|41320700013|38070700021|56012099006|18002099003|22082099003|55112099003;
x-microsoft-antispam-message-info:
 +GJGcpVAUn7F4AWvGrvelUg/xqIK4FdgWmE8hz98gKU7bZiyI7Q65AH0n2ByTjtm+oTK4MEPLmFYPWn/zkuNvEHYORcKhCQFAD/8x0lQlrEEydD7+0TbYd7seIlynd1bgOs9JPafrWpOXcF73eMEJCN0DqzHaS89pq3ikfALEjvDnTQppneAcDF05Y5FbhetkCAMX4UatxyGNg+GnNSyUu4xylrWQmED+zaqTFstZS4W/14eVNPpRx/DQp4pQyf2JtCOktAbkoGbWBIsO9uniTEedkVf8nLA1PJ+wtTBokhcVhILshU4teFf0vxXlMeuRPiokQ9sEUoRIZ+fTweQsdCAaQuUx8YS3ViloNoq2o8gq/TOm1AYuFQKvR54lI5UVp1HkUmY14Afxiv5IMi2QauuxL+D58GKDOwdygk3ybOwAZYgt7TcTMD5FFwp+c3SkNFR5/fEFIHVd1HWN0XhKhl7Gx/oHBIH4f/b47ejz7ZGZBik9gsSXbkHVA5DWl283OoqM4O9IXf/JhTjGAQtr08P7BZtBN18P7coLGnQM+ehi0pKDNSJpoxmjWgvW9hMvwDrYXNGdRMk9iJsBynKihu1M7MvT5UxTp9nni4msNVWsdyAnCEaJ1fxDp9MKP0pZUvH3nQztcRSJ+rO3YKiwERK4xJC2Od/2EZ1tWY2QfdIm/33D9uWGuGmRntyDS3QJFlQqdjNFfJx/xo0uRTgQREmUuIVN/kOXliH9NV+L+V3TXhH6NcXKLexbrEuQLu3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(41320700013)(38070700021)(56012099006)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eXd3ZmJjVFpjWTU5T0F4bnBFSlFwNUFLZjlKbGM0blpjVTFRd3d3Z0p5TlNj?=
 =?utf-8?B?S0l1eHo0UlN6SnFOcHhyWWk2MWErWmt1UGM3aVhKQ1hxQ0dKZmFNbEtUbjNJ?=
 =?utf-8?B?Nk1jTmt5RG4rcWhOMkhtV0lqNkllZjdKWUI0S2lvZitud1lsVEF5STdxUVVz?=
 =?utf-8?B?YTV1TnV4bGhIQXBRaERlalE5aTZjTzBTTEFYWmZQRzVnSkNRTVBrLzlERlow?=
 =?utf-8?B?WE92NGx0dnNkV0J1M0UvWi95bTNNOURoZDAwTnl2NlE5MUxFSTFIRDVsMHRq?=
 =?utf-8?B?eXFjS3RZZjRiOThIRXpHaGlrc2x5ZldEbFg2Q2lPcnA1WUtMOEJVdXg3RElN?=
 =?utf-8?B?YVBrWnNUdGNsdXBlQncyWjhCVjBUeG92STlSUEFqL09yM2ZNR0Y5NkQ2V0tj?=
 =?utf-8?B?NDFmNkkxbHZEWFZ6dHd0VnhrV2xSMEx1YjJBZVg3cDRaays4M0RDQlBHVVhK?=
 =?utf-8?B?UHVnYU95Y0hJK0VXSGhXNUhjL21ySmVET2ZaWHliRFk4SWxYOFJnYlNiNzJT?=
 =?utf-8?B?UWVJNy9tWXcySHkwa3JFdENySnNkZC9jWk51eUdIMGNyMUh3ZDBvMVZ0ZWgz?=
 =?utf-8?B?N1JQZHdnY3hGcWJISGRBTEZBRlV3a2JyUnNnMExuUk5ZS1VZZ3o5d0ozWWpV?=
 =?utf-8?B?d3AyUExDaGk2QklFdno4K1gyZTVVK0VqUi9Ld29xMWdZd0dUWHdERVZiUnVG?=
 =?utf-8?B?Z1dKZEkwT3F4K1dERUlaRGd4RHVzdmRxNm9lRkZWZU9XMDYyR29jWFBsdXNP?=
 =?utf-8?B?M2ZPWGErTUY2MDlJUDNVNFJnY1BOUDBNM0FWWUN1ZmE5RlRpa21yR1FVcjdJ?=
 =?utf-8?B?WkxoT3kvUmJpS2JhaXJlT0VWMnFhUEVTVWFaYXMwazQ0cWRIRTZ1Z3VZZ0VT?=
 =?utf-8?B?eTk5Q2gvS0xneDNCN3F4Ym9lTk5RcndDaHlBbllhN3p0T1BkNnBVYm5jYi9h?=
 =?utf-8?B?VGQzcit4cW9XMFRsZnFiNUoxMzJoWUZPYnRpNmo5bU1vMlJGUTV3TmxDSlFY?=
 =?utf-8?B?aUJNVFdxbUFXemcwd2VidXpaVENSUWFQcWxIdUVZcm5yU09PUGdNc1ROOTJp?=
 =?utf-8?B?SnE4Nlp3dWd3QURHTGZZeHVrMTR3MzBiUkJBeDdobHo5VjlBRkFXakkyTlRV?=
 =?utf-8?B?ZWl6WlZkVlVybURUUk03UXJWOEpxTjBUUUV2NTNmZWJ0VTM3WThyQWEvNkoy?=
 =?utf-8?B?Sys2S2l2S1psM1NPOElkSTVXYkNleFNpMFUxRlR3TlRWcTZodnI1dkFrbEQy?=
 =?utf-8?B?U1J5R3JhQzBPSElKQnE3QjBZZmdRYzZxM2sxQm5yT1BKcE5lOXk4c2NOaDJ6?=
 =?utf-8?B?dFhxMzJKaEdSQlBVQkZLNzlabzBPODN3eVpFelUvQmJuRlV4TGlIMDI1LytR?=
 =?utf-8?B?Rm1ERUtSeXhMNDFTdTJGeCt1ai9MMG5GTFN0eDRZcURrTHU2bWZDMlhCQjFQ?=
 =?utf-8?B?MUN3QlZZVkxQUDU1ZFpuclpvckpaZFIvTHVVZHA1NkFMNkNIcklheEZ0VlJ4?=
 =?utf-8?B?TWp3cTE4MUV2VGdtWEJPTVpyMGtwckNzZEZ6UFJ6ZkFyeU5VTEhGQlk5dElz?=
 =?utf-8?B?Qlg0cTdjYUtIa0czMFdFYXQ1VUwzVm94cURRQmU0NFJWb1FuR0NsY2k3bDNC?=
 =?utf-8?B?em45UElGcEdBUWlUbkN1cURucS9pVkVXOHQxSUtJQWloS2l0aldiL2ZOR3hl?=
 =?utf-8?B?bnlyZ2gzc0xXNXhFNWJ3WDJaSDRoZ2dSU0tLbGhDUzl4RExRVzB0SUVxcTFL?=
 =?utf-8?B?SHNtSFFiamd4VUlPLzVPM1U0SHdkUjVTdmk2Q0tZdnVHRFpYNVBSZUNMRTYv?=
 =?utf-8?B?RWdnTGZaWkg5ak1FWkVOMWh2enc5aGZhM3pxUGVSNDVOa3NjU0ducWRMSm96?=
 =?utf-8?B?NDNHemo2R0VEWFY3N2g0OWhxWTAzQjlpYW91M0VOclVCTldSd1AzWlZuU2VH?=
 =?utf-8?B?VDRycENNTGlpeERDRXNHb2RkSHROdmlFT3F1QjBGQnJQMmR0dGkvRmxhSzBP?=
 =?utf-8?B?UTdua3Y3SHBzbC9TdWV6U3YvOTFYcndwVGJtOEIwMFlnT29Rbk4rSTkwWDRy?=
 =?utf-8?B?Q1dZUXN6cXdMT1NOd0NObUxUM2daVDRYWFFQNUJGRGNUSWxraHNxQjltVGxH?=
 =?utf-8?B?am5xQ2pmYVF2Q1ZQYjJ0ZC9MNnVnMmxlNmo0T1UxY2h3UzdvSUF1elNlUzVY?=
 =?utf-8?Q?VXyTVLiDDHLD0pH1ZydIF1FT+QE98y0D7brLdjzifUGA?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 18dc5e96-b82a-4856-b139-08dec16b0229
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 12:24:07.4817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB2572
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[xes-inc.com,none];
	R_DKIM_ALLOW(-0.20)[xes-inc.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37894-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,riscstar.com,linaro.org,kernel.org];
	FORGED_SENDER(0.00)[vfazio@xes-inc.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[xes-inc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@xes-inc.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,vger.kernel.org:from_smtp,qualcomm.com:email,xes-inc.com:dkim,xes-inc.com:from_mime,xes-inc.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5081D637B3B

DQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCYXJ0b3N6IEdvbGFz
emV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQG9zcy5xdWFsY29tbS5jb20+DQo+IFNlbnQ6IFR1
ZXNkYXksIEp1bmUgMiwgMjAyNiAyOjM3IEFNDQo+IFRvOiBLZW50IEdpYnNvbiA8d2FydGhvZzYx
OEBnbWFpbC5jb20+OyBFcmlrIFdpZXJpY2ggPGVyaWtAcmlzY3N0YXIuY29tPjsNCj4gVmlyZXNo
IEt1bWFyIDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz47IFZpbmNlbnQgRmF6aW8gPHZmYXppb0B4
ZXMtDQo+IGluYy5jb20+OyBMaW51cyBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9yZz4NCj4gQ2M6
IGJyZ2xAa2VybmVsLm9yZzsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IEJhcnRvc3ogR29s
YXN6ZXdza2kNCj4gPGJhcnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4NCj4gU3Vi
amVjdDogW1BBVENIIDAvOV0gdHJlZXdpZGU6IGFuIGFzc29ydG1lbnQgb2YgcHJlLTIuMyByZWxl
YXNlDQo+IGZpeGVzDQo+IA0KPiBJJ20gcHJlcGFyaW5nIHRvIGRvIHRoZSB2Mi4zIHJlbGVhc2Ug
YW5kIGRlY2lkZWQgdG8gbGV0IENsYXVkZSB0byBsb29rDQo+IGZvciBpc3N1ZXMuIEl0IGZvdW5k
IHNvbWUgaW50ZXJlc3Rpbmcgb25lcyBzbyBJIGFsc28gbGV0IGl0IGZpeCB0aGVtLg0KPiBIZXJl
J3MgYW4gYXNzb3J0bWVudCBvZiBBSS1hc3Npc3RlZCBmaXhlcyB3aXRoIG15IG92ZXJzaWdodCBv
ZiBjb3Vyc2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpDQo+IDxi
YXJ0b3N6LmdvbGFzemV3c2tpQG9zcy5xdWFsY29tbS5jb20+DQoNCkNoYW5nZXMgbWFrZSBzZW5z
ZSBhbmQgbG9vayBPSyBpbiBteSBub24tZXhwZXJ0IG9waW5pb24uDQoNCkFja2VkLWJ5OiBWaW5j
ZW50IEZhemlvIDx2ZmF6aW9AeGVzLWluYy5jb20+DQoNCg==

