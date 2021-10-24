Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 596F1438BA7
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 21:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231733AbhJXTfa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 15:35:30 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:46019 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231538AbhJXTf3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 15:35:29 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M2fDl-1mg6xB2L3H-004DXt; Sun, 24 Oct 2021 21:33:06 +0200
Received: by mail-wm1-f44.google.com with SMTP id b133-20020a1c808b000000b0032ca4d18aebso6898085wmd.2;
        Sun, 24 Oct 2021 12:33:06 -0700 (PDT)
X-Gm-Message-State: AOAM533HTIBq3hCwwGKazh6pnxCKMId/bIP3UF9zEsThuL/ne2PSMtw3
        SMk6azf+fGYpUUAX7yA8s9WmTDoGGzjnbJPgCI8=
X-Google-Smtp-Source: ABdhPJw4hH7C/a2zk240txDvHL7tN8+k+dIxhQayqZg6YZyRuMpfgd65spSGiNjZlg56v83/yxP5Ni8w6w2+98dAEhQ=
X-Received: by 2002:a05:600c:1548:: with SMTP id f8mr15117795wmg.35.1635103986146;
 Sun, 24 Oct 2021 12:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sun, 24 Oct 2021 21:32:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3ccWgpQF8-Ej7Di_=eCs+cibDgiY5962iPKsMgzD_qSg@mail.gmail.com>
Message-ID: <CAK8P3a3ccWgpQF8-Ej7Di_=eCs+cibDgiY5962iPKsMgzD_qSg@mail.gmail.com>
Subject: Re: [PATCH 00/13] This patchset aims to add initial support for the
 i.MXRT10xx family
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        gregkh <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        SoC Team <soc@kernel.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Abel Vesa <abel.vesa@nxp.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        giulio.benetti@benettiengineering.com,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        b20788@freescale.com, Andy Duan <fugang.duan@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ijSh8KXz9yGLScq0wxSXSqtezBqpCDdhnwiuDPpD9kH75RQnRE0
 ZK/afQsy0B4yZ7y1N0VpJ/G9U9EeXQ0Re73DMdXLLT8x0IhLZQ99krcnis7WbHBWavIn6lU
 d9D4O0kgZowaTVUN+gzAIM4OYi5NCI67u5r/vV1+pAyHARaNN2y8gZeKuzhJRkViH/cKrBi
 AojeRN/GxKuaWQfF5S8RA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dhGgQdPx4oQ=:UHVrONz9YTHa3Lk9O6zc5u
 OSVCwKR4calueVJjuvmN9YpKDezKl8EXtP7NQFF1BWLLZEivMPyVzz5FQgnX7+gPxpqiNN2+5
 G4cqI1J9oI1OkgojGhBL7O/xtt+buZcIiQVJMIXwX79GJh2P8UgrGjYbGGxNwbGWfQw3NRU3m
 kWBLD4ltGzMQqH9HomM1d9zlIsnrJ0eSC7zEjDx8LlEyXTvlsGuFH6MskIIlaMg0oxiqKST9V
 8OUx2I+AXsH+iT4uxFkunq0x+a+lUfXuudFR6sDbdPOSydYwSY9EGVIMJZEjWD3KjIXPMaCou
 GfWIp/sLG5DVoPKGYwYZiYv4V4xaDwmkJVMVEJa/6RqkiOos6PwCWyCcpWL8D1P5LDFgtQ2VH
 kKnIafyQCY1g4Mop5H2GSX5OjeX2x3WrgOVmK97/EU/4gDfY5soZNI6hGo5r/ZdwKVrWIqI6K
 PZCT6GwfJNS2HEUM1A7Lz1DMWvQTT0jQk6ekcp9k3RR5/xPBerd9hh0STGW+D9ykEK+M2l/9Z
 w2UACRbFZzVHj6FbwibFOCkeuKVC/hWPxFB+4p+XNflWhFR/lLfBYCPQvDYtEi6C+ZN3/Q4kY
 f0aE2BZM+Ki56j/rsI4KiWC054YLlzb0iTCilri0kww8q9dqvEZQrN/DKxp4vzxS6291CVXmn
 oBUIYvNKNFNPioL6/Mq0Vp6KhAlWrzyJ/TCGIjlbOZr431OiEAGI2+AAc2i5/+Rt8bImuioAv
 CQXSraJG7uK0niWXxi3i/7j22mbT84Lo5+6T07J1S8nuKaXrKIvUXOUis2M0OieN2iYeR/P/W
 ic2iIGmZVQ9Hn3VzAZ4WFgeQthqLMF2jvk0/fcQO3gVu0ZmtWY=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 24, 2021 at 5:40 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> Add initial support for the i.MXRT10xx SoC family
> starting with the i.IMXRT1050 SoC.
> This patchset contains:
> - i.MXRT10xx family infrastructure
> - i.MXRT1050 pinctrl driver adaption
> - i.MXRT1050 clock driver adaption
> - i.MXRT1050 sd-card driver adaption
> - i.MXRT1050 uart driver adaption
> - i.MXRT1050-evk basic support

Can you expand the description a bit more so it makes sense as a changelog
text for the merge commit? It's fairly rare these days that we add support for a
MMU-less platform, so it would be good if the introductory text answers
questions like:

- what is this platform used for, and what is the purpose of running Linux on it
  in place of the usual RTOS variants?

- are you doing this just for fun, or are there any commercial use cases?

- what are the minimum and maximum memory configurations this has
  been tested with?

- what user space are you testing with: any particular distro that supports
  this platform, and do you run elf-fdpic or flat binaries.

- are you planning to also support the newer i.MXRT11xx or
  Cortex-R based designs like the S32S?

       Arnd
