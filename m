Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFDB03AA61A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 23:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233999AbhFPV0K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 17:26:10 -0400
Received: from mail-dm6nam12on2107.outbound.protection.outlook.com ([40.107.243.107]:35681
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233979AbhFPV0K (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Jun 2021 17:26:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTI1jhxu+N3/1w3HOGxOyKjbb9jdf/9p/E7pLFJrAH2Q80BOUywOkkR/dtsyPwLHgXZJrddA5Eu7RVrqDzkX5vfV7x8JJB0qYuNc2G/aCWt8avyao7YgNEhrfj/rNsL4ZSRhoiCrjM20Oyvp3Ap45UuYzwFBRLEr4StM3qSwPK19OjOV/Gdz/VzsYNkG9/WZj13v40VX5wlAxmwwEMZE5y7jv/cAx3JpPbBNHcmLMBnqjs+DlcX3WtxghAin2saYUAVSWsYfLJemhPtiVvb+QKhJmNbbmgXRyGuC3hzlAqGg0lqdUwqvyOXa8CKBhN4Dot32Pwr9we/c6JqrDPDVEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RUS3KSjM4U8WuuJjEakyd8BjSm5kArPuOv99dUncPs=;
 b=dIq7xGAZduE9wNJMDp+kiQ7plJMgu58O0KkWnvaliVPh/gfOjJuPA1cGcrqRz/t8f9ttHFmhClvQWCJb6aBoJnRngCkdppqE6cu+A0P54SMFcueHOHZHq5ezcmYZdPmfXY5Qygp0zwl7PVXwBWaSOd6cjIk+isg80Mfmr/nzwF/9fmiO92P7/4Iv1OiV4Vfr1YP71n8zT/8tV7k0KFqYS+aIxU00lvWtqFxShNr0cxqmWIElyC7roP66PAii0Pqyyd2e+ki7U8suyiQ6CGWO2cjPMxCWGSLacdfdHw9WPETjRFhYJYQPd5R//cnsUWSzJtMsNdTtadk2Sd+p0oGGTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RUS3KSjM4U8WuuJjEakyd8BjSm5kArPuOv99dUncPs=;
 b=BhT/BEBIBy4/K+Y+STkY/OYjyBBYJX+D71PTlEAKpKlaS8ho8DzG2B1imAVdJFxE+yfSMOsPA409xr/Huz1s8Oo/9dnyr14Jviqxc5N+X7rgJIKJVObagdbGMSwQ47o/Eu3foDxz4kBAhoEPWdNBMvG1j8FWMnO21frqkvELWLk=
Received: from SN4PR2101MB0734.namprd21.prod.outlook.com
 (2603:10b6:803:51::25) by SN6PR2101MB0990.namprd21.prod.outlook.com
 (2603:10b6:805:4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.3; Wed, 16 Jun
 2021 21:24:01 +0000
Received: from SN4PR2101MB0734.namprd21.prod.outlook.com
 ([fe80::d465:53d1:f8aa:8ae]) by SN4PR2101MB0734.namprd21.prod.outlook.com
 ([fe80::d465:53d1:f8aa:8ae%6]) with mapi id 15.20.4264.007; Wed, 16 Jun 2021
 21:24:01 +0000
From:   Gabriel Knezek <gabeknez@microsoft.com>
To:     Kent Gibson <warthog618@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [EXTERNAL] Re: Potential bug in gpiolib-cdev.c in v1 notification
 about line info changes
Thread-Topic: [EXTERNAL] Re: Potential bug in gpiolib-cdev.c in v1
 notification about line info changes
Thread-Index: AddiGCFVNJWUYCsfSSKNHjmzifRI1gAhHu0AABW9gJA=
Date:   Wed, 16 Jun 2021 21:24:01 +0000
Message-ID: <SN4PR2101MB073495FA53DFFDB024AB74CEDA0F9@SN4PR2101MB0734.namprd21.prod.outlook.com>
References: <SN4PR2101MB0734B4BE5D7750A5CD43C3ACDA309@SN4PR2101MB0734.namprd21.prod.outlook.com>
 <20210616104442.GA160816@sol>
In-Reply-To: <20210616104442.GA160816@sol>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=4f25aece-67d5-47be-a5ef-2742ebdf1506;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-06-16T21:07:11Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35202c7a-04d1-4284-9175-08d9310d0f82
x-ms-traffictypediagnostic: SN6PR2101MB0990:
x-microsoft-antispam-prvs: <SN6PR2101MB0990FD1075EF3CE58C0D1DDFDA0F9@SN6PR2101MB0990.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KopkD245+vYutpHCs686hqJAj1UY6Pbcn2U0/s2C4ZpE2zo4DCjLgBKQaEyyZqEplKanlATH7gVHJdzvsKRJZwEpErW+Y+b/hwV/ETak/KvNcmOb5gtOHKv4vE9hb09BcSi7LNq/j2B4r3JakvNqFdqHCYSfQ9g6apwpDf9jNHAVzlNcjAioQsSHuQYdvlQRrUfNcvomugAy8a6pqpnwkO/92rNgNpswhIG2/X5y/pZRTCMZ52dKXfWuTwiMlJw1A73aj3/iufMgD4sGT752XlMtihIYHVkW9uBMvNBCtUOZL50Cn6ayOjBNaERE8N9N/+3GUU77tU3/tMnZGCZQNt9nMa+czQyHWgKWbUZteQZG+CPZbD9FfYdq3PlII/8/J7qri2qFRE2iCFff7g7BVZLwdcf6NbXsJ0jca1AABjRYVHTqyVn7ASwrqArB+XpNTNEbIejsoly4clxrh//VAUjwIFkUUdibykBO8aHIK6kjPPVYsGuIJOTBetcbYvcqQV8+pSR40z9QA9Cs+5yOgScEhtv96JH5AN6Krpp9l1/iFp9E9D5SiTnaYbPWvIU9dgpwxkAAq8OqsnfhBERma2FrzKGxqq1kXhpI3clDvylZ2/X1be3kb1E/m2Q/lJze8pPofZEK8ThhVzadqLDpJA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR2101MB0734.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(38100700002)(15650500001)(478600001)(122000001)(66476007)(86362001)(82950400001)(82960400001)(52536014)(83380400001)(8676002)(66946007)(26005)(8990500004)(10290500003)(71200400001)(54906003)(66446008)(8936002)(33656002)(55016002)(186003)(4744005)(7696005)(9686003)(64756008)(76116006)(66556008)(6506007)(4326008)(5660300002)(6916009)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rQ8OfyivjZdzpVIEtgz4tlHXxDTFtpHNBkMQGTIqujfXm4SemH+2uce170Kz?=
 =?us-ascii?Q?ksQxxvy+AGIaDQeV2Am3vizjAMoEgg/ljDA6a42ufpfQ46PwEmZ9pQ5ZRczN?=
 =?us-ascii?Q?8EQv8KE58EgSPi6oz6a3qOTPbIgtWOkXGUJerAtApnFFkGfiyvqRUb6BHh7+?=
 =?us-ascii?Q?AXvqTEJS4rRCJBwz/3m8yjV7mr2s0/zpjFp+9Y7AGgwzSXu27de46o1wR14I?=
 =?us-ascii?Q?FoEUDLJFOmXQx70BLn5rlWXbywtIDQ/beNoAgqIqxInCgd1A7m+JGnuJNauO?=
 =?us-ascii?Q?9BoZDaGYxc/1jGPAzgp2qeuvdwuDjdfdBVAT/SMgyau8rH2b8Fgb7cZoHijQ?=
 =?us-ascii?Q?xP29MVUnRonQB/GPQD1K63VrFro2E12CC0498SzqtCebb3hrz4DR6TWqxER0?=
 =?us-ascii?Q?nVeVewcSplqEkAca+1OXlx0mOqszk0i+BI62MkErg/DoaOwUwnqbuh/ymOLV?=
 =?us-ascii?Q?RZdCsIS/FWgxPeAJzPO538kL7etxLgoP6CAozmecYaeJG89zLp4zPqYlcheN?=
 =?us-ascii?Q?FvMUrIsCzkRwNDlF5PIE6Aheynx0gGy542NZZPuQd7lDKUDouAkVilhH6WCH?=
 =?us-ascii?Q?+hRk9jqK5tREHowvKPIc+nWoZw0MKKvVOky6QCLi+qmEYUk7J86mojpJs9Dm?=
 =?us-ascii?Q?sk4NcsM1BNn4JV6C0ApsODGRLaDNwwN5RwQO14gNJzCCgAHQP06tjCCQihy4?=
 =?us-ascii?Q?D+ooK3y34PM16deGopnvDtObDwayGPGKtm4hKxV/y5QiRpNAdDoTAhLoTzsP?=
 =?us-ascii?Q?Q99SdCKLHP4TrXG0IwrkY8HpefHlzmvRsubmtvq6vmzVsb6nQR9Rq3pWxQq9?=
 =?us-ascii?Q?AMzC8yJ+9UIn/hzBvN1RLJRHn3FIj406mW+BypbR9K1MUf2QGStUCDj3OJJ+?=
 =?us-ascii?Q?3K22kDm7gyVlncP92x77XnsSQsLJ4gtYIPUzuD63eAzSWFkjdvpWl6or5KyA?=
 =?us-ascii?Q?7qBvaw32uMyvog4rX61+W+4hcQtkXfsXnogKdppsY8KA2DC7APcTe/7c+U78?=
 =?us-ascii?Q?MAjk0019nkp4l6JaHNSEO6qfhpDF2FJPg/f6CQ9zzr6B07ZaLwVNYF5V94BF?=
 =?us-ascii?Q?Nv5fBcEssSOObWJxhYctd2LkwO4jma0Ofk412VOVJMhSQrwC6gLcMC8kF51z?=
 =?us-ascii?Q?DkPBXk0zCUfJx6Ti3i9l6yBLgApK7q5/SH03kAh8SSFpz8My5m7xakfZNae+?=
 =?us-ascii?Q?KGlILghOrFBrKM/X1M/4iHe5xkbqQUB7IdDRK0w7ETOeg/IiERO+oHRFsByV?=
 =?us-ascii?Q?CNoUwhKZcjy6Lmdbp/k76VbRGmWYHxWTRytGMxa9c5rm12Nhyd4ifLEP+qtu?=
 =?us-ascii?Q?YD/4K7g0Vy6Bv5+/NRLTSA9c?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR2101MB0734.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35202c7a-04d1-4284-9175-08d9310d0f82
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2021 21:24:01.2657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P/JiYz0syGjqwQ6WTPams1X3uajqMhEFuq4TWWJVvxszXmY45qPdUYCdgaxYDkDausHci/wF2KQ4jc4/1e+rsVTOzyit3NMKVgbpJqpJl5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR2101MB0990
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

>=20
> Looks like a bug to me too - well spotted :(.
>=20
> > We wanted to get your thoughts on if you feel this is actually a bug, o=
r if we
> overlooked something.
> > We're proposing to fix this issue by memsetting the entire structure to=
 zero
> before calling the conversion routine; if you agree that that's a valid
> approach, I'm happy to submit an official patch.
> >
>=20
> Go for it.
> I'd zero the padding in the conversion routine myself, but zeroing the wh=
ole
> struct in the same routine as the copy_to_user(), as you suggest, would m=
ore
> clearly demonstrate that it isn't leaking stack.

Sounds good. I'll send out the patch shortly.
Do you think I should CC: security@kernel.org on the patch?

Thanks.
-Gabe
