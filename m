Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB415DFBC
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 10:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbfGCI0p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 04:26:45 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39621 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbfGCI0p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 04:26:45 -0400
Received: by mail-lf1-f68.google.com with SMTP id p24so1123203lfo.6
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2019 01:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oH+9JEmEdviHn94a7cG/CrP0XnCuvPvdHugovk+1QmU=;
        b=Yr0j9Ul0MKP0dkHoy9so7SqHZjz9YPD/8RtaQYq/QS7hJpMV/YgCE0T28eXT7jCvlS
         yQmRZqNvwMQEyd90J4bhV4PHy5Gm9rZDQYOpw2HFGrqYnG13mxGub7/M3rR+pIskS9RH
         1ZhsY0q7Hm/aXru8eSnmkm75xGDWYmso+K5aSBOYCjI/wj4NuxVFuJ9B+ojMYRnIcO8d
         ix3snxZ0ZJj71x7B6n368jZ9X6YaizA+Ee6+uCLuReo2lBUjxx1g9henIp9r5WGP0WwN
         b1C0fz0nbOuKbXmvt7NjhZPWDwy5iWE/yLpyxrSwtom7abqcgKnr4Xu5GbBkbajHu7wK
         5jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oH+9JEmEdviHn94a7cG/CrP0XnCuvPvdHugovk+1QmU=;
        b=EG0XVokGXN6bcDfPJos6XrdH4CipJPh+ARwiA5BnaF3A1kz8xJ3g+/krxki/LF8BQi
         mfxdo7TjeXrJC9cNNtCM8c+48Jm6uGh4irW09bKfyrpEEgyp4DG7uOj3baBsp/tkLhyd
         ivrKjYG09NSotnGvXzNmJExRzJZ1cnyQBtynrSHLLqltQ/dmkreBKBxZf2ZddB7UnZPL
         X7AqlRunJZlVGNmtx3BWR8vlfa8WXEuSqSwV/avL8m7JmGI4vRAZlXOqe7PkavdJReeg
         Z+YagVu0BiLRaB4xuSWHQp9DnUXQ5Vd1XQTfl0OoMJFo92sDV4rP4jxLLI+rOE7W8JwS
         8+PA==
X-Gm-Message-State: APjAAAVY7ucKOL1vPw9OfoUIn4xJNrVrYXJLYX1MY5gX0OlEqnI4qLA1
        x4ZrHPhVQEIuqx7l3w/ivxi1QA/oFgSaAhHz/W9Djg==
X-Google-Smtp-Source: APXvYqymr6EoLSqXvq3rkC3hBxhdSlL8Q76rBENOFxvbDxQXxxcFrCLNfqvoaHdBizGqM1M/jk306H+kUmo4riz9AkI=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr16672551lfh.92.1562142403839;
 Wed, 03 Jul 2019 01:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <1561472086-23360-1-git-send-email-neeraju@codeaurora.org>
In-Reply-To: <1561472086-23360-1-git-send-email-neeraju@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Jul 2019 10:26:32 +0200
Message-ID: <CACRpkdbfTTnEbCM4R_F_KYN9ys=VwCLQ5d1cYsx9LQOyTd5dwA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: qcom: Add irq_enable callback for msm gpio
To:     Neeraj Upadhyay <neeraju@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Timur Tabi <timur@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Srinivas Ramana <sramana@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 25, 2019 at 4:14 PM Neeraj Upadhyay <neeraju@codeaurora.org> wrote:

> From: Srinivas Ramana <sramana@codeaurora.org>
>
> Introduce the irq_enable callback which will be same as irq_unmask
> except that it will also clear the status bit before unmask.
>
> This will help in clearing any erroneous interrupts that would
> have got latched when the interrupt is not in use.
>
> There may be devices like UART which can use the same gpio line
> for data rx as well as a wakeup gpio when in suspend. The data that
> was flowing on the line may latch the interrupt and when we enable
> the interrupt before going to suspend, this would trigger the
> unexpected interrupt. This change helps clearing the interrupt
> so that these unexpected interrupts gets cleared.
>
> Signed-off-by: Srinivas Ramana <sramana@codeaurora.org>
> Signed-off-by: Neeraj Upadhyay <neeraju@codeaurora.org>
> ---
>
> Changes since v2:
> - Renamed function to msm_gpio_irq_clear_unmask()

Patch applied, unless Bjorn complains!

Yours,
Linus Walleij
