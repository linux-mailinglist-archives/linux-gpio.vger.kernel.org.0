Return-Path: <linux-gpio+bounces-1119-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1F180A250
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 12:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F28E91F2143C
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 11:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7041B29E;
	Fri,  8 Dec 2023 11:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W7pl2zU3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C4510F9
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 03:35:20 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-67a9be1407aso11155086d6.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 03:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702035319; x=1702640119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUV2gymsVRTUXmEES1qoIcu+UrHpB6U3bjKRN5uPogc=;
        b=W7pl2zU3uQGpW48sHXvMb8Ff7HNSdn4M2ypFwdnZVlTeGPdPxh53msLsZegf2nkrBx
         wPyN2tJRQWEGqZ/+E82C4deeC7O025AaRnrjKBdgNtQ1P4XWUiktMVvG0swQV1qJDNBC
         m8Qdv688qh1ZjcDOaYxzgeCEULzJHjiZZnrWjUfH95II+8OC6PLX+i1povMVt/nd8laW
         wAkbQagR6c0Pp2fgbk52rhdiKnXndfcYXQ5BsXRpoNd3+HE+Zzm5lH7nUeVFq6Bllhhp
         Mh0qpddpxSgwT2BUrR4F6W+NAfBW38adke/RmOntI7EngaQT1Vy7JyZhuqXOxDAOP26/
         QuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702035319; x=1702640119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUV2gymsVRTUXmEES1qoIcu+UrHpB6U3bjKRN5uPogc=;
        b=UWolrn/KZIUSm+/kWCIjkaV1WnLzBxoQr6E0V8Gw0x6uj6+TzWblyazdkyHiXgbTBc
         8NYMlB+RnXUagPeK5q3YkJyEyb5E8l2pbxYpeODccqaxLttgmINBNGjH3BnR7Fzv6rJT
         +hyWUBH10mELGRYaJIaYLvfy6AwnGkdoE2OQGfFRFZ73FJ0sB+NGaUYgsunZJRVuX1Xh
         h40y4Wn0Nc92yF1GF11vCkBbqT89EbG5kPUPu7Bl/vxk9SE9z9oYUyLotuFqrhT8PMpN
         dBCPB/RreZ2QT6n76XzF9YwbtZb2bb9ix6wuDszwGqKF6TJMwdAlj8K4UEZ3BfvOKoKD
         lbsQ==
X-Gm-Message-State: AOJu0Yxu2Tie6cdHERjlSzN7EWp2OcM6tvDwlKdDZraKh6VHzI2V7+f7
	jCMQuc34XnHMZxn6wwVtdXxs3rWYw0OtR9Iuz6St6w==
X-Google-Smtp-Source: AGHT+IEC6JdZ6U/gEesI+E7ZbvlG7lTwKLLiNtgy400dLC/RZUM/6b3j6Xea2JLJw6/USyS+V81pzcCJ0cSbyQMs0hA=
X-Received: by 2002:a05:6214:32c:b0:67a:a721:cae3 with SMTP id
 j12-20020a056214032c00b0067aa721cae3mr4135955qvu.68.1702035318988; Fri, 08
 Dec 2023 03:35:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-13-peter.griffin@linaro.org> <CAPLW+4nAwWBHkAe2Wg2b+URsgN8ienPh14L=Fu8PUxf4gxq0ow@mail.gmail.com>
In-Reply-To: <CAPLW+4nAwWBHkAe2Wg2b+URsgN8ienPh14L=Fu8PUxf4gxq0ow@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 Dec 2023 11:35:07 +0000
Message-ID: <CADrjBPqWHOn+oW=cueuOVKHD9ErAG-wo=0xUHU1wTorDdUuLxA@mail.gmail.com>
Subject: Re: [PATCH v5 12/20] clk: samsung: clk-gs101: Add cmu_top, cmu_misc
 and cmu_apm support
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,

Thanks for your review. I've trimmed the non relevant parts of the
email a bit at Krzysztofs request.

On Fri, 1 Dec 2023 at 22:40, Sam Protsenko <semen.protsenko@linaro.org> wro=
te:
>
> On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > cmu_top is the top level clock management unit which contains PLLs, mux=
es,
> > dividers and gates that feed the other clock management units.
> >
> > cmu_misc clocks IPs such as Watchdog and cmu_apm clocks ips part of the
> > APM module.
> >
> > Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> > Tested-by: Will McVicker <willmcvicker@google.com>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/clk/samsung/Makefile    |    1 +
> >  drivers/clk/samsung/clk-gs101.c | 2495 +++++++++++++++++++++++++++++++
> >  2 files changed, 2496 insertions(+)
> >  create mode 100644 drivers/clk/samsung/clk-gs101.c
> >
> > diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefil=
e
> > index ebbeacabe88f..3056944a5a54 100644
> > --- a/drivers/clk/samsung/Makefile
> > +++ b/drivers/clk/samsung/Makefile
> > @@ -21,6 +21,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK) +=3D clk-exynos=
7.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-exynos7885.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-exynos850.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-exynosautov9.o
> > +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-gs101.o
> >  obj-$(CONFIG_S3C64XX_COMMON_CLK)       +=3D clk-s3c64xx.o
> >  obj-$(CONFIG_S5PV210_COMMON_CLK)       +=3D clk-s5pv210.o clk-s5pv210-=
audss.o
> >  obj-$(CONFIG_TESLA_FSD_COMMON_CLK)     +=3D clk-fsd.o
> > diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-=
gs101.c
> > new file mode 100644
> > index 000000000000..6bd233a7ab63
> > --- /dev/null
> > +++ b/drivers/clk/samsung/clk-gs101.c
> > @@ -0,0 +1,2495 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2023 Linaro Ltd.
> > + * Author: Peter Griffin <peter.griffin@linaro.org>
> > + *
> > + * Common Clock Framework support for GS101.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <dt-bindings/clock/google,gs101.h>
> > +
> > +#include "clk.h"
> > +#include "clk-exynos-arm64.h"
> > +
> > +/* NOTE: Must be equal to the last clock ID increased by one */
> > +#define TOP_NR_CLK     (CLK_GOUT_TPU_UART + 1)
> > +#define APM_NR_CLK     (CLK_APM_PLL_DIV16_APM + 1)
> > +#define MISC_NR_CLK    (CLK_GOUT_MISC_XIU_D_MISC_IPCLKPORT_ACLK + 1)
> > +
>
> Suggest using CLKS_NR_* naming, to follow other drivers for consistency.

Will fix

>
> > +/* ---- CMU_TOP ------------------------------------------------------=
------- */
> > +
> > +/* Register Offset definitions for CMU_TOP (0x1e080000) */
> > +
> > +#define PLL_LOCKTIME_PLL_SHARED0                       0x0000
> > +#define PLL_LOCKTIME_PLL_SHARED1                       0x0004
> > +#define PLL_LOCKTIME_PLL_SHARED2                       0x0008
> > +#define PLL_LOCKTIME_PLL_SHARED3                       0x000c
<cut>
> > +       DIV(CLK_DOUT_MFC_MFC, "dout_cmu_mfc_mfc", "gout_cmu_mfc_mfc",
> > +           CLK_CON_DIV_CLKCMU_MFC_MFC, 0, 4),
> > +       DIV(CLK_DOUT_MIF_BUSP, "dout_cmu_mif_busp", "gout_cmu_mif_busp"=
,
> > +           CLK_CON_DIV_CLKCMU_MIF_BUSP, 0, 4),
> > +       DIV(CLK_DOUT_MISC_BUS, "dout_cmu_misc_bus", "gout_cmu_misc_bus"=
,
> > +           CLK_CON_DIV_CLKCMU_MISC_BUS, 0, 4),
> > +       DIV(CLK_DOUT_MISC_SSS, "dout_cmu_misc_sss", "gout_cmu_misc_sss"=
,
> > +           CLK_CON_DIV_CLKCMU_MISC_SSS, 0, 4),
> > +       /* CLK_CON_DIV_CLKCMU_OTP lower bits reserved*/
>
> Why the above clock where bits are reserved is declared, but this one
> is not? Also, above comment is marked as TODO, but this one is not.
> And there is no space before */.

Good spot! These two dividers with reserved lower bits should be fixed
factor clocks. I've fixed in v6.

>
> > +       DIV(CLK_DOUT_PDP_BUS, "dout_cmu_pdp_bus", "gout_cmu_pdp_bus",
> > +           CLK_CON_DIV_CLKCMU_PDP_BUS, 0, 4),
> > +       DIV(CLK_DOUT_PDP_VRA, "dout_cmu_pdp_vra", "gout_cmu_pdp_vra",
> > +           CLK_CON_DIV_CLKCMU_PDP_VRA, 0, 4),
> > +       DIV(CLK_DOUT_PERIC0_BUS, "dout_cmu_peric0_bus", "gout_cmu_peric=
0_bus",
> > +           CLK_CON_DIV_CLKCMU_PERIC0_BUS, 0, 4),
<cut>
> > +       DIV(CLK_DOUT_SHARED1_DIV2, "dout_shared1_div2", "mout_shared1_p=
ll",
> > +           CLK_CON_DIV_PLL_SHARED1_DIV2, 0, 1),
> > +       DIV(CLK_DOUT_SHARED1_DIV3, "dout_shared1_div3", "mout_shared1_p=
ll",
> > +           CLK_CON_DIV_PLL_SHARED1_DIV3, 0, 2),
> > +       DIV(CLK_DOUT_SHARED1_DIV4, "dout_shared1_div4", "mout_shared1_p=
ll",
> > +           CLK_CON_DIV_PLL_SHARED1_DIV4, 0, 1),
> > +       DIV(CLK_DOUT_SHARED2_DIV2, "dout_shared2_div2", "mout_shared2_p=
ll",
> > +           CLK_CON_DIV_PLL_SHARED2_DIV2, 0, 1),
> > +       DIV(CLK_DOUT_SHARED3_DIV2, "dout_shared3_div2", "mout_shared3_p=
ll",
> > +           CLK_CON_DIV_PLL_SHARED3_DIV2, 0, 1),
> > +};
> > +
> > +static const struct samsung_gate_clock cmu_top_gate_clks[] __initconst=
 =3D {
> > +       GATE(CLK_GOUT_BUS0_BOOST, "gout_cmu_bus0_boost", "mout_cmu_boos=
t_option1",
>
> Please stick to 80 characters length, here and below.

Will fix.

>
> > +            CLK_CON_GAT_CLKCMU_BUS0_BOOST, 21, 0, 0),
> > +       GATE(CLK_GOUT_BUS1_BOOST, "gout_cmu_bus1_boost", "mout_cmu_boos=
t_option1",
> > +            CLK_CON_GAT_CLKCMU_BUS1_BOOST, 21, 0, 0),
> > +       GATE(CLK_GOUT_BUS2_BOOST, "gout_cmu_bus2_boost", "mout_cmu_boos=
t_option1",
> > +            CLK_CON_GAT_CLKCMU_BUS2_BOOST, 21, 0, 0),
> > +       GATE(CLK_GOUT_CORE_BOOST, "gout_cmu_core_boost", "mout_cmu_boos=
t_option1",
> > +            CLK_CON_GAT_CLKCMU_CORE_BOOST, 21, 0, 0),

> > +static void __init gs101_cmu_top_init(struct device_node *np)
> > +{
> > +       exynos_arm64_register_cmu(NULL, np, &top_cmu_info);
> > +}
> > +
> > +/* Register CMU_TOP early, as it's a dependency for other early domain=
s */
> > +CLK_OF_DECLARE(gs101_cmu_top, "google,gs101-cmu-top",
> > +              gs101_cmu_top_init);
> > +
> > +/* ---- CMU_APM ------------------------------------------------------=
------- */
>
> Suggest adding an empty line here.

Will fix

>
> > +/* Register Offset definitions for CMU_APM (0x17400000) */
> > +#define APM_CMU_APM_CONTROLLER_OPTION                                 =
                 0x0800
> > +#define CLKOUT_CON_BLK_APM_CMU_APM_CLKOUT0                            =
                 0x0810
> > +#define CLK_CON_MUX_MUX_CLKCMU_APM_FUNC                               =
                         0x1000
> > +#define CLK_CON_MUX_MUX_CLKCMU_APM_FUNCSRC                            =
                 0x1004
> > +#define CLK_CON_DIV_DIV_CLK_APM_BOOST                                 =
                 0x1800
> > +#define CLK_CON_DIV_DIV_CLK_APM_USI0_UART                             =
                 0x1804
> > +#define CLK_CON_DIV_DIV_CLK_APM_USI0_USI                              =
                 0x1808
> > +#define CLK_CON_DIV_DIV_CLK_APM_USI1_UART                             =
                 0x180c
> > +#define CLK_CON_GAT_CLK_BLK_APM_UID_APM_CMU_APM_IPCLKPORT_PCLK        =
                 0x2000
> > +#define CLK_CON_GAT_CLK_BUS0_BOOST_OPTION1                            =
                 0x2004
> > +#define CLK_CON_GAT_CLK_CMU_BOOST_OPTION1                             =
                 0x2008
> > +#define CLK_CON_GAT_CLK_CORE_BOOST_OPTION1                            =
                 0x200c
<cut>
> > +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SPEEDY_APM_IPCLKPORT_PCLK        =
                 0x20a8
> > +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SPEEDY_SUB_APM_IPCLKPORT_PCLK    =
                 0x20ac
> > +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_D_APM_IPCLKPORT_ACLK        =
                 0x20b0
> > +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_D_APM_IPCLKPORT_PCLK        =
                 0x20b4
> > +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_ACLK    =
                 0x20b8
> > +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_PCLK    =
                 0x20bc
> > +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SS_DBGCORE_IPCLKPORT_SS_DBGCORE_I=
PCLKPORT_HCLK    0x20c0
>
> As I understand, all those parts like IPCLKPORT, BLK, UID (RSTNSYNC
> probably too) -- they don't really mean anything in the context of the
> driver, just noise. And if you remove those -- there won't be any
> conflicts with other names, because those bits are not the unique
> parts. Following the TRM letter for letter in this case just makes
> things extremely long without adding any value IMHO. For example, that
> name above might be:
>
>     CLK_CON_GAT_GOUT_APM_SS_DBGCORE_SS_DBGCORE_HCLK
>
> or even
>
>     CLK_CON_GAT_GOUT_APM_SS_DBGCORE_HCLK
>
> would be fine.
>
> In clk-exynos850 driver I removed all those parts, because they make
> it pretty much impossible to read both the driver and dts. And yeah,
> because those names consequenty lead to very long string names, dts
> will be hard to read too, which is even worse. But again, that's only
> my IMHO.

I would like to keep the register names unmodified, as I mentioned
previously mangling them makes checking with the datasheet much
harder. As the name in the header and string are already mangled a bit
I'm OK with mangling that a bit more.

With that in mind I've done the following mangling in v6: -

Register name: CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_ALIVE_IPCLKPORT_PCLK

Replace `CLK_CON_GAT_GOUT_BLK_<blockname>_UID_` with `CLK_GOUT_<blockname>_=
`
Replace ` _IPCLKPORT` with nothing
Replace `_RSTNSYNC` with nothing

So you end up with:

GATE(CLK_GOUT_APM_APBIF_GPIO_ALIVE_PCLK,
            "gout_apm_apbif_gpio_alive_pclk", "gout_apm_func",
             CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_ALIVE_IPCLKPORT_PCLK,
             21, 0, 0),

That still enables cross referencing with the datasheet via the
unmodified register name, but the dt binding define and string are
slightly shorter like you wanted. The mangling described above the
vast majority of clock names look fine. There are a couple of
anomalies though like  `CLK_GOUT_MISC_MISC_CMU_MISC_PCLK` and
`CLK_GOUT_APM_APM_CMU_APM_PCLK`. I think it is a *really* bad idea to
do custom mangling on these specific names though.

>
> > +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SYSMMU_D_APM_IPCLKPORT_CLK_S2    =
                 0x20c4
> > +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SYSREG_APM_IPCLKPORT_PCLK        =
                 0x20cc
> > +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_APM_IPCLKPORT_ACLK          =
                 0x20d0
> > +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_APM_IPCLKPORT_PCLK          =
                 0x20d4
> > +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_DBGCORE_IPCLKPORT_ACLK      =
                 0x20d8

<cut>

> > +       GATE(CLK_GOUT_APM_APBIF_RTC_IPCLKPORT_PCLK,
> > +            "gout_apm_apbif_rtc_ipclkport_pclk", "gout_apm_func",
> > +            CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_RTC_IPCLKPORT_PCLK, 21,=
 0, 0),
> > +       GATE(CLK_GOUT_APM_APBIF_TRTC_IPCLKPORT_PCLK,
> > +            "gout_apm_apbif_trtc_ipclkport_pclk", "gout_apm_func",
> > +            CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_TRTC_IPCLKPORT_PCLK, 21=
, 0, 0),
> > +       GATE(CLK_GOUT_APM_APM_USI0_UART_IPCLKPORT_PCLK,
> > +            "gout_apm_apm_usi0_uart_ipclkport_pclk", "gout_apm_func",
> > +            CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_UART_IPCLKPORT_PCLK,
> > +            21, 0, 0),
> > +       GATE(CLK_GOUT_APM_APM_USI0_USI_IPCLKPORT_IPCLK,
> > +            "gout_apm_apm_usi0_usi_ipclkport_ipclk", "dout_apm_usi0_ua=
rt",
> > +            CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_USI_IPCLKPORT_PCLK,
>
> PCLK vs IPCLK?

Will fix. The order here should match the register offsets

CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_UART_IPCLKPORT_IPCLK,
CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_UART_IPCLKPORT_PCLK,
CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_USI_IPCLKPORT_IPCLK,
CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_USI_IPCLKPORT_PCLK,
CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI1_UART_IPCLKPORT_IPCLK,
CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI1_UART_IPCLKPORT_PCLK,

>
> > +            21, 0, 0),
> > +       GATE(CLK_GOUT_APM_APM_USI0_USI_IPCLKPORT_PCLK,
> > +            "gout_apm_apm_usi0_usi_ipclkport_pclk", "gout_apm_func",
> > +            CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI1_UART_IPCLKPORT_PCLK,=
 21, 0, 0),
>
> Should it be USI0 instead of USI1? It's the same as the definition
> below. Also, please stick to 80 characters per line, here and below.

I've revisited the 6 clock gates described above to ensure they are in
register offset order.

>
> > +       GATE(CLK_GOUT_APM_APM_USI1_UART_IPCLKPORT_IPCLK,
> > +            "gout_apm_apm_usi1_uart_ipclkport_ipclk", "dout_apm_usi1_u=
art",
> > +            CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI1_UART_IPCLKPORT_IPCLK=
, 21, 0, 0),
> > +       GATE(CLK_GOUT_APM_APM_USI1_UART_IPCLKPORT_PCLK,
> > +            "gout_apm_apm_usi1_uart_ipclkport_pclk", "gout_apm_func",

<cut>

> > +static const struct samsung_cmu_info apm_cmu_info __initconst =3D {
> > +       .mux_clks               =3D apm_mux_clks,
> > +       .nr_mux_clks            =3D ARRAY_SIZE(apm_mux_clks),
> > +       .div_clks               =3D apm_div_clks,
> > +       .nr_div_clks            =3D ARRAY_SIZE(apm_div_clks),
> > +       .gate_clks              =3D apm_gate_clks,
> > +       .nr_gate_clks           =3D ARRAY_SIZE(apm_gate_clks),
> > +       .fixed_clks             =3D apm_fixed_clks,
> > +       .nr_fixed_clks          =3D ARRAY_SIZE(apm_fixed_clks),
> > +       .nr_clk_ids             =3D APM_NR_CLK,
> > +       .clk_regs               =3D apm_clk_regs,
> > +       .nr_clk_regs            =3D ARRAY_SIZE(apm_clk_regs),
> > +};
> > +
> > +/* ---- CMU_MISC -----------------------------------------------------=
-------- */
>
> Suggest adding an empty line here.

Will fix
>
> > +/* Register Offset definitions for CMU_MISC (0x10010000) */
> > +#define PLL_CON0_MUX_CLKCMU_MISC_BUS_USER      0x0600
> > +#define PLL_CON1_MUX_CLKCMU_MISC_BUS_USER      0x0604
> > +#define PLL_CON0_MUX_CLKCMU_MISC_SSS_USER      0x0610
> > +#define PLL_CON1_MUX_CLKCMU_MISC_SSS_USER      0x0614
> > +#define MISC_CMU_MISC_CONTROLLER_OPTION                0x0800
> > +#define CLKOUT_CON_BLK_MISC_CMU_MISC_CLKOUT0   0x0810
> > +#define CLK_CON_MUX_MUX_CLK_MISC_GIC           0x1000
> > +#define CLK_CON_DIV_DIV_CLK_MISC_BUSP          0x1800
> > +#define CLK_CON_DIV_DIV_CLK_MISC_GIC           0x1804
>
> Please align all values for this group at the same indentation level.

Will fix

>
> > +#define CLK_CON_GAT_CLK_BLK_MISC_UID_MISC_CMU_MISC_IPCLKPORT_PCLK     =
         0x2000
> > +#define CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_BIRA_IPCLKPORT_I_OSCCLK  =
         0x2004
> > +#define CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_BISR_IPCLKPORT_I_OSCCLK  =
         0x2008
> > +#define CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_TOP_IPCLKPORT_I_OSCCLK   =
         0x200c
> > +#define CLK_CON_GAT_CLK_BLK_MISC_UID_RSTNSYNC_CLK_MISC_OSCCLK_IPCLKPOR=
T_CLK    0x2010
>
> Just want to give you one more example for my rant above. Look how
> much easier it is to understand this name (than above one):
>
>     CLK_CON_GAT_MISC_OSCCLK_CLK
>
> Which also turns this (public API!):
>
>     "gout_misc_rstnsync_clk_misc_oscclk_ipclkport_clk"
>
> into this:
>
>     "gout_misc_oscclk_clk"

In v6 this becomes

GATE(CLK_GOUT_MISC_CLK_MISC_OSCCLK_CLK,
     "gout_misc_clk_misc_oscclk_clk", "dout_misc_busp",
     CLK_CON_GAT_CLK_BLK_MISC_UID_RSTNSYNC_CLK_MISC_OSCCLK_IPCLKPORT_CLK,
     21, 0, 0),

<cut>
>
> > +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_ADM_AHB_SSS_IPCLKPORT_HCLKM     =
         0x2014
> > +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_AD_APB_DIT_IPCLKPORT_PCLKM      =
         0x2018
> > +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_AD_APB_PUF_IPCLKPORT_PCLKM      =
         0x201c
> > +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_DIT_IPCLKPORT_ICLKL2A           =
         0x2020
> > +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_D_TZPC_MISC_IPCLKPORT_PCLK      =
         0x2024
> > +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_GIC_IPCLKPORT_GICCLK            =
         0x2028
> > +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_GPC_MISC_IPCLKPORT_PCLK         =
         0x202c

<cut>

> > +static const struct samsung_div_clock misc_div_clks[] __initconst =3D =
{
> > +       DIV(CLK_DOUT_MISC_BUSP, "dout_misc_busp", "mout_misc_bus_user",
> > +           CLK_CON_DIV_DIV_CLK_MISC_BUSP, 0, 3),
> > +       DIV(CLK_DOUT_MISC_GIC, "dout_misc_gic", "mout_misc_bus_user",
> > +           CLK_CON_DIV_DIV_CLK_MISC_GIC, 0, 3),
> > +};
> > +
> > +static const struct samsung_gate_clock misc_gate_clks[] __initconst =
=3D {
> > +       GATE(CLK_GOUT_MISC_MISC_CMU_MISC_IPCLKPORT_PCLK,
> > +            "gout_misc_ipclkport_pclk", "dout_misc_busp",
>
> So if you want to be consistent, it should be
> "gout_misc_misc_misc_....". My point is -- Samsung's naming in TRM is
> insane. They wanted to stick to some very detailed and unified naming
> schema (or just generated those names from some internal clock tree
> data), granted. But I'm just not sure if it's the best idea to follow
> it in driver's code.

With the naming described above it becomes
"gout_misc_misc_cmu_misc_pclk". Not ideal, and this is one of the
clocks I mentioned above. The overwhelming majority of the clock names
don't have such repetition in their name though. If we start doing
custom mangling on specific clocks it is going to become a nightmare
to track. As I mentioned previously there are thousands of clocks in
the SoC. Most upstream platforms only seem to implement a small subset
of clocks in each CMU which maybe makes it easier to track. Our goal
though is to have full functionality upstream.

>
> > +            CLK_CON_GAT_CLK_BLK_MISC_UID_MISC_CMU_MISC_IPCLKPORT_PCLK,
> > +            21, 0, 0),
> > +       GATE(CLK_GOUT_MISC_OTP_CON_BIRA_IPCLKPORT_I_OSCCLK,
> > +            "gout_misc_otp_con_bira_ipclkport_i_oscclk", "dout_misc_bu=
sp",
> > +            CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_BIRA_IPCLKPORT_I_OSCC=
LK,
> > +            21, 0, 0),
> > +       GATE(CLK_GOUT_MISC_OTP_CON_BISR_IPCLKPORT_I_OSCCLK,
> > +            "gout_misc_otp_con_bisr_ipclkport_i_oscclk", "dout_misc_bu=
sp",
> > +            CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_BISR_IPCLKPORT_I_OSCC=
LK,
> > +            21, 0, 0),
<snip>
> > +       GATE(CLK_GOUT_MISC_RTIC_IPCLKPORT_I_ACLK,
> > +            "gout_misc_rtic_ipclkport_i_aclk", "dout_misc_busp",
> > +            CLK_CON_GAT_GOUT_BLK_MISC_UID_RTIC_IPCLKPORT_I_ACLK,
> > +            21, 0, 0),
> > +       GATE(CLK_GOUT_MISC_RTIC_IPCLKPORT_I_PCLK, "gout_misc_rtic_ipclk=
port_i_pclk",
>
> 80 characters per line please.

Will fix

regards,

Peter

