Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06315A7E8F
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 10:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbfIDI4S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 04:56:18 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40290 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727144AbfIDI4S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 04:56:18 -0400
Received: by mail-lj1-f196.google.com with SMTP id 7so9289795ljw.7
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2019 01:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2d1gSHgVF6GGE1yTBdoSyC8IfXC20RQYBQqwBgSSBsg=;
        b=m+uUcEJoATzQHiFGnUOt6KbAoqwtSk/SyonCaWuvQZBFPWoMSVEFtmqOtgKZiZV/wi
         +6tZmAj4uHyjfzmdgof7ZGiJGYH28EOm7tXuG7O0mN6IujBXE+igFh8H/pCv+531a8BU
         UYfT31A5mB9QBzEa9QG7faetvWQTw/kgoFVHoML8rwet1U5t9L7QafXGI7ZmPMrFAVDm
         C5Tsts+Ad8ZXr5ZVaqnthlsFqJ3k+L8hCGcuwplhbbfG6vlIJnEXCsuAP0kjE50eqzRL
         3XOmw775a+1AWjx/vYuG0XhyaCqtsu0Ngc3gYZCL8x0mxHuHeYAlbTKe3EutgG/knGcF
         Wtgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2d1gSHgVF6GGE1yTBdoSyC8IfXC20RQYBQqwBgSSBsg=;
        b=dwIu4ZLbCp5XxpDQkft8+K51bNbyz5qbFY4uTae3tfxYvr8rn/nOXulW/WaxxM97RN
         O6tOj9R5194ogovHF2FbJFwszfFfyekUMbUsWUOICWKSsA7rOYwqwT7i+4u2tW2s49HR
         LXfXiVaRQge2R9dHKObuFHNkj5XaP5M/HHg3SJJI1n1hTx/MmkqeGQ9i9ZzL6lv17xdE
         MnZ/WQILJZcc2tcGBJ05/lghqf9X29TWvyWVElI75gXRJ8mRAJTheABxMtkKwh7SeFFl
         2Lk5qzZ7ZYA133c0KcNOVFr2QTqREJng+MhbQGBiy7f31PfDOyk2uMkIwmi/pjCf04od
         dYHw==
X-Gm-Message-State: APjAAAWwOok8XO7oko9REmcALIl3uQpojz4UnJHu0VNkI+tiHq+YMB8T
        3LF+xp8tqUH+qgP5nq7x472T/yQ8NibTcogYQSE9D7HNuvE=
X-Google-Smtp-Source: APXvYqydvZ9EttlCiYEycmndhDSTUrlomX2D832praqqImcfboC3K1e3x/hISAcQv4uWpFOR/Y5FAAieGO5T1NQS/3w=
X-Received: by 2002:a2e:884d:: with SMTP id z13mr15340888ljj.62.1567587376252;
 Wed, 04 Sep 2019 01:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190903132517.GF2691@lahna.fi.intel.com>
In-Reply-To: <20190903132517.GF2691@lahna.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 Sep 2019 10:56:05 +0200
Message-ID: <CACRpkdb3n+SNfqYT7zyCNxCgLHxtY4PJUwA1oGuc126O3WCC_g@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for v5.4
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 3, 2019 at 3:25 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:
>
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.4
>
> for you to fetch changes up to 6cb0880f08229360c6c57416de075aa96930be78:
>
>   pinctrl: intel: remap the pin number to gpio offset for irq enabled pin (2019-08-19 12:41:44 +0300)

Pulled into my "devel" branch for v5.4.

Thanks Mika!
Linus Walleij
