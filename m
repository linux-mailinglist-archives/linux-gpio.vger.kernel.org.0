Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4104557F5
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 10:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245132AbhKRJ2L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 04:28:11 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:53732 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241323AbhKRJ2D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 04:28:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1637227505; x=1668763505;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SEz0D6GNUUANFmpPTXvZohjaE+Jaa5BvUScI0lJrz5E=;
  b=PC6Z5OZN9zIecg+fzvWrbHM2cSX56YLf0DvTSO5U3Apu4Ip6pE4+U5TD
   xQ9Gzzkp+409tMmy6ctkInipyN/QZ3RUOD//62THoFnQoUsbjIHANbbBX
   8bimWJVMcEBbAQzp9ACU9jLgRXqalN6iiQc+ieLYaGl3u/INGGVP74Sp3
   LjehRWk1YjK+pyp4n7NjFwf92sHT4921hzN94Y6wdl62cI0I3sk7R7Dc9
   YCL6GjWtGg8+z2KK/Cj9gLi2/KtDhU80b+NfljufIR3njgmQh+m9/vPWB
   q3yR9ltqyhw5Bhkm6i7ujNSHMZ19VU6hjR4LdhVA9hu+25VvVkB21vYki
   A==;
IronPort-SDR: opMqoeZfNsblpir69mVlzCITJXhbIToOwhUJc5tLH3GLetFzMbTkP4I6dYGolHXdcFLqOylJVC
 20vEmaAucDuC/4dqgJ+YRwHdRhwCwOCjNHJSF1QwQ7MYC14lqFwZ6qAaHbq/flxRtW5NPGsAUo
 BAE/yVoWmTCegFSyNfIMQiaUps1/+9T2VFrkC1VWhPhkE6+asr6yW1/qOE9j/IZBHiN+MpjjL2
 9aU/7CqTJlC33sg+oVACSk71tRuBzJNAQn5ZSpYDKtibSFvmAYnjtFB9NuvQLwwIoNy3KeRGGG
 jECaOD7iWeV2PmiI8Z1+o1Vu
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; 
   d="scan'208";a="143782714"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Nov 2021 02:25:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 18 Nov 2021 02:25:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Thu, 18 Nov 2021 02:25:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCB2+bpvKaBkPBpSdTWfUL4UNggKjIXKCp6C+2QtWh1Q1WFB0qM2OW8OhUzrMypGlUL3SDfU0KzACs579Ly/OL9iH4HZu87bRKkkKgZs2+mArBECgXN5pk++A6m789kd3f7/MZl22xJyWtg7tKATpJ3h1u0j7sOmbV1NqV+zN4DjeBMJa79xjwOlnRXfqFwKKxzvlUw/cy14lt1z/9YetwX7gDymEKvdJN0qxc74acHpSf7pQtqMsGcG36/5aHo4nNZQjcASezfkATQpg5QJe3dQ2TiMj94QHVLERK0Z0PcOPBMUmZrGqSiXBNgr/7bgA/QyjrBuyZgExCsBVROUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0Bj2jkJY/E6RY5DK4l/2qU2cmEUJ48JBKekQYgaD5s=;
 b=RkGZuHZ6Yv6J2Cmet2YLwYI26pPYm4huMzaPkTrBwkeu/CJBIqA4F47B7QxNJScGDg0pW1DUmO2Xfmf2Fu6bX4dplBprh37ACPF+A5lY0kONxzmOfLG2ejhqDNjKhWoFctykUUkFNA/CRe3B7TiKOemoah9p385t4lx1DCm7kVVOGSnAypbGxoSU6awKLJ2KrZOchUF1T/JaSRaGQoHEjAroGc0kW3gat8Wg44EYhKFpMc+3XY28Peg6lLtXx/qDEggdEbcMPEiUxAZDP16UqqyyklissfUTeUbl9cpkQbt1kLJCqHH/gfruOsVm3vmV9m1NT4qhm8nzwdk3uSEeJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0Bj2jkJY/E6RY5DK4l/2qU2cmEUJ48JBKekQYgaD5s=;
 b=ufEnCe3BMiGkdwSAU2cgWnc+51rRiTVrHqoBPI3fKtLmidMlcivxIN88ZJpzPthG/9pAKnKFDIjTaq9NKenPJXjQEWpS2XnWDpmcgjIHpGYT3CDx2csGhpYqstrbL+ArHQgqlRoqCAQojlLZa21rgZSdir3kaG67DCBkNEYX01A=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by MWHPR1101MB2270.namprd11.prod.outlook.com (2603:10b6:301:54::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 09:24:57 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::9c2c:29bd:3533:c0b6]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::9c2c:29bd:3533:c0b6%4]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 09:24:56 +0000
From:   <Kavyasree.Kotagiri@microchip.com>
To:     <alexandre.belloni@bootlin.com>
CC:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <UNGLinuxDriver@microchip.com>
Subject: RE: [PATCH 2/2] pinctrl: ocelot: Extend support for lan966x
Thread-Topic: [PATCH 2/2] pinctrl: ocelot: Extend support for lan966x
Thread-Index: AQHXzKcz9pmEjYRVvUStfjUEildoSawIdFiAgACrgjA=
Date:   Thu, 18 Nov 2021 09:24:56 +0000
Message-ID: <CO1PR11MB4865BC4DCB3C0E542EF2D7EA929B9@CO1PR11MB4865.namprd11.prod.outlook.com>
References: <20211029092703.18886-1-kavyasree.kotagiri@microchip.com>
 <20211029092703.18886-3-kavyasree.kotagiri@microchip.com>
 <YZWJZzCuzXTVzIJ+@piout.net>
In-Reply-To: <YZWJZzCuzXTVzIJ+@piout.net>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 000f70be-a703-4827-fc71-08d9aa754917
x-ms-traffictypediagnostic: MWHPR1101MB2270:
x-microsoft-antispam-prvs: <MWHPR1101MB22702F45620A8BC4500DF7F5929B9@MWHPR1101MB2270.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rcxKxEaPEwnkbrl+LF1osOj8ObMiknRvArT5maYOm7Bz/hkw3X/jzt1fx8nATWCQ8pm4Ks+h65PZNNxr3leNO7ta4XOXwXlNmtXJFhMIbH9H84LHZvF7rU+7rA7fHK/Wh93ulDJTscy2j5NFjRobsU/W6j17Xg+vTXx55nzMOMMWWOeyaY5v9z1M9Kc7HNH2kLyuAIS8mYVOvABeKu1ayL+M+Q8UFdSgZFYHLBftUgjLFwV7J4X8rd3xez/pAkvw0Xmz6r8pP8auYtNUZhwQsH0nabQL3cPdvFiqG+7voNS9YZYLxQwSN0PK0OUD8+qRD4oi29G4M9VtHOCoNSr4HbKtxP+v9LGzXyN5VfbT5b+TCr43xMtrgFqhjcjtJO2Hhsm8CmK4Z9hn56AvVADpcE4snpcDYFSHt8iaOl7tNjEbsyjpaCFlQkHborfui+FL02+coW1lECVhv5kIMAyhCSmBPVNRVh7LM+zp9CGQm5YMyKMINJsORacYS4UTBnaPizIzmIVWguHCuf1clP+6QGiWgIWNp0GdiLWhHc1M3/H5L8lGMcN+Lo5M2mWeL/1bG2ZF6VE6KA/Bp+9kjce1I7KgoNbUVh/pNXyu7C8Ays3jTkLGzCeVxyx0ccGADoYakvkPI7l5zCB3zUv19zXv3XzcqJqBscNju1m94E4dxh0Iw0i1/IahjIue5s8Kav4MG0Yl44/kdsEvFQVtZHk0ACMWLiTUnd0oogHQwxo4go8/UEGWm9Jh0RAlkvQrF07L4ozB/fO/nneUOjIaq7+/W1+MYpwrqXF+hqnIU8oBnqo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4865.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(64756008)(2906002)(26005)(6916009)(316002)(122000001)(66476007)(71200400001)(4326008)(38070700005)(6506007)(7696005)(8936002)(107886003)(53546011)(54906003)(5660300002)(55016002)(66556008)(66446008)(38100700002)(508600001)(9686003)(52536014)(8676002)(83380400001)(966005)(66946007)(186003)(76116006)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8FDKDNKkPed055qPRzDMKWglccwrh1vqHUX4fiDqmSzZGRx/BCtNmPqXIIbL?=
 =?us-ascii?Q?Nub3+Di3KIl7KRFIJk6LDSOBVg6YwVM8mg6oiZX0kKNnhupQTqMeCbN2wmCo?=
 =?us-ascii?Q?iNjd3JUSrER5MiqWP7mk7KqCMp5mg2X75mHiJI0tMNbA6V4/MnmmAJHdhqEv?=
 =?us-ascii?Q?JnFgMno7L3tVuhsfh7H1h/WJIknUbvt9qRqITs7/e8L2UScNYbXP5xsjHnqk?=
 =?us-ascii?Q?lGXFH4ajAVYXa6uGYjvoQlTZMofZnAVLdINeAXFKTg1KLBG6ahn91JKKAhQX?=
 =?us-ascii?Q?/M16BTWIl0djVW+JmqcIae8HmPWuZKMimqEYxmfPpOOoKYYlvzQnEiAwAmrV?=
 =?us-ascii?Q?b2NvVKyZ1JSdJ54VwQ7HHMzkyOBXcs0jhTaxfVuoXQGlvXQEFV5Eoa15TRxB?=
 =?us-ascii?Q?4+SRlFEVYop5tqgSPIzCmHytXfwWmolDL0FPfALSAPYiByuBaz19gBda2K8w?=
 =?us-ascii?Q?CNo+58JMVbUHoQ8DCwctuygQG/BFV98tPxhrxZqej1rvXa/IDMGGyw2aanKc?=
 =?us-ascii?Q?zlVA9r01BnAqQOF78nEIJknvrcl+ibO/1GIXrvHUHLJrblsKzdf6RT7zOMvn?=
 =?us-ascii?Q?qR3YEQZxP1kOWAwbZcTM8MFoHKs2u3fJkR7S4w1dNGFAnAZYIGfD3k2h3Tuc?=
 =?us-ascii?Q?VIjEuE/Phbj0melswP1mi71CIy1zs3JKDhOO39lk30YbyUreqZZ2363kp6/H?=
 =?us-ascii?Q?GSMdM7JD5TCruaH2B8PymfVtnqp+b+snZ8BhdOUqwtm1Omy6HW3Nm+rYCxwe?=
 =?us-ascii?Q?hxK/Q4MswDXBjsfa55Is9VakqcU3tAtjVV5nz8dtltHEwYshTDVNTKK5RKbR?=
 =?us-ascii?Q?CfpBcrZDV6yEAzpiRyK5u179gplg+t5EXa/OWK0JLHuIvHCQFsphRfHy2pbw?=
 =?us-ascii?Q?5chnn586RQAiOnh8ES36nVyst8YcmkY9Nt1CQ84T7VNpZ91FU4I4s08RrL2x?=
 =?us-ascii?Q?hhpFlqNQIsUeFMT+Zw6sD764P1HGzXmdaPPkyewm7gjG1Yo+q8sidmHAwhYx?=
 =?us-ascii?Q?dqGtNR+HLKWwaJ9dYaaM2/ta/JFMh+s4vhrJEI6UWoEylFQ5GJCZzZHuOOLB?=
 =?us-ascii?Q?qameGOxYkkB37KG9y3KQh59yg6sZLKhLU29yrMHik7+qxozdCveTWgk+IIH/?=
 =?us-ascii?Q?KN1jtrJLhpCRTgqY/FscPib6LqDO3TKtLqArZMOGINvMU+Z7jcIa0pRnB2vZ?=
 =?us-ascii?Q?yOMdWM4ACkhfmdOeJ2ncEC/NmOmC4D6fXabsBPnxatLSRxkZ6Fg6r+dKhgc1?=
 =?us-ascii?Q?8CG50mdJqZso6ZKwhw+wXecLHTR/0ptt0kzhOTupvc4bgSqyzyFGn9pFggoG?=
 =?us-ascii?Q?yGOEcZ1a6JxgOq886ZXnlBU9/gbS1O0ixumLDNSJ8lhFPb+jVrLf5LkP3P55?=
 =?us-ascii?Q?CTn2gofzhBt64/ycTP5Jig4EQRhqIkSckPOZ74W2eexiGPHG38wG4dyf7l5F?=
 =?us-ascii?Q?L839fkwBg6CG9ZnQEYf1LUcPT9XKC23CrRfpCjs+WqfzVG3pyTbDIQYwK5lq?=
 =?us-ascii?Q?90BySyuVXzo5jD+mtOVati1AsLgRreuVlIX7LV3rAY7Y7zALyAdtNxpKo4ys?=
 =?us-ascii?Q?VIK8BfFcThAC45kLHDHYGHp5zryZ9XFO7q1lL8mxJGS9E4rfgK4piq4pGCQH?=
 =?us-ascii?Q?urO+9b3wa3XftpmadQjkwg+oYA3c2cQd9w2yIib8m0OdUN5V4L0mp4YcpAJI?=
 =?us-ascii?Q?l4ErF6l0wWEcXwZHAekODiqbKZZ3IP48zkPR9GgjasNJLQMe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000f70be-a703-4827-fc71-08d9aa754917
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 09:24:56.2505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 05gF+xhAcbBSA+pAkAqWMOqEygWqwBkhNRgGbchNWq7btjgva7GhEa9OvW91SaLBdXP5vBlR4f5L3Up8J9zvJ/NMFiogtU6/y1oU7IqFHXq9qhbWmI6HDcBUN0qbB9tq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2270
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> -----Original Message-----
> From: Alexandre Belloni [mailto:alexandre.belloni@bootlin.com]
> Sent: Thursday, November 18, 2021 4:30 AM
> To: Kavyasree Kotagiri - I30978 <Kavyasree.Kotagiri@microchip.com>
> Cc: robh+dt@kernel.org; linus.walleij@linaro.org; linux-
> gpio@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; UNGLinuxDriver <UNGLinuxDriver@microchip.com>
> Subject: Re: [PATCH 2/2] pinctrl: ocelot: Extend support for lan966x
>=20
> EXTERNAL EMAIL: Do not click links or open attachments unless you know th=
e
> content is safe
>=20
> Hello Kavya,
>=20
> On 29/10/2021 14:57:03+0530, Kavyasree Kotagiri wrote:
> > +     LAN966X_PIN(76),
> > +     LAN966X_PIN(77),
> > +};
> > +
> > +
>=20
> One blank line should be removed
>=20
This is older patch series. Blank lines are already fixed in v3 patch serie=
s.

> >  static int ocelot_get_functions_count(struct pinctrl_dev *pctldev)
> >  {
> >       return ARRAY_SIZE(ocelot_function_names);
> > @@ -709,6 +1056,9 @@ static int ocelot_pin_function_idx(struct
> ocelot_pinctrl *info,
> >       for (i =3D 0; i < OCELOT_FUNC_PER_PIN; i++) {
> >               if (function =3D=3D p->functions[i])
> >                       return i;
> > +
> > +             if (function =3D=3D p->a_functions[i])
> > +                     return i + OCELOT_FUNC_PER_PIN;
> >       }
> >
> >       return -1;
> > @@ -744,6 +1094,36 @@ static int ocelot_pinmux_set_mux(struct
> pinctrl_dev *pctldev,
> >       return 0;
> >  }
> >
> > +static int lan966x_pinmux_set_mux(struct pinctrl_dev *pctldev,
> > +                               unsigned int selector, unsigned int gro=
up)
> > +{
> > +     struct ocelot_pinctrl *info =3D pinctrl_dev_get_drvdata(pctldev);
> > +     struct ocelot_pin_caps *pin =3D info->desc->pins[group].drv_data;
> > +     unsigned int p =3D pin->pin % 32;
> > +     int f;
> > +
> > +     f =3D ocelot_pin_function_idx(info, group, selector);
> > +     if (f < 0)
> > +             return -EINVAL;
> > +
> > +     /*
> > +      * f is encoded on three bits.
> > +      * bit 0 of f goes in BIT(pin) of ALT[0], bit 1 of f goes in BIT(=
pin) of
> > +      * ALT[1], bit 2 of f goes in BIT(pin) of ALT[2]
> > +      * This is racy because both registers can't be updated at the sa=
me time
>=20
> That's three registers, not two so I guess this sentence should be
> reworked.
>=20
I agree. I will change it.

> > +      * but it doesn't matter much for now.
> > +      * Note: ALT0/ALT1/ALT2 are organized specially for 78 gpio targe=
ts
> > +      */
> > +     regmap_update_bits(info->map, REG_ALT(0, info, pin->pin),
> > +                        BIT(p), f << p);
> > +     regmap_update_bits(info->map, REG_ALT(1, info, pin->pin),
> > +                        BIT(p), (f >> 1) << p);
> > +     regmap_update_bits(info->map, REG_ALT(2, info, pin->pin),
> > +                        BIT(p), (f >> 2) << p);
> > +
>=20
> I would have thought the hardware would be fixed because you now have 78
> pins and this probably will get worse over time. This is really a poor
> choice of interface as now you will get two transient states instead of
> one.
>=20
Sorry, I couldn't get you. please elaborate what you meant by this comment?

> > +     return 0;
> > +}
> > +
> >  #define REG(r, info, p) ((r) * (info)->stride + (4 * ((p) / 32)))
> >
> >  static int ocelot_gpio_set_direction(struct pinctrl_dev *pctldev,
> > @@ -774,6 +1154,23 @@ static int ocelot_gpio_request_enable(struct
> pinctrl_dev *pctldev,
> >       return 0;
> >  }
> >
> > +static int lan966x_gpio_request_enable(struct pinctrl_dev *pctldev,
> > +                                    struct pinctrl_gpio_range *range,
> > +                                    unsigned int offset)
> > +{
> > +     struct ocelot_pinctrl *info =3D pinctrl_dev_get_drvdata(pctldev);
> > +     unsigned int p =3D offset % 32;
> > +
> > +     regmap_update_bits(info->map, REG_ALT(0, info, offset),
> > +                        BIT(p), 0);
> > +     regmap_update_bits(info->map, REG_ALT(1, info, offset),
> > +                        BIT(p), 0);
> > +     regmap_update_bits(info->map, REG_ALT(2, info, offset),
> > +                        BIT(p), 0);
> > +
> > +     return 0;
> > +}
> > +
> >  static const struct pinmux_ops ocelot_pmx_ops =3D {
> >       .get_functions_count =3D ocelot_get_functions_count,
> >       .get_function_name =3D ocelot_get_function_name,
> > @@ -783,6 +1180,15 @@ static const struct pinmux_ops ocelot_pmx_ops =3D
> {
> >       .gpio_request_enable =3D ocelot_gpio_request_enable,
> >  };
> >
> > +static const struct pinmux_ops lan966x_pmx_ops =3D {
> > +     .get_functions_count =3D ocelot_get_functions_count,
> > +     .get_function_name =3D ocelot_get_function_name,
> > +     .get_function_groups =3D ocelot_get_function_groups,
> > +     .set_mux =3D lan966x_pinmux_set_mux,
> > +     .gpio_set_direction =3D ocelot_gpio_set_direction,
> > +     .gpio_request_enable =3D lan966x_gpio_request_enable,
> > +};
> > +
> >  static int ocelot_pctl_get_groups_count(struct pinctrl_dev *pctldev)
> >  {
> >       struct ocelot_pinctrl *info =3D pinctrl_dev_get_drvdata(pctldev);
> > @@ -1074,6 +1480,14 @@ static struct pinctrl_desc sparx5_desc =3D {
> >       .npins =3D ARRAY_SIZE(sparx5_pins),
> >       .pctlops =3D &ocelot_pctl_ops,
> >       .pmxops =3D &ocelot_pmx_ops,
> > +};
> > +
> > +static struct pinctrl_desc lan966x_desc =3D {
> > +     .name =3D "lan966x-pinctrl",
> > +     .pins =3D lan966x_pins,
> > +     .npins =3D ARRAY_SIZE(lan966x_pins),
> > +     .pctlops =3D &ocelot_pctl_ops,
> > +     .pmxops =3D &lan966x_pmx_ops,
> >       .confops =3D &ocelot_confops,
> >       .owner =3D THIS_MODULE,
> >  };
> > @@ -1114,6 +1528,7 @@ static int ocelot_create_group_func_map(struct
> device *dev,
> >       return 0;
> >  }
> >
> > +
>=20
> Useless blank line
>=20
Already fixed in v3 patch series.

> >  static int ocelot_pinctrl_register(struct platform_device *pdev,
> >                                  struct ocelot_pinctrl *info)
> >  {
> > @@ -1337,6 +1752,7 @@ static const struct of_device_id
> ocelot_pinctrl_of_match[] =3D {
> >       { .compatible =3D "mscc,ocelot-pinctrl", .data =3D &ocelot_desc }=
,
> >       { .compatible =3D "mscc,jaguar2-pinctrl", .data =3D &jaguar2_desc=
 },
> >       { .compatible =3D "microchip,sparx5-pinctrl", .data =3D &sparx5_d=
esc },
> > +     { .compatible =3D "microchip,lan966x-pinctrl", .data =3D &lan966x=
_desc },
> >       {},
> >  };
> >
> > --
> > 2.17.1
> >
>=20
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
