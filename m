Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 313A55B070E
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Sep 2022 16:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiIGOfX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Sep 2022 10:35:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiIGOfW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2022 10:35:22 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A0284504F;
        Wed,  7 Sep 2022 07:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662561320; x=1694097320;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=M1NQvBSm5mzUxcz6PIzaWNtfJldro5TAD/kdICaQ3aA=;
  b=JorUEGBW+hMM5guU12AZOGr4CwPdYMUM4JtTvB6F0yZ3/ozdbYqxzNmD
   JmrBPadNHyIS74Fh6/HsWjiPhdwPEU/81tPLyMUSKZ7ZF7SYnYiwISYrD
   22hPQH9QTbEGkqkeLnkV+Qf/HgMtyZxFbGQX2rmCYJa0Kup9ZW9Igf3Oo
   HdZoyK9DZhndTUP0gWuv8WmBznRtkyc6XhN4qC8j8rTQQDRlkhwclAWnv
   zmklBSX18ULcvsogTDvW+L5ngzcth5L+BSTOtpp3lGPAwCZhcs1v/vyRs
   ikQsTpeHsmzVwAG3UYMVvlEz6YPOGFJRiTwQxWGP0S4pCOMZGrUDxVrjn
   w==;
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208";a="189812075"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 07:35:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 07:35:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 7 Sep 2022 07:35:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lK17+Uun5u6LhjWMgz1cwdLsdkT/M6uGhjutsYiY+G6UvjbG+9B1C7KDCli7Y/czedzkDJQYIG9R3zcNgp1/6ROpA2U/IFiix0Xw5P9EEh1VOlTI1YEeHtMs5McLGKWR+3fUa3wU95oHf9CWhpfCDwBroPE7mhysSJX8/roFOZ4p675x7NkEg70KfzNf0TUkDI7iB9p89Q1NVjE1KrCJPP2ZRCdx4Sm5Npy/KrYRyb00fweTcd35foGVI00zxYkGp5r9AjciJQe6x5C8zWfZdcPlplYK3nZIPQx9/XqryEvKgSCX3JWYuaxqqvzz1SSLp6eaAz91QfmYSPaZxpwQOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1NQvBSm5mzUxcz6PIzaWNtfJldro5TAD/kdICaQ3aA=;
 b=AxJeLTZH0HysLHSqmvOsxM9WrsdYJMFjO6QtryZekDzYfYWbfMIXBFPc8eJVwd2wdqP4IiUGYoUD0c3QoIxaLJma44MMX/tVPwGGqqKpIJP85Pep/w2WVh5SsJ4+w6+kVndxlklVZ6K2svNjwdfqxdQrDwaXG5JdIc4wXjSb7VFNJjTK16+FqJQWgz0pWsl3byVOE7JEsEmhEqHKE3uBFwdWisKr9UCfVn5o2jLyDKJIhewydF33b6RrAIyYpVX+c+B9plQFnYiHq6+XWMYzAxytc96gI48r/LNtoMH+UY2qu2xPw87J40dvcPce0xkxmsOknVAfjkdN5Gni+lJvog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1NQvBSm5mzUxcz6PIzaWNtfJldro5TAD/kdICaQ3aA=;
 b=AHsUFOHgiy8nWsDFfWrxZIYfTymHR4TrN8X83UP+BH5EBvP5kBOnMPHBuQskAJ2RKwom/W3b7Gh47culznYxPJi7BMQszPMOozel2p3uSvnoJvrgx/Q8dwkQi266lkUfVFQHXaGUFX0d5lrHUd7yAuPiEoSA9eTY/uSA1wOLyDs=
Received: from BN8PR11MB3668.namprd11.prod.outlook.com (2603:10b6:408:81::24)
 by BY5PR11MB3925.namprd11.prod.outlook.com (2603:10b6:a03:182::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Wed, 7 Sep
 2022 14:35:15 +0000
Received: from BN8PR11MB3668.namprd11.prod.outlook.com
 ([fe80::3198:2077:56c7:1780]) by BN8PR11MB3668.namprd11.prod.outlook.com
 ([fe80::3198:2077:56c7:1780%4]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 14:35:15 +0000
From:   <Kumaravel.Thiagarajan@microchip.com>
To:     <weiyongjun@huaweicloud.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC:     <weiyongjun1@huawei.com>, <linux-gpio@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH -next 5/5] misc: microchip: pci1xxxx: use
 module_auxiliary_driver
Thread-Topic: [PATCH -next 5/5] misc: microchip: pci1xxxx: use
 module_auxiliary_driver
Thread-Index: AQHYwpJFcj8rv3umvUO2Kgd27/1mVq3UB0og
Date:   Wed, 7 Sep 2022 14:35:14 +0000
Message-ID: <BN8PR11MB3668C4354AB9D0D1D608F0C6E9419@BN8PR11MB3668.namprd11.prod.outlook.com>
References: <20220907083435.1745393-1-weiyongjun@huaweicloud.com>
 <20220907083435.1745393-5-weiyongjun@huaweicloud.com>
In-Reply-To: <20220907083435.1745393-5-weiyongjun@huaweicloud.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR11MB3668:EE_|BY5PR11MB3925:EE_
x-ms-office365-filtering-correlation-id: bc419791-fb1d-44ae-9c19-08da90de2db8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3s34+64SystP8eCMvLcfItDsCrYy1MD19TsxN4jHI1tL6OkPqwHo84V8QcEZwD8ItOBU6F77Izf+oN3UKSDDf8V/OJAm4APd+FZgj9rQ0vLKSU8B5kmhC1dKNA2XbhIXKRwVx2K9ROWihuU2XYm/jyzKHuchLCTeJe8g/WShvXqbRLbQMTOgZefu+8+K6oMNZqDrBb4E0pKLtVfBiBalWK0smIziHFryM8t5mUfDDI/u2c9lx69WlK38QRvO1R0+LVzFEXj3vb/p/o8Mvr4i+1Fn+sQNRIXcxzX4VmIlS1GozyTFVguIcAczv1Jzi7uru/LWdSb8f1ozz2L6hEnafZVXqet49zeO7Q/gvjFM2pXw3Z6ILu0Xm+dE8g4RCaVDmTObNisJSMDGRHAlL8T995TvUNf8XUBZ7ZoSMPE3qiVuKEdd3wyG76Jo+AGUXR3hEx7rWq0WfR/Xkllm5xUVLHmcNAEJd2EYWS4GSh/G0N8D+h+ZU3IjHeYVYkpy1aWlxwIHwVc4ci90864sfRi4WUAbJ7xuho9rSaafAuJL7ncfdJgTDGsa1TcVLUtO8JQtbk1FvlThaXkzie1BgX9p2LQzeH2IWcDDBq2MW3u1fqVsQ0EDrCCuH7Aho9UEdf5CSJyG5VmAXu2oC5B6+e+I3OhykQ0J65TeiGWTtHgPIGKXPMmWfpGhz8h5c/cqX6ZEs6QMKLLckXulQU3DRX/+GvHFm+as4Fe2z9TdK+rJPMH9RU8fcEEcudlRfSbMzGPX7iqhYCwCuXFyx0WoR/XGkrO9/00Z6Y/Y3XCNiEwrS4LYB/aEFTi96XbdtjcYydYI+RM5ZvRhrBfRRDWbUog1oenM0csN6T61rpzEQKxUcrc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR11MB3668.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(396003)(136003)(376002)(346002)(26005)(7696005)(52536014)(478600001)(6506007)(71200400001)(66946007)(55016003)(64756008)(66446008)(66556008)(2906002)(4326008)(4744005)(38070700005)(33656002)(86362001)(316002)(53546011)(54906003)(9686003)(66476007)(76116006)(110136005)(41300700001)(122000001)(38100700002)(186003)(8676002)(5660300002)(83380400001)(8936002)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RFclbeIW+hHQzrRPxQUgsHcEnSW0WXVT+JBG57HzsP6mf0/U/0BumniH+DXK?=
 =?us-ascii?Q?5nVxPqy5OEC4ZuJc1eTDc9FP3nKqGxfaVoQbj0fqnMTMwzhxkdPXVPD8POwH?=
 =?us-ascii?Q?22qht4ZPoEphDJ2qPS4qApjCINt14C3zfoDcQT6oQ2pSo+i7GZ/+HX7L9nkS?=
 =?us-ascii?Q?9WWgsN57gyo4wWlICuNfGDbf7X1YCdJjzSibu7OVZSV9zdLDd8hirZWZoHyr?=
 =?us-ascii?Q?L1OL1WKoLd8JP4mdQWTSdFa6oZ88mJQrS3CEWFP8wwSKhLAKQsybjl9dCgxb?=
 =?us-ascii?Q?0H8Rl//YsyhCUfD2hj2K07Al7C8myrWG5jMoFnK+8Kq/bGO19yCoBSaAIw+I?=
 =?us-ascii?Q?d0G5xGZPyrs7qktAo5+fP6aWlqXdY7thEDd+95yMjYPimnW6oj1djqPZmgPp?=
 =?us-ascii?Q?Qmj/+wUE+qGnfrxhGAAQyovO0kATc2JZJZ+0nQ03i3YJPVNeJX3b759b7w/N?=
 =?us-ascii?Q?w5smfPTT3QFQ7JFnV1fctCPl1aUDUXSjchiIuJJLyBQcJedz9FAZW3+YnFBm?=
 =?us-ascii?Q?pUvH31F4lyvB+U9/l3p05miGxJhTlojKyauUuMcNiWxLtdmXlfhFaG96bXtZ?=
 =?us-ascii?Q?naTLGLJ3G1Lo7TKwfTh+lSV46CGoqtwJrPhLWVeewbTv9hmW749DJTNC/jzz?=
 =?us-ascii?Q?9mnJV20/NLzcBqEwZFMJFrW04tuvd28kfI1sO81drZ7GwPs6lKQpqlqOOE4z?=
 =?us-ascii?Q?7CgJnte305NBHOgytwIkiG0PK5F4DQEV80Vnjf771YqW8e6cYiEYUqcQ6YD7?=
 =?us-ascii?Q?A5v67Mkg3S1XNs87IeOGywXSBATwviXa3hjtC0oeSjTQWCmmKAoP+liCLsSf?=
 =?us-ascii?Q?CyS1LBuR/ZChBJrGD9P5GRDKWFlkgwBsNhO07ejEPEmIxqMdPyYP9QC5lEvd?=
 =?us-ascii?Q?nTvy04qCh6jyj2ih9jIMSTokuUCs3F/uJj+PrT4c8j0ma/9gVJnptM9hrzz4?=
 =?us-ascii?Q?rGqXNdU4GGSoa2WUNtg2cPIX0wQIH90Au+/r3iLaprqsG3BE/E+2So67axIA?=
 =?us-ascii?Q?/XCidZrSYHkVKYxw7LrAK3DjZkOKuCRIi0OukD2Pw5LR2WD4dZa950So6JyD?=
 =?us-ascii?Q?MdmufrPrRGNMv/CxstjMyxsNSStQfkCPRUi4sNkbDthr+Eroamx2VOKUa64G?=
 =?us-ascii?Q?qiyynLzYGVCW5hgNCU184jb9XqNK7GMvBanynPgTsypqwU178gH+VeCtEooL?=
 =?us-ascii?Q?1odtl7OnGTSSaHP2Hs8NvoN8e1P5JWwuKV18XPfnASq2G2du8utsV4vA2BDn?=
 =?us-ascii?Q?PJwAH/yxb5XBlnP8QEULpFqCghLOv+m2+PRuPoTfSkC87m7nbz6pqoJIy0lo?=
 =?us-ascii?Q?rkocygqyz1ftMHyKkGf/SSWLmb0a05FmngWUQHJKCG3dUBgVhl3nWMkB6XGx?=
 =?us-ascii?Q?pNiifUBKK11g5dzm526dMVwPfj4XEKrT43pxhSfcvlPIqaRq7isBRYZnsnMY?=
 =?us-ascii?Q?M85jgKxF6eo2tTufaS+KlWWblX07lLOorPYORQ2hgIgOZCUAUVozv1QYwCuv?=
 =?us-ascii?Q?6EVne1EVMrZ+93jJZ35arr1/fcF7SBVPHcJLv+xafFq9k5amwrYvcxgE+DBl?=
 =?us-ascii?Q?Xx4g5bROprpD+VkxX5y1gFHtdvqV6UuK4IXSKjCCQTtrWmhBFPlJQUh1Xt1C?=
 =?us-ascii?Q?g/kZRo9YtYcZHn1y1oaeUm0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3668.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc419791-fb1d-44ae-9c19-08da90de2db8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 14:35:14.9934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YHeX/etWldiezEBm+edcumlSe0BXnojzTbzvE5YwgmaoJBrJ6Yi8mzjnlyKrt2TCyP4xAi1BsCluarllnMap8uCIThwCmOgn3h4+dePtnPNB+TMW49oPXJy0rqy3Hf+C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3925
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
> Subject: [PATCH -next 5/5] misc: microchip: pci1xxxx: use
> module_auxiliary_driver
>=20
>=20
> Use the module_auxiliary_driver() macro to make the code simpler by
> eliminating module_init and module_exit calls.
I needed this during the experimentation stage. But now these functions onl=
y
do register and unregister. Hence, can be replaced with module_auxiliary_dr=
iver.
Thanks for your patch.
>=20
Add this tag -> Fixes: 7d3e4d807df2 ("misc: microchip: pci1xxxx: load gpio =
driver for the gpio controller auxiliary device enumerated by the auxiliary=
 bus driver.")?
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Thank You.

Regards,
Kumaravel
