Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D488C1BBC90
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 13:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgD1Ljx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 07:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgD1Ljw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Apr 2020 07:39:52 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 423ADC03C1A9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 04:39:52 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id g10so16523454lfj.13
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 04:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sSYN7LyfER5nHRvbPStmRh6sm8izFYsVg4EItNXvAMY=;
        b=DtcSM55tTpcmcAnOuGlK85NwAYhL5PrxK1yTYWVib+3qjH3wP0ZxOwC3lgV31JhCFX
         xFXF7X+o+SkQzHtGAKh9puFWrnXG5xwOHPG9G7ctGQ890mgB02tS3Kf4homdnt0XS11r
         cTbeABNxVE75HSc3wiRixN0hVOsZZxRAiOwsw1A4badZnVQamEiGSNSdPt5ApSaV1Bij
         j5rYn4B2c/jJd2DNRqezC4KrtjKfKiq3hMj+aGu6pCZDn7KIw54N5/Uvgce9PH0f+jmR
         gE/UcDXU8gi6MpvrZIBpGX9b2AYZ24F4mveCjLUx11Tqtri+6NWl3t5rV+96VyUVKbHo
         zJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sSYN7LyfER5nHRvbPStmRh6sm8izFYsVg4EItNXvAMY=;
        b=bu2uOD+q0KwMgl6ZfzqrsmJqjkgyvqQ0B/W50U1xpcfjAntPYvW6uRh/fyCKwMGg6q
         3O9DvcYeQ1OguU4DCuw/GLN040tFB49TLeeQccbJVyCXbieLUYjlx5DMQaV4XTxOGr5P
         549AjOLD4s+Wdg8d178pP72rljQVDA0clqW6yipib1Ry1xIYn+hTDdsI6kUDA+Xpxdcl
         NN1OLHQzVssct9PW3cD+7hSMXE7shuFs5XrVdbsQCzJCYD8PdnFKolgYbkxmPCXxd90B
         GdGW9/FR38Ooh04ILVi/97uqTQkl/6/GGkiiXvhnQ9Oy0rsdfYHkuSXABe1ATa0qLxDq
         T3wg==
X-Gm-Message-State: AGi0PuYAPD3H3x/gox5DEHlH8lxaCYGSnWnUc6WdME1luDstgDxQ0T3C
        rn08/CIFrg/T6ufy3+npTQXkqfcccmImbX8KFeG6zdOy
X-Google-Smtp-Source: APiQypKqEJuDXW1AP3UNUVsKwhtEYOld008xLCo5Wp9ZngaUpkHZkBryPRZHsn2eD2j5LGRTuoim6FK3iYtdH6Qr7+I=
X-Received: by 2002:a19:cb41:: with SMTP id b62mr19110833lfg.21.1588073990766;
 Tue, 28 Apr 2020 04:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200423161101.15993-1-brgl@bgdev.pl>
In-Reply-To: <20200423161101.15993-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 13:39:39 +0200
Message-ID: <CACRpkdZAmKk8XqY8jwEytm_wNA9wFCjmJ6D5=Ya_4VBZbcaCSA@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.7-rc3
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 23, 2020 at 6:11 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:
>
>   Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.7-rc3
>
> for you to fetch changes up to 6409d049ce28bef35e13dfb8699fc7ee27469ba1:
>
>   gpiolib: don't call sleeping functions with a spinlock taken (2020-04-23 17:55:27 +0200)

Pulled in for fixes.

Sorry for taking some time. I was stuck with my head deep down inside
the ARM MMU.

Yours,
Linus Walleij
