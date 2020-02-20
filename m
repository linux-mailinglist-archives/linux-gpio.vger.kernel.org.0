Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 406441659B9
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 10:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgBTJEY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 04:04:24 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40301 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbgBTJEY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 04:04:24 -0500
Received: by mail-lj1-f193.google.com with SMTP id n18so3362268ljo.7
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2020 01:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EtwFUgXnzMG7xRSPK5ep4NdZQoJPGdlrXdQuPq3LaPs=;
        b=vT3CEAkG5tcsFFbFsHJmyzP1bPuTG0lGWwl1/VHgibZrTrs+dGGrWXcCh6PlmIp5qj
         aLgO0RmwGAPNzx4Nlh/SK0OT2bZRl+6Nbo728uQ5K/iZ81592QfwkpdE+20vagx4oR0+
         eI0H1ro6G/lRK06d1YjZsqpf0VfyEkiY4d2QL659oZeFIX18QVpWALrSOP71+V1A4po0
         t9o/0o+QOl5vxyAInUQI47v3hxI3qkAfCH4zZlcAh96LBiAHOgoWYyYe8xtZCw5UrOyc
         S9BoCwWMrdEyXAoa2NPb5Et5PKm+203P6MtFZ6d6P1Vxz2ExgOVAtLusSPRKYp5NqXIP
         UztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EtwFUgXnzMG7xRSPK5ep4NdZQoJPGdlrXdQuPq3LaPs=;
        b=hqyekuG/Fe+72cYpwB2QJWKFOWMd4zG2YQVCjljz4MkvitrpT6bMPh9tHG5/jg+Ztf
         ZVZR4JjoHFnmiCL3hKQLdrPOjtXGBtM4TSmA0H1yJHY55NO3Izebw8evfT8tPiRl8qrD
         Zbf9uMWFmKizPwd5YAWLEdQXq4q6p2qPQsO2YAK5AxGM3Dy9FoOON3e4Wzt33ptpqID4
         PN6mXD2jKQ2BpjWMtXZM7X1er/mmZj+S3b/qSej3f9UAVQ/P8Pfv2hFkP2/PGUwGLwKs
         P9gKFmcS0DtqlB4RZOOQrVl90oAplxmm1gYUdUnu7xB5uaUSv5qR51ZXiFSpWkNUtII+
         JLaA==
X-Gm-Message-State: APjAAAWsW6lY16APKmcIjVsNMxgxXnfws6CkuNmlnUOOw24iprcpL0XM
        GhGhVIZIaxZDOMDXJqriW9RnwuUTmSMH2PGKEQA8wF9oLcY=
X-Google-Smtp-Source: APXvYqykxTk2UJC6Vt5ZX+50V0sBVT8b6IEsTzEaCbxY0/TQGOpkj5sPXy865IF+LfcUD/8rZA4hCZqDPn22AA/jsNQ=
X-Received: by 2002:a2e:7d0c:: with SMTP id y12mr19074270ljc.39.1582189462310;
 Thu, 20 Feb 2020 01:04:22 -0800 (PST)
MIME-Version: 1.0
References: <20200219143229.18084-1-alexandre.torgue@st.com> <20200219143229.18084-3-alexandre.torgue@st.com>
In-Reply-To: <20200219143229.18084-3-alexandre.torgue@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 Feb 2020 10:04:11 +0100
Message-ID: <CACRpkdZ7uq4U6GBQQQh=pTLf4wW3KfH3Zrz9z_3ZQgoaJD9Ynw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pinctrl: stm32: Add level interrupt support to
 gpio irq chip
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 19, 2020 at 3:32 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> GPIO hardware block is directly linked to EXTI block but EXTI handles
> external interrupts only on edge. To be able to handle GPIO interrupt on
> level a "hack" is done in gpio irq chip: parent interrupt (exti irq chip)
> is retriggered following interrupt type and gpio line value.
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> Tested-by: Marek Vasut <marex@denx.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

If Marc want to merge it with patch 1/2 go ahead!

Alternatively I can merge both patches.

Thanks to you & Marek for hashing this out, excellent work!

Yours,
Linus Walleij
