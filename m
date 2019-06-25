Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCB0752809
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 11:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728044AbfFYJ04 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 05:26:56 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44901 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727233AbfFYJ04 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 05:26:56 -0400
Received: by mail-lj1-f194.google.com with SMTP id k18so15503754ljc.11
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 02:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4byL4wDiJYUKGPsHIZukI0edtzf1YSHKKJDe0YzOyvY=;
        b=O8q/tqOzSaf5wWt4sZORR/syqCreYpV4kYX98Cg3ijrUnSj0+jd2AOO3VRpqEG+kca
         dYBp9rZ9EnhVyfMuC5uMldims3Tw+GLc8400JOHb7hs8ohUrWiUVjZE29nzdE+Lly8Qr
         qCj00QXx+m/mHsiRBhZcgVRcdzcbnkxnYY5qVNkQ9SKfV6G2ydyR7brU4fsIkItfeRZh
         wjcB1dlth1P4yDJrAp6Dj3xwGWeJiz2eZa/Ecy2QVLLHMKUUZWk19Tz7+A88MAtvWPmU
         GA6xj1IVPfW2kp1jEgEcumXmu9VprQchpHLHyIRGzS2/967y2JVmW91i9L7U8eYJAHax
         7Gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4byL4wDiJYUKGPsHIZukI0edtzf1YSHKKJDe0YzOyvY=;
        b=C1GJVkQQJtc8syyu4SgfV0HxgRObape16LBgs1pU1dbGjSTgLOabCVt1CHsFTchJeY
         qmxHzb4CqGLNJipVe50H7bystbK3ZZZG8BxGDLRkjymd2UIZxkQOlOt1G1ELeEXfVJ9V
         45CKoEiwPvahoYNxAeJOdWUIBgVwk+iOs/i7bG1IQsn3aA/VSWW0BeCn4PCRYJp5iukk
         4GZpuWy/FZU6409iI81oeWb+mZfJWoirNWPXyE5COTc+0khBVagrZXK57wMErp3+vuXV
         8gQwfYBDu+YEbe4OrTpbty+N40CtJy17wTwuWNkG/Tn1aq86BfkzcBT3UNrVCeKii+5i
         si/Q==
X-Gm-Message-State: APjAAAVHrLaUwJYkiSq7QWdcQv4PF50z0E5PhUXBS+Rntin9+gBU/Hpp
        Ps4z85nv6wldyExAefC85DpavXLkx/mHaBjumfnhEQ==
X-Google-Smtp-Source: APXvYqzkx4OUewbxjhEdKUJvKf80Xc7mbiFbc7xrmGGm/hSU4bs7UGDZ7qeK1y7PT91tXdIs7xMyZrfBkdJz5us3gbk=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr61005450ljg.62.1561454814184;
 Tue, 25 Jun 2019 02:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <1561354834-22617-1-git-send-email-info@metux.net> <1561354834-22617-2-git-send-email-info@metux.net>
In-Reply-To: <1561354834-22617-2-git-send-email-info@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 11:26:42 +0200
Message-ID: <CACRpkdbZ68O41dx7uCccUF_jvmC3_YVvWEEo9igknMC95QEXhQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] siox: add helper macro to simplify driver registration
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        t.scherer@eckelmann.de
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 24, 2019 at 7:40 AM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> From: Enrico Weigelt <info@metux.net>
>
> Add more helper macros for trivial driver init cases, similar to the
> already existing module_platform_driver() or module_i2c_driver().
>
> This helps to reduce driver init boilerplate.
>
> Signed-off-by: Enrico Weigelt <info@metux.net>

Patch applied with Uwe's ACK.

Yours,
Linus Walleij
