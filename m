Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A72E011D2AA
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 17:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729776AbfLLQse (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 11:48:34 -0500
Received: from mail1.bemta25.messagelabs.com ([195.245.230.8]:61827 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729762AbfLLQse (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 11:48:34 -0500
Received: from [46.226.52.98] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-8.bemta.az-a.eu-west-1.aws.symcld.net id 40/C1-22069-D5F62FD5; Thu, 12 Dec 2019 16:48:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEJsWRWlGSWpSXmKPExsWSoc9orBud/yn
  W4Mlsa4v5R86xWqyaupPF4v7Xo4wWU/4sZ7LYPP8Po8XlXXPYLD7susps0br3CLsDh8emVZ1s
  Hneu7WHz6P9r4PF5k1wASxRrZl5SfkUCa0bn4ttMBWd5K/7dvMfawNjK3cXIycEosJRZ4l5rS
  BcjF5B9jEWiq+ckI4SzmVHid+9PNpAqFoETzBJf3kqB2EIC05gkXu0RBikSEnjIKHG2aQlYEZ
  uAhcTkEw/YQBIiAp8ZJdZsOgI2ilngNaPExs5trCBVwgJuEh/vvmQBsUUE3CWuvDzNCmEbSSz
  /u4wRYp2qxNa9B8FsXoFEif3tZ9khVudJnFvYA7aNU8BW4tTd/6wQT8hKfGlczQxiMwuIS9x6
  Mp8JxJYQEJBYsuc8M4QtKvHy8T+o+lSJk003GCHiOhJnrz+BspUk5s09AmXLSlya3w1l+0pMP
  XuADaa+58hKqLiFxJLuVqBfOIBsFYl/hyohwgUSe35egCpXk5h47BPUOTISO3u6oeLzWSRenh
  OYwKg/C8nVELaOxILdn9ggbG2JZQtfM88Ch4SgxMmZT1gWMLKsYrRIKspMzyjJTczM0TU0MNA
  1NDTSNbQ0BmITvcQq3US91FLd8tTiEl1DvcTyYr3iytzknBS9vNSSTYzA5JVScPDQDsaVX9/q
  HWKU5GBSEuWdwPMpVogvKT+lMiOxOCO+qDQntfgQowwHh5IE76tcoJxgUWp6akVaZg4wkcKkJ
  Th4lER4t4GkeYsLEnOLM9MhUqcYdTkmvJy7iFmIJS8/L1VKnJcJpEgApCijNA9uBCypX2KUlR
  LmZWRgYBDiKUgtys0sQZV/xSjOwagkzHsbZApPZl4J3KZXQEcwAR1hGAl2REkiQkqqgUmxd/a
  p/mrNaKGKbCV9yWPH7h6TvLxyrtBio2knv84SqvO6ce7Cf88zrFJLLbcpss7d+GjJl/dLMo1m
  m915/MD2z/Kph98yhO7+czyl7Wr5pK55+b+P57dXTjW+nXuh1WqK8vWXeyW+KPA6nHkmJ//BI
  lxlvrz65q6V/05L+Xv9Xpzo2TPpGftWpZ/B3wLDTdW7Pf4pqVx2P7/epk73k5ibtWi3yZbG2q
  2Jm2xmbum7Llcuf2BNA78/v/zvNYseabryKpi5PPJ3nrWOPUqZ58ALyw4Z6bavk5k4vsxTaup
  L8bc5O/1LmDqbii/LCYv7Qu27le5Kdszdw3P0ufS9TbcDPPwFDtrxOTNd2Tx9cboSS3FGoqEW
  c1FxIgDe3L4eZQQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-7.tower-262.messagelabs.com!1576169307!283000!1
X-Originating-IP: [104.47.1.51]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27966 invoked from network); 12 Dec 2019 16:48:27 -0000
Received: from mail-ve1eur01lp2051.outbound.protection.outlook.com (HELO EUR01-VE1-obe.outbound.protection.outlook.com) (104.47.1.51)
  by server-7.tower-262.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2019 16:48:27 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLQW9e80/Jo6BXevLV7/t7gI3A8Zn5yQPGBLTjT+S5lEn8Xm1fe7ysRjv8gkM4oG8k5+AKWv6zCQMh3t1EjdhReVhQ3ULx2FnkNVaRB8izlcaBDPl0+4XIdbY0fow1Z6KKI0pWOFqRU45NeJjmvZQkBiwwWOfdIl4K40ICMzeaItDrOi4hnTXj7iVwZpa2A8jk7FpauDFDop4SaF0RbaS1NSlD1fe4CkrndLub1m1TXj99E3LxPfANtV64do1rjZPPkdlqWVT7koaqn0OGOwtebAFVHWeGP8SG7izju7Om0I1fgL/ah/iXmfyMNSCnDTwZp49fgEspsPgU1E/KwBug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoXBWvC0OPkyF1fHRIbUx3eD5blJJGZfcUyU+J6+aTY=;
 b=GGF+/YCrK4t8vZaa1ZNamhkBeIjRrbZlQKeLyJ8ZJAK6xRbmaDn+9uhW7+Y2pXJ7QvhuAnS7BLBgH70rCuTX8S0SE0THmmFK/6dZHAOCq6/15rj/sC4xIujU4a63qab9q4EXkB9oarrwsd8ufS9212h/ag+KI7KyW9TRuWe0IljaTXZAPPfRsAcqOsxn33ujOIytHYqsCtn33Hvm9FaAnLlRDl+jx42xzHGAsBxRt+WIRo4vvfgQAMiEnjMuqG/XNsdujYGQNxjI1zSTrLKyixH7cBo4XGUIWXOxd/IVQL6xzakAXWOYqorrOCcpjIi0P+bsL11n0q+0PCUSdInZLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoXBWvC0OPkyF1fHRIbUx3eD5blJJGZfcUyU+J6+aTY=;
 b=TN36SBw4q/79KMi80e1J6rQ/Y4g+sZFspL2J1sUG1aFfUUsFIEKxE81QoyqCbpfwWDr+LBC+Fggl70pa6uyLWHJ7yc2dfltBAyCTvCvgAR9Zc0B/+5qVTrsAIh4Jd+wWtY1Yk+CowolkBOPTA5U+oRi4vgB5aVXpAxTbfCAhzTs=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1202.EURPRD10.PROD.OUTLOOK.COM (10.169.149.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.16; Thu, 12 Dec 2019 16:48:26 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2516.019; Thu, 12 Dec 2019
 16:48:26 +0000
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
Subject: RE: [RESEND PATCH v3 3/3] pinctrl: da9062: add driver support
Thread-Topic: [RESEND PATCH v3 3/3] pinctrl: da9062: add driver support
Thread-Index: AQHVsQXfQ9DGkUJA90ed8RfDS4RwT6e2sLrQ
Date:   Thu, 12 Dec 2019 16:48:26 +0000
Message-ID: <AM5PR1001MB0994E2D72A95E4AC4796F80A80550@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191212160413.15232-1-m.felsch@pengutronix.de>
 <20191212160413.15232-4-m.felsch@pengutronix.de>
In-Reply-To: <20191212160413.15232-4-m.felsch@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69abee29-50f1-431d-b920-08d77f231bf7
x-ms-traffictypediagnostic: AM5PR1001MB1202:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB1202696EA343D8578FFB65B8A7550@AM5PR1001MB1202.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(136003)(396003)(39860400002)(366004)(376002)(189003)(199004)(54906003)(186003)(55016002)(64756008)(76116006)(66446008)(66556008)(110136005)(33656002)(316002)(66946007)(66476007)(26005)(2906002)(5660300002)(52536014)(71200400001)(4326008)(478600001)(8936002)(8676002)(86362001)(81156014)(81166006)(6506007)(53546011)(55236004)(9686003)(7696005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1202;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WLcKWDKymmBnUg/sgavELY/0SA9nde0e4Ioc/OTX+WqSXlicwfe0Dk7ue0tO3jpnkpBSMT48k8+LEhqRryb2e99P19f4yZLuLxLLvESijVx7SZmf1kjNV6G8khfwQXZVM/ymPV1cXJPLx9Rx10AAw1+y3iKnFnR7V0LJL/M7ZYbLLdNm05/oUBeE/6XkORYlunN5gOvr4qEW3Fi98gBI75gRlcPT+y7tCJrdzB5BHhjZDmMUdLwlPh0a1w9t+wB5KRV9tIQH2EqN/qKeUHIn73RlnA3vqDpceFHhMI5BhZabBh/eP9/CJxPQpL/RzfpErQxHB57ZN3aZUOva1qB7EfvFVa6WOnNR1RTIwQyH9ehSlopZays+blnDLOtYPLxQeWD7WzEATw7O87k5t1S2X45KGouPaXe7J+tQUWwNcIGlx6wsM9zMuNDHznaZiZDx
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69abee29-50f1-431d-b920-08d77f231bf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 16:48:26.5257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3hwDHCh65USDR4CO4kWD/UGV0Pc6BrGdgKLoW546tNN6z+wHRbk5XfB3loYWJLuhmZ15IBDeO/Sev7SFECsBjKJNWvsaElRa7GcQmIGg3Y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1202
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12 December 2019 16:04, Marco Felsch wrote:

> +static int da9062_gpio_set_config(struct gpio_chip *gc, unsigned int off=
set,
> +				  unsigned long config)
> +{
> +	struct da9062_pctl *pctl =3D gpiochip_get_data(gc);
> +	struct regmap *regmap =3D pctl->da9062->regmap;
> +	int gpio_mode;
> +
> +	/*
> +	 * We need to meet the following restrictions [1, Figure 18]:
> +	 * - PIN_CONFIG_BIAS_PULL_DOWN -> only allowed if the pin is used as
> +	 *				  gpio input
> +	 * - PIN_CONFIG_BIAS_PULL_UP   -> only allowed if the pin is used as
> +	 *				  gpio output open-drain.
> +	 */
> +
> +	switch (pinconf_to_config_param(config)) {
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +		gpio_mode =3D da9062_pctl_get_pin_mode(pctl, offset);
> +		if (gpio_mode < 0)
> +			return -EINVAL;
> +		else if (gpio_mode !=3D DA9062_PIN_GPI)
> +			return -ENOTSUPP;
> +		return regmap_update_bits(regmap, DA9062AA_CONFIG_K,
> +					  BIT(offset), BIT(offset));
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		gpio_mode =3D da9062_pctl_get_pin_mode(pctl, offset);
> +		if (gpio_mode < 0)
> +			return -EINVAL;
> +		else if (gpio_mode !=3D DA9062_PIN_GPO_OD)
> +			return -ENOTSUPP;
> +		return regmap_update_bits(regmap, DA9062AA_CONFIG_K,
> +					  BIT(offset), BIT(offset));

Apologies for the delay on reviewing. Just looking at the datasheet, how do=
 we
disable PULL_DOWN (for input) and PULL_UP (for output)? Should we not have =
a
'PIN_CONFIG_BIAS_DISABLE' case here to handle this?

> +	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +		return da9062_pctl_set_pin_mode(pctl, offset,
> +						DA9062_PIN_GPO_OD);
> +	case PIN_CONFIG_DRIVE_PUSH_PULL:
> +		return da9062_pctl_set_pin_mode(pctl, offset,
> +						DA9062_PIN_GPO_PP);
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
