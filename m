Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9946772474E
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 17:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237471AbjFFPLJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jun 2023 11:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234876AbjFFPLH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 11:11:07 -0400
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0EBB1B5
        for <linux-gpio@vger.kernel.org>; Tue,  6 Jun 2023 08:11:06 -0700 (PDT)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356Dv5xC019881;
        Tue, 6 Jun 2023 08:11:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=zM4JZ3rxdywXvvyjESdiowPapE/rpSD2EZ6uv3u6uLY=;
 b=eqMQeEAQ/oUETf6ZElNQkyydK2901xX2C2e7CEvOiyAxLH6kE12EV1jmQ96TFXdqg09E
 KTPJKwb1bdMn6i0zXebUa4QQXYCah34qZ2xn0OwmcCRfvLwKoBv3iMn3ah1GkmMPFi92
 xqVLmfM7ZD95mEh/KsaDK8S46C3zij5+RpeJkiDk7lcIae3yvbVogEmLRnc2AtKxUJ3r
 9pZy90Nqso4avtSluNIpUgi3+KNi0K5OvbyIRACZfvsV+7pdOpKMz4dlXDKRArVM/6l7
 xA0/tBYk27LcEboI5vwtTTJgvYmN8A9JT2eU0vWZLPPe6eh1ibj/LdYeambGefqV+9+3 Lw== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
        by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r00t3aeah-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Jun 2023 08:11:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGBEi1x61dxRtmulwLfZQ41TCPt5Do99cUDijZsBC4Z3qH2jsucYWGA/+lGCdgB/o+H2ZO2M+ETZKQaysAOv4Bu6FDHxZZ3oRv7rRnfCA2MkzXirFBqCQiSHsoMW6jgtZay2fQm9K7qlLH9IlfZIGVZmFT4OONx6yK7mk+tqEHxAaykPgK9BjHWVLrV8N1sdNGxwoOUIFU13Px6DOrjtkg8wwukPKTrhwqcnSUZU+iSef3VlwnMgSy1BGU+Asu3Oe7foBRjg/JdQb/KunrF0GbVaCZhYrXi07OSOUCK2FEbOy/weDYXyBeDqYFid/luG54LkPR2kln9EuEJfMzwV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zM4JZ3rxdywXvvyjESdiowPapE/rpSD2EZ6uv3u6uLY=;
 b=CZEDUbD6ueJYqet0aAfmBjKsuE4af+y5vSCnP9QIoHlCDCDnYl5owm3hB3KDoZMJCxwtPRysqhQIm2hEUOkhzThEKNi9F/K2Eruf2/OePBFaVfLvZFodVbzfnuf+K7mXwyq+tRF8SwY6pYFNhnkD76pSSOcsDkmnM8FAcIHGSS0E0itC3v70FRJYmLL5jRb3Ym5GSkkMwMCc4qSncWLKIWrPTsqovpXeZcCsZaypPhFVXCtXdHYcxh0Q1CW2LY17WFYhpj5QM08vSEr2XEWD/hiPpB/87O/8IB6Sh42ALCr4Eiuf0NF2qh74ZtrUrjwQqEJX9o2xQJ/DryXhmNnD3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 15:11:01 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::c257:292:f881:ea]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::c257:292:f881:ea%7]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 15:11:01 +0000
From:   "Slater, Joseph" <joe.slater@windriver.com>
To:     Kent Gibson <warthog618@gmail.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: RE: [v3][libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
Thread-Topic: [v3][libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
Thread-Index: AQHZl+5pvj1hxBofsEOLUMUg7rlo9q99Ih0AgAC+hMA=
Date:   Tue, 6 Jun 2023 15:11:00 +0000
Message-ID: <BY5PR11MB3992BFAFD3714C8247BCA2E98852A@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20230605204335.4060789-1-joe.slater@windriver.com>
 <ZH6rRD5B2hNyXcuV@sol>
In-Reply-To: <ZH6rRD5B2hNyXcuV@sol>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3992:EE_|CO1PR11MB4817:EE_
x-ms-office365-filtering-correlation-id: c4941785-953d-443a-0732-08db66a03d1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q+1z/47e8/DvyjchBBsCqA5hFLTVRBieKUoCxHAUd/Wck3ZwgKphKvle+XXKSCMMLTRfw0YKG3CLrx4blx93cWM+IZ2L3o97u6gNabQxFdJ8zEHqe8OnCngmFKnLHSTLPi9rFPqutc8CLt7vAmMgMdspM/CiGPlvLHHlEveBRV4yzcdrPYAvI+QSYDNy97b1Ek5wxCqc6fR3DB2cY1b2BO8Tlmd1yXesw9ERz5hXNDWqunru53NohOdOmiXKdl0EG5HNSrFuyWEXt4Df3jpE0KH/Ngf6hPMzd8EOD4m/G8T/elhGUKiiSoMSj203sgbdG2s0tENOStWFsyh+pzDquRK7vnpRIqmedujwPhTWYQKXQBs/fbD48wUgV05V+RoaAQflxr3yLlw59VhvPjBQPhtqYXUlgmSBRerpoW1F+Q4xUtp31qsaGcEkQMAL5vdUdq1IddyUVWG4jTxVzkj0RRXcmfYirbmG7PZi8cEHCDYQ00tkE4yARvNSj5UfvnJU44L8oLNBJM2XfcyVpAVO12LDv1kTFmMOdfaWbc+lHECDKiqtS5pVfN9KR3M6kaQgWFqmXi+deUq1MXtJgxXjGe6QO5irxJZ8ivmGdMF4BxK3O58CatRd3J9ZevsmT5ej
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39850400004)(346002)(396003)(136003)(366004)(451199021)(2906002)(54906003)(38070700005)(71200400001)(478600001)(33656002)(86362001)(52536014)(38100700002)(41300700001)(8936002)(8676002)(5660300002)(55016003)(316002)(6916009)(66556008)(4326008)(64756008)(122000001)(66476007)(66946007)(76116006)(83380400001)(66446008)(6506007)(9686003)(26005)(53546011)(186003)(107886003)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FgmOrzNd65ZmT751mguN3nCcRERM9EtPwXzcBJyyastxngM9dpq36W/jfSoT?=
 =?us-ascii?Q?pl4RjvXypvTQ8JmZXqBYfv+fH+lvKXMKMpZDn8iF10y8MZHO7/qr4JehHaDr?=
 =?us-ascii?Q?FozOvTYGvcetwt5zTXaPWOTwKtHA6DIuZ6JlwPBb+ZrHkENNGqUmWLk7OjLv?=
 =?us-ascii?Q?GqpTDm1Ap0gBhkhL9pujU0ZFo/12g5UTnoHw/zWvEcBrYnumkchCWpyRLA8l?=
 =?us-ascii?Q?AZm959lMkJC1j87UcsgpiHkCn34T26tKI8VXxP/BmmT5EyfoFgDmG5wSW8i3?=
 =?us-ascii?Q?0+l+Msn1sy5EV3USU1bYsUgyIm3Z2HE8noRRWcIqba4RxUT5skMNrL3q0YRT?=
 =?us-ascii?Q?GMb49m0EN6rVI0rFY4WIJ2GiY5h8U+HeYNDwMPeR/XAYMXxeqrXb48C6pAkC?=
 =?us-ascii?Q?bS6uw5+rmsjvNM0MdrLIjKgM+SMg/bH2bL7Z72yxRb+LL2bz+7MbD6hFfisW?=
 =?us-ascii?Q?MCpvugf+CYSNhKNUQd57JxF368egeVclOD253EK0gb+QeoBruSw76EUqH9Xh?=
 =?us-ascii?Q?m+garJfK8LdwtTAQLueplKbW5THn8bMQ4HB9d/JFWO5wFnOvKdVIjrU0ybzQ?=
 =?us-ascii?Q?XNnBTHekQP5F8o5bjFkrYw4VcV67l+66pBtZso0i9mmjvqZYemImVKvroDdd?=
 =?us-ascii?Q?mtxD8lLqBInPa5ckANWO/8QTaqhPP5IfN5HAxkJzT+Wk6CPc2S+YzHKwwTCa?=
 =?us-ascii?Q?axGREUVpaMMXTWSi5TzSZvPW5S3LFNvB4fMN2nMKAU963sATOeDlA03rGK/e?=
 =?us-ascii?Q?ijrQurR1kpSzVsvf2kI2PrxakNaXtP1fS8nZAyZOXbtxhPtizcSat0hIvyGn?=
 =?us-ascii?Q?Q3bzcVwXzDv0gsiRX/RLm0RLMHjPyzUJGld4rSinHLmoqbsHeomtIoOeKdmI?=
 =?us-ascii?Q?lXLrVIVVVpPWWu2b0V/ZLJZpaoVfwW7Ww/HBj+KQpBwBqsBxSxR33BxNqj6s?=
 =?us-ascii?Q?/8LRfyc6c73iPvsB1tUNvBmLzH27Vnad+2PRWe+Y8mXWjmH81WxFh2gXHtk9?=
 =?us-ascii?Q?1hBbI0PXr24uGXj6109tNLgc5O3XaG91ftDyQxIgj2bBCZEyMzpJyJOP4aUt?=
 =?us-ascii?Q?otPA9P78VuZdF8teK4dl2PwxpHyuCZtDm48hpYWLV5EHF26t6Lbb5nk4Vip1?=
 =?us-ascii?Q?Mb5kbpK//lo7ifS/6Jmq6YLSPIKZ5fAZQEVJqkXnAxKrNLE+F9WpcBBtxgqL?=
 =?us-ascii?Q?k1qFhAM2gq2TCmQzFtIOhOdlMTkEG4/UeD65Zw3uKYRInQIkvTVUHsyPeqMh?=
 =?us-ascii?Q?eqOmrno+v/VaootmQ+D0asRCR3Z6Wdib109DM30C95OfUW6rWBc1q9ByvMsz?=
 =?us-ascii?Q?n0Y9sTWG7lAe47VNS1L3rz5iEagLHUV/+w5oeh6HWhnACS4mzeUF1N5ALyB6?=
 =?us-ascii?Q?zhmlGqiJ4mEWZQPqPsof1LZZNnWm2lcckkXeis/y5GQtTKnEHqN/Yo4GJliy?=
 =?us-ascii?Q?jc56VnkhoK7GFskxFOtq5ika37Gh62YSUzb4unHNsdTewi2vn++nSGR4bkfd?=
 =?us-ascii?Q?xnZdhBqaXnEZ+jXR/hkuZE42u8TucbXcXrYOJoJkFxodU6EbvUcATeE8qpUA?=
 =?us-ascii?Q?LltSIgDeC5BP3hdW23fNxUli5zru7/mwrDXTXFX+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4941785-953d-443a-0732-08db66a03d1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 15:11:00.8442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l4DMAqgfloeN9m+5ZT24gQH6eKJTzA8ZYf+WqSvQXMMKfjV0+HzemHp3R7PvavM4b0ltkxpYw+uGP3c3IkI3VvW9MD72THu+W46ckxa+Iew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
X-Proofpoint-GUID: 7RLxamyf_qPxg-fCX7vp9Oxmfdg4Tf-2
X-Proofpoint-ORIG-GUID: 7RLxamyf_qPxg-fCX7vp9Oxmfdg4Tf-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_10,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060128
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I finally (I hope) got rid of the "sleep" comment.

I have not used bats before, but I gather that the bats file will get parse=
d 160 times since you have 159 tests.  Breaking the file up into pieces mig=
ht help, but that's only a guess.  For me, the bats tests take about 4 minu=
tes in qemu.

Joe

> -----Original Message-----
> From: Kent Gibson <warthog618@gmail.com>
> Sent: Monday, June 5, 2023 8:43 PM
> To: Slater, Joseph <joe.slater@windriver.com>
> Cc: linux-gpio@vger.kernel.org; MacLeod, Randy
> <Randy.MacLeod@windriver.com>
> Subject: Re: [v3][libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delay=
s in
> toggle test
>=20
> On Mon, Jun 05, 2023 at 01:43:35PM -0700, joe.slater@windriver.com wrote:
> > From: Joe Slater <joe.slater@windriver.com>
> >
> > The test "gpioset: toggle (continuous)" uses fixed delays to test
> > toggling values.  This is not reliable, so we switch to looking for
> > transitions from one value to another.
> >
> > We wait for a transition up to 1.5 seconds.
> >
>=20
> For future reference, the subject line should've been "[libgpiod][PATCH v=
3]".
> The version goes within the [PATCH], and 1/1 is optional unless you have =
a cover
> letter.
>=20
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > ---
>=20
> Here you would normally list the changes between revisions.
> So I'm not sure what has actually changed since v1.
> The loop limit went from 10 to 15?
>=20
> >  tools/gpio-tools-test.bats | 24 +++++++++++++++++++-----
> >  1 file changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
> > index c83ca7d..05d7138 100755
> > --- a/tools/gpio-tools-test.bats
> > +++ b/tools/gpio-tools-test.bats
> > @@ -141,6 +141,20 @@ gpiosim_check_value() {
> >  	[ "$VAL" =3D "$EXPECTED" ]
> >  }
> >
> > +gpiosim_wait_value() {
> > +	local OFFSET=3D$2
> > +	local EXPECTED=3D$3
> > +	local DEVNAME=3D${GPIOSIM_DEV_NAME[$1]}
> > +	local CHIPNAME=3D${GPIOSIM_CHIP_NAME[$1]}
> > +	local
> PORT=3D$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value
> > +
> > +	for i in {1..15}; do
> > +		[ "$(<$PORT)" =3D "$EXPECTED" ] && return
> > +		sleep 0.1
> > +	done
> > +	return 1
> > +}
> > +
> >  gpiosim_cleanup() {
> >  	for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
> >  	do
> > @@ -1567,15 +1581,15 @@ request_release_line() {
> >  	gpiosim_check_value sim0 4 0
> >  	gpiosim_check_value sim0 7 0
> >
> > -	sleep 1
> > -
> > -	gpiosim_check_value sim0 1 0
> > +	# sleeping fixed amounts can be unreliable, so we
> > +	# sync to the toggles
> > +	#
>=20
> You said you would get rid of this comment.
>=20
>=20
> The patch works for me, so I'm otherwise fine with it.
>=20
> Cheers,
> Kent.
