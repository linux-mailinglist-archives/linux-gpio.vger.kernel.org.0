Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4E745B0C7
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Nov 2021 01:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhKXAi4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 19:38:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbhKXAiz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Nov 2021 19:38:55 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE85AC061574
        for <linux-gpio@vger.kernel.org>; Tue, 23 Nov 2021 16:35:46 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id o4so1603684oia.10
        for <linux-gpio@vger.kernel.org>; Tue, 23 Nov 2021 16:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kNh0jt8tv4maN2YkF0cmeBfMTgSPYwcWwHTrIEj8PD4=;
        b=RaJX8F1zRhXuDy80KZTcn+dQG5gDuyJcbR9Truhvisst9naZx2GPRqhKCfPSGA7bH9
         S4ey/ByihGFenVcwBSdlZOoytstPoEDO3jcbQaHZtCFB659a4vMl6TDNasJnhob3sdPe
         aZLjIOt8VGWOTaeoFiRoZCXBOiig0A60Z8z8jBpa8IniwasBhYcZKKI+c+m6Xp9SY+FU
         AoTN/BHReBRXjpUdt562mH0OPwsBNAXATEEKi6HNKKQ77EmeolMy74FoUMlsP1NdVzLP
         Y/Rxmk8nc15M3CDmwAJZ+vzWptXyXguBqsfmoilurxOTOpLua1Tw66SEDf0e4T27hoq7
         sygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kNh0jt8tv4maN2YkF0cmeBfMTgSPYwcWwHTrIEj8PD4=;
        b=FN76gVV4i04esZCU+SDgOytTgsv/0hTREVLWWiDbja8tmGDOMeDAwtNiRYcBphBxIi
         NxKqEoBgmMNmRtoNArFMFveGAoeAz3/fhwgPDniBCBSJmI8ft7f+isGP8DOQ9cWq+S6q
         tG4DA9V5cqP5YFQPL6366ocb/Lis1a6N1viStpWLdo9fPBAaLcRN0LF0QapD2kadbNJu
         b41H+L5meAiEDF+yFChMXs6lsrehD2B7w1B0HfYm5ixXXEvzHZQYMJbYU414QN8rXNwp
         NRDSpMWyRUQCsZt9L2SvNPxIUGrnkOckb3rbO502l70QflKOymSy3k442xF65ThyeRGv
         e/HQ==
X-Gm-Message-State: AOAM533/fL78c7ke7jkTmVysLwBapK1qf/dg1cmqSzzL/qpVRzNI5l5i
        TqNQl6Yx5MFxkoKWWctIxyM/PkzVdCTNQ77YWGC8qg==
X-Google-Smtp-Source: ABdhPJyNEmGOeKXUl3TxFGzLSZSdD+IztDjr0BhBBI2kJMnGgmHs2eAnjCm1/YARFHCchP1O0uJLUFFPcXuqbc1B5T8=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr1453521oih.162.1637714146248;
 Tue, 23 Nov 2021 16:35:46 -0800 (PST)
MIME-Version: 1.0
References: <20211123164902.35370-1-wsa+renesas@sang-engineering.com> <20211123164902.35370-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211123164902.35370-2-wsa+renesas@sang-engineering.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 24 Nov 2021 01:35:34 +0100
Message-ID: <CACRpkdYJqP7WJuhS9G65abCZHK1_LX9hkXU6o+k10t2LXw100w@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] gpio: add sloppy logic analyzer using polling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Wolfram!

I like this patch.

On Tue, Nov 23, 2021 at 5:49 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> +Introduction
> +============
> +
> +This document briefly describes how to run the GPIO based in-kernel sloppy
> +logic analyzer running on an isolated CPU.
> +
> +Note that this is a last resort analyzer which can be affected by latencies,
> +non-deterministic code paths and non-maskable interrupts. It is called 'sloppy'
> +for a reason. However, for e.g. remote development, it may be useful to get a
> +first view and aid further debugging.

Maybe a small paragraph first saying what this is, the usecase (feel
free to steal,
rewrite etc):

The sloppy logic analyzer will utilize a few GPIO lines in input mode on a
system to rapidly sample these digital lines, which will, if the
Nyquist criteria
is met, result in a time series log with approximate waveforms as they appeared
on these lines.

One way to use it is to analyze external traffic connected to these GPIO
lines with wires (i.e. digital probes), acting as a common logic analyzer.

Another thing it can do is to snoop on on-chip peripherals if the I/O cells of
these peripherals can be used in GPIO input mode at the same time as they
are being used as inputs or outputs for the peripheral, for example it would be
possible to scale down the speed of a certain MMC controller and snoop
the traffic between the MMC controller and the SD card by the sloppy
logic analyzer. In the pin control subsystem such pin controllers are
called "non-strict": a certain pin can be used with a certain peripheral and
as a GPIO input line at the same time.

Yours,
Linus Walleij
