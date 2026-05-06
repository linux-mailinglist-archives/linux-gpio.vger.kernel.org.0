Return-Path: <linux-gpio+bounces-36311-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGYHKqBl+2kuaQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36311-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 18:00:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C155C4DDC18
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 18:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC54A309E684
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 15:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8824C3E3165;
	Wed,  6 May 2026 15:56:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2110.outbound.protection.partner.outlook.cn [139.219.146.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2966347D95B;
	Wed,  6 May 2026 15:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082998; cv=fail; b=SRgVmfGy2vBnheZ0JQugUtPB4tjM0p3O7YYY4Xp7dYdhBBiXUkjoGiB7HKe7f/9WlTpekycYHRCxQ8YouRl1YNMnU0mQ9QA7zEpEogtG425gaBf11yJ76qS2ySJ+hJ+2OHytiPA66fWR4+9Ob+kLiRIx49u3yaX0WqaCdsJT2CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082998; c=relaxed/simple;
	bh=3cdirSAGaGDnorGyOgMnO90YvYT/I9F14uF2el/Zhhw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kn4b2xBZWI22a1dO7Yp9pMScGe842absHH8xQrUUmFP2yLrFM3ty2H01hDBeCdIoVINpJ2qTL28wGCggDB3Sw3yw4XlMTHtozJhnyK6OfNAJXkHP7nuesAVeR/monYqILRUym+xVXmxj8UnWRmIz4gnBUr4XtMk5BGWyD0qeFNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbrRuxJkNqtOIrnxQp60IdNwxaWzDJpKByV4UzCu9FNk5vmBYa7/Oz73BXcxB8Mp7Do2jLe/wP2bbb/XVdY5Tk4lcSJ1k/YN7gTGaz9m7GkAur0rCt1kAyklbhyiDuddLai+XJ0Z/Z37YYV//edoxghv/lxm6qxnwpHzzI7I1E28xniRs+zpZMWkVviw3VCRPTvozrEn/anW0tEfd+UWuv7afscwRQz2+CA4Y2e39/JCCxxYxZwe7NI/Vy595nVThWfSUj6DaEPxogHAYDolmLAOfZ143N6SsiQywAsFBpYgBMhJOOG/kYN1rPBEQcTLGf+igw+6RZ965y/NzKYd8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJKEKVPIq1XRSdKOOntc9VF2F23Ieo4f1lZdwnoGwX0=;
 b=d+6JsZsTnWI37eX55CkEyUfZU72QTwsVwbldsh1+Aeo83m+qqvbbyNn1JUND9Ps5xXXRK+gBu8hMalRUIkFCa6JQP6RfQKomBicL+PmS0+eMQ8JTyzz2hTesmFzcz5IjFacSpPTvbGRCyf6lPCAYuJZ+E4vLQY7fpWE7woFAWxiyk8bQbI7170eRxn1m9T5IF7mpQD9DU+Xt8/iSMPfE/1u3TFTFQvVDUZl6HJm5JhA8iBQl7vL6Lt4guPkQ+tAzmUMC+MSIhNTUmR4IDKJZJIWSwiMFZ3CB6rpOo63fQhHRQFwSM6fjvy86TUwOOmfXHqJsT4tQDlOyfYG6YZGuhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1172.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 09:23:37 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.008; Wed, 6 May 2026 09:23:37 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Lianfeng Ouyang
	<lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v1 11/20] dt-bindings: pinctrl: Add
 starfive,jhb100-per1-pinctrl
Thread-Topic: [PATCH v1 11/20] dt-bindings: pinctrl: Add
 starfive,jhb100-per1-pinctrl
Thread-Index: AQHc09tvLatUK5oq3keSy4c9Ncpt5LXubvkAgAVF1NCAASNvgIAL9BTw
Date: Wed, 6 May 2026 09:23:36 +0000
Message-ID:
 <ZQ4PR01MB1202F561A68C43547A85D1E7F23F2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-12-changhuang.liang@starfivetech.com>
 <20260424-mumps-foothill-ef122c1029c0@spud>
 <ZQ4PR01MB120229BE0DAC2658164C066AF2372@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260428-hardhat-both-1c9aa594a45a@spud>
In-Reply-To: <20260428-hardhat-both-1c9aa594a45a@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1172:EE_
x-ms-office365-filtering-correlation-id: 6475f694-eb94-495c-fc29-08deab51271b
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 uKyLAUOB1M1rdjZ7VM216P9y7hUaP6JCFmlFKKjfxZ4zATBg9w6xBKsS5W19KVzwYxcm14cFhoPTlIJ+DgiA7CRK8SHrRZEWQyqWGgja5qeTcRfpcxRQ1pi4Jg1MR9unQbAfYm/y4gNQYMl/xMp207beYp6bKtAH0BpBRNHBn7m2u42K4bj0azHt6u8XpT4gmBo8FuKiazt9eWd1BXv259Il0afmXoOoWVXPpQIIqYS0+YPvOG2xvIpsKszFmLoHhtunP4M1B3L0Z0RtR8O2/Kp5jbdXt8K5QJoIM0Gn7iw6iBrjK2ZvzOIGuXm/koa/XvljjQLJyaHJEnVLP2ZEuW8I5ah39nJ4tKePSCxGufbCCYVvQDD4HilvylijYX2c8Ds9Tl/DZhgeHgrHPr6pHimGbEjE1AX7MWlIvJizzNso42hVH79SpOvbhJfVJWllGTGulaHsKbS5PMLmjcdRpugOJwrB6Nm6aBB8Hfml3jPGbfiiyRC0xyouZe2oyI3DXbNBKfogKu1NIzHLH4NYXJB6XTR4ekHDhcbEJujX2rDzt6DQi44l9M9iztGoXrFc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Uy566qmnzeObFGEfVpxuK3doQQ83ff25mtBEh3d3TemKDeJ3nfwbguyTka32?=
 =?us-ascii?Q?O0xOwISG1171zxuouK3rAbFQFsaz9ErbvfpRr+yqfpfWsGOn9lgXjMKZqu67?=
 =?us-ascii?Q?NWIfQ08Rrz6XuU4dGwSdpXN2TjuBRO5r26oHOlzwNhl/GM3NiQ3VblX8ilOd?=
 =?us-ascii?Q?yR3QfxnPvOE9x7C7REpXriIll4Rj8HMgq/8D7GddGlVjBlThGoz/aTCgg2+Q?=
 =?us-ascii?Q?hMBm1imt3E1fadyJvm5hic7P33Cut8xeR3TWY0h1MMjCsPZYuAGa5yz2tx+5?=
 =?us-ascii?Q?oP/DbJs+5GT12aG5mgBhwhhWVsV2P5SI5RPQogmKIlb3qokWFgadTs5id7e+?=
 =?us-ascii?Q?sL+nQEedVU7ux0wsLm1nPeGMo4PTkW5+rsGhTYTTH1jNnXp257V6sX0aCR3/?=
 =?us-ascii?Q?bHdKFtZxNXBOnOJN7yRTL2hny8AQEnFI96U/upVVu80PSaJA4TB/r0GiVwTI?=
 =?us-ascii?Q?+J958lfHNEA4ypM0MNvgGiprWWHNJy1H0Q0v4WLJ2b5XZtz+uvMolp6vKY2f?=
 =?us-ascii?Q?kixBACxg3v6ZIqGkynn+5uKu8xsZwlGi9PlPzW2enE5u8ZGR910YjYiiPfhx?=
 =?us-ascii?Q?juBN5pWsjidVAl3nsd/I0kXqIfKj4AqsednlcPdkwrnrbRZkzqVggYvX/21v?=
 =?us-ascii?Q?s75db86JFBhUgCC8oLESULbDXzlfJVc73rdNDwvVz99Ozk0g3lkjsETWbcxe?=
 =?us-ascii?Q?Y1E5W+pWoWoRtISkuILLhYX8eLrlBtqtsZCTH83zDm0rbwqHd4H/Zb8TA73w?=
 =?us-ascii?Q?92dpgqxPwzY3ECKsP5NsE2iDqpnUEJpx46yLflYf+W9fq6yfmVniPuRsj+74?=
 =?us-ascii?Q?zpnok8aHJIPUMtIrJYb5ZOcGsBEqZkYtaE33K88mNuYSSJbWsXykxpCWW3vn?=
 =?us-ascii?Q?l6LuPhnVaJWrw+I9p2EMO4uUPer60ExVL9xKv8vd8rbLpQX4uVsbHC1eeUXC?=
 =?us-ascii?Q?Kiu6DR0W1Fm7640FophNtG7ueJN2Zgvn77JJFQRLKDB47GVmzk5mJedbpV5g?=
 =?us-ascii?Q?X1lclNVc/DH/x2cPDgMBwDd6L1OuczzFVulBy4gW/mqkUqkYR5JMJZaKX/Av?=
 =?us-ascii?Q?UuPp3QsxybF7SMhMhHR7lE+7xrIJ6K6SvxUNFkB2/xmJD3Z3vvf63I8Q6d6U?=
 =?us-ascii?Q?+BV1tNGz436RXnmms+a3BRqy/7x1ZjT8Slg4cxgvh6zegvpTRV+78nWLABf5?=
 =?us-ascii?Q?3uFBT0KmtRKMAeZwQrM7ux5ddjV4KG17mUDMBKlFfXvoiDr/R44ilufj5JRN?=
 =?us-ascii?Q?uWYn1pcLmDkAYysoLwnlzUQkZ4ibx43hVjxEG/fZ7SejiaJ7d/nLgbwttvqf?=
 =?us-ascii?Q?vrbhP/YRcUHxgrUG/PV7SDHDIH1jq+pP+5hQbnUXczoKWCEfiQftFXSs8Cun?=
 =?us-ascii?Q?7R7VU87s6Ldk+7Htc3Y/7vKYfvXbyu3W8FhVNscPWGI9CXaFUGggJEH2Mq2Z?=
 =?us-ascii?Q?ZnNkbnwbpnwWRLnXy/RHZ8diqhGSf2RMwN/KUlKxIKdJZTMFQhxZ6V0pjao1?=
 =?us-ascii?Q?cOZvpDUTSvVK0r0dTrBKz6RJONW2yLgTwGLmumaUNB7FPtE31xPqFnon/xql?=
 =?us-ascii?Q?q9tskyisgkIf6EmjgztfuUhrEupQEO1BU+W1UmSzKXG2BPa9IZM90xJgJPit?=
 =?us-ascii?Q?uOABoJFPIUg0tPj3UwFSIL7Pb1H2rcxx+bdJY1SGdDJIqonASNaHx9XgUX4e?=
 =?us-ascii?Q?YNn/Zq1lofKZI/TPoDWfaNVBovRPmwvr/A8x29RxXym9YHHUkTmrNlTgktXT?=
 =?us-ascii?Q?stzmFJkkQEoKyJ3cw3hj9Sd8rp25wIo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 6475f694-eb94-495c-fc29-08deab51271b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 09:23:37.0018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FuerHwtXM5GFeawXRfQk5QhdK71janhM/c8jakeLxsim3FYPkBHmdwDiPWcEaYv3XJPhBDpncXNR8Nt95Cxmwxt37ujp4I9izhQBt2Dtgxf+mKNX85vinzufyU6Jb8E6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1172
X-Rspamd-Queue-Id: C155C4DDC18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36311-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn:mid]

Hi, Conor

Thanks for the review.

> On Tue, Apr 28, 2026 at 01:28:05AM +0000, Changhuang Liang wrote:
> > > On Fri, Apr 24, 2026 at 04:13:21AM -0700, Changhuang Liang wrote:
> > > > Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1)
> > > > pinctrl controller.
> > > >
> > > > Signed-off-by: Changhuang Liang
> > > > <changhuang.liang@starfivetech.com>
> > > > +        properties:
> > > > +          pinmux:
> > > > +            description: |
> > > > +              The list of GPIOs and their function select.
> > > > +              The PINMUX macros are used to configure the
> > > > +              function selection.
> > >
> > > Why is the pinmux property needed?
> > > Can you use pins and function instead?
> > >
> > > Looking at the defines that you have added, it appears that lots of
> > > defines for the same peripheral share the same numerical values,
> > > suggesting that across peripheral, all (or most) pins would share
> > > the same mux setting/"function select", suggesting that pins/function
> would suffice.
> > >
> > > I'd like to see some justification for pinmux being the right
> > > solution here, like the "function select" used by one peripheral
> > > being significantly different for many of its pins.
> >
> > We think that implementing this in the pinmux will be relatively
> > simple. It avoids the need to create a large number of mapping
> > relationships in the driver, which simplifies our driver
> > implementation. I'm not sure if you'll find this explanation acceptable=
.
>=20
> I don't really see how pins + functions would require lots of "mapping
> relationships". Instead of having
> +/* pinctrl_sys2 pad function selection */
> +#define FUNC_SYS2_UART_CTS				1
> +#define FUNC_SYS2_UART_RTS				1
> +#define FUNC_SYS2_UART_DCD				1
> +#define FUNC_SYS2_UART_DSR				1
> +#define FUNC_SYS2_UART_DTR				1
> +#define FUNC_SYS2_UART_RI				1
> +#define FUNC_SYS2_UART0_TX				1
> +#define FUNC_SYS2_UART0_RX				1
> +#define FUNC_SYS2_UART1_TX				1
> +#define FUNC_SYS2_UART1_RX				1
> +#define FUNC_SYS2_UART2_TX				1
> +#define FUNC_SYS2_UART2_RX				1
> +#define FUNC_SYS2_UART3_TX				1
> +#define FUNC_SYS2_UART3_RX				1
> +#define FUNC_SYS2_UART4_TX				1
> +#define FUNC_SYS2_UART4_RX				1
> +#define FUNC_SYS2_UART5_TX				1
> +#define FUNC_SYS2_UART5_RX				1
> +#define FUNC_SYS2_UART6_TX				1
> +#define FUNC_SYS2_UART6_RX				1
> +#define FUNC_SYS2_UART7_TX				1
> +#define FUNC_SYS2_UART7_RX				1
> +#define FUNC_SYS2_UART8_TX				1
> +#define FUNC_SYS2_UART8_RX				1
> +#define FUNC_SYS2_UART9_TX				1
> +#define FUNC_SYS2_UART9_RX				1
> +#define FUNC_SYS2_UART10_TX				1
> +#define FUNC_SYS2_UART10_RX				1
> +#define FUNC_SYS2_UART11_TX				1
> +#define FUNC_SYS2_UART11_RX				1
> +#define FUNC_SYS2_UART12_TX				1
> +#define FUNC_SYS2_UART12_RX				1
> +#define FUNC_SYS2_UART13_TX				1
> +#define FUNC_SYS2_UART13_RX				1
> +#define FUNC_SYS2_UART14_TX				1
> +#define FUNC_SYS2_UART14_RX				1
> you just define a function called "uart" and have a simple map of that st=
ring to
> the number 1. You end up with a single array with the relationships, not =
lots.
>=20
> Frankly, pinmux just does not seem appropriate to me when it looks like 9=
0%+
> of the pin mappings for a peripheral share the same function value.
> There appears only to be a rare number of cases where that doesn't apply,=
 but
> that could be handled by having them represented by a different group/pin=
s
> node with a different function.

Thank you for sharing the method. We are trying to make some modifications,=
 and the results are quite good.

Best Regards,
Changhuang

