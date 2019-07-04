Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2FAC5F41D
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2019 09:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbfGDHuR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jul 2019 03:50:17 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44633 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfGDHuQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jul 2019 03:50:16 -0400
Received: by mail-lf1-f65.google.com with SMTP id r15so3555006lfm.11
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2019 00:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ccn0mmdcVBFwzVsH3h6zhAr0aBIDV1YWC8Pp8tgoSI=;
        b=IXzieqeP9XRVCkrFPAbRwFPCCBkErUW3BL3WE3GXYMUbH3pYC4ok5TqOM8ujLJHgki
         N5uAKSXcKG63R61l9KypYBamsHNgxoqAARqTUJMMXyS53oMmt/IRv4qYOEyISaBWf4Xv
         6NbqFXhVmaRxU9wb+KkaV9rnNvYwlyzRrU422BPa6L3Su4mW8+SUYbf0poxnHetyxLLK
         jaHtCgeYwrg1NjttveiXuF/Z0wHlAFCFNQZEuFmEp4yDr+xwVoSEGHrbbFWIEkPlNQC8
         c+6FsZsXupxsDJdLMurmjA6jUX6HpUaX3XK0BRLa8ll8hCE4OFl/iQj/kgJfQDzpG1Ff
         J9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ccn0mmdcVBFwzVsH3h6zhAr0aBIDV1YWC8Pp8tgoSI=;
        b=MfMzdCkISsmCZ3ukuPuqHlbxTon48S9qUmAk9q2ViomYxzBnE4mPhqSLmywyyDTv06
         YTbMIXQEl9fL91vnnzLz5lDTq3SkDbrBvkuTKIoc3aFeYCTihdEiFgeoPN+HWjZ+W/eP
         QuzSygk+79RBHGD38cALrDZKkGMlxR7Fpg13gj6yez1+Gi4nMsbei1rkuOOIFYF0qf5U
         Z9fWf+REtIwyWMvvpMg7ZyTZhQi9IztasqNbKxZeIiEt/ldqktyFkA84VwJIAfb+B4O8
         /MQnoG0v1ht1T9eLx5219wYBL/0V+xWU9S4wJnDt7e4xYbP1+bpXPmEmjppnUzWSl2xh
         cpKg==
X-Gm-Message-State: APjAAAUO23UCMOtGT4c17ApuOVzdXy3GcsXEaaXNNj2dMUKGLvE/6t2t
        /t53xsq0T1d62hwtMo/dReXQsr3F6/7AXIsiEMGjG1/Q
X-Google-Smtp-Source: APXvYqwKsyWJXoDfyUFOBlMN0PebFZPfiOR74Xn7r1jcMc6tHUbpMQ78z4u9Uklbldoaeg+YwjadQpLn1Z69UDuXr+c=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr5322144lfu.141.1562226614916;
 Thu, 04 Jul 2019 00:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190703003018.75186-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20190703003018.75186-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jul 2019 09:50:03 +0200
Message-ID: <CACRpkdZ2+JT5K9Zmyt6=WUoAy_LVUSRSNvL9L3NgH27Ui3WZ9g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: baytrail: Use defined macro instead of
 magic in byt_get_gpio_mux()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 3, 2019 at 2:30 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> By the fact byt_get_gpio_mux() returns a value of mux settings as
> it is represented in hardware. Use defined macro instead of magic numbers
> to clarify this.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied directly with the ACKs.

A bit late for administrating pull requests now, so I just
apply this stuff.

Yours,
Linus Walleij
