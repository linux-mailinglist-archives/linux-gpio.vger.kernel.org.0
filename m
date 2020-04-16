Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65EE21ABD5E
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 11:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504404AbgDPJyK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 05:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2504360AbgDPJyF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 05:54:05 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4741C061A10
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 02:54:04 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id j3so6670922ljg.8
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 02:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vmbTM85pXtLEnvZz1CqQLZJasM9rtSlADHL+rW8xlrw=;
        b=X0FwYuN8PxbnKfdFk1WRENwOJ5S/hI0XCnA9Oy2Lu3WB2kR3kCTK75cPlxqCiZPtnk
         pOJu6ikqPqEygo03Gt1k39EsS5FzXAJpr82cqxvwcBqyrH5vIHSvPQTUq42xRpUH2RUC
         YekYxdSDnrHHYqGcVZfUjFKNQlUTcNXbRacq63XWG8TuP24SpCcMEGzaPJrX5SzeGriR
         fHQz1tryaVkTKNDBK180Uj4sS488b35fMebmxJYsRTkxRqyP28iS4vxqvDNreb4pOdWx
         xCD4ThUu2HVHfLv1Aw6q0jX+0ZpybtQngclP5WG6YNMtX+c3Kf2NDLcVpB7qC6y4fPNU
         ATFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vmbTM85pXtLEnvZz1CqQLZJasM9rtSlADHL+rW8xlrw=;
        b=ZAgyFIxg54ea80h2bA5dcnwu+rh+9fjmrMxUzpjICP5cHQCjZcud62WxqK9bZCWpLX
         bM/auB7PZZKTV0mgk9qiRKpfdaFenro2E/l1s21TULfUQhkpSw+cpylBYrWTULyE4ziU
         2eAyWlpI4SjBkTcsiuXjd8Lwyhk7BJ+gvhS7VXwKP/iIDkVM/PbpLpZmAjEochCnifDN
         LKaX4ziiNpjns9wXn7CoPNNQBJKJYrQjLlWmd6eN8h9ilcp0wkOp0scLHXfI+0Vxpwsd
         N/imj8DtX6YJmS5TTVzbggYGWbHjzeaXCBr8kTUTYeLwzZyT9aAvb1fQIZBeD5E/bxg/
         86Ag==
X-Gm-Message-State: AGi0PuY9KiBHP7sUxOoGzQW2Nn+IQLUbyhr2xQqHPVHYUimluo/uUTAT
        v0CSrPzyIi6BVXgK/kKi4O01+4W6pIVaF+EUF84c/w==
X-Google-Smtp-Source: APiQypLayQLGT/Ao9sW1llsHHkRFIz0OeK7rOpmFlYZ4pDnuYKa6o7Y6T15Uy20O8h92MJhp/gGAXS8WRrqWYC06AGs=
X-Received: by 2002:a2e:9605:: with SMTP id v5mr5752886ljh.258.1587030843273;
 Thu, 16 Apr 2020 02:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200407154245.2548-1-brgl@bgdev.pl>
In-Reply-To: <20200407154245.2548-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 11:53:52 +0200
Message-ID: <CACRpkdYUdRn7=ASQ0xkZ06sAzt4umA_ajg=pbcT5Hm3Tt7JjFA@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: disable regmap locking
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 7, 2020 at 5:42 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This driver uses its own locking but regmap silently uses a mutex for
> all operations too. Add the option to disable locking to the regmap
> config struct.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please queued this in your next devel pull request for me, thanks!

Yours,
Linus Walleij
