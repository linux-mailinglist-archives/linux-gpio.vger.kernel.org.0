Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B432FC3E6
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 23:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403847AbhASObn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 09:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731672AbhASKij (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 05:38:39 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98AD6C061573
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jan 2021 02:37:58 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id g3so8402096ejb.6
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jan 2021 02:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LtpYS3fE2cC5QgHZMy5lDBgkuvmbGBZXc8oUExaRobg=;
        b=AVEAcv6erHpJS5IUR9N16OaW5mbpHSuKwXHB016yFyMXO8JGzwgihACuRmGR47q51n
         EMHHMxJmnNtY5a3NtfFcauTpTOH0ANADTCmwYaemis6q7sTvHnBYaoHH+uYZswjsuO/B
         UWmQ4vmYlfJK0lD44U35ZUM03AfHYAonkYRQQlw4bK6zSqGs8zWq+4nx3680wXx+gB9y
         ekiyqIjewfmdo4Rgteu/klRNDwKVLtaQ4IppW7xFexWFFHzEfY8dyBfRtSUNPcLnN03N
         vhhLIFqpra1Dp4KxKDyMOyKv6M9BvEJ6CzGh2Fwi9fXrfVZksEs17VACkAEuX3oxFDN2
         DyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LtpYS3fE2cC5QgHZMy5lDBgkuvmbGBZXc8oUExaRobg=;
        b=QbMN4VcQteg+0PveAyabpU90IKp+J4t3AnoLB6xb5HFgRwfCXaTFYFulRb8vDo07Q+
         vFJVOIVLEJ/G9TXtboVEisJKRQaFZRcGyZDlk/acKDJZf8xYKievkZR1TpG+maRYKcTP
         IzxYAN+cEIHuQnVgk7C/2AM/Vfm263I33Brhnmhshl+rjTm1VjEcPaXRH0tYX5EiUUty
         ldQfyoi3qX/6oG0l/mVyeUF6VWi7qOkaNNtpPKAgVoBz6kfOYll9mZ3OZVQuDP5nlrMp
         aQi64rct5iDuOzQJuAwntuZAz83bmdQJm/8L22WCfWvp1AVeOZiGTjM4Al3w9EIeD6Hv
         1P/A==
X-Gm-Message-State: AOAM533tgm+0rsVipK4zaKJOrOTkc6D1i8oidhLm+U/csFJOYhAEn/q9
        g4MQjgNOTTd+F7wPtccreeFsns1TXkFbxZKGmOOgqA==
X-Google-Smtp-Source: ABdhPJyAozB1lFwLmI79KJn1esgyufm62vTBA3EAVda+QYKmeD4MJINnKWS/8L9U70HoqJJRoGWTHTTlM9s5jgA+QNM=
X-Received: by 2002:a17:906:19c3:: with SMTP id h3mr2521301ejd.429.1611052676821;
 Tue, 19 Jan 2021 02:37:56 -0800 (PST)
MIME-Version: 1.0
References: <20210107025731.226017-1-warthog618@gmail.com> <CACRpkdZf2GhScg=sUG35nA5P6jXH93uuK0Fq_uhz29wBQLHOKQ@mail.gmail.com>
 <20210119003455.GB5169@sol>
In-Reply-To: <20210119003455.GB5169@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 19 Jan 2021 11:37:46 +0100
Message-ID: <CAMpxmJUkFL+w7afS2NKF-xiMR==HVR1Mk8uQm3782DBoG0qneA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] selftests: gpio: rework and port to GPIO uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 19, 2021 at 1:35 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Mon, Jan 18, 2021 at 04:04:51PM +0100, Linus Walleij wrote:
> > On Thu, Jan 7, 2021 at 3:58 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > >   selftests: gpio: rework and simplify test implementation
> > >   selftests: gpio: remove obsolete gpio-mockup-chardev.c
> > >   selftests: remove obsolete build restriction for gpio
> > >   selftests: remove obsolete gpio references from kselftest_deps.sh
> > >   tools: gpio: remove uAPI v1 code no longer used by selftests
> > >   selftests: gpio: port to GPIO uAPI v2
> > >   selftests: gpio: add CONFIG_GPIO_CDEV to config
> >
> > Bartosz I think you can just merge these patches into the GPIO tree, at least
> > I think that is what I have done in the past.
> >
>
> Could you touch up that Fixes tag in patch 1 if you merge v2?
>
> Thanks,
> Kent.

Kent,

This doesn't apply to my for-next branch - there's a conflict in
tools/testing/selftests/gpio/Makefile, could you take a look?

Bartosz
