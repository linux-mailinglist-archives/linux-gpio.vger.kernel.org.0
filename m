Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA613A5E14
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 10:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232583AbhFNIJn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 04:09:43 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:49753 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232530AbhFNIJn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 04:09:43 -0400
Received: from [192.168.1.155] ([95.115.71.85]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M26n9-1lucVX2qYD-002Unn; Mon, 14 Jun 2021 10:07:30 +0200
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <0478822f-9d10-deb8-86ae-3b4ac3bb0c6c@metux.net>
Date:   Mon, 14 Jun 2021 10:07:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210611080122.tlkidv6bowuka6fw@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5H1L+Ex7ZC4oLqRcKzdvgpyI25ZIf+Ocm4zxpAaFyNTtvXvaMJv
 7hFfUyuU0ZTlsuQsZHLYoefeD/MNbY0jyUf52kB6Izj4LBtlhsRRsGRKFeM1gcYQ4umv456
 qO/zCycpEg0+AoNFn9tGFgNNIOJvG6fO+2o3aRI5xkXG55E/ZD8aZfDhWaxZJIjqlmw6/O2
 OK5KfX+UrcoMKTfpLAfVQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wHlBr1mS1qE=:Vl5Ups3XZz5i92tgw4v+SQ
 n6aXOQ4RkWiN2MXHblKpUhMDhf0eACabCKjq9Lct+1R8ffdp8ydUd5w4mzu/NeUSFjjIAo1OA
 1Sc3seBFL+WY7k4/2f/BaGtBUNrwROiUR/DD2PzOJVp5E4fyyN1plD02Bs+uXtBGUHnsv6YIG
 ya66HAz0n7H2fU6DxETvgbFn/vsNnWcf3M6uMSsL2Aj8QKExDTskQHdXe2Zxyw7XV4h7yiRka
 kqJUtUX2UiM47U7un4qehkRIi2AmbZAXjfQreODOAAlIN8lSsn+2WGMs7h8qaBTZqq5eNGSg+
 +itpYA82ggH/WWWy46xKgAlfjKpYQ1N6YVfB9mcoAU2NTZk7wFBjpbFdtV9VLmluIPXvuPMy3
 KTZCCFRbMxq/Q7YUpG3W+RUwqShBlg+3R4cx+VmPCEjBaiA/pBjkNBb4pMgprLkMR44iOpRYH
 Hd+abtCtez4oDuNb1SUJ9wQehU8ywuU/xaIXrAMPznZaUBJHIP7VcqQf9cS8x4RUIP04zs8Ip
 80xpEmEhCptzvXH889HdZY=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11.06.21 10:01, Viresh Kumar wrote:

> No, QEMU passes the raw messages to the backend daemon running in host
> userspace (which shares a socket with qemu). The backend understands
> the virtio/vhost protocols and so won't be required to change at all
> if we move from Qemu to something else. And that's what we (Linaro)
> are looking to do here with Project Stratos.

Note that this is completely different from my approach that I've posted
in autumn last year. Viresh's protocol hasn't much in common with mine.


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
