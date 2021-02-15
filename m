Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B072F31B3E2
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Feb 2021 02:19:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbhBOBTk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 14 Feb 2021 20:19:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbhBOBTj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 14 Feb 2021 20:19:39 -0500
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435D6C061574;
        Sun, 14 Feb 2021 17:18:59 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id f18so2526601qvm.9;
        Sun, 14 Feb 2021 17:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4l1VhsBHSasYP9te6SHg/IFFwtdw9tGkXjD2JBymXQ8=;
        b=RS+Jc/9J+UqCEjEzQNPQt1YVEkN/AtmWnLz1pFwUcpKqf0+8K5K+WyqFk6YtK5vr7v
         LYm1CDoNGJL1V8ZjO6lKsvwzEys6VbroKAiE73htrhRH/x9EEceaMLp+rZu1kJJdZfRS
         zEDEga0rJ1OFXGVuARxfOgkcZSW23yGPUUfc5tFX1hMWHJ66QIvZbYGN8+au5OPt8gTJ
         iWwysFnIunA2o2RYjCCM5Ysd+lyoKFmeRKSgp1XvJq1ogivlGFb/PuucjvJPN+Uqqddb
         KwSTQOab4orWSdTGwqXJC7pmVRgggckDVqLANLmqbTnOjjM4wohMcR/SrXZ5UddOsvs5
         f6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4l1VhsBHSasYP9te6SHg/IFFwtdw9tGkXjD2JBymXQ8=;
        b=Jdqayib+pYdc5SwwGO0V47bFTeAlAIl6azjxSnnvQipBXI/L9P64guwUGnx74viS1Y
         vD/ElC7t+ezdxUVgkSyPW2yB0Tk8ybmsBS0xkblgkkQd63SuD9GKF4PAZ6xjPWhCBs5a
         xnOy65OZwRNPiqSurnBDjcJBpOPtH5FaP1tmc38KjORy0sZrxub0HGpmD4iEhLL9hFm1
         3SXzGYy4SgRFeAI7XVDZ80i4K3afHkkgx48bzDnuAhURithhxxlf/kFUkzWSX9mwsLzD
         KFwOYsIYz8PDoQrA0A/2dJUH6zSANaycN13jKMxEW1gW+YwNQP29gYFeMdSzhRw9l4p0
         yAJA==
X-Gm-Message-State: AOAM5308kcS9iPWUrEKlkKEFjVibKEJ7xA32GTS9rLp9kmr73utMqHJ7
        bxsp3UKkLiMhTIL0MfIlzGLmvBUJkuY=
X-Google-Smtp-Source: ABdhPJzkq9+FPRTG8MTlJMBHmj+KBYlFAAWestn5Vc2Xiyuy6MSnYzuVBZFK0ME+TFsg+KqdmHrBEw==
X-Received: by 2002:a0c:f101:: with SMTP id i1mr12748218qvl.45.1613351938366;
        Sun, 14 Feb 2021 17:18:58 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id r44sm10643646qtb.28.2021.02.14.17.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Feb 2021 17:18:58 -0800 (PST)
Subject: Re: [RFC PATCH 11/12] platform/x86: skeleton for oftree based board
 device initialization
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>
References: <20210208222203.22335-1-info@metux.net>
 <20210208222203.22335-12-info@metux.net>
 <CACRpkdYbOX_RDqwxaiugtYB4vSpSKChvKsPjcB_vv3Q74QeG2Q@mail.gmail.com>
 <c5ed2b27-21a2-5a07-8dd9-e080f9a6cd98@metux.net>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <f370fa7b-a5b1-4151-7018-10d1b75fa8b2@gmail.com>
Date:   Sun, 14 Feb 2021 19:18:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c5ed2b27-21a2-5a07-8dd9-e080f9a6cd98@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2/12/21 5:54 AM, Enrico Weigelt, metux IT consult wrote:
> On 12.02.21 10:58, Linus Walleij wrote:
> 
> Hi,
> 
>> I think Intel people often take the stance that the ACPI DSDT (or whatever)
>> needs to be fixed.
> 
> It should, actually board/firmware vendors should think more carefully
> and do it right in the first place. But reality is different. And
> firmware upgrade often is anything but easy (as soon as we leave the
> field of average Joh Doe's home PC)
> 
>> If the usecase is to explicitly work around deployed firmware that cannot
>> and will not be upgraded/fixed by describing the hardware using DT
>> instead, based on just the DMI ID then we should spell that out
>> explicitly.
> 
> Okay, maybe I should have stated this more clearly.
> 
> OTOH, the scope is also a little bit greater: certain external cards
> that don't need much special handling for the card itself, just
> enumerate devices (and connections between them) using existing drivers.
> 
> That's a pretty common scenario in industrial backplane systems, where
> we have lots of different (even application specific) cards, usually
> composed of standard chips, that can be identified by some ID, but
> cannot describe themselves. We have to write lots of specific drivers
> for them, usually just for instantiating existing drivers. (we rarely
> see such code going towards mainline).
> 
> A similar case (mainlined) seems to be the RCAR display unit - they're
> using dt overlays that are built into the driver and applied by it
> based on the detected DU at runtime. RCAR seems to be a pure DT

The RCAR use of overlays that are built into the driver are a known
pattern that is explicitly not to be repeated.  The driver has been
granted a grandfathered in status, thus an exception as long as
needed.

-Frank

> platform, so that's an obvious move. APU2/3/4 is ACPI based, so I went
> in a different direction - but I'm now investigating how to make DT
> overlays work on an ACPI platform (eg. needs some initial nodes, ...)
> In case that's successful, I'll rework my RFC to use overlays, and
> it will become much smaller (my oftree core changes then won't be
> necessary anymore).
> 
>> It feels a bit like fixing a problem using a different hardware description
>> just because we can. Look in drivers/gpio/gpiolib-acpi.c
>> table gpiolib_acpi_quirks[]. It's just an example how this is fixed using
>> fine granular ACPI-specific mechanisms at several places in the kernel
>> instead of just tossing out the whole description and redoing it in
>> device tree.
> 
> I'm quite reluctant to put everything in there. Theoretically, for apu
> case, I could prevent enumerating the incomplete gpios there, but the
> actual driver setup still remains (certainly don't wanna put that into
> such a global place). But the original problem of having to write so
> much code for just instantiating generic drivers remains. And
> distributing knowledge of certain devices over several places doesn't
> feel like a good idea to me.
> 
> 
> --mtx
> 

