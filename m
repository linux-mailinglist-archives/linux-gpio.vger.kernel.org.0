Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0BA87E3458
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Nov 2023 04:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232973AbjKGDwc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Nov 2023 22:52:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233009AbjKGDw3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Nov 2023 22:52:29 -0500
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 265CBD57
        for <linux-gpio@vger.kernel.org>; Mon,  6 Nov 2023 19:52:21 -0800 (PST)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20231107035218epoutp03e49a827dc47ab78992af6117ab307303~VOtj72PSn0533305333epoutp03f
        for <linux-gpio@vger.kernel.org>; Tue,  7 Nov 2023 03:52:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20231107035218epoutp03e49a827dc47ab78992af6117ab307303~VOtj72PSn0533305333epoutp03f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1699329138;
        bh=UTH8SuUbQPHKLc2e7maM9wNCoInY5htpj08w74pBt8A=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=KSRTevWUjIXUcQqjOI8m2Npl+L3fJnQBa+8K85CR4pNeoy79da8qQqUYqN9Yn60/P
         TU3wjO9jwntAabTsWJvgYRJMgY4zEdcCBrQrOJuq/zB+rRRz4djT+dXUOLUiCbF1fM
         gwvJ/gA3yDRkHeP7dceTt+20fJpCwhw/DmD0ScYw=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTP id
        20231107035216epcas5p25c0b3f5c127f275f16161f71b79ed596~VOti_xYpV1433214332epcas5p22;
        Tue,  7 Nov 2023 03:52:16 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.178]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4SPZ6R33MHz4x9Q0; Tue,  7 Nov
        2023 03:52:15 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
        epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        7C.85.08567.F64B9456; Tue,  7 Nov 2023 12:52:15 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
        20231107035214epcas5p1e7979487e7406460d43ae4ef44790472~VOtg2Yo-N0876708767epcas5p1r;
        Tue,  7 Nov 2023 03:52:14 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231107035214epsmtrp2c910fad55ec81e7c26345a1e604e6d00~VOtg08-6h1894518945epsmtrp2J;
        Tue,  7 Nov 2023 03:52:14 +0000 (GMT)
X-AuditID: b6c32a44-3abff70000002177-59-6549b46f2a19
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        75.4A.08817.E64B9456; Tue,  7 Nov 2023 12:52:14 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20231107035210epsmtip1e85a1b9b4be95fe1118b9995f2f8e9ff~VOtcyc2tN0178001780epsmtip1D;
        Tue,  7 Nov 2023 03:52:10 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Peter Griffin'" <peter.griffin@linaro.org>,
        "'Maksym Holovach'" <maksym.holovach.an.2022@lpnu.ua>
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
        <kernel-team@android.com>, <linux-serial@vger.kernel.org>
In-Reply-To: <CADrjBPqB5MOQeMV6uSJHLVyMJYWm7Nm_1XGSq331gPRfO1jkzg@mail.gmail.com>
Subject: RE: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
Date:   Tue, 7 Nov 2023 09:22:08 +0530
Message-ID: <02fa01da112d$cb404bc0$61c0e340$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGPgbmEF6+ub3qtRjh359af8ajCkQMZWII3AhbeOfwCeEklngG7UdjkAXxQE1KwrFSicA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfVDTdRzH77ffnuACfg3ML6sQp+VhgVuw+cVzwiXgr9MKj6y7SmGx322T
        sc09KJjdBgnxoKgcdbTDAOGGjCGPAYKA8pBJC3ziQZC4gFIgJgLSpWO28cPiv9f3832/P0/f
        +zJRVguDzZQptIRaIZJz6O7Uhs6ALYHK+vcI7q0+L1g/XUeFy7k/MeAj0ykEWlp7KXBw8QEN
        Fnb10mBTow/Mefg7CvPsZRRYOzFAg49P/UaDdYV2BOb3tVGgteQ0Aw5damPAyWIrBd75tosC
        b/VEwp7BBTqszndQYVprFwN2/vUNDWZ1LNOhY6CGCh/kOK0Tg3Y6NDc7M80PH4In7/Ohef45
        AiemHGj4BryhpYGGW36wIPizp7kI/mgojYFfNo4y8KJaHV5rzqTj9weu0PFyi4WG15Xq8bs/
        p9Lwmku9TtXfBgaeU29G8IVav2ivTxN2SgmRmFD7E4p4pVimkAg5e2Nid8fyBVxeIC8Ubuf4
        K0SJhJATsS86MEomd66K439UJNc5Q9EijYazbddOtVKnJfylSo1WyCFUYrkqRBWkESVqdApJ
        kILQ7uBxue/wncK4BGlbZjVD5fgw6fbAEmpAqsOzEDcmwEJASVYK6mIW1oKA8ZEokucR0J0p
        yELcnbyEgAuWTOoLg/2MgUFetCKgbyaFQh4eOh1lNxkuFR0LBE0l6XQX+2AyUNhuRlyMYkV0
        UDJJc7Ebth8sT1pWsnpjnwN7Vv5KnIptBrOmeysteWCh4PHcyCq/DG58P0kl87wFTMUzKNmR
        P/jnD5PTy3TW+hikl7uTkvVgqrtrpVGAOdxATWnGqj4CpOYbKSR7g+nr9QyS2WDB1kp35QEY
        Di7Y2WRYCmbLqhCSw8DVuwVUlwTFAkBV8zaylCc4/WySQjo9QEY6i1S/Ab629a+u7VVwLjub
        RjIO/ux7jp5FNhrXzGVcM5dxzQDG/4sVIVQz4kuoNIkSIp6v4imIY/89drwysRZZ+UVbI5qQ
        oUJHUAdCYSIdCGCiHB+P5TCcYHmIRcnHCbUyVq2TE5oOhO9c9jmUvS5e6fyGCm0sLySUGyIQ
        CEJCgwU8znqPmbTzYhYmEWmJBIJQEeoXPgrTjW2gtO3Ty+OKv+pM+ihYL33iUKYtVm0fu7nO
        Nvw6GP8iION4GGdLywHfigp+/+4TzGNcpm95YPhnnqn694VVZwWjbnptNrd4rD041+EtP+jn
        6ItE36buztw1zP0lvZKpbmbdszVKl5PjqiOv73+3Iu+aRFeQcOOyISpcHPfJKzMNRwqmbqc8
        MV2sAtf2vPRlUV7/6OCPKRueshbGXjt4wPPO4aDzZ2I8T0SFfzdt67ES3rrIIzkx0iYZ0a6X
        8Lo5QovMbzZhrvToB3Np/Y2NldYdJ+mjSQtSgzVJX2ALMFUulS1u/tWycRyNO3wouZsdmXFV
        Wegl3LR3vNHqfiXM5yLrzZFNHKpGKuJtRdUa0b+dLcEazgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7bCSnG7eFs9Ug/l7ZC22vNrMYvF30jF2
        i/fLehgt1uw9x2Rx/ctzVov5R86xWuzYLmLR9+Ihs8WUP8uZLDY9vsZq8bHnHqvF5vl/GC1m
        nN/HZHFmcS+7xY11+9gtniw8w2RxeeoRJouLp1wtTl3/zGaxYcY/FovWvUfYLQ6/aWe16Dr0
        l83i37WNLBbP+4BaH1//w2axahfQpE+34ixa7pharPr0n9Hi8ct/zA7yHtt2b2P1WDNvDaPH
        71+TGD3e32hl99g56y67x4JNpR6bVnWyedy5tofNY+WaNawem5fUe1w50cTqsXHdOaCq7w3s
        Hn1bVjF6fN4kF8AfxWWTkpqTWZZapG+XwJVxfec9loI9/hXXFy5jbWA8Zt/FyMkhIWAi8ae/
        gb2LkYtDSGA3o8Tc+UdYIBLSEtc3TmCHsIUlVv57DlX0jFHi4++LzCAJNgFdiR2L29hAbBGB
        TIlDDbfZQIqYBQ6xSTxeuY0VouMnk8StTX/AOjgFAiX+PlkDtkJYIEri3YWfYDaLgIrE22U3
        wWp4BSwlPn64DWULSpyc+QSshllAW+Lpzadw9rKFr5khzlOQ+Pl0GdAyDqArwiTaVnJBlIhL
        vDx6hH0Co/AsJJNmIZk0C8mkWUhaFjCyrGKUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vOz93E
        CE5MWlo7GPes+qB3iJGJg/EQowQHs5II7197j1Qh3pTEyqrUovz4otKc1OJDjNIcLErivN9e
        96YICaQnlqRmp6YWpBbBZJk4OKUamC4F8YiZaf19MeOMQti+ngXiixKDv4TO29tbLig1tZHL
        SDNU15p3P/du3yMNImJ1qadnTarJy2HcrC7ioZVzk+fhKSeOvvzKOW1Tep+kzFnyrdrrQX3R
        o72i+enXGhhv3zvvv1/yzqSTk/s7WzY2nXd0crvBtv7l6qN11xmY+E9LHE8WyjD2WHdJuEd+
        8eVZ3zl95fYvbxFyS39ydBZbhoXLxcrHTs4l83VW3PgwTVbl3Cfj6r5ZC8U391a7+2q6y2Ss
        W8J25UktN7v7RfHF3v2VSalyAlE/00WEErusZv4v4ys0Yg7pTNn0Pu1qefPBzPrDClfLpG7K
        TT+8LTu5rclQ0Ed2Mpvb5r3sx4yUWIozEg21mIuKEwFXhNtmuwMAAA==
X-CMS-MailID: 20231107035214epcas5p1e7979487e7406460d43ae4ef44790472
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231106124623epcas5p20f05ced9527800166c35e9c5a19f4479
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
        <3d489d6c-2098-4f0c-9ec4-f6040665753e@lpnu.ua>
        <CADrjBPp+fyNoPdix6=Wp4cDCRFq2Mui8NS6WENejcHn+H1M-jA@mail.gmail.com>
        <48e1c0bd-9518-4927-b490-f3206256bbd4@lpnu.ua>
        <CGME20231106124623epcas5p20f05ced9527800166c35e9c5a19f4479@epcas5p2.samsung.com>
        <CADrjBPqB5MOQeMV6uSJHLVyMJYWm7Nm_1XGSq331gPRfO1jkzg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Peter

> -----Original Message-----
> From: Peter Griffin <peter.griffin=40linaro.org>
> Sent: Monday, November 6, 2023 6:16 PM
> To: Maksym Holovach <maksym.holovach.an.2022=40lpnu.ua>
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
> Hi Maksym,
>=20
> On Fri, 3 Nov 2023 at 13:56, Maksym Holovach
> <maksym.holovach.an.2022=40lpnu.ua> wrote:
> >
> > Hi Peter,
> >
> > On 11/3/23 15:11, Peter Griffin wrote:
> > > Hi Maksym,
> > >
> > > Thanks for your feedback.
> > >
> > > On Thu, 2 Nov 2023 at 22:32, Maksym Holovach
> > > <maksym.holovach.an.2022=40lpnu.ua> wrote:
> > >> Hi, all
> > >>
> > >> I wanted to inquire about how do you all feel about calling this
> > >> SoC by the Google =22gs101=22 name.
> > > Interesting question, I think calling it gs101 is the correct
> > > approach see below for my rationale.
> > >
> > >> I believe the proper name for it should be the actual Samsung name,
> > >> written in the silicon and reported in the Chip ID hardware: Exynos9=
845.
> > >> This also touches the Tensor G2 (Exynos9855), Tensor G3
> > >> (Exynos9865), and possibly the =22Tesla=22 SoCs.
>=20
> Also Exynos850 as I pointed out previously. I think that is the wrong app=
roach
> and very confusing. This SoC is not commonly known by anyone as
> Exynos9845.
>=20
> The same as the Exynos850 isn't known by anyone apart from Samsung folks
> as Exynos 3830, and the tesla fsd SoC isn't known by whatever internal
> Samsung name that presumably had.
>=20
> Maybe Alim can comment what tesla fsd SoC has in the product id register.
>=20
FSD does not contain chip_id IP found in Exynos series of SoCs. And it does=
 not follow chip ID naming convention like S5Exxxx etc.=20
Chip ID is vendor specific and its depends on SoC owner/vendor how and what=
 they want to embed for the chip identification.

> > >>
> > >> I do not think the Linux kernel should be a marketing material: it
> > >> should reflect reality. The chip is almost 100% composed of Samsung
> > >> Exynos IP blocks and should be called that way.
>=20
> Where does this 'almost 100%' number come from? Are you measuring the
> die area here or something else?
>=20
> > > As you alluded to Tesla fsd and Axis artpec8 SoCs are also based on
> > > Exynos designs and support upstream uses the axis,artpec8* or
> > > tesla,fsd* compatibles.
> > >
> > > So using google,gs101 is consistent with the existing upstream
> > > naming scheme, for customized ASICs that were based off a Exynos
> > > design. But it also reflects the reality that this SoC is not a
> > > Exynos9845 as there is also a lot of Google owned and other third
> > > party IP integrated that is not found in Exynos9845.
> >
> > A quick question: Do you imply Exynos9845 exists outside of the
> > context of Tensor G1? I used to believe Exynos9845 **is** Tensor G1.
>=20
> You are correct. William clarified that point for us. Thanks William=21
>=20
> >
> > Also, what kind of Google IP are you talking about? I believe only the
> > neural accelerator should be custom-ish.
>=20
> This should not be considered an exhaustive list, but whilst looking in t=
he
> downstream public drivers at least the following Google IPs in the SoC
>=20
> TPU/ML accelerator
> Bigocean av1 video accelerator
> Emerald hill compression engine
> Camera ISP blocks
> (AoC) Always on Compute
>=20
> Plus of course Arm IPs (CPU+GPU), Synopsis IPs (USB, PCI. phys) etc.
>=20
> The Exynos based IPs tend to be for things like pinmux, clocks, i2c, spi,=
 uart,
> mfc, display controller, timer etc.
>=20
> >
> > Additionally, I believe it having or not having Google IP is irrelevant=
:
> > for example, the new Raspberry Pi 5 Broadcom SoC has a lot of
> > Raspberry's own IP, but it's still called Broadcom as it's the real
> > manufacturer and designer of the chip.
>=20
> I think RPi / Broadcom is a very different situation to this. The origina=
l SoC in
> RPi 1 was wholly designed by Broadcom, and marketed as a Broadcom SoC
> =5B1=5D.
>=20
> Further iterations of the SoC until now have also not had RPi IP integrat=
ed.
> RPi themselves refer to them as =22Broadcom SoCs=22 on their webpage =5B2=
=5D, so it
> is completely expected that they live in a broadcom directory.
>=20
> BCM2717 has integrated the RPi ISP, but to all intents and purposes this =
is a
> Broadcom owned and designed SoC, albeit only now sold to one customer.
>=20
> =5B1=5D https://protect2.fireeye.com/v1/url?k=3Dda5b6ba0-bb20c137-da5ae0e=
f-
> 74fe4860001d-7fce4d4e8d7e8af0&q=3D1&e=3Db917214e-9ab0-44fd-9dce-
> aa4e41be3905&u=3Dhttps%3A%2F%2Fweb.archive.org%2Fweb%2F2012021508
> 0023%2Fhttps%3A%2F%2Fwww.broadcom.com%2Fproducts%2FBCM2835
> =5B2=5D
> https://www.raspberrypi.com/documentation/computers/processors.html
>=20
> > >
> > > I guess the same is also true for =60axis,artpec8=60 and =60tesla,fsd=
=60 SoCs.
> > > IMO the SoC compatible string should be uniquely identifying the
> > > actual SoC, not a close relative.
> > >
> > > Regarding product_id you are correct this reads 0x09845000 but even
> > > within Samsung Exynos family there are examples where the register
> > > value does not match the SoC compatible. For example Exynos850 SoC
> > > has a product ID value of =22E3830=22. Where the Linux compatible is
> > > matching the Samsung marketing name, not the internal/outdated name.
> >
> > I did not know Exynos 850 is also not going under it's real name.
>=20
> It is going by its real name :) just not by its internal name that nobody=
 has
> heard of.
>=20
> > Ultimately, I believe all of those SoCs should go under their
> > technical name in the exynos/ directory.
> >
> > Another concern is that Google could in the future license other SoC:
> > be it Qualcomm, Nvidia or anything. If we put completely different hw
> > under google/ directory, does it really make sense? In that case,
> > who'll maintain the google/ directory? Exynos people? Qualcomm people
> > if they license it? Some other people?
>=20
> I expect Google, or Google sponsored devs (as is the case for Linaro) to =
be
> helping maintain the Google SoCs upstream. See the MAINTAINERS entry for
> this series of who I expect to maintain this google directory.
>=20
> >
> > Then, I don't think Tensor G3 has a proper =22GS=22 name, it goes by =
=22Zuma=22
> > in decompiled kernel modules as far as I see.
>=20
> That is correct, it is named Zuma downstream and they did away with the
> gs101, gs201 type naming scheme.
>=20
> >
> > Finally, Tesla people already tried to submit drivers called by Tesla
> > name, but which basically copied the functionality of the Exynos
> > drivers. We would want to avoid that, ideally.
>=20
> As you can see from this series we are not proposing that. Any IPs that u=
se
> Exynos IP we are using the existing upstream driver and enhance it where
> we have features that aren't present upstream.
>=20
> >
> > My opinion is that all the Tesla and Google SoCs should be in the
> > exynos/ directory, not only because they are basically Samsung Exynos,
> > but also because they don't really need a separate directory: neither
> > Google nor Tesla didn't neither manufacture or design those SoCs from
> > scratch.
>=20
> Who manufactures it seems irrelevant. Qcom and Broadcom don't
> manufacture their SoCs either, but they still live in qcom and broadcom
> directories upstream. Whether they designed the SoC from scratch or not i=
s
> also IMO largely irrelevant. In many cases the upstream community has no
> way to determine whether things were outsourced or not anyway.
> Did Apple outsource things in their silicon design? Who knows, and why do
> we care? It's an apple branded chip in an apple branded product let's cal=
l the
> directory apple.
>=20
> Interestingly apple uses the same uart driver as Tensor, when I check bac=
k
> through the commits in the driver.
>=20
> fcbba344907afe26da487f1ed0b0e285c06a547b
>=20
> tty: serial: samsung_tty: Add support for Apple UARTs
>=20
> Apple SoCs are a distant descendant of Samsung designs and use yet
> another variant of their UART style, with different interrupt handling.
>=20
>=20
> > The only reason I can think of for them to have it in a separate
> > directory is maybe because Google and Tesla actually paid Samsung
> > money for the right to call Exynos =22Google designed=22 SoCs, but I
> > believe the kernel should be left out of that.
>=20
> Also the fact that they contain IPs not found in Samsung designed devices=
,
> aren't known to most people as Exynos, and the maintenance issues of
> having all the Google, Tesla, Axis, Exynos based SoCs in the same directo=
ry
> (and who knows how many other ASIC customers in the future).
>=20
> Ultimately it is Krzysztof's decision I think. I followed what he had pre=
viously
> accepted for other SoCs for consistency and also because it seemed like t=
he
> correct approach to help scale up and ease the maintenance burden. If I l=
ook
> at the number of tensor based SoCs, phones per SoC and board variants per
> phone model, then you end up having a lot of files in the exynos director=
y
> over time.
>=20
> regards,
>=20
> Peter

