Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCD659F5EB
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Aug 2022 11:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234882AbiHXJJb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Aug 2022 05:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233772AbiHXJJa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Aug 2022 05:09:30 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2096.outbound.protection.outlook.com [40.107.113.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9577C314;
        Wed, 24 Aug 2022 02:09:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfh0ctNyYAYVqABiwLTPcMGI43lDlWJTo/uyKN4PR1xW/4YWT1vKdlk3fXFMw2EnyF5ZeNeaU3VduOVQPwlpNGNdL0fSClpojLASXYq0VkGlQWsiDqaAV2MTILvl9Dr+9rchwBaRahK1lEPkA2WL6uPYh+mf5bVbSdhDVRuUvr8UGPIHzUWyDN645HHiE9c7IQI2f35cgkAGyPCceCmNQKVaE1omOAu8pSAXZUgReF5so78b/QHSPJA899ZlX0gRvBRBzaiTxR2Ond2jR1t/lv9T2dvVYkUyVPBAlwPnOVnwkIFyP3Zi5ev/CIqF3bBWBUotBt2gGbzWgSaaD1WDpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrTs4Q8lcaAQo/CxHB3oTyugFKFZwh5NbkJ15Y3ekj8=;
 b=oTk+Obr4AWeZl7CzHQclWmlkHm80qNfnpNnx2MQCGKgfhSfkq2wxRYLcgXqgvmV83ESSoYei+glAr1nfHjZnLqz9HFEyCzUx+pc/mylOch2LZTqhe9Yf3n9bk+RiV8ZY16KNV0U+txX0mnV7/f1fnJelxczpxSJgPr4jzyF2LRydM3Ic56LXkHSas53zd4hkHdbMc5hPgVDX3r+SvOtTRHpAc/40pZCkXYzvDZN31UTmHorkiJgZTuRMEgz8lr6BiPABroIMX5pXzBJ2ZtNuOYtMPS+27qfepwjOLWAJbOOYrb2RCYA6cJjG21ks1RcQ84jRal3nNqyqmHDHI+Vusw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrTs4Q8lcaAQo/CxHB3oTyugFKFZwh5NbkJ15Y3ekj8=;
 b=Owe6CzSBEVP2NB3Fk6i+6Q5kMILBDLRozUg9sBJhaAtPmvnKw3noyKBp5styjB4sGcC/scqJhHw7TZsdh3Ir5ncGMvDHWVCqp9d3ht7868BslkfF9ngjffugi30LWsuRwt7SVZkJb6vBTvZZ9HB9tzfD0sSoMi1vCPy4aMWgrNA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB6172.jpnprd01.prod.outlook.com (2603:1096:402:34::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Wed, 24 Aug
 2022 09:09:25 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%3]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 09:09:25 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 2/2] drivers: pinctrl: renesas: Add RZ/G2L POEG driver
 support
Thread-Topic: [PATCH v2 2/2] drivers: pinctrl: renesas: Add RZ/G2L POEG driver
 support
Thread-Index: AQHYo0Y8H6Asz5OCr0KekTpyrBmE1K20gJGAgAloPZA=
Date:   Wed, 24 Aug 2022 09:09:25 +0000
Message-ID: <OS0PR01MB5922E4DF9623584E01741CD986739@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220729122448.498690-1-biju.das.jz@bp.renesas.com>
 <20220729122448.498690-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdU4U2cwXFrB7++Pwq=xi8txaUZtE19F=NrMv1mORrMVZQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU4U2cwXFrB7++Pwq=xi8txaUZtE19F=NrMv1mORrMVZQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4436d687-4500-4952-ba5a-08da85b05790
x-ms-traffictypediagnostic: TYAPR01MB6172:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: olKc7URJxfOc8sBkXq9Zq4D66KJF8GQ9q7IYjCZzXhLEk4GFSEg1QCNwgAzshQ7K3T326ZWfhDdMRcNwLLF+GtUkGlDcgkMSI1w9zGvOtZHfHGvZBee+LGEFh3gk3RPRcmVR0R2CKZUk3IxmHdZphXntLhtz2N9VSGLq6IKulT926kVgYHWiGVtPiMDV8Hx8tEJfLFL571wnvRZj7bXI3j6sfiMo2Mx+C7LJI817vct8DlEI8EQ2nb4OQxcVWMbBTEkA5voursI/xiCa3NAe7euzBp2DitNzBRfj154tDBwMBtM7SkXtPzDvUQ3Ld5tKAY2L2vr5QdUFIc5NchpCXlUAFIK+L37vOF/AlbNcUl9cR5RZgwxREHiAnZ1j9zmF2mmC8+rCkJqB9ZlI42cYV2QwX7sOfn3LWlKC2M/3b5aOc17Q6Ke09460xgVBfH6jt9CcwhVBL8p7gfAbFXCGb2zMfTdgUA1ptpP+BprLiFF5SR53v8dTJ1ExE7OOgsU6YXoYo3Yy7AKhwC3hOq+FWVvcti/cnZ8LBHXjD687+RfQLoqltWGqPoCvuPkT6KUCaySJzL+RBQXJyTXrVRCYT1fxo2g/CIWj7SmKbpx5f1eypBHNEKavi2mFCDqbKzgPgrK9hHxabu6lBekivdUUmwWGkXQUwwmkskJIEUfk+LI1KZCzsraZYHkvDg/0vuu2a12CZ32TJ/cftzF/pkQnjCNgAMNRIXURyPYs1vz7L/YfqFelKH3Dp1v51anI+8CE5VG/a07BJYqbtxdyAEygDe/GgKOKaaD3kSzKf8ZMIfg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(38100700002)(7696005)(38070700005)(53546011)(122000001)(966005)(76116006)(66446008)(9686003)(478600001)(64756008)(4326008)(8676002)(26005)(66476007)(66946007)(86362001)(316002)(107886003)(6506007)(41300700001)(6916009)(54906003)(55016003)(66556008)(186003)(71200400001)(5660300002)(8936002)(52536014)(83380400001)(33656002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OE85VnlhQnN6RXhvVzR6dXBKOGVteEZ4cEtsaE42R2lVNmR2Wk9zdGdEaFpW?=
 =?utf-8?B?cHF5UjR6T2VWSEl4Um5lK1ZnK2xnUGMyN0N4dEhyT29vekFsQVFvdHk5K3VV?=
 =?utf-8?B?dmd2QnZuT256eWlsUVp6YlVpZEk1dE9idXUvTHVWVmpEVVdYbE1BaFFUeWFu?=
 =?utf-8?B?M3lzdTUzTzVJR3ZwaWlqWkdxRTJQTFRDcWlLN1dUdjZMc0VSVmpGZ1ZWSDgy?=
 =?utf-8?B?Y1VoRTlsd0d5OEM4ZWg1bk5LSUhSV2hTZ3ZPZHpORVVsamgrbUxLZURtV2Ir?=
 =?utf-8?B?aTRpRUhIWHRFUWFOOVAxVWk1T01aME5vNkVNK1VBam5ocXNrQWdGbTFrcy9a?=
 =?utf-8?B?WTkyZTVIaWgxZ0szSkRrSG1PVTZ0dTZYcjhRMlY4QU00UTdNR3J5VDZzMkoy?=
 =?utf-8?B?Y2phRGFJOXQxOU1WTTdId1B2UGRZS3RZSmVJSXVOT1dzU0lXUkZLc0JSL1pY?=
 =?utf-8?B?YjJxNmlSUG44ZmJYbU0wbmxLc3VuYnhpNkxobEJPU29hUCt6eEVBT0phOVBC?=
 =?utf-8?B?c1pxOHZFYnU5Y2VQdC9ZQ3diMDJmdFBLdW9DL0hzMGZ4eTgra2pNMTI5TVpr?=
 =?utf-8?B?am11Qy9SdkdSVXlrK0RiNjhzRU9iS2VOYmpZd3lIcjVyY28zUUtLWktlWTB2?=
 =?utf-8?B?Nlllc1kyT0hPd050QWE0MzVVMHprNGJGek5zOFU3RGlTcFZyUW4xQTE1eVM4?=
 =?utf-8?B?ZnYxZ1NQMUVrNUpNVVdXR2k5SGt3VndYRDNZeWFhUmpmS3dpckZQRWFPdTZH?=
 =?utf-8?B?SnBZL3BwOHpiUDJ3aGZvZVN1SDNQNzd1TUhrNm9TY2o5eWVzSDF3ODJpWjB1?=
 =?utf-8?B?ZkFpYnhRdXhidTVUa3ZJUC84THVMbWNVbmQ4eE9xRkFtYitCWmxmVVlLWUhN?=
 =?utf-8?B?aXJ5UG9pUnRpbkdEN1FDMUNQNWQxY3NQbnEyNmJBR0h3SVdoVUkwVnh6aS9v?=
 =?utf-8?B?V2ZDZnA2bURocUlYZCtQbVF4bjAxNGlOOHZxaGdla29BcWE3N2FwRFhnTlVK?=
 =?utf-8?B?UE1oU0lCbERnV2JKSFROdmo5Ty8rMkd4Mld2THdrZ05yWnhueXlOSDY2a0ti?=
 =?utf-8?B?ZUxxejh6ZVF2cjh6ZEZ5aFlFN0NqREFsZVppTHBZR0sxVGtrT0F5SmZrd1BN?=
 =?utf-8?B?R1IvOHZPcm0xSVhBS0NPcE5EeU5yZjcxQkJ1NklBVlhZR0RyT3JwYi9vSXFk?=
 =?utf-8?B?RFVnSmMyZmVvaW9HYTFDaFdDbVBXeDVjbWxBeTdpQnlWeFlxQzRBOVJORUpN?=
 =?utf-8?B?cmc0bmE1ek5rUHZJWHpCdE9XZWxmZ2U1eHNxSldmNlZRaFZRVXgrcmVkbmVY?=
 =?utf-8?B?L1ppbW9lV0dweEhXaE55T1pjcFBZMldGd1Q0dlpiN2FUYjBXVkZpMk1QVG9q?=
 =?utf-8?B?eUdGcm9velU0QmhCdms1cWR3eEM4bVppNmpVZWw2K1pubjR0Rmdkckd3SVRW?=
 =?utf-8?B?bngzMThrb3NBaDY0TFNaNm9JbEptMll6VXZpMkRuSGlEakpxNzU3U1NpZmM0?=
 =?utf-8?B?Q2svUWlsZDZ3OEFPcURZWEh4V2JvU0FTOXVua2FENDFMRnpQeTBWY3YyMDJa?=
 =?utf-8?B?R1lyM0I4eURiNmg4cVRjbUFpYXhkSjY1V3VPR1VXdTVNaG9kd0ljM1FnVFFw?=
 =?utf-8?B?QUI4NkNRQ2k3RmkyaXJxVkRmNDZZYVljaE5SeGxDOFVuNGRpZWdwWHlHeGd5?=
 =?utf-8?B?Y2pSMVdRU0xneU5wTnV4aDBRamVxTjFMSS9zNi9rcitLSVJoMmF5OFpSREEy?=
 =?utf-8?B?ZkR3bWJBdXJrMllhM3ZBNVhmVUhTY0ZsY2dQejR2OUNQcHR4U2x3Sk5XZW43?=
 =?utf-8?B?ME10MitYQzhDSERXTm9zMi9aOHl0UG53andaVCtIQ3htYTZhVmVteVdPMnp2?=
 =?utf-8?B?MjZ3b0VhZjF2SjFRZ3UrM0hmSEFZL0N6QlR1cU1nSFd2NDFLVzNVSmtHMHFM?=
 =?utf-8?B?Z1dkQkdwR3hocEQvQW9OUzRFSU9KTGhaRTNlSVhNUHk3MUdSUUVRT2VzRUxQ?=
 =?utf-8?B?cFJudUQ4cWhBWmhKQ1QwM2NPdkIxeDZzWHloVzM3dFFrNExkWGFsc2xEdnFX?=
 =?utf-8?B?V2tObFlRVUdCcWZZL1d1UVBTTTZNSFBtOU94Z0Q4Q1ptbitPY3dhaTVhOHZi?=
 =?utf-8?B?RmVjbVpNREIxdFRCSWI2N0tYTjBQL2ZBNDVhWUZaMTNabG9wQjU2UnJ0bjZ3?=
 =?utf-8?B?SEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4436d687-4500-4952-ba5a-08da85b05790
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 09:09:25.5562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DCYhJtHFVK+wkSm5dOo+1YCErokeDx1/PIL5zq/3zGGi4TAfqXSytlgSBOX9F0r6zCIx65xzvMiuzv7EsayRXmbQnU2AMcN9cgn6ST01v2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6172
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMi8yXSBkcml2ZXJzOiBwaW5jdHJsOiByZW5lc2FzOiBBZGQgUlovRzJMIFBPRUcN
Cj4gZHJpdmVyIHN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIEp1bCAyOSwg
MjAyMiBhdCAyOjI1IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
d3JvdGU6DQo+ID4gVGhlIG91dHB1dCBwaW5zIG9mIHRoZSBSWi9HMkwgZ2VuZXJhbCBQV00gdGlt
ZXIgKEdQVCkgY2FuIGJlIGRpc2FibGVkDQo+ID4gYnkgdXNpbmcgdGhlIHBvcnQgb3V0cHV0IGVu
YWJsaW5nIGZ1bmN0aW9uIGZvciB0aGUgR1BUIChQT0VHKS4NCj4gPg0KPiA+IFRoaXMgcGF0Y2gg
c2VyaWVzIGFkZCBiYXNpYyBzdXBwb3J0IHVzaW5nIHMvdyBjb250cm9sIHRocm91Z2ggc3lzZnMg
dG8NCj4gPiBlbmFibGUvZGlzYWJsZSBvdXRwdXQgZnJvbSBHUFQuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+
ID4gdjEtPnYyOg0KPiA+ICAqIFJlbmFtZWQgdGhlIGZpbGUgcG9lZy1yemcybC0+cnpnMmwtcG9l
Zw0KPiA+ICAqIFJlbW92ZWQgdGhlIG1hY3JvIFBPRUdHIGFzIHRoZXJlIGlzIG9ubHkgc2luZ2xl
IHJlZ2lzdGVyIGFuZA0KPiA+ICAgIHVwZGF0ZWQgcnpnMmxfcG9lZ193cml0ZSgpIGFuZCByemcy
bF9wb2VnX3JlYWQoKQ0KPiA+ICAqIFVwZGF0ZWQgZXJyb3IgaGFuZGxpbmcgaW4gcHJvYmUoKQ0K
PiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4g
KysrIGIvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcG9lZy9LY29uZmlnDQo+ID4gQEAgLTAsMCAr
MSwxMiBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gK2Nv
bmZpZyBQT0VHX1JaRzJMDQo+ID4gKyAgICAgICB0cmlzdGF0ZSAiUlovRzJMIHBvZWcgc3VwcG9y
dCINCj4gPiArICAgICAgIGRlcGVuZHMgb24gQVJDSF9SWkcyTA0KPiA+ICsgICAgICAgZGVwZW5k
cyBvbiBQV01fUlpHMkxfR1BUDQo+IA0KPiBUaGVzZSBhcmUgbm90IGhhcmQgZGVwZW5kZW5jaWVz
LCByaWdodD8NCj4gQW5kIFBXTV9SWkcyTF9HUFQgKHNvcnQgb2YpIGltcGxpZXMgQVJDSF9SWkcy
TC4NCj4gDQo+IFNvIEkgdGhpbmsgdGhlIGFib3ZlIHR3byBsaW5lcyBzaG91bGQgYmUgcmVwbGFj
ZWQgYnkNCj4gDQo+ICAgICAgZGVwZW5kcyBvbiBQV01fUlpHMkxfR1BUIHx8IENPTVBJTEVfVEVT
VA0KDQpBZ3JlZWQuDQoNCj4gDQo+ID4gKyAgICAgICBkZXBlbmRzIG9uIEhBU19JT01FTQ0KPiA+
ICsgICAgICAgaGVscA0KPiA+ICsgICAgICAgICBUaGlzIGRyaXZlciBleHBvc2VzIHRoZSBHZW5l
cmFsIFBvcnQgT3V0cHV0IEVuYWJsZSBmb3IgUFdNDQo+IGZvdW5kDQo+ID4gKyAgICAgICAgIGlu
IFJaL0cyTC4NCj4gPiArDQo+ID4gKyAgICAgICAgIFRvIGNvbXBpbGUgdGhpcyBkcml2ZXIgYXMg
YSBtb2R1bGUsIGNob29zZSBNIGhlcmU6IHRoZQ0KPiBtb2R1bGUNCj4gPiArICAgICAgICAgd2ls
bCBiZSBjYWxsZWQgcG9lZy1yemcybC4NCj4gDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBi
L2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BvZWcvcnpnMmwtcG9lZy5jDQo+ID4gQEAgLTAsMCAr
MSwxNDcgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiAr
LyoNCj4gPiArICogUmVuZXNhcyBSWi9HMkwgUG9ydCBPdXRwdXQgRW5hYmxlIGZvciBHUFQgKFBP
RUcpIGRyaXZlcg0KPiA+ICsgKg0KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjIgUmVuZXNhcyBF
bGVjdHJvbmljcyBDb3Jwb3JhdGlvbiAgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRlIDxsaW51eC9p
by5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51
eC9vZi5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ID4gKyNp
bmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9yZXNldC5o
Pg0KPiA+ICsNCj4gPiArI2RlZmluZSBQT0VHR19TU0YgICAgICBCSVQoMykNCj4gPiArDQo+ID4g
K3N0cnVjdCByemcybF9wb2VnX2NoaXAgew0KPiA+ICsgICAgICAgc3RydWN0IHJlc2V0X2NvbnRy
b2wgKnJzdGM7DQo+ID4gKyAgICAgICB2b2lkIF9faW9tZW0gKm1taW87DQo+ID4gK307DQo+ID4g
Kw0KPiA+ICtzdGF0aWMgdm9pZCByemcybF9wb2VnX3dyaXRlKHN0cnVjdCByemcybF9wb2VnX2No
aXAgKmNoaXAsIHUzMiBkYXRhKQ0KPiA+ICt7DQo+ID4gKyAgICAgICBpb3dyaXRlMzIoZGF0YSwg
Y2hpcC0+bW1pbyk7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyB1MzIgcnpnMmxfcG9lZ19y
ZWFkKHN0cnVjdCByemcybF9wb2VnX2NoaXAgKmNoaXApIHsNCj4gPiArICAgICAgIHJldHVybiBp
b3JlYWQzMihjaGlwLT5tbWlvKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIHNzaXplX3Qg
b3V0cHV0X2Rpc2FibGVfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKmJ1Ziwg
c2l6ZV90IGNvdW50KSB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
ID0gdG9fcGxhdGZvcm1fZGV2aWNlKGRldik7DQo+ID4gKyAgICAgICBzdHJ1Y3QgcnpnMmxfcG9l
Z19jaGlwICpjaGlwID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+IA0KPiBjaGlwID0g
ZGV2X2dldF9kcnZkYXRhKGRldikNCg0KT0suDQoNCj4gDQo+ID4gKyAgICAgICB1bnNpZ25lZCBp
bnQgdmFsOw0KPiA+ICsgICAgICAgdTMyIHJlZ192YWw7DQo+ID4gKyAgICAgICBpbnQgcmV0Ow0K
PiA+ICsNCj4gPiArICAgICAgIHJldCA9IGtzdHJ0b3VpbnQoYnVmLCAwLCAmdmFsKTsNCj4gPiAr
ICAgICAgIGlmIChyZXQpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gKw0K
PiA+ICsgICAgICAgcmVnX3ZhbCA9IHJ6ZzJsX3BvZWdfcmVhZChjaGlwKTsNCj4gPiArICAgICAg
IGlmICh2YWwpDQo+ID4gKyAgICAgICAgICAgICAgIHJlZ192YWwgfD0gUE9FR0dfU1NGOw0KPiA+
ICsgICAgICAgZWxzZQ0KPiA+ICsgICAgICAgICAgICAgICByZWdfdmFsICY9IH5QT0VHR19TU0Y7
DQo+ID4gKw0KPiA+ICsgICAgICAgcnpnMmxfcG9lZ193cml0ZShjaGlwLCByZWdfdmFsKTsNCj4g
PiArDQo+ID4gKyAgICAgICByZXR1cm4gcmV0ID8gOiBjb3VudDsNCj4gPiArfQ0KPiA+ICsNCj4g
PiArc3RhdGljIHNzaXplX3Qgb3V0cHV0X2Rpc2FibGVfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYs
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX2F0
dHJpYnV0ZSAqYXR0ciwgY2hhcg0KPiA+ICsqYnVmKSB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2aWNlKGRldik7DQo+ID4gKyAgICAg
ICBzdHJ1Y3QgcnpnMmxfcG9lZ19jaGlwICpjaGlwID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRl
dik7DQo+IA0KPiBjaGlwID0gZGV2X2dldF9kcnZkYXRhKGRldikNCk9LLg0KDQo+IA0KPiA+ICsg
ICAgICAgdTMyIHJlZzsNCj4gPiArDQo+ID4gKyAgICAgICByZWcgPSByemcybF9wb2VnX3JlYWQo
Y2hpcCk7DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJuIHNwcmludGYoYnVmLCAiJXVcbiIsIChy
ZWcgJiBQT0VHR19TU0YpID8gMSA6IDApOw0KPiANCj4gc3lzZnNfZW1pdCgpLg0KPiANCj4gPiAr
fQ0KPiA+ICtzdGF0aWMgREVWSUNFX0FUVFJfUlcob3V0cHV0X2Rpc2FibGUpOw0KPiANCj4gUHJv
YmFibHkgeW91IHdhbnQgdG8gZG9jdW1lbnQgdGhlc2UgcHJvcGVydGllcyB1bmRlciBEb2N1bWVu
dGF0aW9uLywNCg0KT0ssIHdpbGwgZG9jdW1lbnQgdGhpcyBhcyBpdCBpcyBvbmUgb2YgdGhlIG9w
dGlvbiBzdXBwb3J0ZWQgYnkgaGFyZHdhcmUuDQoNCiBvcg0KPiBkbyB5b3UgaW50ZW5kIHRvIGhh
dmUgdGhpcyBhcyBhbiBpbnRlcmltIHNvbHV0aW9uPw0KDQpVc2VyIHNwYWNlIGNhbiBkZWNpZGUg
YW5kIGRpc2FibGUgdGhlIG91dHB1dCwgaWYgbmVlZGVkIHVzaW5nIHRoZSBhYm92ZSBwcm9wZXJ0
eS4NCg0KPiBUQkgsIEkgc3RpbGwgZG9uJ3Qga25vdyBpZiB0aGlzIGlzIHRoZSBwcm9wZXIgd2F5
IHRvIGhhbmRsZSBQT0VHLCBidXQgSQ0KPiBzZWUgbm8gYmV0dGVyIGFsdGVybmF0aXZlLi4uDQoN
CkdvaW5nIGZvcndhcmQgd2lsbCBhZGQgbW9yZSBQT0VHIGZlYXR1cmVzIGxpa2UNCg0KKiBJbnB1
dCBsZXZlbCBkZXRlY3Rpb24gb2YgdGhlIEdURVRSR0EgdG8gR1RFVFJHRCBwaW5zLg0KKiBPdXRw
dXQtZGlzYWJsZSByZXF1ZXN0IGZyb20gdGhlIEdQVC4NCg0KQWxyZWFkeSBCU1AgaGFzIHNvbWUg
aW1wbGVtZW50YXRpb24gZm9yIGhhbmRsaW5nIHNvbWUgb2YgdGhpcyBmZWF0dXJlc1sxXQ0KDQpb
MV0gaHR0cHM6Ly9naXRodWIuY29tL3JlbmVzYXMtcnovcnpfbGludXgtY2lwL2Jsb2IvcnotNS4x
MC1jaXAzL2RyaXZlcnMvcHdtL2dwdC1yemcybC5jI0w1MTcNCg0KQ2hlZXJzLA0KQmlqdQ0K
