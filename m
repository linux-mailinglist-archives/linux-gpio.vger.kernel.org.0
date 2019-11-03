Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 187EAED612
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Nov 2019 23:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbfKCWTT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Nov 2019 17:19:19 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37445 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727267AbfKCWTT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Nov 2019 17:19:19 -0500
Received: by mail-lj1-f195.google.com with SMTP id v2so15514091lji.4
        for <linux-gpio@vger.kernel.org>; Sun, 03 Nov 2019 14:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=98gbe7SBB9olCV0Trg1FAi+sYmapafI8q2l02dNBCM0=;
        b=MxeWBXmy4ra2ttgXoQnToUzbJs5gEsA+kvJ7O2w/8UvVGXW6bTRDLcV7WAC7dCVSIW
         ReQhLqMYS8K5RR8H4jlIxhHBmvg8Xt5Un6Qg9gr9h8h7ZlTsq88jkbpKoIEDkGeGmGC8
         bqL13rGb2ru6QE8BpUh5fCj629kbChGgdz3RvkR9HdKncPWcRkHjcKsaWWEoM+nzm+UQ
         Bmcbv2+ckjAA0ZOB771MClZrAdQ3GKHwyiXxEQPxr/3sW8Rg8B/mCvtxTX0CSoxpmGoA
         3WgNvUcR1znPG5QPcIMmKavhbtBrSRmoQGVblR6ntzpEITkYqNh4xY7DOzMHq0sAHXDd
         1yQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=98gbe7SBB9olCV0Trg1FAi+sYmapafI8q2l02dNBCM0=;
        b=VEwY1hcFJwRHqE33fmPmrnErHVjadHFvS+4vsE4SU5Zgn5beSABbcXe+pMz509LqYq
         zGRlNgO4wlctAxLMufy/rFSVVqMrbCT8DYN5wB54aexX11+PiaB4pZ0DnwbsaEs2ePWI
         sNUTMv1Tq5v8fuAbhHojh4AtLmoyavqDeeiYqyJl9dmMajO1wEjoS2a7vjoh+bJSh3OJ
         nSOQgITunDFcQuaH8iengsoBIrMg4C4APRrhmnxs3JYjzXaLjKD6+hF5PKx5kYpJjTbq
         VGR3DPJXb0ZVnLSDO7Vqda5RIxCVP8bzl1ZilBrnbtW8HCQFBZoR/36Yc11dGMwUGtc4
         Qa7g==
X-Gm-Message-State: APjAAAUhk+D6RRxz+SFDyJRA5YSIJHQtIaVrcLbHxBxC80c0WBBAo6GO
        KnI090GZXip2x1W4TSiBZ21P5+381uWHBGS7I9cT9Q==
X-Google-Smtp-Source: APXvYqy0JGnJvAuArW7IrV1UqULAvYGScUvJO63LpUnNz0MaY0/Yjj3IyJ7qHKjXVAf9zT/anXnvmo6xs+0zXgDKvI4=
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr8852494lji.191.1572819557089;
 Sun, 03 Nov 2019 14:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20191101155916.31629-1-geert+renesas@glider.be>
In-Reply-To: <20191101155916.31629-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 3 Nov 2019 23:19:05 +0100
Message-ID: <CACRpkdZXSaebBjyRsNvP6kufufbYL3Em-j+nZbs5SDizM9m+Xw@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.5 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 1, 2019 at 4:59 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit f846d1e704f2d07a7f359f65eac2c8cac565db35:
>
>   pinctrl: sh-pfc: pfc-r8a77965: Fix typo in pinmux macro for SCL3 (2019-10-14 12:11:12 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.5-tag2
>
> for you to fetch changes up to 884caadad128efad8e00c1cdc3177bc8912ee8ec:
>
>   pinctrl: sh-pfc: sh7734: Fix duplicate TCLK1_B (2019-11-01 13:42:52 +0100)

Pulled into my devel branch, thanks!

Yours,
Linus Walleij
