Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC1D879E9FC
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Sep 2023 15:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231959AbjIMNqU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Sep 2023 09:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237931AbjIMNqM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Sep 2023 09:46:12 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A39C019B1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 06:46:08 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-44d60bb6aa5so2898508137.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 06:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694612768; x=1695217568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdJOdQzoVpIgE+c0/28P6CbPuu+W7TOgMnuMVPz06vY=;
        b=S3qW0rTpoPWu+826Is+Cn3KrucqBtrisujTaFsCYG7v6gF4yf5khLJq8gRjKOnZvTq
         ZUJbodfJuK8I8Qs51EW2wFVQNhrRPo4Sy1VcwtYQXyD9+9JxR78R/p8nDST4RfwvmxAR
         aB6+PGHoRW7mRIF/IxSdrCGJVNiashYSNEnATYn8L8DtiWRjyNb0tLFPD5WYnb87fi0R
         1Ed9uUSA/P/6YEL8Y5vqbOWtvoN+BbjkF/fgMKQDayxguwg7hanjeCha799+zAfDnrpJ
         atybYbeeqobFskTFC94/UKgRnNQvgn41tz90VA/xxHM+/zVgrMQFswgnlr0Gvn6wYor1
         JIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694612768; x=1695217568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdJOdQzoVpIgE+c0/28P6CbPuu+W7TOgMnuMVPz06vY=;
        b=lODikTcsJv0eo7zxN4rbiUWCBOApiGCdBv/P4XoXL0arDtUj2c8yTScCjzPsDifaX/
         rmo0uJ8kVQ59zZO+EerbaDMryL/PxD+BmM26cbNmhRypTvcHlbkN8PAlBQsHIIlFvjhQ
         vfvj0M4qM+SOPsxgYukOnyTLgr2rSP/z7nWqXI9f8iZwhTOt+OlEUS3rLATrLaNaq9iE
         nLKnmW4J+hJpZYvrt7z3mKdEnjkylfrgLoN6cjazbDyFVs2lskqEXnplHzuYp7+Qt74F
         8yZKLpYDRulcCHXIJB13G5mQFHA4P7mWy2+g1FYoPpUxJC2qx5Mi0gQOC4a2wcfC1zBG
         FyTg==
X-Gm-Message-State: AOJu0YzvGk//e4gNqy+szqXYJ/ASoxzxIi27I98Uu2b/4aWE99n0Q9z/
        ClkRJ9sJUPWcGRq3nqFNmsD8VlqG9kdlYCWjN72XwRRL1XzuABfb
X-Google-Smtp-Source: AGHT+IGAThvi1MMRD/xW7P5Fe2BYFj0QErY4doNYVL46GSEIWEvdl5RUTCiUhEKIAFWVboDJ/yNM2JMb921KY/B0wS4=
X-Received: by 2002:a67:ad0c:0:b0:44e:c10f:c15a with SMTP id
 t12-20020a67ad0c000000b0044ec10fc15amr1907197vsl.35.1694612767788; Wed, 13
 Sep 2023 06:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <CVHO091CC80Y.3KUOSLSOBVL0T@ablu-work> <CAMRc=MdMKd+6-P-ma0E0f5yBTOGS_zVaBJD6wEywyjZ7JVE2YA@mail.gmail.com>
 <CVHTW377HBYV.1CKNHXYC75Q5N@ablu-work>
In-Reply-To: <CVHTW377HBYV.1CKNHXYC75Q5N@ablu-work>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 13 Sep 2023 15:45:56 +0200
Message-ID: <CAMRc=MdR1coB9p1gvG2razQUeuwUJCaeDrTTm5o1ND+LJZ1SOg@mail.gmail.com>
Subject: Re: [libgpiod] Thread safety API contract
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 13, 2023 at 3:36=E2=80=AFPM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> On Wed Sep 13, 2023 at 2:03 PM CEST, Bartosz Golaszewski wrote:
> > On Wed, Sep 13, 2023 at 11:47=E2=80=AFAM Erik Schilling
> > <erik.schilling@linaro.org> wrote:
> > >
> > > Hi all!
> > >
> > > Currently it looks like libgpiod does not document any kind of thread
> > > safety gurantee. However, the Python bindings tests
> >
> > Indeed, the library is thread-aware but not thread-safe. Just like
> > what is recommended for low-level system libraries.
>
> Just to confirm:
>
> I assume this means: thread-aware in the sense that all created objects
> (chips, line_requests, ...) together may only be used by a single thread
> at once? So line_requests of a same chip may not be used across threads?
>

They can be used across threads alright. Thread-aware means: no global
state in the library, IOW two functions won't get in each other's way
unless they work on the same object.

Bart
