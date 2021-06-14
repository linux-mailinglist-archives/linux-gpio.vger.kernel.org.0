Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485513A5F01
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 11:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbhFNJT7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 05:19:59 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:59463 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232659AbhFNJT7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 05:19:59 -0400
Received: from [192.168.1.155] ([95.115.71.85]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N6svJ-1lFbgj263z-018MPw; Mon, 14 Jun 2021 11:17:46 +0200
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org,
        Alistair Strachan <astrachan@google.com>
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CACRpkdZV2v2S5z7CZf_8DV=At9-oPSj7RYFH78hWy3ZX37QnDQ@mail.gmail.com>
 <20210611035623.z4f2ynumzozigqnv@vireshk-i7>
 <CAMuHMdVrtSnFpPbB0P3Wxqm1D6vU1_cnh3ypsZJRNF6ueKdAsw@mail.gmail.com>
 <20210611080122.tlkidv6bowuka6fw@vireshk-i7>
 <0478822f-9d10-deb8-86ae-3b4ac3bb0c6c@metux.net>
 <CAHp75Vf0+bCnnD3wtkrPvFbr2k3A0r3eWNp87PyksiC7euaqdw@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <d127bb4c-722d-536b-c89f-4c40cbaa6479@metux.net>
Date:   Mon, 14 Jun 2021 11:17:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vf0+bCnnD3wtkrPvFbr2k3A0r3eWNp87PyksiC7euaqdw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JBsJTsE0kfv/M7lgTy2LC0iFoyVjK9bXnwZUReonTPF/G8cGKxH
 nYK4WUdqeK1Sgji6PS/xV1eMiWE1zbI+nWulHK9Fu4VzhPTl86vmnXnQ9NSvEtmX8SrDcFj
 2geBQejTG7FZYJqRFByLt6XE56VmYu3Ye5k/vn2rqimrP52+1sZJfyg6WF1Q8+NDQ5RgOwO
 RwJWhNNDWp3EEkipSowuA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GMqU/4AADnc=:cRAGKqZTFPBzsioTNUgRvV
 py9zkVQ5ildUN2avhp45MLgZOgTy9MijnAA+5zCidPJU10knDZJ26X5OcyNqZJiMnLqM8RkHK
 mCJjghY8zl0OV9nsULKI5nYjWv6rCF4OAcST7MWVaZinE4vnKCWGDgdFY0rndCjThx2YsYc8i
 Poj8CoUf7oQfFt3EalxsZn0iP33VhzJU7bm41fK7ChNcsp6KlgrcBYonzGmomM7ZZ+YdUSQOE
 4tdbiyPNAhp1UnQMfpz6fkiBRGdZi5T2TtGxChpnpCcvt4yHtEp6+Ohcb5E4B+KrNB0gkTF96
 zWQDw0LRVAUAnROqcV1J5QcXojX5fKUazYSGscX/bHw59JcPn2sJnCdK1ssykQVe4AISe02dW
 4GVw35jlc/mrnqM3w6iEe86OmpnDycuntJMVUMqicXUuK6z28p9Ep53qmS/qJH03lqQ1K7NHv
 Pk7lVH/OM6tUCEOmvEFz2P/Y+WASjzzFr2ETfm1CPNE0bZIZCYma1PrlwNSGB/fUy7YEz4y0J
 viYhBL6szFz40ehdmGvSUw486ejhcs5MSAN4WsvssLsdDc5PMOJY22AjAc7iAKRbw==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14.06.21 10:12, Andy Shevchenko wrote:

> That's why we have a thing called standard. And AFAIU virtio API/ABIs
> should be officially registered and standardized.

Absolutely.

I've submitted my spec to virtio folks last nov, but this wasn't in form
of patch against their tex-based documentation yet (just ascii text),
thus laying around in the pipeline.

(meanwhile the actual implementation is running in the field for over
6 month now)

Viresh picked it up, but made something totally different out of it.
I wonder why he didn't consult me first. All that needed to be done was
translated the ascii documentation into tex and rephrase a bit in order
to match the formal terminology and structure used in virtio specs.

This makes me very unhappy.


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
