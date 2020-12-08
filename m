Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20E0C2D2802
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 10:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbgLHJn3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 04:43:29 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:45769 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728007AbgLHJn3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 04:43:29 -0500
Received: from [192.168.1.155] ([95.117.39.192]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mdvyi-1kBrd02oNy-00b1rX; Tue, 08 Dec 2020 10:40:56 +0100
Subject: Re: [PATCH v3] drivers: gpio: put virtual gpio device into their own
 submenu
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
References: <20201207203816.18269-1-info@metux.net>
 <CAMpxmJWinRPUrmpcqsLaE62uAQpZ3Cb1ys3s7oHmeKM6rUUqQg@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <c839fa75-80ee-31e6-2ccb-87155281e1d4@metux.net>
Date:   Tue, 8 Dec 2020 10:40:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAMpxmJWinRPUrmpcqsLaE62uAQpZ3Cb1ys3s7oHmeKM6rUUqQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nBA98hAC7/Ipc4TroA9tXLaYgK0mRhExXlwhSPQw+rhsiqRkQHg
 udlHgaKFgf9u+h6deHgLPaIG5G5Fs8ul62j1xKUCRjgFnyqoRRLn4QBwP9BR5iyJp9DDGqo
 KA/H/EKBmDRTcBdnKhYn+reyZJfJ31TusajcbjSkOUtj3aSh2r27klJVgHzfB4McR9WTSr8
 mn5jfUcASS9bDFjD/8INA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aMvaIfnxHX8=:FGY5y0mnygyPxYSz6ZTWbI
 1W7icYA/bUIBrYRMPwI4ZFS1ChyTNyCDdXjlyIytkYwVqWVB8DvBMjebOMxKYbfeYbTg8Qsbb
 wAQH21JYJduYsN8zDbNLUgxJVUrs2bwEs3QehNcKJlLPa6mvfr5MpohmJ9dWc2vR7GbdLsx8/
 FpW9jfx+Gr4FLKTX9BY7fcyFWtluRhXLlDLIMdoz1BRSCGFJSD8TXKyvcJf5A3982f8vcui74
 Gt6AJI3ja6dParITjgA0LWcWyCDU+n5cFpXGd+1QLeXse8UwzvMoToWhfKnM0q0eg3Bu1uHay
 QmLc7DxoFsuEHk/T1oG3OJKOOqr3uzY6/161N1jySAYMGQILrYFWkGTo1enQT9sfaW2T/ef4G
 Wez7wROJ6HBrVHwt/hanGIHBXKgT5zBlN3Av5NshYcGklzRgzxHE0D5oyu6DR
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08.12.20 10:15, Bartosz Golaszewski wrote:
> On Mon, Dec 7, 2020 at 9:38 PM Enrico Weigelt, metux IT consult
> <info@metux.net> wrote:
>>
>> Since we already have a few virtual GPIO drivers, and more to come,
>> this category deserves its own submenu.
>>
>> changes v2: fixed menu title (replaced "devices" by "drivers")
>> changes v3: added patch changelog
> 
> This should be below the --- under all tags because we don't want this
> in the actual log that goes into git.


Sorry, wasn't aware of that. Does git-am automatically cut it off ?


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
