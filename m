Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B95F1E0A30
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 11:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389373AbgEYJUf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 05:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388920AbgEYJUe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 05:20:34 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE95C05BD43
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:20:34 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a25so8338278ljp.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xvcI6atilAjptGncGZGLa1vsWu/238sVT7RvAy3Yk+Q=;
        b=cd/AzbqtSbqnefzkvclP0Wb/aJ6tTz7jHMSI4l7oLcmgnZZYFrR2BCP/3U3XxQ6uA3
         KzW1vrz/p55swFYX3//d1Irwq0gexq3eUoEpICBskl4RNTjDEXHXYE2iIjonej2eWMyX
         FMOX7G1czIWKQSkB/LUCfd9K0in/SU4YgfwwsxdbteJAVbWWRWVrO6ikzv3xndMC7loV
         xfpWVh81NNkbnCcAGOiLI87P0SIFR431Ee9ZVsoyXyLmHI/j16ro+sXeL3T7OU98W2FA
         mdL/WEoUXeIq5FlSgPiQXYxs3Txf8ZtQuG/iqnvY7bg7RTK7I96JduMcF0PlLr3l7zlQ
         cCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xvcI6atilAjptGncGZGLa1vsWu/238sVT7RvAy3Yk+Q=;
        b=iz2gBygxOfh0QPzKdYr1QQth3AKsB1rVVCG3mu4sA526izbLvp4edDxT66xwoQqtQx
         4F8PCQE0gFxYz+L+SFyx+hJxfSLr7SksONP0b+dE1567ca6tzTktMw/gQhst3uPCi+8K
         Nn/eXnREVIxW5iy/frX3dbeeBhA0kSo6I5KKq1r0lTkyTFz4MZkeY2f9Ugya6OzgYmev
         EmeQO4BD+RFOoxrJ+sSLYkHY5hLkwkX7nqknvU7USRLTyjpGRL9yCDjHpiuVZzsNrgez
         8SaYMLQb7b3ZxL4JLwIByyawz49Ktzryp1CmhmhSyub+ysO3C2MnMoS0kHXBvyC7A69y
         mXBg==
X-Gm-Message-State: AOAM533MHfp2siuREUzeD0m+Pz/vK/SdbLNonEvpkvTYV9jcysBxGDBb
        eeigHTBeExsPznRSrFtyZ4FNKAUSrHuIJ4oXvzocVg==
X-Google-Smtp-Source: ABdhPJy+1uaZp5NrYneJ1FMzyJxTyyQTo+HNPC/bdQX7SqBU+sJaKedFmitxsML7vVuezGMwCL9C6qRLUnLSOqbvews=
X-Received: by 2002:a2e:9716:: with SMTP id r22mr13999531lji.293.1590398432614;
 Mon, 25 May 2020 02:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200520140430.13933-1-geert+renesas@glider.be>
In-Reply-To: <20200520140430.13933-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 11:20:21 +0200
Message-ID: <CACRpkdZCyQcVUe0-OX7-Nijg6rKX-6aMS-BnXZhHdBxa7sSn7Q@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.8 (take two+)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 20, 2020 at 4:04 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> [ This time with a correct SoC name in the description, thanks Sergei! ]
>
> The following changes since commit 41fe32ecc7aff4527a4ee477870d9b1164be95a4:
>
>   MAINTAINERS: Add DT Bindings for Renesas Pin Function Controllers (2020-04-20 13:14:05 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.8-tag2

Pulled in to my "devel" branch!

Thanks!
Linus Walleij
