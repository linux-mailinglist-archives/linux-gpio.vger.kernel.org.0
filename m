Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8308651D802
	for <lists+linux-gpio@lfdr.de>; Fri,  6 May 2022 14:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1392077AbiEFMmS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 May 2022 08:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1392074AbiEFMmO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 May 2022 08:42:14 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4269969497
        for <linux-gpio@vger.kernel.org>; Fri,  6 May 2022 05:38:30 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id w1so12361911lfa.4
        for <linux-gpio@vger.kernel.org>; Fri, 06 May 2022 05:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+oJnfCTdPWSag7AGc8jPKi4ghzl83dJN2OES5/aYaT4=;
        b=K0LgiS5p/Fz0/dtEboraGPOSwQFdkSth+xonysTtThr4NDxYGzK/K3nu0zsyiFDZT4
         wH+vkseShFMadY6qbBA9VCYSxJStYbmQ12RP1M1PK2Dr7oMpncHl+awCQ0xKY/4Seud3
         Qxuw8La5C2Sn7s2ktVCoBLaHLGPw4DaeJBm8Zuj5grwPxwJKD4sVKvP3WaHErXlx+zHB
         4Qv36qrKnEV1Hn0BAZ424T8LhFExbDFMkBmMfW+3IdQCEwjRtOpPt9epMgHm6ruwSFs1
         5uzjKg1q05qwpNrTVJwkvRJGgqgbAs+/Us6yj6QhLGbYGCAZM5gYHSST06ZtkmTtrqrU
         hvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+oJnfCTdPWSag7AGc8jPKi4ghzl83dJN2OES5/aYaT4=;
        b=EEEFXvM7kmmbJOxOx4UkDpnwV2y7cHKD1UEZfoH6qxXN3Kgbaq8rKiOxiZP5EU1L3i
         Wuo8ExxspVxdtyqb0dROeqyOUeMfNkxb6HSARIkUFrz/IjIZyouyRUSEh8cqyu930NEn
         A2NO/GYx4dqBmShXom1m3l40ji12DpvI9el8o/k9DE8ufzkY6zhyh/t4oJMGDExFmOWY
         MYxEnC9SJUXMTRQigk3ORoObUK1GIgmr9LeBMHLGLDFuo9EAb/5FRByPANQyLT7vdSo7
         jImGEqqgj/w0HoyKFxQHYT9zG9cOPA5P4qO1eovQpTN2XG5t+PZMHhEFqYVkqlaZbZoB
         TS2g==
X-Gm-Message-State: AOAM530TwGjtkihgMvIV212Du5+MxSBD7tXXXIM3mBeLPDmN0JVSoA/q
        uJobfQ6AAZABJyDTveGrYoraz58VNBOTpjwzZbcSeQ==
X-Google-Smtp-Source: ABdhPJz/OG8nf/9MLik6vYRgPr2lDfjBYFJEYvIXAjy7Uu3UKsDMG/VrjItMgN2nY1YHO2G+QCSuzBVNZ4F4342VvEw=
X-Received: by 2002:a05:6512:5cb:b0:472:f7e:a5f5 with SMTP id
 o11-20020a05651205cb00b004720f7ea5f5mr2255189lfo.358.1651840708488; Fri, 06
 May 2022 05:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220504213251.264819-1-sebastian.reichel@collabora.com>
 <20220504213251.264819-10-sebastian.reichel@collabora.com>
 <CAPDyKFqLn4LfPRbhoWw_9BF26Lgmzq_1j=RB31NDGn9YvMnB5w@mail.gmail.com> <20220506091837.bbwupigb4f3hwgp4@mercury.elektranox.org>
In-Reply-To: <20220506091837.bbwupigb4f3hwgp4@mercury.elektranox.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 6 May 2022 14:37:52 +0200
Message-ID: <CAPDyKFoiDunWM28fHKDc6q_c3fwUQGxPGurF0tChMJKwvDdhtQ@mail.gmail.com>
Subject: Re: [PATCHv2 09/21] mmc: sdhci-of-dwcmshc: add reset call back for
 rockchip Socs
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yifeng Zhao <yifeng.zhao@rock-chips.com>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 6 May 2022 at 11:18, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Fri, May 06, 2022 at 10:52:42AM +0200, Ulf Hansson wrote:
> > On Wed, 4 May 2022 at 23:33, Sebastian Reichel
> > <sebastian.reichel@collabora.com> wrote:
> > >
> > > From: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> > >
> > > The reset function build in the SDHCI will not reset the logic
> > > circuit related to the tuning function, which may cause data
> > > reading errors. Resetting the complete SDHCI controller through
> > > the reset controller fixes the issue.
> > >
> > > Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> > > [rebase, use optional variant of reset getter]
> > > Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> >
> > I think this needs a corresponding update of the DT docs. Otherwise
> > this looks good to me.
>
> I do have 'resets' and 'reset-names' properties in the rk3588s.dtsi
> for the sdhci interface and 'make dtbs_check' did not complain about
> anything but missing 'arm,sdei-1.0' compatible for the rk3588 EVB
> (sdei binding has not yet been converted to yaml). Thus I assume the
> resets property is inferred from somewhere?

I don't think it should, but I may be wrong.

How about if you extend the example in the DT doc with a reset
property, will that cause the DT tools to complain?

Kind regards
Uffe

>
> -- Sebastian
>
> >
> > Kind regards
> > Uffe
> >
> > > ---
> > >  drivers/mmc/host/sdhci-of-dwcmshc.c | 26 +++++++++++++++++++++++++-
> > >  1 file changed, 25 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> > > index bac874ab0b33..3a1b5ba36405 100644
> > > --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> > > +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> > > @@ -15,6 +15,7 @@
> > >  #include <linux/module.h>
> > >  #include <linux/of.h>
> > >  #include <linux/of_device.h>
> > > +#include <linux/reset.h>
> > >  #include <linux/sizes.h>
> > >
> > >  #include "sdhci-pltfm.h"
> > > @@ -63,6 +64,7 @@
> > >  struct rk3568_priv {
> > >         /* Rockchip specified optional clocks */
> > >         struct clk_bulk_data rockchip_clks[RK3568_MAX_CLKS];
> > > +       struct reset_control *reset;
> > >         u8 txclk_tapnum;
> > >  };
> > >
> > > @@ -255,6 +257,21 @@ static void dwcmshc_rk3568_set_clock(struct sdhci_host *host, unsigned int clock
> > >         sdhci_writel(host, extra, DWCMSHC_EMMC_DLL_STRBIN);
> > >  }
> > >
> > > +static void rk35xx_sdhci_reset(struct sdhci_host *host, u8 mask)
> > > +{
> > > +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > > +       struct dwcmshc_priv *dwc_priv = sdhci_pltfm_priv(pltfm_host);
> > > +       struct rk35xx_priv *priv = dwc_priv->priv;
> > > +
> > > +       if (mask & SDHCI_RESET_ALL && priv->reset) {
> > > +               reset_control_assert(priv->reset);
> > > +               udelay(1);
> > > +               reset_control_deassert(priv->reset);
> > > +       }
> > > +
> > > +       sdhci_reset(host, mask);
> > > +}
> > > +
> > >  static const struct sdhci_ops sdhci_dwcmshc_ops = {
> > >         .set_clock              = sdhci_set_clock,
> > >         .set_bus_width          = sdhci_set_bus_width,
> > > @@ -269,7 +286,7 @@ static const struct sdhci_ops sdhci_dwcmshc_rk3568_ops = {
> > >         .set_bus_width          = sdhci_set_bus_width,
> > >         .set_uhs_signaling      = dwcmshc_set_uhs_signaling,
> > >         .get_max_clock          = sdhci_pltfm_clk_get_max_clock,
> > > -       .reset                  = sdhci_reset,
> > > +       .reset                  = rk35xx_sdhci_reset,
> > >         .adma_write_desc        = dwcmshc_adma_write_desc,
> > >  };
> > >
> > > @@ -292,6 +309,13 @@ static int dwcmshc_rk3568_init(struct sdhci_host *host, struct dwcmshc_priv *dwc
> > >         int err;
> > >         struct rk3568_priv *priv = dwc_priv->priv;
> > >
> > > +       priv->reset = devm_reset_control_array_get_optional_exclusive(mmc_dev(host->mmc));
> > > +       if (IS_ERR(priv->reset)) {
> > > +               err = PTR_ERR(priv->reset);
> > > +               dev_err(mmc_dev(host->mmc), "failed to get reset control %d\n", err);
> > > +               return err;
> > > +       }
> > > +
> > >         priv->rockchip_clks[0].id = "axi";
> > >         priv->rockchip_clks[1].id = "block";
> > >         priv->rockchip_clks[2].id = "timer";
> > > --
> > > 2.35.1
> > >
