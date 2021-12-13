Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0F67472E70
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Dec 2021 15:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233792AbhLMOD7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Dec 2021 09:03:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232193AbhLMOD7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Dec 2021 09:03:59 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 854FDC06173F
        for <linux-gpio@vger.kernel.org>; Mon, 13 Dec 2021 06:03:58 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id x10so35046729edd.5
        for <linux-gpio@vger.kernel.org>; Mon, 13 Dec 2021 06:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XHS3evdL43UusUkzdyL+Eag9Ud1wvbYwhkTvvLVLKZQ=;
        b=kQxxS6sCbBzgHe3NuN/zYZkc+LIzALmBm4UOz5HWZBqdQ8ffRQvulekfv02dLh7W82
         5ql6w3M5xPmdFNpWot2pRBZcrogAtDKqBJl57jAjgoiJ6QXuDNdwh85x9vxvcfb8hK2g
         mRn+L11bzQ/I8SwHD67KNVkhRYHnywFl/SiXrkJ+m62nOKxHvwQNKV8MziAxQKhlYcUe
         Dyof44FTxVtig7WM+qCKQxT/WMWyzyPF6D5zXzG6TVtR59Pfu4AUDc6uaDqlob75gaJt
         PMl7HkO6w5hAXgstzobnqbJceqLy4YAwiUPT4agFYuWQJ8uZsSHef8EOXQkN34yvVXLc
         FyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XHS3evdL43UusUkzdyL+Eag9Ud1wvbYwhkTvvLVLKZQ=;
        b=zotRp0BJUlAZDWCfHjO5onvEBi0MKXWauCQ1wTGQK6m6Id+LSgTKi2zUqy4KEFyA1z
         rAdybyfQvMNrGcBJN9/AHnUOrJ9YcPM5o70+fl5yTXwPlJUYscxCA0b1HhGumNQNZ3mP
         lwIknr8YPUQonKI1knZyt6IFhOZB077zB/flMT3QeO+LIwPrkFByY0rWm0C+Wp6dlS69
         dpcj2fz5bO1O2ErbZSlh2Fp1wU7lTu4slkoLeqfvvnMs+8srXqaFQUweewFvMg84OKV2
         VCq4tecTmCcSwe3KL9mkEf8mEet6dRm+jcJ52Ro/OdIJuvQBamybWsvzEmy3mdvnLIZv
         9bbg==
X-Gm-Message-State: AOAM5332/ygGLkjh87nPsXSmM2gf3pBRBFxxokdCWNPfKVSqi8+CNsEa
        90ZXY3kQ5BBk0rEj5oftRk0RMbNUv3ACB4toxeiR8g==
X-Google-Smtp-Source: ABdhPJzbOPDGAHP7Pt938eaLWI6FygxZxb7hKLKl6lUFd7dKTP4HNFDubvq09o/yZ7JbnkxRHM0vm5RQJ004FGwNY8M=
X-Received: by 2002:a05:6402:51c6:: with SMTP id r6mr64359808edd.365.1639404229973;
 Mon, 13 Dec 2021 06:03:49 -0800 (PST)
MIME-Version: 1.0
References: <20211210160206.872998-1-thierry.reding@gmail.com>
In-Reply-To: <20211210160206.872998-1-thierry.reding@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 13 Dec 2021 15:03:39 +0100
Message-ID: <CAMRc=MdeX7P5N-wnHAuAQWWUGL3Qnh6sEpd4zCJuEC17208Hrw@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: gpio: tegra: Convert to json-schema
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 10, 2021 at 5:02 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Convert the NVIDIA Tegra GPIO controller device tree bindings from
> free-form text format to json-schema.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Queued patches 1-4 for v5.17.

Bart
