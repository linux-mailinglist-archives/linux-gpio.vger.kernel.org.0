Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48D092A2808
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 11:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgKBKRE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 05:17:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728437AbgKBKRD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2020 05:17:03 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4FD9C0617A6
        for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2020 02:17:02 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id r12so5365606iot.4
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2020 02:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s3EJ9zobkh7FYHYJWSJDM7encrABN6RP9bpyhE8NGbI=;
        b=vEmXBY9dyPl+ljdMhUmIW2LKV0ba1J1zZlsugDHx2dY99d0324GJIheFAEtdgQseMO
         tRcYTqVxFNP0MfypcMJ7Fs6o2mdQZsjEngK6hT7gOw9fbD4NbZZoo25UJskAdy22yCNM
         xD43spaFairJobEdSKHqSJaCNDOkQvEWx+xh9Mr4x891njbSAklrvrVXPmxsSzZvTymz
         cFBXGOT72WabirOs3enhLXHKe+kVn5eErsoNCxDHMhY1H/A9Znwh+JPyJzOk+bkDLoNt
         UTw6fwA5DT90+cs1RREtRV1lip4/HtV23y0QLm1Q6M0IeM/2/1IiYQufnfBFeMM0JCEV
         QVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s3EJ9zobkh7FYHYJWSJDM7encrABN6RP9bpyhE8NGbI=;
        b=aR/0ALZUmvySuJ7b12kZyHVV+Z8M/tAAyNwAsVJufNKgBUe7k2MwQ9bojsCAGeo9pX
         1yAW7owGKpWFNjd2/vwuxe/Gv8+WEcrHahm9u3lWJHqOEu1sYjZkfQ7TaQeB8iTAYAmh
         FIEUfJgwhnfR2EreUsPEcuW1HX1b0XLsfWICzkReHzNVRqOVW40tbMlZ/Rdfmbzsr1/c
         rvjGfidF7Werfjg1arzch001oTbjUvjo7eeDk6zBAJia2tYe2VoC3FqdI06s9s6qvMli
         v0McYFo4N97nRjDE5eMqeZZfvzmZBV75ucbZo5qiBgKQmc5RgIymzypkmGWuPBhkcOyP
         Ox2w==
X-Gm-Message-State: AOAM532jTSsdueKYEq3ofzjuQv5wKgLdUtIjC6NxQaYU54KBtjxJsZp6
        VDeAiPeid6jMsjvOBTBXpdGU+cwOJsfTo2QHJFDpAw==
X-Google-Smtp-Source: ABdhPJzgobcLyYX/fO0IziN9mm1MrqVoy3KRvaMJEUFjlH3w09pvUa223LBKiwM8gVMy9IWdcibg0zItd8FKWMmQiXU=
X-Received: by 2002:a05:6638:15a:: with SMTP id y26mr909829jao.57.1604312222257;
 Mon, 02 Nov 2020 02:17:02 -0800 (PST)
MIME-Version: 1.0
References: <20201026141839.28536-1-brgl@bgdev.pl> <20201026141839.28536-6-brgl@bgdev.pl>
 <CAHp75VcQfGFhLX7gp_fSMA4+O2Z3yP1M4FDrp+GVMg7y4N6k=Q@mail.gmail.com>
In-Reply-To: <CAHp75VcQfGFhLX7gp_fSMA4+O2Z3yP1M4FDrp+GVMg7y4N6k=Q@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 Nov 2020 11:16:51 +0100
Message-ID: <CAMRc=MdtM-zVmvSbxjkPyLN1YTqcS7P=aYXxzWEk0xQiu8WZjQ@mail.gmail.com>
Subject: Re: [RFT PATCH 5/7] gpio: exar: unduplicate address and offset computation
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 26, 2020 at 3:51 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Oct 26, 2020 at 4:23 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Provide and use helpers for calculating the register address and bit
> > offset instead of hand coding it in every function.
>
> Can you check code generation on x86, for example?
>
> Sometimes compilers are eager to use idiv assembly instruction which
> does simultaneously / and %.
> I dunno if a) it's used for / 8 and % 8 since 8 is 2^3, b) splitting
> to functions makes the above optimisation impossible.
>

Is this optimization really needed though? It's not like it's a hot
path if it's protected by a mutex anyway. I prefer cleaner code here.

Bartosz
