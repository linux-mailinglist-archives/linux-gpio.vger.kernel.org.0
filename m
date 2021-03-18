Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6640934008B
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Mar 2021 09:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhCRIAW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Mar 2021 04:00:22 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:59005 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhCRIAS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Mar 2021 04:00:18 -0400
Received: from [192.168.1.155] ([77.4.36.33]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MnJZ4-1m64Ua403A-00jJeq; Thu, 18 Mar 2021 09:00:13 +0100
Subject: Re: [RFC PATCH 07/12] gpio: amd-fch: add oftree probing support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
 <acae5f9a-1cc8-46e1-2b3b-c806679ef062@metux.net>
 <CAHp75VeWW__18hwK+-uEibpzLpehD4h=QCnTbKOc-2GbkMB0TA@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <7b515409-1315-acd4-688a-c0eb4958d505@metux.net>
Date:   Thu, 18 Mar 2021 09:00:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VeWW__18hwK+-uEibpzLpehD4h=QCnTbKOc-2GbkMB0TA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:k1ORnNLGmMzbZFeU6W++jyO+qaqeSbOoCX5rjB33Zgmcri/MTh1
 fQNlBQ2KvlOs8Lq4J5O6ObQC/OYEOSBbHJD/UjkDOgwpwcJKS2+0K2+q6MSPsKx9IraPl/f
 X99dcUHyKuEn2vosRJj7MkNQgc6E+nzGT/Al+H+NCpqrZRfCRdbCc7eb756eBD2wD0l40Ex
 uoYmG1Ubo4VQckV34peAA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FWxON7wiLFg=:4r66Jz+W2b6AOUHr6laiHa
 ROfNcQe/h6SseyoCc713QWOKgFO6SeM5rTTlpQG0ob/UFkozV6NKMSfWhFnXwlw1lyNNpPFsE
 afhh/r0vdto+XWqMaBquW66rcc6/9jzKuu5bIQM1WzoBb16zmx3Z9Ws6Uuc22RVWhZPjjT1xG
 9s58mVDLtYj+tOAEldlMlnyPxv7uYkPlc1BAQKeMFBwTy4OSeVJQqyLm9igra76NOSY9QCUvk
 +ttDb8DIVgOc+OFMuAuhQ8bo75ChN6EMG7J/BF8bJOCeDDJtuDteenpWpuzlPFgM/ejgaZnzS
 Bpk/GOFfvaaAR5ENW9cMogY1tKaUCirHiZal3Ykx0v2DjrbYZmHWW2qDrtcddZSCzEIyMIB7E
 siTsHOXTWPdty+jSmq54JBy4CNTIZqp3FHKqjY4mfrDWtViFiz2d+gSE67GWn
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11.03.21 11:42, Andy Shevchenko wrote:

Hi,

> You are a bit late. We have built-in device properties (and
> corresponding API, which recently becomes swnode) which aims exactly
> this.

Is there some compact notation for swnode's that's as small and simple
as some piece of DTS ?

My reasons for choosing built-in dtb have been:

* it's a very small and compact notation for describing devices
* no more open-coded registrations, etc
* no more need for board drivers (except for the little piece of DT)


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
