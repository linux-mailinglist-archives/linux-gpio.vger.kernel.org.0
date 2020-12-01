Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 693042CA0E0
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 12:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730407AbgLALFQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 06:05:16 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:43870 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727591AbgLALFP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 06:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606820714; x=1638356714;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=4j83+Cmq11iXD7HQVZ0JujfSmDX6Ft1VnWfaagTo6Ec=;
  b=qLt7Xhv6plH4Uw2ZHqU2No2Kb3ZGeHFifbpWvTtFCMvQ6aBt6aGRHkfx
   S8bOiVfQmVIdzMxBqCPHiED9zdcezWh0qO569RoAl/tJECBWuki04MRPZ
   7WTzo3URq9yO7ri5RFI5BLHUQJQ8MGLoNggb7ClvNAuy54LrS9fe0kbGp
   dm0NhBGl5E+kPAMAYIwocoJAmPVfBL4ppgPYb5CsQdf0sIMdl5IiDS4sC
   INhm+SmBNKHYQJQeXdyjyDvGNxEyWT1pdyUuHdAp1aPqS7gwQmZ/V10gD
   8BtJMglgsRYxovYkgJNPTD+gcsO8RAXAeoNkq+jTCHeLltVePHvtXcqbc
   A==;
IronPort-SDR: H+oMrf7y62ipfxUWpzG48lasjE9nk2ZTeQBUy1ej4WFP8BmPyfqjPx0Fj5PrB9TGeMB/BW9Trn
 RG9en6AAXwpIU2pszclwLUSEKcuA5qwn99+yXcYrtHz+MDWg+1NL4dxgsQr9Ut018iJcURruNs
 Ambi+2m1BZ45RvAnGr4OctD3H3Mieni1TVH0FVZXtJOruGJuHozKq4ARKcrcdKfEoK8MKCTwRs
 y7Yaehou+A5fnv5V9DCmxf7x7DE/pZtMkyjZ8l47mA9cDftvWw70mepCS5tPZ1iR8JyhxMkX0x
 vZg=
X-IronPort-AV: E=Sophos;i="5.78,384,1599494400"; 
   d="scan'208";a="153844089"
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
  by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 19:04:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbH3ipD3APJR0XQvHdXQdBhMSXYT5jR0+IS8H3VtjAheXrmRkmto3mbH1MXSZ6UpU/Ay7glutzHM/8JdYrNSPomrvcEotZAbkFbUirKEjHeo4BfJKQp4Ld7CPDTgX09cALT33KZ8BVsnZVHSBv1Y+Edi1sxEY7KQVFILQJTlWzwnCrzwA8KnnH/s850wyyyfy8E23bpNXUlIdLz2WmA5UMIXLo4odkEGTqC+c31KlrTRe8/gfz+ue1ce2pdeA//L2JStZkMQ0rH835kMCRHGKRgttCX6Gs0KR+MWSKYnAociKjOkuz5PWGbKUrP5gB7h5DGa6POdJYeFi9dh3MHi+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymOz8FAmeBCTD12Lp1g1vaPEcbGNXCv5GjZ0lhFEP4E=;
 b=Jh01mqWunhwoZeL6Y1DjnlnFXPmiys65FXbh5J4gwnMcDKGM6ZM96DOQ5nUIrdwEnPMlro5//zR48IX3rJPaN0OvmL1w4SYOPgcBI5xWjPHTdVHGde+mDg/QAmjYyJv5G56PdSvOxD2TAblIC3KMIloEDHpUuoKYVl+HN8HmxX0bxqUqU+/7HC2Xdr4cIBgXXS1DbC5mcY5ksg53g+JJCREC7Ri6FOg353mdAybYU8Gc6hNuZw6wPlGcu1SSrKZ0qWigMmQRnGnaDQ2t5XhHC5Us5SajkdBDPgaVlbIVGnEOP3dp2T8K6NTlE3PE/9xpwDLKK5kHEZOACdFiXjW1GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymOz8FAmeBCTD12Lp1g1vaPEcbGNXCv5GjZ0lhFEP4E=;
 b=hqnbUZF+7Y3BXhRhyvxsEUUIfrBDKkWth5jjeEsuA4qRhNTJc2YAfDHmNBss+F1/KyIYSFpl+wV84btzwVBZB+tCKEi3phn9tQQEyOexvecjHQHyxPscMZUAryATWTHt3LglU4zjGfNMVXip8/a7YxmclSEhvNFMnmrpwmKKMZE=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6726.namprd04.prod.outlook.com (2603:10b6:610:95::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Tue, 1 Dec
 2020 11:04:07 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.022; Tue, 1 Dec 2020
 11:04:07 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH v3 12/21] riscv: Add Canaan Kendryte K210 FPIOA driver
Thread-Topic: [PATCH v3 12/21] riscv: Add Canaan Kendryte K210 FPIOA driver
Thread-Index: AQHWx3NiesBoMKrs8Em4U55+hJDq6w==
Date:   Tue, 1 Dec 2020 11:04:07 +0000
Message-ID: <CH2PR04MB6522D092596237344F30AADDE7F40@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201130234829.118298-1-damien.lemoal@wdc.com>
 <20201130234829.118298-13-damien.lemoal@wdc.com>
 <CAMuHMdX_HOQFm-9PXgsuOEK7BYu0B76CESkLmK4CH+qF_0T0yw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.182.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 466d9a9d-0661-4537-5c7c-08d895e8d2b2
x-ms-traffictypediagnostic: CH2PR04MB6726:
x-microsoft-antispam-prvs: <CH2PR04MB6726255576337C0EE8D7067BE7F40@CH2PR04MB6726.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6U/aZi1t4W0sI25vaezwSoogy2LBj/wCAU5flQaBqugydDGxK6wtc6KQNoS27a5hwAbTQ+Roj2m8qL0wl37bhPKk+7soAIE8y2Glf9yGxKA91mhuVYwxGCr/VO3muYDtSSDSoqiDFDmUVfvDZdlSO+H+SjaQs/1UtrePcioXXKC4Rbmlzn+vnlvreafEqieZzqTSeiusJp+9ObHH2So3C3Ul5r2uIzhB1pc6YPWLJYNaSV28/azrZXpUoUfgRR8NoRDfXtlAuD6ORVI+098Ix0nKv6VPoWyhjbHBYu7VO2zGz+PC8lgsS7Ib36E0aXbS8bm93v5KH/5Tda+TvK73LQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(9686003)(7416002)(55016002)(33656002)(71200400001)(86362001)(478600001)(7696005)(2906002)(54906003)(8676002)(5660300002)(4326008)(26005)(83380400001)(52536014)(66446008)(186003)(91956017)(6916009)(6506007)(76116006)(66476007)(8936002)(66556008)(316002)(53546011)(64756008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?5Hd53sP4Dy/opbbRkIItDe3+4PNEd86mLyN85HZHiJFYs/+EQG09eP7Bos4X?=
 =?us-ascii?Q?x8+ihhUHNzLWQ4bLxYh1qvqOMSEW91S95+MbwppaGFfUMaifEkjc5FSHFcqs?=
 =?us-ascii?Q?8mcBJV6VYwM+fiG/VphcdRlIuthwzHod6Z1ezix4QD2VHDf3HizpbM0rFFBx?=
 =?us-ascii?Q?mOxoe1QS5/EPECA5VlAInApsuGXf5uE9YbWNyfyinBVkLvnRH9a3HSZmqjWb?=
 =?us-ascii?Q?fN46rqb6+ZeBttqHST8076dEhFrbMdFUWDf3GY+hjx4e1sfIsDJkkSStH+lz?=
 =?us-ascii?Q?YFgG/1Bl2E6cVXCVELzvJy5Gth/KUjrJX78NqHZ6I5MoAKjwCsa8RU2jd8Oq?=
 =?us-ascii?Q?i9UpVepEj9vMJIhn3wbYul0qUPZrN82tiLH43yXc0kKuldoqme2NotrhJa0R?=
 =?us-ascii?Q?BDpN/Tbh8jHQlsxWdClvol8anNGWUENJiBrfsOwGaziGB333AagxYmoR9Pvm?=
 =?us-ascii?Q?8e44Gg1nOmtzjVo40fTZIRuyT8raBh6HltBjMWl85mBel0MsOYd6hugAcJY4?=
 =?us-ascii?Q?IDkCAoeNgJ51KvXwhgwJ2W4cRIhW0yLYz2VCHO0uuzT0OwR9GkbgxoFeq4xO?=
 =?us-ascii?Q?phHQfWqVgBQjoX8pZH6bSmiy+WPzPcf4LpH3ET8t0789OABz7WbXYvRCuWeL?=
 =?us-ascii?Q?UftFPDe9/m+GUy7DpLyF56byBccTyuPc0A9C66kunc53nxX01eiA96cjLEYW?=
 =?us-ascii?Q?reaPbZGbT91V0FO2Raavv+p3yTIpabi/+Tj+6GfDAAL77kaFQq49IyE3DWP8?=
 =?us-ascii?Q?IN4dLTKZScFdpRhGHdj7hz50FGOvqLTXH+OaHpcDElUdtW/rNQnrdQYqlMbE?=
 =?us-ascii?Q?v5hdVelYz1x10jZ8nIQpBYzcycXdDiE44HyFHnOK1BZ3Mo6Zz1vDhbqBilJH?=
 =?us-ascii?Q?11sroTyCeJ94kEUb+sguhZNT1kPuOokCv4bktklew03LOFZo5wGoVvPlSzbb?=
 =?us-ascii?Q?YN2fyp+WAkmSGr3GW5cvy39+l/nQsGdP88KXf22YYaCMbJQFnXiLhPk3GXif?=
 =?us-ascii?Q?XNJj?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 466d9a9d-0661-4537-5c7c-08d895e8d2b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 11:04:07.1516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RHeqPTeVuBnWW+C2bVIiyEHdJfRKCasjxaSqytJvufYgkRqfVjyFeXVMH9MpSk34CoJZ0NXv5jlxCPecZ5KisA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6726
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020/12/01 18:40, Geert Uytterhoeven wrote:=0A=
> Hi Damien,=0A=
> =0A=
> On Tue, Dec 1, 2020 at 12:50 AM Damien Le Moal <damien.lemoal@wdc.com> wr=
ote:=0A=
>> Add the pinctrl-k210.c pinctrl driver for the Canaan Kendryte K210=0A=
>> field programmable IO array (FPIOA) to allow configuring the SoC pin=0A=
>> functions. The K210 has 48 programmable pins which can take any of 256=
=0A=
>> possible functions.=0A=
>>=0A=
>> This patch is inspired from the k210 pinctrl driver for the u-boot=0A=
>> project and contains many direct contributions from Sean Anderson.=0A=
>>=0A=
>> The MAINTAINERS file is updated to list myself as maintainer of this new=
=0A=
>> driver.=0A=
>>=0A=
>> Signed-off-by: Sean Anderson <seanga2@gmail.com>=0A=
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>=0A=
> =0A=
> Thanks for your patch!=0A=
> =0A=
>> --- a/MAINTAINERS=0A=
>> +++ b/MAINTAINERS=0A=
>> @@ -3826,10 +3826,13 @@ CANAAN/KENDRYTE K210 RISC-V SOC SUPPORT=0A=
>>  M:     Damien Le Moal <damien.lemoal@wdc.com>=0A=
>>  L:     linux-riscv@lists.infradead.org=0A=
>>  L:     linux-clk@vger.kernel.org (clock driver)=0A=
>> +L:     linux-gpio@vger.kernel.org (pinctrl driver)=0A=
>>  S:     Maintained=0A=
>>  F:     Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml=0A=
>>  F:     Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml=0A=
>> +F:     Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml=
=0A=
>>  F:     drivers/clk/clk-k210.c=0A=
>> +F:     drivers/pinctrl/pinctrl-k210.c=0A=
>>  F:     drivers/soc/canaan/=0A=
>>  F:     include/soc/canaan/=0A=
> =0A=
> Please create separate sections for the clock and pinctrl drivers,=0A=
> to avoid all 3 mailing lists being suggested by get_maintainers for=0A=
> all changes to any of the file patterns.  People will blindly use the=0A=
> get_maintainers scripts' output.=0A=
=0A=
OK. Sending v4 with that fixed.=0A=
=0A=
Thanks !=0A=
=0A=
> =0A=
> Gr{oetje,eeting}s,=0A=
> =0A=
>                         Geert=0A=
> =0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
