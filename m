Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA6674428C
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 20:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjF3SyW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 14:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231508AbjF3SyI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 14:54:08 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DFA3C18
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 11:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amFxkP6Lytch8jUUD8W4SXUCpHQ+B1TXjFxx4TMv+ysIUZxrWoaYh9K2ISP1TrOY//09H07Un2TLfjEbOd1n89L34O6axnC5Ujn9iFGmhLicpYHLqJes1Mdo8dfn0XP+L80WuM3tXo1BJpznWM8QOy5m4j1WlWbPW5452JoG9SXbHQnD9yJdtEnz4xL80B2B2qDP/fjkx9GlYgCykoqjlQxOPIMRWmaEwNRx7SiNwKsyYNnEy+C9v0EZ1mJDg7htd3LMziyU2PpZAFc4O93aRY35hGfnlPTxRuD/q4/tK7jaZq32LSrQ/qbnDht9FwBuFbbfT+qlNOc6iMw/eo2UUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBF2pMBRwZHsmXmqWb6m3tNqs7I1Fa3KB6PlTqwfZqk=;
 b=HJkJc4yjGDg+8CZJ/SX5r4MLMB+N3saqsmxugFXk43o+eqX6gtTmHyA9tKUNmzwy54VoIK8E1qe2Lg3OQoQfdftBsAPVKbWIGHlgO3xznTsBtvGAMCSw6LZROwD9+zfalHhg9+JtDzfPjQnPmM14NHxtQMHzE7mGg6eoIzFPOSSNIQpMorTXYQeILKiTl5SN5wiNKdPGxfxdCBo4L4ToLtk1iw3hEBFa8fWYsigGyZdiy1ltr9+DA2rxtDUG9j2zSiP6xAwgO40KBU85PSTNZO6zvhKf8I+iPoKbUdRqf0+GweMB6f+WEkhvLsYyq5jA+KikLJyacuQx2gDZpjimdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBF2pMBRwZHsmXmqWb6m3tNqs7I1Fa3KB6PlTqwfZqk=;
 b=eaMj81d+6hNYtr+aKIITvONizDY2gEQh+4raVioVRp3fe3IX36erUbjBDL3drV4rDXaG22vBX+RbT5Ail0Q38GOek++cMVhSERuscT2JsGXQF7GiuckV6erIshDfvB5XnBK8orpmVP6xxQFqucGb2EKIw6N2LaPbBSMBnMRwZdg=
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM9PR04MB8713.eurprd04.prod.outlook.com (2603:10a6:20b:43c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 18:54:04 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::67c5:d818:6a60:7e38]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::67c5:d818:6a60:7e38%7]) with mapi id 15.20.6521.024; Fri, 30 Jun 2023
 18:54:03 +0000
From:   Shenwei Wang <shenwei.wang@nxp.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [EXT] Re: [PATCH] gpio: mxc: add runtime pm support
Thread-Topic: [EXT] Re: [PATCH] gpio: mxc: add runtime pm support
Thread-Index: AQHZqr6o8MWwjoMSpUSTvlVF1XuiyK+jEnGAgAB5K0CAAA+XgIAAFYSA
Date:   Fri, 30 Jun 2023 18:54:03 +0000
Message-ID: <PAXPR04MB9185A007E03A4E33F6B3B7D8892AA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20230629191903.2423243-1-shenwei.wang@nxp.com>
 <CAHp75Vc5JFrh1HqYQca9BcYALQfVD6A-kHgmc5OpwtvcGC4beA@mail.gmail.com>
 <PAXPR04MB91851FA4382AA267E3C1849A892AA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <ZJ8Q12drayWSyLNE@smile.fi.intel.com>
In-Reply-To: <ZJ8Q12drayWSyLNE@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AM9PR04MB8713:EE_
x-ms-office365-filtering-correlation-id: 56e5d78d-b652-4b7e-656e-08db799b5fba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kUOmaQkg7Yi17ZV0lwTOTpyCJQ+PaqhrdUI5Y+SsL7TD6456n0CMSDoXYJFRk7MnPtYi7N73qzaSYPXHTu+WQXxRItFSymAx/UcDy0fNBPTZTRLfxCf4/GKVFgcuOC/aQJVgqmLfDffK/pCJUIxJargEd03P5YvegD/R3CLHD1HeX/8YfYO5zu1gn/Z1CFmvDsxTxGAKjTboPUwgv2oCsBcGkRpqs3/Q8VB7AEzHLq59ceaxCCHbiQ79hmiQ6PzP3tOdXEqrjLMUAaHQZ40pnGqwP+P81h/Zy42X5n2OFNd7i1sT9cfoXBxWAFucoGBwgbFw9zBop9nrWHi2jJDTsnsvyj1TQ34GP+LhQL80V3TxAfbO+ZWL5XywM/EULEN+vA0DUbzPxTe24ojlDepGhQs0UynZxKs3sGjarm9n8Ovuf071MlYrZg1CjoiOkrNeIcvzBDMN6TRWFHjgTDYBLEx1DQMeGA71EZkO7ZS/5hXSU2/XMD+xSwW5BAlQ1WHnRf6NBAM7fOCgis7RDdcusaoNN7VRIu4GUWtbNDMi5ayoB7nx0bPHtl1HpCCoh6bqW23oUrVk2zwhinxZBdGcjBfyFPnn7Her244xGf+8A0sn+4AQ/vYBzttjwyCKSvDb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199021)(54906003)(4326008)(71200400001)(8676002)(8936002)(5660300002)(478600001)(6916009)(66946007)(7696005)(64756008)(76116006)(66476007)(66556008)(66446008)(316002)(41300700001)(38100700002)(122000001)(55016003)(186003)(53546011)(52536014)(6506007)(26005)(44832011)(9686003)(86362001)(83380400001)(38070700005)(2906002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fMh08QCmw3Dec+xs9LtSmR6jNT7dv/CMtPCAJHjlBBxI/VH9BI/uWElTHbLT?=
 =?us-ascii?Q?8ef7kCKaf1MGX7Pc9uBkhRQKSbBuxiABKOzTaFuFy13sHhha9BMPT646O+1Y?=
 =?us-ascii?Q?79FHV9tH5pBzdT/mywBmrDscGlxdvpPk5iy6BezECK+MPhhJg+2CNcAoLBoh?=
 =?us-ascii?Q?opJ84N7Rli4dik2B8H65hx0r+qSG6cRoxRpOHDj8ZR74yNeK2Hc6Q9cSc85R?=
 =?us-ascii?Q?J6e8QO4ioU38T0fAJDrUyjUx6IJLqgZgtpyJtqfSToX4o2q4lg2z3eAlYtz4?=
 =?us-ascii?Q?JoOB47iWBWEKwoDVdeVynfd/JBbxS4IO6HBYEo1sJYjKHgfp+QT33giW8Z0W?=
 =?us-ascii?Q?XqtbMUXhaRlSnwehpB9rXbps2VaTpiQgiLUrif9APzHj9QrC7ZV+ExC0g4/E?=
 =?us-ascii?Q?C4i0zBdQov9vLOHUs4pbb+LXnMuIKIcLyRTWDpdiSDFZFshtj4p3HlaDreGw?=
 =?us-ascii?Q?Cl5WdCE0cwIdQC65Us9hsuWGvZNGjFPrlQZzrWCIFw8b5ckk44r84HmG7KEp?=
 =?us-ascii?Q?VAFntDSdxofjbhGx5rSuFvH/Sv17smuzPPHKtVcPMYpgT3GJEF1oR3H5heet?=
 =?us-ascii?Q?lPNnfxQ76n63yJ0xSlA+bPp+Ue8mpz0iFz/qDSOztavWMMiJZiIVU+wjF9nI?=
 =?us-ascii?Q?zZhNxB6lhQlqHjz7489mL3IF/HVEvW/zosPM/VF/YBGHgtiCoUIRy5Y6BLyV?=
 =?us-ascii?Q?6NAWhSbpfZ/ylfkOwhRS6OcIZPapMLfPXIQ1JBGYC6NH7oGamf9KSK9oRj9P?=
 =?us-ascii?Q?rCDh+WamXbC1O+WPTPs3aBIBLE197IyBpFZVLBgx71ncAHEctw0KnQwyu9Zs?=
 =?us-ascii?Q?IIEit2j3vUM9bRDeXptD19VPxsYWfrHGRZ/8L1hfUtpGoyrb5Z/Aa7aK8GRe?=
 =?us-ascii?Q?Ydr7tB+WXmmm+r4TW2wgDCDAA0m1JfQD16X+DlDOa3T8AvhINWUNO04eWiTE?=
 =?us-ascii?Q?7BC8zQc4jagqZoln3R+66aTVW3SPihdC5lHi8ZX4xcDfoqXnhiaS4WK7z0vT?=
 =?us-ascii?Q?UAF8vpUl+pNBAHm3eUIvxFFG7oXXfnQAicFUxlfPL/2NcBSj+7Y4hnDQA9qB?=
 =?us-ascii?Q?ZktSYv7bFewV03eF8AJaFT+0rX2Wd0Nb4TjtIFWp80dCpXCYyrj62Kp1F4zd?=
 =?us-ascii?Q?qA/DJLf8Okn2RRC4XB6r6kEvWdE1qZPPh7gcQ5Cvuwoav9UEdXZtotsk2d6b?=
 =?us-ascii?Q?utL9CUwNpWdfLBy+H2XEf2M1KkDOw7uAnRGgeuUWAC1+ETRXKbeOXOnxnCRU?=
 =?us-ascii?Q?AyxBiH9ppjBE1BY+UKx6aTS2MqehD5a+o91ilXKyJ5Zm6HtIPRjsvLbW6dts?=
 =?us-ascii?Q?ojFbB2kcu1vZy4XafMLzQgfKvO11M0O46cDaKXLVSvdoOSthR+Iurn91n84N?=
 =?us-ascii?Q?GIQ3b7E/991YdJ0/Rnm2ZsclhNzwt2oXLfSwBrHfozrn2MH/n3TFpV2AKpZf?=
 =?us-ascii?Q?nRZiES9Qcq5BYt4x/9j+sFx7b40MkWqUCpNyXQq8bb112NzDS6XT3rY0jZF9?=
 =?us-ascii?Q?czYPKNNwwJmRQUVCLm/Dk0L3h13dVyxg1Oll7w+reVyoCRRZAUDLRQtHWiS+?=
 =?us-ascii?Q?fWjODVsx4r53n5Eyup4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e5d78d-b652-4b7e-656e-08db799b5fba
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2023 18:54:03.5611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G8MtaCnRcitcq3Ho/2N/Jf7l5iDjkJHZ9ZLzqmcUPRHado2/4aiD+kyxCwDWgftAHKmohZFFiNx4mK+z1gyxog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8713
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



> -----Original Message-----
> From: Andy Shevchenko <andy.shevchenko@gmail.com>
> Sent: Friday, June 30, 2023 12:29 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>; Bartosz Golaszewski
> <brgl@bgdev.pl>; linux-gpio@vger.kernel.org; imx@lists.linux.dev; dl-linu=
x-imx
> <linux-imx@nxp.com>
> Subject: Re: [EXT] Re: [PATCH] gpio: mxc: add runtime pm support
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> On Fri, Jun 30, 2023 at 05:01:10PM +0000, Shenwei Wang wrote:
> > > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > Sent: Friday, June 30, 2023 4:19 AM
>=20
> ...
>=20
> > > > +       ret =3D pm_runtime_get_sync(chip->parent);
> > >
> > > reference count disbalance here.
> >
> > Seems we shouldn't check the return value here and simply return 0.
> > Or should it be changed to " pm_runtime_resume_and_get" ?
>=20
> It depends. I don't know the goal and what the case will be if PM fails a=
nd you
> still go with that.
>=20
> > > > +       return ret < 0 ? ret : 0;
>=20
> ...
>=20
> > > But here is the question: does your controller support wake from IRQ?
> > >
> > > Have you tried to see if the lines that are used for IRQ with
> > > gpiod_to_irq() really work with this?
> >
> > Yes, the controller supports wake from IRQ. This patch has been
> > Verified with the SDCARD plug-in/out use case which use a GPIO line as =
CD PIN.
>=20
> Yes, but in that case it has been probably requested. What I'm telling is=
 when the
> GPIO IRQ is went via IRQ chip and hence never been requested by GPIO.
>=20

Just did a quick testing, and it still works even without requesting the GP=
IO line.
This is because we have specified the gpio controller as the pm_dev for the=
 irq_chip in=20
the probe function.

+	irq_domain_set_pm_device(port->domain, &pdev->dev);
+

Thanks,
Shenwei

> ...
>=20
> > > > +       err =3D pm_runtime_get_sync(&pdev->dev);
> > > > +       if (err < 0)
> > >
> > > reference count leak here.
> >
> > Change to pm_runtime_resume_and_get?
>=20
> No idea. You know it better than me. See above.
>=20
> > > > +               goto out_pm_dis;
>=20
> ...
>=20
> > > Personal view on this is that it makes little sense to do and is
> > > prone to subtle bugs with wake sources or other, not so obvious,
> > > uses of the GPIO lines. Can you provide the numbers of the current
> > > dissipation if the controller is on and no line is requested? Also
> > > is there any real example of hardware (existing DTS) that has no GPIO=
 in use?
> >
> > While putting the GPIO module itself into power saving mode may not
> > have an obvious impact on current dissipation, the function is
> > necessary because the GPIO module disables its clock when idle.  This
> > enables the system an opportunity to power off the parent subsystem, an=
d this
> conserves more power.
> > The typical i.MX8 SoC features up to 8 GPIO controllers, but most of
> > the controllers often remain unused.
>=20
> Maybe you need to summarize above in the commit message to improve your
> selling point.
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

