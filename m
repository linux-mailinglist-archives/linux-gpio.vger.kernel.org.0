Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A17837D235A
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Oct 2023 16:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbjJVOc3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 22 Oct 2023 10:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbjJVOc2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 22 Oct 2023 10:32:28 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0458EF4
        for <linux-gpio@vger.kernel.org>; Sun, 22 Oct 2023 07:32:22 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c5071165d5so1733841fa.0
        for <linux-gpio@vger.kernel.org>; Sun, 22 Oct 2023 07:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1697985140; x=1698589940; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dZX41vcGZiltzB8LzTi24NnB45xpP9Gd2/KAsXXU0T4=;
        b=TVVt/6NzFokoeRT/wMi3AJHqYzo+OLTn6kv5C5XPWyR8hmGgqvNcMuHTiYFGiOc4vV
         b054Q1uXpCp/hW4eF4QQ+My6O5crxRcbcMwA4X/UNol8ImE+nVVghSpGxlllNM9XTl+r
         AKqTPMUAgxtCuAZZoc4yDwaReo0WBkIeKFUho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697985140; x=1698589940;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZX41vcGZiltzB8LzTi24NnB45xpP9Gd2/KAsXXU0T4=;
        b=gAd84hkbldGu4SW0I3BzpvLVQeiVaELMwwj3CAsQuGOf/oIEcAZvFMOBlmDp/RGseD
         awXuiyRJPCusutpBtATam71G4gtQE8PWUooYdcamQfNSd0UGe4ZTRCLUFkdKOyO8aElh
         mvAfz1zCmu9QgJLjs1mnyAGjxXMMIosa1QtIY/ARZu9s2ftlsnZYMnsFNBW978kI6Rr3
         iYEcBTpm3GfjtbKBsL4CC82mUUwhHHDMYTLVSOX05zQyCzZPsMLhyPL78kDlbFyIWIIB
         rX8Toa0Pga5hAp8ucWnGCJlsjwK/wwam/YZIRKdAPOxjwrRMw9Eg6tktjCsAfi99apuR
         LFvA==
X-Gm-Message-State: AOJu0Yw+/SnRe3XY5Dk1kR5uPnO6ucSYsXrs10LVTbwWq5U/6gV5J2F4
        QIpjxV7u+xMlTzVjDMVR0TkOrUyoDQhVc53ZA0RfnA==
X-Google-Smtp-Source: AGHT+IFAzxHa+IAwlY9YtT9XDVej+TUy31GYKFEVySklySN3aPPSisfmjs4mwY/oxvQ0+BPgHAXBzg==
X-Received: by 2002:ac2:4852:0:b0:507:a58f:79ad with SMTP id 18-20020ac24852000000b00507a58f79admr4386934lfy.61.1697985139881;
        Sun, 22 Oct 2023 07:32:19 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id l16-20020aa7d950000000b0053e799314d7sm4885397eds.73.2023.10.22.07.32.19
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Oct 2023 07:32:19 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so3581050a12.1
        for <linux-gpio@vger.kernel.org>; Sun, 22 Oct 2023 07:32:19 -0700 (PDT)
X-Received: by 2002:a50:9f83:0:b0:53d:be55:5fc with SMTP id
 c3-20020a509f83000000b0053dbe5505fcmr3807228edf.27.1697985138915; Sun, 22 Oct
 2023 07:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231021183925.22831-1-brgl@bgdev.pl> <CAHk-=wiOJO8nfcDeUMwYXPQHLtTnngSDd4ieUWegW1Aru8TbnQ@mail.gmail.com>
 <CAMRc=Mc-oz4e4d9pJbvki3kGgMj1DzSS1EDKcycswJKCNAbqOQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mc-oz4e4d9pJbvki3kGgMj1DzSS1EDKcycswJKCNAbqOQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 22 Oct 2023 07:32:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiVNOFP1dzKdCqXvoery5p8QoBB5THiJUMbZ1TxJb7FhQ@mail.gmail.com>
Message-ID: <CAHk-=wiVNOFP1dzKdCqXvoery5p8QoBB5THiJUMbZ1TxJb7FhQ@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v6.6-rc7
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 22 Oct 2023 at 06:12, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> I have diff.algorithm = patience in my gitconfig. Typically this
> results in better diffs but not this time for some reason.

Yeah, that picks a really odd diff in this case.

May I actually suggest the 'histogram' diff algorithm to you? It's
kind of a "smarter patience" version, and at least for me it's been
the best of the choices.

Of course, there's always going to be some odd case where for one
reason or another one of the diff algorithms does better than the
others, but histogram does seem to result in good diffs most of the
time.

              Linus
