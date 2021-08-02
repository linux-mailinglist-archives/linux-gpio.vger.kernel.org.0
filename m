Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 401D03DDE88
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 19:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbhHBRaB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 13:30:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:38572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230167AbhHBR35 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Aug 2021 13:29:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4A6261104;
        Mon,  2 Aug 2021 17:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627925387;
        bh=3fH4xyackk6mzT6bM4HMVhu7V3Ju4e+WsPSUFZe9ocs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rXxLds+xYAIL51sRiYyzmBMbZbFErWa4iZYSsEafH3FA/ZXVo71xzyi5U9m/5HVis
         IyfJmxMgjJWasy3YjYfvyT2wZXWARqv/mVPnfTLMnkyJDMNUp+ErVxzWuz9rEVP99D
         i6mgf8KlpTGPpmSBSwVZstWcwCosq2EYWCGGOXg8Jw1F9aUtG28qkkxy0d1Ip1+8Ju
         29q1MRfLo6M30LI6JYJ909ST4gRMRFiPq0R6yTc0zT+R4l9GxN1KCd8mQN0QwwXttl
         Z7ZTQNn4YGU/4t0coyGzGAsa5wPpuPSJvhDNDXkapNsnd4C1SJBTE1zPsUd5Mf8wPG
         QoDMGtFr/CRtQ==
Received: by mail-qk1-f182.google.com with SMTP id x3so17322381qkl.6;
        Mon, 02 Aug 2021 10:29:47 -0700 (PDT)
X-Gm-Message-State: AOAM532zRg9uOZNqnsko7+uwH5LL7X26OQVR4bly8EzwXqgasPcCmA6/
        lKjx+6Ev7WG1gtagTG0OoNyZTBKYj5oAAmQMPg==
X-Google-Smtp-Source: ABdhPJw3rhsg3xt3WZxvRf6C3TDMvQ/nYPKknmsyDFIXTD5vr9EXh4l0mA5SLbhh2MtpltohbhbaF0Ho6Gb7u+i9Dw8=
X-Received: by 2002:a37:6353:: with SMTP id x80mr16678360qkb.464.1627925386913;
 Mon, 02 Aug 2021 10:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <1626868353-96475-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1626868353-96475-5-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <YQMIhBPwcNw1YqMq@robh.at.kernel.org> <bc5185eb-8051-89ca-4a5f-c4e5fc90a7f2@xilinx.com>
In-Reply-To: <bc5185eb-8051-89ca-4a5f-c4e5fc90a7f2@xilinx.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 2 Aug 2021 11:29:35 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+281knebcN--jQgYWtDQO4OV6ZO5CvnYpaYqrAaiGmPQ@mail.gmail.com>
Message-ID: <CAL_Jsq+281knebcN--jQgYWtDQO4OV6ZO5CvnYpaYqrAaiGmPQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm: dts: zynq: Replace 'io-standard' with
 'power-source' property
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>, saikrishna12468@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 29, 2021 at 10:59 PM Michal Simek <michal.simek@xilinx.com> wrote:
>
>
>
> On 7/29/21 9:59 PM, Rob Herring wrote:
> > On Wed, Jul 21, 2021 at 05:22:33PM +0530, Sai Krishna Potthuri wrote:
> >> Replace 'io-standard' property with 'power-source' property in all zynq dts
> >> files to be in sync with Zynq pinctrl driver.
> >>
> >> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> >> ---
> >>  arch/arm/boot/dts/zynq-ebaz4205.dts |  8 ++++----
> >>  arch/arm/boot/dts/zynq-microzed.dts |  2 +-
> >>  arch/arm/boot/dts/zynq-zc702.dts    | 20 ++++++++++----------
> >>  arch/arm/boot/dts/zynq-zc706.dts    | 18 +++++++++---------
> >>  4 files changed, 24 insertions(+), 24 deletions(-)
> >>
> >> diff --git a/arch/arm/boot/dts/zynq-ebaz4205.dts b/arch/arm/boot/dts/zynq-ebaz4205.dts
> >> index b0b836aedd76..be7eae611fb7 100644
> >> --- a/arch/arm/boot/dts/zynq-ebaz4205.dts
> >> +++ b/arch/arm/boot/dts/zynq-ebaz4205.dts
> >> @@ -57,7 +57,7 @@
> >>
> >>              conf {
> >>                      groups = "gpio0_20_grp", "gpio0_32_grp";
> >> -                    io-standard = <3>;
> >> +                    power-source = <3>;
> >
> > This will break using a new DT with a kernel without patch 3.
> >
>
> What do you suggest? Not to update any old DT?

Your options are don't change the dts files, patch 3 needs to go to
stable kernels, or you document the breakage (if you don't care).

Rob
