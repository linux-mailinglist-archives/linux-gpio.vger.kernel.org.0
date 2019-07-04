Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFAB5F3F6
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2019 09:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbfGDHja (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jul 2019 03:39:30 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34717 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbfGDHj3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jul 2019 03:39:29 -0400
Received: by mail-lj1-f194.google.com with SMTP id p17so5185720ljg.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2019 00:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FVYvH6yPxNlvAG5cJftwWiP3xNZgU2eViTDVr4W3YCw=;
        b=R3SENBXntvfHZIhABiAhLiXIF/IgyJU3n1f0FHPe5YRFFsc4xu3L0WX9avUUev/i0B
         ovJirlT4blG1yRpNu0i8qVqMGsOKoLPvnytcsmlvBWYAYoOBBgi9bYFJxoRpkWr8KCfm
         tE9IMbqEy0mEShd0+tOIqBa9TDbUWlxWdam1aRBh+ne0QL4mgfQXVZdEpRvZe8CIpBOk
         CSBhyl9lIhLqEyqZJ2k6QJQoGYbn9GpOmf/EUw2RchnhfenuVwLaYB8JqmDg+sNEZqUu
         qWbAkUHQXEujNK5odoqO0mDmiuMoMgkQB/1SldPHrLTv90pQCQiltB55IOzpeM5TuU/+
         bx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FVYvH6yPxNlvAG5cJftwWiP3xNZgU2eViTDVr4W3YCw=;
        b=XzoJySK0rAzvxziNCPhKWImBwANADjwQaYSCill3mXETy4w2eTtTDRRdt/g+2gyYM3
         DTKQogWSmkDOzHNvVj7Eik59CO+dI4AJjSP72hxZL/cBIetHpPkQZPyBvQpfhPwBVxLB
         Aug5MxWImPCFr+Z1amVeb+CJwC22YFjxSu8IHlG6u7uQDcu26cHyra+BYrArIaMA7qu7
         0WEZZwcBa2pGq67xdU1lqOqeL+cVtrsyWUTY4vCJahrVKf63PJJ6vhkJhK5Kg4ghWksi
         AOr7caa18/Kl8zkyZmquP1g9kq6eZS7N8XPfXDUURHxsoqeL/OUv9K5JtZfulEBpgQp0
         8ePg==
X-Gm-Message-State: APjAAAXRCySMY3M+M0jVV6Viw7qOBUXVMRbF2gu6brMW66hSEdvMmyq1
        AZRbRMOniSwIBIrkUir/dznGpkylE+E8mtbNgECL7w==
X-Google-Smtp-Source: APXvYqwVwvcJEtr7A/kJye84Su6CfIIOAGLONLWgC7XTlGMnxZhELFzYhqS/HwFA+jzsM2qiOl/B/R7D9khsFU8knys=
X-Received: by 2002:a2e:a0d5:: with SMTP id f21mr24144037ljm.69.1562225967852;
 Thu, 04 Jul 2019 00:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190702223248.31934-1-martin.blumenstingl@googlemail.com> <20190702223248.31934-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190702223248.31934-2-martin.blumenstingl@googlemail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jul 2019 09:39:15 +0200
Message-ID: <CACRpkdZqGqwRY1X_frEd0z6QeyO2KQf9vZ9UPRkLSowYLF4e-A@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio: stp-xway: simplify error handling in xway_stp_probe()
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     John Crispin <blogic@openwrt.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dev@kresin.me,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 3, 2019 at 12:33 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> Return early if devm_gpiochip_add_data() returns an error instead of
> having two consecutive "if (!ret) ..." statements.
>
> Also make xway_stp_hw_init() return void because it unconditionally
> returns 0. While here also update the kerneldoc comment for
> xway_stp_hw_init().
>
> These changes makes the error handling within the driver consistent.
> No functional changes intended.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied.

Yours,
Linus Walleij
