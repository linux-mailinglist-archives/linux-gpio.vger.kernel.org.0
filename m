Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B953AA379
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 20:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232024AbhFPSuU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 14:50:20 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:38211 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231942AbhFPSuT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Jun 2021 14:50:19 -0400
Received: from [192.168.1.155] ([95.115.35.150]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MxV8b-1l5MSc34zR-00xpsk; Wed, 16 Jun 2021 20:47:19 +0200
Subject: banned on virtio list ? [Re: [PATCH] drivers: gpio: add virtio-gpio
 guest driver]
To:     Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        virtio-dev@lists.oasis-open.org
References: <20210615174911.973-1-info@metux.net>
 <CACRpkdbwLOOT6nuhpkT5x-AZVipsD2qG8Qu4xoiRotHQNknwzw@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <c4b3b9b1-7665-c4a1-8a53-33f9481d7488@metux.net>
Date:   Wed, 16 Jun 2021 20:47:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbwLOOT6nuhpkT5x-AZVipsD2qG8Qu4xoiRotHQNknwzw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4yTTdnazCcdy51jXTnobM/EDbzQ0FTisHwufr8IqLM8oiF1UqT1
 I1TntUBxemNc/sD5f/b1HKBIqzscRv/b/XtX1jBxPSmWG4fQJGIQd++zbEqrCIU+W8nriUP
 PVYNGmrtm2dFlN5quMrwoPh20SrEZhrBrPvQYGyO3I2XeuWYgdYOL7CwFJQdn6mfo2LERrf
 oJ1aeZd1sVqkIHjG8dKnA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+Qp8Up1RRuQ=:e91Fbxp/OzeC2u2BBR/OlC
 YHafT4/nqGJuwNL4mTZ3zSuDXkbn8f2oztj2aWuu/LNfIdcKvUCtT1yArgaSDo7ik6XVn64Bi
 561L0jHopMWNoOmYRLCiKmcN2ALhXiUSkihQ+X2+zg8iOpKGP0L4us4z+TtDKo3hJexYANPYR
 /YxXqzX8UCwzyaUkcGgNsBgJbDEMsYitzPfs+aQtFzPsThsv+GYNm81WVd9993CXXzzYl5YbX
 0nFwiuRuaPSIJbIHMVpx5vypmA9mqO6meBz1tVccg/yr12Pwhc+Xhhqjn5x2RkvsMnDmjU5p2
 XKllbyTrWtEu46bi1WFox1t56cfviIQQFx8ILvctOejlR4erh7hz4bHpdGpd/iPmxEavLx38A
 q7zm+7az6RBtnvTWrU5HSZ3G8/2o/fyEGHMKYDlnUoIbKR0my508CY+qMONznmIYk3YE/NmGu
 P9qlELNWL098mu7UhUSiMNn+FspntTOadZCiRvYLKEKOR2fKPji6llyibHMG2rlRVzQV+I4Xf
 7Il+76VvJlCT+kYeyvxSvU=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16.06.21 10:31, Linus Walleij wrote:

Hi folks,


<snip>

interesting: trying to post my tex'fied spec to virtio-dev and
virtio-comment quite some time now, but always being blocked. What's 
going on there ?


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
