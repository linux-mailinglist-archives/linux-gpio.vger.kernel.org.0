Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06456222410
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 15:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgGPNiw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 09:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbgGPNiu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 09:38:50 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BED2C061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 06:38:50 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id u12so3295655lff.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 06:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DisuJGOhTsqZLSRTciJy2DTkS0uWS+KfhdVsbvwNxkE=;
        b=lt/vkTuBb1vzcvotKi8msv7LGAcjJiMecx/VQsrwFlPVSU++Dt4BH5vYmROr/xqrnG
         bChm8JUkTuhcZQtrlBY+nk/oIpQhDfxhqsoVBsDShV+IpsMx/7z/0xXZeaAWQSJrlHno
         1mHZjBT+6rQaG0xMrgWtzRM9xL7y4DfatspuoxLSaqOV3G+50U+9XVM+a3CYNXXmkOHJ
         +17AdgVIshQGs/pPvRLAgimJ1z1QRKAWbkVa90zvU3nwkuYmdC5u5SlorDArWq6W2DLW
         9tg8jdqxMsDzAuFsQDrgHkNaMq93G30Nod8tNd6mfhaGh74ddN9+mEptDKq58KNj5LxR
         q1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DisuJGOhTsqZLSRTciJy2DTkS0uWS+KfhdVsbvwNxkE=;
        b=qFCvSZeQfQpBMB+/U6CgPBCOQHcpC/AQw/z0MCX5QQ0UmKWKrlc4PY+0kg+3jHzWwP
         Kr4teHVv/bC7IkC4P1LXsp7ovwtm+wGpQJhQnD+AJKpLo+pPyCb5F8IRMZHPUfhFWhvs
         GLD2GOCaotEbCesnmQcaO4W6liv7Stma0BMgHuJSVKsRorMfp2wWIn3aFY4aWwCKMJCa
         2fIG5rTHIRWxP/fmQLhnDTEt1oYLFVAXnlHKWID4DFS5dkZZfC78tzL0sCS8W1cfviB4
         oN8dnb7D48DzsjO53QgG3ri7M6iKG9OTB27jI3/JKMp+/NbFXK5sEvBKAvmvIa68u3QZ
         jypw==
X-Gm-Message-State: AOAM530fKGOZ+M6nscB4/drEwvrwe8FiaB/9AkYf9cFUWDnaVb+8nKCL
        FqzqRaoQ0PLkjTZBkZVVHgxhZdl0iJkMQD4mWpXwyA==
X-Google-Smtp-Source: ABdhPJx1ef0CZ/3q2wngXBad0JwjLf4fGb8uc5oFMLSEFTqnUhW8aBck8YeJovmK7bjTdr3XajgcAFBpOPdaVGn6bxs=
X-Received: by 2002:a19:70d:: with SMTP id 13mr2060201lfh.194.1594906729036;
 Thu, 16 Jul 2020 06:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <CACRpkdbX9T9EuN-nxkMPC=sN74PEdoLuWurNLdGCzZJwwFrdpQ@mail.gmail.com>
 <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com> <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
 <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com>
 <87efe96c-3679-14d5-4d79-569b6c047b00@enneenne.com> <CAMuHMdUght0hkJT1N8ub5xR5GB+U18MAhAg+zDmAAuxoRSRaYg@mail.gmail.com>
 <d30e64c9-ad7f-7cd5-51a4-3f37d6f1e3d8@enneenne.com> <070fa558-6e20-0fbf-d3e4-0a0eca4fe82c@enneenne.com>
 <CACRpkdYFAW2bcB53M3_b2LsveJO_PWZJhprGhdTtfmW11B1WmQ@mail.gmail.com>
 <f66dc9c4-b164-c934-72a8-d4aca063fca5@enneenne.com> <CACRpkdbjc6vvpHVjnJNGisRw6LiLZd-95aHWJJORwvaRNigPcw@mail.gmail.com>
 <cb6e208b-446e-eba4-b324-d88aec94a69b@enneenne.com>
In-Reply-To: <cb6e208b-446e-eba4-b324-d88aec94a69b@enneenne.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 15:38:38 +0200
Message-ID: <CACRpkdZBUw5UPyZB-aeVwh8-GiCifbwABZ9mOsyK90t3cdMQ+w@mail.gmail.com>
Subject: Re: [RFC v2 GPIO lines [was: GPIO User I/O]
To:     Rodolfo Giometti <giometti@enneenne.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 14, 2020 at 4:01 PM Rodolfo Giometti <giometti@enneenne.com> wrote:

> I see... however attached is a new version of my proposal patch

I looked a bit at this!

IIUC the idea is a "new" sysfs interface that does not require the exporting
etc used by the current "old" sysfs interface. Instead of poking around in
sysfs to export lines we do that from the device tree.

It also does not use any global GPIO numbers which would be my other
main concern.

I must admit that it has some elegance to it. Especially when it comes
to scripting.

The problem I see is that lines are left in whatever state they were in
if a script crashes, so there is no "return to the initial value" that was
there when the GPIOs were picked from the device tree. This makes
this a bit fragile.

Also users regularly need to listen to events. This interface can and
should never support that, for this one must use the character device,
which will of course not work in parallel with using this sysfs ABI.
And the day someone wants that we simply have to say no. There
is no way to hold states for event handling in a stateless ABI.

Well of course they can poll for a line to change, but that is not
proper event handling that reacts to an interrupt.

So while this is much more elegant the old sysfs ABI, and certainly
better for scripting, it still suffers from some conflicts with
the character device, and there is a risk to make users dissatisfied
when they want to e.g. script event handlers.

What are your thoughts on this?

Yours,
Linus Walleij
