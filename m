Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2AE722E319
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 00:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgGZW0I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Jul 2020 18:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgGZW0H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Jul 2020 18:26:07 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D9A6C0619D2
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 15:26:06 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id s9so7967170lfs.4
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 15:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qMFMrM2UwSVWXy6CzJpp3io1MmpiGTCiXGuEse1Q9zo=;
        b=BfsIjy2zGgd6JnwqvTKSwHZBBtZ+lhWEsYSPZ4mGodMqU6Ea5iZQnEZsjJkxO7VNsT
         3Lrqq13lymcjKcT95LEBq14pZymVhPOnNLGOF77kfsAZzqNkeQdcQyxoN16mBCOrIAYB
         tbfZQIA0d1cy123E9dY00rGnQlGrX61jJsuv7fHa905DBhyqvbQya3xQ7e7N9eANFnwg
         7dKVxYXoOwlkFRarrC3Zdh37wX/09fsJR7vtRd65kFaBVwzJvA75gLgrnvqaNX4ycldA
         0Kc9H8WziL7+SQU6GJNApsN3YjKsgREEjIfE1ciLzYTd2s+Q7ZfHk4Wy70vfSjgYjJiG
         5vQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qMFMrM2UwSVWXy6CzJpp3io1MmpiGTCiXGuEse1Q9zo=;
        b=tlm+4d6J5EF2q9z8OIEsn0vq2kp5dRcaFqQSC6u4SePN46YE8BENu1gs4LHjzxc483
         3Tfk8jhO3QfhfFq2XI27ggHHyV7NbwFPNSi2aETAZ7QOd3u4hNkOz6NF4YSrsQwJC75i
         y8Ehfl38bsvjv9J5djPCvPIcLrIUqi1RnjdRkKfFksv12iSQhRqgy0kMR2F9ulJTPipB
         MPpa9FjzC1/KZpJ/SZ6UkFPyr76gAHPqFnPDx1OBcC4rSV6/XeuQyoCwJeFF6LHZAP+O
         CzzA7WKJYx2CjUpEtpo/uz6xXQZ7sYzSvfZ78412uxs58DVXaD6+mk+6fGDQCylP7cQa
         RM6Q==
X-Gm-Message-State: AOAM533/i/qXkDr8aQZfBXv14F2I3h/1UdfxHSUsXKXfzV9IJRF6hyRK
        zGH3j64GKo7LlhdwIUetrqRakZv/BtCgBr2LTe/asQ==
X-Google-Smtp-Source: ABdhPJwW5NbSc6KuKvHaWtPma+94F1kxGGQAtBYJKM8GoaQ7ghPK5SJlPMpC6VPSg2BlMNOZ6SLAqFrNFYtNzsmLZfU=
X-Received: by 2002:ac2:5e26:: with SMTP id o6mr3044416lfg.194.1595802364522;
 Sun, 26 Jul 2020 15:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200725041955.9985-1-warthog618@gmail.com> <20200725041955.9985-4-warthog618@gmail.com>
In-Reply-To: <20200725041955.9985-4-warthog618@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Jul 2020 00:25:53 +0200
Message-ID: <CACRpkdZymmO9ku5OmCO74eiX3Y3jq_1g5De9Tx4hg3Lyrdt6bQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] gpiolib: make cdev a build option
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 25, 2020 at 6:21 AM Kent Gibson <warthog618@gmail.com> wrote:

> +config GPIO_CDEV
> +       bool "/dev/gpiochipN (character device interface)"
> +       default y

I don't want to make it too easy to do this, as I see it as a standard
kernel feature.

Can we add:

depends on EXPERT

as with other standard kernel features?

Yours,
Linus Walleij
