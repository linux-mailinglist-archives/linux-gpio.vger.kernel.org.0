Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B1A3DD3C0
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 12:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233081AbhHBKeV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 06:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233254AbhHBKeU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 06:34:20 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D4B4C06175F
        for <linux-gpio@vger.kernel.org>; Mon,  2 Aug 2021 03:34:10 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id go31so30049574ejc.6
        for <linux-gpio@vger.kernel.org>; Mon, 02 Aug 2021 03:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uR7Ghmqh/B5B5ngdNYCftCHAUQ1y1NgbebDxQKRU2F4=;
        b=UB+RskvPOuGCr/TsUhi/DME/9eoVcUhRXCHAaZ4d0+n5+6c21njiAnfceCV2K4jv6V
         FLSQ2OZ6ffZ7wXQ/R8GknKb7aeviakylzdZDwZhb7Z2hSpEgPclc+7zgdQv3b7a40WJE
         ANAnFIq3gK6IZqbbl/8kMpuXrZMBpB7ffXeIhpYdBuwjoNPWwjgtQ8CabWYyKZ/W8nj5
         UYQUkTJCwxvFHo3EKsQkKy4yxWx4n33W2GwYNOtR2ResbW0fp5W5dLDWbUyNyp85kBEu
         CXegfl3ICr2TBd9haKLNugcxtIwzU1rjV4A5CDSAW91en8T7qh1p7BceCH9pCVGu1Tod
         y21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uR7Ghmqh/B5B5ngdNYCftCHAUQ1y1NgbebDxQKRU2F4=;
        b=g6JGkh7KYMOtiausjRy14p2Tzf805JUYoN+emOhfF+nmAegekOBlRRjzqE0F9HWiAo
         0FBpTZal9xYTkX4Rhj5jhn/ab9uokvfXQHIJlpYKphBY2VIMcws0JoWlxpK/axMhL+pZ
         Vtsq+5/pb0g9QELGEi9FzcPTWvKn6va9qPKJDm8mqvG0jdcyfSCmK21/1bCbwd2h1cs0
         Ifk8/ut7lTq2PfeRZOa/Nk0bMD0jnOCRGTAj6A2+E0aLTfiB0QSwZGz7hfYFmsyAtDhj
         xlMupXoFr9XK3224my4ytu5NFbIsudoHImG1E2vOtRJ+TIAWFV7v9RlcuqYT2DFdaKRm
         YXUg==
X-Gm-Message-State: AOAM533eRlIjTD80/yzFVDMyXaoLaU5K8yl/Rjne6qPT40yTIYcFERrD
        iKLF+uH4RC2kn3EBdASFh5Yl7MNcyBSKj2s3g72HDg==
X-Google-Smtp-Source: ABdhPJzrCC2zuWEyDZE//RvLoicuiU5xrsWbLgBI3tx7jsCiGOfSrtta+1zbGe0sply3htykMdLWYuxKrAyXVPZDB5U=
X-Received: by 2002:a17:907:e92:: with SMTP id ho18mr14524563ejc.261.1627900448868;
 Mon, 02 Aug 2021 03:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210727143400.32543-1-brgl@bgdev.pl> <CAFhCfDZ1gHj2W0uDe1MZK71N87eH1pPBdEP32kcZys=pYEwSdA@mail.gmail.com>
In-Reply-To: <CAFhCfDZ1gHj2W0uDe1MZK71N87eH1pPBdEP32kcZys=pYEwSdA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 Aug 2021 12:33:58 +0200
Message-ID: <CAMRc=MfVVTLeRmGMK0ScOEOo1RGvWmgxe+9Js0nYSxwBs3vmiA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v3 0/3] libgpiod v2: C++ bindings
To:     Jack Winch <sunt.un.morcov@gmail.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 2, 2021 at 10:43 AM Jack Winch <sunt.un.morcov@gmail.com> wrote:
>
> Hello Bartosz,
>
> I am most certainly being *dense* here, but which libgpiod branch
> should I be applying this patch series to?  Also, what other patch
> series is this particular set of patches dependent on?  I tried to
> apply against master and next/libgpiod-2.0 without much success this
> weekend.  Also, just for clarity, how is the next/libgpiod-2.0 branch
> being used at current?  Which and at what point are you applying
> patches to this particular branch?
>

It's actually my fault. Let me explain: the development of the v2 API
for the entire project (C, C++ and Python parts) happens in the
next/libgpiod-2.0 branch of
git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git I squash the
new changes into the big patch with the plan of resending it for a
final review once we agree on the interface (more or less anyway).
That will allow the repo to remain bisectable. Then we'll be able to
fine-tune different elements.

> Once I've got over this basic hurdle, I'd like to do a 'holistic'
> review of this patch series.  As I've not been following changes to
> either the kernel subsystem or user library as of late, I feel this
> approach to be more appropriate and thorough.
>

Maybe you could wait until I post v4? I'm addressing a lot of issues
in this revision. Previous small patches have already been squashed
and they concerned the core C library anyway.

> Finally, what is the target deadline for completion of the v2 API?
>

There's no target, it'll be ready when it's done.

Bart

PS How did the move go?
