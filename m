Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF667299069
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 16:02:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782934AbgJZPC4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 11:02:56 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41780 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782932AbgJZPC4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 11:02:56 -0400
Received: by mail-pl1-f196.google.com with SMTP id w11so4853700pll.8;
        Mon, 26 Oct 2020 08:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=psX6n66MQwyfEiyikTLHjEHjwfd5B1WMSTlkYFGa52Y=;
        b=hfFd3nIrcpHRqgImlMM08AWxljwBocmBMfZTgPHGCFBR62lbTrKEIM2bWjNHzLMp/A
         lQSMa2RixP4jdP+2K7fe9+O7ckPiIcCCgUEZ4qsBs+rMWX/B0gsDJUfTXPOak+8AJUgK
         vGAogR7m/BkqAhCRiqYFjhlho2wcCQKyXYR5lzV7knVlF0hwMT9Vh3ut1v8N0hWT/6Ar
         YEObbSI6GEQj8k4wNBf2nmBIeEG+5hL/+MAOww3qpNJEM43R19d9MCVChB7XW0A3fusF
         7f6eIol+X2GwVCaYaiqMlX+BJBUMfPq03kFwRc6kI3azl6gZk45zDzLajWYF/AUqq4DQ
         q0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=psX6n66MQwyfEiyikTLHjEHjwfd5B1WMSTlkYFGa52Y=;
        b=H8AQQL3vpbB/v3YdFchVwEnZZShjL9cZMQgvUNuf1Z9PCBI5uCAYzm6cYLGg6JgLr9
         DPUHY+H95EyoPslmzBSnoDoF/8ZudMQ2yI0HacNfFkJfagsm/Bq7DNuc2xMfSYLHO/gJ
         /lcMKxgeFbAGBAHB73iJbJYOS8mizVbByBRRCSV2r7LRpuBrCwEUffmxxKOfVdimYvPX
         euAYNvdaAo0Y5lWCK5pQLVFZ28RyqQxYRGquMQCXTz1mW2ugPsSiBrUN1tnkop8w7zS+
         SHYYE0Di4RDXW8wX7w43CT63TbuDnNcldy7yhVKsFakcT6tvMqYP1DGng9WKoMcV98Jk
         q6tQ==
X-Gm-Message-State: AOAM5318yHOkErqIlTyLLsOf+BNpBA0S3w5PjOS+E7tm0yGPREywawpY
        bRCpkFu7CbjNkd4GqEDnFG9NYfsug2Y8ivSrwzs=
X-Google-Smtp-Source: ABdhPJxymNzsnqreAxrYLX2p4vapi9HycFkzBxk5gHui/erqyAXRdidkdn6t8vTb85rQbqqQ62hBd4YSwBoKNA2mbzo=
X-Received: by 2002:a17:90a:fb92:: with SMTP id cp18mr21126330pjb.228.1603724574159;
 Mon, 26 Oct 2020 08:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20201026141839.28536-1-brgl@bgdev.pl> <20201026141839.28536-8-brgl@bgdev.pl>
In-Reply-To: <20201026141839.28536-8-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Oct 2020 17:03:43 +0200
Message-ID: <CAHp75VeUuZ1Qock+n_9ee4ESD4-kfYyy1AwPA8PJXmWaYNdsvA@mail.gmail.com>
Subject: Re: [PATCH 7/7] gpio: exar: use devm action for freeing the IDA and
 drop remove()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 26, 2020 at 4:22 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> We can simplify the error path in probe() and drop remove() entirely if
> we provide a devm action for freeing the device ID.

Always the same question to IDR/IDA users:
does it guarantee that when the driver is gone the IDR/IDA resources are freed?

(It's not directly related to this patch, though)

-- 
With Best Regards,
Andy Shevchenko
