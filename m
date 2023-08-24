Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B46B7870B5
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Aug 2023 15:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234257AbjHXNp1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Aug 2023 09:45:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235218AbjHXNo4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2023 09:44:56 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2070a.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::70a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E9351FF9;
        Thu, 24 Aug 2023 06:44:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWnXrnb03fpY83pyEdVMzIvK8bkLS3xpSUgdCOVCfdTQvQdQwPlsU9JJSOSAyM/OIjf7sQzoTtBHYpatzqNN3rsara4InJkzbbcukA7EZU5VbwWJi93XxTzJD6P4oSNW1QvdMmsTMk71AglJC0DNHs6td9DGvXbDk+9OzmWtLELdy/g3xYxZJnVtaR/+8d5x2U0ki8MA5s8YCtcF2ycTFBPecDxFda9NYGBHHp9+E75b/PBIEBnC9y5JwV14TNl43XLladdV5ZNxOCA/eGsJPHAIOp9hkEyg7BZ129CGRmzgCwRWDGRnhJx5LAwGvLLJhUXMOTFygLPmpG7xNHdMHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3c8zFO+gZwSgkZFoGaqJgfkgqhIQLt3gtVtTq0QWA7Q=;
 b=oBNfUhuEiqJJQaPKzQnC4NXkoBKvSnic6KwVl8GC8Ze2wpsoEYFwW0YCb0GpEB3N2S5AeJ6tkZ8K/30qp64iFbkv2DQFrFkJYrv08YClKIDsRwcMGPibU33GlQA/yGLBLmFmj+Nk/oJgTyzAWsM3MGXBHP80AW7ftIUyeCSPDcmDbXwGVcTxJZ/TZb6rnP0TFPCpBRVqmqaJ5vwuQkTaM3ozW5J148FTIamalJIaKet5mi8wkurJ/fCxkSfgBaVIKDIe+YDrw+Vg+vY73ag50spHLtostXoTq7YRvhMTtJXVTW9LxdslORyos2edarFANWNTGRZ7uvU0hkTHgEUDTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3c8zFO+gZwSgkZFoGaqJgfkgqhIQLt3gtVtTq0QWA7Q=;
 b=eTcxW3vaqKGWrQuykGW2tGfHiq5ZcSvkvDTh0Nb7vrN1VXFiL7p8H0uhw+dHiafx7fe2JSsoT18gTBjztlftOhDSL0V+B3VC8cNm7jiXJSJ1P3/CR/scLBv0xWpJn5HXrXH5G04omvFfts5MwmGCzKaa/unE9oONXtTT+l9nTcY=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYCPR01MB10383.jpnprd01.prod.outlook.com (2603:1096:400:226::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 13:43:32 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::8e13:cc46:2137:9b03]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::8e13:cc46:2137:9b03%6]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 13:43:32 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andy@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] gpio: pca953x: Use i2c_get_match_data()
Thread-Topic: [PATCH] gpio: pca953x: Use i2c_get_match_data()
Thread-Index: AQHZ0sPjWZr3s3emlEaGKkIMTxnnCK/0uBqAgATEHSA=
Date:   Thu, 24 Aug 2023 13:43:32 +0000
Message-ID: <TYCPR01MB5933934B24BE7F3191DCC9FA861DA@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230819173747.8682-1-biju.das.jz@bp.renesas.com>
 <ZONe2RxQUAbYuVXA@smile.fi.intel.com>
In-Reply-To: <ZONe2RxQUAbYuVXA@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TYCPR01MB10383:EE_
x-ms-office365-filtering-correlation-id: 60756943-50b3-4d4c-a072-08dba4a81b73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9hvwOvDM2RIb+pMN3fHhKzxDsSXFbfLn/FMq8BskJw5mXgjkU6xwWE/X9+e/tsf6XiHUg9p/wsKuMgoSXtE9Yw1u0pi5yXtQkeqsvnnImm8aRdpSmBEFi+UeliFTMWl5PsMN3v1NTE0KHua9ZNa77knANDAaTLwWiD2he3IOQFgWB2cf/hehBtluKPnhllpudbdZlFcwjdccdOcWbmqM08AxHUsPScVlxDjdEWhVjwVUpX8AwITEVKPx19Uran8EbhEDmKoCWLOuFEBUDJmtqt9tinaYPzWCHzhXHGyo+MQ8ovZVV01/8zFdGAkmEUD9h/MWmw9PTOBgWdpeDPm/AH9vimvrQg+5uHK3QFDIGGR2OMf1wQVnkD2o6VnRrPNxTF01YC0GDy2ioa5k0nWRZPgwM8GlRIJufArJWwFenZ0TOcUQu+fQNbGTWtUjfH++Zura6bsdquWf3poMmj/bYuF8r4q9shg5hMkmjSHhDCZ13Hus2kqlnkPkutdSt5g9I1liYJViWPTztPKWPR46zC7CIiw9N4v2o3qh9SbSSdpnTVsdelz72cV+vh92j/omkf8L3pMGZVY7TdxyNnnZDHrVEi90WrKkF9l4S1qajGgufSPKn6r2XAbsfdW7pc5S
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(346002)(366004)(136003)(1800799009)(186009)(451199024)(52536014)(5660300002)(8936002)(4326008)(8676002)(4744005)(33656002)(7696005)(55016003)(71200400001)(38100700002)(38070700005)(122000001)(76116006)(66556008)(66476007)(66946007)(66446008)(54906003)(64756008)(316002)(6916009)(478600001)(41300700001)(9686003)(6506007)(2906002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ewyAsRlRVPJcquXg+rsJeVmpjb/C2hSJbrmvEV3shxvyXgqusWM6tr0d/jLF?=
 =?us-ascii?Q?Ddx53DmjF1a8ZZ4DOWx1ssvPibhG5wwR4AwHzq1x563e4i9T0p+rWyNs4Y1v?=
 =?us-ascii?Q?ARzxh28lC2iAK8lveFKQMTXrC5dKAN51Zb8J5sCuBbORaOdEhZRDfDC1jQ1u?=
 =?us-ascii?Q?DRb2rGG9Qk4KR2oqu90VyeP8X2GsmqAWJhQWPysgu4WUBRnNrBv2GvSiqS8A?=
 =?us-ascii?Q?ltycGxNfSa3WMCSYwPETiNCNFBKtmTX8AFOEHlHSW3Wx14W/GpudnA//4b6r?=
 =?us-ascii?Q?9SzN1xJSnNqAO7Ab6SZ0Rk+xnoGHhFb2BOdB6CeP7EwWIsXWCYpldih23njw?=
 =?us-ascii?Q?+J2php2Ry628MNIDQ/N1OjKtxZiBX4Gsz7to+SgP/gkWia+7+1OOdbwBtozb?=
 =?us-ascii?Q?pXTN1/HkXahceZhhLEpYi7WBkFXhqJpkce/EnFHG/7enUhg0Xd0befdlGguj?=
 =?us-ascii?Q?bdX1Y/GOH2iPlt0jNITSrwjoGVwwfqv0LgJoduugnZ7ZpQfMYI35JK2jTrue?=
 =?us-ascii?Q?MF01axxCo5nKBcVHnDUR5/MQKQ08TjFAv3Be0FatM4o57brIK/PCHupFNG0w?=
 =?us-ascii?Q?ut4/PNLTJmP+cEZhmAvsy8m85qPNvNeFJk57hKHW4oqyQO50lt2TRAvSRyEz?=
 =?us-ascii?Q?cRgmgpbAbRu4pHsphe0yy/mJUk0dk+1uiNw3f6dUylbkd/KFbRiD1ZVwqxDA?=
 =?us-ascii?Q?IIbjYCTbqOhwhUQPFYRj9DjveuIm2mzEqyX66q77uLMqGYED/TEy6FmAwZpl?=
 =?us-ascii?Q?jUC6FEEeMyMLTVVn9gB33ycv/LIuykCFbMO55hbwz/hv8J/0ww86vBB0BDGO?=
 =?us-ascii?Q?9QdUhrIE7naK1+POjRxCnngkKihLZ3+hegblKgQ7ulkFeum10a1aRKJmQJ7O?=
 =?us-ascii?Q?MhdlRBWRePc+df1rC7Y+entVY8PxaSc++Aav8nK9BhZpe/hp63ZDnN9FAHMK?=
 =?us-ascii?Q?GmuK4bCHcuTVu3uDJiMpv1ntHWHteJi27I8EXlo50uUcLKqxYUvHNKalWidO?=
 =?us-ascii?Q?z8zpHoT8UJH8V7hSQ581EPzRpzy2Z/yajW+twLLn5lbZBlXKMXw6WXYkojaQ?=
 =?us-ascii?Q?ZQTRpx/3yGmsrUKOVs6K4D+xk4/wuJxD/jt+KRAI92kMSm4Zj5uDM6DsfX5Y?=
 =?us-ascii?Q?B2UgYJ8YV+8WS6r1E4smfD1T00JTITfZfKVvN63EOj16i540YwfvScDu09OI?=
 =?us-ascii?Q?lCSR5Tye8JVBAMvkJvmZ7yjwC06/kERmUEepgHNiQ58S1zi5jjSKFI6/a/VE?=
 =?us-ascii?Q?R5kxIiGxG8kzYTc5Abo3YDOfzaaxVoS87GoAy5MoYJ58nSWQW6IaWbsmih7B?=
 =?us-ascii?Q?CD5blfWnMI2iCYtAc0zknHPF1dMXwU3NOvvbbY56FUvrZC4kFC5XvwBE27Lm?=
 =?us-ascii?Q?y+y4RPzpPnmRraqnXHTA55TM23n8tr50gA6YSOD3AltBrBa/cLceoXmYHZfq?=
 =?us-ascii?Q?x958nYxn8RIpHA9MLJGzf62RzV164MzPrb2rYhL8k42XH8b1ualO/EhUe9P0?=
 =?us-ascii?Q?q2Q90eNKOlHuUi/nLtmrKWIa+pN8LFqvmdWgag0Xx2vW1tR/Zce/CXplNPLE?=
 =?us-ascii?Q?CJNt30rD6T7s30U2QIk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60756943-50b3-4d4c-a072-08dba4a81b73
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 13:43:32.5052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xVYAehz6CcEFRJuMWRVTtq7ro+4TO/k187xK6MPppy5TLz8qJxmedW8ptIba6Et9CwhjvkEM+x3JebygVl6K1oH+0FkIrHJwF8IA1rqV7bM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10383
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH] gpio: pca953x: Use i2c_get_match_data()
>=20
> On Sat, Aug 19, 2023 at 06:37:47PM +0100, Biju Das wrote:
> > Replace device_get_match_data() and id lookup for retrieving match
> > data by i2c_get_match_data().
>=20
> ...
>=20
> > -	if (i2c_id) {
> > -		chip->driver_data =3D i2c_id->driver_data;
> > -	} else {
> > -		const void *match;
> > -
> > -		match =3D device_get_match_data(&client->dev);
> > -		if (!match) {
> > -			ret =3D -ENODEV;
> > -			goto err_exit;
> > -		}
> > -
> > -		chip->driver_data =3D (uintptr_t)match;
> > +	chip->driver_data =3D (uintptr_t)i2c_get_match_data(client);
> > +	if (!chip->driver_data) {
> > +		ret =3D -ENODEV;
> > +		goto err_exit;
> >  	}
>=20
> Can you move this to be called before devm_regulator_get()? It doesn't
> require regulator to be enabled for functioning.

OK will do.

Cheers,
Biju
