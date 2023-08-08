Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC49774D5B
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Aug 2023 23:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjHHVui (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Aug 2023 17:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjHHVuh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Aug 2023 17:50:37 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2047.outbound.protection.outlook.com [40.107.13.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D9212D
        for <linux-gpio@vger.kernel.org>; Tue,  8 Aug 2023 14:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kONikbv3h8I/7xAmplbKJ7dwMVdcc+bkEy+2W8d16V0sSSzvC4A3ShSsSDaDJVftjWHo8JAIkD5FP/MsH9acCMFEkEtsQE3HuzMMMBVzxZK1UVikdx3+xuQ0aJqa6vI8piwW1Vpf1HPg6x3rDia8zMKC2M5XAJqvmHTvaQXtmWeajgsVpxMtNL38LztTtFqdtcRJ3RXptcU6kNO2Zgg+P02hj+7Xe+NzHLv85Z6ZwymjUVDUmKLlTXCwo2NCeZqhlpMskbXAnX0wkEFUJCBZhqQFr+ur5IfJYpE/kMvUX7aT2FiUo/J+hYQo12ALr+97VKcbzvFps8E0cToVyFkS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArgCJYdxgCDr8NCbTOuKDFSWxNA1Ds7NGpfFXWsIVgM=;
 b=T9kpyP/QkYCcqgGS+xbtuk08epNlzulRHYsKB+pG4BGTamMBCBIC8ROQm/+0//qwGYI/kkAwhFgrBvskc0XVbXjTjAhAsGHbkHisUPxU9hbhtfbI2P7GlRCLOxIm+P7zjc1Mp7uInn1kKRrSo+W1LOhKwduZLg1mrt1mCrSbj/TIu7AYaTG9ovrF/pjg3zbf/F2T6p17ZPEv+hSK/XfsX6wUufss6HVnc3GMaX6V6x/mx9vK1Txr7goD8SsAqPTujLVf3JIjcyZCwJZlkwFf2cftT/mLYQxLO9MoBUCS1L+6LlYOi5yF5Jy084+sZCf2hBb6ntE8Rpf8hf95ubFEag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArgCJYdxgCDr8NCbTOuKDFSWxNA1Ds7NGpfFXWsIVgM=;
 b=l+gEeggIx4b6SsviYZ4l7UCrM3my3kktEpGa4zwYv8CYaEULRlsg3XqdRlYKe448QF2IHPC9/MBgSiokvAiDl1T5k/IxZanvuaKOBrAS7cMZlxA1Ffx5OEwTBZk16KB6Orm+4QWLdIdS15VoacQih4Jwc+nU2lxtyJ7+u32s0Vk=
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAXPR04MB8638.eurprd04.prod.outlook.com (2603:10a6:102:21d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 21:50:34 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::d4ee:8daa:92f4:9671]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::d4ee:8daa:92f4:9671%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 21:50:34 +0000
From:   Shenwei Wang <shenwei.wang@nxp.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [EXT] Re: [PATCH] gpio: mxc: release the parent IRQ in runtime
 suspend
Thread-Topic: [EXT] Re: [PATCH] gpio: mxc: release the parent IRQ in runtime
 suspend
Thread-Index: AQHZyg3QuZHj4y9O4kCQ03OoPawPea/gqkQAgAAK6wCAADjsgIAAAdsg
Date:   Tue, 8 Aug 2023 21:50:34 +0000
Message-ID: <PAXPR04MB91855B50FF7ABC7837079566890DA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20230808153346.335411-1-shenwei.wang@nxp.com>
 <ZNJ9qDqDIF4s66E8@smile.fi.intel.com>
 <PAXPR04MB91853FD015613B944B8D2085890DA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAHp75VdmfF_P+GUcga5goZEDccjX+W75tLLXTV4OTUk13STd1w@mail.gmail.com>
In-Reply-To: <CAHp75VdmfF_P+GUcga5goZEDccjX+W75tLLXTV4OTUk13STd1w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PAXPR04MB8638:EE_
x-ms-office365-filtering-correlation-id: 73987d3f-33da-490b-9d98-08db98597e3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S/Vtia13j4JXQfQnaMqaeVwyZaFq+U1vHDWRSL0KQu9DKKtJRPEeawtyq3KW+LdBeNoVX5KpxXimpm7SDYSWxbgi2+/aSfMbBRtg75s1TUxH6yBrSDa/dNi/yPAeKch90ORoONAEA+VLJ4IFXV94nyNvjdVLJx5qMOWqiUm15UTzwUKlwcRH4CFopl21bRWPEiNteirPxod7uf9ySImPGQ6i6bEYNNXNBTRr79FTknTxIpaFXbuVdxuoc8DLhWnBHiwb83bLCzmAAcmVVjrGvhHe9BKijQHnx098Sype+/oPwN3f9jcNZp2ufYmwrx+9gkfl9ggVczhXm7F1egT8G9mKhwYh15fpbUV+nlXMchFDO9Z4NjKHmQbBL+Du6DauYwlwS4aX3dG5GlNewkfoxWuyTLKehXg5wq9Fhoe+BnjHAjMc1zMPmsNbv844UZPbZMajbe0l7w6OtNYZ2wet0I8MVlRsNWGK2KclWvKfIPHRNSpaSg89AQhjFZAAMm9dV/s9G/IWw2vsc4SpcpewkduefQ+mcmEpE8wB3dKRT3pe2IUDe1B6jqHk+LvmpRlBqNLSxt8zPkezwiH0v9jrTuJ6T/NDsYE7ALdkHxosWtUx33osjEeC86MO+8xbZ+Ft
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199021)(186006)(1800799003)(8936002)(5660300002)(8676002)(478600001)(52536014)(44832011)(71200400001)(15650500001)(7696005)(9686003)(4744005)(2906002)(83380400001)(53546011)(54906003)(6506007)(41300700001)(66446008)(66476007)(86362001)(38070700005)(6916009)(316002)(4326008)(64756008)(55016003)(33656002)(66556008)(66946007)(76116006)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0JxQVBjdzY2MitxZS9hdVNOdXg4SDNUVCtIZW44MHZ0c2phMHQ4MmRSWWVL?=
 =?utf-8?B?TnlVaEFBZGpSVStLMlFFeVk5cG5nT3ZoTFU2ek92YTJsdThmd05jMS9Oblps?=
 =?utf-8?B?YVl4cjMwWnh1cUF6QmFBZzRNdlBCYUhuNDNOYUhiU1htald4dG1kNmxvek91?=
 =?utf-8?B?eERGRzEvVkFkRHh1eEVKTHQ0cmxzMVBjU25LNE9KWnlWUkZ5dFFick43VUZi?=
 =?utf-8?B?d0R5Tk5ZZzl6dzJRUmFLK2xab1JmZndWRnU4UWhtZlBZVlRBYlR6SDdEV3p2?=
 =?utf-8?B?aWkzOGk5YmtBQWozUnhhSDBpN09RWjJtSlpBWkFhZkdxekVjRWxURnZJOTBH?=
 =?utf-8?B?WWtQNXgreU1tbm1DTFp0Uk8wazlkdzM2WDhrYlJDZ0cxZHgxdDNDeHJqWFpw?=
 =?utf-8?B?WnRxUkNmU0pFWnk0L1dqbkRrN01CREN2L3c5OUZGcjRBc0g2V2xZd2Rlbmh6?=
 =?utf-8?B?eFJtUlpHeFBXV3VucGt5NnRJazdCYzhhOXFlV0pCMHVkUjl4QytnbVFUVjl6?=
 =?utf-8?B?Z3M1NVY4YUlwMjJxUm9hdHBkUVhTV3k3ekhUNVl2NnBnRCtLdlRXRUdML1JO?=
 =?utf-8?B?S3pkMGttU3kzaEFhaW84WHpYV1JhNnJnaWozTVRhMXl3TTRFVmdMV1VrNTNy?=
 =?utf-8?B?WFJhU0JqWWV1aU5oVkt1d1lyNDFIOVpiYUYzaUdtYmR6QnlsN0tmUEdBdDAx?=
 =?utf-8?B?Ukhxb0IwZkxPQUo2NG1VRVRqbW1OVnRGRktoK3F4VHFSY2N3R3JlUUNxa1Ft?=
 =?utf-8?B?VWlEaURYZVV5dmw2Uit6MElLSU1waDd0VW5CNnNxZGxrWlBCVFRwUE5rY3Ft?=
 =?utf-8?B?WjBKa1JtdDk0OEhkcjEwQmd0T0R1am9QdnhFNGdxQzRpQk9nNWlhV1RtNFhU?=
 =?utf-8?B?SnNkM2U1V1RzRjNrUTNDdVROQ2lHWklCWlkybDN3RDFQV1d5LzJqUlVReW9S?=
 =?utf-8?B?TWw5VFE3UWU3bEVIaEdIeG5uSnpyMG9JMS9ndEQ3dUUzY3M3RmVCWXBBMmpa?=
 =?utf-8?B?b1N2Rk5ramdJRmRqM3gwdVlrM1NzZDVsaVhqWG5VSjRLSXVzU1lGbFhTdXZB?=
 =?utf-8?B?ZHN1cW91ZzI0U2cxKzhROWFJL2p5TE8wUy9UN29VbDVTL29GelpXeEFiRWM1?=
 =?utf-8?B?UDhTM2Q3ZWhEWFpqdWpBbkVURDJtVkZmTHpnSTdsUFB2UXJYcC90WGxaRmE0?=
 =?utf-8?B?RzJtU1AxRkFNSXJWblVwanlDS0N2dVBEMzI3ZjB1WkVDMGtzNEFpUkZHZ3U0?=
 =?utf-8?B?TERPSzJTWC9yTXlRMHMxM2E0Y0t0MDZzTXdQNkNUUy9ubFRyT25PeStBMDAv?=
 =?utf-8?B?ZnFNME91NllvaEN6dWNTNkdZOFpIRS8xaUdHeWs1UXFQZmxTYXBMNGN3M2Zx?=
 =?utf-8?B?RHBCVWh5TytxM21IQUYwUVFBb2dXcHdMS25lbUg2L1BYQnJ2U1FCa29ubG5R?=
 =?utf-8?B?RHh5bG9CZElNZTBJU2lCNTVkUkJveFJuT2ZlL2dlOWdlQUloMlBBY09TajRS?=
 =?utf-8?B?bFhGVFRGMUczYmgrbWU5d3M0bDV5UHVHaG9XcnNQYlhIa1VqY2I2SnlaZ2I3?=
 =?utf-8?B?Z3RTd0dMSWRXcmNWS1N3NHpXUUI3YXJxRGU5elFMRnlidFd0SFNKWEJCR2Vm?=
 =?utf-8?B?WmxkWktuOVRENUlETEUvWjdxQk96RzVyYURIVTFla2orK091ZXdPQkxlU1hv?=
 =?utf-8?B?TXpId0lDNVpsd2ZMWi9RTUt1Zm1NTGI5UzNKWU1RN0o5Y0E1VFVpVDcyeEN5?=
 =?utf-8?B?NkFUMnZsUnhra25QVEtYak9oaXZmN1ZPN1FtODI3VXlJL3ZoRzdJRnYzOVB2?=
 =?utf-8?B?YXZiQkFuMnNsbWVwUjZkNkt5VjVOYVMvYzA4RktENU9DOEUwWUNzdlA1azRp?=
 =?utf-8?B?Wm1rN0k5YmcyK2ZzOHFScG4wZmlJaEh5ZGpxZDdWUktmaGlWcTRTZ2F1T2tW?=
 =?utf-8?B?WFRQNzNkZFQvVys5bm9YcEVmNnUwL2JsM2RLQW5Uek9TRlJhRXgwWm1qYnU4?=
 =?utf-8?B?R08vcjM2ZlBrSjhNdmlaNTBNekZ1YUdNTko2cm1ZbXF2dU1UallsY0FkbTls?=
 =?utf-8?B?R3I0bjNycjJzV3N3Z2xXeFdpcGhXWFZZMi9hdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73987d3f-33da-490b-9d98-08db98597e3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 21:50:34.0293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7TpOOn0hKbc9YOOeWAR+Qbiw5JCasbIVSdliB3k35fgX/BWygIOLgsI98eenElBIK1sD/uurp1fdbY08VhivjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8638
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgOCwg
MjAyMyA0OjQyIFBNDQo+IFRvOiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPg0K
PiBDYzogQW5keSBTaGV2Y2hlbmtvIDxhbmR5QGtlcm5lbC5vcmc+OyBMaW51cyBXYWxsZWlqDQo+
ID4gPiA+ICtzdGF0aWMgdm9pZCBteGNfdXBkYXRlX2lycV9jaGFpbmVkX2hhbmRsZXIoc3RydWN0
IG14Y19ncGlvX3BvcnQNCj4gPiA+ID4gKypwb3J0LCBib29sIGVuYWJsZSkgew0KPiA+ID4gPiAr
ICAgICBpZiAoIXBvcnQpDQo+ID4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuOw0KPiA+ID4NCj4g
PiA+IFdoZW4gY2FuIHRoaXMgYmUgdHJ1ZT8NCj4gPg0KPiA+IElmIHRoZSBmdW5jdGlvbiBpcyBj
YWxsZWQgYXQgcmlnaHQgcGxhY2UgYW5kIHJpZ2h0IHRpbWUsIGl0IHdvbid0IGJlDQo+ID4gdHJ1
ZS4gSnVzdCBpbiBjYXNlLiDwn5iKDQo+IA0KPiBJJ20gbm90IHN1cmUgSSBnZXQgdGhpcy4gSWYg
eW91IHRyeSB0byBhZGQgYSBkZWFkIGNvZGUsIGRvbid0IGRvIHRoYXQuDQo+IE90aGVyd2lzZSBj
YW4geW91IGNsYXJpZnkgYXQgd2hpY2ggY2lyY3Vtc3RhbmNlcyBpdCBjYW4gYmUgbm90IGEgZGVh
ZCBjb2RlPw0KPiANCg0KT2theS4gV2lsbCByZW1vdmUgaXQgaW4gbmV4dCB2ZXJzaW9uLg0KDQpU
aGFua3MsDQpTaGVud2VpDQoNCj4gLS0NCj4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hl
dmNoZW5rbw0K
