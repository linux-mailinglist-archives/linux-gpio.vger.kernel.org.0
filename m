Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E38B3A5F1A
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 11:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbhFNJbb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 05:31:31 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:48155 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232528AbhFNJbb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 05:31:31 -0400
Received: from [192.168.1.155] ([95.115.71.85]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MWiYo-1lqaDm37MW-00X1fI; Mon, 14 Jun 2021 11:29:18 +0200
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
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
 <20210614091218.mj5hdx4xhy4vho5x@vireshk-i7>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <b7c28e22-31a3-24ea-4317-b5babeccf519@metux.net>
Date:   Mon, 14 Jun 2021 11:29:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210614091218.mj5hdx4xhy4vho5x@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MqV3Z2CyoWMK6/vzPEuCWPVb1Ozuwu6FCqfnYZ4TbTh2IYwSa61
 txmFcsxKD8LDGc8bhre8U2Fn5xyZ2TfSE5ywX6l96uol/MhqgVPmu5fP/wFaJrrhvZAWQlK
 1MyP7jSt4JIEd2/c/C6YiLeaR5GNP5LRukB4FFUwK2S13gtRfwKwlkpHuaSLlNmNJ/X0ZSm
 NmBUf7N1FfjCu+vEsaSfg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:t7VQLhZbY88=:CzAWpyZgqYmgRnvUC7ng9r
 b+X53sr3TpZmKIOXB7l+7jmwWnM4tAPlD3HbBpsAeIknEIAeDa7rHQVVS/JNWumy2qyoLqOjp
 dggY9QxeuOrj3akonjiaFxbclLZc7OuJr/rrA+OE6eUDR3NRI/MApQ0qc1z5jAgJIve8d1Hy3
 9R/eGtNUd/QwU+qwWvEHnOjXgjuxzsA45cSjYIuX/DFW5qYKt7r3iJSc0numt/nnvtpNjJ4Bv
 3csyY7ZvFl7o9wk/sRmp01/sZEz8ZLNBB9oesSzzT9I+kkHWCFCwI+5Bx+QWXZASov7PmLytg
 EOjt7fi+LnZfbQey9u462qEVKBY0lwPX+1xiLU2Ux1qa5/nqvgadEcWDGx7ZZk4sfu8ng4WiW
 lwgQNtYxRElvY99HzbFoi+7ovf5dYAV2pYgYqyYJmOAQTcfF8IH+64Fgb/I9ujzs6RR+9LnbM
 tH87z5Dj2QecoAxkROX7Jz782hucJT7X05AyPeogenXMUU0FiZChhVanE0jcdFf4qvHeoO5dF
 W2rXxt6cAcBrKjEuSLeA49m3yoox5aBULM7qnnntCWA6fPT/f9zaxmEhvoi9mb4Cx5IsY4mQS
 d3H0pice8sNbX9dyqCv3td+rtEAFEulyN2
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14.06.21 11:12, Viresh Kumar wrote:
>> Note that this is completely different from my approach that I've posted
>> in autumn last year. Viresh's protocol hasn't much in common with mine.
> 
> The protocol hasn't changed in a sense on how it can be used. 

Sorry, but that's not correct. It's an entirely different protocol,
entirely different signal flow, different data structures, different
queue layout, ... in no way compatible.

The only thing they've got in common is they're both do gpios via virtio.


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
