Return-Path: <linux-gpio+bounces-37892-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BiXtH+UDIGpguAAAu9opvQ
	(envelope-from <linux-gpio+bounces-37892-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 12:37:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5C7636A6E
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 12:37:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37892-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37892-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E8753015716
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 10:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9E73822AB;
	Wed,  3 Jun 2026 10:32:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2102.outbound.protection.partner.outlook.cn [139.219.146.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23819381AFB;
	Wed,  3 Jun 2026 10:32:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780482769; cv=fail; b=Gmt8jACTLqmFOYcbNPT6mzyU5NKqt8615LcYgwztqv5ZGT/pvRDF9nPah24i4NIJPMSA2GVSq/0M6VqZ9NEr/ZQey9iyWJWQ6GfSA/nw0Gsusdqpc3+mddt+QmXM/bp4vyXLYDorwV+86zs8p/Sf6tO1g7kt1nlb3wY/4Dduoiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780482769; c=relaxed/simple;
	bh=ArNwJNdIhEGeBOXtnNGkvLLRSsKEIxE97T0lXuqBYi4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X5z76uykIgjWyCR6O5cpmrnhCliYf1nS6x9Bi8nsvPKd0uGKtTRAnfg8DQjifYt4qXn8bhd8VoOCl0fYYVVP5m2j4ToUfopzDpukNKybsGOqh1lWwc1K8bGnqT2brSuCaJJI2L8RY+HGmdFmlCCDdpCvAJ4q2aPK6M0+tUfzQyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.102
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kevMRbUzKYhMv/UcgziFC2vwCrq61r8XGp/NsiO13JAM/4vIyW71/0MLYT9RKGOqCmgJd5wu6eYfnIx0jUrVNpvpJ18jzgwsR/7iqeDH5rAcu3vKqCQUro/+jRE6ihi4yFjWxLWb4PCi671iTJGgXEcL2bKypsTJDIwmyHO/8nrAJxhhi8JMDFfVZmay0Ng7aF9MU3x5x7KFk6YWzNcGyBKzi4GzB4VZbKS5oWxalh0liteC4F2+xSNn252l3Cy845/7rrtdlpSRcGr+f6/sgVMnHXOBwgy/rBaOwOc5PbhkE+C7fGwpgSW0M/SYJA0Tx+TeWTl9Z9s8TWeQwkVZdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArNwJNdIhEGeBOXtnNGkvLLRSsKEIxE97T0lXuqBYi4=;
 b=OkTUvdx73WbzAbmOtWFB3c5ROGeuyJQLzn5Z5wQRHrfdH13wnYeTOQhoGp1bWJChXLqiZsKnPLwPllqf/YdN+MXRjx9Lg7zN/TuWYEY437nDgniWbl9jxPkCzEF10uDpyx62BGjFKD9wofqVbrwlFvbsirOULClGzOyL7KavsAnrJSkPCSNxIhQ0rbDVCPne72+SlD85tE72+UNJIZzblJW4xHvC8AZpDVe/wjRuHtDM2SsUnRLBUjjQe9VyksCGkluzCbpHd69dO5MHRHCJCYlFQECsbS815iBaXjj1zEDpJxGi9eoUEmBPfe15joSozr6tk1+B4hz2BTmjWrlyiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 10:17:37 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 10:17:36 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Bartosz
 Golaszewski <brgl@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v3 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Thread-Topic: [PATCH v3 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Thread-Index: AQHc8x1jj1AWoBKzsESqiyGUJQ5KXbYsgz+AgAAa6qA=
Date: Wed, 3 Jun 2026 10:17:36 +0000
Message-ID:
 <ZQ4PR01MB1202C6EADCFEF3BDAE70BC17F2132@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
	 <20260603055347.66845-5-changhuang.liang@starfivetech.com>
 <05c54522ba76bfc4421e6838e8ff108437f69636.camel@pengutronix.de>
In-Reply-To: <05c54522ba76bfc4421e6838e8ff108437f69636.camel@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_
x-ms-office365-filtering-correlation-id: 1d0cc0e2-64b6-4c8c-03c4-08dec15955bd
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|56012099006|4143699003|18002099003|22082099003|921020|38070700021;
x-microsoft-antispam-message-info:
 hj2fNF9zfFEA9DRFakaHVS6erVGCfM9G5MeC4aVVqaX47mldRp9Wug0xab+CyZgvmcwnXEFttjGjQ6mJnV55yF37AukmXgPta/wLQgkATm5dLVtOp009owQb9xnDY3lhJZY44YHYzh+wqwoTers1aC4giWLGpETssme5xLDC6JZRKX0BtOS5obLiUfrD7A10NfoV1hBd1lAxjIhmBsHW0o9tnhJs6VTsejOtCJ8wkfx0HJ6ndj+Vno8aB04bmbex+R6V4c2O1+gnB1/jpKWTUI2cT6y3w0rgsZg+Q91s8hJmRxGna7CUYzJd7bhH3AtyV6zXdiyY3FMM6o4zeET9YgBOoBmN0paXn/mW1CiCwfNf2bQ5L5ubTS0zM3NyfOgwLA0kixN1xf9n5T66mInx9ENbkircyFNfdcFWYrsBs7VB6lM6HFYo4fhsqo3QuEk8IPSOap8cal77xAawRhGdg5e5SiRnTEAcQl9ZjsKiP7ijVcOdrdG4eJH+FMb/7UXrMNrlOlxRpIG5udAwX5Sxtw93EhvNu3tw/fjHdsfwRSpCxy1Bwv48ZNhDSFbdBfiW8btakbWJSq1fE1esT89XDQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(56012099006)(4143699003)(18002099003)(22082099003)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d2RQZ2NCd05Dd0NUM3NmelhhLzF3cmM2V3hydUdLZkUrNmZqWG1KWHN4Unlv?=
 =?utf-8?B?cW8yb0ZYcFIwUmlVbTFMVFJlTitJcTFkZWQzVlAwMldORHEwZkMxWlJWMzEy?=
 =?utf-8?B?NG83dC9wMEFYUDQ4QVo5cDVQTURaU3RlTU9PT0M3N0JxbUNqNmp2eGtoMktV?=
 =?utf-8?B?My9SV1lRUHFzVVIwVVdXTXllL3dQcXY1TE0wcWdFWndEeW02TXZ6Z2h0SzVW?=
 =?utf-8?B?OUN0aDg2NHhsNTF4U1ZhWjh5RVFISnF1dW1RWnVZa3QzNkk0MWgzTXg3UFFT?=
 =?utf-8?B?SWxXeUNHS3pRYlNvUjYzLzJCRFdMQ1NjTUFzZTRvZlp5bDNnWUxuYUtXYlpP?=
 =?utf-8?B?RmdXc282VjNNcE4vM1piWTNhYy8xcE9iU2FRMlNaa2NPK3pXOGlKdUdXVHNa?=
 =?utf-8?B?L1h6dmY2NDVlRCs0RWgxL1Vlc0ZWVXFZN0lCM2VxWjBobVQxV3pmL3pqcjZr?=
 =?utf-8?B?RjNEdjdzSnQ0RnRkbmliZG9OOFFKNEE0eERhNi85aFRMMnhjd2Vuek4zdkJz?=
 =?utf-8?B?Vm1SV291T0V5NHpxUGxwdEJEMEg2RHNYOTFtTEZkcW94Tlk3c2JqSzU1eXRH?=
 =?utf-8?B?NC9HZjB3bVV6SVdyS2NDelZOSHpkVnJEUHVSVStiMFNxVjQ5OTc3ZzQrZkpX?=
 =?utf-8?B?WDJzdFM0Rkd0aEtzcGFvOTFTR29CQkJiKy8raFZZN3YvR0Rpbi9qaFB4UHo1?=
 =?utf-8?B?NFllR3puOGtwdkwyK2YvU1pJdlY4N2RmWDFXRTFCSWc0anhRNGp5YWJoWWtn?=
 =?utf-8?B?QWlMQWh1NWo2SVVVNnhxZFhFUnRUeWF4aTgyUTBBTzFjVkE0dEJNaGwrd0t5?=
 =?utf-8?B?Rmx6MHlHWG9yVk9WUXlsMDZWeWZxUURoYllZUXVuRFR6VUhNZE5WNzhCTUxM?=
 =?utf-8?B?VFhDY2NCaEVwcXpNb0RlWWN0aUxCdGZWNGNCakR4OWdKN1VRUVYrQ1VDemZ3?=
 =?utf-8?B?K1NVOXNDWWQvWlZtcWc1b3dBVWtLNE1CRWV6citENjViZnhIVzlpZ0hsY1I3?=
 =?utf-8?B?WjFrNU5BSWZyTmh5bHpqWFlnbHprZklHdnRiWUtmcjZseStvTVE2Q3JUQjBP?=
 =?utf-8?B?SGI5cTRVTklFc0lkcEtESW1wUjNuOThLZC9Mb3M0RUN2aU1kRE5Pc2txUWpj?=
 =?utf-8?B?amFhbStIYVQ2L2ZsS2V4ODJlNDBrWHF2bCsyTHNFZzBma29WMnR1TFhkKzc3?=
 =?utf-8?B?VmJsZG5ra2lOM0tnb3VUTHFNd282dnVQMXl4NVNGNlRKNkh5c0hEUUU2NTFl?=
 =?utf-8?B?dWFZalhFVWFCNTVWdW5nM0hVNWRhQmNYMVFUTHUzbHNUUmtIMXJVUmJaRTNk?=
 =?utf-8?B?bWhhaGhLcDFJK1pwRytjaUtCRWVJQkVMUFZqZjNWUjhpMHJUa09MbWJ0bEZC?=
 =?utf-8?B?ZEVtSGdpZWRYMi9FSm1qMTRac1RWd1ZGMnZENnZCUDFWcFQ4aVVCZW5zeVZn?=
 =?utf-8?B?WktKeWJkdU5qbmEzMU5aVjE1aWxQYkZPbW5oVWtyMklJNlJCUlNxWkFyd1VE?=
 =?utf-8?B?VkZSZEtZekhiZ25IT2lQS2JLckRnOUZweXo4SmllMDVuQWNMZVZjaVZ4REda?=
 =?utf-8?B?TXdhd0NCNGdiMVVtazNZUFIzMUNyUHY4YTlnTVQrVWVueWZxVm1jNUY5Wk9S?=
 =?utf-8?B?MWpkVTlRRnJzTEJBZ2dhaXVTU05abnVXUndON2Uwb25hbzJUUXpUL1FHVDRi?=
 =?utf-8?B?T0ZWTFJsVUxUVVVYN3JiWTc0YU1ZUGtKVEwwNTJuWXZDYmVhUWFyVlROSEp0?=
 =?utf-8?B?VFlUMk1vTktkME9WQldIREY3ZlZKQ3Y4bk1GNkdJQTVTS2ZHY1MyYnRwNDR6?=
 =?utf-8?B?eThiOHRyclRjVzRJMGNSaytQeFVxT0RhZHlGMDZTK1ZkVkQwRjV1TCtTbU1C?=
 =?utf-8?B?OFJzWUh3eUtEa2gzbUNjaTRnT09EbEw4RlpjS01rOTlTeTZSOXFaZ2JnZUJ4?=
 =?utf-8?B?dHNVNjNJUkFTN0w2a1JLU0t0MlM1VHVRN1hFMnVTUktRRjdkcHBNYlVZOWt2?=
 =?utf-8?B?U0RGL1dJaCsvdEdYaFRvaDgvdEtxMyt1Z1o1K2UyRWFSS2dOdVBRNTVPMkVh?=
 =?utf-8?B?aXFRNFZ3UHVSUC93aE9nM3llckJCeWZwcTlpYkl3SFUrTVkvZFdsRjY0Nll6?=
 =?utf-8?B?ODk4UkQ5TnFCNmxndnpTZklPTHV4N0ZwdHBkRnFqL1VBK3MyM1VvTC9qb3Nt?=
 =?utf-8?B?NzRmcTFEYnJVWjA4dmNTQTVZRXhmdFFpWDIrbnJuKzUvdVFxNkVTNVBjYUZo?=
 =?utf-8?B?ZG1BNmJqcHZseTR4VndnVUVOZFRPK0drYUhpbXFMOUd2anlZWDkycTlVcHZG?=
 =?utf-8?B?eVI5WWhTb2plSjY3Uk84c09SS3IvLzByQXVVNVRwK0ZNdy9VQXBNcllubWJM?=
 =?utf-8?Q?T/fvhDIVJjYeTYjA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0cc0e2-64b6-4c8c-03c4-08dec15955bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 10:17:36.7356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LBq1+o5tadmo31naSFbkv2o4rGIUK1EbA86d5lfQ+fjWGBJmIRhJmkSuEDh9wegQ3sBLrcO14BtF8DhUaypA0zehnLIRFo8USAnU+gH8BBX7bbSBB5nyp8iZulkMlCip
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1202
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.64 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37892-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:from_mime,starfivetech.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C5C7636A6E

SGksIFBoaWxpcHANCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IE9uIERpLCAyMDI2LTA2
LTAyIGF0IDIyOjUzIC0wNzAwLCBDaGFuZ2h1YW5nIExpYW5nIHdyb3RlOg0KPiA+IEFkZCBwaW5j
dHJsIGRyaXZlciBmb3IgU3RhckZpdmUgSkhCMTAwIFNvQyBTeXN0ZW0tMChzeXMwKSBwaW5jdHJs
DQo+ID4gY29udHJvbGxlci4NCj4gPg0KPiA+IENvLWRldmVsb3BlZC1ieTogTGlhbmZlbmcgT3V5
YW5nIDxsaWFuZmVuZy5vdXlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBMaWFuZmVuZyBPdXlhbmcgPGxpYW5mZW5nLm91eWFuZ0BzdGFyZml2ZXRlY2guY29tPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlhbmdAc3RhcmZp
dmV0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gWy4uLl0NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
aW5jdHJsL3N0YXJmaXZlL3BpbmN0cmwtc3RhcmZpdmUtamhiMTAwLmMNCj4gPiBiL2RyaXZlcnMv
cGluY3RybC9zdGFyZml2ZS9waW5jdHJsLXN0YXJmaXZlLWpoYjEwMC5jDQo+ID4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjUyYjk3ODcwYjk5MQ0KPiA+IC0t
LSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvc3RhcmZpdmUvcGluY3RybC1z
dGFyZml2ZS1qaGIxMDAuYw0KPiA+IEBAIC0wLDAgKzEsMTYwNyBAQA0KPiBbLi4uXQ0KPiA+ICtp
bnQgamhiMTAwX3BpbmN0cmxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikgew0K
PiA+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gPiArCXN0cnVjdCBncGlv
X2lycV9jaGlwICpnaXJxOw0KPiA+ICsJY29uc3Qgc3RydWN0IGpoYjEwMF9waW5jdHJsX2RvbWFp
bl9pbmZvICppbmZvOw0KPiA+ICsJc3RydWN0IGpoYjEwMF9waW5jdHJsICpzZnA7DQo+ID4gKwlz
dHJ1Y3QgcGluY3RybF9kZXNjICpqaGIxMDBfcGluY3RybF9kZXNjOw0KPiA+ICsJc3RydWN0IHN0
YXJmaXZlX3BpbmN0cmxfcmVncyAqcGluY3RybF9yZWdzOw0KPiA+ICsJc3RydWN0IHJlc2V0X2Nv
bnRyb2wgKnJzdDsNCj4gPiArCXN0cnVjdCBjbGsgKmNsazsNCj4gPiArCWludCByZXQ7DQo+ID4g
KwlpbnQgaXJxOw0KPiA+ICsNCj4gPiArCWluZm8gPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEo
JnBkZXYtPmRldik7DQo+ID4gKwlpZiAoIWluZm8pDQo+ID4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+
ID4gKw0KPiA+ICsJcGluY3RybF9yZWdzID0gaW5mby0+cmVnczsNCj4gPiArDQo+ID4gKwlzZnAg
PSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnNmcCksIEdGUF9LRVJORUwpOw0KPiA+ICsJaWYg
KCFzZnApDQo+ID4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ID4gKw0KPiA+ICsJc2ZwLT5iYXNlID0g
ZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOw0KPiA+ICsJaWYgKElTX0VS
UihzZnAtPmJhc2UpKQ0KPiA+ICsJCXJldHVybiBQVFJfRVJSKHNmcC0+YmFzZSk7DQo+ID4gKw0K
PiA+ICsJY2xrID0gZGV2bV9jbGtfZ2V0X29wdGlvbmFsX2VuYWJsZWQoZGV2LCBOVUxMKTsNCj4g
PiArCWlmIChJU19FUlIoY2xrKSkNCj4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBU
Ul9FUlIoY2xrKSwgImNvdWxkIG5vdCBnZXQgJiBlbmFibGUNCj4gPiArY2xvY2tcbiIpOw0KPiA+
ICsNCj4gPiArCXJzdCA9IGRldm1fcmVzZXRfY29udHJvbF9hcnJheV9nZXRfb3B0aW9uYWxfc2hh
cmVkKGRldik7DQo+IA0KPiBXaHkgaXMgdGhpcyBzaGFyZWQ/IEFyZSB0aGVyZSBtdWx0aXBsZSBw
aW5jdHJsIGNvbnRyb2xsZXJzIHNoYXJpbmcgcmVzZXQgbGluZXM/DQoNCkFEQyBwaW5jdHJsIGhh
cyBhIHJlcXVpcmVtZW50IGZvciBzaGFyaW5nIGEgcmVzZXQgbGluZSwgd2hpY2ggaXMgY3VycmVu
dGx5IG5vdCBpbmNsdWRlZCANCmluIHRoaXMgc2VyaWVzLg0KDQo+ID4gKwlpZiAoSVNfRVJSKHJz
dCkpDQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHJzdCksICJjb3Vs
ZCBub3QgZ2V0IHJlc2V0DQo+ID4gK2NvbnRyb2xcbiIpOw0KPiA+ICsNCj4gPiArCS8qDQo+ID4g
KwkgKiB3ZSBkb24ndCB3YW50IHRvIGFzc2VydCByZXNldCBhbmQgcmlzayB1bmRvaW5nIHBpbiBt
dXhpbmcgZm9yIHRoZQ0KPiA+ICsJICogZWFybHkgYm9vdCBzZXJpYWwgY29uc29sZSwgYnV0IGxl
dCdzIG1ha2Ugc3VyZSB0aGUgcmVzZXQgbGluZSBpcw0KPiA+ICsJICogZGVhc3NlcnRlZCBpbiBj
YXNlIHNvbWVvbmUgcnVucyBhIHJlYWxseSBtaW5pbWFsIGJvb3Rsb2FkZXIuDQo+ID4gKwkgKi8N
Cj4gPiArCXJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocnN0KTsNCj4gPiArCWlmIChyZXQp
DQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJjb3VsZCBub3QgZGVhc3Nl
cnQgcmVzZXRcbiIpOw0KPiANCj4gTWlzc2luZyByZXNldF9jb250cm9sX2Fzc2VydCgpIGluIC5y
ZW1vdmUgd2lsbCB1bmJhbGFuY2UgdGhlIGRlYXNzZXJ0aW9uDQo+IGNvdW50ZXIgaWYgYSBwaW4g
Y29udHJvbGxlciB3aXRoIHNoYXJlZCByZXNldCBpcyB1bmJvdW5kL3JlYm91bmQsIGNhdXNpbmcg
dGhlDQo+IHJlc2V0IHRvIG5ldmVyIGJlIGFzc2VydGVkIGFnYWluLg0KDQpXaWxsIGZpeC4NCg0K
QmVzdCBSZWdhcmRzLA0KQ2hhbmdodWFuZw0K

