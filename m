Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6FC683485
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Jan 2023 19:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjAaSAJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Jan 2023 13:00:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbjAaR7q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2023 12:59:46 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069513A5AA
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2023 09:59:27 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id p10so12472552vsu.5
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2023 09:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nezYhvde/QcQsmcpdh8Fc3+nyJY53Alil+uSN//iqfc=;
        b=oBARWMDARYVCC3du3qKF/ZGi9W5QJgPQjl+ZMKHE8+OLLpOl9aBh/luWClybKVVucW
         Hmo+CLyue4HJPp5ckwH/pxJY0wEbIJ1dgHwWZtq/RUqwqzZ6xjeFn5RtKtcTAcOtJYvF
         1T1XA6R34eqtjU1TQg/A4kU8NZjSPs+x1lYUve/gnO9FuA4U9UQ2d/2kXzU0VkgBCzL7
         6/J4MS+p6uthxITvD+FpqITq9ZFYPQktn2srJKF4QiL1GUu4Ge1Tbe7GNog0tR1o8bDq
         at7lZrEzgTBVRuqDa0am5QtjCGgbWfVo7IvQUWqICJENLOD7hE3ecExogpo7p0J6IpT+
         WnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nezYhvde/QcQsmcpdh8Fc3+nyJY53Alil+uSN//iqfc=;
        b=u9k9oxxY3CDkZjQ8Z0AilDApACKMNWQlyDPwQDyF3A/0E4EPnbw6MGFJcm5G03NIhx
         867/9GrLwG8WlFNydw7kEGmue6T4YK2wC3A0v4YUObMM/sH+rIbWHM3m9y/lVxqQO4py
         en2lz2n6vO13pLzPplR0W6o7ZVb1LnE8RuhHZVsmaR4YChMXt2NCdSWKnjLl97SVxpoj
         Dr8rt/BVhPCN8AztTscO7PjO5ve7xge8Td9Sl+a0DmK74RbdZndGSGzaG+JMouuajzoT
         9LaWJzfylqLLqJcjXjUYr8AKzxfSWgOJAVK/JKbXmpHG74UwbXS9bSIa16r+kBiv40AM
         YqDQ==
X-Gm-Message-State: AO0yUKVL4gIvQpsaUY6/qmhg+zmtGmxymkss1vRTC9gPhBzHsiEcMic/
        IBhvHpetyV2rG5fDZ2su/rlLH1pTIhQGMro9g6zgNg==
X-Google-Smtp-Source: AK7set/fvTqyLfxAhgjiNNlx33lWP9hg6YE+vyuV5cVFQWlHaoxPwdGD9db4A0Hc1SJ/6agL3RgPlqdFaYuRj+5IOXg=
X-Received: by 2002:a67:c793:0:b0:3fe:b46c:7889 with SMTP id
 t19-20020a67c793000000b003feb46c7889mr358996vsk.78.1675187966885; Tue, 31 Jan
 2023 09:59:26 -0800 (PST)
MIME-Version: 1.0
References: <CABTDG88t8_6s0ahuEKAxXsJD1KP0OuMoS-Mqi+qoeJuHutk4Qw@mail.gmail.com>
In-Reply-To: <CABTDG88t8_6s0ahuEKAxXsJD1KP0OuMoS-Mqi+qoeJuHutk4Qw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 31 Jan 2023 18:59:16 +0100
Message-ID: <CAMRc=MdDzBQOeH01wm-i36KCDX_CM4E9jV=+gG7BQt8-36WzFw@mail.gmail.com>
Subject: Re: I2C, SPI, etc for libgpiod
To:     Hank Barta <hbarta@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 31, 2023 at 5:47 PM Hank Barta <hbarta@gmail.com> wrote:
>
> Hi all,
> I've been fooling around with libgpiod on Debian (not R-Pi OS) and am
> fairly comfortable using the APIs it provides. I haven't finished that
> exploration yet, but looking ahead, I'm curious about usage of some of
> the alternate GPIO capabilities aside from reading and setting inputs
> and outputs. I haven't seen anything about those in the information I
> find for https://libgpiod.readthedocs.io or
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/.
>
> Is there support for these alternate functions or is that something on
> someone's TODO list? Are there other libraries or APIs that I can use?
>
> I've used WiringPi on R-Pi OS but that project seems to be foundering.
>
> Thanks!
>
> NB: I'm stupidly/bravely sharing my efforts in this direction at
> https://github.com/HankB/GPIOD_Debian_Raspberry_Pi
>
> --
> Beautiful Sunny Winfield

Is your question: will libgpiod support other pin functions for GPIOs?
If so then: no, it will not. It's not a tool that allows you to change
pin settings - it merely wraps the linux character device uAPI in a
set of functions.

It's the kernel's job to do pin control and there are other user-space
tools for I2C and SPI available, libgpiod is only for GPIOs.

Bart
