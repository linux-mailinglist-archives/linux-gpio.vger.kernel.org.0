Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA4950933
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 12:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbfFXKuh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 06:50:37 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:55103 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfFXKuh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 06:50:37 -0400
Received: from [192.168.1.110] ([77.4.138.202]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Myb4H-1iVHLY1XUT-00z03d; Mon, 24 Jun 2019 12:50:33 +0200
Subject: Re: [PATCH V1 1/2] gpio: inverter: Add virtual controller for gpio
 configuration
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Harish Jenny K N <harish_kandiga@mentor.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
References: <1560315034-29712-1-git-send-email-harish_kandiga@mentor.com>
 <1560315034-29712-2-git-send-email-harish_kandiga@mentor.com>
 <CACRpkdaSLwELtWMiEvYRBRF1d6E_9ymupdiCe-rEaaJkCfOd4A@mail.gmail.com>
 <b56f84bd-6f31-95ff-427f-1bf0dfa27421@metux.net>
 <CACRpkdaGFw9XZSW7ise5EBun8ehikNMzw4BCs9hByme=6z4KDg@mail.gmail.com>
 <0bd09e2a-5006-4587-056e-9aeb6b05d18c@metux.net>
 <CACRpkdaQTaKATc2piWPQ5dY3zNdNh4QXh5GkXJuLU=deEhz4Yg@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <64a7cfa3-9d49-f675-0822-77bf209b970f@metux.net>
Date:   Mon, 24 Jun 2019 12:50:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdaQTaKATc2piWPQ5dY3zNdNh4QXh5GkXJuLU=deEhz4Yg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:3NkpyHUas1BG9BX/5AO0bjE+lm9m5hCJfBJHiTJtG6j87vlccwl
 9DIzhPr4g7SP8RWNkkUKIdGJAd1gHM4iLDRZ2k8nXSCZ+NQlTgSlSgSzoO2cl/9Y0GNTWQ+
 RNF+FEMiUx7gX73+gdoRSOg684o12/FwZuSveehE/eFme0hfzwUNIvMhm2TIvv6u+cmQ0l4
 x7PJHVVIiVCAucNFqgc2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zHJ4A+6wzZE=:yrLuMIHi/bFdrFZlJ0lCHz
 wqwl3G67E8ydbwrF3Kp5x2vVHQROCG5odEZ/Bgkv3NxgEnJWO93YFrOPI+X+60cXIY2TQR5tg
 ZFw3EydkMYKauur+aal+iDKwPyyEy+zhHkqhOvQLPLGQB/CY3fo3q9E214aCANwY9GzrJ5+n8
 Sf7JHxMnBtmjeMlQlYAvGZBPG2n/BQ2rsKqHabNuy1Qol6LNU4q3C3oU6sXUxdRlZP56szYhh
 jAJTnp0x1dHAlmvieKqeBcxsxjjY1Z0ICCQ5BowCcf36eUPlU+2SZu4gCCTuUljt2c3qvmixG
 ZorqU9LBMDkX0EvtZ6mnMgGSKbtli9H99c0NZFumGLYsn5nReEUc52gpb7DZ/4NLgpIEu6Ovc
 M5I4LKgrJZRokuBVg1LDiNEisKbrlcpw77CLPLNxKfcUkHI3zAwLkxfK8mCLDCpmMhA0Hqg3r
 0QE3/pgWW1iXZn4t7vXtWTNHqAMj5OcUZqRhxFgVfzyey9leZU4E0/qRNK1dPyb/c3DelUqA0
 IPTGcJA1iIJ680xI4PFt8IUL9tLJJxgRpfuUCzKQ1XES/Ki75W/UMK1fMzv9Ay+jRCCgFUF/B
 f5CyKlsXenn2SKZfMVsm9DCQ/Z1MY5cj9k5CyYnAtbiY4R8saqSN3Iwt1jKdHHo0gSeqj0n1a
 RfyWCSiAzl2Ey1tYA7QkhQPUumjxIbcjtSB9S9JsTj3cwkyliq/Jvd25WK3rbYxAmiMF42xm8
 PdKZxNRHtNeNv56yWMTUFkjKficmP1BwrX1+d8E86OIP5+xYtXnxk4YSj3Q=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18.06.19 13:42, Linus Walleij wrote:

Hi,

>>> For devicetree people mostly use the device tree cell flag
>>> GPIO_ACTIVE_LOW on these to work around it. But there
>>> are some cases where that isn't very readable.
>>
>> hmm, do you recall any such case where it isn't reliable ?
>> What are the problems here ?

ups, just seen i've misread your previous comment - you wrote:
"*read*able, not re*lia*able ... :o

> GPIO_ACTIVE_LOW is there to tell which way the consumer acts.
> If the line is counted as asserted when active low, it should be flagged
> as GPIO_ACTIVE_LOW, in the strict sense.

Right. But now some could argue: "the reset consumer contains an
inverter, there the inverter driver shall be used" ;-)

> So as is the case with regulators, device tree properties should
> describe the electronic semantics of the consuming devices, not how
> some random software in the operating system want to interpret
> things, it is not there for software fixes, it is just being abused for
> that sometimes.

Well, these electronic semantics can also have a some room for
interpretation. Even if there's some explicit interverter in the
schematics, one could count that part of the consumer and then
declare the line low active. OTOH, one could count all low active
lines "inverted" and demand an explicit inverter device here.

IMHO, it's often a matter of perspective, which approach is better.
It's good to have both options now.

By the way: I'm a great fan of modelling devices semantically (not
just electrically) correct for the whole machine (including external
peripherals - not just the stuff on the board itself). For example in
an embedded system w/ some gpio attached sensor, there should be a
driver for the actual sensor (eg. IIO) instead letting userland play
directly w/ the gpio. And if we have a line controlling some external
device's power, there should be an explicit regulutor, etc, etc.
(Actually, I'm pretty reluctant of handing out raw gpios to userland)

> The fact that many people use this flag as a workaround doesn't mean
> it doesn't have a valid semantic when used right.

I'm still not sure whether these really are workarounds or just a
different perspective. At least haven't had a case yet, where both
perspectives have been equally valid.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
