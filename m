Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFE77104E7D
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 09:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfKUIzg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 03:55:36 -0500
Received: from mail-eopbgr770080.outbound.protection.outlook.com ([40.107.77.80]:36110
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726638AbfKUIzg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Nov 2019 03:55:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONPlZDWDRhq0jh9O7B/IVDkWUptaLDFHhdwls20ehNj+XgV/85+zRhuXBxnqrgFKOiY3yo8DJXW5qYL2VMU0/HXtUPAi5FHMWK+pxMrv9gnUVnIuaxuPHQEJwD7TA3jvot1pGdVw4JaWSkQwJSAn7x28l+bG12HfrdL1Xdzet8njNONM5cnNyn1Ov6dYZtFPzG7Wcy7JxYprSeKDcN7ATdnyg1H/wtI+Jjf/ebuXjJH3QHjFz8yTg44OHZy8i6tpfm82Re1vLiSuAoBrACvYZdIzp5I5yUQT29HKpcrdzb7wTTRiZ4i7vkQDUfXWWn2UOnBsYg0JH319LRdxRt9zeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAVKa0zjBWZxFHFMZKBdKN8C/5ulBPIDPIObfCgrHJw=;
 b=MvfmGDz83+LEoLA4YwTtSEonCfY4Ds753fmVFviJ37d2jzf/Abqsey9zExFmA9pjEwLZpShjiSK+38nKLO/MmIvHh3puh+BDGBDa2P8+5wkHVkeOZEPYRL54/cdcsYo++o0WVWTBRi9gEgb6TAOU4gt5qQm8C+0CGMAqyZfquO+S4q8tmcdn+bDTvglglIEomylgYkg6b5s+44WD75NxyW1ELvdLt7u+3K5aUO4pYviLmAmbvAijiA4BYCGExFJAVnupMLcb6+in0bRRO8nNOgbmSWcyvNw3SphfjgdM4L28h5VX1ZYzx3NuekWLCkpgBbODH85uXetXYMYkQASzfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAVKa0zjBWZxFHFMZKBdKN8C/5ulBPIDPIObfCgrHJw=;
 b=OL5zYrCNffk0NVbFCU+TpRWsvcV4f/o2X07zxFeVNQrcDlIW+ULtTtuOs8iQRggWt8tmrJCE7i8piPpzIeSL3Y5xIJdsm9uUrR2FUer9wVWdsLSEZGsHxY1ytsvuU27Cxg9QEeaDNCwxQqkMINkesmmkLlscGEyEa/IsadqkW3U=
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3605.namprd13.prod.outlook.com (52.132.246.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.10; Thu, 21 Nov 2019 08:55:32 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29%7]) with mapi id 15.20.2474.018; Thu, 21 Nov 2019
 08:55:32 +0000
From:   Yash Shah <yash.shah@sifive.com>
To:     Yash Shah <yash.shah@sifive.com>, Marc Zyngier <maz@kernel.org>
CC:     "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        Sachin Ghadi <sachin.ghadi@sifive.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v2 1/5] genirq: introduce irq_domain_translate_onecell
Thread-Topic: [PATCH v2 1/5] genirq: introduce irq_domain_translate_onecell
Thread-Index: AQHVn3AJHBiRD+wuIUSzxWzN0+e/fqeT3o6AgAFvDhCAAAVZ4A==
Date:   Thu, 21 Nov 2019 08:55:32 +0000
Message-ID: <CH2PR13MB336857C8AAC4CD3EB48942BF8C4E0@CH2PR13MB3368.namprd13.prod.outlook.com>
References: <1574233128-28114-1-git-send-email-yash.shah@sifive.com>
 <1574233128-28114-2-git-send-email-yash.shah@sifive.com>
 <5ec51559d8b4cd3b8e80943788b52926@www.loen.fr>
 <CH2PR13MB33682B1E7B40DC5C2FD1094C8C4E0@CH2PR13MB3368.namprd13.prod.outlook.com>
In-Reply-To: <CH2PR13MB33682B1E7B40DC5C2FD1094C8C4E0@CH2PR13MB3368.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
x-originating-ip: [114.143.65.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fff0939-69d7-4606-77a8-08d76e609130
x-ms-traffictypediagnostic: CH2PR13MB3605:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR13MB3605BEC9D615CA06DFA5AD5F8C4E0@CH2PR13MB3605.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(39830400003)(136003)(346002)(376002)(396003)(189003)(199004)(13464003)(11346002)(478600001)(316002)(64756008)(4326008)(52536014)(186003)(7736002)(44832011)(53546011)(6506007)(54906003)(8936002)(66066001)(6116002)(76176011)(3846002)(71200400001)(71190400001)(7696005)(7416002)(229853002)(9686003)(6436002)(256004)(55016002)(2940100002)(14444005)(81166006)(446003)(33656002)(74316002)(66556008)(66446008)(26005)(305945005)(102836004)(86362001)(2906002)(66476007)(66946007)(14454004)(76116006)(81156014)(4001150100001)(5660300002)(25786009)(8676002)(110136005)(6246003)(99286004);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3605;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PAdOZeeWIvWK8uJV+YBj0Z23NUBYQKkc7KJXQy1FNYwHRlNZlnbufB+RUTpCDW0n919OE9H2frwJtSLmSwWFc5ES1jH4YlByUGyCgH6Kl5UB9DBDKg/PrkNNvjWslz/iXZTC9RUVKIuwwRmFwM4KVj+ZubSnhImEPYGSJoDeBAE5nZiQTWfoZ+6BnzrGqqPFPFQXuaV5WDNJLVoVTNp+iV/YiWxEPNnTgEbXQIYfkW6ByauKkv+PNSgEg51jLHfawa5NfLNfRTRjKr6FcPw9sW4f9TRABfDOwl0TlqczlWY4HjPEyI3YC65IGzmzEX9HSk3UEqb/jRBc3qXmXXYaNLqSnK8zvCpx4CzUeeFmh4tR8sEqGEP87ao3BbE3YGSpCGIagvjPCFt1gw1IhFrcNV3Uvej8xn21nxy5GvlaO/qEzb2vQYcs/52cgwr1rpcz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fff0939-69d7-4606-77a8-08d76e609130
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 08:55:32.5824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9zJ+5owdRPhXLZWVHaEyJVjB9jpijVI6gJQCMSir0hZLqzdSIdY+h2oOT+JFTIjoU4qH0DV84m9Xg+Uz94kCyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3605
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



> -----Original Message-----
> From: linux-riscv <linux-riscv-bounces@lists.infradead.org> On Behalf Of
> Yash Shah
> Sent: 21 November 2019 14:06
> To: Marc Zyngier <maz@kernel.org>
> Cc: mark.rutland@arm.com; devicetree@vger.kernel.org;
> aou@eecs.berkeley.edu; jason@lakedaemon.net; atish.patra@wdc.com;
> Sachin Ghadi <sachin.ghadi@sifive.com>; linus.walleij@linaro.org; linux-
> kernel@vger.kernel.org; bgolaszewski@baylibre.com; robh+dt@kernel.org;
> palmer@dabbelt.com; Sagar Kadam <sagar.kadam@sifive.com>; linux-
> gpio@vger.kernel.org; Paul Walmsley ( Sifive) <paul.walmsley@sifive.com>;
> tglx@linutronix.de; bmeng.cn@gmail.com; linux-riscv@lists.infradead.org
> Subject: RE: [PATCH v2 1/5] genirq: introduce irq_domain_translate_onecel=
l
>=20
> > -----Original Message-----
> > From: Marc Zyngier <maz@kernel.org>
> > Sent: 20 November 2019 16:09
> > To: Yash Shah <yash.shah@sifive.com>
> > Cc: linus.walleij@linaro.org; bgolaszewski@baylibre.com;
> > robh+dt@kernel.org; mark.rutland@arm.com; palmer@dabbelt.com; Paul
> > Walmsley ( Sifive) <paul.walmsley@sifive.com>; aou@eecs.berkeley.edu;
> > tglx@linutronix.de; jason@lakedaemon.net; bmeng.cn@gmail.com;
> > atish.patra@wdc.com; Sagar Kadam <sagar.kadam@sifive.com>; linux-
> > gpio@vger.kernel.org; devicetree@vger.kernel.org; linux-
> > riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Sachin Ghadi
> > <sachin.ghadi@sifive.com>
> > Subject: Re: [PATCH v2 1/5] genirq: introduce
> > irq_domain_translate_onecell
> >
> > On 2019-11-20 06:59, Yash Shah wrote:
> > > Add a new function irq_domain_translate_onecell() that is to be used
> > > as the translate function in struct irq_domain_ops for the v2 IRQ API=
.
> > >
> > > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> [...]
> > >
> > >  /**
> > > + * irq_domain_translate_onecell() - Generic translate for direct
> > > + one
> > > cell
> > > + * bindings
> > > + *
> > > + * Device Tree IRQ specifier translation function which works with
> > > one cell
> >
> > nit: the whole point of the 'new' translate function is that they are
> > firmware-agnostic. Just drop the DT reference here.
>=20
> Ok sure.
>=20
> >
> > > + * bindings where the cell values map directly to the hwirq number.
> > > + */
> > > +int irq_domain_translate_onecell(struct irq_domain *d,
> > > +				 struct irq_fwspec *fwspec,
> > > +				 unsigned long *out_hwirq,
> > > +				 unsigned int *out_type)
> > > +{
> > > +	if (WARN_ON(fwspec->param_count < 1))
> > > +		return -EINVAL;
> > > +	*out_hwirq =3D fwspec->param[0];
> > > +	*out_type =3D IRQ_TYPE_NONE;
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(irq_domain_translate_onecell);
> > > +
> > > +/**
> > >   * irq_domain_translate_twocell() - Generic translate for direct
> > > two cell
> > >   * bindings
> > >   *
> >
> > Can you please also update (potentially in a separate patch) the
> > potential users of this? I mentioned the nvic driver last time...
> >
>=20
> Ok, I will separate out this patch from the patchset and send it individu=
ally
> along with potential users of it.
> Thanks for your comments

I am sorry, I think I misunderstood you.
You want me to send a new separate patch in which the potential users will =
be updated to this new function.
Hope I got it right?

- Yash=20
