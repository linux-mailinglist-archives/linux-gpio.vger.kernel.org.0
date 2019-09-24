Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02C8FBC5E8
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2019 12:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438809AbfIXKyA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Sep 2019 06:54:00 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.69]:51821 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2438798AbfIXKyA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Sep 2019 06:54:00 -0400
Received: from [46.226.52.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 38/A8-04297-4C5F98D5; Tue, 24 Sep 2019 10:53:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSf0wbZRjH+/bu2oO0+lKKvDawuermMmlpwci
  5TUOiLtVsZhkmZixkO8ZJq6Vtem1WxBi2URdghqlbM37Z4gpqWaIUWXCwdKkdgaosLuHHJjoY
  LG5tMwTqQBjMXlum/vd5nu/3ee77Xh4Sk/wikJGMzcKYDbReLkjFtbmpBYof/qotUf3Ys5GKt
  gZxyhkYJijPme9x6vSDL/lUt/MBoP68OIJR9ksBYaFQMztuF2q8nlqBZmK0X6BpWFVpFrwb9h
  LFhM5QarQdIrQnm4Zw05zU5reHiGoQgHUglQSwHUMtE+ewOpASKwZwFPZaE0I3QCsf/y3gChw
  OYmjKHeVzhQQ6+Mg36xJyIxI4A9CJqQKOBZBCnw1Oxiek0MtHl4+vEVyBwU6ARk73xSfS4avo
  wiUPqANkzPUaurd6mGtLYR4aW+oScIzDzSjiWiI4FkManVs8G7dL4Ltocr6Ka6fAHajRHSASs
  bNR9Ghn/AkYzEQ3Zpx8jhGEyN1/FUtwBro7vZb0M2jo2DhI9HPQz2MzSZajz1sDSc5G15z1Sd
  6DIvMN8XcheBugprab/PXh7wacSROF3PV2nMuJ4DNozV+ZQBO6FaQSji2o/34AT3AW6rqySJw
  CuU3/SZ3gHOTqmxck+DnU0RbGmuI/Ig0NNc7gLoB7AFVq1pVrLRW0Tq9Qq1QKtTpPoX6RUqip
  AiX9vqJUyVgVRxjWolAr6SOskq2sOKwvUxoYixfErqvMNNDXC5YbI0o/eJLkyzPEDwO1JZLHS
  o1llVqa1R40W/UM6wdZJClHYjIa09LMTDlje0enj93ouoxIkVwq3hW7UomYNdEVrK48IQWBgj
  x1t/ULTIIbjAZGlimu4XZAzqS1Gh6tWL/0ayBbli4GPB5PIjIx5gqd5f96CGSSQJ4u3s1tEek
  MlkdfCsVC8GMhnn4lHsJC/yvJqvlFJblvflBE+VJu47svhwujlg/F+6fTWGXnWyZ+7/bfV290
  GZXdeY7AhalvR359ilg4fyyQOciePHFnxeGuWhRe4eUX3lmYbuc5vqGDK7af9tmj1uLR18Mh1
  1HqQPGmnJbC3p3ANzmxde+hWfuZ/Iai8807i7bfmnuoag72XJ3cXK8aF32SElU9HvI4WrBG8r
  evhx3Usm//tg336y+q4bMH72nDG2u0o9GayPNS/xuf7jhrtI5df3tpj2eWYFGBr68KW+mxzbF
  dLzd3//HSzaCFfg/vqDI/0ZExuOWF6n1YRGSpdflVGXmySuWw/CvXgV3L7R9llbR1Hg/kbr0+
  ng/lOKul1dswM0v/A0Pzv15kBAAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-24.tower-282.messagelabs.com!1569322435!14046!1
X-Originating-IP: [104.47.10.55]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26750 invoked from network); 24 Sep 2019 10:53:55 -0000
Received: from mail-db5eur03lp2055.outbound.protection.outlook.com (HELO EUR03-DB5-obe.outbound.protection.outlook.com) (104.47.10.55)
  by server-24.tower-282.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Sep 2019 10:53:55 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHTDQKOBHkdId4cEh7gfst/sec8kZh1+s6Cuqo+iAYBgY/KWvS9NiuO+p5L/Zi9uohzjTDN3x9I4o9C7oNChTIAas2w0vS00qfSCJg0JM/s2BM4ttSdJ66uQ+AvZjzRvNlKBOj45T7vzpMld+Hgzc/C7rBkQvfUwW6mpL3WsQ8UrTb+wbWYrElwLWveFpaCSEfVuEbzppx3yze8t5wLyuCmVJifz60BRgU7aNPzxXFivbRCs5N8f31oUBpVDR09GrQa5C5UBR+OCKOosO2vNXJLmQVFuBDbiS9lxiNUVLCxN0xwiCfyuifvKRYQc/K9eP/u1/mzWuxM9/l+S0d8Cew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhfWTG6EKV6waTUu1Uiq0OXP/kvGXyn4nRMRaqWC6Qc=;
 b=c5DDrwszWRKd5am679GlEq8jm5omh7KgZGZSxX3rivVZB8Ilqswarqs81iM8ZTBD7XJzwDIlHhm5I3hPxlzWNQxeZ4wTqXx+56ZsAbQeBrHN5CsDnq/c+reeKkL8lHBuuedI00dfCCPJu6TkQlTHyOvf41FA92PlMY/Qa8QQi6NH7N+cnVdO4/wBaSVQjifFPtYQpBDqXEHYkdeS/SM96AMx//gyQJSRJREupOcthDd0AbSanGHiw02MC1zK9PjiZZ2WTyWzJS3VAKXyZ+3ut/wMZEQIx9eAnAELnRh56KojCQ14KQ0OXa8y0bbCuIGyEMk3qR1K859CoX5gKiShlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector2-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhfWTG6EKV6waTUu1Uiq0OXP/kvGXyn4nRMRaqWC6Qc=;
 b=P0YObNVSX/0puweVmZ7dSDYkr/qjUhjZ4J1FKZ7FGhZOl3WxSwdFUmtmDEEYI0pFw8BEzks4/NYt0plqS7DHbbY4zq0Qe4sCVOaWg1p+FM4aU7w8oSi3mPTIeyPs40D87Wzz95+cR3/8hZxjDnISypJp5v31Gt8+jfukCGDm7O8=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1121.EURPRD10.PROD.OUTLOOK.COM (10.169.154.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Tue, 24 Sep 2019 10:53:53 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::15de:593a:8380:b8ef]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::15de:593a:8380:b8ef%12]) with mapi id 15.20.2284.023; Tue, 24 Sep
 2019 10:53:53 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 1/3] dt-bindings: mfd: da9062: add gpio bindings
Thread-Topic: [PATCH 1/3] dt-bindings: mfd: da9062: add gpio bindings
Thread-Index: AQHVbUbz3PrucF7MmkCso7BNDJppGKc6sf5A
Date:   Tue, 24 Sep 2019 10:53:53 +0000
Message-ID: <AM5PR1001MB099472B4C90EF215134EF5AB80840@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20190917105902.445-1-m.felsch@pengutronix.de>
 <20190917105902.445-2-m.felsch@pengutronix.de>
In-Reply-To: <20190917105902.445-2-m.felsch@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfb68768-c5ba-4ea0-db41-08d740dd7d97
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM5PR1001MB1121;
x-ms-traffictypediagnostic: AM5PR1001MB1121:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB112181DAB21AB269B9424A7FA7840@AM5PR1001MB1121.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(37524003)(199004)(189003)(55016002)(86362001)(25786009)(33656002)(478600001)(9686003)(76116006)(446003)(5660300002)(66556008)(66476007)(64756008)(66446008)(8676002)(81156014)(6506007)(186003)(26005)(99286004)(229853002)(110136005)(76176011)(54906003)(8936002)(52536014)(14454004)(81166006)(6436002)(66946007)(316002)(6246003)(71200400001)(71190400001)(74316002)(305945005)(2906002)(53546011)(55236004)(3846002)(6116002)(256004)(7696005)(2501003)(7736002)(66066001)(11346002)(476003)(2201001)(486006)(4326008)(102836004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1121;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SGJeeBq3qpXCXYf65O6HNQ6QicgThlMwfE5y3xBF+u26CbC9QaaXgbzYG6DPlLPpFzGrcX1nSgj2M3RZKVuZB6IIdxXYdACwAz8Pt7RpMNsCVJYeat6/zf3wX4MGxqA2dk7nKMDOmW+4m8H/q1SG7lI+Hrvie4pvkHaegPK9Ltj8QdFGPIfkVUaF+qrhbxjIbRoUip3LCe95z10adcmDT8NLtJeq3b0jj7ed4+FYs47W8Y4CzA9WgbHy1COyHbIB4Sc9sKrmfPJlftouWxTpGMWNLO7CLP4ETBTBM8n/4NN+1MArSQ3AoysNCPK+UJQeszSMNXUqkxtkME3Qpv1lJ8fNCA6M4cA9G4UbJVyWErwWJr/pHgzfpY0Vx3dz4mTFXmBsQAG6Yad53NPLvSiMTP/mVkBDNXEzg7vvwSkppYc=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb68768-c5ba-4ea0-db41-08d740dd7d97
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 10:53:53.4389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /HPUVm4NDBbNAmdggN2Tj0SPYOG4vjGdufZTMn0d4GsEAoubXM8I4iT1nV+9PwytJeJ9vMjDwHhJjnV3KPy4wOAc92K/MjUmNsNXdyCfnP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1121
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17 September 2019 11:59, Marco Felsch wrote:

> Add gpio device documentation to make the da9062 gpios available for
> users.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../devicetree/bindings/gpio/gpio-da9062.txt  | 26 +++++++++++++++++++
>  .../devicetree/bindings/mfd/da9062.txt        |  3 +++
>  2 files changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-da9062.tx=
t
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-da9062.txt
> b/Documentation/devicetree/bindings/gpio/gpio-da9062.txt
> new file mode 100644
> index 000000000000..b0f9236a7176
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-da9062.txt
> @@ -0,0 +1,26 @@
> +GPIO driver for DA9062 Power management IC (PMIC)
> +
> +Device has 5 GPIO pins which can be configured as GPIO as well as the
> +special IO functions.
> +
> +Required properties:
> +-------------------
> +- compatible      : Should be "dlg,da9062-gpio".
> +- gpio-controller : Marks the device node as a gpio controller.
> +- #gpio-cells     : Should be two. The first cell is the pin number and =
the
> +                    second cell is used to specify the gpio polarity.
> +
> +See Documentation/devicetree/bindings/gpio/gpio.txt for further informat=
ion
> on
> +GPIO bindings.

As mentioned for your other patch set where the regulator driver makes use =
of
GPIOs for control, I think here you should probably have pinctrl to define
alternate functions of each GPIO. It seems that mostly pinctrl drivers supp=
ort
GPIO functionality rather than the other way, so maybe that's the direction
to go in? Maybe Linus has some input on this too.

> +
> +Example:
> +--------
> +	pmic@58 {
> +		...
> +		pmic_gpio: gpio {
> +			compatible =3D "dlg,da9062-gpio";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +		};
> +		...
> +	};
> diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt
> b/Documentation/devicetree/bindings/mfd/da9062.txt
> index edca653a5777..eec69c4f0697 100644
> --- a/Documentation/devicetree/bindings/mfd/da9062.txt
> +++ b/Documentation/devicetree/bindings/mfd/da9062.txt
> @@ -13,6 +13,7 @@ da9062-rtc              :               : Real-Time Clo=
ck
>  da9062-onkey            :               : On Key
>  da9062-watchdog         :               : Watchdog Timer
>  da9062-thermal          :               : Thermal
> +da9062-gpio             :               : GPIOs
>=20
>  The DA9061 PMIC consists of:
>=20
> @@ -76,6 +77,8 @@ Sub-nodes:
>=20
>  - thermal : See ../thermal/da9062-thermal.txt
>=20
> +- gpio : See ../gpio/gpio-da9062.txt
> +
>  Example:
>=20
>  	pmic0: da9062@58 {
> --
> 2.20.1

