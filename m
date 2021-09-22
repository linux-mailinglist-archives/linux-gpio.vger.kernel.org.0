Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E46F0414E14
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 18:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbhIVQ23 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 12:28:29 -0400
Received: from mail-dm6nam10on2117.outbound.protection.outlook.com ([40.107.93.117]:34445
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229671AbhIVQ22 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Sep 2021 12:28:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnnJkoqUmZcqD8SoA2tde6a56H0KvGPiKBKaipkCnzAw+6h+ijpwUNCp2l/41pjhSm+bRZHYdJR//hh4s5+4SPezvTxVS8qY57w6O1Vw2qKQR7uxMZoUAratUwIFRkIkNqqj7Z0xupcjpjUd5iJjpQYTO55tb+zEho9m5d4jlVWVuC1iMTrI5GwvisAvoOlO4RqzCxgBqdujfzknwwi3u8rApVDXSrC7dtX+bv+P1dWKfadlF3/+ESMAExpmGCU3rMRJQlyEMwH3mNsyVAyHoXtShnl+LVyIXJu/8X32fDTHplpuFaZNU0RSJ+ueGmz0JYAT4Xa5HwV/FnCvc64Cbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wALNFooNaLjIksK+E6Cew0b/ku+hW0NxAmRQ7sGbNxs=;
 b=cWZ0UEuH2A7EhotAZP+LdWsYgHmp6th7qYIW4UgUqJBUfFR3LvCNw5DBKFRp/8cQWiUNxxloOxveUJ1DL2jZwk7wGrM/ykfRwalPE68tGeGNhCLcxJJxshBrbOogJfZY7Lgq8aXMmKM+0RAzf2n8V2MJNbQgy7xgc+ocn1fMi/NGpMbThHi8upGymBfBLG8qRcOZTanrVWuvUE0gIsK91Sp4IkkNae8tL7hZLrvSzfPY3icAhW6v6ISkIRTaGgt2ZRY9FZJ8uxclmk2jYHpFFQi19ar45eU3AD2SZoShVbs00Hr/zExE7wOCcmwYC+WCrCip8SS+61Q0aFMc19GQKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=designlinxhs.com; dmarc=pass action=none
 header.from=designlinxhs.com; dkim=pass header.d=designlinxhs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=designlinxhs.onmicrosoft.com; s=selector2-designlinxhs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wALNFooNaLjIksK+E6Cew0b/ku+hW0NxAmRQ7sGbNxs=;
 b=UsV91m/mrcHkyWXEbiD4kGHk6lIKGxUY3K3DVnsZLXzZu8UrXj37rBpN7mLHPLgdVWl+7yQYfstZmD83uW1qhDoMgucCnKZKTa/MXrJI0K5Y21jHapb70ImQEYjm0oIeH4JEJzB5YawXDpUMZeq81x1xDw8df1Ws2w4D140lldM=
Received: from BN8PR17MB3025.namprd17.prod.outlook.com (2603:10b6:408:5c::32)
 by BN6PR17MB1331.namprd17.prod.outlook.com (2603:10b6:404:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Wed, 22 Sep
 2021 16:26:56 +0000
Received: from BN8PR17MB3025.namprd17.prod.outlook.com
 ([fe80::1d3f:2873:aa1b:f1ca]) by BN8PR17MB3025.namprd17.prod.outlook.com
 ([fe80::1d3f:2873:aa1b:f1ca%5]) with mapi id 15.20.4544.015; Wed, 22 Sep 2021
 16:26:55 +0000
From:   Kenneth Sloat <ksloat@designlinxhs.com>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC:     Kenneth Sloat <ksloat@designlinxhs.com>
Subject: GPIO Bulk Request Problem
Thread-Topic: GPIO Bulk Request Problem
Thread-Index: AQHXr8YwOhjB6pVEIUqxM4+6LWyHdQ==
Date:   Wed, 22 Sep 2021 16:26:55 +0000
Message-ID: <BN8PR17MB3025D723599B15E5AFB208DAA1A29@BN8PR17MB3025.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 70edf17b-c4e0-7cbe-ee23-29919fc8e968
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=designlinxhs.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9feeb70-6f1b-436d-0318-08d97de5cb30
x-ms-traffictypediagnostic: BN6PR17MB1331:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR17MB13313E472BC750DEEBA13233A1A29@BN6PR17MB1331.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oRKUpwtnUDmrRSwm53c2EaXaOZd7hY4bMF7+o8ckKmxf6smcBGfjC7WlOTFzFxfFl6A7ogWB6gYrgICwAmsqD99NA1eQp2ys6EuuW267JOo6p4olZhH0diZKxfDmj9vSr1fsQLggQ074vs6NJlBPvsCnpOpzpPY/9RvH6xfhx8SMruLU32/GARF0axnVRkqxIcE4loxRHe87bis0AMc7go2i+LOUE+10KNwLwGA9xj/Sffw9j15s3beCaRBkP3Zr6LoMuO0XcHyA3h9BVFHNYTSb/jkiiyxaLs+JnUMu/hX9XBhx8L/s3yHE+OInzWU396cI6WSB2TjJNhXoA6LyMNPc7ox26zDZTFvtXn2JK/Yx0ByFeEAP2yAl6we8RKOhZKoyr5nHZ5lQm0uAHp9o+KL5ywyxrkf/0zN2k2/iGMuAX84BXmOQr/9JhJNBKlbWUc41hQxY8Z8pIMGlSsmx/a5owz4N3MJuT3LQFhuQM6yfLRTop05X06svnTh5BdbnUlLr7RQ0UAN1NbKRJMhozN1z1a+J3CxSuUstIcu27YugYe9Kyavsf966bIATJEm731uqnCLZLGjmSIVxNjuiJdATRUR/EW5DKiHZh7cSjEO5VzAdWfxtoXMsE+9d/tK9xL0GH5GarZ3MVIW82a570rDlxZrVUEMaU7Zcg3zC0XffWw7yjkhyhVeXJAyzDZaLSAPFQxG7/mSKAVisIUHsyw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR17MB3025.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(346002)(39830400003)(396003)(8676002)(4326008)(6916009)(2906002)(8936002)(316002)(508600001)(38100700002)(9686003)(55016002)(66446008)(7696005)(83380400001)(3480700007)(186003)(66556008)(71200400001)(122000001)(38070700005)(91956017)(52536014)(107886003)(76116006)(64756008)(6506007)(86362001)(26005)(66946007)(33656002)(5660300002)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1lkyoU3hkMrJrqFt+AEpucvCg8fiBYr6lXL7voiuntnPKn/tIQFeUGcryO?=
 =?iso-8859-1?Q?JvpjAdn0kYgUo1lU/5EMFTN3cd7Dpkrwf9r/2LbnooyHTwPNz2kI8Lp95l?=
 =?iso-8859-1?Q?2nnr7eZ7yhyAiyj6pWn4vVutNFd5TLM1W4f9MmVHBkoSfSVwzNzPl2+XqU?=
 =?iso-8859-1?Q?9K4Iw4ALE9oiMET+PYqq0cpFZaG+YN7z6shceKE/gEtXtIc1Kz+/xzFa1d?=
 =?iso-8859-1?Q?C7B+6H/5eFI6puBZCoAFUZMTgJ4FORgpgbotEs2vWx+/BnQT49zuWPdT7i?=
 =?iso-8859-1?Q?WcsWjXfWuZrarMvXWahH37kuGClXDqeGUAtFPXYKcFhL+pmxcr6PEY6736?=
 =?iso-8859-1?Q?VDVFeJFMbUt5yhI8yKthqAcfYL9ZivHqOA5u6AYTTVefcmpp2954I6uKvg?=
 =?iso-8859-1?Q?XpWz9jO5H9y0KYBHDrQ36n9TMGDVrptt4cbJ3BBhShXjsBSxfY1mYynZSy?=
 =?iso-8859-1?Q?v3mOLbgTLTsIJk+sgE9gWDwskOgynfv2uRglRbFo7Y5ldjQU5gHumSKfw2?=
 =?iso-8859-1?Q?IGjxSrle6x7Zj9XIB+dwQ+YAxYJhOxeAAA3QFO+Nah2cfcV9uxrt6FYxcV?=
 =?iso-8859-1?Q?bwlSlb0ewpvzafJeDTSQd9a0ZbJ5xH0D5w3joyhxGe6jSg5x+SSBCv73hJ?=
 =?iso-8859-1?Q?xwaUZQ0Doti/53tb8TTN6F2dXvo9/900yVGj7QNat96TpAoPrMbeMEIcFN?=
 =?iso-8859-1?Q?emQAXwTY2YFru9xw1EOa09B5KGIoQ9vTYI0gPczfNKmT7hCjFGuYOx3xYn?=
 =?iso-8859-1?Q?Sctty67hVPQCTWKmOYPSWzzP5e6s8YK4CRAZBj6KR220BisNTmBhP7hDfe?=
 =?iso-8859-1?Q?fYuPZ/ZLHaQ/Na4WWJydMRVhRa15ZaIlB15NHokdkIcPhCnWOGy6OYOiw7?=
 =?iso-8859-1?Q?fxTDmTlOmO6sarcRtFH9IL2aHCDkYY5g+a7YjAPqcUUwH7CLtCVSp9QD34?=
 =?iso-8859-1?Q?A4hPW1ppwAG18jMChv/3rXKhCbdBe5/u4egfcYSaiUgTlEWh6EJAa6dmd1?=
 =?iso-8859-1?Q?ITK6zheBBYjzDDVFrplFeMvnzpcTj1UtfhMVCtc1LhzQ4jvGidWxV9LioV?=
 =?iso-8859-1?Q?EJOVIvNP+5y4wTZvTKBha0dwz9/Vy76Jrufud7qJGUskol+eYh0E460xa8?=
 =?iso-8859-1?Q?pm7e42ZpodwCw04ZoerZvRj+/jvtqGxdd3H25L2Dv1Zn+QjuOSopwwGoYt?=
 =?iso-8859-1?Q?nmh8eCVSCWPsd7D0vEDpyYLWNyjFGskIePeRKXFUQh9m0fPFWmURa8cu6t?=
 =?iso-8859-1?Q?P4/QMmAiIo9MUks+gdj0bE7vpQ7wSmIIf1obiNZF3S489lJkvG9vhL6zU4?=
 =?iso-8859-1?Q?lTgDPycEKyXPmDlP+uiZmQazERTY/RqhRJfR/gXKDsmsmig=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: designlinxhs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR17MB3025.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9feeb70-6f1b-436d-0318-08d97de5cb30
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2021 16:26:55.7950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 21db78a4-85a8-43a2-9030-593b170ddfa9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: os7BoPHBHFeymIzOM6iV5bOfxQQPAkUSuROs6uIgNjeJZm1M+6ryN43DXQd8wY8cZaq4Dc6Enos8mq9WbV18Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR17MB1331
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,=0A=
=0A=
I am using libgpiod v1.4.1 and am having trouble using a bulk request of gp=
io lines as outputs from a chip. I am using the C++ bindings. I have confir=
med that I can individually request lines and set them as expected. However=
, if I use the bulk request, while I get the expected number of lines (and =
defaulted value is set correctly), iterating through them (with array opera=
tor in this case) and trying to set the values is not working as expected. =
I find that for every index/position, line 0 is the one being toggled.=0A=
=0A=
A simple example is below:=0A=
=0A=
    gpiod::chip *mychip;=0A=
=0A=
    mychip =3D new gpiod::chip("1");=0A=
=0A=
    gpiod::line_bulk lines =3D mychip->get_all_lines();=0A=
    lines.request({std::string("gpio-test"),=0A=
        gpiod::line_request::DIRECTION_OUTPUT, 0});=0A=
=0A=
    for (unsigned int i =3D 0; i < lines.size(); i++) {=0A=
        printf("Set line %d\n", i);=0A=
        lines[i].set_value(1);=0A=
        usleep(1000 * 1000);=0A=
        printf("Clear line %d\n", i);=0A=
        lines[i].set_value(0);=0A=
        usleep(1000 * 1000);=0A=
        printf("\n");=0A=
    }=0A=
=0A=
    return 0;=0A=
=0A=
Not sure if this is a usage problem on my part or an actual issue.=0A=
=0A=
Thanks=0A=
=0A=
Sincerely,=0A=
Ken Sloat=
