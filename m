Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24FC2D240A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 08:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbgLHHFX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 02:05:23 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:54529 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725927AbgLHHFW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 02:05:22 -0500
Received: from [192.168.1.155] ([95.117.39.192]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N1gac-1k2W2w0CRk-0122tg; Tue, 08 Dec 2020 08:02:38 +0100
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To:     Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org, stefanha@redhat.com,
        msuchanek@suse.de
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
 <20201205142218-mutt-send-email-mst@kernel.org>
 <842519cc-94ca-3c11-ddd6-543e5a89c998@redhat.com>
 <20201207085247-mutt-send-email-mst@kernel.org>
 <0a9c19bd-0d25-1035-57e3-b1f5f204c309@redhat.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <500d0c68-0c6d-f5fb-665b-74aec6d59f99@metux.net>
Date:   Tue, 8 Dec 2020 08:02:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0a9c19bd-0d25-1035-57e3-b1f5f204c309@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yN/BLdqz0Vt6Gc78kBHQubmPRXCo+73gjuzZ/FFo2aygJNFdokw
 bIFudmapyFmrSTiIyDb+aUPLo4yjgmjzlZMHyY524wcRKwqJq6WUoQuYl0k5Pj+8yTyR84y
 vzIM/cQCfW0r7jZgN8QvC1Wc8KV3kJ84BqpcGGXAv4vtZ2kMN43JYtqtkbJ/w0CRh6eQyeu
 CxLLWsOi5p/z4+EPl66hw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:J6pWCIG+eKA=:YbDwb0QlpqYTg8o6ISKAj2
 2nx0ApszFX4DE52Hscm8BkPNFR0h/2Fr+oZcQFep2yDc08ctJ8p3fmYPuNV0jI70LoAD5gsmZ
 UxJi4zgWgNmSEvnNeoGRSVyAPJzxpqhOYJlqrEfs6XBgcCp4H31ur0WIKnKawxt5XmNQaEbyU
 Rd1swVS5bTy3atV1TPcwwydDrVdZEbmA90gVpyvuZVgeJqSAU/BNLajbH7aJTMgwe+L9AD1TU
 atTQxHBFZtuKkB6bOLxKMt0WimiYKuxTkIqGHJUnP832C47aTjMj9ATICWRI1Lt8a0McjrO0T
 9tPJ17odptw/ER8zz/fYEcdCYQV1gkbJatZw3JfUkDE3zbSJphmhDX4SyLdWuI/DPlFWqZi+K
 5tuNk+qVAyf10TKOHLGmyg6s05gRd1Kdo0Mt3jgjYDktLNgL9yI5eZAWfZ8U9
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08.12.20 03:36, Jason Wang wrote:

Hi,

> So we endup with two solutions (without a prompt):
> 
> 1) using select, user may end up with driver without transport

IMHO not an entirely unusual situation in other places of the kernel,
eg. one can enable USB devices, w/o having an usb host adapter enabled.

And even if some USB-HA driver is enabled, the actualy machine doesn't
necessarily have the corresponding device.

> 2) using depends, user need to enable at least one transport
> 
> 2) looks a little bit better I admit.

So, all virtio devices should depend on TRANSPORT_A || TRANSPORT_B ||
TRANSPORT_C || ... ? (and also change all these places if another
transport is added) ?

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
