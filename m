Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95F722180AC
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 09:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730198AbgGHHSm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 03:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729896AbgGHHSm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 03:18:42 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9DD7C061755
        for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2020 00:18:41 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q4so17217739lji.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 00:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zIm1nTTtroh3jSlQCc4nRT6z0BXJtM8UPxEVaJ3cdLQ=;
        b=HbhaqiwehhVEfm4RXj6ezjnjj3skiTF36bLdw0wq3Js0HZ+q47/PQ19bQ9it3Le/ZO
         kIisM0AyOOAEQMiohpkCTxaAPUL6Dz7zw0xGdJI2gYf+Dy/iLT6rh7HerQ5uaLNAgVfI
         e69jZzP4+X27rz0je+uDqsReALXKWsHYDVlsVj4cL8RkVMj1rYFxQ0auzpTj5hj22uD8
         bP4v673Ap9IfGu4wfv8KKuPbOG7KxTOtCt5/2EtRVTupKNy9Cve6LnGGtS/A6a9hCqkx
         KbhZ55JRq3es6MI/n87mmUjLM53ZKQSENEioEIUNtk2K8ZaskCuKtvMfqFxLAprDv5k8
         aM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zIm1nTTtroh3jSlQCc4nRT6z0BXJtM8UPxEVaJ3cdLQ=;
        b=AjrFmbbm7VhrFEkG3bZaH0A7Z6muv22+7swONs8rtXXdrhishsVwCRfqwL7iWwZU3f
         yVo69ZZvSeLCzZf1ZUYSCa0da2H+FMsytEx0LAYt8JXYqE6/fKMzT2xU5kEkpjsdZbTO
         WW7wqrTVvlnNQhdN9kUW6c/YHM2hB6UJfSCIho82OSgRj6rodq5vTEGn/uw/Z4c9fFhJ
         BfPZHZDWFprRbXdFEnrolUnw/2elwWfCzyb6J+wkXYN/UrlrKGoIJoXJG82Yk7ICqM+u
         +zj/+0jjSHjve0XBOCGYTxS9YKkQSesAeiH5RHm2SrrVJIWYMQevn7DDfmgHF1lDzj6X
         8d0g==
X-Gm-Message-State: AOAM531v4kLqccVIG+PlVhjtqaM9xUjvVmK3wnMGwJ0Z+J2PAsMQGjob
        qxja842UtUPiNmOmT32nMEFKlPg9MJRwQIAk++fv0g==
X-Google-Smtp-Source: ABdhPJxeR9wevkAjhUg6iANqN39oApGw6BnyXI8B+rYDzmMCbtxZ9tcyP9q2LYQH3/SAsU5Fp4RtftyI9ozwwBiT/ws=
X-Received: by 2002:a2e:810a:: with SMTP id d10mr26812174ljg.144.1594192720209;
 Wed, 08 Jul 2020 00:18:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200630133345.2232932-1-lee.jones@linaro.org> <20200630133345.2232932-7-lee.jones@linaro.org>
In-Reply-To: <20200630133345.2232932-7-lee.jones@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Jul 2020 09:18:29 +0200
Message-ID: <CACRpkdbszVdmRY4V=Z=vVPAdbx4q=26F-OcnZu2w3-BNk+0ohQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] gpio: gpio-syscon: Fix formatting issues which
 confuse kerneldoc
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Alexander Shiyan <shc_work@mail.ru>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 30, 2020 at 3:33 PM Lee Jones <lee.jones@linaro.org> wrote:

> Kerneldoc expects struct properties to be documented using the syntax
> '@.*: ', but no '@' has been provided in 'struct syscon_gpio_data's
> header.  Add them to stop confusing kerneldoc.
>
> Fixes the following W=1 warnings:
>
>  drivers/gpio/gpio-syscon.c:48: warning: Function parameter or member 'compatible' not described in 'syscon_gpio_data'
>  drivers/gpio/gpio-syscon.c:48: warning: Function parameter or member 'flags' not described in 'syscon_gpio_data'
>  drivers/gpio/gpio-syscon.c:48: warning: Function parameter or member 'bit_count' not described in 'syscon_gpio_data'
>  drivers/gpio/gpio-syscon.c:48: warning: Function parameter or member 'dat_bit_offset' not described in 'syscon_gpio_data'
>  drivers/gpio/gpio-syscon.c:48: warning: Function parameter or member 'dir_bit_offset' not described in 'syscon_gpio_data'
>  drivers/gpio/gpio-syscon.c:48: warning: Function parameter or member 'set' not described in 'syscon_gpio_data'
>
> Cc: Alexander Shiyan <shc_work@mail.ru>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Patch applied!

Yours,
Linus Walleij
