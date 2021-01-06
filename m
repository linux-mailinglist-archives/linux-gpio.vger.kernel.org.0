Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD8B2EBC69
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 11:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725896AbhAFKem (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 05:34:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbhAFKel (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 05:34:41 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A924C06134D
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jan 2021 02:34:01 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id lt17so4422258ejb.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jan 2021 02:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KZLS3GwiODwj6bhvlM/cI4czPqdY6E5oB3XqrOUCP24=;
        b=RbwFT+TZDPoBoKI++rqmdGdULJfUMv+5f1YN7AUoJV4T45HCNlzTSV8hmc/2AUgJc6
         ZGq5Xc0h61zVo23ec+vNEotnx97KfvdjtGEKdFiwZTKy1xkLXU5iB/2orgq1ohRnKIUS
         2Hy+tG9pDKjALRd11D0OG9VsYkCd7s4MMi/nqt2jUX1StqJouv8j5KylKaVn1GuwdR8n
         fNKW2P+0G3lwwcaebEbn/IEGEmE8ppziQZg0+i+2a7HYYueGT+nXiZTps9Ia9q1RaXQZ
         pFSeonhcwcOye+4kONb15+rz2VllwkRuJhN0R1KeLjhuALm7zSIaEFjxXPa0XihBg80N
         R/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KZLS3GwiODwj6bhvlM/cI4czPqdY6E5oB3XqrOUCP24=;
        b=nOQCtoF1gpb46BfghTmMN26P4WVJlERmfpF6IdCXA6KWd1uknBqtq98G4Qm27S9qeF
         sMHPaLUXhJA+OfXUnBI4hhMrp5YuxUdGLMwxKleEXvDDxqhpE8cTSxxMzRt9cTGPU0Xb
         AFWNP7qBYa2bfoTkIR7OP3FziAIR0js5LJg9oUKdhFgN1opkKbDPLrrdr868xFZpN2S1
         gOutA6Xv9CUfXAsqFq+h4//2u9nj6ZRqi0p+WH4ABhZnItMvRU93Z7zTDDnYZ3RzKbav
         Ww4rn4eWIt2GDlLK+KOJbZml/1SSCEho1YFlIOoY5P5ZPPeFf3dvy0I6Xoa7bTamI3yk
         JV1Q==
X-Gm-Message-State: AOAM531F24x8E/SNriTYkKQmHrADgezFKD5uzV5wK00fdiV3ClzhaJQh
        z4SoROPk4b3rUWmuogo8WHzPdoKyLp6K7BsHF+fhdg==
X-Google-Smtp-Source: ABdhPJymlRCF8e5mJkc/8ES0FTZIpecIS8e1CElK4WzZZMiOAMJASuBV0P8dEitYm35SwZgRVPneHkdX1QQG8e4PVro=
X-Received: by 2002:a17:906:73d8:: with SMTP id n24mr2404262ejl.14.1609929239943;
 Wed, 06 Jan 2021 02:33:59 -0800 (PST)
MIME-Version: 1.0
References: <20201201181406.2371881-1-nobuhiro1.iwamatsu@toshiba.co.jp>
In-Reply-To: <20201201181406.2371881-1-nobuhiro1.iwamatsu@toshiba.co.jp>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 6 Jan 2021 11:33:49 +0100
Message-ID: <CAMRc=MeV8+rpoLkdbqzsqOmcsTY1g++B+cqDmSAWQP=gGGduWQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] gpio: visconti: Add Toshiba Visconti GPIO support
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        punit1.agrawal@toshiba.co.jp,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        yuji2.ishikawa@toshiba.co.jp,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 1, 2020 at 10:16 AM Nobuhiro Iwamatsu
<nobuhiro1.iwamatsu@toshiba.co.jp> wrote:
>
> Hi,
>
> This series is the GPIO driver for Toshiba's ARM SoC, Visconti[0].
> This provides DT binding documentation, device driver, MAINTAINER files, =
and updates to DT files.
>
> Update:
>
>   dt-bindings: gpio: Add bindings for Toshiba Visconti GPIO Controller:
>     v2 -> v3: Fix dtschema/dtc warnings.
>       dtschema/dtc warnings/errors:
>         Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.exam=
ple.dt.yaml: gpio@28020000: interrupts: [[0, 24, 4], [0, 25, 4], [0, 26, 4]=
, [0, 27, 4], [0, 28, 4], [0, 29, 4], [0, 30, 4], [0, 31, 4], [0, 32, 4], [=
0, 33, 4], [0, 34, 4], [0, 35, 4], [0, 36, 4], [0, 37, 4], [0, 38, 4], [0, =
39, 4]] is too short
>           From schema: Documentation/devicetree/bindings/gpio/toshiba,gpi=
o-visconti.yaml
>     v1 -> v2: Fix typo.
>
>   gpio: visoconti: Add Toshiba Visconti GPIO support:
>     v2 -> v3: Add select GPIO_GENERIC
>               Use genric MMIO GPIO library
>               Use bgpio_init() as initialized the generic helpers.
>               Use irqchip template instead of gpiochip_irqchip_add().
>     v1 -> v2: No update
>
>   MAINTAINERS: Add entries for Toshiba Visconti GPIO controller:
>     v2 -> v3: No update
>     v1 -> v2: No update
>
>   arm: dts: visconti: Add DT support for Toshiba Visconti5 GPIO driver:
>     v2 -> v3: Fix compatible string.
>     v1 -> v2: No update
>
> Best regards,
>   Nobuhiro
>

Nobuhiro,

In the future please use the get_maintainers.pl script - I have never
been Cc'ed on this series and I would have ignored it if Linus W
hadn't brought it to my attention.

Bartosz
