Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E3B425B70
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Oct 2021 21:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233889AbhJGTYc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 15:24:32 -0400
Received: from mail-bn8nam08on2114.outbound.protection.outlook.com ([40.107.100.114]:26848
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233879AbhJGTYb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Oct 2021 15:24:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRvB1gFSEFzN13D44DpSF2tFhxj3XTDCUr/t5M+yJb3tQdGtEjsy8ZOoyzd1JogQkrdOAYq51qjdShaOkLWOoGVOZ9FxQCLiAUZR8png4qVcjTbzIf6SRDFgeU7coFbeJP1MDOwTuWLx4rMg3pUBDW2fBbAtvslb1WRlkVJYtFpMrHxz8uWmsxngMezU6pt3uVX/b+dF1c8iHZb8gaL6jup5SkgltNmLT10STp00zQ0WNqjYJMJH1lS8wUXftiPJ1YlswwvjJVbC7oA3JKQxa5Y6rkSJTO0nXnebxBdCP/XRDjiJ+8UzIHPS9TGRKhK4Fx4Y/fwPNF2Z6EI4fHa9Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvR+UwRbZhwMKLCXEMs/3Il7gmtVPA8mI0oSiYAaE8w=;
 b=iv5B8FPDOM0H44klcoOHpAIUo3O0jrM4KTVn04QoVFA0m3V5lfpaX7OeO467UHuyD2TZkZ7oc5In9eOd3YhSTesFUmqhR0G/O9ldZ+Q89t79QtG8lXjv/OGZIKXlpaCs/jIfA6XjyUCVr4oMV4CtN2TEhB7sUBXlEQWew9kgp8i/uhfPAqI8+5cBaE8UzKOMqAPe/c+H9KMPW87/kHdIrG9y5tsI3kE+UK9+2L+8denZ07qt09yRVvQ2E+XkUbuOMGGfYXrApp/Y6tTrz/BoLGMg31lEzkhhzZI8gPJiHuUXI15Z8GTCSH3/ISGY1Jii4ND/nVUWkXdT45csk43dlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=designlinxhs.com; dmarc=pass action=none
 header.from=designlinxhs.com; dkim=pass header.d=designlinxhs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=designlinxhs.onmicrosoft.com; s=selector2-designlinxhs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvR+UwRbZhwMKLCXEMs/3Il7gmtVPA8mI0oSiYAaE8w=;
 b=Qx/C1ObSagu1VzFhkM1008nRxWDOKXiyRuDyZWMJOEEUfLeyeAZwURuOZlQ7eacDuhbfPLXaWJ+ZlSQ/fXciiO+iR7ljd8iB+Mj+9ecR8ma3GMnV6qkqJLZAhS569ph+Y2oVISMqJroyZ93CIwhz9VvuSYs1GyeKeWWnsEk5pBQ=
Received: from BN8PR17MB3025.namprd17.prod.outlook.com (2603:10b6:408:5c::32)
 by BN8PR17MB2803.namprd17.prod.outlook.com (2603:10b6:408:5c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Thu, 7 Oct
 2021 19:22:35 +0000
Received: from BN8PR17MB3025.namprd17.prod.outlook.com
 ([fe80::d03b:d85e:8e27:f036]) by BN8PR17MB3025.namprd17.prod.outlook.com
 ([fe80::d03b:d85e:8e27:f036%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 19:22:34 +0000
From:   Kenneth Sloat <ksloat@designlinxhs.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Kenneth Sloat <ksloat@designlinxhs.com>
Subject: Re: GPIO Bulk Request Problem
Thread-Topic: GPIO Bulk Request Problem
Thread-Index: AQHXr8YwOhjB6pVEIUqxM4+6LWyHdauy9YMAgAAm5JCAFOMtgIAAAL+I
Date:   Thu, 7 Oct 2021 19:22:34 +0000
Message-ID: <BN8PR17MB3025943B2CD1FBF85DF53077A1B19@BN8PR17MB3025.namprd17.prod.outlook.com>
References: <BN8PR17MB3025D723599B15E5AFB208DAA1A29@BN8PR17MB3025.namprd17.prod.outlook.com>
 <CAMRc=Mewmbqo+y++j4iFEn36NMW3xL7AG9Vd+pLt6-PLE3cn0Q@mail.gmail.com>
 <BN8PR17MB302555D87D065ED3D19AB340A1A49@BN8PR17MB3025.namprd17.prod.outlook.com>
 <CAMRc=McBQiOjPdJpd3RFR-EirgKHGhR+ae9V22O8nJVreT8ROA@mail.gmail.com>
In-Reply-To: <CAMRc=McBQiOjPdJpd3RFR-EirgKHGhR+ae9V22O8nJVreT8ROA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 808ef9a2-0283-f01d-c50c-5d32526f4db1
authentication-results: bgdev.pl; dkim=none (message not signed)
 header.d=none;bgdev.pl; dmarc=none action=none header.from=designlinxhs.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c649f1f-3905-451e-8d27-08d989c7d104
x-ms-traffictypediagnostic: BN8PR17MB2803:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR17MB28039A6CD5DC45D5FD5889BAA1B19@BN8PR17MB2803.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WAmwFaKjnVe1X+eIHeJB+IwMmPNvAuJWLko9PWXcW8KjudPlahhMhtUgnhtZAdSsKjrWLFBVKpSVLnFBLXtCmH5tb4a9X4VZTOb8bUEWD55ZfRHGwHqXApq8ZGAY9xNxdVA0lCZQQVwkzTa1I9DM5BqS8U7aeP7IXoR7dZjSM++mzRLXmhk9cPB9JP7Q2c9th0zkgYCMFDqa++fqlA3DsJudq1NLLL/vyBdg6UUkLUTl1eh7LqA26m2o0INa0Q5x6OyS7NrHbRcD5el3OvIpkQf/FmhfINLUJs1rSaHLYjxF4+NFVcAw7dCZe4E0OGCU4jfhf2F4RNmj4akaRkO+j/gBNqhnckQqQMyvj9OdMR1Bz2SK/PJlaxTQy3CTSPngMY1avE+qDyFbUxk7WqiO67rx5VmPg8lVp6jLdOj5zMb8Wft4MIcHzByB67mgJSpmqWj6s3TbKbi6BLXopjfxdbW9lLqS1/pbURZWjW8FsvmUUf1SACjQNHUqAUS5xTp1fKyFiFjn4oVqPt4iGUI4qN43V9glLKx/OMsbohFvDgWn0VK1X8flWZ/wA0Z2nFzkHXDlBw7A99A2454dL0ED1Au6YkvscOyfSm7FJsmgRSPvalntUhB8z7ZhAgwHmel8LR1btzitaEgkW7kHnTEJlSMihtIADQNulgdGg7V4Di8Ej1tn+ZqPvjis4XJsx4GjybyD2dMPGd87oSFVWOUobw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR17MB3025.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(366004)(346002)(136003)(39830400003)(316002)(508600001)(8676002)(76116006)(83380400001)(107886003)(6916009)(38070700005)(4326008)(7696005)(53546011)(6506007)(54906003)(122000001)(26005)(3480700007)(5660300002)(38100700002)(66946007)(33656002)(64756008)(66556008)(66446008)(8936002)(71200400001)(55016002)(9686003)(66476007)(2906002)(52536014)(186003)(86362001)(91956017);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ui0mapaWCB5rD71d10ejrqNocSKILEDjZfoAe8+MuGuhLcIzZdFnof/mEg?=
 =?iso-8859-1?Q?VtWp6aa9tQ4+8Y9tRVUeRyUhzYeDkiIszh2Nww6uEX7uOVgNOpsbh/MyhR?=
 =?iso-8859-1?Q?3ueUhvo3LiX7U3P/W1jMBQwGLl8jbLyMX9Ens3cU7xneg1pNAxsHg8NgcR?=
 =?iso-8859-1?Q?+w3PCkHWTNhnnvnVAKFX1ha4tqfL1LEvW1c5oT+4h0iF74djtpLuKPuMt3?=
 =?iso-8859-1?Q?b/ucbd6VpUyEj0L6mupnYEXfMnQpHQOdIRAUZi4/z0W2TBUI3crsM+mvGc?=
 =?iso-8859-1?Q?cGkEN/POioympdy5SKDz7zQ2pdC9YdwNjeMwAgvNnwYmjz9uLuAx8MYv2Y?=
 =?iso-8859-1?Q?5tmZ/Y41mBfN4c6vrHbYZT8wjjGf/IdXwqMfFr97bFwFjEWLmlm0EDzUZd?=
 =?iso-8859-1?Q?lKSGt5oCGaMwKXzoCLgxIYoh9bDE7w5firDXO0deawclMLkLXbErT7besa?=
 =?iso-8859-1?Q?Exoy7aqQXV8CqeK6AfNJe5WlaS0Vv7cEKPuPJF0MD5nv8MQiK9YFUIsTDG?=
 =?iso-8859-1?Q?VGpkrSnZeR5KS6n9+8Z1fwjqoXFMTcrb9YIt+TvE8MB4yM4+dgrhpkNiF1?=
 =?iso-8859-1?Q?u6lnbtLddG1b6ah6CdxN+XZo0H3xJ4suWXypGgJW17VX3vVEo8UUyD4ir3?=
 =?iso-8859-1?Q?rDOezZHFr9lD/Auct7vKmqkDfa7UfLIsjtciVsjLKLX/HIjsLjHPs+aRbl?=
 =?iso-8859-1?Q?pidM7DCvX6wSiDoGbDvkIqcMGEtdQKvRIPycW7k8ObO/CJTWwEtuTrjUMX?=
 =?iso-8859-1?Q?kOQQawaCWLuzBIOcctQEQNhpIws+Y2MU58B6Fbt3PAY9fgO6ICJNDEzjwj?=
 =?iso-8859-1?Q?mu8iY9lWo6TVRWeCWp+zt+Rbv0K5fq6d5IJM1TiAftfs92YbrLlq0F5V0y?=
 =?iso-8859-1?Q?FjSVJDPdqVXjUgChBOMNK3D1aNR/qs/jtuwFuoNVMBnb9EfD3xa302oVfl?=
 =?iso-8859-1?Q?csoh4Dp986H+FqarpKe4nF3uUjSj8rBwhTEEhe+cuk5pIkKv8BdzYNonX1?=
 =?iso-8859-1?Q?dvgJdHE1IA7XVCnjQpiI+mEzF6YC/SA3S7gW7eWzyO1b4yv3ZJLjBHcPFc?=
 =?iso-8859-1?Q?BrRMilXwr/fLqHrryJ1xEyduVBpGULwxjlvn/MD2MvLkbFmuFMSOJiCdsX?=
 =?iso-8859-1?Q?I8bAAUvLL8Tr7yIfc3+gEIH1tiU3FikfsbHLVYLATtNCNvo0zjKXRwbTJW?=
 =?iso-8859-1?Q?uoIp8skKwWwpZOssLksKYYoJEwcDJmLbB7PlsxrQ6aVx+ZdUFSsUAMDtEq?=
 =?iso-8859-1?Q?OkMttdUjQb2GnBYs88KJdfNgmrgWHmOD4P3BucJV4AYNPSKJSBvtLOzvdQ?=
 =?iso-8859-1?Q?x+UhjubDD5qEZYy2+h2aFMgME6vlE4SuMf2oKpvI9IByeRQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: designlinxhs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR17MB3025.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c649f1f-3905-451e-8d27-08d989c7d104
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2021 19:22:34.5920
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 21db78a4-85a8-43a2-9030-593b170ddfa9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qc5hOq9PKGwdk4lsGS21skzh7zh3d/m9zrV4YJ+KXopmR+SSe5LnfAhu65rsj/aKcTxOcyBnOvCOKabwwcyYIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR17MB2803
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bart,=0A=
=0A=
On Fri, Sep 24, 2021 at 2:25 PM Kenneth Sloat <ksloat@designlinxhs.com> wro=
te:=0A=
>=0A=
> Hi Bart,=0A=
>=0A=
> On Wed, Sep 22, 2021 at 6:27 PM Kenneth Sloat <ksloat@designlinxhs.com> w=
rote:=0A=
> >>=0A=
> >> Hello,=0A=
> >>=0A=
> >> I am using libgpiod v1.4.1 and am having trouble using a bulk request =
of gpio lines as outputs from a chip. I am using the C++ bindings. I have c=
onfirmed that I can individually request lines and set them as expected. Ho=
wever, if I use the bulk request, while I get the expected number of lines =
(and defaulted value is set correctly), iterating through them (with array =
operator in this case) and trying to set the values is not working as expec=
ted. I find that for every index/position, line 0 is the one being toggled.=
=0A=
> >>=0A=
> >> A simple example is below:=0A=
> >>=0A=
> >>=A0=A0=A0=A0 gpiod::chip *mychip;=0A=
> >>=0A=
> >>=A0=A0=A0=A0 mychip =3D new gpiod::chip("1");=0A=
>=0A=
> > Why would you need to allocate it with new?=0A=
>=0A=
> It's just how I chose to throw the example together.=0A=
>=0A=
> >>=0A=
> >>=A0=A0=A0=A0 gpiod::line_bulk lines =3D mychip->get_all_lines();=0A=
> >>=A0=A0=A0=A0 lines.request({std::string("gpio-test"),=0A=
> >>=A0=A0=A0=A0=A0=A0=A0=A0 gpiod::line_request::DIRECTION_OUTPUT, 0});=0A=
> >>=0A=
> >>=A0=A0=A0=A0 for (unsigned int i =3D 0; i < lines.size(); i++) {=0A=
> >>=A0=A0=A0=A0=A0=A0=A0=A0 printf("Set line %d\n", i);=0A=
> >>=A0=A0=A0=A0=A0=A0=A0=A0 lines[i].set_value(1);=0A=
> >>=A0=A0=A0=A0=A0=A0=A0=A0 usleep(1000 * 1000);=0A=
> >>=A0=A0=A0=A0=A0=A0=A0=A0 printf("Clear line %d\n", i);=0A=
> >>=A0=A0=A0=A0=A0=A0=A0=A0 lines[i].set_value(0);=0A=
> >>=A0=A0=A0=A0=A0=A0=A0=A0 usleep(1000 * 1000);=0A=
> >>=A0=A0=A0=A0=A0=A0=A0=A0 printf("\n");=0A=
> >>=A0=A0=A0=A0 }=0A=
> >>=0A=
> >>=A0=A0=A0=A0 return 0;=0A=
> >>=0A=
> >> Not sure if this is a usage problem on my part or an actual issue.=0A=
> >>=0A=
>=0A=
> > I'll see if I can confirm the behavior here but it looks like a bug ind=
eed.=0A=
>=0A=
> > Bart=0A=
>=0A=
> Thanks Bart. If you use individual requests to the GPIOs as outputs first=
, use can still use the index operator (or iterator) on a line_bulk object =
to individually set the LEDs. It doesn't work when you only use the request=
 through this object though:=0A=
>=A0=A0=A0=A0 gpiod::line_bulk lines =3D mychip->get_all_lines();=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0 lines.request(......=0A=
>=0A=
> > Thanks=0A=
> >=0A=
> > Sincerely,=0A=
> > Ken Sloat=0A=
>=0A=
> Thanks=0A=
>=0A=
> Sincerely,=0A=
> Ken Sloat=0A=
=0A=
> So I took a look at this and unfortunately you hit one of the major=0A=
issues with libgpiod v1 and something that will be thoroughly=0A=
addressed in v2. When you make a bulk request, all the lines share a=0A=
single file descriptor. That means that any ioctl() operates on sets=0A=
of lines rather than single lines. The only fix for that would be to=0A=
force requesting every line on its own. Unfortunately the only "fix"=0A=
to your problem is to always use the bulk object. Otherwise the single=0A=
line cannot know it's being used separately.=0A=
=0A=
> In v2 we're addressing it by associating a request explicitly with a=0A=
set of lines (can be a single line) and never allowing this kind of=0A=
situation.=0A=
=0A=
> Sorry for the inconvenience - I didn't know any better at the time.=0A=
=0A=
> Bart=0A=
=0A=
No problem, and I already worked around it using other methods, but I appre=
ciate you following up with me on the matter and I'll keep this in mind in =
the future.=0A=
=0A=
Sincerely,=0A=
Ken Sloat=
