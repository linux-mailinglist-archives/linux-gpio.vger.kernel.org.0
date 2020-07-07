Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D57A6216897
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 10:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgGGIsA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 04:48:00 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46499 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727895AbgGGIsA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 04:48:00 -0400
Received: by mail-oi1-f194.google.com with SMTP id l63so32855098oih.13
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2020 01:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aFb5BpJE7gewnGOab0XbBWRqDooxJF7MwmC2W1p5udk=;
        b=Net1ZMUQr8lV/EICe5fxssMn5Q6dunX5G9eo7lk0YI7Nk1VZtnrpM6MU8Pe1C4V5jv
         riAekJzZ/W5Mf5F+D8Tkt7BkWD8WY6Iu9n29jtAXJXAOLq5UswzVU3cEAEv7Zh1q2Nuw
         VQb0xHQphXiGUwn4HTx7r/tPcDeCm02SAfgcon1oWXBX9ZAooyjmSSiCazJI/6SaLmy2
         u0J2VjeZbdvNU3kKFPG4K65Jg3OqxNct3fTFSF8JhUx4Qc74xkzW+BEjAIEAcytyFvto
         em4uB3QTEheCo4Ns1VG1vuxByMoQ5vXEXVSvVDlGHPlvF9TdWwZaCSvg3fwS9zgsrD2H
         gVag==
X-Gm-Message-State: AOAM532FJiZHAqGgWrLJWllSFZAlR7F0OjMDVPuhWJ8sb9PDSjXuPLCp
        A1t2VGwMD1oTe7Z9EeTXQuIu5K/vftgJrKjVCLc=
X-Google-Smtp-Source: ABdhPJwRPZkELuJhT23rXMHr2fcMHlfCIU8aZkVGq5J7TF1TLRYeA4gngkMrbQ9fL7xAvRkBRq41+X+HF6T5QAlY2ik=
X-Received: by 2002:aca:ac10:: with SMTP id v16mr2336784oie.153.1594111679156;
 Tue, 07 Jul 2020 01:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <CACRpkdbX9T9EuN-nxkMPC=sN74PEdoLuWurNLdGCzZJwwFrdpQ@mail.gmail.com>
 <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com> <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
 <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com>
 <87efe96c-3679-14d5-4d79-569b6c047b00@enneenne.com> <CAEf4M_C5ztHoiu4uGiiqxLF7uW6wbyxdg43cs=YgArszMfbXcw@mail.gmail.com>
In-Reply-To: <CAEf4M_C5ztHoiu4uGiiqxLF7uW6wbyxdg43cs=YgArszMfbXcw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jul 2020 10:47:48 +0200
Message-ID: <CAMuHMdWj5cpu0eR50v=KwojWLJW74kDW7FHCBaBdS569NL6mVA@mail.gmail.com>
Subject: Re: [RFC] GPIO User I/O
To:     Drew Fustini <pdp7pdp7@gmail.com>
Cc:     Rodolfo Giometti <giometti@enneenne.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Drew,

On Tue, Jul 7, 2020 at 10:39 AM Drew Fustini <pdp7pdp7@gmail.com> wrote:
> On Tue, Jul 7, 2020, 09:18 Rodolfo Giometti <giometti@enneenne.com> wrote:
>> On 06/07/2020 23:00, Geert Uytterhoeven wrote:
>> > On Mon, Jul 6, 2020 at 10:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>> >> On Mon, Jul 6, 2020 at 5:33 PM Rodolfo Giometti <giometti@enneenne.com> wrote:
>> >>>> With Geert's GPIO aggregator userspace and device tree can conjure
>> >>>> special per-usecase gpio chips as pointed out by Drew: this is
>> >>>> very useful when you want some kernel-managed yet
>> >>>> usecase-specific GPIO lines in a special "container" chip.
>> >>>> To me this is the best of two worlds. (Kernelspace and userspace.)
>> >>>
>> >>> Maybe this is the "best of two worlds" as you say but the problem is that board
>> >>> manufactures need a way to well-define how a GPIO line must be used for within
>> >>> the device-tree and without the need of patches! In this point of view neither
>> >>> the "driver_override" way nor adding a compatible value to
>> >>> gpio_aggregator_dt_ids[] can help (this last solution requires a patch for each
>> >>> board!). That's why at the moment they prefer not specify these GPIO lines at
>> >>> all or (improperly) use the gpio-leds and gpio-uinput interfaces to keep it
>> >>> simple...
>> >>
>> >> I think the idea is to add a very generic DT compatible to the
>> >> gpio_aggregator_dt_ids[]. That way, any DT can use the aggregator
>> >> to create a new chip with named lines etc.
>> >>
>> >> But Geert can speak of that.
>> >
>> > The idea is to describe the real device in DT, and add it's compatible value
>> > to gpio_aggregator_dt_ids[], or enable support for it dynamically using
>> > driver_override.
>> > The former indeed requires modifying the driver.
>>
>> I see.
>>
>> > Note that if you ever want to write a pure kernelspace driver, you do need
>> > a proper compatible value anyway.
>>
>> OK, but for our purposes we need just one compatible value.
>>
>> > I do agree that it's annoying to have "gpio-leds", but not "gpio-motors"
>> > or "gpio-relays".  However, you can always propose bindings for the
>> > latter, and, when they have been accepted, add those compatible
>> > values to upstream gpio_aggregator_dt_ids[].
>>
>> Having gpio-uio with proper names within it as motor0, motor1, relay0, etc. as
>> in my solution would be suffice. However, after these discussions, are there any
>> chances my patch (with needed modifications and documentation) may be accepted? :)
>
>
> Hi, I would like to clarify my understanding of what gpio-uio.
>
> Is there something in mainline that already uses that binding?

No there isn't.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
