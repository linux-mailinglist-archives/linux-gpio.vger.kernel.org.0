Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C83A44757
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2019 18:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729867AbfFMQ7F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jun 2019 12:59:05 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43555 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729858AbfFMAkE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 20:40:04 -0400
Received: by mail-lj1-f196.google.com with SMTP id 16so16739417ljv.10
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 17:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+BgRm8z+fuFOYDnZHzzS3mkZjHYVE5tepOZGIldQ/Uw=;
        b=Ypcnb57arGPy8htVQZvJkU6HDA/u3lSRi/yBbQIfuYWTEocd6WnL/Atu/ShME/mGGi
         m8dAhYtJLFVK0bqModWdRZ8ddgNzueCHdVNU6HOQsWdWc9APhjQU6LK3Rnf1BuBF3SU9
         2sxywfKtxFhwgtKH2Va8t7qZigdDiszn0kkuOthvzxOt1r9hTLtapNI5MX/p3KRgcVn2
         tYQXQpopKGE1vAwEQBtoAyOSNLumds6hE2KFUm6Y0o4R6cOdlLkfRPhB3F4mE0t3IFsQ
         kzkz/ykF/EppIeuyJl6tvaf0G4fQb5vQqba41XFRuTLVnRn28JGCueUwUnlNFIfkGDuF
         nFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+BgRm8z+fuFOYDnZHzzS3mkZjHYVE5tepOZGIldQ/Uw=;
        b=PFKLyQZACvMaN0rMSqQ3+uyz0I6MSnz8uH3ve11wOShPHKx5vx62D1mGW+qQCPdQ3T
         0LC79FkHWIQEuCLebWH7TD/DAAJ7bBPpRolTAu2z5nPFNFuKywBfAU/KydmknrOlFNMM
         +SFf/6Ob6L3VmTE8g5S4r267Ub6vz7/YzGH92UC5k0LJbg5k/K+LDZ4Bw3ohL/9QTgmx
         WrLg8r912cs41/R3BcXYiV8rrjRwPUfF4PA6Xr8ZbGY5LAdJouoypiuhd1WMceOwe+EF
         fJvqbNvCok/rRxm7gWcKF/Y/VYSroMpyJr2I0KdwPypLLamHU528NUW2Y9CPWratqEfC
         mw8g==
X-Gm-Message-State: APjAAAXYIVqPiRnm4+EpIuN76FCX3BFWV8ybRwDeN2YlHE8FGQu2sEOY
        2DRTWiTlGXV+CbMJCZ5e4CgNphaFs7CiSFAZw3lleA==
X-Google-Smtp-Source: APXvYqzLD0XU1anFNgzmQs/wupNY81zHREHeBVBg8Xkp+UQ+ikLxAqzOQqiH6vXp4DcOLwy5d/fNPl7wvagx1n+NZgk=
X-Received: by 2002:a2e:2f12:: with SMTP id v18mr44314153ljv.196.1560386401982;
 Wed, 12 Jun 2019 17:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <1560376776-21994-1-git-send-email-info@metux.net>
In-Reply-To: <1560376776-21994-1-git-send-email-info@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 13 Jun 2019 02:39:50 +0200
Message-ID: <CACRpkdbBcbOmwu6=fB0TkSU-p_-mRRRLpeE3nFAgvSD4Z75DOA@mail.gmail.com>
Subject: Re: [PATCH] include: linux: gpio: fix build warnings on undefined
 struct pinctrl_dev
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 13, 2019 at 12:04 AM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> From: Enrico Weigelt <info@metux.net>
>
> This fixes the warnings:
>
> * include/linux/gpio.h:254:11: warning: 'struct pinctrl_dev' declared
>   inside parameter list will not be visible outside of this definition
>   or declaration
> * include/linux/gpio/driver.h:602:11: warning: 'struct pinctrl_dev'
>   declared inside parameter list will not be visible outside of this
>   definition or declaration
>
> Signed-off-by: Enrico Weigelt <info@metux.net>

Patch applied, also reported by the build robot.

Thanks,
Linus Walleij
