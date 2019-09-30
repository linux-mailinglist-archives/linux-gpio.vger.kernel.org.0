Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A87BCC2952
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2019 00:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbfI3WMK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Sep 2019 18:12:10 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36070 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726784AbfI3WMK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Sep 2019 18:12:10 -0400
Received: by mail-lj1-f194.google.com with SMTP id v24so11168177ljj.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2019 15:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KeMbURaaSS9vRDVHmI6PUKuuQvzE/b1Qg3h1SqnoNyo=;
        b=pordKa2eHoTT+5VMhZ4hPOEjHJ48YTIZ1a/CJykpPeYQ6wfTQ9xFrtAgWaDNltu5Lo
         K6F2N5Yd3asJKOucpvN8hIAdce6h/jRjYD1PB8yO0QhO9dEfl49r+gPkeWV7DxAq1vDz
         mXsfEi7qvITjyi/9pbkvioj7usa5FcPfK6ATPnljI6ugKWgLXMDz+gAPSHGdX7xZMTnM
         P3bmRR6BPk/o7NgiD8YHje9wTRafxMvCxLGpI9rRtvFXEiaXlg1BRP348HxKSE12ceB2
         lhVIA6dR/ybsaIfn4u5MAQxLPv6Wdl0zYVb7ciNL2PXNW79EbOA50ZJI97UkxYNNRMT9
         qpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KeMbURaaSS9vRDVHmI6PUKuuQvzE/b1Qg3h1SqnoNyo=;
        b=DHocR3qmPQ0mDxkMUeYsSL+0Xbs+mTtr+9HZcY56RMQTw3cgAkzrN7LjZvAArwQhyJ
         cbWPKb1b0NXBkmdOd0ZeAyQFjPS/CvZZyOMsZ18oPPWB8/q3x3Xx1RLxQH3yW2KrP6rQ
         hEBzi5QJ1n02OsIUvaKMeZ55zoqzduQNsqVtfYbOLDMdN+MI1AaT9bWDATZ/O+uawE14
         A0rAM88ShmNgL4GAXM88gL/h89096iiU+nFD+sB5xBsj3VOx7GaanXERKJXv0w8+dykV
         /Giq9Yktz7E8yO70yQ83G06WBigXQH8Np0gpsnkGpVyazVlm36mapHPFd8J1QlYMX2FU
         ysNA==
X-Gm-Message-State: APjAAAXosL+Eh9W8QOWInCIFFp+NJUR0j2NAoSf3Efw2TOgwA3l8iuLX
        k3SlDKevMNa8MBk7nAtnxu5YMGIjeq8veclv/7bmaw==
X-Google-Smtp-Source: APXvYqxe6D7M2CpO9ejL2LIa7KeWGOnYdsL3yKj5+GxSvDm2nH3mB/7BTdj25RWdDwQlfeOkdzVzHiO0rGuz6tzoTpI=
X-Received: by 2002:a2e:3e07:: with SMTP id l7mr13604466lja.180.1569881528577;
 Mon, 30 Sep 2019 15:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190919132403.1835-1-brgl@bgdev.pl>
In-Reply-To: <20190919132403.1835-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 1 Oct 2019 00:11:57 +0200
Message-ID: <CACRpkdaiKzbE6bKX+Wg-KxO1QkG3245evvaM-xCNgDTYdf-qKg@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.4-rc1
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 19, 2019 at 3:24 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> please pull the following set of fixes. Two are core code, one is a fix for
> a driver. All are stable material.
>
> The following changes since commit 4d856f72c10ecb060868ed10ff1b1453943fc6c8:
>
>   Linux 5.3 (2019-09-15 14:19:32 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-v5.4-rc1-fixes-for-linus
>
> for you to fetch changes up to a94b734a563498ac4b8fff61179a3c2bba781a4e:
>
>   gpio: eic: sprd: Fix the incorrect EIC offset when toggling (2019-09-17 10:08:35 +0200)

This doesn't work with v5.4 for some reason:

$ git pull git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
tags/gpio-v5.4-rc1-fixes-for-linus

remote: Counting objects: 16, done.
remote: Compressing objects: 100% (16/16), done.
remote: Total 16 (delta 7), reused 0 (delta 0)
Unpacking objects: 100% (16/16), done.
From git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux
 * tag                         gpio-v5.4-rc1-fixes-for-linus -> FETCH_HEAD
Auto-merging drivers/gpio/gpiolib.c
CONFLICT (content): Merge conflict in drivers/gpio/gpiolib.c
Auto-merging drivers/gpio/gpio-eic-sprd.c
warning: inexact rename detection was skipped due to too many files.
warning: you may want to set your merge.renamelimit variable to at
least 1294 and retry the command.
Automatic merge failed; fix conflicts and then commit the result.

Do you think you could rebase on the v5.4-rc1 and send me a new pull
request? I'm afraid of trying to fix it and screwing up, so would prefer
a rebase.

Yours,
Linus Walleij
