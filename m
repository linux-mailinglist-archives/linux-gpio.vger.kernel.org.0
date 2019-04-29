Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDB75E1FD
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 14:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbfD2MLU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Apr 2019 08:11:20 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:49575 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727913AbfD2MLU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Apr 2019 08:11:20 -0400
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N5W0q-1giu4d0OAk-016uqO; Mon, 29 Apr 2019 14:11:17 +0200
Subject: Re: GPIO Character device driver
To:     gianluca <gianlucarenzi@eurek.it>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <0fb34aa5-60d8-cf6d-ffcf-237298977347@eurek.it>
 <CACRpkdaWGBoV_OFkjj6y0Rayz1hNziDCaA7VXh+1Uf5soh46Ww@mail.gmail.com>
 <7e0af1af-a565-a12e-8356-e9964d8174c4@eurek.it>
 <CACRpkdZs_E=6cjPa+vaNvqcXF1DmtMPujtPLS-nPQqysYhG2pQ@mail.gmail.com>
 <4a854870-d294-8a84-8d82-51a90e20b362@eurek.it>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <b15d2ef7-c26d-0900-76e2-56c3c3756047@metux.net>
Date:   Mon, 29 Apr 2019 14:11:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <4a854870-d294-8a84-8d82-51a90e20b362@eurek.it>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:CrSKcEezL/yDmWyIVm5IosfPMJoxFbzeif37ALi9e5yx5b5pIaz
 8EcZgmPmI5WT6XaTTyL4IPS/UgBiDWOv03cm5dGCNLqu8kccnMk3ZZ3LUShG9yS+c7GExPQ
 7KR7tj3CKrt5PGLLQ5iBI575Hg1CKPlfV4dqsomRfJ0CbxI1MLLriEjmnX29nUVPZ3xUK/J
 sZE3A+73f2R6EeCf0ZrVA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JKAfbKuz6go=:6zX8Qps6waDpfA9/awtYPZ
 EXsFyI7jODOuyPW+UoiP38ixLoVJfulZIWX0yJdipv+r//mtc043rmyI2hMVOHNdPAh3oVi0t
 teZ0/z0mC/EcP3+BCWErejbZavKdnYDNefYbehUHaYOAuAPfHRbqn+369Nqim8/kWP8jdevii
 TluJsVkuligucyEVQX/RVCuJPrtwIN/QiyrYpQOBUrfB+ckiLTq82zLxoQwRGWEyOupHspHRg
 j6eYi1/SKpUPjQ4tEEBxBE7aQr7vJ153RSt6akNLVRUYUe7b4Ntuf1FEHL58fRrUwGdRvryXX
 HStBEYFriQ33cFdtgkI8LRvi0RYFu6rePP2w+PfCHnVITUSxr4HRrfUgKVRuFqkxo/KQFjQOy
 d0QYGwZmIf7CCge6VM/K4G4j2Kfi83cNXMizJw5Kk3oDLtNy/aNWKFsRbQNZcZ01aL/lMqIeU
 +O+R46LkH0oXBRIkx/4VuAwIpunSNBUV7BGz9SO9J0dcqVkLL1CMQLdopxfAHEXwJGOUk9nQN
 wmBUEotdkLifv89bPcJ06wj5pNRf85uzIrs9Jou5NBsTTHYuaNaySlY2ncqSYXC9+BNrSjDb7
 PiMM3UVHC6c0eju/MF0Qq+06irqrxVFR/yp5PiUCfu6thaUoQ2fzsxQO/9IzpArDQYfdpTBKw
 BytAp0GO/BtVyowLXvbu0Gh8CE/yN2q1jgCPdJYMKVLax/VDYiXyw7cxZlJLVdQTDW8nYs78C
 G23zOeU4u64Fn+F3pVrjrVMcFxJfXXKG6eVWf6L5fGy8MtUdBUwz/BhVKZM=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29.04.19 11:49, gianluca wrote:

> Well, in my systems I have systemd disable because we are heavly
> customizing the boot sequence as we are using sysinit for booting...

Me neither (I dont let such Lennartware anywhere near my machines :p).

But do you have udev running ? That's the one who usually does this.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
