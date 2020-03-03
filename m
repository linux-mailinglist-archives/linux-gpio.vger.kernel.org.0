Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19321177626
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 13:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728446AbgCCMfx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Mar 2020 07:35:53 -0500
Received: from mail-lj1-f177.google.com ([209.85.208.177]:38965 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728415AbgCCMfw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Mar 2020 07:35:52 -0500
Received: by mail-lj1-f177.google.com with SMTP id f10so1482204ljn.6
        for <linux-gpio@vger.kernel.org>; Tue, 03 Mar 2020 04:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wv0D3CHb4lu2YJeniLkNLNWi5/z7z4fEiq+GRcsPDpY=;
        b=yi+GLbAnspHKSFSa3ts5rdqNSHW6b8FAOrfdx/Qk/5kQT2UohnRySocFWergynJ5aA
         2OIu0k/mwjar2mNmwA0+/t4h4XwfNaprh/ZM09R1R2vAb/D3DZYYtd0sojec64pzChdZ
         dawfV2yCZeoYbd/CcipUpLghHBHz9e0RJsrzxaH/i8jxaJqdWw1irwmQnQ73etJc8k3w
         V1em/dudKAuQejAFdydhIdOy6HFsoc5D897Brad41M1PI1anPXt0sXz4RpBkzpX6Au2P
         x+p2z43gclszgbvJGXN63yd/EQGttMWdJPQb4bGSYwtuzrxeeWIETkCFlQeZS1ckT21K
         dGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wv0D3CHb4lu2YJeniLkNLNWi5/z7z4fEiq+GRcsPDpY=;
        b=OM/sIKv3teWz0f9PuUhBDZaoHsVN3UwqQDz1Lzj0BjsumgslkOcAnjUhFrJezSMprk
         MBViXAiuSHM1qG9da1NTzzK0sRMKMc3Xt+jBIc1r9okEd8vRo2Ikx7MOFscbR2Q919HT
         m1LwJeilCgASj0bGtCqdvs2o1jcjpxGbKApMXGJdrGQW5cYhzFATaf6HYIKlw/SXor0f
         jnqQnikb4pp7IwpPR1ScmJWtDxMcGCSnqj6v6X8O6MGyTsseby3hq1Uun0k+zFH9pqpL
         EiBdSuK2cMNuTxeD83iawiNYBgNP6/I9oGb0mpNQYQcChM28WsSj/zYj9OcMbXs0psrV
         l15A==
X-Gm-Message-State: ANhLgQ1M9rLGxy8OArKHmX+pIoZYl/cFweL2mI3QCyYaVLZt9MWYG1AD
        5NAKyIOby/vvpnguY3dzDfkeao+wQV7AtfxKhkwp3yis
X-Google-Smtp-Source: ADFU+vv086hyWjD1XbNm3rlckyd8gDp7ez6WVohECtVNdqMlgPJH+0Mpi7w+aKXlhm+2EDO58ydxUT7yZD7Uj0+LK/4=
X-Received: by 2002:a05:651c:39b:: with SMTP id e27mr2165975ljp.99.1583238950605;
 Tue, 03 Mar 2020 04:35:50 -0800 (PST)
MIME-Version: 1.0
References: <20200302081142.8599-1-brgl@bgdev.pl>
In-Reply-To: <20200302081142.8599-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 3 Mar 2020 13:35:39 +0100
Message-ID: <CACRpkdYq8Q1UKGnV7FxfHSNiewYrsKD6tmiUXAFDOjQV-omq2w@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.7 part2
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 2, 2020 at 9:11 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> this is the second batch of updates for v5.7. It contains two minor tweaks
> to core gpiolib and two fixes for the line watch/unwatch ioctl().

Pulled into my devel branch! Thanks!

Yours,
Linus Walleij
