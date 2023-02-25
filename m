Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2B86A2A42
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Feb 2023 15:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjBYOKv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Feb 2023 09:10:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBYOKv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Feb 2023 09:10:51 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ADC8EFA7
        for <linux-gpio@vger.kernel.org>; Sat, 25 Feb 2023 06:10:49 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id d7so4019860vsj.2
        for <linux-gpio@vger.kernel.org>; Sat, 25 Feb 2023 06:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CV1o4cBRY8P1L1WSKUuxlid+ty8ck5NCkHEAh8wKm3U=;
        b=bDzh48ctBNIrpAEi9eS08sxhDbeIn3b81nvCRlDxdB+8tL7e/lh9z+JLswj4FBKsmk
         lwB3vmhiLeOgfHykmaTQum8/vyAFHu57kEZuBslzzKzY2IFWk6TANWruqMQH1WovSiTZ
         PB5A5RsDwQx8ojVWsIqeS98k2BKXJ8k69FhxBxjc7M2p3vfNx5Z4moHOYs6ZB40GhfvO
         joflN3xSUMIFcBW5DfGiBudoBg/Ozktmdu8e6pFyTzQs2KqGvF9kP92XhZCWv1XFSur9
         C5TaMAt8Ce6QZY90W3hdCK4iBAwdO0gISmqdnxpt0TThew1UVWuBJqD70Kc9kbk27NuL
         YgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CV1o4cBRY8P1L1WSKUuxlid+ty8ck5NCkHEAh8wKm3U=;
        b=vglNHNhRBcQxlY53Myl2HPGdKBHqKiMm/Y7rEtWXdDMhQ89SUoYasS3+rYzzXnibas
         mCmNG6q4TORL5QEghHcE1uTcvIkgdhUowqWbddfGRY4MZXqbO4yP/nqJ5dKW+CjMSE2I
         oTGHlYQVNZ06JAx9C9TF5lx+XGHzbCo6apy7PewdmJ/Y17xLe/uzQJrbaQRT4Uck831x
         2LgwBWg1OjlylJdz6/xiIzw2alBj2p7mYEYVw2GCOtcloxI/KGpQe6SqkJpGH6A8i8dB
         mBKnVnCKj9Ekq8gjopHeqkfh/5qz4BlEbuZDSOeYrdGgZpTY6bQXSNb6rdZcZNTWWkOf
         Egrw==
X-Gm-Message-State: AO0yUKVpdUU5Aw2sDKxBDmhbqVJPjvXcmM1J6YcrGb4PUjjfIxH4+wiq
        sBbp7Xq8AUU1MMZ6/z0j6W+K9BiHwC24Yy4hccspqfwltIlmEQ==
X-Google-Smtp-Source: AK7set+rptMAvd74js/h/5bpu7tepWG0sipcaJgs/SzaolaGCOmFjp549zlAVpPGGOnVyKOOoLd7D874hMcy9lEkzUs=
X-Received: by 2002:a05:6102:f99:b0:412:ba5:8002 with SMTP id
 e25-20020a0561020f9900b004120ba58002mr2231126vsv.1.1677334248320; Sat, 25 Feb
 2023 06:10:48 -0800 (PST)
MIME-Version: 1.0
References: <20230225030813.3885661-1-benl@squareup.com>
In-Reply-To: <20230225030813.3885661-1-benl@squareup.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 25 Feb 2023 15:10:37 +0100
Message-ID: <CAMRc=McAAT7A9-XM4QdRtr9mFbDNM8bpDNJXUrxxxg6QppmfHw@mail.gmail.com>
Subject: Re: [libgpiod,v1.6.x,0/3] build: fix compile issues against non-glibc
To:     Benjamin Li <benl@squareup.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Feb 25, 2023 at 4:08 AM Benjamin Li <benl@squareup.com> wrote:
>
> Fix issues when building against a C library other than glibc, such as
> Android's Bionic libc. The basename() patch isn't needed on master.
>
> A commit with a sample Android.bp file that's working against Android 11 is
> included for informational purposes, which I don't expect Bartosz to pull.
>
> Benjamin Li (3):
>   tools: use getprogname() when available to remove dependency on glibc
>   core: add missing #include for basename()
>   build: add Android.bp to build within Android tree
>
>  Android.bp           | 126 +++++++++++++++++++++++++++++++++++++++++++
>  configure.ac         |   5 ++
>  lib/core.c           |   1 +
>  tools/gpiodetect.c   |   4 +-
>  tools/gpiofind.c     |   4 +-
>  tools/gpioget.c      |   4 +-
>  tools/gpioinfo.c     |   4 +-
>  tools/gpiomon.c      |   4 +-
>  tools/gpioset.c      |   4 +-
>  tools/tools-common.c |  12 +++--
>  tools/tools-common.h |   4 +-
>  11 files changed, 154 insertions(+), 18 deletions(-)
>  create mode 100644 Android.bp
>
> --
> 2.25.1
>

I applied patch 2/3 as it's a fix. For the rest of them - my goal for
the v1.6.x series is to not support it anymore, than is absolutely
necessary - that means no new features and android build looks like
one to me. Any chance you can carry this locally?

For v2.x I'm open to adding it but have a couple comments, see the
relevant email threads.

Bart
