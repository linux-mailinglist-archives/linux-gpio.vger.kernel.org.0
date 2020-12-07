Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 608A62D0EEF
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 12:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgLGLZe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 06:25:34 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:45757 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbgLGLZe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 06:25:34 -0500
Received: from [192.168.1.155] ([95.114.88.149]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MMY9X-1kTKyR0ddv-00JXzz; Mon, 07 Dec 2020 12:22:52 +0100
Subject: Re: [PATCH v2 1/2] drivers: gpio: put virtual gpio device into their
 own submenu
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
References: <20201203191135.21576-1-info@metux.net>
 <CAMpxmJVkXeH_B4A_e1Vy4H2LcQnNz0BVoZyXNKEXmG8NvgO6cw@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <169ead3f-8d6a-5de2-772e-707b7cbab635@metux.net>
Date:   Mon, 7 Dec 2020 12:22:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAMpxmJVkXeH_B4A_e1Vy4H2LcQnNz0BVoZyXNKEXmG8NvgO6cw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ln1Vk8aZ+xYN6SKVVwyXg/icq2rUNG6aQh3VOfQKle0ytH4nyGl
 AuDiIa1NR1CbTBRsRm1LRT8KMgL3tFtW9Sd+dTB7zyjB+BP3wlWe5i7vdCN2/uorFtn7n2x
 +WEAQiCGcEG8YNQDrUbqzJQAzB3/0CfHFk6Sg4QaNVJ2idBfoTvlWDAgcKHlVD5jm6Solmb
 wmb2e+WBXCjyEjVi2rBnA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ja1UYl5fJlI=:TnURbpt5+bz13c3bg+gtyg
 QDkV/NyH+je8tGZeHnHcwpToLOhMMMw0bXBq6apc4/rUVNALaCHRSo+VTgD7TWlm8PyM1IByL
 6dZRjL2FX2FVOCqnDwFKbIbBUaAiaq/PnlczOkN3vXSs0EVgo+581eD2uLZOdrz8zG1oejWvr
 sX94szIess39b9Y5QpCzY/5zjSj6h9QOhvKoQjfrk3jW1cRMwojvQnk08ShSkdRq4khvkh6PP
 srsVXie4+zDVG51ML0m8fLyNfV4GbaXKHNX7+KMg7z/0oE4doQ58XiV8qFDD5zH5TH0HI/yWG
 5cSQ2BjAJ5uyvnUcvItsha4f2IiCCeMkiEyBwDBItAfYC5/+izHrh7XIG3FOk+M/mWuMBqQBo
 1pI+60cPNqll7ACVHSVxEh2aVxMVEXBiTiajkIFF8OIyTsOznG1j9om4iFvjP
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07.12.20 11:31, Bartosz Golaszewski wrote:

> I'd call this section "Virtual GPIO drivers" because the code contains
> drivers not devices.

fixed in v2.


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
