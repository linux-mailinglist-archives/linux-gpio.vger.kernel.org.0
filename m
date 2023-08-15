Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B78A077D288
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 20:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234051AbjHOSzu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Aug 2023 14:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239541AbjHOSzV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 14:55:21 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB476212E
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 11:54:59 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-76ca7b4782cso381626485a.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 11:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692125697; x=1692730497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HnC9mL+96GsmQffM/WCJ2ziVs9nsHYzni1mDXC/fnY=;
        b=Mblud5STGyonJDXmqkTtjwoLcho8UzXgLrw2xSb39adaE2xzwJeVQmJ+ms5donNqTF
         nlm2g9Fog+813w1Oh/X+f9Pa10I65Xunc4x2k18g7hXGzYenfAM6IjiRqWtoZQF5hP1J
         3zsk/u25kwbXaGdm9WfSOfUjZA6oJGSUJgwYIadzMUeI7hRB4LcAyLgeim/s3iNgQOBB
         AM8U1aMT9POFTOX+w0Z3MDIu9V9VfOxBmCo2W+fVfRbCdcAkdlThFMlbb0zfvQ/rXwRw
         vfc4HgEZEj6uKGrn4dTeiLKanzDcDybzTnQYajULLGPFIVrabN91tUjpfGzYcxB0kLe9
         8Gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692125697; x=1692730497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HnC9mL+96GsmQffM/WCJ2ziVs9nsHYzni1mDXC/fnY=;
        b=egO7+6h/MQPSIk4aFBk32+nVwN+pC81z4RqYoRgxP+7+JkcVqtXqPExSHX0/LHnM+8
         bY5D2AoR/IKGPHQsNJOUgnQHeEj3NO/Y3x/y4hLfgJJmcyTU7KdZ2N3NMwc1fjzMSqjy
         hRx++ftw6BINpxqZhR4wayNrtAksgyCBonq3JVIFmzHLHM7Jl5yBhrxAJjGH/txp5qH4
         UGaKmQdXrBwendeoTRnOR2kzYOcOygT+cgBUBIUSk3Zk9bXNswKnqQhSIuaOJZAzWxFj
         Zt3lCGiRQQPmjOREdQn3uCZ6D39q3IN8btUdesKcMuew0G+p3S334mElL4jKylAt9Qc6
         NVBA==
X-Gm-Message-State: AOJu0Yy3dcP6/S1abCxFiMr+sbXU8vM//yz7lhHpacSjneU3eAt9qq8Z
        GyV/RrkWxIkD5N3HM5Kabw7eDdg/4bFnJJv57aBlqqbfwhB/HGqhly8=
X-Google-Smtp-Source: AGHT+IFdRsoYWoMD//QwpgN/QPqG2t/pBQuGz8HhsB6vm7kpmEnGwmWnIgqub8yZ0kmbBbL0mzyf7mKCDUX9PD5mLCo=
X-Received: by 2002:a1f:e701:0:b0:487:19c7:4ed7 with SMTP id
 e1-20020a1fe701000000b0048719c74ed7mr13039134vkh.16.1692125159868; Tue, 15
 Aug 2023 11:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230812185748.5799-1-brgl@bgdev.pl> <ZNtUpMe41HEztHLw@smile.fi.intel.com>
In-Reply-To: <ZNtUpMe41HEztHLw@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 15 Aug 2023 20:45:49 +0200
Message-ID: <CAMRc=McQX+YJYYncOe86+G7JF6qxuVA2p58qpK=sKLxW-6=mQA@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: replace memmove() + strstrip() with
 skip_spaces() + strim()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 15, 2023 at 12:34=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sat, Aug 12, 2023 at 08:57:48PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Turns out we can avoid the memmove() by using skip_spaces() and strim()=
.
> > We did that in gpio-consumer, let's do it in gpio-sim.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ...
>
> > +     strim(trimmed);
> >
> > -     return dup;
> > +     return trimmed;
>
> Can be also
>
>         return strim(trimmed);
>
> If it's only about \n replacement, then
>
>         return strreplace(trimmed, '\n', '\0');

No, the user is free to pass all kinds of whitespaces after the
string. I'll queue it with the above change. Thanks.

Bart

>
> would work and in the next release be changed to kstrdup_and_replace().
>
> >  }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
