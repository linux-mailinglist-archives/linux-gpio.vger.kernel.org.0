Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA72A134FD7
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2020 00:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgAHXQB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 18:16:01 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42467 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgAHXQA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jan 2020 18:16:00 -0500
Received: by mail-lf1-f66.google.com with SMTP id y19so3734880lfl.9
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jan 2020 15:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gKCcYU81q4CQhyTI0mi9qJLS7i/EbbS9I1LOlVm/5dc=;
        b=lEUYBf67vAVHyo1Eknoo6gFsReT5XQ/unNS9wDkkmWf2glW7UMfnB5OhXgeS7tQPsr
         XFRbzTLfi1YriqU33DNCFYYrj5AxkB8fFX1Ss2Z2rXb65w8JW4XR+PKSRCCftHwvyalt
         5At8g7KMfwiSncqcNo9YJf/L6aayMhlEN2bRaBi5VfOIu/FgUI9P8x6LKPRCC3H8Ydse
         V+ZCWg2U4SDp+uwF5clNg4GqSXk0+HSa1YB/KxYwT3Sa34WX9Xab0RuYz4lQmSEkhfti
         s0DWVU43iR5bCQx62ziolVz0s8hQswx6CjEdOs0yEySVs+8rHF1me3Th00iwfwpBZAbK
         90Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gKCcYU81q4CQhyTI0mi9qJLS7i/EbbS9I1LOlVm/5dc=;
        b=ZmmJaYjLBhh2+Fn/uLbSBYBoWN2++U0KXBFZmH9wik5Ks+KaJYE6z/P0BbHa9o/kL6
         IR9YBhFZ+61LnNsbsRTGFHT4aUVOYCcBZg6utWdq6/GmXqpKZmABKRhjipsfOPxJ65nt
         B4tNcsyjrzfcREmwQ+YHMwPEtUvLLzoSRCV4Nlpzt41Q2JgGphRHnMmNvuEnpNcXgCBR
         5IT1pOEKTE8nLWYAYjeXd5x93dWkJ19IFQgSa+q674T3q4jxoF1W7mp4bePw2AMaxCPz
         ywh/6ARiGzgUVERUMY7QN1mfcC82ZOsBsfXwOGvErKwgXY0ou3s3NL4SI+6I0+QAiEgs
         O7IQ==
X-Gm-Message-State: APjAAAVC9lQ+t07ssH3ZPW93mP/jd5jlSdlY1m83ZBOw2dDRTMWXuDrn
        CUJISBEQlWHuo31NbozxfPu67XHWmFdHLZr4LqwDrg==
X-Google-Smtp-Source: APXvYqzzdkVj/8bW0xRwAAvF9Nc05RlllN9sGOIeKLvI8V/vgX08xNgP6z2D/sl05my7swY0MQVBWe0h270VVhSre/I=
X-Received: by 2002:ac2:5e78:: with SMTP id a24mr4178532lfr.5.1578525357266;
 Wed, 08 Jan 2020 15:15:57 -0800 (PST)
MIME-Version: 1.0
References: <20200108205830.21401-1-geert+renesas@glider.be>
In-Reply-To: <20200108205830.21401-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Jan 2020 00:15:46 +0100
Message-ID: <CACRpkdYeNe=W7Ajh7SrW5s3HuB6==Qk=UK9u+FoQvr+L771Q-g@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.6
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 8, 2020 at 9:58 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:
>
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.6-tag1

Pulled in to my "devel" branch, thanks!

Yours,
Linus Walleij
