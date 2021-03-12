Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1848A338F3F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 14:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhCLN6Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Mar 2021 08:58:24 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:53617 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbhCLN6P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Mar 2021 08:58:15 -0500
Received: from [192.168.1.155] ([95.118.12.1]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MMoXC-1l49Lt0w5c-00IiLB; Fri, 12 Mar 2021 14:57:57 +0100
Subject: Re: [PATCH v9 2/4] pinctrl: pinmux: Add pinmux-select debugfs file
To:     Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>
References: <20210302053059.1049035-1-drew@beagleboard.org>
 <20210302053059.1049035-3-drew@beagleboard.org>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <349b09f8-fe99-d0d4-dd11-c288bf66cb4d@metux.net>
Date:   Fri, 12 Mar 2021 14:57:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210302053059.1049035-3-drew@beagleboard.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8ouLmTGxmNJb/9DZK0LMfylhb+4A+kAAhh6ENb1fZ6+C7/h4IKF
 E6DCKPOlrNN+AA/IbOYmLBqlTV/+ZfDiziYPN5p6JZ/qlDYs7sxuFWRI37Wp2N8HVXAuSJT
 ++P6d4gSA6QE/vIqpWMoX3Vk0PZN0yPZCxbkHzGNGq04vbMUcfElGpWZF9EtA1VI5FZeiyO
 9B3UhYTRBK7ZYuJqgpK9w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ze2qBLvxJDM=:bAJuMgYNRkoGgA6RxQFVfP
 WbWPWpetI34/SJxX11w/t3KfCfUBQ1Z92b9qqVHfPzYpP6lERTAE8T9n/zERHjvYKQOYigBju
 RT8LW03A4RlYJc16WYmNNJCkAy+2wMhYJ5V1GKdtOQIN1slsWpVkD0sVoNjYzSgilA/zXVJl6
 JcONcJHviSC+MIJL50BQPC5lgmfC9LYgAOR0KlVtzmcybVq+qpgXc6Wp2dsQhLUkPcPXn1dy4
 r86VPKXRSJCpqsIt+cmaH5tAM2Qjw+uCrQ/COLDFdrcCMidAuy1aXnJMonv75la3/K0b57+Xj
 /aJ4KhKCrPIrW1pT4Dbw/dsd9O5JF/NV7V0JEYuok2sNGDb+Tvwhi5jr0Ozsx4k2yYOnj6wPh
 j8DihRZSk2lQeCaaJqCz4vOxrCMsjlJxJxeC/I5VyyDESQlPnsqhdrZ7oPVvk
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02.03.21 06:30, Drew Fustini wrote:

Hi folks,

> Add "pinmux-select" to debugfs which will activate a pin function for a
> given pin group:
> 
>    echo "<group-name function-name>" > pinmux-select
> 
> The write operation pinmux_select() handles this by checking that the
> names map to valid selectors and then calling ops->set_mux().

I've already been playing with similar idea, but for external muxes.
For example, some boards have multiple SIM slots that can be switched
via some gpio pin.

Not sure whether traditional pinmux would be a good match for that.


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
