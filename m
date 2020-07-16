Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB929222265
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 14:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728448AbgGPMgL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 08:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728123AbgGPMgL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 08:36:11 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4231C08C5C0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 05:36:10 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id x9so6949605ljc.5
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 05:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Drk9hGfz7z8AP1xpL2RwueoIRFxJVbcmxPnhyhYlKqA=;
        b=VLXRrw/Qy62IqgJu0+kWErLUMk7/RiboeWpuWq93NzrX74UvhwUPaBDd/tXbDAOSKk
         hacoDUHy4onMkkhJGlFadU1T+49FQCUzD1MTZobO0v6oiOucurymWCQKj8MKXEb4SB8Y
         1rrRiQKAYJ9TkaEciOTc/FuW4b1Fu7G6ckFGmWwXwBsHiNI4UOYKSLgokBSp5st9VFzY
         P1cH2ekmkXuj4tnjQ0WSDEdFmc7Wu7dHh9ChbENYh9o1GLQBqzjOHyr81KaVEEyDZ9v3
         OLoS7jsU62cGSwQQmiquLZyL5glCbaD+HZhwrw75WwOMXyxmKvnIoPwA/pfWH1BC1eUa
         +Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Drk9hGfz7z8AP1xpL2RwueoIRFxJVbcmxPnhyhYlKqA=;
        b=eKj3mhP/TgVOu+3T5GtLgIealUecXeYpy29bQc4rXSKuPYUwA0HuQabH/Xc87V1bMM
         aHWNrn6mIIiXlkNIWVj7AcVypP//MJHQIevHVZ6l8E6lWcTDua2mLrsROY5CXSuxSUYI
         yx+8HWJ9D1B+kIhIJI3LifpVpiK3MfGwToQmxXIr8AQaq6wymQ8HKK/lmT2OKxGLf93k
         uVxPOAkMjBB5ZgdeCvvfmai/Jc9xWsA7SR9PCqdWiq8W+iw0ZB3dJSN4zSS4gyqO1KSS
         RoEZqPm6qqtZMSa0A4s8WXm/n/lmLUgdhTyY8+W/jRv3c5tDb9FiVnU7eIUbgkQ7fOkK
         j8mg==
X-Gm-Message-State: AOAM531lu7tHgVHYFzlcOZx4DD+P0Q0QtbHCxoi8aYXQVwSMBkXW2yUy
        4r9dhDk3pqKVMjCRn13LIlgzdr1IOUZ1kxy1ZvPCgQ==
X-Google-Smtp-Source: ABdhPJxT8CYQTjkttRKbrnf85+UEHQbpzRI3gp2UWZ4rwDp4lUHT9pdGOu2aN3TDinzHO647HRInpwijqm/N8SwtkIA=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr2021800ljj.283.1594902969210;
 Thu, 16 Jul 2020 05:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200709134829.216393-1-mans0n@gorani.run>
In-Reply-To: <20200709134829.216393-1-mans0n@gorani.run>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 14:35:58 +0200
Message-ID: <CACRpkdZhd6UoHQ8gJKXHAAtdsbt1=2K5TGc-hKT7uS+SfDOR5Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] gpio: add GPO driver for PCA9570
To:     Sungbo Eo <mans0n@gorani.run>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 9, 2020 at 3:48 PM Sungbo Eo <mans0n@gorani.run> wrote:

> NXP PCA9570 is a 4-bit I2C GPO expander without interrupt functionality.
> Its ports are controlled only by a data byte without register address.
>
> Datasheet: https://www.nxp.com/docs/en/data-sheet/PCA9570.pdf
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> ---
> v6:
> * removed client
> * re-added mutex
> * removed template_chip

This v6 version applied, thanks to everyone who helped out
reviewing this driver!!

Yours,
Linus Walleij
