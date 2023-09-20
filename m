Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA297A81F5
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Sep 2023 14:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235925AbjITMwF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Sep 2023 08:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235884AbjITMwE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Sep 2023 08:52:04 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFC0DE
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 05:51:57 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-45289a987ddso803123137.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 05:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695214316; x=1695819116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NnQhFZ0YHcf11/hXVMOAl/6rPiXEQ3EoWGpvXe1OYp8=;
        b=XJhSV3ix5WGa2tGIXkEfMYOFoqYWnIGYwKpZzXqI6MP82Yvsjyod6DFaV/xZfwBg9H
         53nFpaGjIj0WIn0gtSe9/HnJpDd0uF5WsT7M5wDhkR3Bjx2eDkgccnDfBKIu0+wunq18
         gQ8SMP+38l+GK8mE1wVDT3xGmZfkHgBckIGbBhJXVWSGwhkzmeL0g2wrLEeCOa4wsk7E
         0L7OeCnAzXiQXBAQkyMCoqUaUsQW9vAWqlzEA5PBvgPW6m/B+NGmzQyXW0VO5szk4wf5
         o0e7HLNvK6mJgqtHocsPrI0Sos2gEB6n3TyJzro14pJJA9WloESegKnMkUKBO6HRLV1f
         XKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695214316; x=1695819116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NnQhFZ0YHcf11/hXVMOAl/6rPiXEQ3EoWGpvXe1OYp8=;
        b=in/sR7zQcdKEDudVCqBDE/J/myZVF0z0WQ6Uuryj0QiejfBCjDpr/PGywScX/Cj3ZX
         0bbmk7PINSvVWV79UkT37szGUXsLmZZfxu3JhMWnfv3yZoe1YVfm6L9TCZG9coyfGoUa
         EY9ZLi9HgBOlhsVNjlONFUHBETQ4MAvt392diXJl0iSJKMdFm4Zi8LbRy0Ohj2UzjDpM
         Z14WNwDUM0B+MCdGCTfF9l1B9SyWKUwMZeDCxH7T1lX7YIIOQO/ggk8rGEAfjCppKFtu
         DH3uw5ljHTl5OHQaOJSwTDmqz9SLyaK4RSkihbjKYMFS9KussiwdEgNN+sAMHBNgIo+p
         N8FA==
X-Gm-Message-State: AOJu0YzfSom+kWxdD0ea3YT0WEJjFVwNOn0Q0lCop8BbBiGZ5kVU83Pp
        PYjGlkAEK1rrGQTVyBiDvjJxdYwANAka9TK7d6Z7ZnpXOQntAb/219o=
X-Google-Smtp-Source: AGHT+IE46lqafrmo+DdRxsxbz8d7zwbqGdxgFag3PP2FoPQ7myi4WRJcklh67pav8VUtyxe9rqokP4mAa7mWMYwQ/j4=
X-Received: by 2002:a05:6102:34d5:b0:44d:3d29:4940 with SMTP id
 a21-20020a05610234d500b0044d3d294940mr1520097vst.35.1695214316607; Wed, 20
 Sep 2023 05:51:56 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 Sep 2023 05:51:56 -0700
From:   Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <CACRpkdYNA1rkG5wJ0+rAT9g4EyzfbN5VP2a9vuMMk_RD6bMLFA@mail.gmail.com>
MIME-Version: 1.0
References: <20230920085639.152441-1-brgl@bgdev.pl> <CACRpkdYtbGqmMqN7FNhjYJGG+e0jWQmozf9kpNHiUBJvd2c=7Q@mail.gmail.com>
 <CAMRc=McrXEQbwcsK3yrfROujezjMd1L4EcJj7GNTCE5L6zD1gw@mail.gmail.com> <CACRpkdYNA1rkG5wJ0+rAT9g4EyzfbN5VP2a9vuMMk_RD6bMLFA@mail.gmail.com>
Date:   Wed, 20 Sep 2023 05:51:56 -0700
Message-ID: <CAMRc=MeaAG5w_JzgSNs-EC5HY=2izC4W1FHZ54trEW_PvA8Yfg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: extend the critical sections of lookup tables
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
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

On Wed, 20 Sep 2023 12:58:58 +0200, Linus Walleij
<linus.walleij@linaro.org> said:
> On Wed, Sep 20, 2023 at 11:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
>> On Wed, 20 Sep 2023 11:12:58 +0200, Linus Walleij
>> <linus.walleij@linaro.org> said:
>> > On Wed, Sep 20, 2023 at 10:56=E2=80=AFAM Bartosz Golaszewski <brgl@bgd=
ev.pl> wrote:
>
>> > Can we rename this function gpiod_find_lookup_table_locked()
>> > as per precedents in the kernel, to indicate that it needs to be
>> > called with a lock held?
>> >
>>
>> I think you mean gpiod_find_lookup_table_unlocked() as with this change =
it
>> will no longer take the lock?
>
> I think the pattern is the one I indicated: *_locked() means the function
> is to be called with the appropriate lock held, cf
> arch/arm64/kvm/hyp/nvhe/mm.c
>
> pkvm_create_mappings() takes a lock and then calls
> pkvm_create_mappings_locked() which even asserts that
> the lock is held.
>

Ha! I always though the pattern is to call the functions that *DON'T* take
the lock _unlocked(). This is what I used in gpiolib-cdev.c or gpio-sim.c.

I guess both conventions make sense in some way.

Bart
