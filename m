Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3164E1918
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 13:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390540AbfJWLcf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 07:32:35 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:41483 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390231AbfJWLce (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 07:32:34 -0400
Received: by mail-vs1-f51.google.com with SMTP id l2so13516219vsr.8
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2019 04:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PS8R7qGKuteB6KtL74HzxH22R0/1MHFrnB3GrMJBWI8=;
        b=HSrkBL39PjXqgxfuEX4wYOZFexJlfiGvAOrlkt3/BsVMJN9KgZ8iawdVwEYu9n3D6W
         nDGVbLtYNaIuByXNlfMS1hNj7m27OZBQl5GgEgoVaPgg86k5haFuT1MqQ21cgcU8Cm68
         ggXmXVm4eAEzdaDpWRnKHVkLrFFfwqu6Ts2TZVwLv8jyRoxijuj7lOxA7tVBqVAANktl
         L/4QIhg44RVphrDruGDbm7DVPqFEKyGRhF+oMGuRM21GzK1j3EdUtXBDeoEFWH4Zwg0A
         ZzG9XxNAPy1dgOZpPAgD+Akfm+2Nyji3vvNo2PBfXhFQbOWjvQrvz/YdFwTFFU4vVle8
         fFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PS8R7qGKuteB6KtL74HzxH22R0/1MHFrnB3GrMJBWI8=;
        b=nt13ndgE9qeTqP+bqgGj8aWzIJGUUll+3rJmbDHzxO9C/EP0gZXcxPnIaTdv0LpxSv
         Doyxfn4khvMVm+d7nHrnmMGxn4+J7modcG3vxzBtBv/FoBBaBd8dw3ARNsJWSumBujOc
         Nh3PS1lx4rp0TCoa9dsXHQWB8NrVZW9wp3wlCT0HYd4RT5TJbSBFlmcuQHljTB0EX+Pd
         VOhcjq3kC6BfGLLT+dJD2+YJPBxjINKpLaq1HusEcrp1414/ZNZVk4ytJ/OhC949fAOS
         4bbVGvhng584oGcCXz8sABdoUh0mpMRNlNh+A1IkvOE0x2jU7cC4IemvR26lMxs78lcZ
         S6bA==
X-Gm-Message-State: APjAAAVU+QJ8jR/ePLZsyo82jWQFskEwUyShS/IjsmNCbzrohdVcYv04
        pu6+PlBEgwpzG5PA3NbcTx319aKYqXfkJg0iWdyH4Q==
X-Google-Smtp-Source: APXvYqzNIxvtyngRlzRYhR9JfECzgGRPaLlicZoevZjp/5m4+ln6zT+X6gmr9fxHrttUQtoTaf1opGvcgueOIU4Kt2k=
X-Received: by 2002:a67:7944:: with SMTP id u65mr5316865vsc.10.1571830353370;
 Wed, 23 Oct 2019 04:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191022131531.16339-1-brgl@bgdev.pl>
In-Reply-To: <20191022131531.16339-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 23 Oct 2019 13:32:22 +0200
Message-ID: <CACRpkdYpwMtmnotGA9JyMRanhPCwuk5ORB=3cqCTs4GbqsqGqg@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.5 - part 1
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 22, 2019 at 3:15 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> here is the first batch of changes for v5.5 gather since the merge window.
(...)
> for you to fetch changes up to 228fc01040704f55fd884ab41daf3eafd2644b54:
>   gpio: of: don't warn if ignored GPIO flag matches the behavior (2019-10-18 14:24:17 +0200)

Pulled into my "devel" branch, thanks a lot!

Yours,
Linus Walleij
