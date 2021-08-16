Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4255F3ED910
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Aug 2021 16:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbhHPOnj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 16 Aug 2021 10:43:39 -0400
Received: from mail-eopbgr1390083.outbound.protection.outlook.com ([40.107.139.83]:13952
        "EHLO IND01-BO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232183AbhHPOlU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Aug 2021 10:41:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfNjInkwbtw189gqVybocsatEXjESKzYs7ZCMNZHQogY3c5Md69jganePvTxc2rmjrkcdtdqnz3LLER3KBuAnAJykbXXWv6nsGyDqdHXfO9y91zbrxOrMP99XFKZRktWdbOL7ivf+4XqivoYrWhuGFE3v7Qp0j7REgKxu1QAXId5Lf2WG6lSLEYzsiv6SuzHGdy4eZ7eK4sQsP5NE5A/mi/SV4FUGqQ1Ohrze6Jx6D5IZXoEPQCkqWpB7FP8NiXtm+VJxmNRfSrDAWAeUKU8ESpcNOH4Y4JMBqGXUQCHcHEWQte+TsvCD8vyrh/OHhxGtL92ZuLWYQSmYM7GXR3bMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQGYpJlMUFyjlPs1Fr8XU2wtjDCmuf+PWmqhv3/YXfs=;
 b=H8Ir8Q0nOZwepw62nzHqtmAOssO/muXH5pSf2ix9byLitA41WEO9ExdDxaWe3hH5w2SSHB/wlgfPX6ID6VO0WkgODl3zk5bShdmrds6xSTntqAlQLUWq05VxQSQBBNlOq0mTFbOzO8lP1yBtUbU/hyH3Jsf2TUfS/itYH1XzTFsNROMGpYLsyI/pJQpMwEGv1d2CrMpFgABUP5dkdyPjvjKr+yiulpFHQJErOK78fGuL957dumuhg9ahvi7vV4VpSW1rL5onyXFv421PUNLOSonOHCLtJVZDrOW5JbXBjSdCO4YZ8IAOQSEnQj//QN/A7ZrjNJd8OZJNvOihSXt0dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspiredatatech.com; dmarc=pass action=none
 header.from=aspiredatatech.com; dkim=pass header.d=aspiredatatech.com;
 arc=none
Received: from MA1PR01MB4209.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:17::11)
 by MA1PR0101MB1287.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:26::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 16 Aug
 2021 14:39:31 +0000
Received: from MA1PR01MB4209.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::949c:c61c:7838:78ad]) by MA1PR01MB4209.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::949c:c61c:7838:78ad%6]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 14:39:31 +0000
From:   Jessie Parker <jessie.parker@aspiredatatech.com>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Data Records
Thread-Topic: Data Records
Thread-Index: AdeTBHmYycuooZalSNm2JMqF9L4z/A==
Date:   Mon, 16 Aug 2021 14:39:31 +0000
Message-ID: <MA1PR01MB42097B163D4EFD0DD07B124C91FD9@MA1PR01MB4209.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=aspiredatatech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0cc36e0-b6c6-4ed5-ef08-08d960c3a8ec
x-ms-traffictypediagnostic: MA1PR0101MB1287:
x-microsoft-antispam-prvs: <MA1PR0101MB1287E6D7CD24519EEB877AAB91FD9@MA1PR0101MB1287.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rmPoc2x1ja+ckPKs0xyDO2eHQOs85Glap+WfGvbCMd8sUbtOutYga7Z0dLDWcSJ7QmfAYdfHuXLCkby0uIvww5Pa8dg27FelVtQQEuc2iHkMfJaS4VwHQW25IWEvkuS8XOpAG2GIX967NmIl7CYGGNcjRRgQRSTOjRHpwtlQXBM907Cd1ILD6gbxo+luWUuw6X5YESB8oYi1nBisgDbH3eJOchRwb7BPMFGBDcjluKMn8DE8ZtY4Hm+0ubvRt/EOZ0glIWWWFNZkS+1bR2XPtWzO7MeiCCnuJoUxtGEclOVJaTe33cd7e8g+vGnmB0aJJds280OqnBA124iLiqCBci4CB/g8c532k79Zff09q16Z/MPpr5fwhugcZ89DnAqddCYVSpaH+FEOW+TSsmNtXJ45aLX13Z1/PscxvMiHbBDSM0lB/AZmYi+68HkfJE2eE9UuVFuqGa0d/eHCXAxYqN904EvnJBZTe65Phay1eITk5AirdClc4Ju/chEvvPpF19jNhflEtcL4fM4Xbx5uuKmk+8mgUbSZCUj5mmDrX8AoXCkTtg5rPVU1Zs/wJtk6377tvSvnt9moVl0xvzf2tVvutH5jUcUhTDbab5G2NpzS5igk9cula9jQGKw2XDBymbL0w03tBI2y9gSimMaHRNKygBWm+hqHow16al2rbT7Q0LnFmusUMp/7UoV7mbbxSOACSc2OGCqGw53Mi311q/z4Nlne6YC1sTOw6SWYYmk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB4209.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39840400004)(366004)(136003)(346002)(396003)(376002)(6916009)(8676002)(64756008)(66446008)(71200400001)(8936002)(86362001)(478600001)(66574015)(66476007)(66946007)(66556008)(76116006)(7116003)(5660300002)(52536014)(9686003)(55016002)(3480700007)(186003)(33656002)(38070700005)(122000001)(7696005)(26005)(2906002)(6506007)(316002)(38100700002)(44832011)(17020400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c1EqPjVgdsGaew0lSA22ncaKueEcCqsiK1RbDoZeeSjuNrUccDTRvJ6Uk7QR?=
 =?us-ascii?Q?FRi4ri6EQnNRIHRU8B7JMuYfqMAEItSTZS5Nm4yw8b2tGTg7SHb/voIgrxEx?=
 =?us-ascii?Q?dqTFW6Fmc3vhpP1gYOLfa/GBy6xrkIA5plYk3+pM+dmwEbRZE7RDRgO1zU1A?=
 =?us-ascii?Q?HbaRsDKY+Xsa6Srn3gKg7kPVHoLD2y44xAcWpai91We/ychwIoEU3cOG2/0R?=
 =?us-ascii?Q?9bmhLPtL+GpS8XQFc0gWPa0ZJkljcQjgKRwVYLIiIfLD6THWV6TOKOVmBib4?=
 =?us-ascii?Q?QBIvTeoUGeJ5fdB3Ytldl2d0Jpr87FIswNkxkHOQ4K6F6vhNePV32F3Wqtnl?=
 =?us-ascii?Q?IO/OJhdcx90+x9LAf71WevN6KMDGXdmq5a51AoYxgNNX/cJ1bVXuM2C2d97g?=
 =?us-ascii?Q?EAN5fd10Ly6B40paj/GWhWNHWNM0tBzntUDZ6NVZjrMXI8/bUP+DCWJGyY9M?=
 =?us-ascii?Q?9AGIqGVdI9lWk5mDkzcsE0cdQhym/znLrBWUPrMXe3sDG5bEEgIq4/nPiyzc?=
 =?us-ascii?Q?VbzMrLNF/Zuwh6V/3V/qoo1gIVx3MoA1R9pHJkFiUs9TCyH6aGiUqonrXOrc?=
 =?us-ascii?Q?gDUj8Q8hJa9X31Toic85mxQ4mtAVpg6fK7IgS1wNysJFXKi4/7QBlZ8q7Twu?=
 =?us-ascii?Q?JscWcFbQfgNxfFX8wsF6ZaOf4CvF1B3ZBfMTU63Xe9u47JFr7W+sC6nMjC6h?=
 =?us-ascii?Q?h5Lh7b6tGezxS4DFLy6nPblJeB2+PFXhL/3UGZgROKce+DcYclq2zX3r8mSJ?=
 =?us-ascii?Q?pw5mohpUFGnykdSChHhIkVWi9pgYzee97270b2/DpcHurYgWHDNeJB0h9viF?=
 =?us-ascii?Q?b5r8b3vcnq/4xwagzpUX8l3jmy/snCimDKAiPZwZC6FtCu7gTXSWCrG0AJhx?=
 =?us-ascii?Q?sluWvl7s7oRHFUFQMi9WsHw0I5f/730Jg5BFCNFfvNcxpZoHspa2zjMsYIg2?=
 =?us-ascii?Q?hEYzzLksa5EZzt0mXs19yXkgNl0VxPOXxPusx+VCt3U3dCj/GDtQ6sA9e6kf?=
 =?us-ascii?Q?HuLRr8GfS8vpYVhLRDsPQfeeY25kiZZD0pJtFOIOaKJdvMajvmQzrzcb9OCj?=
 =?us-ascii?Q?SR8P5l+sQ3ZgJ+S7URIIAxtHUQDRmeEUcYbeEdzLmnolWHCW3Yj/E41nuINV?=
 =?us-ascii?Q?btd2hc7y+VVTW/Y4typra47oajRmxsqLwA9RnrGTyNj4Cu/5ynzYdU+0NhmW?=
 =?us-ascii?Q?qqdGR6xiVemtVuPLNABfjj0VxgZhCVSqFtQolBWO1qRaHKJ9v+3EJY93m7sJ?=
 =?us-ascii?Q?jQn2XAvzZgENUNImxym+QOq1RJIbNuembU41h/QPa/h0QBQSvuumjBIL8ec0?=
 =?us-ascii?Q?9tQ=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: aspiredatatech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4209.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e0cc36e0-b6c6-4ed5-ef08-08d960c3a8ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2021 14:39:31.7609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ded1d0ac-4f91-4688-a87e-893bb8eed455
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iAq5URab3VGMrwfYAzfxIhEuTZbj3fmtoVWSmh6Z/4fxFmUO+uPUhlB/+DPqeCJ5KzswT8AmrtkzNUxHOzW5GT2khusy60A7BmUOszW3FjC4h2BHxOKkV8xkqtKcaV+F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR0101MB1287
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

How are you weathering through the virus? Hopefully, everyone is staying healthy! COVID-19 is changing the way businesses operate.  

We provide B2B contact lists as per your target profile. You can use these contact lists to do email as well as calling campaigns to reach decision-makers. I believe I could be of value to your business and would love to work with you.

I understand that this may not be a top priority during the health crisis, but I'd like to have an initial discussion to chat and understand your needs.

Please let me know your exact target industry, geography & job titles to reach, so that I will provide you counts, cost and more details.

Target Industry: - ________ (Any Industry)
Target Country/ State: - ________ (EX: APAC Countries, European Countries, North America Countries)
Target Job Title: - ___________EX: CEO, President, VP's, Managing Director, Director, Manager and many more.)

Thanks and looking forward to hear from you!

Jessie Parker
Marketing Dept

P.S.: If this email is unwelcome, I'd like to apologize. Please let me know with a reply of "UNSUBSCRIBE" & I won't email you again.
