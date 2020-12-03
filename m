Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60292CDE9B
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Dec 2020 20:17:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728398AbgLCTPg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 14:15:36 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:36241 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726829AbgLCTPf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2020 14:15:35 -0500
Received: from [192.168.1.155] ([95.118.71.13]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MqatK-1kOzP81VTs-00mX8d; Thu, 03 Dec 2020 20:12:58 +0100
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
To:     =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, mst@redhat.com,
        virtualization@lists.linux-foundation.org,
        bgolaszewski@baylibre.com, linux-riscv@lists.infradead.org,
        jasowang@redhat.com
References: <20201127183003.2849-1-info@metux.net>
 <20201129221050.GH456020@latitude>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <648f227d-d5b3-7d5a-6963-5154a81472d1@metux.net>
Date:   Thu, 3 Dec 2020 20:12:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201129221050.GH456020@latitude>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oSAV2CyH8BEIRzztYAjpVPgPm2x8+LNxxkFhOf0No0nP62y+Fqe
 KC4iac655B8FVOgVPITpfK6sfVqDgZ2OFvEyo3g19vt0mZ8J4qJeMljIP8D3B2ZDB3WZFfS
 PdBl/MNRoYWTHsR24radOq4NH+BJEH9KQ+rqguNFSKP90FO91WYDxMjJQAZkud6s0X+F+QW
 u7KwO84uwaGY25dmKg5GQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LWGEsYsH1+4=:PWZ/523Xcpz9nTSmhc4QSm
 0tHWaSWwK9sPyHHGGAqlAImplar628g9x1f2MjNIx/zjV/LACgSeloPiqwDRluhPPHpG0gPLu
 jNwAS1gqPQYgMrnD3YdgHBpJ+GLn4uws1YJzlVjeWxaE+MNmzHYKTtCimfDBgpjGdyxsQmU3n
 eGgCpdgbuD5i49UXAbI+i/PrEMLxJgXXfIr9o1LhOUVQcxr3IKSwYid2OTB843p2VZ8rgxzN2
 QfzXVnyXrChrOhshdBimzhcTU6Wg1qP3ughX6deWQNjyTBOpzne2S5kc/61BZgXo30GILGSXW
 vGPdqtLyBvpgOQM2MzFpm8eA7plxeMordIf/5beUeoT6Nu7TBjZWEYk5hDWCgIOAtwWeaC58A
 OIrLceY4UoK1VTJOG0DKhApBtvlA6S4/jz8yDPxLvDB0haUHvpM6sNYYEUiB1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29.11.20 23:10, Jonathan Neuschäfer wrote:
> Hi,
>
> On Fri, Nov 27, 2020 at 07:30:03PM +0100, Enrico Weigelt, metux IT
consult wrote:
>> Introducing new gpio driver for virtual GPIO devices via virtio.
>>
>> The driver allows routing gpio control into VM guests, eg. brigding
>> virtual gpios to specific host gpios, or attaching simulators for
>> automatic application testing.
>>
>> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
>
> is there a spec of the virtio-gpio protocol available? If so, linking it
> in the commit message and/or driver/Kconfig would be nice.


added it to Documentation/gpio/ in patch version 2.

--mtx

>
>
> Best regards,
> Jonathan Neuschäfer
>
-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
