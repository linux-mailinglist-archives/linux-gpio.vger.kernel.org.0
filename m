Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 070487E108D
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Nov 2023 18:56:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbjKDR4C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Nov 2023 13:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjKDR4B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 4 Nov 2023 13:56:01 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFEC1BF;
        Sat,  4 Nov 2023 10:55:56 -0700 (PDT)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20231104175551epoutp038dee6faf81e88a4de2fd866340b44704~UfSOVVy0k2540825408epoutp035;
        Sat,  4 Nov 2023 17:55:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20231104175551epoutp038dee6faf81e88a4de2fd866340b44704~UfSOVVy0k2540825408epoutp035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1699120551;
        bh=8SQFweZFT2qkQXT9SzdYwsQOMSumC6gbjgqHXBAgq3U=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=cMElj5nOb8jVxz0oaZTj41zLV++As1fsVl9/jpt4TtkhAFw3pwKsDifBrF5xpT8yu
         iK7SEHs6sh5ACGPiz9D00b9/F+SeOpqVhWemipCKq6BIHw2Y0SY6hmepp63GtCyMYL
         gw3pc8TCVPI6niWP4QryuXYdb+ya7T84ztSu/CfY=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTP id
        20231104175550epcas5p4b5b3366b81916f4715a0cf92fc30479e~UfSNv7cfm0577505775epcas5p4K;
        Sat,  4 Nov 2023 17:55:50 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.182]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4SN4z86Nrhz4x9Pp; Sat,  4 Nov
        2023 17:55:48 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        E8.77.09672.4A586456; Sun,  5 Nov 2023 02:55:48 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
        20231104175548epcas5p2864681cfefc5e51407be861e73bccd0e~UfSLjNoNh0403204032epcas5p2f;
        Sat,  4 Nov 2023 17:55:48 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20231104175548epsmtrp1cdc7a3d1732aae9c7d8f576c700ecad0~UfSLgvgc21119811198epsmtrp1k;
        Sat,  4 Nov 2023 17:55:48 +0000 (GMT)
X-AuditID: b6c32a4b-60bfd700000025c8-46-654685a4c4ac
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        89.E9.08755.3A586456; Sun,  5 Nov 2023 02:55:48 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20231104175543epsmtip2796d467482f93c7cb4325b0bf416726d~UfSHVXMog3243132431epsmtip2J;
        Sat,  4 Nov 2023 17:55:43 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Maksym Holovach'" <maksym.holovach.an.2022@lpnu.ua>,
        "'Peter Griffin'" <peter.griffin@linaro.org>
Cc:     <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <mturquette@baylibre.com>, <conor+dt@kernel.org>,
        <sboyd@kernel.org>, <tomasz.figa@gmail.com>,
        <s.nawrocki@samsung.com>, <linus.walleij@linaro.org>,
        <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <catalin.marinas@arm.com>, <will@kernel.org>, <arnd@arndb.de>,
        <olof@lixom.net>, <cw00.choi@samsung.com>,
        <tudor.ambarus@linaro.org>, <andre.draszik@linaro.org>,
        <semen.protsenko@linaro.org>, <saravanak@google.com>,
        <willmcvicker@google.com>, <soc@kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <kernel-team@android.com>, <linux-serial@vger.kernel.org>,
        "'MOHAMMED RAFIQ KAMAL BASHA'" <md.rafiq@samsung.com>
In-Reply-To: <c0b8f356-0f26-459d-850d-ec0fa1fd3987@linaro.org>
Subject: RE: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
Date:   Sat, 4 Nov 2023 23:25:42 +0530
Message-ID: <000001da0f48$24041440$6c0c3cc0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGPgbmEF6+ub3qtRjh359af8ajCkQMZWII3AhbeOfwCeEklngH5ou0XAhseapKwoZdPQA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfVRTZRzHe+7ddgfnzG6TDo8zcSw9JQqygPlgQEFANynOOvZC+UILbswj
        3I29ZFjnuFMiMHAIhinkQBDQHVIYLyEwLUTmG2aJAjpNBUTEN5D0qAPauFr897m/5/N9fs/v
        uefh48LjhIi/jtHRGkaRKuF5cpqOLnrNf29mLB3Ye8wPNdyq56CJwk4C3avKA6jGdgZDPeND
        XFTacYaLmn/1Qqab13BkG2kk0I/OagxZ+y9w0WjeFS6qL3UCtPOPwxg6XbGVQL0HDhNoYM9p
        DJ0r6sBQ56WtPPTnyRh0sucBD9XunOSgTFsHgY7ezuIiY/sED01eqOOgIZMr39/j5CFLi2u7
        sYtr0WZHCLKMTQHUPzyJv+1LNbU2cakacw2gnj4pBNS93kyCOlR8maDKrHrKasnhUY4LbTxq
        f00Nl6rfu4nqPv49l6o7cMZlPTIQlKnBAqgHVh/5i5+vD1PSimRaI6aZJFXyOiYlXBK3MvGd
        xBBZoNRfGoqWScSMIo0Ol0S/L/ePXZfqujSJ+GtFqt5Vkiu0WsnSiDCNSq+jxUqVVhcuodXJ
        qepgdYBWkabVMykBDK1bLg0MfCPEJX6xXnm7YQxX1676ZoejExhA90oj8OBDMhjabYUcI/Dk
        C8lWAM9da+ayH2MAOgxDmNsSkg8BPHpv/vOEacLMYyUbgEWjd57FbwJYMtVHuC0e6Q+bK7ZM
        W15kJYDn7SU89wJO9vGg2bbazR5kBKw8bJ1uMZtcDZ3GnVw3c8gFsPPUeY6bBWQotOw34yy/
        BE/sGuCw+yyGVXtGcPZIYvh4sGo660V+AjOdrTjreMPhYx2E+xCQNHnCs780EmwgGtYZ7/JY
        ng1v2Rue1UVwOH+Li/kupmC5U8SWlfBO9UHA8lvwt+6fOW4FJxfBgy1L2Vaz4NanAxibFMDs
        LULWXgh/uMtOAsm5sCA3l8syBScdf+HbgG/xjMGKZwxWPGOA4v+blQGOBcyh1dq0FFobog5i
        6A3//e8kVZoVTD8pv7hmcP3q/YB2gPFBO4B8XOIliIyLpoWCZEXGRlqjStToU2ltOwhx3XYB
        Lno5SeV6k4wuURocGhgsk8mCQ4NkUom3YCRzd7KQTFHo6PU0raY1z3MY30NkwFZ49O5eNpUb
        +8qRzHlXfC6mVb6pHRV8nGeIur+ibXV6lPL1Y2VXP/Oen9DYn1d3m1klgkkla778Z9+39ILl
        Mdv8ZvXqs4PMa3P/1nf0mdoc8QnlP3VtfqF0Ir3AT2HzjEnPD5tXfQhr/urUjizfruXyVbM2
        2FMCcoYYQ1PAYC3zZHhhemR2l+8Rp3jbB9vXPJpKnpRaChvyo3yS4iMzxNsrQh/n3P/03Q99
        NlYLWje9mhYmsCeY+uaWLxnk/J7fskQ354Zznxll+Zuun7wxFxNaTjSqxi+Hd+tHSgwrxqq9
        H0ZORTR3Mq3Gs4s375KV2r+L+Uj/HpTLM86PRxBFAT0bGp9eipdwtEqF1A/XaBX/AuDRBkDb
        BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0yTVxjHd957u6CvlIUzdW5WPzCUahccx8yRETf3TjfiMlITtgwa+gY6
        AUsLorsIwaEBbEO8DOmylotCeG2MFMUqwpJSEZipkzKKa8FxE7lsduK2dJQyaLeFb7/n+V+e
        8+EweKSVXMuoc/N5ba4yW0qJidZO6ctxF0r38Ns9HgxdnW4h0MLpLho9aTgFkKXdiSH3s0kS
        mR1OEtmuRyHD4xEctc9co9HZQCOGrGMDJPr91DCJWswBgM7f68DQ3Xo9jQYvd9BovPYuhlzn
        HBjq8ugpdL/3HdTrnqPQlfNBApW2O2jUOXuSROX2BQoFB5oJNGlYyo+5AxQSbi7VPf35U/S1
        dwcSni4CNDYVxN/ayLW2tZKcxWQB3PzfpwH3ZLCU5m4Yh2iuxlrAWYUyivMO3KK4JouF5Fou
        FHH93SUk13zZueT6q5jmDFcFwM1ZN+xfnSrepeKz1Yd57bbEdHGWvuaAZvG9I/77icXg4Rvl
        QMRANh4aFkxUORAzkWwbgM9aLVhYWAfdzZV0mCWwKThJh02PALxjKwHLAsXGQVv9iVA6ir0I
        oKHPiS8PODtPwcaHLuLfCAaPV54IdYnYRHixwxq6IWFT4W8/+ollJtjNsOuHn0Icwe6EQpMJ
        D/Ma2FM9Htrj7BY48WDif26oncHD73sF+icayGWOYhWwNNCGhz3RcOq2g64EEuOKKuOKKuOK
        KuOKSA0gBPAir9HlZObo5Bp5Ll8o0ylzdAW5mbKMQzlWEPpWsa/awHXBJ7MDjAF2ABlcGhWR
        tO9tPjJCpTz6Oa89lKYtyOZ1drCOIaTREdGP9apINlOZzx/keQ2v/U/FGNHaYqwhafBNT943
        W32Bwt7n+lV7bwnbHDeLLt046dpQldFVVii2aOJ2zo58pgYJX20q23ImLrk/RjbT8+exqdfM
        u4/65F886Jmru933qFHUnP68IrZiePaXPRnfKoJXXkKX1KOSs5iwj6s1mefk8WObJHnTmu4h
        +8cHUd0LQv+46Y5lpHvel1Iymjy+d0Eyba1O99cd/yMBejOHvPmpSY1uU/3rfR+setemIY8l
        SNaTq9Qin3n3os8RcH+S9uGvG2OOeNe4MhK+H/KMXiMkVfeKtuZ/5Co7sD7ekOw/nNKn0O/I
        Gp5k80Sre9K2f/dlaqWsOkXhfN9/pirYydAxFSoPrNglJXRZSnksrtUp/wH96bGHxQMAAA==
X-CMS-MailID: 20231104175548epcas5p2864681cfefc5e51407be861e73bccd0e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231103144922epcas5p2673f35f0742690827b0e974d674f44e0
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
        <3d489d6c-2098-4f0c-9ec4-f6040665753e@lpnu.ua>
        <CADrjBPp+fyNoPdix6=Wp4cDCRFq2Mui8NS6WENejcHn+H1M-jA@mail.gmail.com>
        <48e1c0bd-9518-4927-b490-f3206256bbd4@lpnu.ua>
        <CGME20231103144922epcas5p2673f35f0742690827b0e974d674f44e0@epcas5p2.samsung.com>
        <c0b8f356-0f26-459d-850d-ec0fa1fd3987@linaro.org>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Krzysztof

Thanks for CCing me to the tread, I have not yet looked into the patches (a=
s those never landed in my inbox).

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: Friday, November 3, 2023 8:19 PM
> To: Maksym Holovach <maksym.holovach.an.2022=40lpnu.ua>; Peter Griffin
> <peter.griffin=40linaro.org>
> Cc: robh+dt=40kernel.org; krzysztof.kozlowski+dt=40linaro.org;
> mturquette=40baylibre.com; conor+dt=40kernel.org; sboyd=40kernel.org;
> tomasz.figa=40gmail.com; s.nawrocki=40samsung.com; linus.walleij=40linaro=
.org;
> wim=40linux-watchdog.org; linux=40roeck-us.net; catalin.marinas=40arm.com=
;
> will=40kernel.org; arnd=40arndb.de; olof=40lixom.net; cw00.choi=40samsung=
.com;
> tudor.ambarus=40linaro.org; andre.draszik=40linaro.org;
> semen.protsenko=40linaro.org; saravanak=40google.com;
> willmcvicker=40google.com; soc=40kernel.org; devicetree=40vger.kernel.org=
;
> linux-arm-kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.o=
rg;
> linux-clk=40vger.kernel.org; linux-gpio=40vger.kernel.org; linux-
> watchdog=40vger.kernel.org; kernel-team=40android.com; linux-
> serial=40vger.kernel.org; Alim Akhtar <alim.akhtar=40samsung.com>
> Subject: Re: =5BPATCH v2 00/20=5D Add minimal Tensor/GS101 SoC support an=
d
> Oriole/Pixel6 board
>=20
> On 03/11/2023 14:56, Maksym Holovach wrote:
> > Hi Peter,
> >
> > On 11/3/23 15:11, Peter Griffin wrote:
> >> Hi Maksym,
> >>
> >> Thanks for your feedback.
> >>
> >> On Thu, 2 Nov 2023 at 22:32, Maksym Holovach
> >> <maksym.holovach.an.2022=40lpnu.ua> wrote:
> >>> Hi, all
> >>>
> >>> I wanted to inquire about how do you all feel about calling this SoC
> >>> by the Google =22gs101=22 name.
> >> Interesting question, I think calling it gs101 is the correct
> >> approach see below for my rationale.
> >>
> >>> I believe the proper name for it should be the actual Samsung name,
> >>> written in the silicon and reported in the Chip ID hardware: Exynos98=
45.
> >>> This also touches the Tensor G2 (Exynos9855), Tensor G3
> >>> (Exynos9865), and possibly the =22Tesla=22 SoCs.
> >>>
> >>> I do not think the Linux kernel should be a marketing material: it
> >>> should reflect reality. The chip is almost 100% composed of Samsung
> >>> Exynos IP blocks and should be called that way.
> >> As you alluded to Tesla fsd and Axis artpec8 SoCs are also based on
> >> Exynos designs and support upstream uses the axis,artpec8* or
> >> tesla,fsd* compatibles.
> >>
> >> So using google,gs101 is consistent with the existing upstream naming
> >> scheme, for customized ASICs that were based off a Exynos design. But
> >> it also reflects the reality that this SoC is not a Exynos9845 as
> >> there is also a lot of Google owned and other third party IP
> >> integrated that is not found in Exynos9845.
> >
> > A quick question: Do you imply Exynos9845 exists outside of the
> > context of Tensor G1? I used to believe Exynos9845 **is** Tensor G1.
> >
> > Also, what kind of Google IP are you talking about? I believe only the
> > neural accelerator should be custom-ish.
> >
> > Additionally, I believe it having or not having Google IP is irrelevant=
:
> > for example, the new Raspberry Pi 5 Broadcom SoC has a lot of
> > Raspberry's own IP, but it's still called Broadcom as it's the real
> > manufacturer and designer of the chip.
>=20
> That's a good argument. Indeed BCM2712 contains =22New Raspberry Pi-
> developed ISP=22.
> https://www.raspberrypi.com/documentation/computers/processors.html
>=20
> There aren't many patches but GPU is still called brcm,2712.
>=20
> For Tesla FSD, there was discussion and output was not very consisting.
> First, the name itself was used for everything - SoC architecture, one gi=
ven
> SoC and eventually the board.
> https://lore.kernel.org/all/5ab62673-8d46-ec1d-1c80-
> 696421ab69ca=40canonical.com/
>=20
> Eventually the last part - board - was renamed to =22Evaluation board=22,=
 but I
> don't know how true or real it is.
>=20
> See also:
> =22I would argue that if this SoC shares the pinctrl, clock, spi, adc, an=
d timer
> implementation with Exynos, we should consider it part of the Exynos
> family,=22
> https://lore.kernel.org/all/CAK8P3a31bCHNcNWrLX+QW+4RuK=3DDBpxLA_j5B
> FKxXxXKCT8PFQ=40mail.gmail.com/
>=20
> However it was also claimed:
>=20
> =22AFA architecture is concerns both Exynos and FSD has completely differ=
ent
> architecture (at least at HW level).=22
> https://lore.kernel.org/all/07ce01d8091e=249a6fd9c0=24cf4f8d40=24=40samsu=
ng.co
> m/
>=20
Yes it is, IMO SoC belongs to a =E2=80=9Cvendor=E2=80=9D.=20Just=20because=
=20it=20uses=20some=20common=20IPs,=0D=0Adoes=20not=20make=20it=20belong=20=
to=20the=20some=20base=20family=20(in=20this=20case=20Exynos).=0D=0AI=20hav=
e=20being=20working=20on=20Exynos=20since=20Exynos4=20days=0D=0A(and=20most=
=20of=20the=20Exynos=20series=20you=20have=20also=20worked=20on)=20and=20ma=
ny=20more=20=E2=80=9Cvendor=E2=80=9D=20specific=20SoC,=20like=20FSD=20etc.=
=0D=0AAnd=20you=20know,=20it=20is=20not=20the=20IPs=20which=20differentiate=
s=20SoC=20but=20it=20is=20SoC=20micro=20architecture=20which=20differentiat=
e=20various=20SoC=20and=0D=0Ahence=20should=20be=20considered=20as=20differ=
ent=20SoC.=0D=0A=0D=0A>=20>>=20I=20guess=20the=20same=20is=20also=20true=20=
for=20=60axis,artpec8=60=20and=20=60tesla,fsd=60=20SoCs.=0D=0A>=20>>=20IMO=
=20the=20SoC=20compatible=20string=20should=20be=20uniquely=20identifying=
=20the=0D=0A>=20>>=20actual=20SoC,=20not=20a=20close=20relative.=0D=0A>=20>=
>=0D=0A>=20>>=20Regarding=20product_id=20you=20are=20correct=20this=20reads=
=200x09845000=20but=20even=0D=0A>=20>>=20within=20Samsung=20Exynos=20family=
=20there=20are=20examples=20where=20the=20register=0D=0A>=20>>=20value=20do=
es=20not=20match=20the=20SoC=20compatible.=20For=20example=20Exynos850=20So=
C=0D=0A>=20>>=20has=20a=20product=20ID=20value=20of=20=22E3830=22.=20Where=
=20the=20Linux=20compatible=20is=0D=0A>=20>>=20matching=20the=20Samsung=20m=
arketing=20name,=20not=20the=20internal/outdated=20name.=0D=0A>=20>=0D=0A>=
=20>=20I=20did=20not=20know=20Exynos=20850=20is=20also=20not=20going=20unde=
r=20it's=20real=20name.=0D=0A>=20>=20Ultimately,=20I=20believe=20all=20of=
=20those=20SoCs=20should=20go=20under=20their=0D=0A>=20>=20technical=20name=
=20in=20the=20exynos/=20directory.=0D=0A>=20=0D=0A>=20The=20initial=20techn=
ical=20name=20does=20not=20exist=20outside=20of=20vendor=20sources=20and=20=
part=0D=0A>=20name.=20E.g.=20Winlink=20E850=20board=20hardware=20manual=20c=
alls=20it:=0D=0A>=20=22Samsung=20Exynos=20850,=20S5E3830=22=0D=0A>=20and=20=
everywhere=20else=20Exynos=20850=20SoC=20is=20used.=0D=0A>=20=0D=0A>=20If=
=20you=20start=20calling=20it=20Exynos=203830,=20only=20me=20and=20Sam=20(w=
ho=20mainlined=20it)=20would=0D=0A>=20know=20what=20is=20it.=20Everyone=20e=
lse,=20all=20users=20of=20kernel,=20would=20be=20confused.=0D=0A>=20=0D=0A>=
=20Therefore=20using=20well=20known=20final=20product=20name=20is=20for=20E=
xynos850=20reasonable.=0D=0A>=20=0D=0AYou=20are=20right,=20the=20final=20pr=
oduct=20name=20should=20be=20used,=20which=20is,=20in=20case=20of=20FSD=20i=
s=20FDS=20=5B1=5D=20and=20may=20be=20same=20is=20true=20for=20GS101=20(I=20=
am=20not=20sure=20about=20GS101=20though).=0D=0A=5B1=5D=20https://www.autop=
ilotreview.com/tesla-custom-ai-chips-hardware-3/=0D=0A=0D=0A>=20>=0D=0A>=20=
>=20Another=20concern=20is=20that=20Google=20could=20in=20the=20future=20li=
cense=20other=20SoC:=0D=0A>=20>=20be=20it=20Qualcomm,=20Nvidia=20or=20anyth=
ing.=20If=20we=20put=20completely=20different=20hw=0D=0A>=20>=20under=20goo=
gle/=20directory,=20does=20it=20really=20make=20sense?=20In=20that=20case,=
=0D=0A>=20>=20who'll=20maintain=20the=20google/=20directory?=20Exynos=20peo=
ple?=20Qualcomm=20people=0D=0A>=20>=20if=20they=20license=20it?=20Some=20ot=
her=20people?=0D=0A>=20=0D=0A>=20That's=20indeed=20a=20problem.=20Future=20=
Tesla=20SoC=20might=20have=20just=20few=20pieces=20similar=0D=0A>=20to=20FS=
D.=20There=20would=20be=20no=20common=20SoC=20part,=20except=20the=20actual=
=20Tesla=20IP.=0D=0A>=20=0D=0A>=20Same=20for=20Google.=20Future=20GSXXX,=20=
if=20done=20by=20Qualcomm,=20will=20be=20absolutely=0D=0A>=20different=20th=
an=20GS101=20and=20the=20only=20common=20part=20would=20be=20the=20TPU=20(T=
ensor).=0D=0A>=20=0D=0A>=20So=20now=20let's=20decide=20what=20is=20the=20co=
mmon=20denominator:=0D=0A>=201.=20Core=20SoC=20architecture,=20like=20buses=
,=20pinctrl,=20clocks,=20timers,=20serial,=20and=20many=20IP=0D=0A>=20block=
s,=20which=20constitute=2095%=20of=20Devicetree=20bindings=20and=20drivers,=
=202.=20The=20one,=0D=0A>=20big=20piece=20made=20by=20Samsung's=20customer:=
=20TPU,=20NPU=20or=20whatever.=0D=0A>=20=0D=0AJust=20to=20keep=20things=20s=
imple,=20IMO=20it=20should=20belong=20to=20=22vendor=22=20=0D=0Aas=20they=
=20are=20the=20one=20who=20has=20or=20knows=20the=20current=20and=20future=
=20uses/plans=20for=20SoC/SoCs.=0D=0ABecause=20an=20IP=20can=20be=20sourced=
=20from=20many/any=20IP=20vendors.=20=0D=0A=0D=0AAFA=20maintenance=20is=20c=
oncerns,=20people=20who=20is/are=20doing=20upstreaming=20does=20have=20an=
=20entry=20in=20the=20MAINTAINERS=20list=20for=20the=20SoC.=0D=0A=20=20=0D=
=0A>=20>=0D=0A>=20>=20Then,=20I=20don't=20think=20Tensor=20G3=20has=20a=20p=
roper=20=22GS=22=20name,=20it=20goes=20by=20=22Zuma=22=0D=0A>=20>=20in=20de=
compiled=20kernel=20modules=20as=20far=20as=20I=20see.=0D=0A>=20>=0D=0A>=20=
>=20Finally,=20Tesla=20people=20already=20tried=20to=20submit=20drivers=20c=
alled=20by=20Tesla=0D=0A>=20>=20name,=20but=20which=20basically=20copied=20=
the=20functionality=20of=20the=20Exynos=0D=0A>=20>=20drivers.=20We=20would=
=20want=20to=20avoid=20that,=20ideally.=0D=0A>=20>=0D=0A>=20>=20My=20opinio=
n=20is=20that=20all=20the=20Tesla=20and=20Google=20SoCs=20should=20be=20in=
=20the=0D=0A>=20>=20exynos/=20directory,=20not=20only=20because=20they=20ar=
e=20basically=20Samsung=20Exynos,=0D=0A>=20>=20but=20also=20because=20they=
=20don't=20really=20need=20a=20separate=20directory:=20neither=0D=0A>=20>=
=20Google=20nor=20Tesla=20didn't=20neither=20manufacture=20or=20design=20th=
ose=20SoCs=20from=0D=0A>=20>=20scratch.=20The=20only=20reason=20I=20can=20t=
hink=20of=20for=20them=20to=20have=20it=20in=20a=0D=0A>=20>=20separate=20di=
rectory=20is=20maybe=20because=20Google=20and=20Tesla=20actually=20paid=0D=
=0A>=20>=20Samsung=20money=20for=20the=20right=20to=20call=20Exynos=20=22Go=
ogle=20designed=22=20SoCs,=20but=0D=0A>=20>=20I=20believe=20the=20kernel=20=
should=20be=20left=20out=20of=20that.=0D=0A>=20=0D=0A>=20For=20some=20reaso=
n,=20although=20I=20know=20which,=20Cc-list=20is=20here=20trimmed=20and=20m=
isses=0D=0A>=20Alim...=0D=0A>=20=0D=0AThanks=20Again.=0D=0A=0D=0A>=20So=20s=
tandard=20reply=20follow=20(it=20makes=20me=20really,=20really=20grumpy,=20=
because=20it=20means=0D=0A>=20you=20develop=20on=20some=20crazy=20old=20ker=
nel=20or=20do=20not=20use=20tools=20which=20automate=0D=0A>=20the=20process=
):=0D=0A>=20=0D=0A>=20Please=20use=20scripts/get_maintainers.pl=20to=20get=
=20a=20list=20of=20necessary=20people=20and=0D=0A>=20lists=20to=20CC=20(and=
=20consider=20--no-git-fallback=20argument).=20It=20might=20happen,=20that=
=0D=0A>=20command=20when=20run=20on=20an=20older=20kernel,=20gives=20you=20=
outdated=20entries.=0D=0A>=20Therefore=20please=20be=20sure=20you=20base=20=
your=20patches=20on=20recent=20Linux=20kernel.=0D=0A>=20=0D=0A>=20Best=20re=
gards,=0D=0A>=20Krzysztof=0D=0A=0D=0A=0D=0A
