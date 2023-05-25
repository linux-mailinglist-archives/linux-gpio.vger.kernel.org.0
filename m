Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8730711996
	for <lists+linux-gpio@lfdr.de>; Thu, 25 May 2023 23:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234890AbjEYVy2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 May 2023 17:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241977AbjEYVy0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2023 17:54:26 -0400
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB4712C
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 14:54:21 -0700 (PDT)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34PJe8Zt012791;
        Thu, 25 May 2023 14:54:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=27lSdPbFlOYSgweADft0tcTzqEfHYtoipF9WmUjaIdw=;
 b=oaYSgmXGoJW0skImsuLKOg4I9x6NyU+Yk2nBXiaUD8u/BCWe4C32+RGBW27BKj2FazVa
 LbtJYzSA14UsaWJcq4gpMCavFjeV5RRvHKM55MBxgZZ2vcUAL5rCGKkKgdKW98URHHNI
 0Hij1mreZC4AJtaUkNspjAULKMy9k+0nL4HA4zZ9ukVVhqR4/V9acn+YkZeqyyxxhoMx
 VG8Lh+468tufBExyxcWdh1g0WWlmrd4tqJQh6cZC4Mpz1KSSiq+TUwEBFnbIx8FExNj/
 2ALT6TlQbcmoc3mQ+hQcg4h2Ez0pgNxAImuj5RRfYhJW/GGJuTpvOuepTbllirT0Wc3d qg== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
        by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpwqhd9c2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 May 2023 14:54:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGlAZg6Y3kvlxx8oJqac4vIgUP+o+M5DfJ11sBCtqfByw8VJt69rB8tog7VsGQNk4gZQZRtOFHQdlfHtvmueIINQFfv5YCXkbKbnO/F2W2H9t8bc781gVErwdfzyuPOlGxw56Y88g6xauRp+mTbO4QKoB+2AXxf20Cvf5os7NTHl4aoPubrjSUrIFkIix/On/Qsv/6SB2Lwi9V05Tpt38Ks9YfD2tY9AGmM51YXWj+OQqQtBuyMCOwVin3gRfostm8uWGwRX9GYIXWgz/t6KGuYkYv6xuQuvfSqNFfGeLk5PglP2qWK2UJ+zkL/oZo+mlAQrc54b2Otca/B6qzCO9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27lSdPbFlOYSgweADft0tcTzqEfHYtoipF9WmUjaIdw=;
 b=nzst7qG9Iw0gkikldT3nMBRZW3QEjX6CK+EbCPZD3LYOhNtn8FRoOYlYtjQl2yFjAFNyWFMNq8YMOO5cRspw6eM0+xPpteWoYR88SD++xA+EEs5NmtEXrj/cVfJ3awrg2NLQEaE48io1M/dm65q/QlqId8WHX1/9jJIXipVuposaDMI8fwZVLmIUT8f6DT00qN79fpg6T2j5nprF/EDzBtTraPDnt5KPx2STJKTxZ0CljlY2zphESwsomQmsFId2Apr2EhpjOfc/F4beTmac6g0I3uD9qPXXSB7ZYWGNrETYvaQYuMMNfDpfbBYncz+zKWE2SrSVFoT+/fjygCMp5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by PH0PR11MB7562.namprd11.prod.outlook.com (2603:10b6:510:287::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 21:54:15 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::1402:5af:ba2b:6371]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::1402:5af:ba2b:6371%4]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 21:54:14 +0000
From:   "Slater, Joseph" <joe.slater@windriver.com>
To:     Kent Gibson <warthog618@gmail.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: RE: [libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
Thread-Topic: [libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
Thread-Index: AQHZjoQUdYu6DxbaqEq4mE7FcbwY3K9qW80AgAEsF8A=
Date:   Thu, 25 May 2023 21:54:14 +0000
Message-ID: <BY5PR11MB3992F8CA5B13108F6310D72A88469@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20230524210945.4054480-1-joe.slater@windriver.com>
 <ZG7bpE8xRuIeq7J+@sol>
In-Reply-To: <ZG7bpE8xRuIeq7J+@sol>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3992:EE_|PH0PR11MB7562:EE_
x-ms-office365-filtering-correlation-id: 8a7064f6-abb4-4994-0fd7-08db5d6a94d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fiek96w92+KVjpbdUju+wYfTusSqTvhaht+0C15WJOy/lergdtNYgsPNvqcI7e5ZfjFq888Mo2kVchrGfQwCTM7O7XqvIESlcE5gchm+AhIe1P8xzjZZ5uHN9Y0U+az+AmcmI8FXxkyNs827JhygiAX2SbA0HRtKXVpo56l0HvJGW62iwcahfJj1xPes+euuUvwtngSXcfiixgKZOV5EQuoN9j5oAlAXblv4J4rWn1gTUilPNOoJgbK7exogK//I7tX//8gWPvUvurMLbB+Nt16T6uIewZ00vE9m+ZPNpQDNiv9bRzzq6EAjzEBy9LgbrfYt7tE/um9+FheQf9GyojbcnoTpddqtDK55Ruj7X1whsBo4nAXz6UfXdpTEZAI3CU3U6ycEhQqhsgZAdrEOQ2G+wwcASZFNBbnbNI0xPoDspA8k9WcchnBVP2TSy2jodC4SSVtgHfj11nw2ODVsyMTiQyOjPX2hlwFZJLik5mL4e6a7IoY11/FkI/IbRi3p1eqWQJgYpn/a54tfjrPQBxVvwLnnoR+sOtVLEdbfkvSBGRJblSC6fwpfXc0tliLKPMkEZE2SE+09jQFTtEezDnYY++rImcU5HHJrcVWukjY/x6d/DzgkEvC9VnLNJMiM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39850400004)(376002)(451199021)(54906003)(38070700005)(7696005)(41300700001)(316002)(55016003)(66446008)(66556008)(76116006)(66476007)(66946007)(4326008)(64756008)(71200400001)(6916009)(478600001)(8936002)(52536014)(5660300002)(8676002)(86362001)(107886003)(38100700002)(6506007)(9686003)(122000001)(33656002)(53546011)(186003)(26005)(2906002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oujMnezW5EoLrggA52bA0tNu/YU6uHc4wF/iH7tMzPWF2c9EMtFp3RhgHbGY?=
 =?us-ascii?Q?laOH2CQ1/XEbbMFSkVQxWCN6DiWGAB68EzO6ApKjUEJ+9o3K+gzlbMGcgP9U?=
 =?us-ascii?Q?J50cVmOz0oESuV+6R8K+U3jhynbWdXkGjM75aADSMv2mdi63Kq+MK/XlgRVl?=
 =?us-ascii?Q?OZdE2X8w2fhir5wG/Zgd5pKeZ0Mqy7dPagADKhs/1KqTonB1wZkJRAIUDIrb?=
 =?us-ascii?Q?pckvKWDaTY9gN3wMv8y1Ycorq/hlXHXwP0U1UPyB3W7MeR2OldCDaoACwzgT?=
 =?us-ascii?Q?ckTNuj3jZaiHuVG1kTd8iMaUeyy7E7fF2L1weH2o9DnH2nbPeHjPASGbrIHL?=
 =?us-ascii?Q?bGUWOVZ3I4J2epT0f4thv+/HNWT0MxE2h/QwE4LxkdnXOQ32FnQdusun6SGD?=
 =?us-ascii?Q?ZYRuSFMP3h5Dy51VE/8Yi1mwvEa0cnbkji/iI0FTX9bRYsGYbXM16lBgjqB0?=
 =?us-ascii?Q?LYqe2J1SQmObrcZaZDvTDhPMzoNWI0ML9DfNaHvPV0jpcgP2CsfN+3kAsylg?=
 =?us-ascii?Q?uFycmmSe97tFbngzDLdCcUEJtmgqHJRzUAxP1/HrLe/i+t4x3Y44A8PW7pcY?=
 =?us-ascii?Q?nQWXvyq0hWC8YTpKiS/OWzaS2WAi+ZU1lKY7I2dnwpRnH8/qgfzwtjNN58VS?=
 =?us-ascii?Q?C6TDBI+M1f4APPtM8O4tBdK4Joaw9GqA8HrUWoX2XlyE/uuDd9CIl0o47V2n?=
 =?us-ascii?Q?AEWoT8raTgrl61P7hyT+uPOOMozMZzIkT4/yIo4uFKthQ2C8axxyEq/SmTsj?=
 =?us-ascii?Q?xKbg9mxXze1Y5mpZDX+KteA1vyt7K78y6WG6J8wwA8exGfNKt42LLjeasbLD?=
 =?us-ascii?Q?JEz5mqe3knoObnyLJXSJDSg/llTmKe3TAiFiu/0XVEuFHQ2h4Fw7+Smq3YpS?=
 =?us-ascii?Q?ZOcNJO3QgeBQVVNRKJ8JJ6f+ZmRd7gc3l+d1AlcZazAFiObu5tcpZWqlczHc?=
 =?us-ascii?Q?8Axjg9bmJeXR8zz0pqbjKmR36xnZ4A7vPFrnAIyUFr/s4rOWJoIPnVTqFaJV?=
 =?us-ascii?Q?uBbblVooucgKw5J3T6I3ni6TjA49nKCiujlp6COLVh6GHpbpeuMN/2/eyMJq?=
 =?us-ascii?Q?sWGZDDErwiyEEt2vm3qyLFAoJtYPQU0L9eRs3WvC8cY9bGi6GlL6dlVcTNZ1?=
 =?us-ascii?Q?9/IlF48b+SS099pzpDCAXtcs3T5WwbFVst0Pgm/XAPjkigxqu01tfvbTFG3P?=
 =?us-ascii?Q?keghzbINOIxyKwj3TauXpWu00+sQ5UaNcLXiq9Wnf19apip4T1R5y6V6X8XX?=
 =?us-ascii?Q?3oIqH+qEK9ZdJ6+5RHSjOunzK/YylR/9VtvR50JQsOgLAojpa5oG66WvMiBm?=
 =?us-ascii?Q?YopDAfVghX/EAeNuW2UAtqOhWKWAbk3KrVgl7y0pRYkSZozbyk84v+8MNhSg?=
 =?us-ascii?Q?+6OLImu518d/MNTKjuciqR1EaPIxRUkGm2KtLvYLgZ1kZnxf8jR2paFLPLte?=
 =?us-ascii?Q?cpj39X2W8BMHB4ifMP8CmTw3M30gbMVPHGzx3iienEu13sYUSTJWSpCu22jD?=
 =?us-ascii?Q?vZ+4l37hDRbBH/cNcqfcqzJ/Pt0gg5GAj/ESLhT17P9Ng9/TOAcxtrbKizdp?=
 =?us-ascii?Q?TfidDzeyjce3UPI944Pxux+vlTvgBXqZTUzsBHn1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7064f6-abb4-4994-0fd7-08db5d6a94d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 21:54:14.7386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BeUeiWXCoEcuVDAKJkYqIzzQVZa/Fh0wH9YScdtuaB+58Fi2ZCTTSyKbGPMtsz9GOJszhOgDJI8pFSEtVJuC0OrkZearIrpCFmH6REfzjQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7562
X-Proofpoint-GUID: VO9MrOtpbpTrDvZDiZl0vLGlKbhU9kzM
X-Proofpoint-ORIG-GUID: VO9MrOtpbpTrDvZDiZl0vLGlKbhU9kzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-25_12,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=756
 lowpriorityscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305250185
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



> -----Original Message-----
> From: Kent Gibson <warthog618@gmail.com>
> Sent: Wednesday, May 24, 2023 8:53 PM
> To: Slater, Joseph <joe.slater@windriver.com>
> Cc: linux-gpio@vger.kernel.org; MacLeod, Randy
> <Randy.MacLeod@windriver.com>
> Subject: Re: [libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in=
 toggle
> test
>=20
> On Wed, May 24, 2023 at 02:09:45PM -0700, joe.slater@windriver.com wrote:
> > From: Joe Slater <joe.slater@windriver.com>
> >
> > The test "gpioset: toggle (continuous)" uses fixed delays to test
> > toggling values.  This is not reliable, so we switch to looking for
> > transitions from one value to another.
> >
>=20
> That test is prone to spurious failures if either the test or gpioset get=
 delayed for
> any reason, so good idea.
>=20
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > ---
> >  tools/gpio-tools-test.bats | 24 +++++++++++++++++++-----
> >  1 file changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
> > index adbce94..977d718 100755
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
> > +
> > +	for i in {1..10} ; do
> > +
> 	VAL=3D$(<$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/v
> alue)
> > +		[ "$VAL" =3D "$EXPECTED" ] && return
> > +		sleep 0.1
> > +	done
> > +	return 1
> > +}
> > +
>=20
> Not a huge fan of the loop limit and sleep period being hard coded, as th=
ose
> control the time to wait, but as it is only used in the one place I can l=
ive with it.
>=20
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
> > +	gpiosim_wait_value sim0 1 0
> >  	gpiosim_check_value sim0 4 1
> >  	gpiosim_check_value sim0 7 1
> >
>=20
> The comment is confusing once the sleep is removed, so just drop it.
> If you want to describe what gpiosim_wait_value() does and when it should=
 be
> used then add that before the function itself.
>=20
> The test toggles the line at 1s intervals to try to improve the chances o=
f the test
> and gpioset staying in sync.
> Could that be reduced now, without impacting reliability?
> (this test suite being glacial is a personal bugbear)

[Slater, Joseph] I'll get rid of the comment and try the test with a shorte=
r toggle time.
The series of 159 tests takes, maybe, 10-15 minutes for me, so I don't thin=
k saving a
second or two here would make much difference, though.
Joe

>=20
> Cheers,
> Kent.
