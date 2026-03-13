Return-Path: <linux-gpio+bounces-33319-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iK/8JenGs2kqawAAu9opvQ
	(envelope-from <linux-gpio+bounces-33319-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 09:12:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1171A27F5E7
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 09:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F268D3012BFF
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 08:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1973370D42;
	Fri, 13 Mar 2026 08:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="Cjr3xaVR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023095.outbound.protection.outlook.com [40.107.44.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D601335A390;
	Fri, 13 Mar 2026 08:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773389542; cv=fail; b=mlZEnetK+U12p9r3R0u+Lki/ZKZXHJ2/L4BWGNzIMefN3NNdatlAsp/HUqXB7PDHuJUlPqMF0JBZ03NggYNFBbTtNoxaLiWAVhf7ilwxL2xkMQ7oibcYaVgpe3PSFjpwoQAH320hYPONjCloRZUHQw0fV1+u5f/ud1OFI3woymk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773389542; c=relaxed/simple;
	bh=DvkNgpfyzCb9THKiKoV3ogRDzd/mLlf7/nQLL2eKrwM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iYeHNtgQ9d7MkPguJNp5ZK0hzY20SAZVKW36eq/B/+M8q7hhhWjiQ+ShnOUjwlT7Bv2TJ7mpH+3xDylPL7Xr7Q13DjyseJSJMNhELdul94M2Z4SmOGykqlOSHvNXRBs5b3AxVB6kLqZoxABYPtIGKzbQaQJC7RPmQL/xhP8PwRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=Cjr3xaVR; arc=fail smtp.client-ip=40.107.44.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2P6G5zKMtyjwxMAtGt8f5nHDYip8nPrQxOBUv6xLbGMj3UIjAbaxcgpqdG0TUQA++zW8DCfsxby4t4V+GK2fSfJOyl6q87V5Bt8Fap9NYbu62JiOKp1xAczdyq+3UUQ5fOxA4zgpomZBUXOL0VDmRZdyGmetauRyotmhD6hjG/y3M5I/LUVjqAx1drzlPz3Ple1rnBi2Ta8rhTFDI7MTOrkQLEVYMyR4d6KjYN8gJ4ebvmzsGEh5hEnwJ0FDGXccgBtRwp/64jNIuD4weAXh9OsF12RCqo4bXV49UlX3uTunQKm+JKgI144xmY6/afOTNyEm+cHAor0RpjY0a1UEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDM0BQDmFDF2o2BAZIvDrGZo8Yz/L8wYROijtGgvmgo=;
 b=C/dQZprzu2KR41C3v5oWypmeuwnk+akkoQ9Jd+ypLxBhYo6fT0TaZuZ+j9mJxkuyefC8uKoxz5xNYCJlOxAi5sGlGzzUqVhVlQIVf2dQXllbHAJ5Kv5oeiLG27/hg2lZj2wTs/y751UE5Yx97XUKM3OZYbH0GjNayQbH/qZiv1iJuCRAm+nWmSou4rhkE443SWismecjTePrhgWMmMAZqIshVWxDdiQAWjSfccP8kciAIVULFF/MC9BIHXYGE3T+W6yRnoBx+yPMN4wE+LqASR9YpQGatPSp9rfGrewgJkewRI29A3m+zRfe8OKVhGlr7092tMLh1uIM70jzazs8ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDM0BQDmFDF2o2BAZIvDrGZo8Yz/L8wYROijtGgvmgo=;
 b=Cjr3xaVRDP0N104JP7Io2DtwgGToxB7V59oc/l0UsnsJ9eQpi+Y4xDWeN80oQO5olmJLeZ+eBhQvy1tqD8R/+Ans31uaEtLo+FTKYO9j3gNDm9+/LioEd4WFWrMXe0ZtrrY2Uxa2zVYBip1cDWbI3DWVm8cOnxzkGcfN+OgTV/9YQMu6lTOP5gqekUT77Eg08I3u4pb86xyTGFPx0oYVUk9q8mT+UYf0ykqmAPXd34tthAmRiNni9kLyl7D4P5nR9T1U/J9COTQe0qPq5KPJwx1YwQK/4OVWWR0j1YuNMJvA/gsE3mcJ3/UEQNVn4/IiayAakh4wp3YGBifKusSQ8w==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TYZPR06MB6144.apcprd06.prod.outlook.com (2603:1096:400:341::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 08:12:15 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 08:12:15 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linus
 Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Ryan Chen
	<ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Thread-Topic: [PATCH v4 2/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Thread-Index: AQHcrWasfLNWtX5/y0SkB1cDA4lWiLWi5wYAgAkqVmo=
Date: Fri, 13 Mar 2026 08:12:15 +0000
Message-ID:
 <OSQPR06MB72521BCD9B380D43E3E3590D8B45A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260306-upstream_pinctrl-v4-0-ad4e8ab8b489@aspeedtech.com>
 <20260306-upstream_pinctrl-v4-2-ad4e8ab8b489@aspeedtech.com>
 <20260307-weightless-quirky-spoonbill-dacd89@quoll>
In-Reply-To: <20260307-weightless-quirky-spoonbill-dacd89@quoll>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|TYZPR06MB6144:EE_
x-ms-office365-filtering-correlation-id: fd03a64d-1756-414a-8c30-08de80d83cef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 ++sqSJsYT+i0lvpwEbElJUtpUMZK/D7rBe9jEIAJpxdQ0t7Qrt1BZaHmP9VocQDueUbhjNbgs36ysT660qOrqkLDi+56qcOd4IMVziQKTR8IZ2TaUbKUJhX/DLP07G7VO8YNAaCymSshZulvmELhwSKTHIQbO5D55mrRPbxby6PcHtfETDhpe/hnViK6bQ89Ta4+c3RVefAzJiOCVe3sbcnpVVwpF4zrFA1dXHpPDl1Lf7EHi+OGqB6TuHqD0rFf2SHZT7bhpY5NWJt+JJ8au+eMd25eRx5fBPIubkmYj92G85geS3ohegZ+OowoHVWhTEHNCe7uMV+5uGw9kJMhm6LSMIbCCed5sBI7May93Bj4wbxzXiXT3fLodzvnBxIcPYIvMTZNhlf1B9ZctzWSj28cLJEzX3UvGAQBFDGQSDywNIHBAk+luPPX7ovd20v3aONR2A0dpmh16lfjdOSmhZS4ig5iXiiml+RbsOmyJ9bHxtrZF5guHL4cA7lP5gJnwm/FpCkTI9abjbsCav1l1qqfFnlQjOBxTe0P8PlqxVP5N2qy0LrRHVvA1dGrvi4jhAZC2WbTTRk+2nEh4dvOPU41hfHAQ0uA/lywFboAsqt/jz9/8TJewTvMJPh50Nz2qvSSNpKYGx/YDthPeWaUWBiL5SG6i//OybrbW8s5dPDdT8/uCDy45bxBQiaG/xhaXSK49ywQ7GSl9VRSntpltY2ecS6dRh6sI4RUkb16EAV4jJQ7Hx2e+VqSHGrOrQSl
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jFNu9/wumGBgiTlxmRCIyvvbzwVqnC+qlBfTJTcE95rEEx/mytjPg+3RAc?=
 =?iso-8859-1?Q?iUQBLOmjC8IcBULQ+jCGkS8w64AjLt9UZ4OMcfTC0GfJAbFZbQF+IqBpXj?=
 =?iso-8859-1?Q?XA54M0VkGL/iAxW51gJ91rnUlrYqpfSlvnpCTcwWw16Wi6r6HLwJnrhhip?=
 =?iso-8859-1?Q?Lzxd/7dEzxORKSNN6cd0t6p48JaM9APLoIYQY3TbQJEX1HOgx/y5wgxino?=
 =?iso-8859-1?Q?0yFmZFIb0B7LJck3jm5WU2isd8TCo467AknsvhujkXOGvozatgOH3GxX5F?=
 =?iso-8859-1?Q?WDa0ZsRDNgZK77pF8cxeqhANnday2E9C7ifxIjK7JMqjj9kfsJAUXSMOrB?=
 =?iso-8859-1?Q?yFVkR6QJjqcxb1s1lMTagTJY/GVdxF7KcBPG3NW1zTQ2Z99a6bsrKKtKR1?=
 =?iso-8859-1?Q?XxeIlNlcx84b5s5TwW1JPQyegQvjVFBNOrv0S59mpJ443nskuyldc1xaXd?=
 =?iso-8859-1?Q?TKfWL8innTPFr1I5r+eMnxh8PMZQIaKr25QqOEEUR7ETaGjHdQYe0zCSjA?=
 =?iso-8859-1?Q?RkoYICKxz9MTK0MH1TiEvLBFLkTVA2TU7B4dItApSqgMXAuyF9rlxqwXqh?=
 =?iso-8859-1?Q?hdoFxxQKNu9lmH576pwn/QOTsy22+ySDfEyaiXXY/4jH7VkZIYvvmTwjM2?=
 =?iso-8859-1?Q?1qFRn42FVH+Re2SzWH1GSXpWCwb6B84fkisUyo9LERQ/PROTGmnVV5uKWV?=
 =?iso-8859-1?Q?dmxFrFHtCqTGS6J60eE8Skv+4u9xZkHTQollDkpxZBOttpLznRsM19Ze9G?=
 =?iso-8859-1?Q?MiEOIU9yX16NWDXh7MSApmD0V7qA7BkuNh+fHDVKE6M3+6Pw6egnFvdf6N?=
 =?iso-8859-1?Q?o/MXPDZ+OE97671g4BSDSdK99LHkfsHCBsVan7E31AhJCWHNokeDvleSQB?=
 =?iso-8859-1?Q?OO4Xc4cXR6Er3+WAg2gR6WPSpbXt5ciiHWJs/+XK9+4Qsa6HokeiUcIhRs?=
 =?iso-8859-1?Q?QsC5sAXM/8hAOrJy8SfeNkTCxIs5NqPW+ki0Hc8Km6CqvgNf0rVroSsg77?=
 =?iso-8859-1?Q?+JP59qMv85VmilnTLiD14nZ9E/uLooS6fDw5dC/jVbwhnW6ndxHgTT7O1q?=
 =?iso-8859-1?Q?W5XI8WjgXvZOMrrCndkdAeSwwjv7Z5mVCxBwHfPK/GVBai20OsCTaB/Gcq?=
 =?iso-8859-1?Q?29hqpeKPjvGeJnJGAYSYvqldehPL2sA+lgIeeI112gdYyNrTQOdRwEf/1Z?=
 =?iso-8859-1?Q?MVbFeGhXJ6cgo4Eo8vz0y/Dp0AzEbhle3aTgAFE3im4oNVEAZohe5eRvxG?=
 =?iso-8859-1?Q?N7sY/Mr7UQSTL8Y7Aj7GWNovzKruPpkFM+QF/enM4KEK01WJ7+2ZLC8ocz?=
 =?iso-8859-1?Q?XK092bP5FaD7gLnNJnHWVfyER2uAiMI2j1D7q60F11YMdj54qHcdhBBlGI?=
 =?iso-8859-1?Q?aqrSZ8vPSys67f3qo7UmMeb5XB3Jm0HMWfzZmA30klDgUvSaGXMnW5TnWy?=
 =?iso-8859-1?Q?1ZMcUuvW8RmStswMrHhpU6S5Mm9F7gferETkvjB6vNz2Ng61xKMJv+aEX6?=
 =?iso-8859-1?Q?zBem9Bs5mM5ru5MKYyiaJ3mX1wANMkQDKaSmBBfvIkMGBkq2z6hPImn7qG?=
 =?iso-8859-1?Q?0LQIqr0EMz9lkdwiYQpyJ9dktElpImYrVi8ibqr2fkSPlBqoWqSHMrV+at?=
 =?iso-8859-1?Q?8jvckOtyY3kRbIjKnJUc7JpeFchN6Emhwd+XJts4HLT17pq+pSF+Uvgm87?=
 =?iso-8859-1?Q?T7txW7YMKDKCMsU4mhPkzNdL0qLhN0JCK+xP8BbiS4DKOeKt/KsZqONi8B?=
 =?iso-8859-1?Q?YlbWaR8FdaV0k+TQjs5tEs8AAwnQURG/D6BWBLOKax6ZzURSj+5lqmLQ6l?=
 =?iso-8859-1?Q?yecoRb0Awg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd03a64d-1756-414a-8c30-08de80d83cef
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 08:12:15.6720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +OR0A0T1U4DkV+LJ796JUAMmntg6S6ILjnHCNpCYqUoC2EuyQ+vD+F/q9g+sEcU9Ip2PbD+ENSI49ihw6NvYlXgq8IrqxihjjEFeJtzEnbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6144
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[aspeedtech.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[aspeedtech.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33319-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[aspeedtech.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,aspeedtech.com:dkim]
X-Rspamd-Queue-Id: 1171A27F5E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Please post complete ast2700 SCU binding - what children do you have? If=
=0A=
> none of ones mentioned in the binding apply, then why the binding=0A=
> mentions them? why do you allow p2a if 2700 does not have it? And=0A=
> smp-ram?=0A=
=0A=
Yes, on reflection the approach taken so far is not particularly helpful,=
=0A=
as the binding has been extended incrementally without clearly defining=0A=
which SCU capabilities should appear in devicetree.=0A=
=0A=
> And if 2700 has silicon-id, interrupt controller, pinctrl etc, then why=
=0A=
> none of them were present in the example you added?=0A=
=0A=
You're right that the earlier example was incomplete. The example was=0A=
added while extending the binding for pinctrl support, and it did not=0A=
reflect the full set of SCU capabilities.=0A=
=0A=
> But more importantly, none of this was actually built tested/checked=0A=
> against DTS thus I cannot accept it. We are back to basics... post your=
=0A=
> COMPLETE DTS somewhere and provide link to it.=0A=
=0A=
The AST2700 devicetree integrating the patches on the upstream lists is ava=
ilable here:=0A=
=0A=
https://github.com/billy-tsai/linux/blob/integration/ast2700/arch/arm64/boo=
t/dts/aspeed/aspeed-g7-common.dtsi=0A=
=0A=
This isn't yet the complete description of the hardware you asked for,=0A=
that's something we need to better develop. To address that, I think we=0A=
can break the full set of SCU0 capabilities down into the following=0A=
groups:=0A=
=0A=
Providers:=0A=
- SCU interrupt controller (0x1c0-0x1c8)=0A=
- Host 0 interrupt controller (0x1d0-0x1d8)=0A=
- Host 1 interrupt controller (0x1e0-0x1e8)=0A=
- Resets (0x200-0x240, 0xf00-0xff8)=0A=
- Clocks (0x240-0x2f0, 0x300-0x3b0)=0A=
- Pinctrl (0x400-0x718)=0A=
- SW scratch registers (0x7b0-0x800)=0A=
  - `reg` describes the scratch register region that might be useful=0A=
  elsewhere?=0A=
    =0A=
Consumers:=0A=
- SSP control (0x120-0x160)=0A=
  - Reserved memory regions to map into SSP address space=0A=
=0A=
- TSP control (0x160-0x1c0)=0A=
  - Reserved memory regions to map into TSP address space=0A=
=0A=
- SCU interrupt controller (0x1c0-0x1c8)=0A=
- Host 0 interrupt controller (0x1d0-0x1d8)=0A=
- Host 1 interrupt controller (0x1e0-0x1e8)=0A=
- PCI control (0x900-0xb00)=0A=
  - Interrupt for VGA scratch register changes=0A=
    =0A=
Neither consumer or producer:=0A=
- Silicon revision ID (0x000-0x004)=0A=
- Hardware strapping (0x010-0x030)=0A=
- OTP strapping (0x030-0x038)=0A=
- System Reset Event Log (0x050-0x080)=0A=
- GPIO debug probe (0x0a0-0x0a8)=0A=
- Debug UART control (0x0a8-0x0b0)=0A=
- Misc reset / PCIe (0x0c0-0x0c4)=0A=
- SoC debug control (0x0c8-0x0cc)=0A=
- Free running counter (0x0e0-0x0e8)=0A=
- PSP control (0x100-0x120)=0A=
- PERST# interrupt log (0x1d8-0x1dc)=0A=
- RCRST# interrupt log (0x1e8-0x1ec)=0A=
- SMP scratch registers (0x780-0x7b0)=0A=
- EFUSE (0x800-0x870)=0A=
- PMU (0x880-0x8c0)=0A=
- Write control (0xb00-0xf00)=0A=
=0A=
The SCU0 node itself already acts as the provider for clocks and resets,=0A=
and the existing binding defines child nodes for the interrupt=0A=
controllers and pinctrl.=0A=
=0A=
The software-defined scratch registers are also exposed through the SCU=0A=
register space, but it is likely sufficient for consumers to reference=0A=
the SCU syscon node directly rather than introducing a separate child=0A=
node.=0A=
=0A=
What remains unclear is how best to model the secondary and tertiary=0A=
service processor control blocks (SSP/TSP) and the PCI control region.=0A=
The SSP and TSP controls consume reserved memory regions used to=0A=
configure the processors' address spaces, while the PCI control region=0A=
contains the VGA scratch registers used to communicate host display=0A=
ownership.=0A=
=0A=
The p2a and smp-ram features are supported on earlier generations=0A=
but are not present on AST2700, and should be disabled in the binding=0A=
for the AST2700 as you suggested.=0A=
=0A=
In the next revision, I plan to restrict these nodes for AST2700=0A=
using schema conditionals so that they are no longer allowed when the=0A=
compatible is "aspeed,ast2700-scu0" or "aspeed,ast2700-scu1".=0A=
=0A=
    allOf:=0A=
      - if:=0A=
        properties:=0A=
            compatible:=0A=
            contains:=0A=
                enum:=0A=
                - aspeed,ast2700-scu0=0A=
                - aspeed,ast2700-scu1=0A=
        then:=0A=
        patternProperties:=0A=
            '^p2a-control@[0-9a-f]+$': false=0A=
            '^smp-memram@[0-9a-f]+$': false=0A=
=0A=
Thanks=0A=
Billy Tsai=

