Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA272A7E4B
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 13:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbgKEMH4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 07:07:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbgKEMH4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 07:07:56 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D094AC0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 04:07:55 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id 126so1925745lfi.8
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 04:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4TVngCqwm37hgEnBw/OBtjfaYO2Kz3COvkwr0iXY61A=;
        b=PYJIE6OV12cl3LWoX2FPT1ZXHVFbdhE+lEgZn1YO48cSWtliErcQ1Q37xf91J4y2o6
         6kLIpcOYVh+kI/duXBD05WqfmfYGyDlCItoNiQ2KWkTtqSAWhne+OVUuDyzWgquWA1O7
         gKKJ5pKdK8X4yfNPvOJ0twrsAHjCgZepSpuBM+I0IkrA5pJbMogG8mAu2K6V7UeYVgaA
         acsnpCtMc9NjY9A1bdrHnlxiCYG3YKE3LXZrr3OIb+JD+yfHEVaLPiuj4Ij44oiULgPZ
         JZfpnvhD1TPs1WISLlF9gDzTyloHaap+USAvfqB1WanFnhHMsmJgnuBYEBgKcmIYHr29
         EE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4TVngCqwm37hgEnBw/OBtjfaYO2Kz3COvkwr0iXY61A=;
        b=I8YW+zDZpI48DH3mdZTpHQFD1i+opx20F2G0ypBsLJgyCxRUDrp8ze+ujoB0IyNO21
         dj6k5OyKTz+Ba2lXZ5TpKDWmgNz0R2OTQ2BRQPxEAY4PnX9B+2XwQ0KBAfa42b5uHr1h
         cwavVOL127Cgp8a6tKwUaV8N+5IgvazURyiEUGysOZ/xZmQA0QJGdTlxn1RPHphSufrt
         TVyJq87Mc49zIc4+OYeHRnDgqllYpG9G5B7jhdAGIwd6x9VWg0nKdTIO1nVe50iu+gWV
         Q6a4vA0JkkOqYr2FZFqiQlEUnRigq2ly/gCHRYlgoKLhW0/iZfl/EGxmFjSMZ0KkqGS4
         GDyg==
X-Gm-Message-State: AOAM530JZNfTElM0gmkThscl3EbkG37MIONcAumVm0/VkOC8OKsJ7VHK
        eWoWAhCvXE0vwlkXIYjooj2qWzxBbwCfj38hmaU1hw==
X-Google-Smtp-Source: ABdhPJxXWfYcamYziHo9ZJHVToMJ8lGHO0aHeIMLIMQZag/Fmf2d84Eu/Qd8VpNj9NHIDYHAbzdDg3+o3TptOjgoZ0I=
X-Received: by 2002:a05:6512:3a6:: with SMTP id v6mr806516lfp.90.1604578074376;
 Thu, 05 Nov 2020 04:07:54 -0800 (PST)
MIME-Version: 1.0
References: <CAHNNwZAucoc00gJrUsPRMpFc9U2r+os6NJfc1axsGh0m6ES=xQ@mail.gmail.com>
 <20201105083945.GA23079@sol>
In-Reply-To: <20201105083945.GA23079@sol>
From:   Nicolas Schichan <nschichan@freebox.fr>
Date:   Thu, 5 Nov 2020 13:07:43 +0100
Message-ID: <CAHNNwZBWtZKfsEb6P4LD4gx9LhuM4WcT5n6H6jvr903Qzr2vxA@mail.gmail.com>
Subject: Re: gpiolib sysfs access when CONFIG_GPIO_CDEV is not set
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 5, 2020 at 9:39 AM Kent Gibson <warthog618@gmail.com> wrote:
[...]
> Hi Nicolas,
>
> Thanks for the report and investigation.
>
> Just checking - the CONFIG_GPIO_CDEV defaults to enabled, so you had
> explicitly disabled it?

Hello Kent,

Yes, we have no users of the character device gpio interface on our
platform, so I have disabled it explicitly when updating the defconfig
to the 5.10-rc1 kernel.

Regards,

-- 
Nicolas Schichan
