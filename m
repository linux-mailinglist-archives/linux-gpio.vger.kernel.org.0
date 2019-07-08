Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 740AD61F77
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2019 15:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731270AbfGHNTp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 8 Jul 2019 09:19:45 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:46789 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727352AbfGHNTp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jul 2019 09:19:45 -0400
Received: by mail-qk1-f195.google.com with SMTP id r4so13166247qkm.13;
        Mon, 08 Jul 2019 06:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SzbhuV/R5taZNptI2ygE950lIemU0Db18Xrnu/N80Ms=;
        b=TFIj4WrTZbwUuFW59QihtT38QwlNrWOS3yfe6WB9v/XmotdI7crfXsd8zgmhgACVjT
         e8fkVzBdeBAf6/MDU/vyWaKPNCkWI33Mm8UxPMYs9PmJVsdkRAoLrNqKFB8yR+l7OCHg
         +icqHrWBhdk9PYvr7a1+07zMatl+MgC58N2COmrnEM+ijMBV/ufr2k+g0txoEYu4ir3+
         dQeFJCvN6IDIm+2tabZI991NDEc/pfdfe+6p1qUMs2fOs1gbLtVU2JzWuE8QjKzOin6b
         +5KgzkYgmDmNgAU1R2YcpjcKCxBOPNR0Ejs8CU67J5OSwZq5gWyAjKiWDmqut1uD5D6d
         JT5w==
X-Gm-Message-State: APjAAAWh3XeiV35+pfLKx1lAU6+Xu/S0xi/C96atzvLIIqInTGIvTlQV
        q/HuLgo+5IQDbRonBm5LG/sr4ERU4yxBGjTdSio=
X-Google-Smtp-Source: APXvYqyWMbI3aMnuYlyu/Ox1IffphTH+LvZqJH0Foq2cj6a51UdOphd5OwiQr9EqCu3tWjnBP4Hoy2gaxLwVDA4T2UI=
X-Received: by 2002:a05:620a:b:: with SMTP id j11mr10525816qki.352.1562591984354;
 Mon, 08 Jul 2019 06:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190708123843.3302581-1-arnd@arndb.de> <d30c122c-297e-3370-86d6-039388b48cea@gmail.com>
In-Reply-To: <d30c122c-297e-3370-86d6-039388b48cea@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 8 Jul 2019 15:19:28 +0200
Message-ID: <CAK8P3a3NBrBRuRQawJqZr+awRVfqNsMmDw7qw7oRjWKhKOjPkg@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra: fix debugfs compile error
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 8, 2019 at 3:06 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 08.07.2019 15:38, Arnd Bergmann пишет:
>
> The offending patch should be reverted already, please see [1].
>
> [1] https://patchwork.ozlabs.org/patch/1128007/#2210871

Ok,  sounds good. With my patch on top, the other version is a little
nicer, but the revert is correct as well, and probably the safe choice
during the merge window.

         Arnd
