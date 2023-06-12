Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7F0A72C541
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 14:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbjFLM6m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 08:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232467AbjFLM6l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 08:58:41 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49FBEE4C
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 05:58:40 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-43b27330e51so1108865137.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 05:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686574719; x=1689166719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjejRInr8aC4B8ZSTqxya72AzAPjcvPR+J38j4nMQeM=;
        b=j5Y1y20jeqdw/H5OI5DQgHlN4XDCKI7QhethX+ydojbUfwYfoiiA99CIYRqy3uLboH
         P4fI/frKTrUotA1eENLNn7GJ3MVfHCDol3niqUBCGQHM8TLidqbGvXH1xTD3oMCJOCMp
         2hPdb6NjSK/+iPKqBU7kBl42lgJ0ZpPCBsF+OTeiy9NhLdu18XcOzcMJng7v6lvmk0Ho
         RQfqrenona3rluhP7zah1JFRtNYrWzi+T3+ZYUSF51rZLhA1yVSJEkAMV3HV40LfIxH8
         jWbFkNNPSpgenBs2Y9PcR7iX+rxn2AcjkjW8jt6rmu4RkiBT+G+6eUJgVLhsFzaIw/Pm
         m//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686574719; x=1689166719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjejRInr8aC4B8ZSTqxya72AzAPjcvPR+J38j4nMQeM=;
        b=iiFMr3e+S0oKOwopVMDNU/AWkNtFb5C+WA30MjEEgvuimyui6RxOzlygBiprr42X0Z
         FNBp4hD7dk5WEkk+gey9JXXuW+X3G+ovjreFqoNz/UDTqMGPnr/CFEjx0RUvlTGH7LOS
         t6hNXny3aCNmpdLWcBrnmzIb1l6QOmdUOezoWWzNIMMHxGojaVVgkpRdi4Larujmse6P
         mjyuXcGoCRxURbis23zKKTphZyFnIibAdJb321peWbO7UCN+HXA65AEQZzyi8QabTs/O
         h1cuwOCy6PKpiTHF47RAIhB2aAqw1Z3GHaGPx5ZrduHZ5m9rDY7UW22Z8AbsLOUzjrkt
         IVBA==
X-Gm-Message-State: AC+VfDxzvh4uukw7ymV4p2lvLdaljHWf0SOX47+IIuVO6wwYhkdZXo/t
        zO3YLKF72p7b6IitZQpk2KowHsyZ+JGOd1qbQq7ZWA==
X-Google-Smtp-Source: ACHHUZ7GFAKRGfhait17N+GSuKFpTWs9Le0iNpxLhSdxwfOXmVtyUUvAPZS1d9UylmAMmDjz/SI3N2kk8QcqQTkNaYg=
X-Received: by 2002:a67:f292:0:b0:43c:5432:1fae with SMTP id
 m18-20020a67f292000000b0043c54321faemr3720261vsk.27.1686574719383; Mon, 12
 Jun 2023 05:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230610020148.8973-1-warthog618@gmail.com> <202306101327.8CQ451FM-lkp@intel.com>
 <ZIQNbB30BUsirOr1@sol>
In-Reply-To: <ZIQNbB30BUsirOr1@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 12 Jun 2023 14:58:28 +0200
Message-ID: <CAMRc=MeLYqU8HuqVs7wGpAjZ6U+_J3TMsNonknup=hOSPqj2bQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] doc: add configuration to generate doxygen
 documentation on readthedocs.
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 10, 2023 at 7:43=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Sat, Jun 10, 2023 at 01:20:47PM +0800, kernel test robot wrote:
> > Hi Kent,
> >
> > kernel test robot noticed the following build warnings:
> >
>
> Ok, not sure what to make of that - why is the test robot concerned with
> libgpiod patches?
>
> The files in the patch aren't ignored by the .gitignores in the libgpiod
> tree, so it must've applied the patch to the linux tree - which doesn't
> like dot-files. That wont end well either way.
>
> Can we tell the test robot not to try paddling around in the libgpiod
> pool, e.g. ignore patches with the [libgpiod] prefix?
>
> Cheers,
> Kent.

Normally the robot can figure out non-kernel patches. I think this
time it got confused by the commit only adding a new file and tried to
apply it to the kernel?

Anyway, I'm not sure where to report this. Looks like the robot lives
on github, so I'll try opening an issue there.

Bart
