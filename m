Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0BE0723199
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jun 2023 22:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbjFEUmd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jun 2023 16:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231978AbjFEUmc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jun 2023 16:42:32 -0400
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5B0A7
        for <linux-gpio@vger.kernel.org>; Mon,  5 Jun 2023 13:42:31 -0700 (PDT)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 355DMRjv019380;
        Mon, 5 Jun 2023 13:42:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=sv0LKOzcRcET7HwDsg394Gw8Kxrq6hR9PuQSGnnv6BM=;
 b=GZT3+jeTGnh7jH9j6QI6p7MWjCGF3SrSKBKbs9pRA7zrwO+OjZy/LukoLMQ0RkVvPlgt
 ZWQIhY97XDtW814/8f+MZrtxgcO+QHZF3d56NLkWz9C43lN1dvrmbculSuTbLeoIrZjR
 leQPVD6N94gQqmrrygb6qUf39vg03n3MR0t3UcZhxiFiIRrXd2CRsyq98QG1JZpdxryw
 L96Au266vdkhPjMrTRpelhyOYM1iSbz1bK/dMbqApmI8no+b5v/MPEJ7bo0aK6FHzoG4
 9FtK6QTbIlSz1ijYu7O/X9BH+xJDJmX71X2c/55e8I6OE7jGhnpYZyfTSL9c9XfJdumQ 5A== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2048.outbound.protection.outlook.com [104.47.73.48])
        by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r051j9kvr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 05 Jun 2023 13:42:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNpwH8ba/kiU2HKQZ6xtIW2dISzcUB3u40rdr4TFfe+qTvS1HHjYjPTXsiPspkJL3XD4wtPFKjK5d1hxIJ8JjdNrJ5aiEPE8soN94c8v4mjBMQ/932xdUe6TOOC9Vf7WrYPkofa6ZoH8AbZkpsD1F09xeMBrtA4hXcfr5gaA00IRP3k1CyKiBPgZZvZOHCKIQ5LWObhC1VXdAWnSjQcPFbScQOOXJEbRs4wLvXc4rBeFqgYSXOVqVKmnL4g02W5irJHbhqZ9WtJ446q9A0ux7rRKDj8o/qUpCG8t5ak/N71l0iCX9C17gaBo5L6w7BIWdP6XPzDviJwmIjq5EE4EXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sv0LKOzcRcET7HwDsg394Gw8Kxrq6hR9PuQSGnnv6BM=;
 b=RYKrXROzMx2uYkYNrtpRqatCDYZe5XixHgorHBxEmyWbfytt0ze1wR8dY+mKUqoLa+jf7//vY77t4V8ZwBkYQxthfgm50ce3berzSXgb9K2BxhaQzYMLfrq+LIuOBFeTpJzCsbzjW6StOr6ZQyta1cQ1lAEyxUBTFTjCoazcyKvJcV3lw5Sttqbu0/7KdYrTkOtU1bObNep6w4c6+UGNWkuS5TKTVrdDAIu/VwynViIEvfAXWQni/kjO8GC1nkoOa/vVirENqdjmruK1Go+Ys8p49RnvPp61U6pR2nli5PPNPc15Y98KLuuMnf95HyvnHbVzibTSCQb84ZFsR9+rBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by PH8PR11MB7118.namprd11.prod.outlook.com (2603:10b6:510:216::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Mon, 5 Jun
 2023 20:42:26 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::c257:292:f881:ea]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::c257:292:f881:ea%7]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 20:42:26 +0000
From:   "Slater, Joseph" <joe.slater@windriver.com>
To:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: RE: [v2][libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
Thread-Topic: [v2][libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
Thread-Index: AQHZl+ASA4NnwMqBqUu8aHyCEwnIWa98odyAgAAJxEA=
Date:   Mon, 5 Jun 2023 20:42:26 +0000
Message-ID: <BY5PR11MB39922D38B634ACBA56AF507F884DA@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20230605190051.3915571-1-joe.slater@windriver.com>
 <ZH4_lSlcDD6d5ZBa@surfacebook>
In-Reply-To: <ZH4_lSlcDD6d5ZBa@surfacebook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3992:EE_|PH8PR11MB7118:EE_
x-ms-office365-filtering-correlation-id: 5b764be2-1e49-4f44-d718-08db66055fa0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kv7l3OOs/RH9BeVwEC+7t52UJGgG5r5QlyFZ/BZraBwvNFbjdA1UiUThe3MpBPMa0xNk5lM4WPpKSX/3qvhd50OwIlg3YfAuAE+xQ5uXF8LtHdfEoUeZNedNtnPc+VczWASehTsuvE1BzCJ+KqLujozczDFx+hrdyqikMLk3jQ08PjYgYdFtzEtQEhCjZnDvtJYo3CROusAYTvaAs+dk+pqOlvViF1W8vyNTPw5rsDut1f2rGmMNod6CRsDXjYo2aYl2a9m5Z2IeVfOHTlZvHLpeezSrwtdmHNVueR1t/AvPb8kbp2bK/qdNaiIW/fB06HQNhNMzSK2Ot9BOH3z4dlpSB4/pL0d5twPNeDVqRJL8bh3OHHoS5WSueuOl/5aNNO3Snxh3E07NlJYjEW19Tdp5r0NiUaFZkF2CJf/4ihm3TFky7AwEPK5KOZvMC2620HRW1sH64DZZXvNFM4BtzAXqLmXHxVAZpgJXlxNibSL9pzORq9RUVDSYKPv7rdtDXCOLzngD22euVo0SiGTImij18Fewy5sfc8rygonq8FWkCBZ/R4aY/p0M9z7zdy+N+6ef0KxcFB+7ruM4OzgdCfUXNYQtSeMk01EvFLn2frTT0dCHy98YL3tGgMEZ3prp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39850400004)(396003)(366004)(346002)(451199021)(64756008)(107886003)(66446008)(6916009)(122000001)(66476007)(66556008)(66946007)(4326008)(76116006)(38100700002)(55016003)(54906003)(38070700005)(33656002)(86362001)(2906002)(478600001)(71200400001)(52536014)(186003)(5660300002)(7696005)(316002)(41300700001)(83380400001)(8676002)(8936002)(6506007)(9686003)(26005)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gcfOuLPWuLjLs2qtrJ0Yn/8Efn98z/fQ4lRTHf8l6sYVVsfa34VF/oHXV1F8?=
 =?us-ascii?Q?z1HxCT2Ape1ge6WWKB0ac5Qg5WzaSuEs+FLRVMkJn9wBdI/o2z1f5CfEs34g?=
 =?us-ascii?Q?AfjY8dRHxFT3RTMDa5DvD+te3vcGAtLBDcSDJXEaiElfESxqsiYGuRHdvg3n?=
 =?us-ascii?Q?F9UoV/gCRWWj9/xIicY/gYh2CSaOIpzwHidO5BgCE5etnjdDW3S+zlp0op9F?=
 =?us-ascii?Q?C92p/HQDwmhymA4WWPeXEUwWQuoEpVuZmCIbSgxBNFey6vTlkV+/QR0vbLUz?=
 =?us-ascii?Q?lZUv/3ZOONXLc0UjjYBNIBorHWf0S1yVkRcRD5/+KF0LoEv1e9XLnvndSB/l?=
 =?us-ascii?Q?tAv2uNlsWiTeLFV6Xd0NTWg5wUW8h7UmQ4eIklY6Dcr+UUpkiV10WMlBvvYT?=
 =?us-ascii?Q?6+dcvLeHKRWNO2ILEYD97QjKdg9aak800lLe6Vyf38qYuyHE3nOzjaQoH/sc?=
 =?us-ascii?Q?ZO8vO2EBfk7HRb1zik6s2i6JCKLcI+MnKZsbgN5caAc4GbBmerovegDkZnqg?=
 =?us-ascii?Q?QGG7ukqWrdcJPGiXCZAYorxhchhKyZgE06rKnpqy4y0enZr3g0yS1eZKhRW5?=
 =?us-ascii?Q?yiEqO7KOtqUgSvrmw1UBEqkB3lnz/7BYpDmk9mWi1UOvfj4ieELT0ZRb8MId?=
 =?us-ascii?Q?k8DG8FIR22afjkgKjOIPzbux7P8qLGm1H7QYc26bMvVgBBrlAvqrstXxZibx?=
 =?us-ascii?Q?vT7gYxpGSc1fXYqREekiPktCIdADNyYlhwkOvVZpU7QPXDNR58SI1Y4xBjlM?=
 =?us-ascii?Q?M3aY1RBRdt/WwpvjzBT1rhQcD6cVMts9McKVe+7JAkJZpJwGYU54hSiEIx7P?=
 =?us-ascii?Q?zSlzM7vITVHEJCdQ+MxFRNMSlSqgUAUiVJgkHUck7mugi7/NDMKpCWRQMtZ3?=
 =?us-ascii?Q?5TPzDENZd31X/i5hwhO9GuVbyXmX4w6CL8HfusnCFfXIq+8mYH7hWMz0OnSz?=
 =?us-ascii?Q?WWowoMHtnZw2L7uUD2d9Xs80+eAplx3qXiedmzDsJ/fz0RGm7qmARaimgr2g?=
 =?us-ascii?Q?r0WiKIQrfU5Zn7tBqWMV/uUeRS9M/FscXcU6+4tpzPqrgaPBAzkPQbpPu2VQ?=
 =?us-ascii?Q?K4YhBSKCvr9N9aw1QHPsw4Td5VXJn6EwVTds2qt9Xv+IN9J6RyaeIp6uW4PX?=
 =?us-ascii?Q?WvLiFSFG+Eo5Bz4yDGnt7U++Imp2ugG8Wg4DkdrAUq39YoNq2UQdSFOO2SHY?=
 =?us-ascii?Q?j6Gpdxn3gBJNu0NBkItCSS8z223rMRvFu1Yp4WOEb96nHf/a1Rzn0pZrSS/0?=
 =?us-ascii?Q?jy573dIlBwkP7nOaqb42j1W5BHsY3rYGtJxpN0deYfSgSgyLai1foBmu4C2w?=
 =?us-ascii?Q?ozrEmatSgouLqHxU8EZ00IA9jeR9GLDl4NK+LDrdSYDsccajW9oi1blN8RHp?=
 =?us-ascii?Q?8DQAVN96Q7/AMpVAxiJvB5qsJOYQ/7lRfJOYgHEOQxbpEIuSSG7AYBz4fZl9?=
 =?us-ascii?Q?3G/W7fBsmzzbeKfj5sSTarbH306doEhIPMc0+uTcA33GP03pgCxwP1yzBa5G?=
 =?us-ascii?Q?bxd7WD9XIB2BxPYTL4Ljpw+5xDdm4M/P3fOlEUajOt591MWSHNlI7v1dF934?=
 =?us-ascii?Q?JahSc3Oe7xcwyrcIZAEcpuDwaaTjYtaOFYkIZDAp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b764be2-1e49-4f44-d718-08db66055fa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 20:42:26.8072
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0COIHOM6NpV5LbXlGQ/NlsJbDYWFZc9Udeet0bjNNVxKsXNwT49D1JR10JhDYYqz96EdusyCdfs1QIBioHuKKY6FlbmV119Yh/LtbWXlXgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7118
X-Proofpoint-ORIG-GUID: PZA-yPK81T6WOX8Tvmo6q4ZgqWjViz30
X-Proofpoint-GUID: PZA-yPK81T6WOX8Tvmo6q4ZgqWjViz30
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-05_32,2023-06-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=679 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306050177
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



> -----Original Message-----
> From: andy.shevchenko@gmail.com <andy.shevchenko@gmail.com>
> Sent: Monday, June 5, 2023 1:04 PM
> To: Slater, Joseph <joe.slater@windriver.com>
> Cc: linux-gpio@vger.kernel.org; MacLeod, Randy
> <Randy.MacLeod@windriver.com>
> Subject: Re: [v2][libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delay=
s in
> toggle test
>=20
> Mon, Jun 05, 2023 at 12:00:51PM -0700, joe.slater@windriver.com kirjoitti=
:
> > From: Joe Slater <joe.slater@windriver.com>
> >
> > The test "gpioset: toggle (continuous)" uses fixed delays to test
> > toggling values.  This is not reliable, so we switch to looking for
> > transitions from one value to another.
> >
> > We wait for a transition up to 1.5 seconds.
>=20
> ...
>=20
> > +gpiosim_wait_value() {
> > +	local OFFSET=3D$2
> > +	local EXPECTED=3D$3
> > +	local DEVNAME=3D${GPIOSIM_DEV_NAME[$1]}
> > +	local CHIPNAME=3D${GPIOSIM_CHIP_NAME[$1]}
> > +	local
> PORT=3D$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value
> > +
> > +	for i in {1..15} ; do
>=20
> Do you need space before semicolon?
>=20
> > +		[ "$(<$PORT)" =3D "$EXPECTED" ] && return
> > +		sleep 0.1
> > +	done
> > +	return 1
> > +}
>=20
> ...
>=20
> > -			for LINE in $(find $BANKPATH/ | grep -E "line[0-9]+$")
> > +			for LINE in $(find $BANKPATH/ | egrep "line[0-9]+$")
>=20
> Seems stray change.
[Slater, Joseph]=20
The extra space is not necessary.  I removed it.  Putting egrep back was a =
mistake.  I'll send a V3 in a few minutes.

Joe
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

