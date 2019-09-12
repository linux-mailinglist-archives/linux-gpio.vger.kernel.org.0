Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 665A8B0BDC
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 11:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730580AbfILJs1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 05:48:27 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35383 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730428AbfILJs1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 05:48:27 -0400
Received: by mail-lj1-f195.google.com with SMTP id q22so18376718ljj.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 02:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QoRwKJLy1W+DikJJA6B41nB3PjcCPvyIBPkBfcJxCzc=;
        b=Cuznd0rhs+2Bpf+Ce8uvvn6W7g0tHuGdVqDz+M6rezPQ314uz2L4zC8C2v6ZvxBVuS
         m1zh7rqvNS+6AoWnyITeGINQBJ2IHGD8kfBv7/MvEjrl8K3nZUVhtr1m4jyBXvzreg/L
         PtX04qaB/9HYJyQeHEP2hgzInI+d78uoYKQrA//ysTkk0zZQmGPEE/flX5MrkLwxDDt8
         06DI75legtLS+/EX0qou20un6a4/CJkzTu4ld/M4NSKm9XGsoKkZXHB2Tv9E045ZUf0l
         qTtJAwNKhOs0YUmhOHteMp4mO8RT108BRuYifQMKX8c8gSKcIL6ZxZRIaFrmaLSBAEFj
         mmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QoRwKJLy1W+DikJJA6B41nB3PjcCPvyIBPkBfcJxCzc=;
        b=sEZ5CaVXHsZbW/CVsXmNNVNFlTTjLlqQtdPGdDp3rn3uglJobAznpxzOkR5d0cYRz9
         m5mhyjL5piYN+I9oVNrBBYQZTUXbRMmW6vPMt1esghPJ8oafEDvA/R/T8xZWo9UyeCya
         Px6z1/MKv+EEypuTc4lY5OcSTh5jxoZ0xqrmWkb1v0DhI0Iefs7QWpfYlWrzUBWI5/yG
         +X0awXNjKKj+/4s4vAWi+XKZ3hSh1KhYGM4jt7IKzKAIh0wC9NsQuOJb/6/MK8GDpE8S
         ztcM7rRCCFFyQBXPfAvRXVLnu4zXmMoDmX4wshaiTr2hhyKaXrPCp0cscxXCjlxZiOBm
         kSEQ==
X-Gm-Message-State: APjAAAVmCvPmiwfysgqP2PkFjM8mEY47ThZN59Id8Nf8eRrqPCsn3Ef/
        14/X6qEq3SuZb/FDynsAdumrVPsv8CvLuZG80j7f+vnuH+/D6x+P
X-Google-Smtp-Source: APXvYqzLJRkyHOXp6wUHfpwxVqRYTBiX2V3ZfjuCyIvtvC74NAzznHCOkeWocuWMh1ucpi49WrQr+RZbh85gUs+wC/c=
X-Received: by 2002:a2e:7d15:: with SMTP id y21mr18889969ljc.28.1568281706045;
 Thu, 12 Sep 2019 02:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com> <20190911075215.78047-3-dmitry.torokhov@gmail.com>
In-Reply-To: <20190911075215.78047-3-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 10:48:13 +0100
Message-ID: <CACRpkdZjZZKQqkN-HC11PJ5SgZbZd1Gnbeh8ApJ7+cS1eOOMbw@mail.gmail.com>
Subject: Re: [PATCH 02/11] gpiolib: introduce devm_fwnode_gpiod_get_index()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 11, 2019 at 8:52 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> devm_fwnode_get_index_gpiod_from_child() is too long, besides the fwnode
> in question does not have to be a child of device node. Let's rename it
> to devm_fwnode_gpiod_get_index() and keep the old name for compatibility
> for now.
>
> Also let's add a devm_fwnode_gpiod_get() wrapper as majority of the
> callers need a single GPIO.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

The patch is good because this is in line with Rusty Russells API
manifesto:

7. The obvious use is (probably) the correct one.
6. The name tells you how to use it.

It doesn't apply to my "devel" branch as of now:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=devel

If you rebase this and the next patch and send them separately I
am willing to apply them already for v5.4 to easy your refactoring
work during the v5.5 cycle here, provided we try to fix up the old users
ASAP and delete the compatibility fallbacks in the near future.

Yours,
Linus Walleij
