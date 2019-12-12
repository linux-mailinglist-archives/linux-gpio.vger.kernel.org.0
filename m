Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 338B311D29C
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 17:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729919AbfLLQpi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 11:45:38 -0500
Received: from mail1.bemta26.messagelabs.com ([85.158.142.1]:34732 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729101AbfLLQpi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 11:45:38 -0500
Received: from [85.158.142.98] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-a.eu-central-1.aws.symcld.net id F0/E5-12484-DAE62FD5; Thu, 12 Dec 2019 16:45:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGJsWRWlGSWpSXmKPExsWSoc9grrs271O
  swc9maYv5R86xWqyaupPF4v7Xo4wWU/4sZ7LYPP8Po8XlXXPYLD7susps0br3CLsDh8emVZ1s
  Hneu7WHz6P9r4PF5k1wASxRrZl5SfkUCa8b2xVIF+3krnnQuZmlgPMjVxcjFwSiwlFli3u5Jz
  BDOMRaJPZcuQjmbGSV+9/5kA3FYBE4wS0y7M4cFxBESmMYksfL+bmYI5yGjxJ0zq4AcTg42AQ
  uJyScegLWICHxmlFiz6QgjiMMs8JpRYmPnNlaQKmEBP4npa/6zgNgiAgESv9ZvZoSwjSSmbH7
  BBmKzCKhK/PnSyA5i8wokSkxfsQUsLiSQJzHvwASwOKeArUTbzP9gmxkFZCW+NK4Gs5kFxCVu
  PZnPBGJLCAhILNlznhnCFpV4+fgfK0R9qsTJphuMEHEdibPXn0DZShLz5h6BsmUlLs3vhrJ9J
  R7unMgOU396zR6ouIXEku5WoF84gGwViX+HKiHCBRJn9q6GOkFNYsr6T1AnyEjs7OkGB5CEwG
  YWiWUftjBPYNSfheRsCFtHYsHuT2wQtrbEsoWvmWeBg0JQ4uTMJywLGFlWMVomFWWmZ5TkJmb
  m6BoaGOgaGhrrGusaGZjpJVbpJuqlluomp+aVFCUCZfUSy4v1iitzk3NS9PJSSzYxApNYSiHz
  uR2M7d/e6h1ilORgUhLlncDzKVaILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK9TLlBOsCg1PbUiL
  TMHmFBh0hIcPEoivNtA0rzFBYm5xZnpEKlTjLocE17OXcQsxJKXn5cqJc7LBFIkAFKUUZoHNw
  KW3C8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEua9DTKFJzOvBG7TK6AjmICOMIwEO6IkESE
  l1cAkI5WlxXZFsbpK9+lp6YztVxamLF4S+fGbpbTeobMdufOc/6cVpqhFKPxtEzvC/Ova0gn9
  KxRn3Pt78NOEPOccvV/WG88eSUmZ6uDg/vWIh0V72VONV4H5ljsnzayoPpjzI59bu+DkTbagF
  Qm5xxXFU/jqVPYv/6T0Mmzzy5XCu8svvNVum16dWzbPQ3la98NPd3o1/3fnV675ev2mhuasRX
  /Kul7elr3ZZPJ/zowrjeahaxW5DHxF0nK5o8RMlHenT16/a2fDivi9ihyTDEqFY4+/+G7zcpX
  mIu8rK1j3VNypqPtlv2nj6toAL5EDT1KWhdoFN6mFX59W7KyR8JivZlqLSOnUN+ealouI/3BQ
  YinOSDTUYi4qTgQAAABMk2kEAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-14.tower-223.messagelabs.com!1576169132!291399!1
X-Originating-IP: [104.47.0.55]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27810 invoked from network); 12 Dec 2019 16:45:33 -0000
Received: from mail-he1eur01lp2055.outbound.protection.outlook.com (HELO EUR01-HE1-obe.outbound.protection.outlook.com) (104.47.0.55)
  by server-14.tower-223.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2019 16:45:33 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hz4Ug4cJ4xKQ2b3lEY3/s8pdnO0/SpF777zpQkfLzR0hoVaVaKusJhZvoDJZExFxjGSvG/5Wd8DxdGGJVmpC6VHNOvBYVKbPS9v6URIJZQycM0SW0LngFmi0cMTtJRzMYFeik6iaI9d820zCn5JVVlKgm+NF6Mm6Ccsxty0wjyidoCMJAyY0AJH/0jfY9ojnAVy5bTUpgmOrVFCZ8rnSgiFcGuymZ2AkK0OyvHdisBesg5tHudtM8C63z5dlSEKVSk2252V2krzvE2SOuM0pdrmrUIa1jyIskF1flfhzIREhmLj+4mOaEMg3rUu7BQU3ttz/F1X7t+07ahT5fohVjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1tbaUEAIMGmN5GB1W1iTz6LxsSJeR9OwZ0vE7wlKIQ=;
 b=GowawS/DUigj4LatDT8fPTAOq/lkJO3bAAnHa/uFbA8NUe1A8gwYA237uEudeFMp/8XwE3iQbeQ6WNdFmAlsEHsVWi0HqHcTBfTCtLuL0CENw9b2i2d+A4vtCkorS7pps+TSKILDfqeyqYnC6tXDp5L07Bvix3ixO/PYGhzC2tl1TUvXgCYdLdTiyhdEA5ovirM2WTsdW9M8iWbDxFEjjr0WtoEFBpV4mBIzZ5kRol84trbusiRGAVZFjOnxkzffe3LOE3lGCHkNB3uDLEOntW9QyzHYvhnkCoRt4K4VrfvZuAn6WnQiJ1ASWkj/k5HIHQzMT+iWFn6JEBQXMRknnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1tbaUEAIMGmN5GB1W1iTz6LxsSJeR9OwZ0vE7wlKIQ=;
 b=IYiKKJ59mwkxv4RIXboSfSlYF/18FJi69THXakR70ZnrV2UyQC3E6xZ7BQee+ANi8mJsVxdVeql3KmbQv304R2xnajlIK8UlO7kBpoibVpOU7qX8fC5p8Fs4UjgplC4xhRydotW/Z5ETkzwY8cWMHrkK1oOUQ/g5f+/+9iyD5ZA=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1043.EURPRD10.PROD.OUTLOOK.COM (10.169.155.140) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16; Thu, 12 Dec 2019 16:45:31 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2516.019; Thu, 12 Dec 2019
 16:45:30 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [RESEND PATCH v3 1/3] dt-bindings: mfd: da9062: add gpio bindings
Thread-Topic: [RESEND PATCH v3 1/3] dt-bindings: mfd: da9062: add gpio
 bindings
Thread-Index: AQHVsQXYilpEQfTcWk63d+ryMHDRiae2r+9Q
Date:   Thu, 12 Dec 2019 16:45:30 +0000
Message-ID: <AM5PR1001MB099436D8D63BD2D22B9076A180550@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191212160413.15232-1-m.felsch@pengutronix.de>
 <20191212160413.15232-2-m.felsch@pengutronix.de>
In-Reply-To: <20191212160413.15232-2-m.felsch@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53230847-73b4-4c48-d83b-08d77f22b304
x-ms-traffictypediagnostic: AM5PR1001MB1043:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB1043B3ADDB62A12B433206D6A7550@AM5PR1001MB1043.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(396003)(39860400002)(376002)(366004)(37524003)(189003)(199004)(54534003)(8676002)(4326008)(110136005)(316002)(54906003)(81156014)(81166006)(2906002)(8936002)(86362001)(55016002)(55236004)(66476007)(9686003)(7696005)(71200400001)(5660300002)(66446008)(66946007)(64756008)(186003)(76116006)(33656002)(53546011)(52536014)(26005)(66556008)(6506007)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1043;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gs/Huy8hwVKfVNAyaXI308uMFVY8oZ+iHXTuzmGeANvhBoKO2RRwpP7I64nK5i/OY+OBNwDVkTilyz5UzzV9rGTHKVIker8ygWeFy7c/517+pEAKfYjVE/Q9VXtQMM6dfUQxOsv4DUo1sMF6MOrtMaxFbSyIG2z0qa/IgVqYHcKSh4BJPU3ZH627Q5XktsSlG1FVUp8N4E7fqYb/9b0d+2LvFiuZxg3yaDPmARKFr4ZMkHBlXJbamW6Hhhr6buAWb+rL7QjtMoME3miQx2XQGRcjlRK5J1/EyheQh2/GjCOPtBE1XJDeWIbWyinbrj1CemPb7gp6YkXHZp0IUOACqm34e8b9T+hHQzaTTy3fr+/iA3Nj/1nLnWU1rH1fxyHO34o5VM4UcIfkn0wqNkxxXOKkhvryXEdntA3Gu/ukCSE4zvbsBxpIyFOtVmWZkRVEQJ1vygT27kuMYay7LDoXpWzaJfOkr/GHoZa4r9Wn8CSCG0wVXLwAlSiVRdESG23yCzNSSgYT4QOXAdaJExng/w==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53230847-73b4-4c48-d83b-08d77f22b304
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 16:45:30.4469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a4uRde/a0xhO3j5LR0yblSBH4s5k3YRuvDWW1JPksHHhj4/YNy9H2G/s6SFpjQ3HnsWhZvuXGcuGTUQHXd4IMfAGYx3rwQv8qxvBhQouMe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1043
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12 December 2019 16:04, Marco Felsch wrote:

> Add gpio device documentation to make the da9062 gpios available for
> users.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
> Changelog:
>=20
> v2:
> - remove sub-node documentation
> - squash gpio properties into mfd documentation
> ---
>  Documentation/devicetree/bindings/mfd/da9062.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt
> b/Documentation/devicetree/bindings/mfd/da9062.txt
> index edca653a5777..089a28bc77a4 100644
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
> @@ -38,6 +39,15 @@ Required properties:
>  See Documentation/devicetree/bindings/interrupt-controller/interrupts.tx=
t for
>  further information on IRQ bindings.
>=20
> +Optional properties:
> +
> +- gpio-controller : Marks the device as a gpio controller.
> +- #gpio-cells     : Should be two. The first cell is the pin number and =
the
> +                    second cell is used to specify the gpio polarity.
> +
> +See Documentation/devicetree/bindings/gpio/gpio.txt for further informat=
ion
> on
> +GPIO bindings.
> +
>  Sub-nodes:
>=20
>  - regulators : This node defines the settings for the LDOs and BUCKs.
> --
> 2.20.1
