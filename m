Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92D2325765F
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 11:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728092AbgHaJTX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 05:19:23 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:46033 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726800AbgHaJTV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 05:19:21 -0400
Received: from mail-qk1-f182.google.com ([209.85.222.182]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M7JvQ-1kDo1j3pYi-007jqx; Mon, 31 Aug 2020 11:19:20 +0200
Received: by mail-qk1-f182.google.com with SMTP id n129so5455814qkd.6;
        Mon, 31 Aug 2020 02:19:19 -0700 (PDT)
X-Gm-Message-State: AOAM530/pG3qLrf+BK6vCJqqNBqGO145s4Jmf+tX8jtM2UByaJK1chpO
        E7SIrSbIxpe7B1M1g7YRSn1IuFmnmrFd9Z/S13o=
X-Google-Smtp-Source: ABdhPJzUEWtziSnQX2vhGDM0Aytp3ToW16zQTfl1/E5ySSQ5dl1g5VYJPrx27/jo1GIF6bnH2JosWYvEl46jjr9FjGU=
X-Received: by 2002:a37:a04b:: with SMTP id j72mr57028qke.352.1598865558621;
 Mon, 31 Aug 2020 02:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
In-Reply-To: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 31 Aug 2020 11:19:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2xD-zp3ov=3vobSSAmyfvPCMe0mGgP3F7mZkk8WieUpw@mail.gmail.com>
Message-ID: <CAK8P3a2xD-zp3ov=3vobSSAmyfvPCMe0mGgP3F7mZkk8WieUpw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Add Toshiba Visconti ARM64 Platform support
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Olof Johansson <olof@lixom.net>,
        punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@misterjones.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:iTzcXHI504/yX+tGwNCCxZMKDiDhmJyNDRPN+VhayBViHcPFcji
 heP1QsAi0oiqz4goT1jGpMfnNXS/Fkm1zwMgJ4GTEcIVuh2h0R1m2FInGXq/t/5yaZAMGhE
 SncUXVfbNzYaRrpmo3gqqXUtFXDtVGgkkHi7CL4YTWCXLjEd69qMeARqwzp9KH7jVGkjR95
 KewGHRjkgwmq+L79j6xcg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IPV6XAEaOxc=:OJ4iz1RDjo0knFaEJkcnbz
 p2W8EYm6BmHK5vL30BBVCWwbZGEHlHOIG/xFPmug111BMbFpg9b8VZoFsqM8MwmU79yv0QAPy
 KwJjtdKEJurundPAxFep3GSdh+i0o62Dsv1KZaqvWJv6qJlsmdeT9ZzkrzGpTRmFPiUdrCNqY
 0o35nX/7hG6oGkishWE0f57Sra36CI7dG8TZ7FDGP9Ffy1ME3r1YnDj9pxum4TtS4kV9kqJb1
 9R5EXnPtYLjKKfxxAADfaHhOIKlyFDgJKNO83z0NLx8CVBLXAZirjFEKenX/qTGe7pbYMgSlJ
 xCnDsCwj9TkJqwgS5LQgxnjvDIXwOTTgFgInDTZTOjXEl9YF25y5W2JiYsRljm9h9VkwaLljU
 ugc5aEN92VYS5zk4vs+oafoSZdka9duW4wJw5ilxOdK1Q57p0tKPu+aw0+fVx53RIq18sO4pe
 XwyR5z5NBKZDpJfJFD1s4CrMifJVQxn8TYspS74sLUeYYOiHWVUtpLUoVr+fZ+ieocmi326f5
 RfHfdMGImZHtVi4M7ZVLRRy/zZiD+xTsdf7++XbdiNYHDR9RqnbGOzwuWBHIrwvxaOi+7ew/k
 DtvWOn/itwhz4ry1qK1bNytFtRRW2UV0Nokt0jguntOGgIN006PdGdQ8Qh7Cnv+/DnvmWOOC5
 p0KVCLxXownIDl5CP+r6o3V6KRkamuKTb0iXCPKmJTp2m7gubQgCMru5C9JdqW0DGPnyPDSNt
 ttr24VV3H3ayLU7SqVxP++3YdXfefBX39iO80IDkIYooNy3r700saUc6Snyt0mMO0tvPlIJ/E
 KSMkzpMsxlewYLQ+u/Yv2xxgLZ2pwPP5A+Ts6mqqfGdxZ1fyeVttB5M3xG/y12Eysa7EKPZYv
 MJjK8nmLnLHZqToPWn6t6kFo7ZNeSVLvTLA2caf6H4OugKAs5z169ekm408BO9ZpGUIt/7hgO
 lWmUxzzdTNqMwLQ9dQ8RcF0F2Sz/7KwB7zOSuFI3NdcrU7WW3cbWE
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 31, 2020 at 10:10 AM Nobuhiro Iwamatsu
<nobuhiro1.iwamatsu@toshiba.co.jp> wrote:
>
> Visconti is a series of Toshiba's SoCs targeting image processing
> applications[0]. These set of patches adds support for Visconti5 a Arm
> v8 based SoC.
>
> The series add minimal support for the Visconti5 SoC and the TMPV7708 RM
> main board. Peripherals such as UART, SPI, I2c and timer use Arm's
> IP and work with the existing kernel drivers in the tree. The series
> includes a pinctrl driver to select appropriate functions on the pins.

The arch/arm64 series looks all reasonable to me, nice work!

Once the review from the DT and pinctrl maintainers is completed
and you have received their Acked-by or Reviewed-by tags, please
send the series with those tags to soc@kernel.org for inclusion, keeping
everyone else on Cc.

I'd leave it up to Linus Walleij whether he wants to merge the pinctrl driver
through his subsystem tree, or whether we should pick it up through
the soc tree, either way works for the initial merge. For any updates to
the pinctrl driver and additional subsystem support (clk, media, ...)
in later releases there is no need to Cc the SoC maintainers as those
should just get merged through the subsystem while we take care
of the DT files.

> NOTE: Because Visconti5 does not have PSCI, it uses spin-table with enable-method.

This sounds like an odd choice. Is this a permanent defect in the SoC
or the firmware, or do you expect to change this later once the firmware
has been fixed?

Note that most systems require PSCI anyway for cpuidle support. If there
is any EL2 or EL3 mode firmware already, this is where support for
processor bringup should be implemented. If there is none, you can
usually implement it using a small EL3 trampoline in the bootloader.

>       And this patch series does not include a clock framework, so it is a
>       device-tree file that uses clocks with fixed-clock. This will be replaced by
>       the clock driver in the future.

This is ok for bringup, though we usually recommend to merge the clk driver
at the same time as the SoC, in order to avoid having an incompatible DT
change when adding the clk driver.

       Arnd
