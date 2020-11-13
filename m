Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB842B17B5
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Nov 2020 10:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726237AbgKMJAm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Nov 2020 04:00:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbgKMJAk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Nov 2020 04:00:40 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D68CC0613D6
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2020 01:00:39 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id i19so12220091ejx.9
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2020 01:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=excD4cp3O4ACeckeKCo0xXDfnsFfAYE0sjV9B/u/mho=;
        b=yg7i0U8I0QbLXjYORw9rlpXwOpm5e9gz9XZZrRF4p45pBrnpsZVb57vvYOdXWQnsE/
         qtckK2EG+JqNE/NNddiMoskNTzDmb39a7UA3db8PoMVqGqJe3PzlreMzHYQwilhjJ2eD
         UVCvGZcvLczczyfRrAAeeyad4UW06nMtze1W/kRolre/cNJy3bEv0vkSBFqF9A9gEfV8
         iz3wNZRD7jMKW74gaLDLFGr4kNjzo4fr0a4Umw8UU6n3mlHcqPJa9uR6c3IQHCYSczUK
         x/gO5wqG3zw6HUWzVEQxSHQYQeHAPUwVQLs0QtacIc1bSSq70iPQlriH+qSixA+oXbmk
         hCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=excD4cp3O4ACeckeKCo0xXDfnsFfAYE0sjV9B/u/mho=;
        b=JYq9/S6CfcfoZnM08OhxvS8CufTOIL2ObHa90tla7zggVoMgtFVe6lXefJW9kLBG7H
         uY05yLY+nk0GU5gz+sXvXoGjATzf/g7ZFg4Sp8UR3LXqAB4S0h80rIGGvDho8qy9vLlN
         1y2Roc6bqkge1tTEFl1qCrzZzHx4RfkF7xe+THS/toxAkh2R8XZcbhliZyMsGppTbZ2E
         4O8mopuOODjDJr9NMqZdBunwK6G2XuGypuR3/YGXyC4BZRzYsmjvmxQ1qLuREQx1wWeE
         7A1HOgW9e6VUUYUaHgrTClluIyMWVYzqJosX04D03D8Aq+54qB7vtpxcIYMrMfDx7c0R
         N5Bg==
X-Gm-Message-State: AOAM533zA4SomU9ygIMYDjDuFzSBG1JIDgkgSs+B8W10UIBweHOj3uLN
        wsHfWE5flzoHLiHNu1JrNJbsU4AhBS4ib0kzwM32qA==
X-Google-Smtp-Source: ABdhPJzLjkClTJB/MB9vkSlquLDXsB1sQDBPgaHx9ehM6qKyouTSRmGGqwJfA19Yb5DirukswltpZ+iD+NjKGC8Oi8s=
X-Received: by 2002:a17:907:420d:: with SMTP id oh21mr966361ejb.429.1605258038318;
 Fri, 13 Nov 2020 01:00:38 -0800 (PST)
MIME-Version: 1.0
References: <20201113023355.43406-1-greentime.hu@sifive.com>
In-Reply-To: <20201113023355.43406-1-greentime.hu@sifive.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 13 Nov 2020 10:00:27 +0100
Message-ID: <CAMpxmJVZ8OHnGrkC_5TZdZUg004p1=90KqOxpOTgi4036BGWfQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: sifive: To get gpio irq offset from device tree data
To:     Greentime Hu <greentime.hu@sifive.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Yash Shah <yash.shah@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 13, 2020 at 3:34 AM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> We can get hwirq number of the gpio by its irq_data->hwirq so that we don't
> need to add more macros for different platforms. This patch is tested in
> SiFive Unleashed board and SiFive Unmatched board.
>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---

Please list the changes between versions of patches. What has changed since v2?

Bartosz
