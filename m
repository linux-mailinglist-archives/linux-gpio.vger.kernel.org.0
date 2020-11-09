Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9470F2ABEEC
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 15:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731143AbgKIOle (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 09:41:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:55926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726952AbgKIOld (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 09:41:33 -0500
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E7FEE20789;
        Mon,  9 Nov 2020 14:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604932892;
        bh=yAypb4Z+4goyWfKuvwVWnsSV+ZMyJbAKwefaPjlJpIU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=fuCpaK/GXwQcADBF293ZmU1fhjQnR9mQAqKGemh/yOLWxyYokGyxeYRc3r/nofDL6
         CXScDlLVxe0eNh3QBA2inEmCMoafenPJEwLA+HaWDNWgapdp1/1i/OAiwdbhGxX/3w
         MD19d3/NtL3ufoVNaC9koH7LUSOBMK3sXVUuPEFI=
From:   Felipe Balbi <balbi@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jamie McClymont <jamie@kwiius.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: How to handle a level-triggered interrupt that is slow to
 de-assert itself
In-Reply-To: <CAHp75VcBB9wGdrBKXXSnCeHRwS1uEEz9TSrnbxzZ5g+yGdXaiA@mail.gmail.com>
References: <a491261f-8463-474d-a6b3-d674670c7bb7@www.fastmail.com>
 <CAHp75VcBB9wGdrBKXXSnCeHRwS1uEEz9TSrnbxzZ5g+yGdXaiA@mail.gmail.com>
Date:   Mon, 09 Nov 2020 16:41:24 +0200
Message-ID: <87tuty384r.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> On Mon, Nov 9, 2020 at 2:57 PM Jamie McClymont <jamie@kwiius.com> wrote:
>
> Looking into the problem I think the better people to answer are ones
> from the input subsystem (or closer), so I have added a few to the Cc
> list.
>
>> Background context:
>>
>> I'm continuing my efforts to reverse-engineer and write a driver for
>> the Goodix GXFP5187 fingerprint sensor in my Huawei Matebook X Pro
>> (the host is an Intel i5-8250U).
>>
>> The device is connected via SPI plus a GPIO Interrupt pin, defined
>> like so in the ACPI tables:
>>
>>     GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
>>         "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,) { 0x0000 }
>>
>> This line is held down by the device when it has a message for the
>> host, and stays held down until the host finishes reading the message
>> out over SPI.
>>
>> I'm handling this with a devm_request_threaded_irq-type handler,
>> where the irq part is just "return IRQ_WAKE_THREAD", and the threaded

I think you should pass NULL as the top half and make sure you have
IRQF_ONESHOT flag while requesting the interrupt. This way, the line
will be disabled by IRQ subsystem for the duration of the bottom half.

>> part does all the work. My understanding is that this is a reasonable
>> approach since I don't have tight latency requirements (and the
>> sleeping spi functions are convenient, plus I don't want to introduce
>> any unnecessary jitter to the system) -- please correct me if I
>> shouldn't actually be using a threaded handler here.
>>
>> ---
>>
>> Here's my problem:
>>
>> the IRQ line actually stays held down for roughly 180us after I've
>> finished reading out the message over SPI. That means that as soon as
>> the handler finishes, a new one starts, and it reads out corrupted
>> data, since the sensor doesn't have anything to say.
>>
>> This is okay in theory -- the corrupted message header can be
>> detected by its checksum, and disregarded. However, this leads to a
>> race condition where the chip can decide it DOES have something to
>> say to the host, WHILE the host is reading out the corrupted
>> header. At that point, the two sides de-sync in their ideas of what
>> needs to be read, and everything stops working.
>>
>> So, I'd like some way to pause interrupt handling for 200us+, and
>> only re-run the handler if the line is still held down after that
>> time.

usleep_range(180, 200) before exitting the handler? You're in the bottom
half anyway.

>> My first approach was to add a sleep (usleep_range) at the end of the
>> threaded handler, right before returning IRQ_HANDLED. However, it
>> appears that after the sleep finishes, the IRQ is triggered one more
>> time -- presumably it has been set as pending before/during the
>> sleep?
>>
>> My new workaround is to save a ktime_get_ns timestamp at the end of
>> the handler, and check it against the current ktime at the start,
>> returning early if not enough time has yet elapsed. This is
>> unsatisfactory, as it is effectively a 180us busy-wait, and gets in
>> the way of whatever the core could better be doing (presumably idling
>> and saving power :).
>>
>> Is it possible to return to the first approach, but prevent that one
>> spurious interrupt from firing after the handler ends?

IRQF_ONESHOT would probably help with this part, I guess. Could you give
it a shot?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+pVRQRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQY+UQ//bLX8KcF3VEkMeNM7YV4X3jAWEY54hIyM
nf719I8+D77AhzbEPhUYSNNKe80qimbvaSPG6caoIIMC7PRlrkwVrlDjtgoPpmmz
60fyTY6ynUCgeH7P/rpDQtgxmA6o/km/plc6TTlsPg9XlRTScIVssV9ZD5gvLSlH
B0EfOvWuWO8ZCsHqRRY3nwBRT4z7V1K0iOjv3j3KyRwFdxovCECRnVGP+0P9tkL0
CJoEplQ2DWj2l28NmxbAqk5opnU72dYLr6+zdHmMVJygxFnwUdQsTbk8jcK3QRi5
DFClPusJC99/jDvPDX5vlPnGxBWNksPQnQa3xnTEpQeri9D8c87xG0hNQyQKKDIu
i1odsnUOgKsjXgmT2PrUUFr7NqKYaF2Qm6NWJbStqMna/gG+BEqCYmqG6Bujj5UG
kEWkeqmPQf0Sd83q1c8dAqGZE9WenMquqzfJwOtLNqCUQiUvl63rdhynyInOb1ov
C18HkipaZJuTOTQTdFxESGvikDg9E+dAMS2ZFtNyTVVrhGcyrBm72F8E64gmjF1k
0sRHLcMDy0CybWwPCru7f4neecxiT901gEiT3l+iOsS+jz2WKsYsfbDKm3qQS0qj
RpD+xQoCiriYeJwwpJS0HdNZPYsJgIHIxk9cusDGih1K6CgUt0FvfGBT/ii8Myqn
vG6RIVtJA0g=
=vKK3
-----END PGP SIGNATURE-----
--=-=-=--
