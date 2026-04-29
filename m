Return-Path: <linux-gpio+bounces-35779-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QgTlNIi98WkbkQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35779-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 10:12:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EBE4910BA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 10:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ABEEE300FA27
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 08:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289133A874C;
	Wed, 29 Apr 2026 08:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Nr4VicyO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010047.outbound.protection.outlook.com [52.101.228.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB46E3A6404;
	Wed, 29 Apr 2026 08:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777450371; cv=fail; b=T68tx7lAz5lxBxMJWIrFh3RcnR3PlPAnuR2mBVfWKp76zSWqzb3QIAKK+8DNpcyWcxPLuJe0c4MVzn8KdNIjAXFYzmhDL94aSN19nsUpEN+PWRR8yQzO3ig0i1WAu4yduVNdpPb+vhVtRiF6BC2wlPVYeLRhiPjk3oYOJdGZhOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777450371; c=relaxed/simple;
	bh=Dj/nC8UjlgZrKZJhfEZIBCI1TmrmdwEx/3yXMCK6bBk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AASGBlKvyiq/CkiogC5LDgAZSC8Blv29cudzy4cq/vX2CEKVvbB/OmoRM7zQUEWelXrv97urjn5jMHU0E6PlBHZmX6nZiRDH7F14oXlUBJMCwl4p6HNO6KPsT9DSxCem7DY23OoPnO6EZKc47X+661ol62KvRcFZe2ypwvnfadE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Nr4VicyO; arc=fail smtp.client-ip=52.101.228.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEoNus+CSpzrcnv+Mn60MsyAwS/8czN7T66JwzI7KlVZd1jcAN4GZEoy5uRFQoIHZ+WqniS4jqkAv62SjCesnhNuMPFL07JiLG4ZUkVfO9ZxP7wpLXC7RvRG817Gay01t1gFRe1nzubKuA8pWIIdeOVxbXiDaGcd6noavd4WKTc/2J69ndNvNOK3Nt4fCAsUAdVpkWBfJrjpYCcgpkgRFmkNO6MuM6lraBDg6uDPx5OaGAS5lg2JupjkmelKm1KUfsST3aVe38CnbEiiC8Y8+RshRScOkpLDMoGqJJn1XozCagmITgONedMyA/1EEYBd7SWPqbKl+S96jmZaoYX60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dj/nC8UjlgZrKZJhfEZIBCI1TmrmdwEx/3yXMCK6bBk=;
 b=Ck7OEGqmEogbEqPLqDq/JN1/w5l/4yByaSM16CBs5lV2ZjKBSADFG8T1m2zgEfPgmqpD6UzBOS3dZLpoG4IuzK3fgEFNl+uP5QYB5A+TOWT/RenDEj0B9xSoKsm7b/mfZ2z33Attj2CDzUWqzesBPPzH/dBwFXo+hG7HTUxy9B76p5gsHj3mqNU6dRCvUIRJuQb9adImazMJ003HYelACLBV1s0z7aKVHwUvUVxubZiQvIddAbp8xPu68ai3jNMnOqnoLUqz2hxXyvgrSNsytdbLbSt6WLP7ns0VHU2Rd4McYvr+elvvfIR9LJmuRg9REzwP0Wnm4kY80gwDqSYBeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dj/nC8UjlgZrKZJhfEZIBCI1TmrmdwEx/3yXMCK6bBk=;
 b=Nr4VicyO34GegfxHZAciN2YY2o74mf7ffbP/sg0/Qb6w0W7RZx/Ue1riudVPi1U0molmVO7ExZw5+aewYIkbnTwrS3sqJwJqo4wE67Q/mQbstDgVzpdKhbA11zr046mftVLquqM3jZEwbDB2teZrEEKb2zQ2lMHb43GC9+RY11c=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB9482.jpnprd01.prod.outlook.com (2603:1096:604:1c9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 08:12:45 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 08:12:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Linus Walleij <linusw@kernel.org>, magnus.damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 6/8] pinctrl: renesas: rzg2l: Add support for RZ/G3L
 SoC
Thread-Topic: [PATCH v3 6/8] pinctrl: renesas: rzg2l: Add support for RZ/G3L
 SoC
Thread-Index: AQHctfcnk+XyjYwDMEOgq1I7W7WwtbX1F5SAgADbfIA=
Date: Wed, 29 Apr 2026 08:12:42 +0000
Message-ID:
 <TY3PR01MB11346191CC36FC1E2875A046686342@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
 <20260317101627.174491-7-biju.das.jz@bp.renesas.com>
 <CAMuHMdWc_ffY83M8aR91X+=R3_n5go8q9E7-L1Q8YN-5z64grw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWc_ffY83M8aR91X+=R3_n5go8q9E7-L1Q8YN-5z64grw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB9482:EE_
x-ms-office365-filtering-correlation-id: 98e0f7a0-36fe-4393-76a9-08dea5c7163e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 MExnknCMpdUxgOP9RpugEYQ7GSKOaZQXugOkkNDGRM2B/Cd0gsJHho/riIgrf2ophV0TJs/KB9DL1vpc7CKTBhZF0w6hAamJD2x12YSktTrEKfPP1kUhG2SwIwtFyBgLlGDzcbudn2STe3bXvao2hMWtYxbHvAbuLUJE+xHwTxxk80lEUiZNTSQKXJqbQzt/ZuBY1BE+1PvfFCZR3QWUCU72T/PouXDhKVHBs3WHasXYO5jETlJBvSVzFR1KywyQAXFxuOYY1YnSa0AzmHP9X0Xeie4V32t9JBT75XuM0xnGMcfsdV2Z0e9jSOymMNQGnA+ZUtF1NU70gwCQEM8dadDEf3dKuZe3GJNieRGSHtrE0Vd7BLVSRZj57fP/yDDMGdrEYe+aPKU0fHvOdoR4pZIwM/966k1xad18iPWeVTpQNPCU5oFaC44tZHZNso9jUfwxxVVvo8rsilmdKaD/NcAl5ETCVxlav5XC/4fMwrfMjh7AA0YFdZQ14CjdfXVfNGr5tdE+2u7+xuubm2C8nDooGPwXupzv+kTe2NZU9z3ge5cMELu7MpH0BskmbQs0ldb4ve83vVj1vNKUwn5IOprCU8qaanUZu+yLhaELOwKvnaiEUosLHlSiG8sdH7ucSNHGWlXw/aXbnTtUD+AOq0BF0cGAZ9O3WJL12x+UI4NQ001Ln3WC4SyhfwqDMcBMpjKrpPkdFRE+HpRWuuUlXxW9G/qBtlrJkhOTDvdCm5u5BbWavy51ImsdHeu3UK06bVomlHKBtqqSQmNWJqkn3WMOXJQ3cqw9F6gAnmGV8YM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WEswOVVlNEpjWVRsT0k3V2pYTkREYkRTWU1QbTJRQXF3cEtEYXFDR1pkNG5p?=
 =?utf-8?B?TFgxZEJYWGF3TGRPWDlSQStjZm1tVUlqb3ZmM1FWcXozN1RxLzJYZlJWZk53?=
 =?utf-8?B?SzJudCt4bERrT1JwQlZKSUFZK3M1MXN4VUtKNEg4bU9GM2RVYWpSSmsrYmI4?=
 =?utf-8?B?WkJObmdzUnlRKzA2T0h3Sm9wZm1SMUsxM1R4NkJTRVZQeDZmdHlBbkdOOU4v?=
 =?utf-8?B?c2dtOTd4RG56cDJNLzRpenlnczZWb1NZZ2FIL2dCUmE1aEhwVmtHanVHdFBu?=
 =?utf-8?B?b0xSck12R0tOZ1dIRUlKM3k2VFhpYytNeEZ6ZGVsK1JDd0hGMU1SazRqSWVl?=
 =?utf-8?B?UDhWR2IrM3FFSFZaMGlzOVZkbVVNVzA3NGVJb3dyd3BiNnVKQk5oYW1ueVFn?=
 =?utf-8?B?WHljSFhVazF6enBMTlN5MXFBZWd6RDRrMUxwRnhOMXBNQzZQWnVVUVNySnkw?=
 =?utf-8?B?UDJBUzJ6M0lLOU5oYXphU0JseW13eU1WZ2ZOc3EvWTlqRDBpSGZCaDlIbG9D?=
 =?utf-8?B?Y0htNVRGWllqQnVJOC9SZnVCT0FZektEUjl4RXAwK3djQ1E5dDhVWGVxY3ZP?=
 =?utf-8?B?RVc2WCszVmxQYVlsYlJZMkZyVEpPSEtrVG5YQ1VJUkRwV1RKazN4T3dkbXFY?=
 =?utf-8?B?bXl4Wit6R2Z3TjhZdUl4ZUdzQjV4N01KNVNhNnJOelh3eWlNN3IzaVNsenRQ?=
 =?utf-8?B?aE5VMnhDOWkyWWlVZktidlFIT09XQTJLbk1jWGM2MXlLc0Mrd2RvRDJpaWVJ?=
 =?utf-8?B?Rm9QUkJtbzJVUmVlWkhRM1U0b2lraDlya0VKZklQNm93YTVXRzVqV1Y5NEhK?=
 =?utf-8?B?UVVUSVBkT3lKZTRtcytSYUYzdzA5RnBlWC9CY2tNMzFtSUh4ZDM2dHRnaTE0?=
 =?utf-8?B?REJHZFBWb0RhaU51cjJYbTFQTUd3ZXMvN3JCb0Q2emNlZ0hvQVJvdEVmLytx?=
 =?utf-8?B?R3BxK0EyaVVlai9zeUF2MjBuN0VNcXl5TlZsSTBxQmx0VTdrbGJMWSsxQUFl?=
 =?utf-8?B?SXpWVmFqbzlEcEVzK1FrZnRUSEE2RjR1WkFLZ1ROWUliREIzQWtwUmorYmJk?=
 =?utf-8?B?b0J1UTN4UVVrc3BXNld0YTBPU3RqNTdWSkxYL3krbmRDL1dKQkVzMUxtcHhQ?=
 =?utf-8?B?SmxyYTF2ZTJCdTNDL0tJb0hXWnN6d3AvWmhoSWhoRktyemJaR3ZrK0FGdDlU?=
 =?utf-8?B?Ri9MNytSbkZ5ZHl3RDNPVHYvQzJvRjNHRXdjZS9UVlAxUGw3RktSUFFwdmVy?=
 =?utf-8?B?MnBFaXJUK3FFdFZnZHBxUVNIVHd1VlpCQy9VWUloNGIrRTFoQW4xKzlMbC9q?=
 =?utf-8?B?SnFxNEJ3amRGUUxlWjQveW9FWHlrVnc2cml1VWhmMFBjSm1nRXBEeWV6djd2?=
 =?utf-8?B?N2JLaktpN2c5WHF1YndIam1Pck41OGw2YkszcE5Yd21keEw3Vi9vNm1hN3Rw?=
 =?utf-8?B?Z2FscXNKSXR0YzlWTy9aN1JvOElmWi9SYi9xaURJUlllZzRxNmk5aVBKTjZS?=
 =?utf-8?B?cWpNTWJLMElPbDY4VTYxNzl6ZWs1R1VpeUpLczZtTldsenNEOEdXOExHTnJT?=
 =?utf-8?B?MEdHTERsQUJ3L01xZVJoQ2owb3dORDM2bzkvQWsyMHplWUJ3MnFWbG93Q29U?=
 =?utf-8?B?VkVGWS9lRjd0eXA5QU9lUEhHeWJMM0lsa0pKR09FdEVZRkpkVzNqZWkwVS82?=
 =?utf-8?B?cTlDTm5VTTJBSkJod1YyYmx2VGs5UHRRa1ZNV0QwR3JJWXJ1TzBQaEhscjQz?=
 =?utf-8?B?R0FzVWRhNDVQbWE0SUgvNlNnckdGU2pLY3g0bU1JL1dqMDlqZDlBMzF6WEgz?=
 =?utf-8?B?N3hTdDRmWjFQM3A3aW5nQmJLYjB0VWJRaklBb2x0ZGJuUWk2TzRWNHlFbDBC?=
 =?utf-8?B?Zno0LzdoZDBmRGoxeGp1RW1aUHJSWldkcGxUemg4dk9BZ24xR05VeTJ0SERi?=
 =?utf-8?B?QksyNTdXTVVQWlVHMWhGSE5yL0ZIODI3TmFqeXZrRGw0czc5WERnVDArQ1Jx?=
 =?utf-8?B?R0JROUsxTlNld3pvK21KTkpmQmQ4UzVEcGRiemtiYlUwaHBOMFFGTHRrZy9n?=
 =?utf-8?B?YzgydTN4TldHN0lCdWRRZkJKTlhVNzVGUmVFWnRoTVp1dHMwcm5WVU1zbTB0?=
 =?utf-8?B?Z0RPNVg3ak1pcTEycTNKSHFhUklGMVBnWWxrTE5TVEc5dTBDUUR1QVovTjg1?=
 =?utf-8?B?YUVCcTF6K2tROGRhQS9heXB2cUVTaUQzbjdxeitEYTVyM3JtcXpOZWN1VGhS?=
 =?utf-8?B?a0dLL0FremJXWnZTWlR5K0N0ZmxWV1oyOFJ0WlZyTkhNU2Q3eWY5T0xheXRv?=
 =?utf-8?B?elBPMklaZGdzVWpJVVc5REhHb2x4OWZlelQrb1l4TXhUSFE5cmVhQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e0f7a0-36fe-4393-76a9-08dea5c7163e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 08:12:42.2818
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MLfY/UAw5VZBHbMkWd0tTanjFwdTHE6b60DCpnnmwKOpURl7/YStdkimEQyA1OeSyTyWeP5U0HwMh8xRzSFrHtBFxvYsp+n1dToprhYEKRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9482
X-Rspamd-Queue-Id: 69EBE4910BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35779-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim,linux-m68k.org:email]

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI4IEFwcmlsIDIwMjYgMjA6MDQNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyA2LzhdIHBpbmN0cmw6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgc3VwcG9ydCBmb3IgUlovRzNM
IFNvQw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgMTcgTWFyIDIwMjYgYXQgMTE6MTYs
IEJpanUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gQWRkIHBpbmN0cmwgZHJpdmVy
IHN1cHBvcnQgZm9yIFJaL0czTCBTb0MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0
Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYw0KPiAN
Cj4gPiBAQCAtMjQ3OSw2ICsyNjE0LDM3IEBAIHN0YXRpYyBzdHJ1Y3QgcnpnMmxfZGVkaWNhdGVk
X2NvbmZpZ3MgcnpnM2VfZGVkaWNhdGVkX3BpbnNbXSA9IHsNCj4gPiAgICAgICAgICAoUElOX0NG
R19JT0xIX1JaVjJIIHwgUElOX0NGR19TUiB8IFBJTl9DRkdfSUVOIHwNCj4gPiBQSU5fQ0ZHX1BV
UEQpKSB9LCAgfTsNCj4gPg0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJ6ZzJsX2RlZGljYXRl
ZF9jb25maWdzIHJ6ZzNsX2RlZGljYXRlZF9waW5zW10gPSB7DQo+ID4gKyAgICAgICB7ICJXRFRP
VkZfTiIsIFJaRzJMX1NJTkdMRV9QSU5fUEFDSygweDUsIDAsDQo+ID4gKyAgICAgICAgIChQSU5f
Q0ZHX0lPTEhfQSB8IFBJTl9DRkdfV0RUT1ZGX05fUE9DKSkgfSwNCj4gPiArICAgICAgIHsgIlND
SUZfUlhEIiwgUlpHMkxfU0lOR0xFX1BJTl9QQUNLKDB4NiwgMCwNCj4gPiArICAgICAgICAgKFBJ
Tl9DRkdfSU9MSF9BIHwgUElOX0NGR19QVVBEIHwgUElOX0NGR19QVkREMTgzM19PVEhfQVdPX1BP
QykpIH0sDQo+ID4gKyAgICAgICB7ICJTQ0lGX1RYRCIsIFJaRzJMX1NJTkdMRV9QSU5fUEFDSygw
eDYsIDEsDQo+ID4gKyAgICAgICAgIChQSU5fQ0ZHX0lPTEhfQSB8IFBJTl9DRkdfUFVQRCB8DQo+
ID4gK1BJTl9DRkdfUFZERDE4MzNfT1RIX0FXT19QT0MpKSB9LA0KPiANCj4gVGhlIG1haW4gZG9j
dW1lbnRhdGlvbiBpbmRlZWQgY2FsbHMgdGhlc2UgcGlucyAiU0NJRl9SWEQiIGFuZCAiU0NJRl9U
WEQiLCBsaWtlIG9uIFJaL1YySCBhbmQgUlovRzNFLg0KPiBIb3dldmVyLCB1bmxpa2UgdGhlIGxh
dHRlciBTb0NzLCBSWi9HM0wgaGFzIG11bHRpcGxlIFNDSUYgaW50ZXJmYWNlcy4NCj4gQXMgdGhl
IHBpbiBmdW5jdGlvbiBzcHJlYWRzaGVldCBkb2VzIGNhbGwgdGhlbSAiU0NJRjBfUlhEIiByZXNw
Lg0KPiAiU0NJRjBfVFhEIiwgYW5kIHVzZXJzIHdpbGwgcHJvYmFibHkgdXNlIHRoYXQgc3ByZWFk
c2hlZXQgdG8gZmluZCB0aGUgcmlnaHQgcGluIGNvbnRyb2wgY29uZmlndXJhdGlvbiwNCj4gSSB0
aGluayBpdCBtYWtlcyBzZW5zZSB0byB1c2UgdGhlIG5hbWVzIHRoYXQgaW5jbHVkZSB0aGUgemVy
byBpbmRleC4NCg0KT2sgd2lsbCBhZGQgemVybyBpbmRleC4NCg0KPiANCj4gPiArICAgICAgIHsg
IlNEMF9DTEsiLCBSWkcyTF9TSU5HTEVfUElOX1BBQ0soMHg5LCAwLCAgUElOX0NGR19JT0xIX0Ip
IH0sDQo+IA0KPiBPbmUgc3BhY2UgdG9vIG1hbnkgYmVmb3JlIFBJTl9DRkdfSU9MSF9CLg0KDQpX
aWxsIGZpeC4NCg0KPiANCj4gPiArICAgICAgIHsgIlNEMF9DTUQiLCBSWkcyTF9TSU5HTEVfUElO
X1BBQ0soMHg5LCAxLA0KPiA+ICsgICAgICAgICAoUElOX0NGR19JT0xIX0IgfCBQSU5fQ0ZHX0lF
TiB8IFBJTl9DRkdfUFVQRCkpIH0sDQo+ID4gKyAgICAgICB7ICJTRDBfUlNUIyIsIFJaRzJMX1NJ
TkdMRV9QSU5fUEFDSygweDksIDIsIFBJTl9DRkdfSU9MSF9CKSB9LA0KPiA+ICsgICAgICAgeyAi
U0QwX0RTIiwgUlpHMkxfU0lOR0xFX1BJTl9QQUNLKDB4OSwgNSwNCj4gPiArICAgICAgICAgKFBJ
Tl9DRkdfSU9MSF9CIHwgUElOX0NGR19JRU4gfCBQSU5fQ0ZHX1BVUEQpKSB9LA0KPiA+ICsgICAg
ICAgeyAiU0QwX0RBVEEwIiwgUlpHMkxfU0lOR0xFX1BJTl9QQUNLKDB4MGEsIDAsDQo+ID4gKyAg
ICAgICAgIChQSU5fQ0ZHX0lPTEhfQiB8ICBQSU5fQ0ZHX0lFTiB8IFBJTl9DRkdfUFVQRCkpIH0s
DQo+IA0KPiBPbmUgc3BhY2UgdG9vIG1hbnkgYmVmb3JlIFBJTl9DRkdfSUVOLg0KDQpNaXNzZWQg
aXQsIFdpbGwgZml4Lg0KDQo+IA0KPiA+ICsgICAgICAgeyAiU0QwX0RBVEExIiwgUlpHMkxfU0lO
R0xFX1BJTl9QQUNLKDB4MGEsIDEsDQo+ID4gKyAgICAgICAgIChQSU5fQ0ZHX0lPTEhfQiB8IFBJ
Tl9DRkdfSUVOIHwgUElOX0NGR19QVVBEKSkgfSwNCj4gPiArICAgICAgIHsgIlNEMF9EQVRBMiIs
IFJaRzJMX1NJTkdMRV9QSU5fUEFDSygweDBhLCAyLA0KPiA+ICsgICAgICAgICAoUElOX0NGR19J
T0xIX0IgfCBQSU5fQ0ZHX0lFTiB8IFBJTl9DRkdfUFVQRCkpIH0sDQo+ID4gKyAgICAgICB7ICJT
RDBfREFUQTMiLCBSWkcyTF9TSU5HTEVfUElOX1BBQ0soMHgwYSwgMywNCj4gPiArICAgICAgICAg
KFBJTl9DRkdfSU9MSF9CIHwgUElOX0NGR19JRU4gfCBQSU5fQ0ZHX1BVUEQpKSB9LA0KPiA+ICsg
ICAgICAgeyAiU0QwX0RBVEE0IiwgUlpHMkxfU0lOR0xFX1BJTl9QQUNLKDB4MGEsIDQsDQo+ID4g
KyAgICAgICAgIChQSU5fQ0ZHX0lPTEhfQiB8IFBJTl9DRkdfSUVOIHwgUElOX0NGR19QVVBEKSkg
fSwNCj4gPiArICAgICAgIHsgIlNEMF9EQVRBNSIsIFJaRzJMX1NJTkdMRV9QSU5fUEFDSygweDBh
LCA1LA0KPiA+ICsgICAgICAgICAoUElOX0NGR19JT0xIX0IgfCBQSU5fQ0ZHX0lFTiB8IFBJTl9D
RkdfUFVQRCkpIH0sDQo+ID4gKyAgICAgICB7ICJTRDBfREFUQTYiLCBSWkcyTF9TSU5HTEVfUElO
X1BBQ0soMHgwYSwgNiwNCj4gPiArICAgICAgICAgKFBJTl9DRkdfSU9MSF9CIHwgUElOX0NGR19J
RU4gfCBQSU5fQ0ZHX1BVUEQpKSB9LA0KPiA+ICsgICAgICAgeyAiU0QwX0RBVEE3IiwgUlpHMkxf
U0lOR0xFX1BJTl9QQUNLKDB4MGEsIDcsDQo+ID4gKyAgICAgICAgIChQSU5fQ0ZHX0lPTEhfQiB8
IFBJTl9DRkdfSUVOIHwgUElOX0NGR19QVVBEKSkgfSwNCj4gDQo+IFRoZSBTRCBkYXRhIHBpbnMg
YXJlIGNhbGxlZCAiU0QwX0RbMC03XSIgaW4gdGhlIG1haW4gZG9jcywgYnV0ICJTRDBfREFUWzAt
N10iIGluIHRoZSBzcHJlYWRzaGVldC4gU28NCj4gcGxlYXNlIHBpY2sgb25lIG9mIHRoZXNlIDst
KQ0KDQpJIHdpbGwgc3RpY2sgd2l0aCBzcHJlYWQgc2hlZXQuDQoNCj4gDQo+ID4gK307DQo+ID4g
Kw0KPiA+ICBzdGF0aWMgaW50IHJ6ZzJsX2dwaW9fZ2V0X2dwaW9pbnQodW5zaWduZWQgaW50IHZp
cnEsIHN0cnVjdA0KPiA+IHJ6ZzJsX3BpbmN0cmwgKnBjdHJsKSAgew0KPiA+ICAgICAgICAgY29u
c3Qgc3RydWN0IHBpbmN0cmxfcGluX2Rlc2MgKnBpbl9kZXNjID0NCj4gPiAmcGN0cmwtPmRlc2Mu
cGluc1t2aXJxXTsNCj4gDQo+ID4gQEAgLTMyNjMsNiArMzQzMiw4IEBAIHN0YXRpYyBpbnQgcnpn
MmxfcGluY3RybF9zdXNwZW5kX25vaXJxKHN0cnVjdA0KPiA+IGRldmljZSAqZGV2KQ0KPiA+DQo+
ID4gICAgICAgICBjYWNoZS0+cXNwaSA9IHJlYWRiKHBjdHJsLT5iYXNlICsgUVNQSSk7DQo+ID4g
ICAgICAgICBjYWNoZS0+b2VuID0gcmVhZGIocGN0cmwtPmJhc2UgKw0KPiA+IHBjdHJsLT5kYXRh
LT5od2NmZy0+cmVncy5vZW4pOw0KPiA+ICsgICAgICAgaWYgKHJlZ3MtPm90aGVyX3BvYykNCj4g
PiArICAgICAgICAgICAgICAgY2FjaGUtPm90aGVyX3BvYyA9IHJlYWRiKHBjdHJsLT5iYXNlICsN
Cj4gPiArIHJlZ3MtPm90aGVyX3BvYyk7DQo+ID4NCj4gPiAgICAgICAgIGlmICghYXRvbWljX3Jl
YWQoJnBjdHJsLT53YWtldXBfcGF0aCkpDQo+ID4gICAgICAgICAgICAgICAgIGNsa19kaXNhYmxl
X3VucHJlcGFyZShwY3RybC0+Y2xrKTsNCj4gPiBAQCAtMzI4OCw2ICszNDU5LDggQEAgc3RhdGlj
IGludCByemcybF9waW5jdHJsX3Jlc3VtZV9ub2lycShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4g
ICAgICAgICB9DQo+ID4NCj4gPiAgICAgICAgIHdyaXRlYihjYWNoZS0+cXNwaSwgcGN0cmwtPmJh
c2UgKyBRU1BJKTsNCj4gDQo+IFJaL0czTCBkb2VzIG5vdCBoYXZlIHRoZSBRU1BJIHJlZ2lzdGVy
Lg0KPiBIb3dldmVyLCB0aGlzIHdyaXRlIGlzIGhhcm1sZXNzLCBhcyBpdCBoYXMgdGhlIFNEX0NI
MV9QT0MgYXQgdGhpcyBvZmZzZXQsIHdoaWNoIGlzIHRodXMgc2F2ZWQvcmVzdG9yZWQNCj4gdHdp
Y2UuDQoNClFTUEkgaXMgYXZhaWxhYmxlIG9ubHkgb24gUlove0cyTCxHMkxDLEcyVUwsRml2ZX0g
U29DLiBJIHdpbGwgY3JlYXRlIGENCnNlcGFyYXRlIHBhdGNoIGZvciBzdXBwb3J0aW5nIG9ubHkg
Zm9yIHRoZXNlIFNvQ3MuDQoNCkNoZWVycywNCkJpanUNCg==

