Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9E0A1ABF05
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 13:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633028AbgDPLW7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 07:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2632869AbgDPLWk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 07:22:40 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA649C061A0F
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:22:35 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h25so7359637lja.10
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jD1AYUXHP206GaKlRMZxnMBYwEQ2X8qjzb2HhhYNTqs=;
        b=x62ukxN+n8Qv4MX7jge+8oGRbA3SvBvHRYMCTqRMEuaWVF6QRNsqmoyaKT+erSHjEu
         WGs1fbbXWGTXJL+8ty/h9eYpXqPQWIccl9mnEQm8XIuWWTjvCCpW72h11tVxEcl6jP+g
         DCVBQkchGYN4GcZ1WL4GIh+YETEdlWFKXWBqdrAifVm13YxGFqYQkpby/YG2wSzDT1uT
         wOm6OE/3tA94BoxRfcxXEdoV+65rjYAGVRqAKedDvU16egHhvynyRhMihZiPqBmuy74W
         zjZ4kxB5uzRngQOICftxq7vejQXlduE8xLp5QyHJEuPPv6h4rioZlg/cfqkTJV0Z+e/u
         mXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jD1AYUXHP206GaKlRMZxnMBYwEQ2X8qjzb2HhhYNTqs=;
        b=uDm8TEAcoMw0h+zdZqozvDTXeLoXAZN3EG07RS/N1jmrmTb8Tn/dpTnssrxPuIC/ST
         LTM7b/x4Ooakm6AtQgBNBtIykau8iHYTPqqCC6wuNsVtiz9u6EZEqKXs/KbcqW5W8TWa
         H+9HX7PzelrEA3knz0B797Xhr+r8IdqGo/mN8GTK9sy/mcGFmP+QSsCTq9XqOPklh8tq
         TFx3AMSbbpR+lJiEAVfP3q/QjTiNWkZOkd4mNjVJ1RalfEJ7jOyzuand5Wz7hGG3kwAo
         7bybKF0PtvOSeVN11DHvtXhNGVmcrCVTmwrUm6KJuJNttumEtN/T/jIo82qJiNexglcE
         0blA==
X-Gm-Message-State: AGi0PuY0FahtcwLOdLIZntwZ/5eCbPKLjeIRD+A85vl/L6ylzn2r/bjh
        ddFi8ChVgvdhNgHJZ8kOAxLEtdeNkxsfngm7kyywsQ==
X-Google-Smtp-Source: APiQypIpKnyMQdCPwOkrU4XHmJGqGQzCTuqSu9dtAHs40Ji7eqg7X+BO8MRm5FUsUlc9uL65iAVZwfc0K19OPhETeAY=
X-Received: by 2002:a2e:9ad9:: with SMTP id p25mr6305274ljj.39.1587036154321;
 Thu, 16 Apr 2020 04:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200414152843.32129-1-pthomas8589@gmail.com>
In-Reply-To: <20200414152843.32129-1-pthomas8589@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 13:22:23 +0200
Message-ID: <CACRpkdaPc-rxNmdq7KFKZ-Qi7Tqy2RJ5Lkcv-8bTAh0GX7VygQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: gpio-pca953x, Add get_multiple function
To:     Paul Thomas <pthomas8589@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 14, 2020 at 5:30 PM Paul Thomas <pthomas8589@gmail.com> wrote:

> Implement a get_multiple function for gpio-pca953x. If a driver
> leaves get_multiple unimplemented then gpio_chip_get_multiple()
> in gpiolib.c takes care of it by calling chip->get() as needed.
> For i2c chips this is very inefficient. For example if you do an
> 8-bit read then instead of a single i2c transaction there are
> 8 transactions reading the same byte!
>
> This has been tested with max7312 chips on a 5.2 kernel.
>
> Signed-off-by: Paul Thomas <pthomas8589@gmail.com>
> ---
>  changes from v1: rebased to 5.7-rc1

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Since I know Bartosz is queueing other patches for this driver I
let him pick it up.

Yours,
Linus Walleij
