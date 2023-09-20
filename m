Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5897A79DB
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Sep 2023 12:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbjITK7R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Sep 2023 06:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233727AbjITK7Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Sep 2023 06:59:16 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0073B4
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 03:59:10 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-59ed7094255so16156887b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 03:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695207550; x=1695812350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzQdLX4ffzjkMw7jYkFd27ktsvPZM4GAQ9T3XI7VcZU=;
        b=zhuY7guSt+OZ8Wm4Ymdd2musO6cTkfi7sJuee/VvkyzZyAlHIred7RV8G2S7r3p1Lx
         4+1bYW5RwDtrM8iSRdq8EqOlnoFl1s6eoX0VGunFZsjoovnZ6AfpmqXh17nupkPi9KFN
         7HkpanmRaudaMZC78/HeNGT62qa4ae2Oco3J+hNyMD0G3aSMwWsVvmAwLaichyJXZ7af
         jysrWqyfWlUwHm81McNfGyVtbCfizbM+Fecd2w0O0Ip7Ey8IuC4Ru29YmWPKGBBPNFGe
         oCS08mkD5lfKS/JBlZVYB+tVPSwNjuCD6LytrjGRIfPZELDYdhxtgndHjpqYxwPrrbmn
         0dmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695207550; x=1695812350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GzQdLX4ffzjkMw7jYkFd27ktsvPZM4GAQ9T3XI7VcZU=;
        b=gVcp2jJaEO14lOL6d4IDiCj8TA3HGT5OtkDRn8VVBOclS2Ft0HFsjbj0vHIC8q0fo1
         MhdFJ9/qy/+FWaSv0gCcaL/lo66BKObr064jZyewVIokyY23HNBB8iqqwzbnFGB1fjdC
         sSMMQU87x9uffx8WvD0dr2StyfHgJ8gL9tvymj/nPp5QBzJhgTjo8uCwJQ+CndysuaHA
         itpUUpi/MmIGUW3HUd7t+FOp1ds42RaezQTyAptVDqYlFxjCsRLAaIrz4LRDDQaEgXmg
         j2U9steuy2NGWVWOMJQkVMGARjv4JI0K1cYD2F0VN4LFp/vx8q+bOW+zzUD5RcAPyjvN
         hiGA==
X-Gm-Message-State: AOJu0YxMcnfIeFERmEj8vd06SJtRmKmHgCOirRoORtiwXyCq7V7xx2t8
        BUVxmXx6b5EKkqa/7jeKtmRQkWVp7V+wNtfyPfef4A==
X-Google-Smtp-Source: AGHT+IGr72j1z62epCS0j7+7/HAJUbLH92EtwQWtcMuxny6gOm4544s3QtkGEaOnRMAXnpseX14ejSj13bFM/qsUKPI=
X-Received: by 2002:a81:6542:0:b0:58c:4ec6:f21e with SMTP id
 z63-20020a816542000000b0058c4ec6f21emr2230919ywb.23.1695207550124; Wed, 20
 Sep 2023 03:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230920085639.152441-1-brgl@bgdev.pl> <CACRpkdYtbGqmMqN7FNhjYJGG+e0jWQmozf9kpNHiUBJvd2c=7Q@mail.gmail.com>
 <CAMRc=McrXEQbwcsK3yrfROujezjMd1L4EcJj7GNTCE5L6zD1gw@mail.gmail.com>
In-Reply-To: <CAMRc=McrXEQbwcsK3yrfROujezjMd1L4EcJj7GNTCE5L6zD1gw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Sep 2023 12:58:58 +0200
Message-ID: <CACRpkdYNA1rkG5wJ0+rAT9g4EyzfbN5VP2a9vuMMk_RD6bMLFA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: extend the critical sections of lookup tables
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 20, 2023 at 11:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> On Wed, 20 Sep 2023 11:12:58 +0200, Linus Walleij
> <linus.walleij@linaro.org> said:
> > On Wed, Sep 20, 2023 at 10:56=E2=80=AFAM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:

> > Can we rename this function gpiod_find_lookup_table_locked()
> > as per precedents in the kernel, to indicate that it needs to be
> > called with a lock held?
> >
>
> I think you mean gpiod_find_lookup_table_unlocked() as with this change i=
t
> will no longer take the lock?

I think the pattern is the one I indicated: *_locked() means the function
is to be called with the appropriate lock held, cf
arch/arm64/kvm/hyp/nvhe/mm.c

pkvm_create_mappings() takes a lock and then calls
pkvm_create_mappings_locked() which even asserts that
the lock is held.

Yours,
Linus Walleij
