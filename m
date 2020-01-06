Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE1B7131C49
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 00:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgAFXXo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jan 2020 18:23:44 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45957 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgAFXXn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jan 2020 18:23:43 -0500
Received: by mail-lj1-f196.google.com with SMTP id j26so52676186ljc.12
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jan 2020 15:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qhJ+24IBi24nlgGtstXX5NhevFe6vDXs34NwEHIqIz0=;
        b=Jr3jPl3s0CPd6wYbJBof1LRJqW+jwATz758nMi+35XlVUIgvOwjtr8FmeB8ChHm42/
         UflKkYcCmX8tdiIuRRPvpj3l8JkdBV51Zfda78WRVBm6UITLT8lHvI+QDl+J1lhD45k4
         sPs3KIJOymMDy3H/jzL7H/T85GsKXh62iyKsmsDmMHq74lGVgsPpGqTRCiXsEuhP+M0N
         wmKHrl2A6ehFs+zBfqnmhxW/p3M23xx444GOybj5TisAPrmzaj8w56gmhv9B8i3sQALu
         Odk8toeruSoxPxTqhE+syy6i4YT47Pbhl0PlJhp2RI2QBFNMVEV3lSxRjL26lhuYFiW5
         meYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qhJ+24IBi24nlgGtstXX5NhevFe6vDXs34NwEHIqIz0=;
        b=oyB8TN6/s4pRokyoRtAHDi3qzOXo3NJyhNKJjnu4KC8e4qLfY9rXco71fooxsz6qFv
         nGO2BOoXFS5jn4oAe1/0hPGqw7iU7sbgdd86czFc/vWoeF7N9NLu80ofQwfLmVKh6cMe
         /cqqpPGgUNF+H3I1j0nEp1PkI1gemJ1DYTjIQoXoXYidSNQ9gzZ6dA2FkQ1Xi45i15Qf
         zx1AFZXgUZHfMV15bi27Nt3+YATOwVBpHSGddEPQQy+ec7S2NSHmbY/kgHHnG+CwFGK+
         gcNiTRzWhm4Hg3s4E8FAyVa0E9O6haq9tJt1uKKKGw0a4ANh3Rpw4viZKOuojJcmZlgD
         eM8w==
X-Gm-Message-State: APjAAAWWao7aNGM7h4IQcig2aD7z8Sn5uPnno3Z1AK+Ah8OU3RGtTZRY
        7gUmT5TCTQJI1ROtjthy8239OkEo/0tzzMW76AIphA==
X-Google-Smtp-Source: APXvYqycZb8cjnLDwPSz0i1nk9G4iL2BrQtb3oR/DugYo/t1RHrxJM+qPCQpQ0QuJ0yAKIBfPKYsilIvLFzwlFOoGQE=
X-Received: by 2002:a2e:844e:: with SMTP id u14mr62074208ljh.183.1578353021596;
 Mon, 06 Jan 2020 15:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20191218102013.2465038-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20191218102013.2465038-1-ben.dooks@codethink.co.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 00:23:30 +0100
Message-ID: <CACRpkdbK+Wq0qL4kKvaaiFvDmYxcx=UHsK3EK+cuhC17yH=Shw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: actions: remove duplicate dsi entry
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 18, 2019 at 11:20 AM Ben Dooks (Codethink)
<ben.dooks@codethink.co.uk> wrote:

> The dsi entry is defined identically twice, so remove
> the second one to remove the sparse warning:
>
> drivers/pinctrl/actions/pinctrl-s700.c:1581:10: warning: Initializer entry defined twice
> drivers/pinctrl/actions/pinctrl-s700.c:1586:10:   also defined here
>
> Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>

Patch applied.

Yours,
Linus Walleij
