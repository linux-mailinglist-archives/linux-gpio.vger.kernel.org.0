Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A11A120F85
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 17:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfLPQcz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 11:32:55 -0500
Received: from mail1.bemta26.messagelabs.com ([85.158.142.112]:51755 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726016AbfLPQcy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Dec 2019 11:32:54 -0500
Received: from [85.158.142.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-b.eu-central-1.aws.symcld.net id F3/0F-12462-2B1B7FD5; Mon, 16 Dec 2019 16:32:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WTfUxTVxjGOffe3l4+Cpci9ozYLWmcm47WFuO
  8ZNHwB8SbmJm5SJbJunmhd20zKNiWrbi58TEUaBhOQbABCqy6WZxKMQM6QNIgo0zLkM996MZH
  suAcIFDcguDa3uK2/573/T3nvM85OYdAhRZ+HMGajKxex2RK8DBMs5PYLXW0PFLKy22Qcg4T1
  HLdAEZVTc7glLXXw6NWB9dQyl7VgVG/em8CamWkBKEqH3+JUI7pMR5V1OxBqVbrY0ANO2txas
  E5ilLFXb38pCh69JSTT89PFPPpDstdPj30sA+lHfZSnP5lrBOnW22f0IM1jYCuWJPTS45nXws
  7wtPq0rNNR3ma/KVpPMcdZfKWLCL5YCqiDIQRgLyAwq8/neJxRR8Gq71VGFe0Arha/jdeBkIJ
  jOxH4dzaAT8QkucQaK7xIlwxA2DF3GeI34WTFDzb/1tgxSbyAKxoGg9shZLNOHS1/RUAMaQKt
  rsK+WWA8JlY6F3fxvnfg/Xm6uC05+F3rVOoXwtIBq6dWce5YQUY7HD38fwglNwLbb97+X4NSD
  FcLmgOLEBJEfxpxhoIBEkS2joHUU7HwtnpdR7nZ6G7cAJw/Xh4e3wmqCWwvq43qMXwjtUc1K/
  Ch/em8A1/z40nwT4FbeZizH8WSG6F6648rp0Dxy6MBCNsgxMPSoIRtsC2KkvgTiDp9J2lvx09
  DXZa/hOb0/Gw4dtFnNMvwYuNf6CWwF1EQ/f5GawBYHaQmK7XqjXGLEabKVXI5VKFYpd0j1RBy
  WXMcWm6jM2VZrA6o57xURnzgUFmyMvKyFTJdKzRAXwPVHWMf70dnFz5U+YCzxCIJFZw+McVpT
  AyPVuVp2EMmnf0uZmswQW2EIQECuavPVIKo/WsmjW9q830PfMNDIkIySaB3Y8Fhhwmy6BVc2g
  A7CJOz9Y1oYTbbmtChZguW8fGiQTxvj8hJP1WTa7u6UYbX+YOEMfFCEBISIgwIofVZ2mN/+f3
  gYgAkhhBt39ghFZnfDrvvi8K4ouScHDFH8XI/Ivi8hHjpb7KW5+3DBakJrgmLd8P1c+eTFvaV
  1hL1E7WKMIHQt56+WNphv2Q9fLbLQsNTT2Vc93Ta5S5+1Ti5lxTT2pYilJWhHTL41LvHsp3a+
  a+cCUVHX7u1sAJ8bVV3tUjiZ7uiyoikrp0rL8kWuMwbBaf6Wi/sfCm6qpLOdIZjVyuTQvdo63
  OPersO1G0dz5lt0u8P+kj5w6rvue6yYO568MlV4a+KRb0fljaeND8wv6U7feW3o/c98ZX4dmr
  ovGo4w/GYe2Lya+0jcPzPyRbYkdTBsq8vRlpMa8nJFfEp+QNdp1tTxNtr1OrlYtXwj26Lk++b
  pguv731ZmkasbT8RKT+WSjBDBpGsQPVG5h/AEn5TEOtBAAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-12.tower-246.messagelabs.com!1576513970!527463!1
X-Originating-IP: [104.47.8.53]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7087 invoked from network); 16 Dec 2019 16:32:50 -0000
Received: from mail-am5eur03lp2053.outbound.protection.outlook.com (HELO EUR03-AM5-obe.outbound.protection.outlook.com) (104.47.8.53)
  by server-12.tower-246.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Dec 2019 16:32:50 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoOPRTz3s84nr52sXlhBhTHLbOgC07VLe+/BSY3bUZGlDMqIVEFNNi8+NjVUqp3H4RsWapRRw3s72rvhwgH+a8veg+xlS7raES0DfuiFw6k8fz/l3PV+rvEBL5j9B2VD6hjkFZqyQGKDe4OvUsOv/KuPJLZ/Dqw0aXa90gY+HpMT7EbInRCh39f+fZ+xep5JbYPszm2a/tCpd1UHtEl6gOofnC9PPh1BRou+hw1yOSD4hzXGRRjerzM6ovZfJ0JAcuTV92M2EljJWh4DltA2y09mpzOtdCiSDQn9/fbjiLpCOUJ57CBH1+5oOdkBGWM6gCafFF1kYrT/moRMtWdkUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9XFja/1I5WVWOnkKk88s1T3hRSV44URRfOVd0W6E8A=;
 b=WYlLAR2b2+h/4w8TRGjnj6WLnPEAhyYixs0QQduWXqnZj0bJ1UXz0hJl+VXdr6Vg7kI4vqA2ET+JfAzVNI6n33We8NQpf/8PsjXKGom8EF4VDTFCCfJi5IFPaFWpochiS2hgpHBYoMdde3I4NS6TQYPTSxztJHQsnCdQjWonxyhCZHQBgBAa//6jPD2yLF44FFHcMakrx13DTQBVkklwTKh2lio0KnQwovzTbBLv9Mqks/xrR/75TOlKa+VgwG1xw9D5IgYXAK7LWxpjMQwsy69Pwd2Ng0n28i0h+EUn1HlcLoxsIpqbCECk98bMgUWRB3NDIFn2fJVyNw+2Vt4Y0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9XFja/1I5WVWOnkKk88s1T3hRSV44URRfOVd0W6E8A=;
 b=u9brdDta2gBRjN6w75kEKC2AHo32f17u/DrG3prpOa1oZiXfgREGs7UNKAJyuP/asFn2fvPxYGgJmtlti8Tnc0glBDTalQL0jrODgnLiLWz9em61iRxocGzqBbi0Vmq7dj//Ak+BIe8++TKkF2dajxuSvuZcI5qbnTZOgys9uz0=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1060.EURPRD10.PROD.OUTLOOK.COM (10.169.150.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Mon, 16 Dec 2019 16:32:49 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ed23:3ca0:97ef:c868]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ed23:3ca0:97ef:c868%10]) with mapi id 15.20.2538.019; Mon, 16 Dec
 2019 16:32:49 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Mark Brown <broonie@kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Thread-Topic: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Thread-Index: AQHVptoKIWnW5XGNx0qiesHaa7KQWaeqBMOAgAkpmQCAAfp+EIAAFOMAgAGB2oCAAAM8gIAACD8AgAXEVoCAAH2AQA==
Date:   Mon, 16 Dec 2019 16:32:48 +0000
Message-ID: <AM5PR1001MB0994C60CB5B957CFE19E495D80510@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-4-m.felsch@pengutronix.de>
 <20191204134631.GT1998@sirena.org.uk>
 <20191210094144.mxximpuouchy3fqu@pengutronix.de>
 <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
 <20191212161019.GF4310@sirena.org.uk>
 <20191212162152.5uu3feacduetysq7@pengutronix.de>
 <20191212165124.GJ4310@sirena.org.uk>
 <20191216085525.csr2aglm5md4vtsw@pengutronix.de>
In-Reply-To: <20191216085525.csr2aglm5md4vtsw@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0bb2da7-145d-41b0-1f1c-08d782459719
x-ms-traffictypediagnostic: AM5PR1001MB1060:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB106058BC06D89A44922E8E4EA7510@AM5PR1001MB1060.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(366004)(376002)(136003)(346002)(39850400004)(13464003)(199004)(189003)(478600001)(64756008)(33656002)(52536014)(55236004)(53546011)(6506007)(66476007)(2906002)(54906003)(966005)(66556008)(55016002)(26005)(9686003)(81166006)(81156014)(186003)(8936002)(5660300002)(71200400001)(8676002)(4326008)(7416002)(66946007)(110136005)(7696005)(76116006)(316002)(86362001)(66446008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1060;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: igTp19oIRWEAya0cBIJnQuTo8Y2jihVD4iUhXgtKJMVv8evv09wt3ewnVWN9YCOLbpHqArjW6KESAMIcIgYCpVBriA0NEYFPx9O2D5yomcCwACHGPV+Or3/MlfUEMmP847xntnI+xykpjptZPsOTibAeQ/kwhqS8fSWVEvtlDyaK9gmBkkvdt+G81OIeuYocQYIuQGQAXS1PLwMMqI6el/Rrq+vqOfiwFwYXCIxh7Ia4jerD7ONN2xlMICG019BCctK9ELOUMJKT7c9bFJ+KD9BxbFrv70lHdKYOUDI3ZU9wtQp7ggESsCPEMHbBvwftLqFHZYi/QjYepiJa0RpEpSskuJcjBkjo7BMoWpBdZMWbsvMtZBdS6Zawx2IlS4JAfJeZzCHhgzI7AXXjIn0VTpzR4dzv5HWaQZsnjvadYTi+8OrZ/NVZu1MO30wy7Ks5/1K1HX/ZUTrgozO7borzLgeW3i7duBbV5tY6mKCjbWR1t+ygBWa3HTEHwPuWEpHS0Vo8ZX6B9aDfmhml9sFQZaxNhRzdGh8qnBvLAAnRR20=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0bb2da7-145d-41b0-1f1c-08d782459719
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 16:32:48.9237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IHLh6sxpX6wE1oLbyoqGV6kZE47rmMNsrtgzakwn3fnlT/JAdZ+9pjgr0mgVBX01lEOqBxO5AtHlsgdyEFbd6fWyGi0jyYg6cxJ54cXh3uE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1060
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



> -----Original Message-----
> From: Marco Felsch <m.felsch@pengutronix.de>
> Sent: 16 December 2019 08:55
> To: Mark Brown <broonie@kernel.org>
> Cc: devicetree@vger.kernel.org; Support Opensource
> <Support.Opensource@diasemi.com>; linux-aspeed@lists.ozlabs.org; linux-
> gpio@vger.kernel.org; andrew@aj.id.au; linus.walleij@linaro.org;
> lgirdwood@gmail.com; linux-kernel@vger.kernel.org;
> bgolaszewski@baylibre.com; robh+dt@kernel.org; joel@jms.id.au;
> kernel@pengutronix.de; Adam Thomson
> <Adam.Thomson.Opensource@diasemi.com>; lee.jones@linaro.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator volta=
ge
> selection documentation
>=20
> On 19-12-12 16:51, Mark Brown wrote:
> > On Thu, Dec 12, 2019 at 05:21:53PM +0100, Marco Felsch wrote:
> >
> > > "... what's driving the input ..":
> > > Sorry I didn't get you here. What did you mean? The input is driven b=
y
> > > the host. This can be any gpio line and in my case it is a gpio line
> > > driven by the soc-hw during a suspend operation.
> >
> > Something needs to say what that thing is, especially if it's runtime
> > controllable.  In your case from the point of view of software there is
> > actually no enable control so we shouldn't be providing an enable
> > operation to the framework.
>=20
> The enabel control signal is always available, please check [1] table
> 63. There is a mux in front of the enable pin so:
>=20
>              +-------------
>  Seq. |\     |   Regulator
>  GPI1 | \    |
>  GPI2 | | -- > Enable
>  GPI3 | /    |
>       |/     .
>              .
>              .
>=20
> Adam please correct me if this is wrong.
>=20
> [1] https://www.dialog-
> semiconductor.com/sites/default/files/da9062_datasheet_3v6.pdf
>=20
> Regards,
>   Marco
>=20
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
