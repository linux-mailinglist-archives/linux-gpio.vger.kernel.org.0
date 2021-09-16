Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC6340ED6E
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Sep 2021 00:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231521AbhIPWkY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 18:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241141AbhIPWkV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Sep 2021 18:40:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 404F0C061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 15:39:00 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id t10so18919686lfd.8
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 15:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VJW074vLgkoqEfzmkBJVye6DJySeX1QdR4ydnv5ldM0=;
        b=PIAc938g5uZYYwPlOYfKw4cymERB2FD6wPlH9N3T+NfPgnrYUyolSfYoSinYvqdJdQ
         VVcZVw+INqIGGcPDwAuS4yFC46mZsUE9VR42VaAFAZoZ7TrCwSppqMQy/vjby7SapQLX
         1FCdz/QDlFsWudBiBwban3oAZ/v/SlFDsqNK7IZMI8xFyZ7Nlr8FEu3AkyX0hpK9/D53
         wl5JX6chlZ6xF+pDEfLdN7xm38wZ7RgFMfIrRR7jC3bVdCkAU6JLUUeNcvXHhUCt2N8Y
         A7RSLRf6P03rKm+KOMLgoAPKA250xD2IacDzRox7r9H5ZUrM25ahVYKDxozv+KSm7Y2T
         1BNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VJW074vLgkoqEfzmkBJVye6DJySeX1QdR4ydnv5ldM0=;
        b=fQqUHDJgy/xJJ34lRXQUy/KdEMn7vYpA3HhYBvqjcPCHCVK+9XyP98JLFdmxAlOVpM
         +G3ng/AES0Ox1u1Prn45yiQ4UTDnPnekItUTMz/2gf5GNfoDQYRVeFKCQ3nWlssPW0Rc
         IvpJo/ZLj1U14LmRiUAFB9re6nh6rG5lQw9kQFldlZxYw4unnYvnmADfS81SmVIMmCZy
         AGqIVAFziJh717sp1Lwik9ugw6y5aWFv8QcuxSqrLBhNSCaikfMFZW8uj+wfAV8SUXve
         nMLUF2/AGPdH53FQZowV+01vZoliBZM3VMBEIsGlPIFz0/lgv6/2HV/dVLo+INYEjcd5
         84Fg==
X-Gm-Message-State: AOAM533CxfIwCs9ark2QklP+gB/uczhLVYOP381Uqw8inWhQSXDMMewU
        bqiXEMPaMvFVOkGJ6/w10JsYMiafya2kg5glvjk/wQ==
X-Google-Smtp-Source: ABdhPJzAM1iGWm0mTqQLqvtggvF4ws4zkDKoP/9UtR+5WjZEORVDgE46IVA1xOjWnbxzQBPHy7aP2IysGpEJsIhCBI0=
X-Received: by 2002:a2e:1548:: with SMTP id 8mr6773945ljv.358.1631831938638;
 Thu, 16 Sep 2021 15:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210830095357.21108-1-pshete@nvidia.com>
In-Reply-To: <20210830095357.21108-1-pshete@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Sep 2021 00:38:47 +0200
Message-ID: <CACRpkdau6v-QQhtWKVqiVaT3kPERRwmLtMWh3zXSM8+tStF9RQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra: add multiple interrupt support
To:     Prathamesh Shete <pshete@nvidia.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prathamesh,

thanks for your patch!

I think Thierry Reding and/or Jon Hunter needs to look at this
patch to review it.

On Mon, Aug 30, 2021 at 11:54 AM Prathamesh Shete <pshete@nvidia.com> wrote:

> From: pshete <pshete@nvidia.com>
>
> T19x GPIO controller's support multiple interrupts. The GPIO
> controller is capable to route 8 interrupts per controller in
> case of NON-AON GPIO's and 4 interrupts per controller in AON GPIO.
>
> Signed-off-by: pshete <pshete@nvidia.com>
(...)
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 49 +++++++++++++++++++++++-
>  drivers/gpio/gpio-tegra186.c             | 25 ++++++++++--

It is a bit unorthodox to patch the driver and the DTSI in the same
patch, can these be split in two and applied separately?

Yours,
Linus Walleij
