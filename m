Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59E03195579
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 11:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgC0KlL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 06:41:11 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43754 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbgC0KlK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 06:41:10 -0400
Received: by mail-lf1-f65.google.com with SMTP id n20so7399926lfl.10
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 03:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JKXUGTWGrmrzZouTGYvdipQ1oDPszingLmWAZ3pe6+Q=;
        b=E37mXowJedBN3g7r4CBzWhSnSZsCAkLpZTZ6JsVNWEVVEi8K7WFf3usHnuCOO0FMYh
         VhBUGJqNGrrV65byul0K5xtnPlw/jBJ0sNOnejM5QdMM4ISJvRXtZro4WZpq/5aF+aUi
         iJm+27yueChoBvjEY+HCe+LtL0WKyGtILZCbtSjAD6zDuOheOiUNUE2MAoEnVlCUo10r
         8GDNJ2CZarWXpDek0HWK+bHhAYnzYT6W17nmn9IkDzWFtcALq9cFrtb8AzuCrTmdv5fx
         Sxc5FgbrzIqTGfSCczcQuXRoJHpbgJx/PwIV2q2O7pxa+KSHPT83+xaBqmHj48s7qmWk
         X/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JKXUGTWGrmrzZouTGYvdipQ1oDPszingLmWAZ3pe6+Q=;
        b=VdGibebEcUSB69Tt63VjRmmSrt23XjJjuD1/cuPH1YC2819/V2/MzlvU3GTirF8aQX
         X+qr5HfgaKYK5DjnyQjN7+49dgWHpABrKyTlDWIG+XPI7QUpLUBpD2XZ5uvr5Mz0LyiC
         l8JuttPo7eDBKMlmE/IYGyjEDbTf4qrUdGZJd7E9iGMAlCytSZz34yN6vdZzpf7+ozXv
         ySZhI2JWG6q4S1qsD92L8FPcLETcJk+lmBBduIyy2ePN188u0zyPbslgJRAS2EG7BL6W
         nJrkKJrmZ7tTafVeKzAGbg6ArnzcU3+zjKSOFsmhdb1AGU0ux8Z+yGIPw9x6dsx6e5TI
         aJRw==
X-Gm-Message-State: ANhLgQ0NpTeYp3enHhg5z1TA2Crxw591EWhzVgG3QoA5DW8mpWvQnpXp
        t1Zfc8k0ynFllUinwkOuMAF6wVpo4FBAvDC0vxOobg==
X-Google-Smtp-Source: ADFU+vsrY2h9eWO2RrILLXv3LgMODO5xOQkA7pw+YJNyEjo8ENEKgfJVKuZgee4wlNZbvBdRczOR5cilisGDjNot9rU=
X-Received: by 2002:a19:ac8:: with SMTP id 191mr8729171lfk.77.1585305667253;
 Fri, 27 Mar 2020 03:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200319122737.3063291-1-thierry.reding@gmail.com> <20200319122737.3063291-5-thierry.reding@gmail.com>
In-Reply-To: <20200319122737.3063291-5-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:40:56 +0100
Message-ID: <CACRpkdYfc3XHTdffbRWQmK9eOB=FtSX0iE59yFgdp=zRhWgtfw@mail.gmail.com>
Subject: Re: [PATCH 4/9] pinctrl: tegra: Fix whitespace issues for improved readability
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 19, 2020 at 1:27 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Fix a few whitespace inconsistencies to make the code easier to read.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied!

Yours,
Linus Walleij
