Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA5A1222478
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 15:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbgGPN5z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 09:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728955AbgGPN5u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 09:57:50 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 391FCC08C5CE
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 06:57:50 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id c11so3321036lfh.8
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 06:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3CikeVXsmSH3xLejOtc64KxmHFqUPdsBn8HUNTfiQdM=;
        b=qCTvAswWd3m3SFChWcBhgjSBV9sXk0iKF+7Njy/yLDzYrxghImOwWXRjF9o8Wtrf/b
         jLJt5mYhaXRH1FURrwzxmUh4LdwSR7X3n4vKK2nzsFmpCbRqoCluigSiSfXJMUFR7aFf
         h+tkfv9tzeI6leN8Z8uGxSHi717r7MI+mxTew9gvnfTy0JC5OSG0bKToY5HAurR9vKfm
         wK0wDBQliaJIptP6i7OGYKHh+rcyiiQqD3mXU/Pf3H4XLmi3xULSHCXqms6zk0Mov4Jg
         x4vXazJcuaZz+UAGy5hsejggtpbZyzZeTWNaWqNHwKwId5M0sDi2mhXEwmmzacTJClMt
         1nhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3CikeVXsmSH3xLejOtc64KxmHFqUPdsBn8HUNTfiQdM=;
        b=Ti4KvtrOIRWCHRnOEh8H8UdFNGk4ERRMkzj3a/ebFr10fpWjY7FD/VVJHIYGeMfVdM
         wYRi+2W6+uT2I7EqWMmSQAUyooCbdzjn/hmM+cZGXNAUZxwZLPS7Ro4cOlx9SF7fzSyH
         Z5j+ByE7F62ORqL0JPLTpwpiq8BNUFQ4MQuFZnGIDQBmw3s0EMjnwI6g8u3EKSVgq1js
         YjgYzsi+YT6vgz+sXLfGUD9WAkFddTOwNye9q4RATHcRaXt2xZFg4zMjPk9jXS3ByhZd
         yfyhsTzVpYyrIixl5cYUSvYxI0N5LlsWKRz6guBozEDkNziJpTJ8jKKuppbO8xLm+HBZ
         fSMQ==
X-Gm-Message-State: AOAM531/iUkeCFA04j6rtUz2ox/2Tte5Pc72xIrLT/S2yYDmSvHX3mhX
        xLsBZ+5wjpKJ6hqJO4rZXFolv74YcfIt85XpnnkXxBJI0xM=
X-Google-Smtp-Source: ABdhPJxVFqXa0LJbvSZZW1t3IXhfBWED/cnhyxm/+4d67HItSPQn+L5o6S2HvAr1UKqianvKT7hJBHSeaZYmBa2iAKE=
X-Received: by 2002:a19:e05d:: with SMTP id g29mr2138883lfj.217.1594907868617;
 Thu, 16 Jul 2020 06:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-21-lee.jones@linaro.org> <CAMuHMdWMUN8sU09J1eSsSJ9sXMhf10GUHeP47UDf6+yp8vnAnw@mail.gmail.com>
In-Reply-To: <CAMuHMdWMUN8sU09J1eSsSJ9sXMhf10GUHeP47UDf6+yp8vnAnw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 15:57:37 +0200
Message-ID: <CACRpkdYep_r1KsTnU2gVr-DeOf50hRiyTRq=jgeas=fD-qPHVg@mail.gmail.com>
Subject: Re: [PATCH 20/25] pinctrl: pinctrl-rza1: Demote some kerneldoc
 headers and fix others
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 15, 2020 at 9:30 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in sh-pfc-for-v5.9.

OK since Geert is queueing this I'll drop this patch from my tree.

Yours,
Linus Walleij
