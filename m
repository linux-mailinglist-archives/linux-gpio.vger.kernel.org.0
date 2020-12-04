Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAD902CE99E
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 09:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728831AbgLDIbO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 03:31:14 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:42415 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgLDIbO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2020 03:31:14 -0500
Received: from [192.168.1.155] ([95.114.158.118]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1McY0J-1kAPBb3rJt-00cyWv; Fri, 04 Dec 2020 09:28:31 +0100
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
To:     Michael Walle <michael@walle.cc>,
        "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Wang <jasowang@redhat.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
References: <20201127183003.2849-1-info@metux.net>
 <CAMpxmJXJLTzM20xLCoM4spjibXbA-FfdPmOBp1QcV+9cScNNMw@mail.gmail.com>
 <f14c0197-b346-7af5-9dd0-9b8018baaeaf@metux.net>
 <b287f185d554b5a87b82ea8ca79cb5a2@walle.cc>
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
Message-ID: <8ab347b9-8b1a-f49f-d194-f98284fa6099@metux.net>
Date:   Fri, 4 Dec 2020 09:28:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b287f185d554b5a87b82ea8ca79cb5a2@walle.cc>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dUT0JUegZ42giGfrKmvHoKDvhv2oHRjR2063rWeXiFKSlSKKSyF
 WV3WiUrtvsZF8oudGAy6r09BIw/6WCr/bvdKoDhqqeFsgRNMxZiIcr/bEbVJVAbNONrMlLL
 ZKyfCItATcn+5Cjf9IiwAlWeioaYBVHkZbBmOtEJMapTGLJGku2ayhdFc+ZdiwURrgBL1zQ
 eYyGWJ48hhAM00fOJggdg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wJpMIBpJjRM=:Zv5F/JE0GNEQiLQcvQT3Kk
 pvvBPGjOoKfmD6WIu2hZZcnJuc4GTp8QcZIOCWowwKSVSAYayPuVlHPEQBSd5V6Q1xlMbogB1
 ZWbgeu2rVH0pueqyXhtJgRoLMTBBdPGQ8mirjUMQ7NR1LUc9HrN2CWbR/51Ggqh4j9F9o0MuA
 3acqKkusqAK1L0lguerq37BmBS7ugEVE4jJurmX+A4lhZ1+NNIpRcIr5sxHXQCmT/8aq/F1rJ
 KdlTugkX5k5yx9l+2MusPfQefa6xGnZpi5GRsi/CvyJh6aZDDuk3csd7iDLX6/IF/qYkGx6g1
 NFg6+7jGf9gJ+bSkiuomIcRIsWd9YFvB9RV/YO+OhY1uhUajnKCIsiRRG+YX2Unkn98FNq044
 wVDPk/nv94eA/WxauJpokuglPDiEl86izI+N7eEyp5db3b9Ziib556pDZqpfk
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03.12.20 23:35, Michael Walle wrote:
> Am 2020-12-03 20:00, schrieb Enrico Weigelt, metux IT consult:
>> On 02.12.20 15:15, Bartosz Golaszewski wrote:
>>>> +               bufwalk = name_buffer;
>>>> +
>>>> +               while (idx < priv->num_gpios &&
>>>> +                      bufwalk < (name_buffer+cf.names_size)) {
>>>> +                       gpio_names[idx] = (strlen(bufwalk) ? bufwalk
>>>> : NULL);
>>>> +                       bufwalk += strlen(bufwalk)+1;
>>>> +                       idx++;
>>>
>>>
>>> Something's wrong with indentation here.
>>
>> i dont think so: the "bufwalk ..." line belongs to the while expression
>> and is right under the "idx", as it should be. I didn't want to break up
>> at the "<" operator. shall i do this instead ?
> 
> Or don't break the lines at all. Both lines don't add up to more than
> 100 chars,
> right?

IIRC checkpatch complains at 80 chars. Has that been changed ?


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
