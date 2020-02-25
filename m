Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFB916EF6B
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2020 20:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728443AbgBYTwS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Feb 2020 14:52:18 -0500
Received: from mail-eopbgr140053.outbound.protection.outlook.com ([40.107.14.53]:3045
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729207AbgBYTwR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Feb 2020 14:52:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g20X/YjAl96f4DgaL9lyj6bSAZT91CRZiVIqwMSwtiRAsakeg/OKCX28qCjWlVyb9X0pK7DhKs1Fc9ndTxRZPA/v6LiqV5Da+Saec7lck2Z1tM5ZCivgvVnoBtTZ/KXmyUxI2mRz6z91B+dNwfByH67afUskGMcx3LcTSWtePWK9i+QIxT9u0dz+S0cF1WxG/mpU7ydhIP2jmO8BMiQ3eiIGtDor/t9+3KD24IgiBlf7heIcwVzhXw8ddoUZRSpBI+c/Xa48TUEr6q6vsPjJpek2c/hZr0yZUb6D0iKYafMnaNTOfpQs3RNObCQ99pTtWgVloydzNs3QKoP0Hm1llQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1w3IaeqaKJQ9ao+ZY6IJ7LzRgJ4ethUkinZUzVbXfI=;
 b=AX0Ovwj6qBNDW+cIeCy5Y/MftXo25RpU8nDOLH8Y+ip5WbpJwz0BH0v1PA///7M8GfeizKocIc/DK+OMmrva/q2w2koU6LYig1YlyCtvosCz6h5e49Bd7fwZMrwKlOa/GtfUttziwjLwZ1hW1qixnNr3cbHiVHT2JMUdE0ZzEYYMtF+qCAEO83S5jvTqRpKZB/F92l9zhvLdQ9o/eVssKeRpBwvKa8OE9Mwo7tJthwsWlRJW9rho1/Gd80slkWjHeHCfLDZLVASu47bqs7ciJx8ebk1Eg10+qr62+UQfRkWBAevuGIblH88OZ8T005Bs3T/qZNKyUsBJIViQn4Iwag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1w3IaeqaKJQ9ao+ZY6IJ7LzRgJ4ethUkinZUzVbXfI=;
 b=doZZm6jVCIkLthAjcWszujyG1BPU7AxtW90Io3rUqGFei0ss+TrEBZQsOZM8rTgLtdgZdZRdJDRPxk3aZUN8FY7dGtqmneiGrLbsqGYQ7tEmUiYjenezYnFFgdou2iOkczUJJD5sZjhO+st26gsEbZjy47VMYCsoE+81maT3dQM=
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com (10.186.159.144) by
 VI1PR04MB3037.eurprd04.prod.outlook.com (10.170.228.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.22; Tue, 25 Feb 2020 19:52:12 +0000
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::58c5:f02f:2211:4953]) by VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::58c5:f02f:2211:4953%7]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 19:52:12 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Franck Lenormand <franck.lenormand@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v2 1/8] clk: imx: Align imx sc clock msg structs to 4
Thread-Topic: [PATCH v2 1/8] clk: imx: Align imx sc clock msg structs to 4
Thread-Index: AQHV6Ar29fUTh/h0xEeUNN9RFuY7RA==
Date:   Tue, 25 Feb 2020 19:52:11 +0000
Message-ID: <VI1PR04MB70233A098DC4A2A82B114E93EEED0@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <cover.1582216144.git.leonard.crestez@nxp.com>
 <10e97a04980d933b2cfecb6b124bf9046b6e4f16.1582216144.git.leonard.crestez@nxp.com>
 <158264951569.54955.16797064769391310232@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 231cdba8-69f8-47fc-cc6e-08d7ba2c34a5
x-ms-traffictypediagnostic: VI1PR04MB3037:|VI1PR04MB3037:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB3037B83F9671C7EB58A12B12EEED0@VI1PR04MB3037.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0324C2C0E2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(199004)(189003)(86362001)(81156014)(66476007)(53546011)(64756008)(8936002)(5660300002)(54906003)(76116006)(186003)(66556008)(2906002)(316002)(81166006)(91956017)(52536014)(6506007)(7696005)(8676002)(110136005)(66446008)(66946007)(44832011)(7416002)(71200400001)(9686003)(4326008)(26005)(478600001)(33656002)(55016002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3037;H:VI1PR04MB7023.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s4/+eK8PSo27/WoLXVyMTYJnto+UT8zbBREqDgxJT7/hvi2ldQRWGUXWTz7N8l7JnsY37oJTnAL3CZ9Bx9VauqVd1L/6aX7qyg1p1r2wKhpwsxEGKYjgj47GK9ZNLHOF7RqSMYDWt8r3XFPlxAbrO1YZne26Es2KDO5pfkfjkGpdgrbRouuuJFyW3ZvDNChPoOb5Mm3Bb3qrsFUG+JmZ2YuozMEBn3m2ialsGQ6kN4gI1Xqx04IF1DqNyHCWHDuHdT+BJfLQjZUb0OVVU0syvBSQ9YF5hHl3vDR0MZmbXmz/4ZrpRAVMBLV4OAgU2UQv9BzePCD+LQX9In7xWsbfjoSBJufkPrWh8KEMuk6UU7IIogt54F/iuzjk13pYakK25Bbc0Ygl3GgrJvhZqoscWVpLbGZtEatqZbtWsypTnlA32e6QnYeojCAjWesGjH0h
x-ms-exchange-antispam-messagedata: kWgcToToX50inIeJEyLWRZl4BiOnOVoR/MpRnhdGahasP2Urwqxv5iCUAmpV6/4DL1zyeabL6GYlp7agPB+Mc6yTzmnpvK4NQhfm6TIJm/j3uL3Fxf5qQIe1YbqMK9rq+XoB7xHhvMWKHGuyU32QhQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 231cdba8-69f8-47fc-cc6e-08d7ba2c34a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2020 19:52:11.9190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a38YSWqTZSsf3taIuy0Y/ZXtnc+U8pxKmpu1FC5WIhh5jkiSpzJ+cOqKRH8+zsVhasd2gseOKR2jD4gq+Fohvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3037
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25.02.2020 18:52, Stephen Boyd wrote:=0A=
> Quoting Leonard Crestez (2020-02-20 08:29:32)=0A=
>> The imx SC api strongly assumes that messages are composed out of=0A=
>> 4-bytes words but some of our message structs have odd sizeofs.=0A=
>>=0A=
>> This produces many oopses with CONFIG_KASAN=3Dy.=0A=
>>=0A=
>> Fix by marking with __aligned(4).=0A=
>>=0A=
>> Fixes: fe37b4820417 ("clk: imx: add scu clock common part")=0A=
>> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>=0A=
>> ---=0A=
>>   drivers/clk/imx/clk-scu.c | 6 +++---=0A=
>>   1 file changed, 3 insertions(+), 3 deletions(-)=0A=
>>=0A=
>> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c=0A=
>> index fbef740704d0..3c5c42d8833e 100644=0A=
>> --- a/drivers/clk/imx/clk-scu.c=0A=
>> +++ b/drivers/clk/imx/clk-scu.c=0A=
>> @@ -41,16 +41,16 @@ struct clk_scu {=0A=
>>   struct imx_sc_msg_req_set_clock_rate {=0A=
>>          struct imx_sc_rpc_msg hdr;=0A=
>>          __le32 rate;=0A=
>>          __le16 resource;=0A=
>>          u8 clk;=0A=
>> -} __packed;=0A=
>> +} __packed __aligned(4);=0A=
> =0A=
> Sorry, this still doesn't make sense to me. Having __aligned(4) means=0A=
> that the struct is placed on the stack at some alignment, great, but it=
=0A=
> still has __packed so the sizeof this struct is some odd number like 11.=
=0A=
> If this struct is the last element on the stack it will end at some=0A=
> unaligned address and the mailbox code will read a few bytes beyond the=
=0A=
> end of the stack.=0A=
=0A=
I checked again and marking the struct with __aligned(4) makes it have =0A=
sizeof =3D=3D 12 as intended. It was 11 before.=0A=
=0A=
     static_assert(sizeof(struct imx_sc_msg_req_set_clock_rate) =3D=3D 12);=
=0A=
=0A=
After reading through your email and gcc docs again I'm not sure if this =
=0A=
portable/reliable this is but as far as I understand "sizeof" needs to =0A=
account for alignment. Or is this just an accident with my compiler?=0A=
=0A=
Marking a structure both __packed and __aligned(4) means that __packed =0A=
only affects internal struct member layout but sizeof is still rounded =0A=
up to a multiple of 4:=0A=
=0A=
struct test {=0A=
	u8	a;=0A=
	u16	b;=0A=
} __packed __aligned(4);=0A=
=0A=
static_assert(sizeof(struct test) =3D=3D 4);=0A=
static_assert(offsetof(struct test, a) =3D=3D 0);=0A=
static_assert(offsetof(struct test, b) =3D=3D 1);=0A=
=0A=
This test is not realistic because I don't think SCU messages have any =0A=
such oddly-aligned members.=0A=
=0A=
> =0A=
> I see that the calling code puts 3 as the 'size' for this struct in=0A=
> clk_scu_set_rate().=0A=
> =0A=
> 	hdr->size =3D 3;=0A=
> =0A=
> That seems to say that the struct is 3 words long, or 12 bytes. Then we=
=0A=
> call imx_scu_call_rpc(), passing the pointer to this struct on the stack=
=0A=
> and that eventually gets into imx_scu_ipc_write() calling=0A=
> mbox_send_message() with u32 pointers.=0A=
> =0A=
> 	for (i =3D 0; i < hdr->size; i++) {=0A=
> 		sc_chan =3D &sc_ipc->chans[i % 4];=0A=
> 		ret =3D mbox_send_message(sc_chan->ch, &data[i]);=0A=
> =0A=
> So we've taken the 11 byte struct (data in this case) and casted it to a=
=0A=
> u32 array with 3 elements, which is bad. This is what kasan is warning=0A=
> about. Adding aligned sometimes fixes it because the compiler will place=
=0A=
> the next stack variable at the naturally aligned location and thus we=0A=
> get the one byte padding but I don't see how that works when it's the=0A=
> last stack element. The stack will end at some unaligned address.=0A=
> =0A=
> The better solution would be to drop __aligned(4) and make a union of=0A=
> the struct with whatever size number of words the message is or do a=0A=
> copy of the struct into a u32 array that is passed to=0A=
> imx_scu_call_rpc().=0A=
> =0A=
> For example:=0A=
> =0A=
> 	struct imx_sc_msg_req_set_clock_rate {=0A=
> 		union {=0A=
> 			struct packed_message {=0A=
> 				struct imx_sc_rpc_msg hdr;=0A=
> 				__le32 rate;=0A=
> 				__le16 resource;=0A=
> 				u8 clk;=0A=
> 			} __packed;=0A=
> 			u32 data[3];=0A=
> 		};=0A=
> 	};=0A=
> =0A=
> If the union approach was used then each time imx_scu_call_rpc() is=0A=
> called we can simply pass the 'data' member and make the second argument=
=0A=
> 'msg' strongly typed to be a u32 pointer. kasan should be happy too.=0A=
> =0A=
=0A=
