Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A80953AB060
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 11:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231903AbhFQJ4t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 05:56:49 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:57613 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbhFQJ4t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jun 2021 05:56:49 -0400
Received: from [192.168.1.155] ([95.114.94.184]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M60HD-1lvAAr3UNf-007Xz4; Thu, 17 Jun 2021 11:54:18 +0200
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
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
 <5cffb354-0d00-5ace-260d-61ac0c4c7491@metux.net>
 <20210617035901.kfzps6kg2emthjf4@vireshk-i7>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <116f8135-4ddf-e8fc-6838-94093702ec3d@metux.net>
Date:   Thu, 17 Jun 2021 11:54:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210617035901.kfzps6kg2emthjf4@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5xfAZwTzZ4o+ia6PMSDH0Shm5BlgIfrnYFFtxNKVaZA+eeGOifF
 E1Rcvz5bYbbeICB9r1PkgEDUEv7BbvbdBQUc7HKsfwKH89QdGYgMF5/GkRR0T4cvR+BAFgd
 /En00EAh1ZrRxqcRbYwemPjB3rg4aJqgZ7q3Ehs+PGl0xtFeNt8K6o+dAvCm1NnaBRbmxNM
 7/LFPWxR5qx61e53pLVaw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:N+tpquxcvGw=:zleIr4Jj0R75RtKPmlxQ0m
 pmQ0d1rYmnaAZtR1cOYKVZ5sry1UNCDR3fi5cUQvIs+S6HxRaufVLFskObQxWDQ+GgSSlgYMb
 hSF2DiO4MbJHE8VzYc7rruwFWh10t9sOFVDqHvbdS8gxG29kAA9Pz/ViYyFMg4+6We64J1VCn
 D/3dCLP0i6zRQxuQXztpnAqZhoZ/Z8mims5FbUa61RFaICIb6YfWFWCg1sq4/XyEqGMhgIgIx
 UgE3sYWWv+y3aq+n984ZtiqAwSnwLTRxCtsxWeLeEsSBErQOa8TlE8+C1NgN4p1/lh/ncn3uv
 CSDNPlbAqujzTWWdu2lRQQySWJhPasul8Av/Lkm8EIC1GJ9Q8kVZ5aIBhsngRmjncq5BH6RN6
 b3Lk0zHhUNzr29GU4b0rDybT63hcNqlcg/ZUow5saWUOMTBicMakygkgTw4D47qL5LL80m2o7
 labfGjGeoMrP2x+sshnINvvlFhoSvsE67j1JPOJwQA4wys6K35eYhaMf9uLowTGUENCX0+kk2
 7RCpLmn9v6Ycmaaq8S0vJ0=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17.06.21 05:59, Viresh Kumar wrote:

 > Okay, we figured out now that you _haven't_ subscribed to virtio lists
 > and so your stuff never landed in anyone's inbox. But you did send
 > something and didn't completely went away.

Actually, I am subscribed in the list. We already had debates on it,
including on your postings (but also other things). And the ascii
version of the spec actually landed on the list last year, we had
discussions about it there.

I've just had the problem that my patches didn't go through, which is
very strange, since I actually am on the list and other mails of mine
went through all the time. I'm now suspecting it's triggered by some
subtle difference between my regular mail clients and git send-email.

 > Since you started this all and still want to do it, I will take my
 > patches back and let you finish with what you started. I will help
 > review them.

Thank you very much.

Please don't me wrong, I really don't wanna any kind of power play, just
wanna get an technically good solution. If there had been any mis-
understandings at that point, I'm officially saying sorry here.

Let's be friends.

You mentioned you've been missing with my spec. Please come foreward and
tell us what exactly you're missing and what your use cases are.

Note that I've intentionally left off certain "more sophisticated"
functionality we find on *some* gpio controllers, eg. per-line irq
masking, pinmux settings for several reasons, e.g.:

* those are only implemented by some hardware
* often implemented in or at least need to be coordinated with other
   pieces of hw (e.g. in SoCs, pinmux is usually done in a separate
   device)
* it shall be possible to support even the most simple devices and
   have the more sophisticated things totally optional. minium
   requirements for silicon implementations should be the lowest possible
   (IOW: minimal number of logic gates)

 >> You sound like a politician that tries to push an hidden agenda,
 >> made by some secret interest group in the back room, against the
 >> people - like "resistance is futile".
 >
 > :)

Perhaps I've been a bit overreacting at that point. But: this is really
that kind of talking we hear from politicians and corporate leaders
since many years, whenever they wanna push something through that we the
people don't want. Politicians use that as a social engineering tool for
demotivating any resistance. Over heare in Germany this even had become
a meme, and folks from CCC made a radio show about and named by that
(the German word is "alternativlos" - in english: without any
alternative). No idea about other countries, maybe it's a cultural
issue, but over here, those kind of talking had become a red light.

Of course, I never intended to accuse you of being one of these people.
Sorry if there's been misunderstanding.


Let's get back to your implementation: you've mentioned you're routing
raw virtio traffic into userland, to some other process (outside VMMs
like qemu) - how exactly are you doing that ?

That could be interesting for completely different scenarios. For
example, I'm currently exploring how to get VirGL running between 
separate processes running under the same kernel instance (fow now we
only have the driver side inside VM and the device outside it), means
driver and device are running as separate processes.

The primary use case are containers that shall have really GPU generic
drivers, not knowing anything about the actual hardware on the host.
Currently, container workloads wanting to use a GPU need to have special
drivers for exactly the HW the host happens to have. This makes generic,
portable container images a tuff problem.

I haven't digged deeply into the matter, but some virtio-tap transport
could be an relatively easy (probably not the most efficient) way to
solve this problem. In that scanario it would like this:

* we have a "virgl server" (could be some X or wayland application, or
   completely own compositor) opens up the device-end of an "virtio-tap"
   transport and attaches its virtio-gpio device emulation on it.
* "virtio-tap" now creates a driver-end, kernel probes an virtio-gpu
   instance on this (also leading to a new DRI device)
* container runtime picks the new DRI device and maps it into the
   container(s)
   [ yet open question, whether one DRI device for many containers
     is enough ]
* container application sees that virtio-gpu DRI device and speaks to
   it (mesa->virgl backend)
* the "virgl-server" receives buffers and commands from via virtio and
   sends them to the host's GL or Gallium API.

Once we're already there, we might think whether it could make sense
putting virtio routing into kvm itself, instead of letting qemu catch
page faults and virtual irqs. Yet have to see whether that's a good
idea, but I can imagine some performance improvements here.



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
