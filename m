Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71FDB5B04C9
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Sep 2022 15:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiIGNLK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Sep 2022 09:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiIGNLJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2022 09:11:09 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F57C6EF2D;
        Wed,  7 Sep 2022 06:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662556264; x=1694092264;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=I5lUDk9j5C+psEdV9UtA2gcCKiWCJFGHxzYKvNa0DII=;
  b=KsnMP6OlDZrKqdJFNvRdah++vgD0v9BuR8GL2I40Tam91Vfzrh2GttgB
   T0WoSnq/qWeWX5+el/25agcAd3nAtlAMDfvwBjEDWGLPHfIZS3RIHv+9Z
   egK/rW9FXWWKpBc0Fspb3eerTE3VHZ7ZU+LJuZeNNfn5IspX+Sl3LZXId
   I4SO/Cx9lqGEdTuCrjW20DWb3tpiewSGXkjqxyqUlql9FTTIua4AhK3qf
   RqpzavJVO5qEXkplMA8xhJDwdC5PFT5xMU+CPM3ttWbB/Lw6wRGl14w0e
   n68vxA6nFjW9Yzvxx/1avVQjjmIEXUKNE6E5BBzW2dHGCuXfCFOSSJFg6
   g==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; 
   d="scan'208";a="176011403"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 06:11:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 06:10:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 7 Sep 2022 06:10:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8jj/SA6ZTZhirnxy0LLsnocn+1pKbu3VE2/Ucp0YDe25WX7IKwlBFNEld0w96GxjeL5hIitDp90X89LhYrvOr65vqQ2Dz6qxLlmw5bnAYW/M6jjEGnifLaX9EDIXS8JUZykTv74iOPx4QZv3Hx9AofBDr+2QPdr9ku41F2v76OtpzmRMcs/EOjwoqVAQBpw1UZ7hpdWkcfGpQ5eNTtTIDPadDTqDd5BLKugS/mZ4DI1EJ6T+OPOCbNvTddebLFLS3L0xQk0kVSCtCFeS96IYnTup89G7Dx95V4xmbGdY9GtFvvgA7pbHLPVrJiMgRPm4CU0ENel3l4/dw+5EMLOzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LATRsLW4w5I7zbnlbKjKakrIqXN9uoUkNAdpHQXKtEM=;
 b=O6IhcX4rY5Sff0Ke2ucCZKhrAU8jx36ZMHuJfA7hZekcpQYc0NN86LVgF5E1k9txIlDmhZcZ6Mr0CGnN9+oPpvgiWWAEk7pnsVV8di5Jl3zp3VXQzNgykvSNS1JTPk5XYj65SrVN48vu/WMED9gt+O8g9ODz0nmNR0PspwBhY+KGhJUdv4+3y4C4rDBzRCTv+PB8oXFG22yCHEUNw0+4wku0DQ3412S/eyVp0KWnb5uZ6zCHM+6Re3E/0CHlUzOrKRDis9g7DVXjiv1X/R91YuAeDVr30T07XIIi1sxbMALLp2rfoHmupmOG9f38EcuUe/G0QH7sibpTi4rg6Bw2aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LATRsLW4w5I7zbnlbKjKakrIqXN9uoUkNAdpHQXKtEM=;
 b=Hc2xbWfeCZz+ntAK7cENMN5z98Tzm3xB4/RCnqE46nKiUTdcdkJ3SRLb/2W78MpAB5lJ5i9mAYpKOEgb9CgDt/Yc8hKig7QnKW2g5KVzncLtlBaI2bqPDN1/mgolYolI/V2NfFk1Nueu289fvJ39abmbtEXxVVCDIDz7Ub4w9mk=
Received: from BN8PR11MB3668.namprd11.prod.outlook.com (2603:10b6:408:81::24)
 by DM6PR11MB4675.namprd11.prod.outlook.com (2603:10b6:5:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 13:10:53 +0000
Received: from BN8PR11MB3668.namprd11.prod.outlook.com
 ([fe80::3198:2077:56c7:1780]) by BN8PR11MB3668.namprd11.prod.outlook.com
 ([fe80::3198:2077:56c7:1780%4]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 13:10:53 +0000
From:   <Kumaravel.Thiagarajan@microchip.com>
To:     <weiyongjun@huaweicloud.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC:     <weiyongjun1@huawei.com>, <linux-gpio@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH -next 2/5] misc: microchip: pci1xxxx: Fix missing
 spin_lock_init()
Thread-Topic: [PATCH -next 2/5] misc: microchip: pci1xxxx: Fix missing
 spin_lock_init()
Thread-Index: AQHYwpJFz8f4Vco+/06LoWPudXfW/a3T7R5A
Date:   Wed, 7 Sep 2022 13:10:53 +0000
Message-ID: <BN8PR11MB3668EB94BA86C0A674C84988E9419@BN8PR11MB3668.namprd11.prod.outlook.com>
References: <20220907083435.1745393-1-weiyongjun@huaweicloud.com>
 <20220907083435.1745393-2-weiyongjun@huaweicloud.com>
In-Reply-To: <20220907083435.1745393-2-weiyongjun@huaweicloud.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR11MB3668:EE_|DM6PR11MB4675:EE_
x-ms-office365-filtering-correlation-id: ce485077-ba58-429e-b6b2-08da90d2648f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lg9uson9HLytKpJNFa8n5iollsDq19UEHj5Pf8APWPN1f0GN754vEI/ezoBZfGY6PFy5CI6YV11O+q+xpglsVu7omQrmwpS6+YCqYIdQXXHBDkYcWByk6bG3jKnCa8HfH1rI3z1TQRs4SOTQnSuS5c0CAE3V1zuaQxpoFlkK0dqP6gkxZnlrD1ieqtTz++n19ZfPmWejaDYh2PIEIupJaAPCwkM3LmHcEFPSbvkhZrvyAtHiT7LJixbgu0BZSffw32e+sXHMk2ldU39/KJv2Vb5Am4ZgJJq6tGRG660KbfmzJ8WaieUzhjBK8KBlPg+QZJ12HEimx9xeY12zuytgU9aq+sMKgJMISJKlxPc9w1lJN36cN7pbYaOI21I/tSR7dSs/d5x0yx1RVZqCAbcWTDQmnfhyQdlRt05ufc5Z1zPVMHRR1W4jLCDBa5HfWkmuwQIl3g7u9DXhNeOY+WSWKZJrWYGDveeS3Lm+F5yArZuBfF5EZCc0zXX9uyIe6DVXIFeUluSIM+0HTWExRzEP0m2RZ3VAPDvxX0VB7GUGcZpHisbQRCQalfkzwRYEcGZCHk+TIjT5InOqUsG93CU0aqCFvzLGq78g3INdLBIE9eU8Ki+i/0LXG2nsZBezIxLwBpXVix8AhYBPV/oChLhRLNISSHEQsx3nICcGpHq1/WCTbMBMdTEl13lCNzcWmluTlamShKVie0v3j4xc2ODD8GoFOfegjhdI6p/yrEE9DM09rjovP+elPw/OPtj2GiFVpQOmqhUKqUetXDWJY3SjtfSL+6K9HCNlcKlewr6W9ipTMyhJPN88wOs2Li1E1ztuzvsLV7eeeWNEv+MHrNkRii0ZNYVtwrLKxYFmkcMQdy8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR11MB3668.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(396003)(136003)(39860400002)(366004)(66476007)(478600001)(66946007)(66446008)(64756008)(66556008)(76116006)(8676002)(4326008)(41300700001)(4744005)(5660300002)(52536014)(8936002)(2906002)(26005)(53546011)(6506007)(7696005)(55016003)(9686003)(38100700002)(33656002)(86362001)(110136005)(38070700005)(54906003)(83380400001)(186003)(71200400001)(122000001)(316002)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VB+tbQClcUJO2k7ahuS4I+L/ea4m9y00x8Wdh1fa7SBBg9CDI5AzLG5dkwUz?=
 =?us-ascii?Q?f7Lezk5lZNS/ZDES1S1nQPH6J2kTDdJ2B74aOq5g1X0xJExEJ3DZdpUA8KgM?=
 =?us-ascii?Q?lw6fYWHJNP8twzkAspOLlhUnrXXbs+Kzc5ZVRidbyQJI4UuzNhlv6fE+uADr?=
 =?us-ascii?Q?2C/XkA1rrK3N0lvwBnatGeoG72Uu1UDMY3UTkzvWjdYwRa2jg0VPmCFBYlQZ?=
 =?us-ascii?Q?s+sojs82pvH83naPwdP5OsUn8QV0hrgBiLXUInqwR7gQrkKh8HB4bUzreVoD?=
 =?us-ascii?Q?Z1cpmOm2apounS1Om7JQpCpJzeZCz6ULPCz1+cjVVOQMJPLig5YNAAHrczVI?=
 =?us-ascii?Q?/kufMRyHCLLNIA5uBlIm/1QznNuCKkkmYyNLYnMeG+N+Uf0obziiyPDo9H0g?=
 =?us-ascii?Q?dfXRg5tDeva3vc/Tv9V2vBRwpGDva4Mg/0l/z9DBM8KsYWLfEzA2E1/ZBxko?=
 =?us-ascii?Q?+DhltP+vt5R8mJ5U5BX49+sfBKWxbO+N2Ayw0s+yjkV0ZDfW5qgVq8EYHSTI?=
 =?us-ascii?Q?T59nhTWTYlLCpv1PXxVIPQIJXWJ365Gm3H1YR2QkBprkHD40fCooasgGNZmg?=
 =?us-ascii?Q?lgQ2gdXgAZR9eg3pt4jjOeTVCX67qbmHRhXT5+yBOcnhLdEfHzvuK2NMJr6f?=
 =?us-ascii?Q?xEvyfWMJE4ObOxO1LG6iVgTRjm+W/11MgmxIDaWBZ3gUC0wn67nEkc4VqUFJ?=
 =?us-ascii?Q?jT93qfMyDYvyWkAjnjeWsxoDh10ozT3S25fpqZuARySiNd9UBYaHVbquzrFw?=
 =?us-ascii?Q?uw9XFQ5qK3CNsW+8QAwExEQl6fjPCcTjnnkzo6/f5aXNCB1WvbijdmVCI8Sv?=
 =?us-ascii?Q?YwpD9tUDKw9/mZ3L56aF6oSaoj5uHpCEDtCYEbsZgawtZE9U9Quzg4a1tJ+/?=
 =?us-ascii?Q?Qeop5qB/ku8D9iy6eeC8kvUITW3bR/EzBsHFX9HP2x200pyxorHG4AqJgrzk?=
 =?us-ascii?Q?82JsX28POOTwkwXMBAIzEMcb2SeJj6hQTJ9HGSKWwz9fQA/D2aLkjLpcFZNN?=
 =?us-ascii?Q?LJot7gOAOvfC0o2CjYWXh6nT8/j1My6s5q4Zn6KsBDnWTT1yxY2Mid8SR+38?=
 =?us-ascii?Q?aRO53dumjpf1Nwx2DYJlT1xoUS24TRWu4WJ4FymAiJzmQKeCWElmsNvOUDIF?=
 =?us-ascii?Q?/UKBpaBlRk+0iPZ9pMlZQzq7wuM1n7YfAqva7YWhJRRaLBLjzMNwW8SHi0Vh?=
 =?us-ascii?Q?ZrQ6Bfiab8lrj012xm0QAT+kNODx+m71658/zXU07pAHXZm/qeHpiN99TuJl?=
 =?us-ascii?Q?OTBuWcE3Vqk7grnRSl9zTXyrCEyljMAs1jS9PiBRXa5LHrCL/HFX0MonTfkf?=
 =?us-ascii?Q?BeK1hZfLWXZw9owLj/9sWyK50mljkZcFEXMIKCQmDhKPcyzD/D851taDZ8Dt?=
 =?us-ascii?Q?3PRFCI21ezV9ftBBDhjj/JtnOVUnf23B7nzfynRf19JG0s0MOoMcEra/KSw1?=
 =?us-ascii?Q?us48e/lPauQcoG3NroFsRDd/hnXf+KSnyW5GjVZn1oAAVaJUFghtPuSB1q4C?=
 =?us-ascii?Q?ebLHXSGrzMNTON0zCapWHaY8JVYJn+4S3+tgSZFAGdxhO9DFdgAtfEOOORbt?=
 =?us-ascii?Q?ON6FkVGwnwFToQzqTnGb6l+jWJjwHmHjJP+3mwd/okZVMrEM7dY7K66AQbDA?=
 =?us-ascii?Q?2n3aIfrFe7Y/HRsWOTWmSFw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3668.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce485077-ba58-429e-b6b2-08da90d2648f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 13:10:53.0393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiTI5w/B1Ex+Ke9b95yC3OaWTtS6heHbucCg1wUQ5ebcOzGP4eb+zyQcWAU11Jd3l7vdfd/bo2P/I/kAvFoH+qbDrKqeqf+MPuuxAK7VmK6u8aXdEAhYYCM+g71n+PuX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4675
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> -----Original Message-----
> From: Wei Yongjun <weiyongjun@huaweicloud.com>
> Sent: Wednesday, September 7, 2022 2:05 PM
> To: Kumaravel Thiagarajan - I21417
> <Kumaravel.Thiagarajan@microchip.com>; Arnd Bergmann
> <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Wei Yongjun <weiyongjun1@huawei.com>; linux-gpio@vger.kernel.org;
> kernel-janitors@vger.kernel.org
> Subject: [PATCH -next 2/5] misc: microchip: pci1xxxx: Fix missing
> spin_lock_init()
>=20
>=20
> From: Wei Yongjun <weiyongjun1@huawei.com>
>=20
> The driver allocates the spinlock but not initialize it.
> Use spin_lock_init() on it to initialize it correctly.
Thanks for your patch ! This is required but I have missed this.
>=20
Add this tag -> Fixes: 7d3e4d807df2 ("misc: microchip: pci1xxxx: load gpio =
driver for the gpio controller auxiliary device enumerated by the auxiliary=
 bus driver.")?
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c | 1 +
>  1 file changed, 1 insertion(+)
>=20

Thank You.

Regards,
Kumaravel
