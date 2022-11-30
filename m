Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B94A863D8DE
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 16:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbiK3PJ5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 10:09:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiK3PJ4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 10:09:56 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2084.outbound.protection.outlook.com [40.107.7.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64636BC34
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 07:09:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUzUZOShtf1lk9AUfbtOTvWXEzWUyKlHMsZC8pPk7KuAy61rWPcc+fo4mmx4YoqmFdwXEvbekhJPGnfqDM2om9eoF4xHk81SW2jPV1OURA+f4g3ywlOw8JtP5NPGwQ0SS+t6uro8qiWtDQfBDCQFFJKrJTLU9m2nEyl40op66hBCe3cJQRz1rn3cvNgILBptyyfyW3gyocPQDlVuUwyggTdKm/VHtEPtbiGyALYOK0JtGv+wAnrSq0e/YE6yGxU41tYtsO4krn1s4nIMJ1IT1EJY3YUQVbEdE/osBT9xD0WwwfsuSgtVuw7fWLNjwnK4sAGNaQmjdjs9OrCoaQFfHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEjm+Z/PVGDIEmVlbHiqK3QW+XbtdP2sp/J0f4xUwZA=;
 b=mnM2uvpuV0AcoXDDe40QFLkSFtEgSvP/rhf/BYg61zvjIoVIkZ6pbpOjXL52hJnCfAVpWEfeSd9lbn8lehPVfe9aM166qMbK/+UaCfuuJoUQpdaDu9ih/wn7MvWBxyJrMz5kV1MgEk5q1P+3yXngxPWpXt4Jh8fTWPBmZ6DlFVvJ0ZDQBWOMj0H10BksDTXrmj6YGILXsGLAfWDqfoCk+AYMMBtCa7c3SS6lO3JyVmFCR1Btv1+TL3hUpq1oLRS4zADabz03/gg5NHQbRFLJi3UGl74V6G8XrMs0DNMsuLPw7tlesYkj7VnsZvTiy7KRRkn09tmGcB1JUJiBrVPrHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEjm+Z/PVGDIEmVlbHiqK3QW+XbtdP2sp/J0f4xUwZA=;
 b=Y0oQRDEP9X50FX1BC9Wlsi6ijChDy8V0KjZs7B4gKkHrXb4pbv1gmedAMGsFNaDa0iZNT3RddxIQ4GaZwpFjzAXmJXo/5JHXOel1c5Avan/1fTma8/ROBFYGGp/KoBubVT0eNp68fEwOn1DY8KwpvJKUibAPR58YOqHKTvyFm0Gz/2KH9Bs+7OzSSPwOE3sO23thrsF6TjmS5tm5rcWR1UpsGAEMTR/qMxRID9uLJjajrezurSj+GK3RALVJL0GQaN7jLQgSnMsEzoot/+wMgybnbN5UWFplKGIXMk+/UHdl2e94CwdTjEgh00w7hLUbhWw20x1fjKaOL3u1alAlOA==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by DU0PR10MB5655.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:319::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 15:09:52 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ddda:691a:9da:c150]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ddda:691a:9da:c150%3]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 15:09:51 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC:     "Kiszka, Jan" <jan.kiszka@siemens.com>
Subject: Question regarding runtime pinctrl (2nd try)
Thread-Topic: Question regarding runtime pinctrl (2nd try)
Thread-Index: AQHZBM3Lq/cXs1to5Uuhi20fkVKuVw==
Date:   Wed, 30 Nov 2022 15:09:50 +0000
Message-ID: <7abfb823b92a4451d442b001ea7e49017ff3a3c8.camel@siemens.com>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|DU0PR10MB5655:EE_
x-ms-office365-filtering-correlation-id: deb65abe-174e-4aec-fac8-08dad2e4edc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sODn91LS/z6P6uLFY2tSk/wKaMu1HtIjgS8UDZUILPzFc7S0bkzVATKVX/05KOv94uMcLh0UuCv2kunB4wdg1qa7OM9T968f9/sPipVFodLjnsdRjrmV6TD6CU9c2D2JUWlGOAyQR1c+tFeNPVZvgV+k0B1bkC1/YHlLdpkiyQ0hO9fiL5IwGoOdI4LPyYe4a8TTOBoDJx9iKMq/GcuXSVSPovDxTirdXXPqbyTE3zeUZcrenEVA1E+x8EuBW5WwGGeSk/LiQqqyhl62/dvDTUPkwJqE0zQTAlQPob3MP4gVJ8DPPf2uC8W7Lh06q7V7TrJo3Fly3zZJf4+qgygIEvWzmEYZ0dHBU245Sv6RfE7NxQwmdesMDAFvuOHsWKLzU1bPC/2r2RrCfze+aRDMifuQsz1lxfzOCPiZXoGFI9WhxdcnU80bfDYVwNuCHtZugaQ5e2QS7ZdsO06Mjmw00K+9k0D0NFhD4yz1IE2/fwOLngGW3UCYlqyTj+vTPb2GfIhk/06mTQp+Gl3LQOJQt+yg9wgDeC3OoIo7TYzkg4mNymBea5pAaDL/XSMN84IIXjJW1SiNxib+Am98Uv6xE4VlK+QKA4xl6hHGaXbVIfZqRgivjHGtXMncSovrVuCzMZd8Kd5Mim/xK8tZZ9jdgFIt4ivxcPfRTYPl+BIjHGwX8wows+/KCoAIZ6zToIPqpKnI8TL4WWU8re0ri6PfJLpZGd0esdg4ei6zyw9IXv0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199015)(966005)(71200400001)(478600001)(107886003)(6486002)(6512007)(6506007)(86362001)(66899015)(2616005)(8936002)(38070700005)(5660300002)(6916009)(186003)(8676002)(316002)(3450700001)(91956017)(66446008)(36756003)(83380400001)(66946007)(66476007)(76116006)(66556008)(64756008)(4326008)(82960400001)(38100700002)(41300700001)(122000001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anEwTzBjbVp3K1NRQ2RBWFpKS295L2M2Nk1uNGVzZDhkTExvU3pWUSs2OE5x?=
 =?utf-8?B?NW83dmJKNUZuekNhdkE1ZWkzMGdyT3V3K2V2dndIQ3g0R1RYYXhTSUZzTFc5?=
 =?utf-8?B?QmJDMVJ5bVQ1TkNjWFVJeDFncXU3MERVbTYvd3ZEMFBNSldEYjF1TDNxYTZj?=
 =?utf-8?B?b1BzTm9ZRC91Um8vcjh1eEJ4UGo3NEwvRzZYRnorRDkvZU50R0NRb3hUSEVB?=
 =?utf-8?B?N2Y1WndqbEptcWcwQ3VOY0g1SkRQbXo0NGlYSDR5Z2JxQ2JHNy9zMEFSSjY4?=
 =?utf-8?B?L3p6NGpWc2h6dWlRQ1dLT0FLL0pEY2IxMi9aclIvUXlkanhPa081ZUFhNmdD?=
 =?utf-8?B?MlFIR2ZEZ2VKNkt1UWtGRU01ZkpsY0RHMEcwZWUwQlQ4dlF2ZmlBZyt0VVFO?=
 =?utf-8?B?dlZBTStNVTN5NE9oUFlhcHY3QU96MGJET1ZZNU1OYkljZVZSSkFBTjRhM1Yv?=
 =?utf-8?B?ME00UUphY05ZZEhwOEdtVVdWMDdMQU5YSGRFVldnREcraCs3am5QbW91NHZR?=
 =?utf-8?B?Z0FjQ1I3bmM2OHNYdDRtQW90RmJDaWg2T1BzdzlaZzRNNGVrZmF1VG9XTTJw?=
 =?utf-8?B?V1krNjg3OE9NT1JzZ2thdlhER2VYOXJ0MXNHdEhqSkZaVXdKYVBBd21FbzJ4?=
 =?utf-8?B?aVVBV0hxdGU3ZnRjZU5US1pMYUkxcVhLTmNGN0loSXF1SXNPK0NZSjhLN2hT?=
 =?utf-8?B?ZDdPQ0V2VTA1c01pUlRXSTFMck1xZVJPRFNuVDRnNSsvQmxTRTluYnpjVUlV?=
 =?utf-8?B?dTY1dzNxQjE4ekdxaHNscTFvTUJXM0p4TC8wbU1NMlVSaTRSWTY1bURBVHNk?=
 =?utf-8?B?bEphRk9lV3VjSHg1cXlkOGE4eHRhTlhsTXJRWHk3RVJudHlRMjRheUFTZGVz?=
 =?utf-8?B?U0Nrckw3UDI4V21KQXhrZXNsa3g3OW0wdU1NWHVsQjBsYUo4aFJySUJhMlUx?=
 =?utf-8?B?cXlQRERHenZyaUYzMTF6bXU3ZGtvNU5mOXhHdVlyYmd4OHI2dFZaUnVXVFE1?=
 =?utf-8?B?cndhNU9HNS9mcWhUL0h1N25UUGlwN1BKcjA5R3RwaDBISDY5Yks5NndXdGdG?=
 =?utf-8?B?Nkc0aUNuOTlkcXlyUEIxV1BIUUNjV2lnb0tnUXBhblRzUEZCdXp5cUttTlcv?=
 =?utf-8?B?VVlDTGs0Wm9UZmZiay9melhaUDhlZ1pvaUUzek9hNFNMancvbWNJMWIxa0NN?=
 =?utf-8?B?blIzK3FMTXJ4aGY2aFNNWWNvTGRkNEJobTJtNS9mQ0ZZOENQSFJRWndLdTlx?=
 =?utf-8?B?dlpaeS8rNklDRUpRREYwZjdMRzJIQXFZWm1IUTJHYzR3YTlOVUE2SlJoZ1F0?=
 =?utf-8?B?cjd5RFcyTWtrVy9LT0oxTkRPTmV2R3p2alNYRTVDNHRiQmpiRFhTZS9NandS?=
 =?utf-8?B?TS9ldGlDcjVRd3BQTnZVeDRKTXFnUHFJOW5vc3dhWFhsS3VQV2UwYzBBaith?=
 =?utf-8?B?MUJ3M2l0VGtTQXpNME93UER3eGNkbGJKd29kNXovRUtOelFiQjA4TlQyeVkx?=
 =?utf-8?B?N281UjlpTHM0OWRnUmRaV215NFFaTFNwSkdRNDNwTW9JcFNGT1lrSUpyd05Y?=
 =?utf-8?B?OFNyRG9LZHhwc3BCQnJ2eTBsR0Z6ZVUyMmVJOWo3bWt0eGdmdTNIck8vRjFn?=
 =?utf-8?B?Qm9HQVZ0VWJzSmhadnRFb2p2UEQwWUFxSFpsZFlEVDZIeHA2TjE3bjQrL0Qx?=
 =?utf-8?B?YjRRQy8xNkU1MzdNY0pRUGU3cE5BZmtrQTNGY05TRmtJY2NJa1d2bmk1ZmZi?=
 =?utf-8?B?a3RnYWFtRGpxSUk5ZWN5QWlGWVVBMDRJY3pMV0sxWGcwNGlBSHJmWnJURHQr?=
 =?utf-8?B?MmgvWTRrTUtmNkFkYzdhNTBSNGt0K1JUOWphNm82ZW5aa2ZaYk91OVdMNWUr?=
 =?utf-8?B?bWhKZ2pkeTNCQ1diMGFnNUJqTHp2NXZROEdzOHdjb3ByR01MQWVvbE5qcXVV?=
 =?utf-8?B?ZXdvTmltM2QvMHVlUWFXUW85dDgxSm10U1hOeE1KanAvQjB6Z05UaTIyWVdp?=
 =?utf-8?B?UFBIdU05KzZHRFF4bzZmVkRjQWxrOWFycjVjcFJ6VDB3MGtsNHA2WEl2dXhO?=
 =?utf-8?B?OGEwR0xMU21BcHJyRXRQZVU0dVdNRER4WUpMY3VpU1kyQi8wZ0V3QUhYeDha?=
 =?utf-8?B?UURWemhBS3VlbkJpbEF0Q09lNHBHOHBnTXlmYkxEK1pHVzkvUmhhOGZ4S0Er?=
 =?utf-8?B?cEdvYy81TCtYcytobnNMK05hbEFyaHBHM1FZNWZETi9vc0FjQzZOeHNINng2?=
 =?utf-8?Q?wAVMgr5a3pDtPklO/GEPXWcYucvmGGnU49JNBDb22s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D82189BF46A514408D88705F222BB6F7@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: deb65abe-174e-4aec-fac8-08dad2e4edc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 15:09:50.9388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F6WrDP468eezmp/Auvhs9MsgdYPBk+5ExOyGtCsVNTRnqR+0I55ALcMIMvvA6r1oPOYSJ0h87pYXzCy8QxSSjnz9CXIhpj3ArQP+WrC5hvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5655
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8sDQoNCkkgZ290IG5vIHJlc3BvbnNlIHNpbmNlIGxhc3QgdGltZSBzbyBJIHRyeSBpdCBh
Z2FpbiwgYnV0IHdpdGggYSBiaXQgbW9yZSBrbm93bGVkZ2UgdGhpcyB0aW1lLg0KDQpBZnRlciBj
YXJlZnVsbHkgcmVhZGluZyB0aGUgcGluY3RybCBkb2N1bWVudGF0aW9uIChkcml2ZXItYXBpL3Bp
bi1jb250cm9sLnJzdCkgaXQgd2FzIHZlcnkgY2xlYXIgZm9yIG1lIHRoYXQgc3VjaCBhbiBpbnRl
cmZhY2UgYWxyZWFkeSBleGlzdHMgYW5kIGlzDQphY2Nlc3NhYmxlIHZpYSBkZWJ1Z2ZzLiBUaGUg
ZG9jdW1lbnRhdGlvbiBpcyB2ZXJ5IGNsZWFyIGFuZCBzZWxmLWV4cGxhbmF0b3J5LiBUaGFua3Mg
Zm9yIHRoYXQhDQpBdCB0aGUgdGltZSBvZiB3cml0aW5nIG15IGxhc3QgZW1haWwgWzFdIEkgdG9v
ayBhIGxvb2sgaW50byBhbiBvbGRlciBCU1Aga2VybmVsIHdoZXJlIHRoaXMgZmVhdHVyZSBoYXMg
bm90IGJlZW4gaW1wbGVtZW50ZWQsIHlldC4gSSBtdXN0IGFwb2xvZ2l6ZSBmb3INCnRoYXQuLi4N
Cg0KTm93IG15IGxhc3QgY29uY2VybiBpcyB1c2luZyBkZWJ1Z2ZzIG9uIGEgcHJvZHVjdGl2ZSBz
eXN0ZW0uIElNSE8gZGVidWdmcyBpcyBub3QgdGhlIHJpZ2h0IGludGVyZmFjZSB0byBpbnRlcmFj
dCANCm9uIGEgcHJvZHVjdGl2ZSBzeXN0ZW0uICBFc3BlY2lhbGx5IHdoZW4gd2hlbiBhIHVucHJp
dmlsZWdlZCBwcm9jZXNzIHdhbnRzIHRvIGludGVyYWN0IHdpdGggYW4gaW50ZXJmYWNlIG9mZmVy
ZWQgYnkgZGVidWdmcy4gSXQncyBwb3NzaWJsZSB0byBjaGFuZ2UNCnBlcm1pc3Npb25zIG9uIGZp
bGVzIGFuZCBmb2xkZXJzIHRoZXJlIGJ1dCBuZXZlcnRoZWxlc3MgSSB0aGluayB0aGF0IHRoaXMg
aXMgbm90IHRoZSB3YXkgdG8gZ28sIHNpbmNlIGRlYnVnZnMgd2FzIGRlc2lnbmVkIHRvIG9mZmVy
IGludGVyZmFjZXMgdG8gcHJpdmlsZWdlZA0KcHJvY2Vzc2VzIG9ubHkuIA0KDQpNeSBwcm9wb3Nh
bCB3b3VsZCBiZSB0byBpbXBsZW1lbnQgYW4gY2hhcmRldiBpbnRlcmZhY2UgZm9yIHRoYXQgYW5k
IHVzaW5nIHVkZXYgcnVsZXMgdG8gYXNzaWduIGNvcnJlY3QgcGVybWlzc2lvbnMgdG8gdGhhdC4g
V2l0aCB0aGlzIGludGVyZmFjZSBJIGNhbiB0aGVuDQpzZWxlY3QgdGhlIGFjdGl2ZSBwaW5jdHJs
LWdyb3VwcyB3aGljaCBoYXZlIGJlZW4gZGVmaW5lZCBpbiB0aGUgZGV2aWNlIHRyZWUgYmVmb3Jl
LiANCkkgY291bGQgYWxzbyBpbWFnaW5lIHRvIHB1dCB0aGUgaW50ZXJmYWNlIGludG8gdGhlIHN5
c2ZzICh0aGF0IHdvdWxkIGJlIHZlcnkgY2xvc2UgdG8gdGhlIGRlYnVnZnMgaW1wbGVtZW50YXRp
b24gSSB0aGluaykuDQoNCldoYXQgZG8geW91IHRoaW5rIGFib3V0IGl0PyBBbSBJIHN0aWxsIG1p
c3Npbmcgc29tZXRoaW5nPyANCg0KDQpbMV0gaHR0cHM6Ly9tYXJjLmluZm8vP2w9bGludXgtZ3Bp
byZtPTE2Njg1MDY0MDkyMDEyMA0KDQpjaGVlcnMsDQpCZW5lZGlrdA0K
