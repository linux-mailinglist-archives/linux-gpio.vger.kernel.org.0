Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0EF2AEC81
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 09:56:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgKKI4Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 03:56:25 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:7126 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725949AbgKKI4X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 03:56:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1605084983; x=1636620983;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=0Fl5dEctfRggBSnpE37XnUdwz+aa19lYrYYi310PNhI=;
  b=ABabwq8F0yt1cD6uMWhhrLvFvBxwnTCLCOSfw6BC4YLrxSY7aZDMWW3l
   tHM6XNzfH/amZRtKId5ChyWw/Rz0JbOUyxJk5HXk5bReNu3w4YT1G40kC
   jaWjhx7xv8cckHYxZ1hQnlT7B3pJdfxRXPMuPpC2jWh210wRYUm2LtTU6
   /JUF1kCe1b2CpuqUFIXcwyCjfCecjfAYjfJfsyOG6DfvjFI04uCv51n34
   FrKubnH2j42AxXqCP2AANNQ6y3kECrbISM4WQ9RY935WcZE2TID1xLIk0
   xhdkpi80faZ7ALlqa5kz693FKTTOxLAsqHxEm5Afk157z9tPFah/GqcYG
   w==;
IronPort-SDR: CuYPHbNyQY9bT/Q/XA4uFGxopAF+3zXNDG2LDouqegLOd4DOlm9Qb5EoeaF5VnVdse/i6UgJ1+
 DNRxrgKvBHEvHYn8XQFzDfHzxwRmtyN0cPZFZc0bqOLGrpiRsFy75G1M+q7+o0/vO9AXBTTS4F
 Pvt3t34JXQYTLaC1uwWTLyULjNlN+2yZS1RAXNxe45v8kJzH6JyFtyeMCkpZSir8hd5YTtstd1
 Q3SWJL3HjbB1hcYGcofR0hmNKtiunuAFjFCH4/OdiKhKIZV7ruWybuJIcb18/eZBXm8+37Eja+
 +BE=
X-IronPort-AV: E=Sophos;i="5.77,469,1596470400"; 
   d="scan'208";a="153566284"
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
  by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2020 16:56:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSykPv44KB9BZ7cjD6xh9GyrPOZ+43fndaoIaUvFk45gq4M6/NByrS/0RbetM5FGF7kD/AP9HdNNcWJUfnGKZMiqUevDLCU/eXbI7kZSD/BYsUZrcoVGy7NvCDuTZCy6jwKpd8j81+nYctzl97ij35igs4E0RGjBB1clT3L65c0P7q3IF+qH9nM2SZxXMAVmilBIdwwRgZqLgAC8nOsV0V7VNZeBGLiYGhBZIg1jYQ94eDMEKni9SqIb9ei/y+BApwqVCEeVIjVEWuPdYsmIzK6YAtheFtD/XMJsJSchdSOsV/Y+pa9gTTWh8OLwoFrv72+wYbkFNzcudYpIbC3cXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Fl5dEctfRggBSnpE37XnUdwz+aa19lYrYYi310PNhI=;
 b=IGMojWnivkObti94PUr++82O12totfl7DKmLgVuvHLTQvIo6NIbWA2IK8i1XRfnUl2jZ/Cip3N35rczegk+ISp2/dfzL8/gutmSh4oiIUMjBYMUpAan6a5RYVxFm3R2G2msmLrxV+oQMvBWackG4kqpGhs+5MxznftrzM49MXGsWaiDBnlDvJFLDoE4b5PQBakr7WRz0WWqYuhC50VzShFAHdtJ5v6QU3KmztPEHYGKDpkwELY/wMBKZ9zBcU8GNbbsrFm+R7JHCW636EDKGfs0G1bsKBz0BQJxokkbXav3U7pRK674gnDs3BwslA1hSUUh+5JOLAWsDSSu0tK2/zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Fl5dEctfRggBSnpE37XnUdwz+aa19lYrYYi310PNhI=;
 b=ZVt9VssYZ83XYqIcumXwaElfCR0oAnq1Iqh0RDf1Rhf+c3V69nV/nm1AFOrnfmH/lx/LcwjS6+hwkC8OzJSi0ti/02cakaosvov/O26rfXUBmDOp0fH46w0cky4S90S7ld7SB4GSN28KwZCgKpVdkeEuuaJjo8lO1r2H+DppbR8=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4849.namprd04.prod.outlook.com (2603:10b6:208:5d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Wed, 11 Nov
 2020 08:56:20 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.032; Wed, 11 Nov 2020
 08:56:20 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 09/32] riscv: Fix SiFive gpio probe
Thread-Topic: [PATCH 09/32] riscv: Fix SiFive gpio probe
Thread-Index: AQHWtN4SvWrZLi+A80GAPGjcz+Y8EA==
Date:   Wed, 11 Nov 2020 08:56:20 +0000
Message-ID: <BL0PR04MB65144640514294B91C07A9E0E7E80@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-10-damien.lemoal@wdc.com>
 <CACRpkda1Pd3hTiEHWDOAz3zCMA6WK4VmvjkNv0O_ckFaWQ-zSw@mail.gmail.com>
 <0fdee1f9986af095a3f7d329f8907cfbe49dd7c0.camel@wdc.com>
 <CACRpkdY1sgkhPfb+ci8oXqw0N7Gr+Pr_=3Auh-mH-8yWcOUR=Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:c005:87c5:ced7:ce31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e3f008cc-96ad-4ba5-c0cc-08d8861fa8d4
x-ms-traffictypediagnostic: BL0PR04MB4849:
x-microsoft-antispam-prvs: <BL0PR04MB48493FADB9B654B5CF877880E7E80@BL0PR04MB4849.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m3TV7oEj/QVqiDTDl6j532yWXz7iuW8qOXrcVecp2Qem+ooravlEdhZYtXO6IKU4yEkxDk5C28bR6XveCZY0j/rzFsr9DOX9nu/ih6QkFyuEAhk0JQRG7nlyBei1IfKrr5WCDViTtuhBWEcNRx5OZUeTf/3rX30NwQHSpU6651+rDuIXY5krxTxiKZjITTc6Lc0daFWKo2YVbwEuMHbb5JGX1F6DjPp5uZHQ23GoDsDhgiR630HR7e+4y/Fqh/pwPIGVd6RqChQFRc6vTf0pra+ooKrRAs6uR4MVG1eUoBw7Kkr7c7IGmIVM8cPIGjU+NoIMxtGdqOdZ30XBXxU0/A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(4326008)(71200400001)(2906002)(52536014)(86362001)(8936002)(186003)(54906003)(76116006)(6506007)(6916009)(66556008)(33656002)(53546011)(478600001)(8676002)(9686003)(66946007)(4744005)(64756008)(316002)(91956017)(66476007)(7696005)(55016002)(5660300002)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Mx4O9PvqqSORDDdBJvPqlMWFU8zqbM5uzi6udgSTvcM/FHyQmWgg8h6Uv9N+EUMxv+loIK+wsASfY99/QrYJ8zXGeLutqTdr1oAIuq4g5coG0nKsCzaHuK11BvSNodTGxPIOIfzUFooNO7EBSkMJpAfojD5i/Bjxhjory/XEobmYDHcZ64t6hFzHZord7w6s0cTpGnimLVhr6oHGY+VlYdy17TSUTEXvU87K5/UPjddPCwSxzutGz3mV1OPCgv37xPXP9F0HSqzvNofOwdGrtpuyHmzPDUE1rsZkH5GpsZjDYT++kGKcrX/BNl3Q8tO9l7GrSgc6MZhXyA2y6KJjGtmaPgxg/ifNlNYS5J6GFRkbQCHEcRrxpPhVyOijjWagoZAIviltFvLywl0/1TObYqYLQrmSbrs30Fqac3ImwVlk/vIjgw+g7fzaY/ybBP9ke1U+Jh0s96hEWevsQBkxvTCFQJQfjeNOtQWwfTwuCnptEzzkVqyUNXWXmwY34e6EVvLIMBuIwkATsC7LLTnyEOTaomtVhoPJwSaXr2YCE+lnoUewQWG7WY3mMsN4EQL5m9z8hivjP05zDwELSsUWiCtoYuJSKpTBAtj0CMlLzlprrk1NTjrXPZPm+yI+HtXRhNYOI8cxLAthJkZiWtLboWToumPjZw5KjqV6PWjvFQRWSYsihLt4uJyRMm5xZf2sV61FP0UrimrqiNAMWKw6iA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f008cc-96ad-4ba5-c0cc-08d8861fa8d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 08:56:20.6045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRCfsPxro3fxlbADjGUzcXEZ65VE+3kjYICFMiF+DEjHEOfb/q9RJvp76xdUu6Ntj6likFQBWIQFxathmqfXOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4849
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020/11/11 17:54, Linus Walleij wrote:=0A=
> On Wed, Nov 11, 2020 at 8:00 AM Damien Le Moal <Damien.LeMoal@wdc.com> wr=
ote:=0A=
> =0A=
>> I just realized that I forgot to add a Fixes and CC stable tags. The pat=
ch=0A=
>> should have:=0A=
>>=0A=
>> Fixes: 96868dce644d ("gpio/sifive: Add GPIO driver for SiFive SoCs")=0A=
>> Cc: stable@vger.kernel.org=0A=
>>=0A=
>> Do you want me to resend the patch with the added tags ?=0A=
> =0A=
> No I just moved the path to the fixes branch and added the tags.=0A=
> =0A=
> Yours,=0A=
> Linus Walleij=0A=
> =0A=
=0A=
Thanks !=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
