Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A35142FEB68
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 14:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731788AbhAUNSJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 08:18:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731775AbhAUNSE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 08:18:04 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F7FEC061575
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 05:17:23 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id e7so2397726ljg.10
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 05:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+EUNlXiP3wPkeG2dM3xY7LcMnWvipCnmto2zGrqh7Jk=;
        b=KEva3QoW/Q0vHGdHixNo5Rdkh4xSw/ZpKYkTdQZ8zWZ3sDO7ID9xpq4fAiQc3T4VUD
         EKcMCiu+pcvzo/pO/QtD7S2Sv81h+HvDzjudLfYlVkrpQerD0cSkNtFZ2UMpmsOrNffU
         g0dnxDWdWLE9H73X50SdTv+oQvnxUHgGhfzE5jxqbMzcQeBSYSEYpRzhNgkFDYh1IAqB
         E+l5OTOEvqOdnUxIoxPzxPbch7FG3L+vPTw4ppCBbe/PPxSQCvjoo4NzMq6wLh/ujzR3
         uetqT2knUoZbAgplSwkiItllE0UZj9ZNX/L44jv6P1ADdK/aILNe7nf1DYAYBqeWD/1m
         FcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+EUNlXiP3wPkeG2dM3xY7LcMnWvipCnmto2zGrqh7Jk=;
        b=IHtn8cEyU0Pe+7caYA/oOy0lwKvF7surhFqILKJteuiSqxvsq5JvQLxBAFlx94eRHu
         ddSxtVOjzv+CQDEyTklD+Yqf0HxZ7CBLUlgbw1Qid74gZBZ5c6dTnBB4YBjP7qL6ltKd
         axjF+ic0H7+xXl/8B+YYFmTQTMvPJnGspdmLN/drS36YS8GcyceANVhOrOS7BiIVz7pN
         XucgM0RRWV3ozdHm0JRXOROKBCi2ueh3+AICd1lsHacKwVdsymnpu8faazYvPz1iECHY
         h3/51NN4x8GvkBjDqt56urv2ZS6SkvcgvPHbZTU6V82MVGjqOyFrSFVr7cKZ4QYNyj/f
         vDaw==
X-Gm-Message-State: AOAM531r7Kb+ISxthXM9KrSFeX57u4sUeXUyAE8kFE7BO0NdjjcEToVJ
        QjO4DH307s+SVVXuhVmKJCdsUd3a6OYPxqN/H5jhVQ==
X-Google-Smtp-Source: ABdhPJw0ChpK+IYPDYHhBNNZozKDGiIjheqwdhKqWnVzTDU63Tb6oYv4fyLX5YjScnuMnbv8maAjgdeOhKz/6e0GUvE=
X-Received: by 2002:a2e:b047:: with SMTP id d7mr6660709ljl.467.1611235042154;
 Thu, 21 Jan 2021 05:17:22 -0800 (PST)
MIME-Version: 1.0
References: <20210120214547.89770-1-andriy.shevchenko@linux.intel.com> <20210120214547.89770-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210120214547.89770-4-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Jan 2021 14:17:11 +0100
Message-ID: <CACRpkdZttmFc2oMJECGDWP3DMRVWsdq5V6bKprX+dymRfEgopw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] gpio: aggregator: Replace isrange() by using get_options()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 20, 2021 at 10:45 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> We already have a nice helper called get_options() which can be used
> to validate the input format. Replace isrange() by using it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This is really neat.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
