Return-Path: <linux-gpio+bounces-12375-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F17B9B7C0E
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 14:46:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DB37281E89
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 13:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B201A0BC1;
	Thu, 31 Oct 2024 13:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="zLPDE7OO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB8C19E96B;
	Thu, 31 Oct 2024 13:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730382310; cv=none; b=qPOUTBvqp6AJhMxXyGmC1c4BlTsh7ifr/87ZklmdU5etnbxcyejFdivR62kymyin1aZNzCrlKvuKKu0BXeS9+CK8C/itFLN19IXS8Wpb8tnmykbu/whm7v6PQpcbL/whN/jfKqa23LKLV9BCGZjdS8hV45clsciZig491RRSNRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730382310; c=relaxed/simple;
	bh=WLpam1p9QTY+tyAwe9uGN5T/EjvkaTw8F5kbaZw9W6E=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W1LdGoqS1KaJu1DiTEnHSQWc9/7TPCPyj4j3AJyWGdesls7AdwdBzA6a6M7OARK4rq0K8JqL3roMak7ZJhidq0mCd0HCfQQoJDYG/DwVQ7S7DaqIZnpNfKu1niHL6TOo0virnixKY6Uv/MacDzznC+A9XmzN4ekWH95ElIQc98Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=zLPDE7OO; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VCSkg2000477;
	Thu, 31 Oct 2024 14:44:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	G0xq6I3sjzz91t2odTGsh/XAHWma7BPt/V2d6kS19z8=; b=zLPDE7OOvTFz7zKj
	mfnYxZX9RN1KgCj0upr9I3Kut1pLOr6bf2W916VyLxPZtJkh4MoM9zeKP/zAv/+7
	hOx6G5BCbZd+wh3Q0qzDVtD8957nGJbqE1qWMLesM5ldbnkl7WQjDab27IrNXy/I
	mkx1t0LJ47LhfditdSrgmPB7mFLAnzvDOPW9S2VgMvuGZCbYZudmP23cYUlFgpxr
	xa7cu5myHDUGoyx9aTOFonheG51Z/sJuzgr6wU4O8TSlyC31Thi8UOJ/Ft/adxYA
	occTk4WmRQq1ako7zjKoS9XW20vhESzHDQYXgKRVqfpCELQEqkOaCo5M18kt4g9d
	rWMO0Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42kgwbenvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 14:44:41 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 63B8340053;
	Thu, 31 Oct 2024 14:43:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D677E2721DF;
	Thu, 31 Oct 2024 14:42:39 +0100 (CET)
Received: from [192.168.8.15] (10.48.87.33) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 31 Oct
 2024 14:42:38 +0100
Message-ID: <df12289dc65c21496d4f9818a53d9797406e2663.camel@foss.st.com>
Subject: Re: [PATCH 07/14] dt-bindings: pinctrl: stm32: support IO
 synchronization parameters
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        =?ISO-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
        Stephane
 Danieau <stephane.danieau@foss.st.com>,
        Amelie Delaunay
	<amelie.delaunay@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Cheick Traore <cheick.traore@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
Date: Thu, 31 Oct 2024 14:42:35 +0100
In-Reply-To: <CACRpkdZKimfE_00kxa_qAf+jjwxBtuKizDTd3RvOS_PDuZ_JKg@mail.gmail.com>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
	 <20241022155658.1647350-8-antonio.borneo@foss.st.com>
	 <CACRpkdZKimfE_00kxa_qAf+jjwxBtuKizDTd3RvOS_PDuZ_JKg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

On Fri, 2024-10-25 at 00:38 +0200, Linus Walleij wrote:
> Hi Antonio/Fabien,
>=20
> thanks for your patch!
>=20
> On Tue, Oct 22, 2024 at 5:59=E2=80=AFPM Antonio Borneo
> <antonio.borneo@foss.st.com> wrote:
>=20
> > From: Fabien Dessenne <fabien.dessenne@foss.st.com>
> >=20
> > Support the following IO synchronization parameters:
> > - Delay (in ns)
> > - Delay path (input / output)
> > - Clock edge (single / double edge)
> > - Clock inversion
> > - Retiming
> >=20
> > Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> > Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> (...)
>=20
> I want to check if we already have some of these properties
> and if we don't, if they could and should be made generic,
> i.e. will we see more of them, also from other vendors?

Hi Linus,

Thanks for your review.

Apart for the generic property 'skew-delay' that you mentioned below, I can=
not find other I can re-use here.

I'm preparing a V2 taking care of the observation from Krzysztof and you.

I will surely take 'skew-delay' in place of 'st,io-delay'.

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st,io-delay-pat=
h:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 des=
cription: |
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 IO synchronization delay path location
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0: Delay switched into the output path
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 1: Delay switched into the input path
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $re=
f: /schemas/types.yaml#/definitions/uint32
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enu=
m: [0, 1]
>=20
> This looks related to the st,io-delay below so please keep those
> properties together.
>=20
> Is this path identification really needed in practice, isn't it
> implicit from other pin config properties if the pin is used as
> input or output, and in that case where the delay applies?
>=20
> Do you really have - in practice - pins that change between
> input and output and need different delays at runtime (i.e. not
> at startup)?
>=20
> Otherwise I would say that just checking if the line is in input
> or output from other properties should be enough to configure
> this? input-enable, output-enable to name the obvious.

On STM32MP25x there is a 'skew-delay' HW block on each pin, but it's applie=
d independently on each pin either only on the input direction OR only on t=
he output direction.
There is no automatic way to switch it between input and output path. This =
property assigns the delay to one path.
The generic property 'skew-delay' does not considers this case.

While I could extend the pinctrl driver to include the info about direction=
, that is trivial for example for UART or SPI, it will fail for bidirection=
al pins like I2C's SDA; some use case could
require the skew-delay on SDA input path, other on the output path.
Also the idea of assigning the direction at startup (e.g. in the bootloader=
) is not feasible as the delay depends on the functionality that can change=
 at runtime e.g. by loading modules.
I prefer having this "direction" path explicitly selected through a DT prop=
erty.

The existing properties 'input-enable' and=C2=A0'output-enable' are not spe=
cific for the skew-delay.
And I think it would be confusing having 'input-enable' or 'output-enable' =
associated with a bidirectional pins like I2C's SDA.

I propose to change it as, e.g.
  st,skew-delay-on-input:
    type: boolean
    description: |
      If this property is present, then skew-delay applies to input path on=
ly,
      otherwise it applies to output patch only.

Or, it could be a new generic property (keeping backward compatibility), e.=
g.:
  skew-delay-direction:
    enum [0, 1, 2]
    default: 0
    description: |
      0: skew-delay applies to both input and output path, or it switches a=
utomatically
         between the two direction
      1: skew-delay applies only to input path
      2: skew-delay applies only to output path

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st,io-clk-edge:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 des=
cription: |
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 IO synchronization clock edge
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0: Data single-edge (changing on rising or falling clock edge)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 1: Data double-edge (changing on both clock edges)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $re=
f: /schemas/types.yaml#/definitions/uint32
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enu=
m: [0, 1]
>=20
> This looks like it should be made into a generic property,

I believe it is too specific to ST implementation.
I see already some 'retime' mentioned in old ST bindings bindings/pinctrl/p=
inctrl-st.txt and bindings/net/sti-dwmac.txt, but the control looks quite d=
ifferent; I don't plan to reuse them.

I will fuse in V2 this property together with the next two in a more meanin=
gful one, partially acknowledging your proposal below.

> it seems to be about how the logic is used rather than something
> electronic but arguable fits in pin config.
>=20
> Isn't this usually called DDR (double data rate) in tech speak?
>=20
> What about a generic property "double-data-rate"?
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st,io-clk-type:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 des=
cription: |
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 IO synchronization clock inversion
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0: IO clocks not inverted. Data retimed to rising clock edge
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 1: IO clocks inverted. Data retimed to falling clock edge
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $re=
f: /schemas/types.yaml#/definitions/uint32
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enu=
m: [0, 1]
>=20
> Doesn't this require st,io-retime to be specified at the same time?
>=20
> Then we should add some YAML magic (if we can) to make sure
> that happens.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st,io-retime:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 des=
cription: |
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 IO synchronization data retime
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0: Data not synchronized or retimed on clock edges
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 1: Data retimed to either rising or falling clock edge
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $re=
f: /schemas/types.yaml#/definitions/uint32
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enu=
m: [0, 1]
>=20
> Can't these two be merged into one (generic) property:
>=20
> io-retime
>=20
> enum [0, 1, 2]
>=20
> 0=3Dnone
> 1=3Drising retime
> 2=3Dfalling retime
>=20
> Retiming seems like a very generic concept so I think it should
> be made into a generic property.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st,io-delay:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 des=
cription: |
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 IO synchronization delay applied to the input or output path
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0: No delay
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 1: Delay 0.30 ns
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 2: Delay 0.50 ns
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 3: Delay 0.75 ns
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 4: Delay 1.00 ns
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 5: Delay 1.25 ns
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 6: Delay 1.50 ns
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 7: Delay 1.75 ns
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 8: Delay 2.00 ns
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 9: Delay 2.25 ns
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 10: Delay 2.50 ns
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 11: Delay 2.75 ns
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 12: Delay 3.00 ns
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 13: Delay 3.25 ns
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $re=
f: /schemas/types.yaml#/definitions/uint32
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 min=
imum: 0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 max=
imum: 13
>=20
> This looks very similar to the existing "skew-delay" property:
>=20
> =C2=A0 skew-delay:
> =C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> =C2=A0=C2=A0=C2=A0 description:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this affects the expected clock skew on in=
put pins
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and the delay before latching a value to a=
n output
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pin. Typically indicates how many double-i=
nverters are
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 used to delay the signal.
>=20
> can't we just use that?
>=20
> Feel free to edit the text for it in
> Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> if that is too clock-specific.

I find that text already accurate; I don't plan to change it.
But adding a generic 'skew-delay-direction' could eventually require a ment=
ion in the description of 'skew-delay'.

Best Regards,
Antonio

