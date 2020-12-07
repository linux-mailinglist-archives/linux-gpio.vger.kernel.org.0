Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D29B2D1AA2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 21:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgLGUhk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 15:37:40 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:45839 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbgLGUhk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 15:37:40 -0500
Received: from [192.168.1.155] ([95.114.88.149]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mum6l-1jvEXL33ml-00rn89; Mon, 07 Dec 2020 21:34:56 +0100
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Jason Wang <jasowang@redhat.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
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
 <e69569b5-0c45-e072-5de4-81a4acecdae3@metux.net>
 <20201206075131-mutt-send-email-mst@kernel.org>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <dadc99c5-dd63-9b3e-aa00-c9dc0b622134@metux.net>
Date:   Mon, 7 Dec 2020 21:34:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201206075131-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hbxWK5NoTU1gQ95fGH3BMY4QAmnZBlvFnu9xed6dReXqGP9zoef
 MckleM1vV7HliBSRZ6udkFDg4oyUKSNbZwul7Y66weAy+oon65LCWdmf+dxfK6r3WTQNoS4
 h3/cDg6RD1w561g9mrzJSlidlzrboqRUVJhpHVuHlrVchpYU/bfHn/az49skSDmMNfUtWjr
 zd0PBJPpX1GrxPAxwHQmw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:a1HG/QGb8tY=:0q0pD8h55NgouMf6dv3JD2
 Cmx7N9LkvLMDbG6kymexPbp1HKRzx7Rorroj2ZlFUcC7DgJUW/cKzL/tB4CyNoE0tfadzvgWR
 bKZcQEkxGiiiXDLxGxZN31wPYHCpJE3AnuMMRqhHMlRbsY7l9Gw4vYhc2Z5xyIVpb4d7TX8ar
 lBAAh6lHX5wJL44SeNWREbvfTDEkT8JE0A7/FGxY0QMVapvLqU+tUnES7VA7OVAL/BMcBsZAR
 mUfUnQC5YTSsKej0IiwPX5L7/EhgLUAoJufCr5ePB6QiYs0//YTjXBmuTkPRZ9iMf2WA5LiKE
 EWc75DMdfsNl2sI5I1wAmNtpnkJ7Eh+BIiQNXpFYikpjA2IcRQDXbwBkOmf7j4zJPg4vp0ZmI
 skM9M1UncysVw4xvpgNJA3M80NZgL50I41KvIF5I0T9ArXakC5fAvYc4NfJVv
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07.12.20 14:52, Michael S. Tsirkin wrote:

>> See above: NAK. because it can't even be enabled directly (by the user).
>> If it wasn't meant otherwise, we'd have to add an menu text.
> 
> The point is that user enables one of the bindings.
> That in turn enables drivers. If we merely select VIRTIO
> there's a chance user won't remember to select any bindings
> and will be surprised not to see any devices.

Not sure what you mean by "bindings" ... transports ?

IMHO, transports and device drivers are entirely orthogonal. Both *use*
the core, but I don't think they shall only show up, after the core was
enabled explicitly. Any combination of transports is valid (having none
at all, of course, isn't actually useful).

>> When using other transports ?
> 
> Any transport selects VIRTIO so if you enable that, you get
> VIRTIO and thus it's enough to depend on it.

The combination of 'select VIRTIO' and 'depends on VIRTIO' is what
caused the recursive dependency. Chaning everything to 'select VIRTIO'
fixed that.

>> I don't thinkt that would be good - instead everybody should just select
>> VIRTIO, never depend on it (maybe depend on VIRTIO_MENU instead)
> 
> GPU depends on VIRTIO and on VIRTIO_MENU ... which seems even messier
> ...

See:
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2404871.html


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
