Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C62F22E779
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 10:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgG0IPu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 04:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgG0IPu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 04:15:50 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B7EC061794
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2020 01:15:49 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id h19so16191586ljg.13
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2020 01:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qhp3zn/S5T76H2y1nHGP53o8P3SYGgo1t7ExJQ94lRo=;
        b=sZRmTr2QRJtlZat87Jw5tvCZ+Jgj01sf9HOfH/YE2swB7dy6haxMsR3ILQ2xha9wbr
         mo+uePkbI/JtL+MZN9+5pC+2UsTCxAzoJtQFERKikXxIwlXjm6DASru9V3BATBIVVpa2
         xTiUHcKo6misCIAdyhQ1iVgoWok3mv4cQjYQsowXoGnhMx1DyE1gwxLX/ANAe+ssDCm7
         byOMHq3dnLGXyM4czAwqRuKqVTiCAFBQKSWmn1fNh8bfrsYzgCaFrdB51Fg/pj31vsuU
         4J9GJoUIqLICJYmiw+gcaKAVJqS9GFJPgx87DUw8RG2Z52avKWq29V0L4yW6PgtQTbrG
         5jpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qhp3zn/S5T76H2y1nHGP53o8P3SYGgo1t7ExJQ94lRo=;
        b=UUYuvIpmDowTzLGysWDZkpIFMHZVS6UyxfrA2+LHGZ92wJc/7NL91Q9YlKmlmeq+dT
         WEvtwYTDyNbDWIrZFcy+xBrLhYLjzDyWnYyfenO3+416B42aPcuNwN3vh35yUS+KsBca
         7QUts2dUVM99I1eVG32WXmUHGFuJls8c63VMalWjJRDZA1PC54ipC9rsV49cgOzHMUyO
         oEPQp04T98rHgILk4o/Hw5OWjcphyJIk94bRY1njofsh1vmNu5CQhFVOz2BOGLVLRQwN
         ZGjNIFEf6339u4l7mOhwdNL6VsXEph1nGS6J9R5a/POpK4TxM+M21PTMGy4oY5YMNg6r
         dLQw==
X-Gm-Message-State: AOAM531oU5e6BaP+bcR3rkzxbcoKxD1Smd5C+1H4VJuu9CLUozTYtJH8
        HjzNGoM9p6fuQJ4XyNgIc82cLO8Lb7RdEAkBNxOFwQ==
X-Google-Smtp-Source: ABdhPJxVIa9xAHnjxtyOcmkJgGyRDGwKS4oGmRuA05wfeBkGj7qWk30nngtb1A5tbjqvxi//U9Kq253CWspCCcze/I4=
X-Received: by 2002:a2e:810a:: with SMTP id d10mr9270946ljg.144.1595837748514;
 Mon, 27 Jul 2020 01:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200725041955.9985-1-warthog618@gmail.com> <20200725041955.9985-4-warthog618@gmail.com>
 <CACRpkdZymmO9ku5OmCO74eiX3Y3jq_1g5De9Tx4hg3Lyrdt6bQ@mail.gmail.com>
 <20200727014601.GA10761@sol> <20200727055730.GA29606@sol>
In-Reply-To: <20200727055730.GA29606@sol>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Jul 2020 10:15:37 +0200
Message-ID: <CACRpkdYNaeunyQ4ymq9WOOEZhF7NH3USVNVJ1EcY68-=oOUVdQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] gpiolib: make cdev a build option
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 27, 2020 at 7:57 AM Kent Gibson <warthog618@gmail.com> wrote:

> I've gone with this:
>
> +config GPIO_CDEV
> +       bool
> +       prompt "Character device (/dev/gpiochipN) support" if EXPERT
> +       default y
>
> so the entry is always present in menuconfig, and GPIO_CDEV_V1 can still
> depend on it, but GPIO_CDEV can only be disabled if EXPERT is set.

This is perfect, thanks Kent!

Yours,
Linus Walleij
