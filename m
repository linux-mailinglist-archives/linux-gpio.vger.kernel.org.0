Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECAC62C29D9
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 15:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389187AbgKXOj5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 09:39:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388014AbgKXOj5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 09:39:57 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 124A7C0613D6
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 06:39:57 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id j10so9845912lja.5
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 06:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ViC6rBoITmAJCOXt0pAewCoH+HcuEDzAit3HiPWPEa8=;
        b=xZJYZ7yFcv6GGycmGnAbKTKNxg0m950GCaf9yNWWBkZNwZxSLugjkAdPr/oFtPXLos
         c67qy0HkxZuKvCPWF2ED5D8opQx969RQgRfc5DkhYzAqPUs48rhZS4qnbCfa6BLIFvQx
         dH8jScEcD1dY/d70oM3NUsMj+1M+rREli9tmkplDDIgukysSVGaLFKSPW8K+zHyAcv6Q
         o5ooBX7h6jSi48OUkWQf0b3I/pG7TokwRv1BBNBjUbPAdfhwM2dW5p90En+uTJ4dpygZ
         TcLwx1ARidJbGPJRzkcsVi4iyz1SBJTOm9Dp/h70ltOX3SYoPuYaHqDzMz6Git2grnSG
         5Z1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ViC6rBoITmAJCOXt0pAewCoH+HcuEDzAit3HiPWPEa8=;
        b=kYhEUZukCtJn/7B18j+U+Np6ixdfoFgIDeO185cA9P3mM/whO8dmdc+oaxZM+swSdm
         Z29Cl4sPqfT0WYGalRTXOWEFWPQQkm4JhgmWd2L7R7bJjCT1j/BYrlBPyREcaD0y18kF
         Tu+GJ8NAD2DT/48xg5QU8g5eehJ7J0upFXBegGc/98IDnYIrFMEwmO28uPA7EyQ/KwjR
         O09NvV6it8mYYJ/ZD3tNyKbB+gq+KFAM2xZ6yVP1my0JjsAeQWlW5YCQewdYvcgNBW7g
         cguCIpFPeobVC6aAfAWP53MxQyGoTG08Prft9YUzy9B8kG6p45HOjLHjNXblzf5cVRN+
         Yndg==
X-Gm-Message-State: AOAM531k2b4E2HcpK7WiiZOSjwclYnsQtAm5UOv22t/1J89Yi77+QwkE
        jfGFkM41RvM2czrmwLhFs0U/m1pIiCg1fw6BZZWF/k3APKLndw==
X-Google-Smtp-Source: ABdhPJxBNyFUIrZOd6YF/DqwAjdx6q5ghzVTkrstABvaaAgM1iGgkfwMr6LJc7hY6ohJfSRCBMol/Vaz9HCdU8dblWQ=
X-Received: by 2002:a2e:998e:: with SMTP id w14mr2198553lji.100.1606228795481;
 Tue, 24 Nov 2020 06:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20201124143132.GA9090@black.fi.intel.com>
In-Reply-To: <20201124143132.GA9090@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 Nov 2020 15:39:44 +0100
Message-ID: <CACRpkdZPifFWvqK3UwW49Tch9mGxs-EXKYogw6Ca8GH_E0qOGg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.11-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 24, 2020 at 3:31 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Bunch of new Intel drivers and few duplicates commits in the PR list below
> since they are already in upstream. This is material for v5.11.
>
> It smoothly merges into devel or for-next branches (whatever your flow assumes).
> The bundle has been in Linux next for at least couple of weeks.

Pulled into my devel branch for v5.11, excellent work as usual.

I will think about renaming my branches after the v5.11 merge window
so the naming is more intuitive for you and others.

Yours,
Linus Walleij
