Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8AB27351D
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Sep 2020 23:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbgIUVo0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 17:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgIUVo0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 17:44:26 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9694DC061755
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2020 14:44:25 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id r24so12385001ljm.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2020 14:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=98wrZWm5rD6s8sDxcYcqY37rnvB1KaQTfMpqS0lg8EM=;
        b=wyoWj6nN2lE6+YFgFmEqZTDuIp6aWaRMJ/WRz++Gax8tTYyet52O7y4DnC377q6Jeh
         Kt4+vINzKRRiWa8XAPe4WbRqbeiXN7TRXQ8rD5mvBZxFgoBIA55qVyu+2HCCl4GiSNf0
         NI1HNz+tet8jEWxUzT/cfwbjbrRxXBrMz22a+xKO3eplke5/e3L9mS+d/xgi9RGTGmb8
         jrIThCIBDpPigfSleE6ZwAzKUZVT6VIjCEdxK4MasG00vt8mmFQFnQwUO8iFf4tK6Vnv
         RP9RoVAhDSlJc+2pj3huE6fc4MvYg1PW5+5lJGZft/Dx0aI6BStDoIJu+dIG7d39Rj9c
         ynJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=98wrZWm5rD6s8sDxcYcqY37rnvB1KaQTfMpqS0lg8EM=;
        b=f40YcjCD8Wn8x+CFnLAljMc4GnRTcBKb3gs6M8C+8wTfGnppOCIpv41xQ/ZZJYz/lS
         PAAqBQwI6DPPVytv0xaODYYwiya/axe3XQLM7OmBLyFTkn3OegIvVrLVOS7HBn7iWwef
         R+qM18C/ji06dZYeanH236QUwlrwNCVMptz2jKZrWEDBN5LjEe7nr7+U+TYtoChQkixv
         Gn8Ag1Y12/0DdJxFvlUDtJFjTaiay23EpF7wPTxSqlYZQxRZ1pZJ007MeSEZ2zMSOI5F
         3UXQMgEm35tj6nHj07RCJmMR5NtpORBhqkvGvJXe+smEqOxYj4nUMwXYi20lziY8Lwg1
         l3XQ==
X-Gm-Message-State: AOAM531OUrMl8R2j3e5CufhjMAqYizwipmjZvCjtLVGOnUOkidVxT9NZ
        HFb83Z04RxH8BPkuzsdQ3TL0cqDUygo7ZAmLKjFIBmTxbPx0hQ==
X-Google-Smtp-Source: ABdhPJxHeQas0kXkbcq87Kx4lesaj8HHnzoP9rPiV/go6yBMDgrM4H8/fPd5pR/oXLAYeP3EKWCMrKpjEz38AHx+p7E=
X-Received: by 2002:a2e:9988:: with SMTP id w8mr537665lji.286.1600724663995;
 Mon, 21 Sep 2020 14:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200918124828.15729-1-geert+renesas@glider.be>
In-Reply-To: <20200918124828.15729-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Sep 2020 23:44:13 +0200
Message-ID: <CACRpkdZRxTz+Vf-Gbv_9W7gG4snZ2kSa+CL3qB1+q0nyw3y48Q@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.10 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 18, 2020 at 2:48 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:
>
>   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.10-tag1
>
> for you to fetch changes up to 540d9757cea8274a44d69cbadcff5b8c381bae8d:
>
>   pinctrl: renesas: Reintroduce SH_PFC for common sh-pfc code (2020-09-15 10:04:35 +0200)

Pulled into my "devel" branch for v5.10, excellent work as always!

Yours,
Linus Walleij
