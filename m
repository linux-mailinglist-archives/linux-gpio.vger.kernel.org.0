Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 356CE453802
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 17:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236275AbhKPQsA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 11:48:00 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:54473 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235053AbhKPQr6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 11:47:58 -0500
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M4s8v-1mnJ5p0GFb-00218h; Tue, 16 Nov 2021 17:44:58 +0100
Received: by mail-wr1-f42.google.com with SMTP id n29so38786174wra.11;
        Tue, 16 Nov 2021 08:44:57 -0800 (PST)
X-Gm-Message-State: AOAM532Pu/ArfUmlySO6a02Yf7NBqO4HLjPxglSldvYTlrnVpMEsNMGF
        eUzQgxSpnLxmgg5XsoJLDn3xFzmaK1IFUJQWUJQ=
X-Google-Smtp-Source: ABdhPJw2grIH+4dQ1gxr0lKUmKxg10LDamur/1rRU/k8eCH4kwjzR81J2UBp4rpjO0VtLkw61Vdo9nn7maLYQs6F238=
X-Received: by 2002:adf:efc6:: with SMTP id i6mr11299316wrp.428.1637081097413;
 Tue, 16 Nov 2021 08:44:57 -0800 (PST)
MIME-Version: 1.0
References: <20211116150119.2171-1-kernel@esmil.dk> <CAK8P3a38+Osmr7SjD42ZEQzOPwWXM7x+31a5E4bRWVp6JdMS_w@mail.gmail.com>
 <CAHp75VcCL1eSMaZy_KXdfY=UyTy-hxz4XN5TGkXd6Cf8p+pRNw@mail.gmail.com>
In-Reply-To: <CAHp75VcCL1eSMaZy_KXdfY=UyTy-hxz4XN5TGkXd6Cf8p+pRNw@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 16 Nov 2021 17:44:41 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2aGYTK1238TLe0uX1zT=cDrngKVhq=iSXLBKmyHoVnBw@mail.gmail.com>
Message-ID: <CAK8P3a2aGYTK1238TLe0uX1zT=cDrngKVhq=iSXLBKmyHoVnBw@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] Basic StarFive JH7100 RISC-V SoC support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Emil Renner Berthing <kernel@esmil.dk>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:nXHjagLWXDyLoZtGFzEoVJG0WRxr1si4ovftIlg49hztF+4ptef
 odCI6G5KRdet0VDwM3vCmG2MO3VjWRwS6ET8TTuySo6C31IM4keWlM22y7Fz3ixpGxfjemv
 MwJRRSVcKEzzOj0yFFZjTSmjNKnwpyY+By+z9H01scNkAkqmxZLpQUvIgKzACDB8t/9k/sK
 15pTnupJqr+t7416NHQHA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VNWLWllUTwE=:I6V1NOAcqcXXjPD7rRsz4D
 I+5it3cbJtwKrl+ZoqFs0C39VxK4E03fUK/XnO6v13YMiWEGt3XeH5nOyC0DgVY60EJllhqFF
 xj9v0kLFfxHt5uboWvgBHrDJ4Fm2edsgY4jqdcPCKtz1OBVgYqhGcVdTnfDWK17bQDEAyKzZj
 b0hoPuEkfkdkX0jDF/sMvYUA9FAjYQhzjtwRDTUUugpVqqibgMHdUuj4GJSFiwV5NTMwhVQVB
 c2HOvm28pISCFQ6SaZW9ls6eDHNQUpVNNQtvKoAF7Vu51HJ6j/7gaYT1RvH9uZgfrkcgiIDf6
 UANCeAJ6KmLMeduplrG10YhQC9+EenmCJk/yW8hiHjJ2I0EjpJfAMSv4kakDFPmDu8Sciz3KA
 6o/GHvIixgZWxBYhGLrRZ30eZ9R02SdSCNG1PhiqqPQKw7K5X1gzd6FgOTespo/9Z9dBEBf5/
 mNXWH6ITij6mZGaefp2i237jEnmhDZ1ePXq5MbST16XsORTzKEYKGUyFjF2gUBeCZBAEo/16I
 d0bfnxe4bG+e+9Fqn74uMA4FDaJtgWIV6za6RfEwCsmjVkBvfbimxVpAyvpfHj+MiFH7R1XSN
 kpyyvc/81DzTDctnqjvGyEZjl9n2car9DPAgJdXl9x0/pZ1rEiz89tTPNl+NG8ulMxUBt+my8
 ybCdPRQ3y2PajHPVeFKL+An3MkswzV+BB6iWxWylgREAzKM0Xnyl8OBM/xFtAFFieG4X43/jn
 TgO3AR7Wt43t3kbRquBjIQPe/4PGUXIV2fQh3X7JQp0gQGk6POFOX8+hoW/QJRKbrIRobb3k4
 tdfD8vSp7V8y43+CiX5JjYyV9f8ufEjbD70vOwHwYLb+G/fKj4=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 16, 2021 at 5:13 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Nov 16, 2021 at 6:09 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Tue, Nov 16, 2021 at 4:01 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> Why?
> Submitting Patches tells about chronological order and last SoB to be
> from the submitter.
> These both are correct. Note the difference between 'last SoB' and
> 'SoB to be last [line]'.
>
> Here is the excerpt:
> "Notably, the last Signed-off-by: must always be that of the developer
> submitting the patch."

I think having the S-o-b in the final line is far more common, and it does
help identify who added the other tags, i.e. the person signing off
immediately below. I don't reject patches that do this the other way round,
but it's something that felt unusual here.

         Arnd
