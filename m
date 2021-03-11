Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E56A336FB1
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 11:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbhCKKRb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 05:17:31 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:37371 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232246AbhCKKRY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Mar 2021 05:17:24 -0500
Received: from [192.168.1.155] ([77.4.9.157]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N2V8T-1ljcBP3SEp-013tag; Thu, 11 Mar 2021 11:17:16 +0100
Subject: Re: [RFC PATCH 07/12] gpio: amd-fch: add oftree probing support
To:     Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20210208222203.22335-1-info@metux.net>
 <20210208222203.22335-8-info@metux.net>
 <CACRpkdb5R+VQrv0QuKa+EYmAMkodRpyv4fV1QCWQ+vcEyd0sZQ@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
Message-ID: <acae5f9a-1cc8-46e1-2b3b-c806679ef062@metux.net>
Date:   Thu, 11 Mar 2021 11:17:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdb5R+VQrv0QuKa+EYmAMkodRpyv4fV1QCWQ+vcEyd0sZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Da5Wubz3qht31qNBK8msWmU8qQAtD6bVMmtMsHo+GTkYRtzJd6S
 7Ol0A9BMSURMyP2Yu/miLKao45Xa13V5Kb3BWeOh7wqOEc9fB8UxguLXHW+rTwNElnvCzcu
 +qpaJRemDCDtrAaZOZQ5+Gu/dhQwzmDA7FyAhxa7HUfrSGX1sP4JjxG5OioUUIq6gZE/v1R
 6pjZgNAue4tF/Ksqv6lMg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dWRgG5/anZU=:mP3bijunZIqP6TdOJBFCjd
 lHZxNgzlXuBEB0VIBDHth7kTL6LMYPRRTQ52DA93xCrbGNJNi4kLNwAdPZ6PcgZPAj0TS1d8x
 h+ht1TtF3bSY7yGmoTNlC0fSTlEtSH+Z6kxjkSsxPYp1x2nP9dMcDYJxGPGoZEPM8FC0u+G6f
 NFIkuE8riEmyELmYA5E+/dp5cUTyS3L/m0fVi8Ot/6IbEQA3xS+ynsf3TfcrpUS9J/B9T2lwO
 NJW87RP3heEWl/BJOoASlUdkcpObwHGg1QfSGsazWc5rDoIyEhr3utt5bqyVvhGwmBqeLjM9b
 vIXZUExk23HQDuZu58Po5Ht0rzNl8nOMMGp3jslfcTbrqQTl9yymho/pX0hGnjSkrRsPe0xOU
 dIUcCuFU0RD1oPHjrquHUIc+5etomd9WggZjqUamxsNng/EbwXCRoVWZzKMyq
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 01.03.21 15:51, Linus Walleij wrote:

Hi,

> I don't know what the idea is with this but register are not normally defined
> in the DTS files. The registers are determined from the compatible value.

The idea is basically replacing the pdata struct by oftree node.
(subsequent patches in this queue use this by doing the board setup via
compiled-in dtb, instead of the currently hardcoded tables).

On these SoCs, the gpio setup is a little bit more complex than just
having a fixed range of registers (one per pin): the actual meaning
depends und Soc model and board type - some regs aren't even gpios.
(I'm still in progress of RE'ing the bios blob, to find out more,
eg. pinmux setups, etc). Writing to the wrong regs can cause weird
effects (actually not even sure whether it could lead to damage)

In essence: only a specific subset of the register range can be used
for GPIOs - the others shouldn't ever be touched. And this specific
subset is soc/board specific.


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
