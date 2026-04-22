Return-Path: <linux-gpio+bounces-35380-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLojOt6T6WkreAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35380-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 05:37:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0023844C8B0
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 05:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8EC9130414BF
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 03:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E253C73F7;
	Thu, 23 Apr 2026 03:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="HrRH9w5i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-BN3-obe.outbound.protection.office365.us (mail-bn3usg02on0075.outbound.protection.office365.us [23.103.208.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F37263C7F
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 03:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.208.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776915297; cv=fail; b=Mx7XXtcn3QT4rWT14WMx9TSbYxai6RfLJz1F7l59J2hlrw/SSeB93aovjI6TDcggSivqJF04oniu8In4Bu+qkio1aDb9QBkFSVf5SoFCHiITgMmEgTXUFgc8PEBxAMyn4sIBrWbjIWMt2nJsskW9xPqc0qDasINhfATtnI5bpqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776915297; c=relaxed/simple;
	bh=fSlLy/bPY0De307szAPax5RMGIqBt7SNR4tS96IR/hY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fgmFuK7ea6vpAVvRcZsdKNh6k5DlgBsXW/+UEeISMjVKq9KRim0Jy/nHvFmvvrv1t4QIQ5YiKpkatL0y8HmXYXg0EnWg80WthtGGhN5kUIfgWyYR9WzdYrEup+pgHxRm3xPWnClV2tMOe/tpH4XWsFGtqxE4RRoGXuq2Tgxfutc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=HrRH9w5i; arc=fail smtp.client-ip=23.103.208.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from BN2P110MB1624.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17e::15)
 by SA1P110MB2074.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:166::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.55; Thu, 23 Apr
 2026 01:03:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=txssgAQYeEz1tVC7cETzLGXIjrZuHqlFjDioxb7BI2a9Q1nhBENaNG94EcesPaRE2kefjAVoOBhnjEj2lolYxG+pKbml2Wa8lY2KsoRKL1XteHWG8KwA4ByGiG+8WtwPPekVELhm9iwZ1MRUwe9QvmIDyfkLhomGRM6ZzWPGEU2+XP1BvgKqZXTfDyqB+YfhspG+0ROUFjsrmuZ6CAiHqUy2PTPTPPOxbvARKePHA/NOXNcY8+2cF3lUlmhGNuoXhhcoYh59GdnS/qDp9kbqfQzBEKYh42f9FqNE8PE0a8+7nHiabHatiorFXFhV9OuQs4ZpXSwsStdFVdcPzIn/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSlLy/bPY0De307szAPax5RMGIqBt7SNR4tS96IR/hY=;
 b=eNLe/xa1HNf5Z/XN4nBlIJPFO4BLZIiTsHND+Ek49a2NRhKwPdP/t15Cog2O5sys1cZTvwuwhMzmv6Wcu/8pwcOp5Z0ihMLxYmpcGZofYnmOudCV8f24fveU9yFhtgPsb2T5ON994T1ZPf3B4KMZGH0XGdMIXqjbkS/T3zsCSDeVHl1+ECFM6ecYBn7RdQCnk8cRiuP1PkDejnpEKZGW6Q79sjLRVSVvaYqGh/t0lFRvCec+t2Yy0A5ovT9AAAIYPnStH3xctYRk7ZI1CPyhrVJv6gUGIHb90rR2xRV6Jz4Lvb0l36kvFF2JK75xjoCXlNmnD07oHhhGS0LtUljsRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSlLy/bPY0De307szAPax5RMGIqBt7SNR4tS96IR/hY=;
 b=HrRH9w5iluhexENHv2iJfA3LaPjKoYokpfhhNYLGvy4jJv65H/tp3K7k9K9o/WJWOVIWurPOheLQredl5++O1HB9D2Txqj4s4IHAqtoanZCPBYcKD8Mg1mfgMuMGqXHUhYzqHedLp60kiqpAe5hP/O4TUZTPWD3X+YdOmXLBshg45xS19iaO0g0RtQ2MnFpK8novUKLDzK6RxKNu4hCoN6IPbrMlfQAHbrgAX9cXkZ1KIJbf/e+85pS7Ob/i1uQn5i+oy69uuHrR1ywY11qRfn1n3Ie50cvALuNHTs2+RvcQ/i2O/JNOOeYT7NZ1bdjeQCDJ7wHmDuzHlxTvreTeBQ==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN2P110MB1624.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.55; Wed, 22 Apr
 2026 14:02:42 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.20.9769.053; Wed, 22 Apr 2026
 14:02:42 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij
	<linusw@kernel.org>, Kent Gibson <warthog618@gmail.com>, Viresh Kumar
	<viresh.kumar@linaro.org>, Erik Wierich <erik@riscstar.com>
CC: Bartosz Golaszewski <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Vincent Fazio <vfazio@gmail.com>
Subject: RE: [PATCH libgpiod] build: replace autotools with meson & ninja
Thread-Topic: [PATCH libgpiod] build: replace autotools with meson & ninja
Thread-Index: AQHc0mCv9TkU8PVqcUSImhbVkitRJQ==
Date: Wed, 22 Apr 2026 14:02:42 +0000
Message-ID:
 <PH1P110MB16037F48B385E4CF1C42ED569F2DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260422-meson-build-v1-1-a63a7a8b0d2f@oss.qualcomm.com>
In-Reply-To: <20260422-meson-build-v1-1-a63a7a8b0d2f@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic:
 PH1P110MB1603:EE_|BN2P110MB1624:EE_|SA1P110MB2074:EE_
x-ms-office365-filtering-correlation-id: a28d7131-9b1f-444d-ff39-08dea077d233
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|366016|1800799024|18002099003|55112099003|38070700021|22082099003|56012099003;
x-microsoft-antispam-message-info:
 Afvnms6OO122y7K0OU9OjLDISlHfbDxzKXbMqAden7xbd8Fi+bFLLO0WEQB3eX+nfe6LfeoNmcxCF7n/j5bcJmds86akFwTvf0yDFf3PMSDUDyKfp/6+pDjKwfp4U/kUkQ23dLTRnmdTuuiWLtvogwlmxf2lf9zEx5FNlHku9oU7ZVok6hSZt9POsiNooVE6b5blcT875DgbM8PuSVVm8ckCxv8CvqY/J6igvDGRPCnHvEAkFE+BnSUarUuxIDTU0YE+Qb74zoaaVgq7btNsD5H+n/p+fIoxS88gwqceV4DTGq0L5gMPiYPdSqQABiGfkjKbTmJR7BjQedD4N3kXHEkhdApuzQleIc0nggnBsQkQDOblzLuMcz9Z4qBSP1HxPMHVqDJyOIJo9Hgptu8gBLx1gPpyB/MwbDUtvWIM1azg1nG2U1NgVFTifoM2sr/HhDASZB1wTI0sSMKVElrqVoOdkUdNK1IOM4bR8RwEfk0R/ovRB9ukow44LZ/oOHAAVd+2WlXb7I+FFqhFsJ5o/xNNVVcxqfKLFWlVIyhATPlEBDpyRnIJCKVFbsHRpyi0bzqZcbAh6J7yQ1Scd9fy1yJbVC5HkMlDXATkyhQsi12z6zKbB8Fu8eeViFJffl0lqdf9Hc/7+S5QRkhgpuaNTlS6UShxtocpYO8Ym42zhxhUlCfMfZ17Nr8QXhSnvdmFpNYfzlMTW10yzgkburySHmyWiqAVJw4hcrqAiMl/nDcnPQ8Gk5J9h54A0Re7e0Pd
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(1800799024)(18002099003)(55112099003)(38070700021)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eTZXVjJyZUQwbnF4aVJ2bCszdmJRYldINWl5MnRIUnAxRTMvS1g4akdQZzIz?=
 =?utf-8?B?Q0laa2JvZFJQWGtxQU80UU9zUUhjN3VBM3Q5Rmt0TnB0VWhFd1BKRUFRMVVE?=
 =?utf-8?B?NTdBQ0F4WGJrZzEwWlRlOWI5MUxwR3VRSTIzbHhGN3VObzI4MDFHVk1idTUy?=
 =?utf-8?B?dmFtWlhSREpNTU14YkJIenozNHFCTFBadU53bmcwWGdLbDNhbUlkUDNJM2hM?=
 =?utf-8?B?STV0dlA2bDgvZTIzL3BDZ0pyS05vZGt3Q3hSck5pS205OG5nbjFBTHRPUjVv?=
 =?utf-8?B?S2ZKTzF5b2czNjR3ODNKUW9tbHRQRjBuZ0Yxb3lVQ3hZWmhQNnhXWnBkZmMw?=
 =?utf-8?B?ellSRE9peWR4VzVvalZXcjRvenNxWkZwMVN2UWRkUUhnNlVPYmhORGNRRzZo?=
 =?utf-8?B?eW9FS0gxTldNMmExVW5GODZTWmpXTCtaRVpYOGhteUdNbEIvZ1Q0djRjdUpL?=
 =?utf-8?B?MlpwS0Q4QWMveFpEYmRxV2hMQ3BPa2g5SE43Qy85ZUlLbnZ6aGFhQ3lBbGIz?=
 =?utf-8?B?WXVkUWE1L1YySWw2ZmhCYnU5REJsdy9LYWdPeHQxQ1dObFRNTW1lR2ZtVHpC?=
 =?utf-8?B?WjVLeDhERzJSRjl2LytpVVJEV2NJYjN2RFBVNkpkdkIvcUVUTVJ4ejg0cFUr?=
 =?utf-8?B?UmM1SXhKWnpRSjVEamxZdlYyZGlwSjRNM0p3RFhOcTEwK21ZaHlham5zZVo4?=
 =?utf-8?B?SGlCYm13TTdpOUJkT1krbnA1Z1ZLZ0NnSjlIc2oyb2lZTWo3cXJZNitDaWFq?=
 =?utf-8?B?elNWdVRWV0FBS0tUUjB2ckFaMS9nb1p3NzN2c2ZJakxJa3pkdFhDb0tSbHJa?=
 =?utf-8?B?Y1I1OW8vUVJGOGEyVG53SWxqc3lXU1ladzRRQzIvdlVDVXRuMCtWT3o2cHo3?=
 =?utf-8?B?a29JTTQ0ZldocFBLdHdhMy81TVg5U29HN21vTHZpRjVXMWpzSDhyQVE3cDZj?=
 =?utf-8?B?Y3NHMlhxd1BFaGdjUndCM0x6OEQxZXlIdC8xRlBJK2owUnI0Q1dFSUZtUERj?=
 =?utf-8?B?anNidkh0NjNuUm82M01qSXdTalkyYWtDbE1xa3lzNFNUazdXZklqVmxYck9k?=
 =?utf-8?B?SG5rbHRZWE1hS0VZUWRwaHB5dnZ3UXc4eW9CVkJ6VnpwcGRldU1nOWxvT2k3?=
 =?utf-8?B?TE52K3V6MTVYTTdQeXhOZGJURGJkVk90a3F3N3EvTmRGUENCQ3h2TjVFTTlj?=
 =?utf-8?B?T0Q4QlVIOG0wdXNjMGp3ZnZrb0VneGd1MUl2eCthZjlkRFVzeUlqcEs1TDJw?=
 =?utf-8?B?SFJDNVZSc0V3YWlFNGlia1BsZ1hGTnFseXpCZlB0dUlHbDQ0QlFCWFVlRk1N?=
 =?utf-8?B?Z3Z0cUtSWjFDTGJXKzJrWlNsakNjSUJpeVVvZjVZcXBMdmdKT3ZMdjcrVGpZ?=
 =?utf-8?B?dDJ6VzlHd2s1eHJjWGx0b0FkeVpCMTVKVDc1QzhiakVMVUJPOW9OT3FGMEVs?=
 =?utf-8?B?MDhwajl6dS91UkZ4VGZrRCtMV1FYcER3N0lNSDJCa1Y1Z2JVcXU4dGpYbVBy?=
 =?utf-8?B?K1AxVUJmekRGYnhoQzZDWTJtUDZra3RiQ0RtcmV5WGhvM1FFZks0Q0gxTzdX?=
 =?utf-8?B?aGlQN0tmeGRsSWVuNHlnTFQ5c1hVU0FQUThMOXI1Tk81UE4vQTU3L3VrblRB?=
 =?utf-8?B?VzBQbncram5tMklzU3kvNllHMlVBb3Npa1RUZXE5cXJpYVdjdU1abWI0MHJw?=
 =?utf-8?B?OEd0c2RmMUc5Y1Q2cExVUGdFdXVJYklIeXpnNS9Pd2I1dm8wa2NWQ2tTWHQ5?=
 =?utf-8?B?VURreG5MVzVSQjNZZFVzbWMxeTA0d0hkNEwrSnJmOWxBMWhkRWd6KzBkSzZT?=
 =?utf-8?B?YXhlMzNWa095NVZYR1I1VGxFSUdlbjZ5WTJKYzlENG1PcUt0dEJhdDJNYUdI?=
 =?utf-8?B?VHpud3BWZVlDTElEZU5TU1M5a3UyUTBXazYwUjRTZHZ4QlFrYTRRM3I1OTNo?=
 =?utf-8?B?SUJ4ZHFjb1B4SVFWbjV4c2N4NGpISnhBQTZhdFh6S2dZLzJQRW5pV0wwT0M3?=
 =?utf-8?B?djR5SFdNQ0FzeEc3QmpIUzllS1UxaE53RVU5VW1DRkpXaUpNUGdnSUlyUlgx?=
 =?utf-8?B?Z1o2TXo0dnZMTVFSM3h2SVRuaDUxbXlHRzYwUzFmU1BGak8yUWhScEVPV2pq?=
 =?utf-8?B?bW1ZOXFYeHRBNXVTYmEvMnVXTmVBUGJnY1pZYUt2UGhleHdjcWZuUGhxTVhU?=
 =?utf-8?Q?v07ppAzb4oOoKLl229l9SPww0rpNmTglHcijT866oaHl?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a28d7131-9b1f-444d-ff39-08dea077d233
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 14:02:42.0991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1624
X-OriginatorOrg: xes-inc.com
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[xes-inc.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[xes-inc.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35380-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,riscstar.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@xes-inc.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[xes-inc.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 0023844C8B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdz
a2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4NCj4gU2VudDogV2VkbmVz
ZGF5LCBBcHJpbCAyMiwgMjAyNiA1OjI4IEFNDQo+IFRvOiBMaW51cyBXYWxsZWlqIDxsaW51c3dA
a2VybmVsLm9yZz47IFZpbmNlbnQgRmF6aW8gPHZmYXppb0B4ZXMtaW5jLmNvbT47DQo+IEtlbnQg
R2lic29uIDx3YXJ0aG9nNjE4QGdtYWlsLmNvbT47IFZpcmVzaCBLdW1hcg0KPiA8dmlyZXNoLmt1
bWFyQGxpbmFyby5vcmc+OyBFcmlrIFdpZXJpY2ggPGVyaWtAcmlzY3N0YXIuY29tPg0KPiBDYzog
QmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBrZXJuZWwub3JnPjsgbGludXgtZ3Bpb0B2Z2VyLmtl
cm5lbC5vcmc7DQo+IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAb3Nz
LnF1YWxjb21tLmNvbT4NCj4gU3ViamVjdDogW0V4dGVybmFsXSAtIFtQQVRDSCBsaWJncGlvZF0g
YnVpbGQ6IHJlcGxhY2UgYXV0b3Rvb2xzIHdpdGggbWVzb24gJg0KPiBuaW5qYQ0KPiANCj4gUG9y
dCB0aGUgcHJvamVjdCBmcm9tIGF1dG90b29scyB0byBtZXNvbi4gQWxsIGJ1aWxkIG9wdGlvbnMg
YXJlDQo+IHByZXNlcnZlZCB3aXRoIHRoZSBzYW1lIHNlbWFudGljcy4NCj4gDQo+IFRoZSBnb2Fs
IG9mIHRoaXMgY2hhbmdlIGlzIHRvIHByb2R1Y2UgdGhlIHNhbWUgc2V0IG9mIGZpbGVzIGFzIHRo
ZQ0KPiBjdXJyZW50IGF1dG90b29scyBhcHByb2FjaDogbGlicmFyaWVzIHdpdGggY29ycmVjdCBT
T05BTUUvdmVyc2lvbiwNCj4gaGVhZGVycywgcGtnLWNvbmZpZyBmaWxlcywgR09iamVjdCBpbnRy
b3NwZWN0aW9uIGRhdGEsIFB5dGhvbiBleHRlbnNpb24NCj4gbW9kdWxlcywgRC1CdXMgaW50ZXJm
YWNlIGFuZCBjb25maWd1cmF0aW9uIGZpbGVzLiBUaGlzIGlzIGRvbmUgdG8gZW5hYmxlDQo+IGEg
b25lLWxpbmVyIHRlc3QgY29tbWFuZCBydW5uaW5nIGFsbCBhdmFpbGFibGUgdGVzdCBzdWl0ZXMu
DQo+IA0KDQpXaGlsZSBydW5uaW5nIHRlc3RpbmcsIEkgZGlkIGdldCBhIG5vdGljZSBmb3IgYSAi
ZGVwcmVjYXRlZCIgZmVhdHVyZToNCg0KTk9USUNFOiBGdXR1cmUtZGVwcmVjYXRlZCBmZWF0dXJl
cyB1c2VkOg0KICAqIDAuNjQuMDogeydjb3B5IGFyZyBpbiBjb25maWd1cmVfZmlsZSd9DQoNCmh0
dHBzOi8vbWVzb25idWlsZC5jb20vUmVsZWFzZS1ub3Rlcy1mb3ItMC02NC0wLmh0bWwjZnNjb3B5
ZmlsZS10by1yZXBsYWNlLWNvbmZpZ3VyZV9maWxlY29weS10cnVlDQoNCmh0dHBzOi8vbWVzb25i
dWlsZC5jb20vUmVmZXJlbmNlLW1hbnVhbF9mdW5jdGlvbnMuaHRtbCNjb25maWd1cmVfZmlsZQ0K
DQpVc2VkIGhlcmU6DQoNCmJpbmRpbmdzL3B5dGhvbi9ncGlvZC9tZXNvbi5idWlsZDogIGNvbmZp
Z3VyZV9maWxlKGlucHV0OiBmLCBvdXRwdXQ6IGYsIGNvcHk6IHRydWUpDQpiaW5kaW5ncy9weXRo
b24vdGVzdHMvZ3Bpb3NpbS9tZXNvbi5idWlsZDogIGNvbmZpZ3VyZV9maWxlKGlucHV0OiBmLCBv
dXRwdXQ6IGYsIGNvcHk6IHRydWUpDQpiaW5kaW5ncy9weXRob24vdGVzdHMvc3lzdGVtL21lc29u
LmJ1aWxkOiAgY29uZmlndXJlX2ZpbGUoaW5wdXQ6IGYsIG91dHB1dDogZiwgY29weTogdHJ1ZSkN
CmJpbmRpbmdzL3B5dGhvbi90ZXN0cy9tZXNvbi5idWlsZDogIGNvbmZpZ3VyZV9maWxlKGlucHV0
OiBmLCBvdXRwdXQ6IGYsIGNvcHk6IHRydWUpDQoNClRoaXMgbWF5IGJlIGludGVudGlvbmFsLCBi
dXQgZmlndXJlZCBJJ2QgbWVudGlvbiBpdCBqdXN0IGluIGNhc2UuDQoNCi1WaW5jZW50DQo=

