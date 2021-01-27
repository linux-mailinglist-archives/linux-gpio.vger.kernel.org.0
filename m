Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D65305E7E
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 15:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbhA0Ol1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 09:41:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231883AbhA0Oj6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 09:39:58 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E256BC061786
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 06:39:17 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id g1so2730753edu.4
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 06:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eEyKW0OOeD4bMUfDmmY4ocDleZrgI9OkhPdKV5qoR9Q=;
        b=NpkcQrhNC4YHc9tjgqzG7DBQsgSQqM+chQ4UTHFp+TY/c7PVyiUpubswyJzTAL1yaN
         FPat2TWT/YofF982tghVVSNvEu0sfx/bDwbrUdZoQEjq0pZkcheI5UP+vi65N0hIWPVd
         VifIeF5iOuQvWvw3ze/3rvHxzLRiKcT9JydM8UGDc0ENAJ4bLPRw0l0R0nIY2v1Z/1Ao
         zt06xy34R8cuLJfdczhgeM0Lyd4l1teb4vCe1UoCPz6yr2gwqOlkH9WJWIagSD5CMH9v
         YVEKM8xhDJa6x5Cqf6C2zHE2AJx4IjB/UgkJ2/OS4dBtECctzEY9Uetkk1q4Rvglk3wG
         jSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eEyKW0OOeD4bMUfDmmY4ocDleZrgI9OkhPdKV5qoR9Q=;
        b=oy3t7QCg/hmB7o44lTOfgT40fwosdcC5Uh2QHd45X6+ygoP6oNwC41j3iveGksFsZ0
         40CkyICW4HzkJYU6P0tCpE2ycorY2+lBuxTw66Q0ybCazE0aRBw2wRpZGk+JM7o4St4W
         OMWXE5czDrQ+q+ksOu6oXSzWUSn7dH20Vkyop7CHPqP0a0/5OhFLGF/Q+qGyUm63goHa
         6AGrj1mb+lSbVO+0+iUHN+ve2FLyfdP5rNquAZQXCyiHnhFDNepWTUeQnis/mA091JvA
         ykpP3yFebWehim6KVKduPo0TodIDnbzgg+AMaHxNpFyyBCUmUhhezTP/UMBo6tZy9l/c
         pdpg==
X-Gm-Message-State: AOAM532nRRvBObWNqtjTlZlWBCE8brD/Jeav/mdyJ34ZZgdLPV+3QlmS
        LzAye8QMmi9ZW6nEzJ9qI+/It19hLjAXFko/Lcmd6A==
X-Google-Smtp-Source: ABdhPJxwP7vlLvBkETSQDDl3Zo3nlrn5s4PVm8Xh/te4H7ksBYhxc09YD60i7DSnCBOBaUnzlCM58jr0O8r6Su8dRHI=
X-Received: by 2002:a05:6402:134b:: with SMTP id y11mr9213196edw.88.1611758356543;
 Wed, 27 Jan 2021 06:39:16 -0800 (PST)
MIME-Version: 1.0
References: <20210122195959.4197-1-digetx@gmail.com>
In-Reply-To: <20210122195959.4197-1-digetx@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 27 Jan 2021 15:39:05 +0100
Message-ID: <CAMpxmJVYnxnrq87hmHKnEbCh7pqYUDSCgzWSjvVx4TP0YvKrDA@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: tegra: Improve formatting of the code
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 22, 2021 at 9:00 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Don't cross 80 chars of line length in order to keep formatting of the
> code consistent.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Patch applied, thanks!

Bartosz
