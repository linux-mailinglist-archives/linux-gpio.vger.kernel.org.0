Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95D9311D2A3
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 17:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729991AbfLLQpx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 11:45:53 -0500
Received: from mail1.bemta25.messagelabs.com ([195.245.230.3]:49079 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729912AbfLLQpw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 11:45:52 -0500
Received: from [46.226.52.108] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-a.eu-west-1.aws.symcld.net id A8/98-12117-CBE62FD5; Thu, 12 Dec 2019 16:45:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSfUxbZRTGeXsvlwu086WAHMnA0K3olLYUx3a
  ZumhmZuMg7B8lTlEv40K7tKVpC7QSTSFhW0GFDdgyvrpNBhlsy4SJjOKMwAhsMiMIW5jLXAcx
  fJQIg+kiMnt7Yep/v3Oe55z3yZtDE9JRKprmbFbObGT1MiqE1KoCXlb0GBczE0cexjGu/huBT
  GvNZZK5u3wVMdUrLSKmw7WCmNHueor5vXuMYEq/7Q96jda0tzopzS/jPZSm4u9EzYP22L3kvk
  CdMSvP9lGgtqnuCmVyPGUrOeoNcqA5cRkKoRE+Q4DXO4iEYoCEqrM/E0LRgeCvzx9RfEHiQQI
  6pmYDy1AwLcXHRNB3WMULUnwPwZ2uHwleoDADVYO/+ici8AME59r7/YsJPIvgK2enfzwcZ4K7
  btw3QftcH0Cla7uASeCsj+cdJJbDN+5lkmcJZqGkeBUJDxth+NCCn4Pxq+CeGvJ7EI6BpeI2f
  wYCR8HEpEvEM2AMTT1CNsCRMH1/NVDwczBUcgsJ/QQYvjm5xjJobOhf4xgYcZWvcRqcqD0StO
  6/fq5nrc9AU3kpyccHvBlWe+1C2wSXPKdJgePhzNmLlMAb4fJn5f7vAewioauxQlSJVLX/iS1
  wApx0L1ICvwjNp2aJWv9XhMHQiUnyJCJbEZNl1uVqrQZWp1eoExMVanWSQp2yVaHetl3Jfqxg
  lVy+opCzWBVqJVtoUVrshv36bKWRs7Yj331lm3pbutDjJa+yFz1Di2SRkkrxYqZ0Q1Zetl3LW
  rQfmvP1nKUXbaRpGUjGDD4tzMzlcrYcnd53pesy0GJZhKSTlyUWE2uw6HIF6RpS0JXTDacJKW
  nMM3LRURIRb8K8SZtvfLJi/dZHUEx0uAQFBARIxSbObNBZ/6/PoCgaycIlt/ktYp3R+uSlGV8
  IkS+E+l1/CCv7rxTtEO0dSn5J99O8l+W2xlbvfE5+oKikSBMe05ya3fb0oQzn7Q67bSaiIOBh
  nLPucXBbSmzGhS9yRou3uVcLVgZfT6347orqvpuq3iTXJL8Zdy3xLc/48b5Lt+6lb4nfEbWha
  WnelF71Q8vK/Nh789eD/yDeWCgKafg+rnt4ZYcqHSeXWnfnP0s5DEc2XVwQTU3YvRcqpg4q58
  pTQxOmicPP56k8ZXfTJo5/6in9urEv0ztR89srRVeNaQZLjRfP3Gj+ZFeY6+3hLytvvs8q5v4
  8Jk+9s2cgVG7f945nIDQyt3PoUco0pHiT9hfqz9dXOdjlXTvHdnvhYGzI+S0ZmztsGQdy2skC
  GWnRsuoXCLOF/Qc/rsOHZgQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-23.tower-272.messagelabs.com!1576169147!609118!1
X-Originating-IP: [104.47.0.59]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24767 invoked from network); 12 Dec 2019 16:45:48 -0000
Received: from mail-he1eur01lp2059.outbound.protection.outlook.com (HELO EUR01-HE1-obe.outbound.protection.outlook.com) (104.47.0.59)
  by server-23.tower-272.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2019 16:45:48 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gK+1m2BE+bwP/+C9pa1nrx1emg4KsKn/h54HtcIBT6fp57O648U4TzUjvlYY9UErx/ohpD1jJFNItDarTMPc+ZWzSeWRpuc9mGVlD5P5PChRDpANsFkVsfE/soyYIOONTY3wG3J4fA84jHp//vyV4A+6W19Rqy4N5lqzDyEFVFaO8Qt5w9LxtmHiDyrUxog5fZbr8zALJ56x7X28rY5JSgVfOGTsSsDpPGA5p2YBttiYQ916wvTL1yRdg/hSzLHwjcXA5Il/BjkoVpJJMv4aLjNXdt9apUj9vHi7lcLWt2hPuHxINBwa5Ylxs2cYM0T3YF/Vtdvna3g8/vRJRkV5xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTTDDnQF6yGyf4LNfrqV9lYTzjffA+Kdo9rfzAWuVaM=;
 b=OiAJWPU4cZgZXVAF66xLBil1a8izBZfNwoVRvuCmUsjqRKR7upTk6u1ARIxbZYa2t8XOoccFj9vUlrWaddJrGpkw61RPdaMKpT7R4UBTpnOQBLdctKKL18HJ6OJEEheN+iPiOjQR+w2RrqxVphvQuvg7O6w14oN9jqG+M/jajXkteWyWK3IrTdTGd5x808+zCNbQosEeZTE5u3gXbg5QKobwwweRpNfJqq3o4k657vYU+/E2oQbS+KJuQHhLcpTQEjWyaUaPp4wb6OAwxtfSx9NF7rIDjR6gFFzjwRJWhFYLWt/rJkZazLIN37zXz2DWrqG4ynsWdCZSHOvPVBIPIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTTDDnQF6yGyf4LNfrqV9lYTzjffA+Kdo9rfzAWuVaM=;
 b=GzMfjLqe+fT1EBGLjsUdp5AiswX5/hsGE+MSeikrjj4eOWQpa5eJ+0pCtkOHwhJzM9E+Jgvdlu5flITWhJmr3vXtEFQ/hkNrGUL3y4D/CCNBkWiPRL0N95b/3/mjt46AiJcW3vWQ2Pm6X1Rdx0TqwDp+EfkdHDW63X2eGB4werQ=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1043.EURPRD10.PROD.OUTLOOK.COM (10.169.155.140) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16; Thu, 12 Dec 2019 16:45:46 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2516.019; Thu, 12 Dec 2019
 16:45:46 +0000
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
Subject: RE: [RESEND PATCH v3 2/3] mfd: da9062: add support for the DA9062
 GPIOs in the core
Thread-Topic: [RESEND PATCH v3 2/3] mfd: da9062: add support for the DA9062
 GPIOs in the core
Thread-Index: AQHVsQXcKFcQyOE/80WxSSkJ3fgLS6e2sC7A
Date:   Thu, 12 Dec 2019 16:45:46 +0000
Message-ID: <AM5PR1001MB099464F0AD7334D0AE67011C80550@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191212160413.15232-1-m.felsch@pengutronix.de>
 <20191212160413.15232-3-m.felsch@pengutronix.de>
In-Reply-To: <20191212160413.15232-3-m.felsch@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 346cf975-cbfd-46a2-d075-08d77f22bcb5
x-ms-traffictypediagnostic: AM5PR1001MB1043:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB1043FF2ABFB1D29303F827AFA7550@AM5PR1001MB1043.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(396003)(39860400002)(376002)(366004)(189003)(199004)(8676002)(4326008)(110136005)(316002)(54906003)(81156014)(81166006)(2906002)(8936002)(86362001)(55016002)(55236004)(66476007)(9686003)(7696005)(71200400001)(5660300002)(66446008)(66946007)(64756008)(186003)(76116006)(33656002)(53546011)(52536014)(26005)(66556008)(6506007)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1043;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xzkjdq/c7x1Wij/9wuQ82GVBDxYpUTDWbGhMD55U/orDh/MsAYrBrHhGSysYQa/UtLpyT4/CJhDjmewu4YodbYI64RALHVDLUqOXEPYbZ/unixndxIRHEJyPjApJAU1vB2J0cKhNv4q/ozIbyucnX3rxr2xCWTguZfyDPVlluGZlB89KXeJCu0HTJzXi6aHQxZsUY2igkq1TGDZ9NLcGvt+DxYd6KuvgrUCX6c+ToENyAfALw6zlfIjTosgMhgyvzL4ZxtnHkazyLcxBbZhNpTKzhLofRFZuOh70tnELiy+uyM3Znt0oikW/uyqhIp2ZIF8Sv988YoubvVh3FKErBngyMnCVfZ1kKYeU27dEnEh8zwXiHIo6S9gY2Zm7IVnbVlOUURowdLUyXKZwCru0C9Pbal004hu5+tLUt5jwI3gamMkm+YerTGV9BdLelAF3
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 346cf975-cbfd-46a2-d075-08d77f22bcb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 16:45:46.6562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e9CrwFPlyiMdKgK6Lcfn0eA0eH8vKHb7OMn7M5thpnseEcCV+QNDX2OECWW0mnpteeIPK+LM5xbNomtbNqpVB0C9Ec3FFgcBVo9XZcIBJOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1043
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12 December 2019 16:04, Marco Felsch wrote:

> Currently the da9062 GPIO's aren't available. The patch adds the support
> to make these available by adding a gpio device with the corresponding
> irq resources. Furthermore the patch fixes a minor style issue for the
> onkey device.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
>  drivers/mfd/da9062-core.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
> index e69626867c26..5290bdc0ddcd 100644
> --- a/drivers/mfd/da9062-core.c
> +++ b/drivers/mfd/da9062-core.c
> @@ -233,6 +233,14 @@ static struct resource da9062_onkey_resources[] =3D =
{
>  	DEFINE_RES_NAMED(DA9062_IRQ_ONKEY, 1, "ONKEY",
> IORESOURCE_IRQ),
>  };
>=20
> +static struct resource da9062_gpio_resources[] =3D {
> +	DEFINE_RES_NAMED(DA9062_IRQ_GPI0, 1, "GPI0", IORESOURCE_IRQ),
> +	DEFINE_RES_NAMED(DA9062_IRQ_GPI1, 1, "GPI1", IORESOURCE_IRQ),
> +	DEFINE_RES_NAMED(DA9062_IRQ_GPI2, 1, "GPI2", IORESOURCE_IRQ),
> +	DEFINE_RES_NAMED(DA9062_IRQ_GPI3, 1, "GPI3", IORESOURCE_IRQ),
> +	DEFINE_RES_NAMED(DA9062_IRQ_GPI4, 1, "GPI4", IORESOURCE_IRQ),
> +};
> +
>  static const struct mfd_cell da9062_devs[] =3D {
>  	{
>  		.name		=3D "da9062-core",
> @@ -266,7 +274,13 @@ static const struct mfd_cell da9062_devs[] =3D {
>  		.name		=3D "da9062-onkey",
>  		.num_resources	=3D ARRAY_SIZE(da9062_onkey_resources),
>  		.resources	=3D da9062_onkey_resources,
> -		.of_compatible =3D "dlg,da9062-onkey",
> +		.of_compatible	=3D "dlg,da9062-onkey",
> +	},
> +	{
> +		.name		=3D "da9062-gpio",
> +		.num_resources	=3D ARRAY_SIZE(da9062_gpio_resources),
> +		.resources	=3D da9062_gpio_resources,
> +		.of_compatible	=3D "dlg,da9062-gpio",
>  	},
>  };
>=20
> --
> 2.20.1

