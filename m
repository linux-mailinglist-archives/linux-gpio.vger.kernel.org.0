Return-Path: <linux-gpio+bounces-14925-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB450A158EC
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 22:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0676E3A1702
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 21:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437B71A83F1;
	Fri, 17 Jan 2025 21:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="04LN+55P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0041.outbound.protection.office365.us [23.103.209.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34A5187550
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2025 21:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737148693; cv=fail; b=BdpVOZAKo7zQiXAiRS5yTqt4JqEDZizk/52TbK/BwTk50uPwfV0SSoXENzivFNs5pfgfOrrarDLwHGNzcgDFNcm+MjHb4BZaQVlyASTWSB9PtkKj67xVg5/TI1LEAF5nSzhmt9LndwiNWoZapEhJc0FquqFHOY/7+DqNf6YMuT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737148693; c=relaxed/simple;
	bh=5xX3oeQkVuDt5Yz6DVwuzPsxCl11dBj2LH7vJoGisyM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jnd/UcIqXnNh+MNKHHyJ6oOjkf7gbYJrtSZt1zZs0uFj506xOWQSFz7iXsdRDNTbhvBeS5QGCq4Nj1QVf+py+hbasGyF+PY5kKQxcqZi1NZH3MWFWV3DCg/gRUgpZzv4mUyiEG7rkN4OrqFoF7AtdgJsGsIHSrfIhXJwRwp5H0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=04LN+55P; arc=fail smtp.client-ip=23.103.209.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=vdVvQ+UYJvMoHYCKuv0JmWtlz20jmnQmghrFJEl8ln7cGQlgBCeUuNlYflRLju6wscUufcZg8EaGeTqKT9uExnX/YqBEZLPgJZdgG//Vr/3gjvxwjExjnCV3nPGR/3RQeV3h2YH4IHmJfCbhOmFiK0LRo9DoZ2Kkcja2iPrNTBcypt03GD/fk+riwTURt1nhYk98DQVEeNJTHEu8sdfHZ6LalWX4/ZM3TGZ2bU6ar5Vx3uMqgfgkJeMQGaOT7zyoBDogzBFC+TJzXsrJfoWymEsgsGTdEYtsTB+U7x2Lk2j72X7OqL5n1bKohaRS725AZWnhJK0FeYADmNniSSvKBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xX3oeQkVuDt5Yz6DVwuzPsxCl11dBj2LH7vJoGisyM=;
 b=U1NoZN48YIk2icMke6K4h9fBlbnlYlFq9wluSqGSUlQSyK4G1CQGO7u8v7o5mIeOUMDp1laTjJF47Kem3PQWfOYYZ13ZG7mfq3+8SrpmqnXGzQcwvkAGM/g0QkZEe40Y4QYsSuOFEM4TaXUQtVK+mERYa7sG5fNdknLoVsDpfAWsFiF/loQuJ1M/o118tyxANsG8La5vMTrNcDIruz2wkBEONcNHVtsXxOmsOgW48D8raoRuhEgZVYo9hZaPUaYHGm4xSAHH4/y+puhyHw/EJXhRENBbSyE31ihB4M2Z42VUFytnb116sa2WGw2BdbPBwftoUdDaIDFkgi6lBODWFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xX3oeQkVuDt5Yz6DVwuzPsxCl11dBj2LH7vJoGisyM=;
 b=04LN+55PADeTN3qLhGtFDZCirGe2WFWJAbWAKMCpevHRxPkYrbaaipS8MlC35xPDlUTV0lJ9A+kHVGDyjIuDwU1n8yWsLJ4yHtCsc+8iZF+XeQ+sAxjuAW4R/WKYpkQcTt7Vp4+6iNxQ0iPCYuxDUqcmAqh9j4rHNnRWZk6o7eIq8Fs5OyDc6zWepjKfL+G/12P2OgBB3o74PPOkG1NiRSHvKwPTLQTnde+EwLRfN49MhTFOzHkQpfV7cJWU9khh3Ds0VxGU2AWOj+4BTBwVnga4Ansft/zEVsvwLDpOfAt7YnYHd+u39qAvtgAU8rC1cXHlEHVNYxoAMtTNuM0ong==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1017.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:175::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Fri, 17 Jan
 2025 17:47:02 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%6]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 17:47:02 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Kent Gibson <warthog618@gmail.com>, Linus Walleij
	<linus.walleij@linaro.org>, Erik Schilling <erik.schilling@linaro.org>, Phil
 Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH libgpiod v2 0/5] doc: improvements for ReadTheDocs
Thread-Topic: [PATCH libgpiod v2 0/5] doc: improvements for ReadTheDocs
Thread-Index: AdtpBv4MLXOGz20PRL2J2J74NYIg+w==
Date: Fri, 17 Jan 2025 17:47:02 +0000
Message-ID:
 <PH1P110MB1603A3460CE21EABE33D33E29F1BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1017:EE_
x-ms-office365-filtering-correlation-id: 78bbcef7-c8c6-45fd-feb3-08dd371ef330
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aVVtVkdoajFwRnVwTUdqY1NmTWJBdURuWXZxTGdHZnpmM3pFSE9JOWk2QTNU?=
 =?utf-8?B?LzNFQU1LalJ6cHFscEczOUVlY0UzREQ4cEptejU0K0NyWEZBazF0UFk1SEho?=
 =?utf-8?B?am5rM1NlZnBmdy9pcFlVei9MUXVUMnJ0OUFGWVN2R2hrMkxlNDk2Zm81bEti?=
 =?utf-8?B?MGhtT2VKOU15NlBHSkZBMHY4MXQ4ZUdERHgyNW9TSUNYSkpVNVQ3Y2Z6NEVF?=
 =?utf-8?B?dU8xeHNDeG9oSEhtRkJHMS9ZSzBTZFBnR1pOTE1Rc2RZaU9kQVFQVXhUWXVQ?=
 =?utf-8?B?QUdyL1p1ek9vbzdPN3VXK05MU0pzT29Ma3k1M2ZtM2lINXovWVUrUlZIRXEz?=
 =?utf-8?B?R0dmUURzbkdHdHcyM2F6YzEvSGsvK0xCZmllYlZCUTc2anZjR0pBNFhtVkI4?=
 =?utf-8?B?VHZLVjhlSHhLNWZ2ZGpBellXaHdoRWVtQWNCUVpyUDJWb3hoVmRaWHJEYTZW?=
 =?utf-8?B?MXNZNFdrbFZkbnNsVXFRL3FRVkovWmhpR215dHNVak15Qzl4bWFTN0pRZHVX?=
 =?utf-8?B?ZGpvV3U2Zyt6S1FkL2xwK20wVnZvZjJtMUYyTEtraEcvMnZoRjB3ZkxsS3Na?=
 =?utf-8?B?WDg1UEw4Zmo0VEovL2VJMVJqNDF1Yld1Tktzdm42Y2pJN2xxanN6UkhONTJ5?=
 =?utf-8?B?UG13Szh0SFg4eFFUMjJEaGt2b0FENzNZRjZIaFhhNU8wdmVTT2ExY1hJdjVn?=
 =?utf-8?B?dEZQaVcyN2ZxcVFJZVlTRDUzSnBUSHQvcDcyK2gzMC9rYUYzK2NQUkJsdXpR?=
 =?utf-8?B?TlhFSlg5WnIrb0NHeXhCZ1ZOQkZKMDQ5RHRHVTdwN0Z4VlRuTjc1Y1RPbWNE?=
 =?utf-8?B?MnJheXg3QUw3K0lQbWw0bmM4Ujk4Yk5JbFZMU1N4bWg3bzc4MitKQjJua2x1?=
 =?utf-8?B?VHgwSmg2NTc5S21BZFpia0crYkdNR1JTMkdwbDVCZ2hEWmNsSk9hU2IrbWNO?=
 =?utf-8?B?cmhLeWJwenJLcnp3OEt4Q3BuZ3ZsbTZwR2RpMi9TRHhYMTN1NFpldExRKzAw?=
 =?utf-8?B?VFU0b1hZOWdDUW04YTVPR2xzRXpYeWgxMWxxQ2pjak9sdUwyNkFzczBJdFk1?=
 =?utf-8?B?d0JNSDh1cXR6dk8vZXBvdS9jWGR6cTQrcGw2bW9tbkJkb0w2REpHZytzanBr?=
 =?utf-8?B?ZU9ZNDBOYlZFcmovMWdyRWRqT3lHdTl6dkVxdnowNklFcXM5NmdoNGdyMm9s?=
 =?utf-8?B?Tm9ROXNxem1IK1hRZVNiWnZqdE1JYUloQ2czdFpHZ3pGU0UzZEVzdXkyazdo?=
 =?utf-8?B?elpYZzliL1ZqcURrbmpuK0VhaCtsT2QveFlNbmhDRWZtYVFWQmVHWVNkejVo?=
 =?utf-8?B?MVZkT0NxTmh5cGVWS3lKQlgyMElUUWZlTE5mNnJSd0lrTmVnR3FybmNrR0Ex?=
 =?utf-8?B?TnRWY0xHZ3RRT1BnRHEvZHJCa2hyNDVLV2ZRZkZXdTB5aEh5emFFclpSczc5?=
 =?utf-8?B?U0F3Z21wSlQycVFBK2lyUGI0b21OUlhZS2ZjN0M0UmxvS09vMGRTY2lYOUlo?=
 =?utf-8?B?d0xGejRoV2h1dkNtd2xEWkhQL0xVTkFrUUMwMmpMTWsxYnp5MFV3ODBJZVNG?=
 =?utf-8?B?akNPa24rTjBxMGFNbWVsZmIxeVQxOVNEdDI4aUpSaCtYeXFGalJ6WmJMU09p?=
 =?utf-8?B?YlVsNnpQSW5JdG1HTUkreW5DV096YlFXenhYRGNyV0FrVktHVXo1K2NXMWZB?=
 =?utf-8?B?MStLenpWUGlXL0liZ01tMHZ2M1RubkZTdnNYS1E1RjFEN0V6VTZ1ckU1MHlM?=
 =?utf-8?B?M3ROa0pZT1pwd3BKWkR1OGlCQnVtTHhtaTI0blRXblBNSlcrcHcwc3h6Z25x?=
 =?utf-8?B?ZlZ4MFNCd0ZRWFk3dUlWQzlGUFRhdHo0OXp0cFVtakJNbVF1V3gwMTNTRXRt?=
 =?utf-8?Q?XnDqveRWR3NYQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dmdYdUV5U0FNSUZ0bXpBRk9Na0JwZnZjM3VSR05BTEtJV2YwUi9uZ2dQS1BX?=
 =?utf-8?B?dXhUV2xpanFvenRLdEc0OE5LOE5PcDdhemQyQkJQWlAxQloxUlBOcWtaRWdi?=
 =?utf-8?B?NUtmMnNhajk4S3YyNVhIcWlxak1EOGZnVW5hTmhRUG9QVDVZZUVmWWpPWW5B?=
 =?utf-8?B?RnV6ZWFPbUZxOUkxakJCUzEwV0VZb2FPMC9sbTRqSTlyeVJpb3Q2Ky82RElp?=
 =?utf-8?B?Y3VJQmMwUURKQ0ptTkYvWHVFbVR3QzZzOVgzQnp2OUd0YTA5eGtkL3dhTnZi?=
 =?utf-8?B?Slg3V3VIWlduUklhMS9TRUFUU0gvVXpXVVE3MldKZkJrU0hNY0hvR0VOKzVq?=
 =?utf-8?B?UVl6endiRFhqRkZTaExpZ2tsVW9WS0FzOC9NMUQ0VHpRbE4vbWdldG9GYVVK?=
 =?utf-8?B?dmVDZWwzL3dEd0xaQ0dpMzdCc2NSbmVodEtVb3dPVEs4SGswMSt0L2sxOWtF?=
 =?utf-8?B?bThRTU81RU5Vd2ZPRGFlZ2hoSG11NWQxaE4rQ1dpNjR2a3lORG00Y3BJSlJT?=
 =?utf-8?B?dUZPaEpKZWNuSlpQUzZBRm0vT0NYSHZUclpGaklzRlZuVjZPZmJiNWFWT2dq?=
 =?utf-8?B?aXRkQU9ubVFlOHJoSlZyUjRvTU1KdmtvQ3Q0RU9qYnZMeGxGaENvOHl1MkRz?=
 =?utf-8?B?TTZDT3ZMc2RHb0xLcjFFTEk0bmtMWlNVQ2Jyamt0VzUzZ2E1cmprV3FLcUtL?=
 =?utf-8?B?SUlrdG1qOGFFeVdsOER0eTBTYUVBMVZlYW9PZUp1NjBOWVlZbGpic1lvcEIw?=
 =?utf-8?B?eVE4VjR3VW1vQ3lrekVMeU81KzNaZmZXSGVmK1cyNHpyU1UyMEU3OXQ1a1Rk?=
 =?utf-8?B?UEErbnNsL1p3VTFUTlVWOUtPb3laTHFQUElvbUdMUWJlR2lPWFdUcm8welRQ?=
 =?utf-8?B?R21xL0xwWVFUbTU1ZE5ZNDV4QWE4Y1lrUmJ2em00QVBySEZNV2E5b3FCL0hF?=
 =?utf-8?B?OHJxMGtteDFSbVVxTG9CbG1MRk9DbFgzandPeEF6NUZkdytUZTRGc2xENkxo?=
 =?utf-8?B?Qy85ZkVET0QvWnlQLy9xUmlVTXpxdDlYamdML0doTDlXRUtadm4yaGZCM01l?=
 =?utf-8?B?R0ZrSVFXdU9DWlVOT3ZESGZBNTAzTGFBMjVIZXA3QnhkbUNaaU9hTWZURDRQ?=
 =?utf-8?B?S2s4L1o5ZjRnTjdwL1UrbUhpR05lVmVHWjExSEoyQXJ3b1dHWE9wbjB5TUpI?=
 =?utf-8?B?cEVpcEpZWktNZEgxTGxDRmNDRWJvT21ucm4zWXNSeWFWMkhBeUZzcEMyMjRD?=
 =?utf-8?B?QmcyUDlqU1JFU3I2T0VlVmFEMktPRWxXeElkVFYzZkpJcmtsd0ltZ3VLanAx?=
 =?utf-8?B?cmxPVFlZRzJnajBzR002R2pUaCtJTWRXQ1NHeWQ3RkN5VGFGTy9qcVhqWHhj?=
 =?utf-8?B?MUxQbUl0azhFVUI0Mjk4d3JIUWRTdXJGcXVBL3oyTFV5dWsvM1FFRXpVWDJ4?=
 =?utf-8?B?MGlEaW85MWdnZVdBWkI5RU9DR01qZ051eWRWZzAxaVlvb0hFdDRkREhvUVF6?=
 =?utf-8?B?UTRNOFJWVFg1QTRJNjA4RWNDK0lwQytTOVhvYjdqQWFRdDlMY3hFVWRyMmI2?=
 =?utf-8?B?Zjg3SXdOYkJEOWl0TEkvTW9TTzdVNVcydTMvRWtUNjBNdUxSVEw2bG94SnZH?=
 =?utf-8?B?aHk1RDB0UzM0MGFtTGNjVHJqWlo3dDlSMEs3NE41Qm85T0d1SkJEZHlva2hD?=
 =?utf-8?B?TWxzMjE5Q1dFYzQ3cWdHMDNXbXNtN0tscFJOT09STmpRWG05VzJZZDF4dy9S?=
 =?utf-8?B?TG9DQzNzVkYxMXY2RUpnNlB0OFdhc2JOazFOY2dBc0dNdFU5NVM2N0Nwd0Q3?=
 =?utf-8?B?RExmaFBaY0loQmhFckYvWXJQWXhjcHBudXpIODhBRHA5NEtZSVdaVWgrWUth?=
 =?utf-8?B?emZtTWQyaFNwK0NjS3RCYXpoQUd3a2VkTTlHOHp3UGhQNVR3M0JHWUN6dngw?=
 =?utf-8?B?emZmUTVnSjRRSTNPdHpQNHJVNkEybllvMTZ6Y0FpY2d2b2hvWVZsZUxKMEhN?=
 =?utf-8?Q?E0pF/pzKZgPwECajc2XiuUn/FPK9SI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 78bbcef7-c8c6-45fd-feb3-08dd371ef330
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2025 17:47:02.4905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1017

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDEwLCAyMDI1IDk6
NTggQU0NCj4gVG86IFZpbmNlbnQgRmF6aW8gPHZmYXppb0B4ZXMtaW5jLmNvbT4NCj4gQ2M6IEtl
bnQgR2lic29uIDx3YXJ0aG9nNjE4QGdtYWlsLmNvbT47IExpbnVzIFdhbGxlaWoNCj4gPGxpbnVz
LndhbGxlaWpAbGluYXJvLm9yZz47IEVyaWsgU2NoaWxsaW5nIDxlcmlrLnNjaGlsbGluZ0BsaW5h
cm8ub3JnPjsgUGhpbA0KPiBIb3dhcmQgPHBoaWxAZ2FkZ2V0b2lkLmNvbT47IFZpcmVzaCBLdW1h
ciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+Ow0KPiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0
b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+OyBsaW51eC0NCj4gZ3Bpb0B2Z2VyLmtlcm5lbC5v
cmcNCj4gU3ViamVjdDogW0V4dGVybmFsXSAtIFJlOiBbUEFUQ0ggbGliZ3Bpb2QgdjIgMC81XSBk
b2M6IGltcHJvdmVtZW50cyBmb3INCj4gUmVhZFRoZURvY3MNCj4gDQo+IE9uIE1vbiwgRGVjIDIz
LCAyMDI0IGF0IDM6MjjigK9QTSBWaW5jZW50IEZhemlvIDx2ZmF6aW9AeGVzLWluYy5jb20+IHdy
b3RlOg0KPiA+DQo+ID4NCj4gPiBJcyB0aGlzIGh0dHBzOi8vbGliZ3Bpb2QucmVhZHRoZWRvY3Mu
aW8vZW4vbGF0ZXN0LyA/DQo+ID4NCj4gDQo+IFllcywgSSBrZWVwIHRoZSBXaVAgcHVibGljIG9u
IHJlYWR0aGVkb2NzLiBJdCdzIGNoYW5nZWQgcXVpdGUgYSBiaXQgcmVjZW50bHksDQo+IHBsZWFz
ZSAocmUpdGFrZSBhIGxvb2suDQo+IA0KPiA+IFRoZXNlIGxvb2sgcmVhbGx5IGdvb2QhDQo+ID4N
Cj4gPiBUaGVyZSBhcmUgb25seSBhIGZldyB0aGluZ3MgdGhhdCBzdGFuZCBvdXQsIGJ1dCBJIGhh
dmUgcHJhY3RpY2FsbHkgemVybw0KPiBleHBlcmllbmNlIHdpdGggc3BoaW54LCBzbyBkb24ndCBr
bm93IGlmIHRoZXNlIGNhbiBiZSBhZGRyZXNzZWQgb3Igbm90Og0KPiA+DQo+IA0KPiBZZWFoLCBJ
J20gbm90IGFuIGV4cGVydCBlaXRoZXIgc28gSSB3YW50IHRoZXNlIGRvY3MgdG8gYXQgbGVhc3Qg
YmUgZ29vZCBlbm91Z2guDQoNCkkgY2VydGFpbmx5IHRoaW5rIHRoZXNlIGFyZSBnb29kIGVub3Vn
aCBmb3Igbm93Lg0KDQo+IA0KPiA+ICogQ2xhc3MgX19pbml0X18gZnVuY3Rpb25zIGFyZSByZXNv
bHZpbmcgRW51bXMgYmFjayB0byB0aGUgYmFzZSBgX2V4dGAgdmFsdWVzDQo+IGFuZCBJIGRvbid0
IHRoaW5rIHdlIHdhbnQgdG8gcHVibGljbHkgcmVmZXJlbmNlIHRoYXQgcHJpdmF0ZSBtb2R1bGUg
KHNlZQ0KPiBMaW5lU2V0dGluZ3MpLg0KPiA+DQo+ID4gKiBFbnVtIF9faW5pdF9fIGZ1bmN0aW9u
IHNpZ25hdHVyZXMgbG9vayByYXcuIEkgc3VwcG9zZSBJIHdhcyBleHBlY3RpbmcNCj4gc29tZXRo
aW5nIGxpa2UNCj4gaHR0cHM6Ly93ZWJzb2NrZXRzLnJlYWR0aGVkb2NzLmlvL2VuL3N0YWJsZS9y
ZWZlcmVuY2Uvc2Fuc2lvL2NvbW1vbi5odG1sDQo+ICN3ZWJzb2NrZXRzLnByb3RvY29sLlN0YXRl
IGJ1dCBtYXliZSB0aGF0J3MgYmVjYXVzZSB3ZSBkb24ndCB1c2UNCj4gYEludEVudW1gPw0KPiA+
DQo+IA0KPiBUaGVzZSBzaG91bGQgYmUgZml4ZWQgbm93Pw0KDQpJIHRoaW5rIHRoZXNlIGFyZSBn
b29kLCB3ZSBjYW4gYWx3YXlzIHJldmlzaXQNCg0KPiANCj4gPiAqIFdlJ3JlIGRvY3VtZW50aW5n
IHRoZSBgTGluZVJlcXVlc3RgIGNvbnN0cnVjdG9yLiBJZGVhbGx5IHVzZXJzIGRvbid0DQo+IG1h
bnVhbGx5IGNvbnN0cnVjdCBgTGluZVJlcXVlc3RgIG9iamVjdHMuIFRoZSBfX2luaXRfXyBkb2Nz
dHJpbmcgc2F5cyAiRE9OJ1QNCj4gVVNFIiBmb3IgdGhpcyByZWFzb24gYnV0IHRoZSBjbGFzcydz
IGRvY3N0cmluZyBpcyBiZWluZyB1c2VkIGluIHRoZSBnZW5lcmF0ZWQNCj4gZG9jcyBhbmQgZG9l
cyBub3QgaGF2ZSB0aGlzIHdhcm5pbmcuDQo+ID4NCj4gDQo+IEkgYWRkZWQgYSB0d2VhayB0byBp
bmNsdWRlIF9faW5pdF9fKCkgYW5kIGl0cyBkb2NzdHJpbmcgaW4gLnJzdC4NCg0KU2VlbXMgbGlr
ZSB0aGlzIGFmZmVjdGVkIGFsbCBjbGFzc2VzLCBidXQgYXQgbGVhc3QgdGhlIHdhcm5pbmcgaXMg
dGhlcmUgbm93IHdoaWNoIGlzIHRoZSBpbXBvcnRhbnQgYml0Lg0KDQo+IA0KPiA+ICogSXMgdGhl
cmUgYSB3YXkgdG8gZ2VuZXJhdGUgbGlua3MgdG8gdGhlIHNvdXJjZSBjb2RlIGZvciB0aGUNCj4g
Y2xhc3Nlcy9tZXRob2RzICh0aGUgd2Vic29ja2V0cyBkb2NzIGRvIHRoaXMpPw0KPiA+DQo+IA0K
PiBVZ2gsIEkgZG9uJ3Qga25vdywgSSBzcGVudCBhIGNvdXBsZSBtaW51dGVzIGxvb2tpbmcgZm9y
IGFuc3dlcnMgYW5kIG5vbmUgYXJlDQo+IHN0cmFpZ2h0Zm9yd2FyZCBzbyBJJ2xsIHNraXAgdGhp
cyBvbmUgZm9yIG5vdy4NCg0KQWdyZWVkLCBJIHRoaW5rIHdlIGNhbiBmb2xsb3cgdXAgb24gdGhp
cyBsYXRlci4NCg0KSSB0aGluayBpdCdzIGRvbmUgdmlhIGh0dHBzOi8vd3d3LnNwaGlueC1kb2Mu
b3JnL2VuL21hc3Rlci91c2FnZS9leHRlbnNpb25zL2xpbmtjb2RlLmh0bWwNCg0KWW91J2xsIHNl
ZSB3ZWJzb2NrZXRzIGhhcyB0aGlzIGRlZmluZWQ6DQpodHRwczovL2dpdGh1Yi5jb20vcHl0aG9u
LXdlYnNvY2tldHMvd2Vic29ja2V0cy9ibG9iL21haW4vZG9jcy9jb25mLnB5I0wxMDINCg0KSXQn
cyBkZWZpbml0ZWx5IGEgY29udmVuaWVuY2UgdGhpbmcsIG5vdCBhIHJlcXVpcmVtZW50IElNTy4N
Cg0KLVZpbmNlbnQNCg0K

