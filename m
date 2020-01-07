Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE23132674
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 13:39:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgAGMjJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 07:39:09 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:44713 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728174AbgAGMjJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 07:39:09 -0500
Received: from mail-qk1-f179.google.com ([209.85.222.179]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MYNeM-1jBEXB2e3e-00VQ1g; Tue, 07 Jan 2020 13:39:07 +0100
Received: by mail-qk1-f179.google.com with SMTP id t129so42459063qke.10;
        Tue, 07 Jan 2020 04:39:07 -0800 (PST)
X-Gm-Message-State: APjAAAX/iQrxSoPerxUF0TjZBJE9YEzEfV/yb/nnrAkbToBtigb5W/u/
        8MvE9X/WkI0R6MXosNejlvkPUG6fEk7r7jTtJqM=
X-Google-Smtp-Source: APXvYqxj7f+t9CP5sp/36VUBLMUQTa+e3WyQMflR8nTwCW8t9pJYpNTyr+4ZiOuV0aweiM6aI/SDnWdyvZrQA34+sMU=
X-Received: by 2002:a05:620a:cef:: with SMTP id c15mr72172409qkj.352.1578400746409;
 Tue, 07 Jan 2020 04:39:06 -0800 (PST)
MIME-Version: 1.0
References: <20191218163701.171914-1-arnd@arndb.de> <CACRpkdbqzLUNUjx_kt3-7JLZym2RZ47edW5qp0MgXmpW4-Xf9Q@mail.gmail.com>
 <CAK8P3a2BoVcdgRZqYutA=_SVHLtJwQzP3mKKN-q8n1ROj_iPgw@mail.gmail.com> <322b5fbe-e9ca-99cd-80d0-000a5464b37a@opensource.cirrus.com>
In-Reply-To: <322b5fbe-e9ca-99cd-80d0-000a5464b37a@opensource.cirrus.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 7 Jan 2020 13:38:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a12NievRVGgcyuPaFC3eKr9c7Y3KiTnFxEaLkDyzCCj1Q@mail.gmail.com>
Message-ID: <CAK8P3a12NievRVGgcyuPaFC3eKr9c7Y3KiTnFxEaLkDyzCCj1Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: lochnagar: select GPIOLIB
To:     Richard Fitzgerald <rf@opensource.cirrus.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>, patches@opensource.cirrus.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:egrBH3XqHZeI3+RAO3CSGSoEMjHx/sJZdt+/cLh85iheKpqunxB
 2uKXv+IrY0eQR2PFyA04ITiKatlefq+ofCLr+dKunGBzeHrsAV0JL4ojLJ6W0KuLmc0SCxL
 wKqJuz3nw04PGAnSkZDH7zyHFBE9s56RZjNi0gGaQeAdORmgBnYa6bdsAPpIjyl53ITTnV2
 wssAUfvaIaLg6GUDFycMw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mLl+FwD2Vzo=:wCVer+QXMXAeur0zS2F2Gu
 +wFfB/h0nchAyv2kpJq/1/91K4nQgF4xCq8bJGPSZBz0HzUnjU1bPfzuG0PifAInoLMOmFvgp
 OnGFA1X+ZsTrrCPeCOLTCdTjmyRjOvGR59fc1b75DJVSVAGlMtVuRJCa9VjyatElLamEZ3Ynu
 DI/WS1BHlgZ14Iz34OCFZwsT7BazkdNBVKlfZxjP9CHye+oYyCFTusTP4rjfRf7bwD8RQlvs2
 ozO/ulXgw/hmftkOAtuaYvEi7RcgTLPsUyaKm99foJZ3BEn7YvgcIRvNvcjK/AwJVBqnNa/Mv
 +oNAh4wpn6Bx0O+MvK+/E/tX2jOze6B2N1JgGj2TmpDWu7bYNByAE/g8vkXOCxnDoWR8Syxg8
 IiAi2aNCogJUzy/47WSTKBohAdMFDMy8dgQjTt1e8i9rELbOIb5Ml7mmb91UzkmW/d4OSuevg
 Suhdi6x/8LpWFMqkm8vjAd95ae8YZ5FqqaUJ63Usl4+EZPXaVh7oOna95srVySxu2dn9MCubH
 7B8j+YThmCYu5Iltaj0finrMDdttJkOV/h4+Gakf8xEEWQpejQwmdFqu4Y0nfLJR6mIrlHj1y
 niu56LweLbxujx1ziMhTpG5HnYsnYXYQsl7NjJ3MmxS02a1OiAP4Rsp2Qv5j57wFSM/wZarhG
 b7qEa8Tkfi2SuORkM7+bcKHIRtsgR0A/mLWrMKy4UAHgDpe9GI5RRzFs3luEyS+RKHW/7U2cq
 bgo6S9gZAG2B75ufPbfy9/p376f8izZVnhw2xSJBYu/9nllXiCsBG2mtI3yOB7VehjMm50PhI
 zFfCRtEppsMn4prE0pZGvTguBSzKHIb+nw23DCfivsUqdCrpgWe0Ssdxc/VCRMtDNF7bf3Qw/
 j1SsT77lOTKSHzMx78Jg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 7, 2020 at 12:58 PM Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:
> On 07/01/2020 10:39, Arnd Bergmann wrote:
> > On Tue, Jan 7, 2020 at 10:45 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >> On Wed, Dec 18, 2019 at 5:37 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >>> I wonder if GPIOLIB should just become mandatory when enabling the pinctrl
> >>> subsystem, or if there are still good reasons for leaving it disabled
> >>> on any machine that uses CONFIG_PINCTRL.
> >>
> >> Hm that is a tricky question, they almost always come in pair but are
> >> technically speaking separate subsystems.
> >
> > I think there are a number of use cases for GPIOLIB drivers without PINCTRL, but
> > are there any examples of the reverse?
>
> You could have muxable pins that aren't gpios. For example muxing
> between i2c/spi signals. So a pinctrl driver doesn't imply gpio.

I understand that this is the case in theory, but what I was wondering about
is whether there are any such users, or at least any that also want to
save a few kilobytes of kernel size for gpiolib.

          Arnd
