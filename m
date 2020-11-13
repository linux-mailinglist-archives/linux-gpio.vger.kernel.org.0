Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE5EE2B176F
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Nov 2020 09:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgKMIlk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Nov 2020 03:41:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgKMIlk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Nov 2020 03:41:40 -0500
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D1DC0613D1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2020 00:41:36 -0800 (PST)
Received: by mail-il1-x141.google.com with SMTP id e17so7801176ili.5
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2020 00:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DH7kkZ11CMRazmFAgj+LZ0CU/PZt37jgf91Yi3Taz1Q=;
        b=RI4helT5zsW7KaYRbgSek+qmADAfBXknu1wcUiW7FcNz4aafuectcZEJ7sNvcZc39c
         stokEJe9pfdpGOF2Ay/mVak2xxTjuKC97Bg2TaKx5f09Ejq0R7ghhUXs6q/WPsNEADJc
         Hf02CxScj6jFfT3LP9QigQfSWba8rgULmU5+oNSekqBG1PgxMaciPaSiGBG7/D6JwEKE
         BrNS7Vg2XKleoyJok2xNAUEcSbf3tDC0oGqoEiqnn1k8CX8nvja0MJLJveZbhKGdY6JD
         301LXGz+QksxoCt3+d3htYFQpDpr/gYe30Do0TpmAVCGW9/BxCZn5Jpe3dCdmUQz++dP
         OCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DH7kkZ11CMRazmFAgj+LZ0CU/PZt37jgf91Yi3Taz1Q=;
        b=jey8Q0V3IEcfbPK6Ne7ux6rZCYBln3cRQ2VKMxufbMJ3mWUx6xmv5B2TD9QWn051/D
         BF3tDK2FEvBtlr5bboPMwhkoEzdGbdlsKIXOFvXdVelQLkJhnTVOooogK2LXGTFcRnJr
         lPVbijZqm8baMl7uajNg1YlAQQydsiDdwMU0zdEPaFkrBDe3rvrqT0ITOxIVWZwUgkz4
         8N0++xTjxaZvjkcZ8mjYRqtwUD7edVWNr8S2nCwsnMT88hDRdxhvqLpL2fa1uqONufTp
         noszEFIsw3sH4qG9Sg7F9R0VAsXDN5YJ0d+qlJdLXKqmi8LewB5zcgi85OPysAZo22X5
         cRmw==
X-Gm-Message-State: AOAM531+6+vYsxn3SVQKEMMBQUKdfFlIJddP84jDY4fhvE1SgXUhwQCm
        NRDxCfkDJ7geLiywntY+fj/nWFLFujD2nI6PmfYgb0/j1tU=
X-Google-Smtp-Source: ABdhPJy6nPp69A7BzHhGcA96/SLOTLhbH+HTNtRtmLXskPXdtiKaE4OGbgg3+PIY7GAtBggoC72umQNyyAzIaf4Dxuk=
X-Received: by 2002:a92:4442:: with SMTP id a2mr1107200ilm.220.1605256895824;
 Fri, 13 Nov 2020 00:41:35 -0800 (PST)
MIME-Version: 1.0
References: <20201112110642.14903-1-brgl@bgdev.pl> <20201112110642.14903-2-brgl@bgdev.pl>
In-Reply-To: <20201112110642.14903-2-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 13 Nov 2020 09:41:25 +0100
Message-ID: <CAMRc=MfHmE3=o5tSLwmbrCa3UZNqnmDU-C-_5+tLYu6=1KPC7w@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/2] core: provide gpiod_line_bulk_clear()
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 12:06 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Provide a helper function that allows to reset an existing bulk object.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---

Looking at it now - it should have probably been called
gpiod_line_bulk_reset(). I can change it when applying.

Bart
