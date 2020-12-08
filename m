Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D82B2D2B2B
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 13:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgLHMfv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 07:35:51 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:44923 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgLHMfv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 07:35:51 -0500
Received: from [192.168.1.155] ([95.117.39.192]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M3lLh-1klmxl43L1-000rf6; Tue, 08 Dec 2020 13:33:07 +0100
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To:     =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Jason Wang <jasowang@redhat.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org, stefanha@redhat.com
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
 <20201205142218-mutt-send-email-mst@kernel.org>
 <20201208101051.GC6564@kitsune.suse.cz>
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
Message-ID: <dcc41cf3-ab2d-656e-6fa3-73f231bde92d@metux.net>
Date:   Tue, 8 Dec 2020 13:33:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201208101051.GC6564@kitsune.suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2gJtNh4al/jz5b6j0FWhYwrU96FWym4vYQii+IyxLA7dtvUfT6j
 aQ4QBpU8JKJUL26agzv4pu018C1ng9f3M/AaUOcypeeHDUDtvyKGkULf/R5tbPsfR3K41I5
 r1M0Bx3FdsPt3POi5zVzjVgX/sNWG0gBfiseEyjQN+2EroOr7tbPfz+AQxm5JNdlyVDVXnh
 KV7FYMCR+TLF4s8ZuE38g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ndMilS7teO8=:/uZ20rDlYDqOeFHndpr1cb
 AOgzroYYCjupeD6v9mWfnDJfZJjekpD+ZJIEFRpbhAYgk2/n5JgOmO7ch70CwGQ1dUbRSYmeB
 xT+THBee8CP5JD1InY8vmmIah4HlcP81FeIzh4jJJUPlvxypSPkVRMSzRVkySQA6YjsibsIhU
 FW2eXlWtif2BgwZpTeBzCSwfXSkQRn17817gHXqeH2YhGat+GE0MT1LWbBFu64U4MI/1NN6nq
 twC12fYfafB5T1j7D7JFuJqGR1LrRBjFVPB33rukvUxNNqeol2FZRLIgDta0Zrqa6QuTa40GM
 Cy/cBD+UuuROzUY5cjEpGc56poFDtVwIb+g+kkIoTzWK+etFCgrgu8HCdSoaclVZCpOjOGRKe
 BZM8uMCGhYkLWzKLhAbsD1vNrx6VfleGkkfnDFCeCQ0fO285UQkCSKkqSkP1s
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08.12.20 11:10, Michal Suchánek wrote:

Hi,

> The console driver provides early console which should initialize
> without any transport. I have not tested it actually works but the code
> seems to be there to support this use case.

What does it do if it hasn't got any transport yet ?

Just eat the bits or buffer everything, until it gets a transportport
and sends out later ?

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
