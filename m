Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFFE93BBE3C
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jul 2021 16:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbhGEOf5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jul 2021 10:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbhGEOf4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jul 2021 10:35:56 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C520C061574;
        Mon,  5 Jul 2021 07:33:19 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id k8so24887845lja.4;
        Mon, 05 Jul 2021 07:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=i+utG97jaWLbSw6GtvymEyma5n0QceYYYcL0QZrM+K0=;
        b=LMDBO8vopAYlQ5RE/k0rqJbg2Lof4F7VcfrlSatlRA6OiVmsg0XFeRO3ttpq8y7XXy
         tT7XUFAVfYK/DjclGtpF26OrL48I1xmIJGpYl0cS4qMSP49P4zQ4CS3I4ESXGBhJuTvQ
         MUCYY/LXD5iIxXC00/gJd3pUueDCepbbIh7vaWddTYZjpkfJKAEicQATM3x/glfPAJCj
         cc/iNTtcvnYjHnK8eLgKTvMI2Gpe53kabgrTJWp5AcbbtPsI2tDKm8GF30AL/rnAiSTW
         YIZ/OKzJZ3QJplBbimqKm9BJqGA+5CShlMK3S5pt9HRuZB1EcPXTdEWoxnH1QoLEW4Ze
         NqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=i+utG97jaWLbSw6GtvymEyma5n0QceYYYcL0QZrM+K0=;
        b=RzjdTJATv6hX95V+KxYcrxYDZ3mMpdqIZDgDy8RBXjYEr69dfKWCf6vGzhiEd5YOkO
         gGN4FB/R9rKHXBQwL9g3M4DglEnJOmDfBl4sUNwxDaUOX9fYxKJpPwIejk2+ixjlcun4
         nnEkvpnVP5MKKkBri07nv86MVioE+ktdnM0ST4+ggDYdMOAF64a7X/yJQolJkof/J/ct
         5Zk6IcxN6kDs2Aw0m2J050Qdln3kYMWNH32nxfoeDLsYpV5rzld1ckQUXx4e/JAiUUZU
         QTeYDU/JeNMnAzpn64gVwFWOXlSZGSZlx6Jlro+W3d5RiXLz7B0Sj1rguIYqgIdzIlgO
         6Itw==
X-Gm-Message-State: AOAM531oabgS/AQvuG5dECv+UJe40SBOLB2zu5dHQtau2/cuCuO4KSDi
        TqCRfY36m7x1NkPsxK02ebdFhYVyGqfZjw==
X-Google-Smtp-Source: ABdhPJwBxVU+K9bjigfPk+jbTac/NdSFFo7VBcAaWjm2aDFdnquAjxVcedwJB+wUU8apv/YN/OvCvw==
X-Received: by 2002:a2e:9210:: with SMTP id k16mr10367590ljg.508.1625495597763;
        Mon, 05 Jul 2021 07:33:17 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id o10sm1096781lfk.271.2021.07.05.07.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 07:33:17 -0700 (PDT)
Message-ID: <68dc9bba14776ecd07d1b9e6fe53956b892a4b56.camel@gmail.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
From:   Matti Vaittinen <mazziesaccount@gmail.com>
To:     Michael Walle <michael@walle.cc>,
        Drew Fustini <drew@beagleboard.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Fu Wei <tekkamanninja@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Huan Feng <huan.feng@starfivetech.com>
Date:   Mon, 05 Jul 2021 17:33:10 +0300
In-Reply-To: <991dddfee40c5b358c07257b58a316f3@walle.cc>
References: <20210701002037.912625-1-drew@beagleboard.org>
         <20210701002037.912625-3-drew@beagleboard.org>
         <CAHp75Vc7kFk_SC8MSmFE5mBt53=4yUnxpSpr=cxZ+7eA-t1r5g@mail.gmail.com>
         <20210702210622.GC1035183@x1> <991dddfee40c5b358c07257b58a316f3@walle.cc>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi deee Ho Drew, Michael, All

On Mon, 2021-07-05 at 15:29 +0200, Michael Walle wrote:
> Hi Drew,
> 
> Am 2021-07-02 23:06, schrieb Drew Fustini:
> > On Fri, Jul 02, 2021 at 07:03:19PM +0300, Andy Shevchenko wrote:
> > > On Thu, Jul 1, 2021 at 3:23 AM Drew Fustini <drew@beagleboard.org
> > > > 
> > > wrote:
> > > > Add GPIO driver for the StarFive JH7100 SoC [1] used on the
> > > > BeagleV Starlight JH7100 board [2].
> > > > 
> > > > [1] https://github.com/starfive-tech/beaglev_doc/
> > > > [2] https://github.com/beagleboard/beaglev-starlight
> > > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > > > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > > > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > > 
> > > Seems some Co-developed-by are missing.
> > 
> > Thank you for suggesting this.  Huan Feng originally wrote the
> > driver.
> > Emil and I have made some changes to reorganize and clean it up for
> > submission.
> > 
> > Do you think all three of us should list Co-developed-by: for our
> > names
> > in addition to the SOB?
> > 
> > > Brief look into the code brings the Q. Can't you utilize gpio-
> > > regmap
> > > here? Why not?
> > 
> > Michael Walle asked about this yesterday and it was my first time
> > looking at regmap and gpio-regmap.  I've been reading the code and
> > it
> > does look like I should try convert this driver over to using
> > gpio-regmap.
> > 
> > The open question in my mind is how to handle the interrupt type
> > (edge
> > trigged on positive or negative, level triggered on high or low).
> > Hopefully I can find some other examples that can help me think
> > about
> > how to do that correctly.

> regmap_irq_type".
> If you're lucky, you can just supply the corresponding values that
> fits
> your hardware.

I added some level IRQ type-configuration support to regmap_irq back
when I wrote the BD70528 support. You should be able to just fill the
bit-mask indicating IRQ types supported by your GPIO controller
hardware, and then the corresponding type register values. As far as I
remember the supported types and values are given "per IRQ". If my
memory serves me right there was a limitation that the regmap-IRQ does
not distinguish setup where GPIO controller supports rising and falling
edges - but not both. That would have required adding another type
flag.

>  If it doesn't match your hardware at all, then you can
> keep your own functions, or if its slightly different, then maybe you
> can add support for your quirk in regmap-irq. You don't necessarily
> have
> to use regmap-irq together with gpio-regmap. You can also just use
> regmap-irq or gpio-regmap independently.
> 
> A quick grep for "type_rising_" lists drivers/mfd/max77650.c and
> drivers/mfd/rohm-bd70528.c for example.

The BD70528 has not been used too much and is scheduled for removal. It
may have received only limited testing but it *should* be functional
though.

Best Regards
	Matti Vaittinen

