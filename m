Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5271A48B8B6
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 21:36:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241042AbiAKUgz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 15:36:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233821AbiAKUgz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jan 2022 15:36:55 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B37DEC06173F
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 12:36:54 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id z22so972711edd.12
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 12:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rhTc2fZPRf49402IZJZrD0G7GSgDTNNYfixj1K2wtCE=;
        b=OnO/1NBECg49FscHQiUJJsI8kyhIwulL1CMWTPj8c0arPJ6mcuNDGMP5Z05+RZhGTw
         8Qh32WeUSDrvpb5ZBfUM3ESbcIof4lmsWcUQjW6k/+74HYvPJHnWn/a2ppJXhT7w2/D9
         JIMurhESR3+nOenjxbC56gH0WvfIU30WlZzUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rhTc2fZPRf49402IZJZrD0G7GSgDTNNYfixj1K2wtCE=;
        b=yaSPaQHnCQfrvg6iy7aGM0gtOC5jayrWd0gNLE4Km2Tl/rHPqY5ibZUpVgplTs3hxX
         TM71E+bokqAUEgP6mzvRXbyjSEHMfj/DuuCApqGsy3Lv0fmCiOHlS/71/ZvfJjxusEzO
         mShGIMU39nyZ18bqbvYY2cQ23i5i/Jk5EcvsP8Nwjfx5MbmvRPOgiBnyfpamEl66IVg6
         ArY3tOhHL4cUoL7/GhMxKlI7Wjpoa7IreWIE60ix+XtJgZZ25T8coQM9YcLa84DceeEG
         1l7aUoRSg/zsH9rrxT6DxgOs5DgIk+337F7/wx5cIcs1a2hgLfSImjk88QCXpayZooDH
         rj3g==
X-Gm-Message-State: AOAM530HSNZttS9lQXqLcci5TLXYPzTBYsBLH/jApXoT02VgsMFlGQTC
        MJL2A4xzRCoypYjBsdoYpqeUoIkxjxqxXarD4zQ=
X-Google-Smtp-Source: ABdhPJziSAIjfYkzQx/Pz00ZjIG56DaKWGlBmyIdGdgmJUgVhWOBUUeiuzKZ9DUbRbod4B1xemh3XA==
X-Received: by 2002:aa7:dd91:: with SMTP id g17mr6124200edv.314.1641933413057;
        Tue, 11 Jan 2022 12:36:53 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id s4sm3975127ejm.146.2022.01.11.12.36.51
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 12:36:51 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id k18so366773wrg.11
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 12:36:51 -0800 (PST)
X-Received: by 2002:adf:f54e:: with SMTP id j14mr5154363wrp.442.1641933411136;
 Tue, 11 Jan 2022 12:36:51 -0800 (PST)
MIME-Version: 1.0
References: <20220111155255.745428-1-brgl@bgdev.pl>
In-Reply-To: <20220111155255.745428-1-brgl@bgdev.pl>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 11 Jan 2022 12:36:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg1RUc-41K=XTQavnkuLg2=oe8r8LWBocWWWXhM77=2gw@mail.gmail.com>
Message-ID: <CAHk-=wg1RUc-41K=XTQavnkuLg2=oe8r8LWBocWWWXhM77=2gw@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.17
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 11, 2022 at 7:53 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> The gpio-sim module is back, this time without any changes to configfs. This
> results in a less elegant user-space interface but I never got any follow-up on
> the committable items and didn't want to delay this module for several more
> months.

Yeah, I think that was the right choice.

I actually did spend some time looking at the configfs code, and it
just worried me. It may have been clever, but there was no real
serious user that would have used it outside of this gpio use-case,
and the games it played with the dentry layer were scary. With no real
maintainer for configfs, and no VFS person willing to work on it, I
think it was a dead end. With that in mind, the fewer fancy configfs
users we have, and the fewer reasons to use it, the better.

            Linus
