Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB2E3B73F
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 16:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403865AbfFJOZF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 10:25:05 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:33118 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403856AbfFJOZF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 10:25:05 -0400
Received: by mail-qk1-f196.google.com with SMTP id r6so5642449qkc.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2019 07:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AxTmTaTGovdwJKYxPDbL1EHD+aiuBq1QqWwWhlFLw7k=;
        b=eX0ysJUZo0vOp40lQ6sd2i9rIWMxEF1pJ+MZCrjdGJMPDEChOT3O5zFKqRs60kPwSt
         VfRb2qLf+rWpZkxDFUp5yISPz01Du6omZOCeK4taggYvyAQkpKYagYnbHdzp7lC3R78B
         TSISLGOr2yErIpapv32j5bFtR1tTiSH0sDkjTJdZ35k/gOgFoz9AjyeT9DhmKA4x9iR0
         cIrQmOX0DllA8ILu7shQk7kwzLBtPA8hGvKR2QngsMLbdC1pLMX5PfNa++ccQEb5pX2G
         74FQhgutQLzyHSLImrv3B6g0s5msxHGHMMfJWqVOOi08z32WouD18r9mYVfkZnaqH2SN
         BK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AxTmTaTGovdwJKYxPDbL1EHD+aiuBq1QqWwWhlFLw7k=;
        b=n93zzu049t/6+rAf24gA5i0DeSQWl/IlZfLTOYwofG3jo6RMe7X0a7+3V1Na6mvwaF
         muNq44PIKlJyKV/xlCpUx+8xFtV9XNHJt7MqQc518QJg79zunSkQQURtWWRSIP58AExH
         WBQrTTbf2ww17DbqXlbFH73mGP0zDorInkahIfZKCtrwZk0N0jyz0vQrJEPSISR4Gms+
         33sqFuPGeyd1BB0BhQ8HJJyiPr1NhwfuDJpTxO5K5TdkivRx2wYgrUn4nvw5m4lzrT8E
         Z03cvzJGB2UT3cT6bnkiypnFafUnX6dtf5BxXtHGnGYSC7wXMweuML4eH0aPTdFrk00r
         9S0A==
X-Gm-Message-State: APjAAAUkDLgCujmwKhCtsUYKN2YKGbdZ3pfgGuNgKdzzKrv4amcD8tbO
        GKQ//mIT14Mgjt51hUHBgj+YbF+TUe7yaNLFNJ4eew==
X-Google-Smtp-Source: APXvYqzr68PG6EYbXa+8wsFv5OiYcjlbWhv2n2YugxrUYAMID8v5lALEMXfpkzEJtVO3RcgMahyWSw7mrK3qlvEOvFQ=
X-Received: by 2002:a05:620a:1407:: with SMTP id d7mr44558379qkj.20.1560176704327;
 Mon, 10 Jun 2019 07:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <1560160211-12748-1-git-send-email-preid@electromag.com.au>
In-Reply-To: <1560160211-12748-1-git-send-email-preid@electromag.com.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 10 Jun 2019 16:24:58 +0200
Message-ID: <CACRpkdYj4E37VnCmzAeG95PfZrUKThQDJFoWCoD4kHKwfE0SMw@mail.gmail.com>
Subject: Re: [PATCH 1/1] gpio: altera: Allocate irq_chip dynamically
To:     Phil Reid <preid@electromag.com.au>
Cc:     Tien Hock Loh <thloh@altera.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 10, 2019 at 11:50 AM Phil Reid <preid@electromag.com.au> wrote:

> Keeping the irq_chip definition static shares it with multiple instances
> of the altera gpiochip in the system. This is bad and now we get this
> warning from gpiolib core:
>
> "detected irqchip that is shared with multiple gpiochips: please fix the
> driver."
>
> Hence, move the irq_chip definition from being driver static into the
> struct altera_gpio_chips. So a unique irq_chip is used for each gpiochip
> instance.
>
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Patch applied.

Yours,
Linus Walleij
