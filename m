Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0934734CF68
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 13:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbhC2LwN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 07:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbhC2Lvw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 07:51:52 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC12C061574;
        Mon, 29 Mar 2021 04:51:52 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id x126so9665702pfc.13;
        Mon, 29 Mar 2021 04:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=22q/rnIFf04g2bHvYP9IaYNVB6ChoxCOoOAEpANlF8c=;
        b=PPUECpN3NaU1LOUyfkCBNOjUS7K/DWzfzhdYwYQzBIT7urdLleyKkp2NITseQblARU
         AjmYDrFj40KoDHE+MH586Q0zI7GdiLzKTUMrfrJpvW9jCHX0IDEy+qU3wk8HIJoUV+Tx
         VxcxUANtGOBZtQPnmyLdoCL/MwUA/lNQbAs+glDDsvaF5Y9eoMWqX43pCyGEQyenlYtx
         W6Yv4sApBIioMI6HWQtHrw5QPj390J8tZNk3MGEAvJkISWyyOqg0/ObPKxJRBdJyIp7M
         9iGFm4lwX4FfCjHI/HDNKKeeh6kAc6qMPVWrat9QBtkdutHgpBJTmF5tP8bkuSrWSjkF
         Fr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=22q/rnIFf04g2bHvYP9IaYNVB6ChoxCOoOAEpANlF8c=;
        b=OH3VZtpk4DHwGHgtD/Q5CRYsjM7VlrKGaWevp7+3zSQt4/MxCZgBBRF/K+/zio1YfW
         CAlnWvCgNpkqyE4XOY/AzDngRb0pR4JHDZ4PAKx6r61v5RkYinI5wSd467x6olA6h0qO
         laCgIpdVyH1+gqErvqV9+XTfzHSn5gPIwVABxJHR5j/NvqT7Rj5m0TYu7CLWmYI7jaj5
         Kei+lKNFxl1j4Q0Mh9lRrlHnkCxPCbtiWat1YA/qiv5Xjh4W2ECX4s+byLvDBrD9aCQs
         PyVESRA206T1jwjpf+NfQvp1K8S40ZiEPKs/mBpw9d+DtWTtmOO6CjQnsMCYENc8U8C8
         mwEA==
X-Gm-Message-State: AOAM530/aJC3ZqFvrO8p+h+5qPMJY2vL8TbLZ+zQKXyjnl2rLmru62ag
        V5FwNoMXG9hhZZ+YGYzsljDrNQjf/FUtt/AWs3g=
X-Google-Smtp-Source: ABdhPJxeX2YKkkL1Wn3mbW30JRjOL7XccqnaAdP2WI1jlb4FtEfmc9Etd2/R693+HElvCs17nwB2CpttKjuT4fEOc9M=
X-Received: by 2002:a63:cb44:: with SMTP id m4mr1003785pgi.4.1617018711823;
 Mon, 29 Mar 2021 04:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
 <CAHp75Vc7x=VoNqQKXOyxhkixR3SivQn3yGkejTkZ8bO0Tv6bDA@mail.gmail.com> <1617018585.10316.9.camel@mhfsdcap03>
In-Reply-To: <1617018585.10316.9.camel@mhfsdcap03>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 29 Mar 2021 14:51:35 +0300
Message-ID: <CAHp75Vevt4aLoCj5rFGErPjKYqs=Ve1xohYRzET1cg3LCrb3eA@mail.gmail.com>
Subject: Re: [PATCH Resend v0 0/6] Mediatek pinctrl patch on mt8195
To:     zhiyong tao <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        sean.wang@kernel.org, srv_heupstream <srv_heupstream@mediatek.com>,
        hui.liu@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>,
        jg_poxu@mediatek.com, biao.huang@mediatek.com,
        hongzhou.yang@mediatek.com, erin.lo@mediatek.com,
        Sean Wang <sean.wang@mediatek.com>, seiya.wang@mediatek.com,
        Sj Huang <sj.huang@mediatek.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 2:49 PM zhiyong tao <zhiyong.tao@mediatek.com> wrote:
> On Mon, 2021-03-29 at 14:35 +0300, Andy Shevchenko wrote:
> > On Mon, Mar 29, 2021 at 2:32 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
> > >
> > > This series includes 6 patches:
> > > 1.add pinctrl file on mt8195.
> > > 2.add pinctrl binding document on mt8195.
> > > 3.add pinctrl device node on mt8195.
> > > 4.add pinctrl driver on MT8195.
> > > 5.add pinctrl drive for I2C related pins on MT8195.
> > > 6.add pinctrl rsel setting on MT8195.
> >
> > Patch series w/o version is de facto v1.
> > Dropping to v0 seems not right.
> > You missed changelog.
> >
> > So, send v2 properly.
> >
> > Material to study:
> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> >
>
> Hi Andy,
>
> There is not any change between v0 and v1. so we send "Resend v0" as v2
> in this time.Is it also properly? and we send the version which is v3 in
> next time.

Sounds good to me, just make sure you put a changelog explaining all
these history twists.

-- 
With Best Regards,
Andy Shevchenko
