Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6165432378
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jun 2019 15:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfFBNwE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 2 Jun 2019 09:52:04 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33156 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfFBNwE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Jun 2019 09:52:04 -0400
Received: by mail-lj1-f195.google.com with SMTP id v29so2479005ljv.0
        for <linux-gpio@vger.kernel.org>; Sun, 02 Jun 2019 06:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lyUfE3HCHLjRLM9DWWhuPKiM2Ja5HdTmrq6DTMOqX24=;
        b=AuX28I3gLoY3HNsk9MDit29U1RHHQRLNbEbs1tCyXwUdFYbqEisfJP3M0rn50oamli
         LC8BqZJtcx4p0A8bQhvVh7sxBkAhj0vAbSDib/pMgadAQyjkxBEy9mjqP76qBIF23LT9
         0l5VQMVoU5RLSOx6kzEV/CHwz5XF0jMcAC0U3/igFSjz6zz9rULkKj4RWPwyyyEC9f93
         +uyY1oneLUtLHN4Falovg0gzgYaohlJQ9qmqg1kusjRM7d1i1CrI+WfmKPWZXzxqF+GT
         xnsaECCFiRygX6qqR2l8edgMMe52xvHUnBYI44xgiT6xs506QPZ/SLofO8ZANgY5QrZl
         3sCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lyUfE3HCHLjRLM9DWWhuPKiM2Ja5HdTmrq6DTMOqX24=;
        b=H9WvxR/mRbcIiJRTXCSd3HIndyPznkafhK5QDVnp2dDq535lQlJ0JOaD2Z0GHy77rE
         xeFZPY7irR4FV+ciJIBVk5YFAWqN0v5pG8+uvuPhdr6ABnqqTaZCPeozanSfGPQdZCF9
         J7aGTodnsZn8diy7ufBx+KvJ5k5Gjmf5+LBOEeq/sd0fnGKcn7tCBytO2503DfjJjx/U
         W76UHK/0e3JMyzDXr1btVpJzs0U6OCn8AF2vaM49NaM/M9u7uma+5rY6LVPaDB5gosfu
         lW7NxIxfoCyjZWBt8m0KhJLE0OhFjA+KvBEVKUUURmeJvt+B1b1CbHr0biTsQBECiri5
         yeRQ==
X-Gm-Message-State: APjAAAXjIROayaS8JAZDihNSAxQK6u2Si7ZGO/fHB9GD8YciraDSBmHv
        Byj6Rzjoy7o1wJ23h8YOmIxwMUMUHC+QTjRXbKWjUQ==
X-Google-Smtp-Source: APXvYqw5tUx0mApKIJz+uww1Fj65ofep3jdE+mGrPIXd9bph8EemlhvdawhPNIs/inbQgkjnl+p0SCvle2OkoAaZgNs=
X-Received: by 2002:a2e:984a:: with SMTP id e10mr3538422ljj.113.1559483522555;
 Sun, 02 Jun 2019 06:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190529145322.20630-1-thierry.reding@gmail.com> <20190529145322.20630-2-thierry.reding@gmail.com>
In-Reply-To: <20190529145322.20630-2-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 2 Jun 2019 15:51:51 +0200
Message-ID: <CACRpkda_aK++k0eVHmGszgts86usaxbQ9uU0kqAzAjapK8AOQg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: Add support for hierarchical IRQ domains
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 29, 2019 at 4:53 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Hierarchical IRQ domains can be used to stack different IRQ controllers
> on top of each other. One specific use-case where this can be useful is
> if a power management controller has top-level controls for wakeup
> interrupts. In such cases, the power management controller can be a
> parent to other interrupt controllers and program additional registers
> when an IRQ has its wake capability enabled or disabled.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - use irq_create_fwspec_mapping() instead of irq_domain_alloc_irqs()
> - add missing kerneldoc for new parent_domain field
> - keep IRQ_DOMAIN dependency for clarity

Actually I applied the patch, and dropped the two lines making
it possible to override .to_irq() for now, so I can illustrate my
idea on top. If I manage.

Yours,
Linus Walleij
