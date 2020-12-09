Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEF32D4013
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 11:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgLIKgg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 05:36:36 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:57923 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727836AbgLIKgg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 05:36:36 -0500
Received: from [192.168.1.155] ([77.2.91.93]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MpDeD-1kM7Qx2oGd-00qfIe; Wed, 09 Dec 2020 11:33:48 +0100
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
 <500d0c68-0c6d-f5fb-665b-74aec6d59f99@metux.net>
 <9e11f1ab-6b7c-d50e-d7db-633ebc3d358c@redhat.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <02dd5afb-5e62-0c38-88c2-a37531180e06@metux.net>
Date:   Wed, 9 Dec 2020 11:33:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <9e11f1ab-6b7c-d50e-d7db-633ebc3d358c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6IBOdJ3Pw3iu1MA21dwXanEXus7g8p1ep+GkGt9zVIbhxhZx7Kf
 jiiT9jUHC2ZzHCmY2HNp5e7SosSLryMqody8olJ3KO/KGIWk81GbzazHXz4geIZ1BDAIhaz
 O8m+3MwjyC39TfP3KI6umd7EFHWVbx0KiKNiUK1cxON6xTUIZESLpMjOonPjPOKV9Yj7Oae
 unBSQwjogiQhVFADVN+ZA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NIdITOosddQ=:P8JLLlTSzK2CBNVBgIMqUV
 UpiIQoKs9//rlDBkl+fCiRfYISscyoor6jO2Rq0dZxW1574ox9nuQeFZh0lQ3t4Fg4KZJ73nl
 41qNdWYboci98BEv99ALc1TYA0fKsHeWhU5snts4GVf/6JzUk3Ai/7nvlwxO8EUlrS98ve4AU
 rI6fhXFXfj1fboAkITyOq3VnBUDeBi+RaGhxi6RpZGLJtb0Z0h0qBu55Em4JCCTGiPADYnwP6
 lzAPldZb40Qo9c9jGzFfRHv0rpkY6Iz8ykrHP2X+9/ovFK8cd3W3afEGqL5u7WD21fL4xKx4F
 xULPKia5OMoBCbT/QAtq6rJSobc7bghBqWPj+dWQw5gpqdSg3gF3XUyJrKOiyhHv7nNuFKb2P
 UiQJ0QH/1E6BdqPqNGy0nE++XxDrfkdrCx+6S7OgeJW70XM8Yn4EpqSHtnt+FNE7rtD/jazD6
 FWcB0/8kvkVwAOZ9iUV1+Nk3uXO893cxNPA2qUkzF2FGXpgA9bpG
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09.12.20 10:31, Jason Wang wrote:

Hi,

>> And even if some USB-HA driver is enabled, the actualy machine doesn't
>> necessarily have the corresponding device.
> 
> Ok, then select works for me.

Great, so does everybody aggree on my patch ?
https://lore.kernel.org/lkml/20201204131221.2827-1-info@metux.net/

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
