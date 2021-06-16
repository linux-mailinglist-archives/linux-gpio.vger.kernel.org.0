Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE933A9E81
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 17:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234407AbhFPPHB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 11:07:01 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:52333 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233928AbhFPPG7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Jun 2021 11:06:59 -0400
Received: from [192.168.1.155] ([95.115.35.150]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MRCFw-1lhUQP0Do4-00N8qA; Wed, 16 Jun 2021 17:04:33 +0200
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
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
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210616114934.n3grzuh6c64wlaj6@vireshk-i7>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <5cffb354-0d00-5ace-260d-61ac0c4c7491@metux.net>
Date:   Wed, 16 Jun 2021 17:04:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210616114934.n3grzuh6c64wlaj6@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TxZhqDkofwIuzNYeg+qu2UL02JUe3fVzRzNE+2oUee67DdHJvQj
 q68S++GyWXVYp+8YHOUzcK4e67z2YLSPoX1VGgXSjWI7wHjS7X84d832LyWhsYq3VkTR/jp
 3pXJGRF7jXozXa2lUgk2lettiOeyxpf4g1ByE/sVy/yFtpOgrlPRb1DjgVOXpJyQAKqJE7X
 B1fZ5Vk5eKnhCra7mY27A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KynWfsTDx+Y=:tdRvN0rPwvPA1iIfjnn957
 fBCcpBlKMO/VHCgP+l4KYYTomIAtZx0fnUehwFlSijk7EC88TgVxfJZyGmuL0PAMXD2VitROp
 YnMaHdBiyiMO3K6pJmJZtaBqGoV+e4Cobu75qDqcL4aZXsRJZHp8cdZlyuJBZu0ZDsMF4Hgzb
 030bZpqQFnSC4HSAuITLo454K0TwH5hUODZ4jgcpS+NpAAieWTdmdxrJcREZJUlHQ11LkXZm/
 ilJtB8gShOziz+Vdjb9/aWqlWbpl6wkdFkgydp8xAcTCf+aHuh/L8U5RbvSp0mrajzYCFlDjh
 NcZPuB2CMeI6nFo6K1uumTOUMhuO+zzNqS9jX4RBb4GpWH7dZyvvH8bMxdpAViVkEEgBSjbfo
 UeRFFekpBPjpNt9+w6CvxBeHPNvG2GWm38pQtsmi3kb+8qtqlX1wqkVbLP1FTwNgUJ6fpLIOm
 BsV4sy+ScU5DyUJocDfD7elOFF9PnjwP9QXOG+X+aU/g6QzqTDQb37qOWkTxlBiErrRaE3ht5
 cT+hnnMvdKgkKCL3SNaN20=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16.06.21 13:49, Viresh Kumar wrote:

> I am not looking to get any credits for the code or spec here. I don't
> really care about that. For the very same reason I kept you as the
> author of the 1st patch in the kernel series, so git keeps showing you
> as the original author.

Fine, and I'm not intenting to fight over credits. I'm just interested
in having a solid solution.

> All I wanted to work on was the backend (in rust). 

Okay, but why did you change the whole thing into something completely
different ?

> You only ever sent 1 real versions of the Linux driver, that too
> "6-months-back", there were no real blockers anywhere and you never
> attempted to upstream anything.

The backlog was in the maillist archive. It was just lingering because
of yet missing formal registering w/ vitio TC and I've been to busy with
more pressing tasks. (for example I've got keep public infrastructure
stuff up and running while folks are in lockdown).

> Similarly, you "never" sent the specification properly to the virtio
> lists for review. You sent it once as an attachment to an email, which
> no one ever received.

Half correct: I sent it to the list, but this wasn't tex'ified yet.

> When I tried to move this forward, invested a lot of time into making
> it better from specification to code, reviews started happening, you
> decided to start blocking it again.

When we had an email conversation about this, it was about submitting
the existing spec in a formal correct way. Don't get me wrong: I
apreciate that somebody's doing the beaurocratic work. But still have
no idea why you changed it completely, so there's quite nothing left
but the name and that it somehow does gpio via virtio.

> Linux upstream doesn't really care about this, you can ask any Linux
> Maintainer about this. 

I happen to be a maintainer myself, and we do actually care about
whether some thing is well tested.

> If your code and specification isn't doing the
> right thing, and isn't good enough, you will be asked to update it
> upon reviews.

Okay, please tell me, where exactly isn't right and why so.

> YOU JUST CAN'T SAY I WON'T because I have products based on this
> version.

Most of driver development goes pretty much like this. Yes, we would
prefer HW and FW vendors to talk with us first, but that rarely happens.

>>>      * virtio spec has been submitted to virtio TC
> 
> Which specification are you talking about here ? The only
> specification I can see on virtio lists is the one I sent.

The one I've resent (now texified) a few days ago. It had been submitted
in ascii form last year. The answer from virtio TC folks whas that there
are some formal steps to be done and it needs to be patched int their
tex document.

> And the driver you tried to send isn't aligned to that for sure, and
> it takes us back from all the improvements I tried to do.

Which improvements, exactly ? Unfortunately, you never talked to me
what exactly you've been missing.

I really have no idea, why you just

> I am not saying that my version of the specification is the best and
> there is no flaw in it. 

I did outline several problems of your spec on virtio list. Things that
already had already incorporated in my original one.

Really, I have no idea why you've never talked to me on specific issues,
but instead threw away, made something completely different and even
claim it would be just kinda "minor upgrade" of mine. WTF ?!

> There is no point going backwards now after making so much of
> progress. Even if you try to send your version, it will slowly and
> slowly reach very close to my latest version of code and spec. 

Or the other way round, as soon as silicon guys come in and see how
complicated and expensive your approach becomes.

> Because your version of the code and spec weren't good enough for everyone.

Again, please tell me what exactly was not "good enought" and who
exactly is "everyone".

> You need to accept that changes to that are inevitable since there 

You sound like a politician that tries to push an hidden agenda,
made by some secret interest group in the back room, against the
people - like "resistance is futile".


Finally, please tell me what exactly you're missing so hard in my spec,
that really needs a completely different implementation, which is hard
and expensive to implement in hardware.



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
