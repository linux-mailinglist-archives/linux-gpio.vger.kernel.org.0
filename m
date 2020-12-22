Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3778E2E07BA
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Dec 2020 10:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgLVJLh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Dec 2020 04:11:37 -0500
Received: from mail-eopbgr140058.outbound.protection.outlook.com ([40.107.14.58]:48708
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725938AbgLVJLg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Dec 2020 04:11:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nemYO8HbTcYliD6vbx13cUeDhYgr5P91RRlsapGv+y9gxJgVmzgf2CQNpqUHvqJPhpfr+EAm+u5DlUIhIDdwZO3voRtSuw4JTwREkGCjUkkxdrpgOJmh3/or/ezC0Z1MFkoFNKMLlz0fwW8iRNVmRqL5zIwfzYSpCVZpqCMwqKQ/9GLbNBSFtpEg8Vp7qWguBpJnLoX0zWxZXhY6v5ijBT5CnMKLoDjXe4oveoZv1tzmHT7eDnlRz1goLldvTdg4VeoX25I+NYIh9vQNyKFua2SGE1iOCJqm8cmEINmG/gzma1NVMIDCyGQLOb2Fcl3sQhwkPh3JMa0QdTk+n7A5gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rg2PIU6Ys//Zm64LtKLAeCLl4nsvwkUqgFvKyGpXDLs=;
 b=AZeIweXF22memFngPmhDqCwNdv2PdQr1QbkUw4bj5lREVaqCNYDTYWmRAplomK8FTNpsTM569EMAgAhhaAQ3EaDBa94NodNSfRxJlh7BcX3nvhIL+ZDz7JRH+KtFLT39aHPMF5sgOTksYG+PsLld9QLwJD+3SUkeijba5xERKLBlrYNwmL3Pk00C4LkeA4aPFO52pnGIokhdrRO2j4d1dEjjL4/q/MqkKa1y6Nf0WSuTeJW8Kuj+lTLbc2ZTgX/aKCjdQJ5cNePYy9diuYNwfyr1u5NVIJsSzKMszHIGqqFMXmAvoSn6cWiy0sJeFv5APyT/7GOX4uWihu5ab9tTag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rg2PIU6Ys//Zm64LtKLAeCLl4nsvwkUqgFvKyGpXDLs=;
 b=dxq/YaaOJ94wxthydmBtUUfVnoamm2SspYhaGZZtdMP7XiePG0xlMWyzcyS5XigNasTYzCa6cUaZmMsuLI2zP2bYq05sGIyWm4WEK7T3fG8tlGT704cCAKVYkZ9BBOt2KSKBD0LP6p3ZEwzWoAmFG6RdSubvNUN5ulZmQELPlCg=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB3066.eurprd03.prod.outlook.com (2603:10a6:7:62::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.14; Tue, 22 Dec 2020 09:10:38 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 09:10:37 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>
CC:     "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 01/12] mfd: bd9571mwv: Use devm_mfd_add_devices()
Thread-Topic: [PATCH v4 01/12] mfd: bd9571mwv: Use devm_mfd_add_devices()
Thread-Index: AQHW10SmCJgv/4KbBUSo9xcqu6qSqaoCzfwAgAAH+QA=
Date:   Tue, 22 Dec 2020 09:10:37 +0000
Message-ID: <25faecf1177e3634d2a153c0f764098e50e5498c.camel@fi.rohmeurope.com>
References: <1608519279-13341-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1608519279-13341-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <CAMuHMdXp8cuO8ppNbDTmt4aovDCvC9EG23NHoZNAZK5Y0eD4Ww@mail.gmail.com>
In-Reply-To: <CAMuHMdXp8cuO8ppNbDTmt4aovDCvC9EG23NHoZNAZK5Y0eD4Ww@mail.gmail.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ac6dcb3-2b31-4d41-c7d9-08d8a659729c
x-ms-traffictypediagnostic: HE1PR03MB3066:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB3066AE7B919C356C5706816AADDF0@HE1PR03MB3066.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DKND6tu6dpZsiL6U0Wth0+6984uBHjbKjahmzvIo3N/QNaayBExfGjZW5YpeozsS8Ew+4X3n8sQ8RbwgkeINAS+zMiKJucwUMOj49Sipd6Js1gd1FwqRBD8LADkPh2dxmAS+HplTPopGAn8j2OU9svK1lh4bZf2nKY7Oa4VADQBHChKGbMB2xCWx/TAlDOmWw7/Ys7hmCMREW9qWhtU8VkxmRCl3lRO9UOEbtlBwamyWoyqMjF/KVlnsri5qHCCDlfTY22oJ8UefpId24G1QUqWwF+7LjS+E7pW/CBfN0Mlf+Rvdh0YrT+MDVvEm02hWg9gbRv6e84k6Aaiac+ft3g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(376002)(136003)(366004)(4326008)(53546011)(26005)(86362001)(5660300002)(76116006)(4744005)(4001150100001)(66946007)(66446008)(7416002)(186003)(2616005)(66556008)(2906002)(64756008)(316002)(66476007)(110136005)(8676002)(6506007)(8936002)(6512007)(478600001)(3450700001)(6486002)(54906003)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Zk9MdVJXUTZiTVBKU29PS3FIMm4yK1NlN1hnb21DMVg0cTMrdzNvc1Rsc2dH?=
 =?utf-8?B?SStlazF0VFl0c2R6MEc3cmwwa2c5YVBXMlJJc3U2MzM5V1laQ2ZrVzM0Vkdq?=
 =?utf-8?B?YTVqWHNTN21UaXpteHhhWTJqNlZxWE1mTlp2djZkeW9uK1dlbHd3YlM1SXlh?=
 =?utf-8?B?RXp0VUFhc05qNTJ4cHhGS2RNZFhpMGFnbXpneDBjK29Oc01LVC9ObldmKzhR?=
 =?utf-8?B?bTF5QThmcGxRTVE4TnFjdWFlS3hYK3V1VzJ5N3JpYUN0dTgwcXlmU1JxaXBC?=
 =?utf-8?B?R3BGVERCeEVTU2hBbjliRWFpc3RzVHdRM2ZFVEJJaGVNbk5qZGZhSndwMkV5?=
 =?utf-8?B?WVZNT1c5bFJMQkVOeVgyUE9lNEt1d3dodlFqbDNDTDl6dEZUZ01MTmVlZVFo?=
 =?utf-8?B?ZnNoY2JESVN1WkVsZForTTJtOUlDYU9qaXVTNzduZkFaUU0yU1VpREZpOEpY?=
 =?utf-8?B?K2xGUjRxSUk4Sk9xdjQ5aVIxV0hoUUlqMm9hN3VkbnBoTS9hSlI4TlhmbFpy?=
 =?utf-8?B?eWUxQmFQQWpBQ2RYbGs5L2w4N0YwSkpYWTJqU01EUGFFUU5BZUkxalRvdk5u?=
 =?utf-8?B?TTg2N1I3MVlJUHlQVEt4TEtJa3d5NWNaaXNhRm53YjcvWlp6MFdKUDlud24r?=
 =?utf-8?B?aFpYU0haVVdoV25uN09EUmhGeEc2cEZ4L3pzeTRvR2k3dnV1SUFteTlKM1My?=
 =?utf-8?B?WUZYbFRJb0tSTW5vcHRURUpJN3ZlakJEaHRMSmZxOVZXQmhFZE9UcGRuUzNO?=
 =?utf-8?B?bkNQcUJyTi8vWkJqbEh5eFN4K216STRXSDVwdmJHaGJTRDZkM1FoS0dZUzU4?=
 =?utf-8?B?b3ljWlFMbUw2UklDVDFZUU52UHlOZngyWTVWK0ZhUUFsTUpsS0ZOK29RRHl3?=
 =?utf-8?B?d29keGtKY3FBVnRTM0Q4d2VkamNkTW4zSDRFN2dkQThFMTVjWDBPNTRJY2RJ?=
 =?utf-8?B?eHRING9kR1JjRERGUk1nZExGSWUxSmhXek03dnRuWmJ1QTNQRitjYUhmSTBk?=
 =?utf-8?B?c2xOTnRCK0FIb0FOQTFqdVJYYzE0c2ZoV2VWNllWbWhUY2UraitGYWF1MzFL?=
 =?utf-8?B?eVVDRUJzc3l2QUVGdGoydGt5TlNlSFZpQ2s4QmxGZkUwUHdFQ3dodkdVVElp?=
 =?utf-8?B?MVhKOXRrdzNxTmhrb0p6WVRyaTZyaUZLQi9Jdk5PejlvZzhvWElkUTlqSkQr?=
 =?utf-8?B?ejg4N3k4TUNXVGNONGlVMXQyUXVHcEM2eHkrcW1sUEtOODJpcEFrK0FyQ0RL?=
 =?utf-8?B?TGF5dVlSSEF1eUp6cCtUaE1taDlkREsxZk16RUZPUzgvdUtPQ3V4TTNYeVhi?=
 =?utf-8?Q?ysqMaTWWzROFkYEIg9HZE1tL0mA6g1AhUh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CF5F6054FF6D244BFE3DD0B6C5FD114@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac6dcb3-2b31-4d41-c7d9-08d8a659729c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2020 09:10:37.6633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bT7m8CbcTW/s56vJU4azWPL/YO5flM3nrXPozmGlzJ3QpXrxG+llyFR93E07AaDaU19tIPKHRRx+XCQt58qDqCVCrDIuLMk3eDO4w6eFI3Ha4Qpt9SAaYTT8ZdQ56AWy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB3066
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUdWUsIDIwMjAtMTItMjIgYXQgMDk6NDEgKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3
cm90ZToNCj4gT24gTW9uLCBEZWMgMjEsIDIwMjAgYXQgMzo1NyBBTSBZb3NoaWhpcm8gU2hpbW9k
YQ0KPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFRvIHJl
bW92ZSBtZmQgZGV2aWNlcyB3aGVuIHVubG9hZCB0aGlzIGRyaXZlciwgc2hvdWxkIHVzZQ0KPiA+
IGRldm1fbWZkX2FkZF9kZXZpY2VzKCkgaW5zdGVhZC4NCj4gPiANCj4gPiBGaXhlczogZDNlYTIx
MjcyMDk0ICgibWZkOiBBZGQgUk9ITSBCRDk1NzFNV1YtTSBNRkQgUE1JQyBkcml2ZXIiKQ0KPiA+
IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEBy
ZW5lc2FzLmNvbT4NCj4gPiBBY2tlZC1mb3ItTUZELWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQr
cmVuZXNhc0BnbGlkZXIuYmU+DQpSZXZpZXdlZC1ieTogTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52
YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+DQo=
