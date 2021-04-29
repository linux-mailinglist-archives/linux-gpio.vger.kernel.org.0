Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6031536EBBB
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Apr 2021 15:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234473AbhD2OAU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Apr 2021 10:00:20 -0400
Received: from mail-dm6nam11on2087.outbound.protection.outlook.com ([40.107.223.87]:54432
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233602AbhD2OAR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Apr 2021 10:00:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qi5VL7zqlk5VPFlqHcpgSo/55XpRYuczZIKJnmgrmwRUSadDmocC6momlOQZY4Hda5qvv04T6QgLosQMB0aa1tIGnquiMhYbANhANZJEms9ABPUfC1pCFyrrCdTXh092hzxEPG2oGR1hPlmE95VHoJt5/CyvMpFZKfixEmiuITGsuag2WFXTViIeSNtnqBmV8opGwXktKxuaBy1GUDKAwZGZ02k3C1osbUUDccCkXgzkQZNRwmFBGVmndAan1yYYdnUMgeoTp/QHlANS4/jy0w7Ybv5Q1YM0pmQPw0dG+a5MRRLx1hdDtJknsohHTQTGljd9rB6v0UCVmP9bWJ3qxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpqaBwf4wLOIMrmiBpv73eXsRQjQNpi+Nouok7quX3g=;
 b=bi15APu7JxP91ipCtNqHJxQyJHbsOWN3Jwlp9Qkg8vBUEm+g1VzLnGLFbvlGI91XizgCwtWFHdOmPtISgf2eLyD9Vz/Ryqlfq+fMc/UuglwxyhmhLRWKsPkaOZ0FZ9dRb2gOEpO1ZPxq+V9wu9Epf2YM1c7UCxfRdXAsbDuAcVvQfYv8PshAv1eP+S4010DeC3XAsMdKtgC5IdKkiydP28Bf+VzVCcQqRtyDZnNMI4HBdbzcY9aSnvO7sUg+j/yEUJne7jaTQacQzqoIQOgFyQCc4rO0uUyGw//pxPv1Fc62Syv9ecZye1iFHoja9FEP9MJwNAiq3rL0lbY4qSWjug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpqaBwf4wLOIMrmiBpv73eXsRQjQNpi+Nouok7quX3g=;
 b=Ax+rWWTqf/9kklJyXtMpUfqx4Yyt1StymmiEUY0AmI6QZInMrMKnPzOtPihfXql4s0Bah3h496azILlm8kJIyLz24YYOF3xShM6CIoZjEzVnS2vmPIPUjpr0FUtJ7HzO9cK6+91yMRcRsPGIfKSVvqJtNDVOCy1qm6Z9CH4G8VY=
Received: from BL0PR02MB5378.namprd02.prod.outlook.com (2603:10b6:208:83::25)
 by MN2PR02MB6319.namprd02.prod.outlook.com (2603:10b6:208:180::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Thu, 29 Apr
 2021 13:59:29 +0000
Received: from BL0PR02MB5378.namprd02.prod.outlook.com
 ([fe80::f046:3748:f21f:d264]) by BL0PR02MB5378.namprd02.prod.outlook.com
 ([fe80::f046:3748:f21f:d264%6]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 13:59:27 +0000
From:   Srinivas Neeli <sneeli@xilinx.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: RE: [RFT, PATCH v1 0/5] gpio: xilinx: convert to use bitmap API
Thread-Topic: [RFT, PATCH v1 0/5] gpio: xilinx: convert to use bitmap API
Thread-Index: AQHXLIdH6ynAgedRCUmGQjgNfXqrpKrCqQAAgADz7wCAB/YX0A==
Date:   Thu, 29 Apr 2021 13:59:27 +0000
Message-ID: <BL0PR02MB537807ED9F079ABF6F34B086AF5F9@BL0PR02MB5378.namprd02.prod.outlook.com>
References: <20210408145601.68651-1-andriy.shevchenko@linux.intel.com>
 <CAMpxmJU+K6C_xbQPT=9QKtLLTnajJQbgJH0A2QqbGjCV+b9Z_g@mail.gmail.com>
 <YIP9ltcdf7mNtYRd@smile.fi.intel.com>
In-Reply-To: <YIP9ltcdf7mNtYRd@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9db92a16-b1bd-45fb-ca21-08d90b1700c6
x-ms-traffictypediagnostic: MN2PR02MB6319:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR02MB6319BD6979F895AD1DF212E4AF5F9@MN2PR02MB6319.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ud4qvv6yMPFS252iB9N8NwIrdsOP0PqMGerMm8HdheY4F8B+g9RoCFHW+ysaI5dqdy6355OytmE5FR7cGMSPFWAuT5xcPLU66ckgHCXd8AgvszrIbPzq4dMGEKkohsLQFspM/z/jXilQwkS6jlKYGNmGehDxeWR3ZWRvd2WcuRN4cb2HDMdQwG1cn9JROcRmveCqzNual7tmMxBlmmAmx0Gldg2yzFzSdgTI7e3GLjE4amrVTWT87409ISAc67W5/LS29lBatgQiq9wgnZIzpRwzEDNNZVNFtObk7BBgjL98VKQTU78AJu7LHaXEfwuaXl1tm/aJcEU5ds+Fr7lylG/53xb84hvJoP0YXFL0Xf+DboXsRIoo70C9d4VZY5PpReA/h3vNFY28atifiSMQN60oD69C8duhv9yrPAtA5mnfRM9+s240+gBM6DsFZXgbzjd7jNW16ikH1P3DZFXjS4yqmKvWA1UV1HqW640xPdVXbslAKz0uhZaBNFiXjmOuf7rGEsKe7RSD/Ga8w/0FXaTppV8VPFJ//CW/t4T+ABKUhkPLTu5vANAe1cF3KOqIIA2KC4tae6/06gQPoz3gS3azmnwwFRTfceTcnApMZ5M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB5378.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(110136005)(71200400001)(8676002)(6506007)(53546011)(186003)(55016002)(122000001)(86362001)(7416002)(316002)(38100700002)(2906002)(83380400001)(66476007)(33656002)(66556008)(64756008)(66946007)(76116006)(7696005)(9686003)(54906003)(478600001)(4326008)(52536014)(5660300002)(26005)(8936002)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?qFRiNFJb9O86xzdWip+OxocdaZ/bCP/k2Gxur+FuyKDwQoBfkX8oPYKHfljN?=
 =?us-ascii?Q?HcxW5jY55puXI3yavmKaMRUzKabrX+KSrtroXn3H+WIlxXPn56rGtUWtTexK?=
 =?us-ascii?Q?wXnZzZ1Qn67wBFrQJYOx8c1l84aeZWtwtLZkNwLLsJe7QGt6dKdAB4b4th54?=
 =?us-ascii?Q?aasjMNJrR1bx9gpAZbKmLQq5vy+OkVoOg9NEOULmygTGIsJFeugK6m1vtMnr?=
 =?us-ascii?Q?TpnAL9kPn/4Fb4OTXMKuF3WP8zAZxdQZPmbEk0I2W4e0Fo7UkoLcfy8bySoL?=
 =?us-ascii?Q?CvV8i7gM3ZbfWdlL/oxnOpjs+hcxhBpcn0aegriz05b59QY6yrLbbfyVl1Zs?=
 =?us-ascii?Q?zFq37h9MtIl8tuofXNe76CiznNzHAUJEJONvRMlz4O/8Q2/0JRaYNjLgvNXt?=
 =?us-ascii?Q?pO/NDG9aEF6mVZ0aqMcdHhQyC4SyeS9gSCb4Rux2hwPn37F3wjjORCkjH1q0?=
 =?us-ascii?Q?NCA+szTN0FfEfHWwxGbcPqKSmhLCWNuw6xnUubF5l4NJrmr9XbDv3Hufk0Js?=
 =?us-ascii?Q?N/qbFD+6wvnzkyEwSoxBIRNK3sx09qDSQWnDSa0ojYFChaFl0F3rYKvw0yg2?=
 =?us-ascii?Q?ZuUHzysOUXXFYBX9zBjTsswwGGTyBZNO8Rs6QaPd0ZJRLhtYwHb1SbtFasXW?=
 =?us-ascii?Q?36r91AzohaKKw8GjTFEaRFVooAVObO7Btgdao732AK+UFyJFRdegBqvXku+1?=
 =?us-ascii?Q?HaaUcIvyFZmintrn6hZdG/eCFI5PGX3t1rWquLUt+ALoMpO6QvApQfQGuePe?=
 =?us-ascii?Q?Oq8VQpoy/3l6FcfcMPgrndt9+BMJc6N+Lpw4c4pIeMoALkHJ9r7Ztv73vRmQ?=
 =?us-ascii?Q?OvemxNBfnEuPrH8baS//Vpy+YGiSRJksGjKNM75gkSfj+3ga0I8L9nQ8soRh?=
 =?us-ascii?Q?w6qHJpaRfWIwBf5CdZj1Z/I4K/KPOBROA9e9MNaL421sLsTWp1SYx1YkKNHQ?=
 =?us-ascii?Q?ZNXwQJTVj2BJca2nNze8lZnlf78OGGh9fwZimU7OKG9BNb0uXfPLcgxho+DO?=
 =?us-ascii?Q?lHwO8/b1GnUfXDOYfAFG7rAPXNd/Dr8cFLflSNyR2g73TPQdl4hRdMySlt24?=
 =?us-ascii?Q?v+wVu9y39El5+mHOmaMQb97sbCWv7SR98MeKliJp6XNJSs1kQFivZGwmKB7B?=
 =?us-ascii?Q?QZW/kPimotQtkgaUdzcX1SYeiJ1JFBGAFIAekk5RyIZcgCrGtqrAbdqzO30e?=
 =?us-ascii?Q?U2zFbrfQTr9bbvqoMluCvPvVj+WfIrP8p9VQy61uad/jVuzGtp3+x6IMmv0R?=
 =?us-ascii?Q?ujRibF3NbeUSyrLxcNHNNrC7gzEKpXataSNbtp3b1bFNRnPck8oE/aqaMi16?=
 =?us-ascii?Q?wXadirrhmX7k+RlYjWjukWl5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB5378.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db92a16-b1bd-45fb-ca21-08d90b1700c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 13:59:27.3038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uQQrf7Iv6kAvuosXwsR+xsOUi809NDcy3/evSYYAMoXqS4SeA8GrKG611gxnDIVTLAzE14U6XbewoXLhKhsdsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6319
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Saturday, April 24, 2021 4:45 PM
> To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-gpio <linux-gpio@vger.kernel.org>; arm-soc <linux-arm-
> kernel@lists.infradead.org>; LKML <linux-kernel@vger.kernel.org>;
> Shubhrajyoti Datta <shubhraj@xilinx.com>; Srinivas Neeli
> <sneeli@xilinx.com>; Michal Simek <michals@xilinx.com>; Linus Walleij
> <linus.walleij@linaro.org>; Yury Norov <yury.norov@gmail.com>; Rasmus
> Villemoes <linux@rasmusvillemoes.dk>; Syed Nayyar Waris
> <syednwaris@gmail.com>; William Breathitt Gray <vilhelm.gray@gmail.com>
> Subject: Re: [RFT, PATCH v1 0/5] gpio: xilinx: convert to use bitmap API
>=20
> On Fri, Apr 23, 2021 at 10:41:26PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Apr 8, 2021 at 4:55 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > The change in the series has been inspired by [1], which, I think,
> > > can be improved. Here I present the view how it can be done.
> > >
> > > The series marked as RFT since I have no hardware and I perform
> > > compile test only.
> > >
> > > The patches 1 and 2 can be (independently) applied for v5.13, but
> > > I'm not in hurry with the series, due to above (lack of real
> > > testing). So I'm flexible in a way how it can be proceed.
>=20
> > >   bitmap: Make bitmap_remap() and bitmap_bitremap() available to
> users
> > >   gpio: xilinx: Correct kernel doc for xgpio_probe()
>=20
> Bart, thanks for the warm words, just pointing out that patches 1 and 2 h=
as
> been reviewed and may be applied for v5.13 cycle. Up to you.
>=20
> > I usually trust Andy with his work but is there any chance we can get
> > a Tested-by before the merge window?

Patches tested. Functionality working fine.

Tested-by: Neeli Srinivas <sneeli@xilinx.com>

>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

