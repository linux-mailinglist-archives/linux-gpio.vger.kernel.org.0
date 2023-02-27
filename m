Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 820986A4CAA
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Feb 2023 22:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjB0VBo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Feb 2023 16:01:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjB0VBn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Feb 2023 16:01:43 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B4F2411D
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 13:01:38 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id df20so13398268vsb.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 13:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+CoTE8b5J8vz340VFl9n/EhJejUuOIQKQuKJTb2j76o=;
        b=G+tRe0YDqGuSk3o91YnrMfEg1X9birTiukXfl7gWfKD20ThFzqYnzIcWXZYBJKAu0t
         a5d+zsQvgacCZxTX40hC3xHG/Q30ZWrMIfD13/VALGF0rFKwQuYiGbMx4eZkoPWkEVgu
         lTI8QdwcpJvtyVxDmUQwszqoppinBDvxa5dzqIWzYdFyW3gy7A0DLfXwJsCSjVii1fzn
         TdXr2ONJrNOdYVz5qbjUCPq3wBMCnLcX8KZuC/JwHFkoBBLwj9eZ9xd+fgqI5HmZEhO4
         AIPPyZ2d+gdxyD1Pl7qQFfiFmHZXC6dDRlWK/qbVnHm+fwdZf6y64gUYL43Mhgbq2jw5
         FfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+CoTE8b5J8vz340VFl9n/EhJejUuOIQKQuKJTb2j76o=;
        b=UAtVj6nRWBmTx1p9AdrB9IIJ+qHInjCH+s6niPvyR2NGKCkYtXpR17LazWK0AYImCc
         Ep7fGz057u8Ueo3umetXKk5n7e8FANyXQiMjPUqcQmBJ7q1VmUG0uz2WtyHO7olan8eJ
         e5RFVP65oB4VmSvrGSYmzGx5xd64mi2K+DogHjmh2X36+tKjwnZAxi1pWdntK/OAHqJj
         U1bF10Svqu2SA5El05aAQumJtbfKFb/AZWb8f+Zz553hdK8BY/NuVUJP7lGKl0mveB43
         gnOUri7IVDSxCrEpKX5w9gjDdig63DqFNJKb96Naggz34n20RH8ZTI7KhFbeYZoUJc+8
         N8xw==
X-Gm-Message-State: AO0yUKVk6ZDRG9haAlsmV4LUsdICg0StfPD53/sanUponOrVBV/qU2iE
        /Ug0M+Yk8KSgs/ttMJk8kqvR/CDSCN1jl06yh70zZw==
X-Google-Smtp-Source: AK7set+MeyGSpJ4i//sBOrMhtqnXGQeYnRknPSO/vol4ZsUrpBQAuke/SZdFQfWNwET9QpGrwLa1XYVyOyJ3wbPERYw=
X-Received: by 2002:a67:fd13:0:b0:402:9a0c:b682 with SMTP id
 f19-20020a67fd13000000b004029a0cb682mr585377vsr.5.1677531697400; Mon, 27 Feb
 2023 13:01:37 -0800 (PST)
MIME-Version: 1.0
References: <20230225030813.3885661-1-benl@squareup.com> <CAMRc=McAAT7A9-XM4QdRtr9mFbDNM8bpDNJXUrxxxg6QppmfHw@mail.gmail.com>
 <2e7df47a-f9fc-01a1-2b6b-c1bfb5b153ca@squareup.com>
In-Reply-To: <2e7df47a-f9fc-01a1-2b6b-c1bfb5b153ca@squareup.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 27 Feb 2023 22:01:26 +0100
Message-ID: <CAMRc=Md7Uwy9Qv4oxsjFiu1un_2mxquBR+Nn4xpkwfOiSadESA@mail.gmail.com>
Subject: Re: [libgpiod,v1.6.x,0/3] build: fix compile issues against non-glibc
To:     Benjamin Li <benl@squareup.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 27, 2023 at 9:56=E2=80=AFPM Benjamin Li <benl@squareup.com> wro=
te:
>
> On 2/25/23 6:10 AM, Bartosz Golaszewski wrote:
> > I applied patch 2/3 as it's a fix. For the rest of them - my goal for
> > the v1.6.x series is to not support it anymore, than is absolutely
> > necessary - that means no new features and android build looks like
> > one to me. Any chance you can carry this locally?
>
> Sure, we don't mind. But I'd like to gently remind that a lot of device
> manufacturers like us have platforms that are unfortunately stuck on
> older kernel versions that don't have the v2 IOCTLs.
>

Ah, right. Android again. :)

Does the android build file need to live in the top source directory?
Can it go into a separate contrib/ directory where this kind of less
maintained stuff could go?

> Are there plans to introduce backwards compatibility to libgpiod v2
> to support pre-5.10 kernels without v2 IOCTLs? I assume no based on
> your talk from July since there's a major data model re-architecture.
>

Not really, as the previous uAPI is quite limited and a lot of
features of libgpiod v2 would no longer work.

> Anyways, as an aside it would be nice to note in the README about the
> 5.10-or-later requirement for libgpiod v2 (apologies if it's mentioned
> and I missed it).

Sounds good I will add it. Unfortunately it's impossible to know the
kernel version at build-time so configure checks are useless. We also
carry our own copy of the kernel uAPI headers for other reasons so
checking the target's headers won't fly either.

Bart

>
> I didn't learn about the compatibility gap until I tested libgpiod v2
> tools on-device and found that they failed without a sufficiently new
> kernel. Bummer as I was looking forward to being able to reference
> GPIOs by just the labels in the CLI!
>
> >
> > For v2.x I'm open to adding it but have a couple comments, see the
> > relevant email threads.
>
> Thanks, will respond there.
>
> Ben
>
> >
> > Bart
