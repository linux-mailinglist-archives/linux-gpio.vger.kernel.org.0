Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2CDDCC5B3
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 00:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbfJDWO2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 18:14:28 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33507 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730367AbfJDWO2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 18:14:28 -0400
Received: by mail-lf1-f67.google.com with SMTP id y127so5526471lfc.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 15:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S8mPVffMcLGte/wHbtTKmdFyoHNnsyDaHZetmGYETyI=;
        b=qbrJI1nS7K2Rd321FJnk6g/mCczAUiwrknzRclj4Ij1aTcpmviFEYrfD0bKA/tr6F+
         92kQ3oj4e6DANBZ1g4S+Z2SaNunY0/B0+WMh6sjxkeKvdI9ZL7BYHLqC+xf6ahRkbkHC
         Y4kOqhN6PadJfxjDZY2BVnZSbJ6q8Zk5/1eDJZ60H8AvaTlzhRXkd6WBMfkyCJIZCF4I
         sj0HLAoUoAmgwfy1odnZQalxEUZnfZUZotctVciJcG0IYdkDAAUUDVPPEA0+lVOqk08s
         nHpbsoTlSwvca3bjTfZox6FD74uthGrjxcHRB9+ACZ7D6Re8IuqZy0lyim9cAug6FoMg
         nZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S8mPVffMcLGte/wHbtTKmdFyoHNnsyDaHZetmGYETyI=;
        b=jTUPUedOhnXHrXBzNRh79bWcB7jJNJCn2Z1qJknVoF48xzFEGqbju4BXljpFwrKSp5
         W6mZ49XwDHgyQcXVg4BnIirhOFqgouQQUd9mV4LeS0RSDA5+yc09wXlIayWcvYXEyrsr
         GW+85erqqVTQftFyMELfK/Em4MhUf5Qou2265BIjrZgqZoHYQtS5AkDi5KtcwAxQOxq6
         oQwXLKrwHeJgubdQJVJdVpKcj9Y92+yn7qwW2dSkpD4hPsfbHDS3tDG1I26SBe1PbItd
         l2SkphM0fnT4w1fzg3YbGUiKAyJEE1j4oiTexQGqSBXBoS8yrFuq6Dm59IXVURbL2gNA
         cCqA==
X-Gm-Message-State: APjAAAUGfLcmHcCT1sZuBcmEVAXnZxdp1MQAlS+avQYW7Bue+ZxKwbV7
        x8qRnZPwO5hHs2oH2lq2wbd2uur/zjRDU2m4BUG0bg==
X-Google-Smtp-Source: APXvYqw6p3u0Nbk4EtKVZWVGxvJpwkNNralIapsPdyvTLc9k8feinsifqMxclwSQkxsfBTi9SQax5JQ1oEWvQP3L9ng=
X-Received: by 2002:a19:14f:: with SMTP id 76mr9883809lfb.92.1570227265893;
 Fri, 04 Oct 2019 15:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190926081426.GB2332@mwanda>
In-Reply-To: <20190926081426.GB2332@mwanda>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Oct 2019 00:14:14 +0200
Message-ID: <CACRpkdY6f5MX16cJL--D3O=_4us=vXEF6vWfRpd+ju8T_JsE0Q@mail.gmail.com>
Subject: Re: [PATCH] ns2: Fix off by one bugs in ns2_pinmux_enable()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Ray Jui <rjui@broadcom.com>,
        Yendapally Reddy Dhananjaya Reddy 
        <yendapally.reddy@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 26, 2019 at 10:14 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The pinctrl->functions[] array has pinctrl->num_functions elements and
> the pinctrl->groups[] array is the same way.  These are set in
> ns2_pinmux_probe().  So the > comparisons should be >= so that we don't
> read one element beyond the end of the array.
>
> Fixes: b5aa1006e4a9 ("pinctrl: ns2: add pinmux driver support for Broadcom NS2 SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Scott's ACK.

Yours,
Linus Walleij
