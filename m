Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37B463D90B9
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 16:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235498AbhG1Ocs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 10:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235389AbhG1Ocr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 10:32:47 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38964C061757;
        Wed, 28 Jul 2021 07:32:45 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id p145so3227639ybg.6;
        Wed, 28 Jul 2021 07:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4JK7b2hFKDRPAkaz/5XQDBMQ7m4Vfkqh5EaRQrJPCGQ=;
        b=OvKHjuaKng+jTSSIvftPMiGKMIeKtNqyIufs8Fu0Eazoav1gkzlptN3saorJVOWIHD
         5ZE/AiaChvyNaKB0P1FNZbhvBThGl97YxDZIUQUymG9y7L76wHlBfijanyGkANNlOhBB
         q6WBa8XS0s1LaHM3QHnGu9mQUmwf5M9WjttfLXcG0Ckrh+G98zU6ctw1lMAMHQZLb+e9
         49bTOu+si+bnEe1+EhKFTg9qJMfgGkf5S/RazZqUlgit+2qcP8bud6RiQxep4EqMYOAK
         MChpYMHyKXDiMq01yV7YW684gC49TLH1HnUkoxJQ+HnYFGnXTpys7JMLcESERh2SQhxb
         6lYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4JK7b2hFKDRPAkaz/5XQDBMQ7m4Vfkqh5EaRQrJPCGQ=;
        b=HnmvSc/G8Hp7cq604eGCI3TEcvQoxA2KXXjD6wzs5PiFgR1kmnx7aenIK7kQZvG2Dz
         Xff+rSJj9p/fo26kWmn+UdP8gfSJE6p8o5ENeNTMdPml1tVR5VYJwU/gaMtJdizLDR6Z
         m+f5b7bpTm2/ZFhlEptm+SGqGlXlWgQDJhvDaHUXFxrpPa3k9YvKJUz5RQPEtwOT6HqS
         orIfMWGryqOOZmMWPeCkTaaDOmt+hsvmGvyZkYkdkY1BVVJmBygs/1/TvD2lVlcV2GKo
         h6VGTd437XrNpEzDI9ir2rZJJlKPqfVC77PrO/NHeBPJp2SZmeN62QsJpV2KCu28pc15
         eWNw==
X-Gm-Message-State: AOAM5336JIeFxqB77qjhb2K0IgNwia0qgLb1tVu8SNSeYskNT0JR2kgj
        5/gL9Ocm8O1E1qXLp7zsFn9vCr/cTtafODyBt7M=
X-Google-Smtp-Source: ABdhPJzOqQkZ3fH9/4zK6YzGbwgSijm/N0TJyZF5tIiCnIm/6L50eVulcZ1N9tP1w1Ah1rREqR1iLY45KaodtZnZJ/0=
X-Received: by 2002:a5b:303:: with SMTP id j3mr36759264ybp.433.1627482764488;
 Wed, 28 Jul 2021 07:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210728135534.703028-1-pgwipeout@gmail.com> <20210728135534.703028-5-pgwipeout@gmail.com>
 <21568327.EfDdHjke4D@diego>
In-Reply-To: <21568327.EfDdHjke4D@diego>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Wed, 28 Jul 2021 10:32:32 -0400
Message-ID: <CAMdYzYrFBS_v00YC35rbDMfVW_zwMb01OYFKY4v8+zETGYR98g@mail.gmail.com>
Subject: Re: [PATCH 4/9] arm64: dts: rockchip: add rk356x gmac1 node
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        arm-mail-list <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 28, 2021 at 10:21 AM Heiko St=C3=BCbner <heiko@sntech.de> wrote=
:
>
> Hi Peter,
>
> Am Mittwoch, 28. Juli 2021, 15:55:29 CEST schrieb Peter Geis:
> > Add the gmac1 controller to the rk356x device tree.
> > This is the controller common to both the rk3568 and rk3566.
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk356x.dtsi | 48 ++++++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot=
/dts/rockchip/rk356x.dtsi
> > index c2aa7aeec58d..77c679304916 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > @@ -18,6 +18,7 @@ / {
> >       #size-cells =3D <2>;
> >
> >       aliases {
> > +             ethernet1 =3D &gmac1;
> >               gpio0 =3D &gpio0;
> >               gpio1 =3D &gpio1;
> >               gpio2 =3D &gpio2;
>
> Looking back at the discussion about mmc aliases in board-dts vs. soc-dts=
i
> I get the feeling the ethernet alias would be same case, as not all board=
s
> will expose ethernet.
>
> In the very least the ethernet alias should be part of the rk3566/rk3568 =
dtsi
> files, doing ethernet0 =3D &gmac1 for rk3566 and ethernet1 =3D &gmac1 for=
 rk3568.
>
> But I do think the board-dts would be the more appropriate place.

Okay, that makes sense, I'll move this to the board.
In regards to the 0 vs 1, this was to avoid issues with downstream
u-boot/rkbin which treats the rk3566 as a rk3568.
Currently it doesn't seem to affect anything in the way the kernel
probes it, as it still shows up as eth0.

>
>
> Heiko
>
> > @@ -344,6 +345,53 @@ sdmmc2: mmc@fe000000 {
> >               status =3D "disabled";
> >       };
> >
> > +     gmac1: ethernet@fe010000 {
> > +             compatible =3D "rockchip,rk3568-gmac", "snps,dwmac-4.20a"=
;
> > +             reg =3D <0x0 0xfe010000 0x0 0x10000>;
> > +             interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> > +             interrupt-names =3D "macirq", "eth_wake_irq";
> > +             clocks =3D <&cru SCLK_GMAC1>, <&cru SCLK_GMAC1_RX_TX>,
> > +                      <&cru SCLK_GMAC1_RX_TX>, <&cru CLK_MAC1_REFOUT>,
> > +                      <&cru ACLK_GMAC1>, <&cru PCLK_GMAC1>,
> > +                      <&cru SCLK_GMAC1_RX_TX>, <&cru CLK_GMAC1_PTP_REF=
>;
> > +             clock-names =3D "stmmaceth", "mac_clk_rx",
> > +                           "mac_clk_tx", "clk_mac_refout",
> > +                           "aclk_mac", "pclk_mac",
> > +                           "clk_mac_speed", "ptp_ref";
> > +             resets =3D <&cru SRST_A_GMAC1>;
> > +             reset-names =3D "stmmaceth";
> > +             rockchip,grf =3D <&grf>;
> > +             snps,mixed-burst;
> > +             snps,tso;
> > +             snps,axi-config =3D <&gmac1_stmmac_axi_setup>;
> > +             snps,mtl-rx-config =3D <&gmac1_mtl_rx_setup>;
> > +             snps,mtl-tx-config =3D <&gmac1_mtl_tx_setup>;
> > +             status =3D "disabled";
> > +
> > +             mdio1: mdio {
> > +                     compatible =3D "snps,dwmac-mdio";
> > +                     #address-cells =3D <0x1>;
> > +                     #size-cells =3D <0x0>;
> > +             };
> > +
> > +             gmac1_stmmac_axi_setup: stmmac-axi-config {
> > +                     snps,wr_osr_lmt =3D <4>;
> > +                     snps,rd_osr_lmt =3D <8>;
> > +                     snps,blen =3D <0 0 0 0 16 8 4>;
> > +             };
> > +
> > +             gmac1_mtl_rx_setup: rx-queues-config {
> > +                     snps,rx-queues-to-use =3D <1>;
> > +                     queue0 {};
> > +             };
> > +
> > +             gmac1_mtl_tx_setup: tx-queues-config {
> > +                     snps,tx-queues-to-use =3D <1>;
> > +                     queue0 {};
> > +             };
> > +     };
> > +
> >       qos_gpu: qos@fe128000 {
> >               compatible =3D "rockchip,rk3568-qos", "syscon";
> >               reg =3D <0x0 0xfe128000 0x0 0x20>;
> >
>
>
>
>
