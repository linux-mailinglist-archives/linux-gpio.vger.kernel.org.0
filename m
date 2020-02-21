Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40A3A167FF5
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 15:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbgBUOTq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 09:19:46 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42062 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728081AbgBUOTq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 09:19:46 -0500
Received: by mail-lj1-f194.google.com with SMTP id d10so2338909ljl.9
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 06:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vbp5HmE7gQPscb29G3f/m6n5PyBpWgUkLDK+pcD6IUw=;
        b=sDQ4rKRcT9EGnaai5ZQuPPchUsTALBOnSJwytpPdvxe1r1Ltn/OpcV3lfkpxSCG4UR
         KL2QLIxx95AzvErUjDzabgonfPxKPQ4o9yPgANoZ5QPVpSjG2f4LOplf0jtNOoO/nH5e
         fPAjDCsapksFzZRD3HxxkaHj6ZBy8pV+q+wHgUfybXkKr77KFAiDOJIRRdLSku7V3uba
         cLhSSgRo/5ubr0gsabf1g03T/QMQ6WAiISrGLChupPj8bsDbXu1g8mUsaqIvG7C985wz
         YUWtWpU/rk5/80IN3wGPvDDl5xpQS6nGMI3cTs4q99Bst5PU/h8oNCzeYsSfy2y30ynH
         nR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vbp5HmE7gQPscb29G3f/m6n5PyBpWgUkLDK+pcD6IUw=;
        b=cQZr5XZFVMsE+ZxQCTNze1E9qFPz5B0q3jxGZuiMsaBD5e3FWAgUdLoOfNyGHIfyN6
         +MxEOlwFSyD+xSFplj4SlqQrNYZAQBVYQfqfZPD0NhK6vdRg5FkXqDEs12kNys3HnRkR
         8pVduZB8fQbdSffmpnzxHQen4HzhpcD1VFPcRBMIec8gQfX4QR/z3GeKlBaRI+Pjl+8x
         bCnV1KekLIefSvcaxzC3R/INhYjbC8Nb1vTj7ieJaSNHyyUz3lJYUhUH5rYg9d+I5BHz
         mI+yqD/CZNeukAIdLBDuNR/x4pTMJgWAgsGUxCs3/hSO+Xg3J6l3l4iRk6Qz8IQdGTdX
         yu0g==
X-Gm-Message-State: APjAAAUz+X/i+dxQgraCmRIN6bu7dKIlmOT3q1xBtnn25AcDgBr99Ply
        MgXLQGAS9hakWGNQ6NXHGkSeMrUUWyh19itJbJbWBw==
X-Google-Smtp-Source: APXvYqz9cmg2KLMmUTg2JIW1MU0s4xog4bZMTJbbldDW/Cbwv/i7Q6SO6ViCj4zGcyeRfHb/ScJ7msrrT1A1urwRj5I=
X-Received: by 2002:a2e:7d0c:: with SMTP id y12mr23132078ljc.39.1582294784504;
 Fri, 21 Feb 2020 06:19:44 -0800 (PST)
MIME-Version: 1.0
References: <20200214135712.GA14557@localhost.localdomain>
In-Reply-To: <20200214135712.GA14557@localhost.localdomain>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 15:19:33 +0100
Message-ID: <CACRpkdbxB7yZ6xKxtSwz_L-20ofw26-LDX=3j4s05TT7aJ1+dQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: Use new GPIO_LINE_DIRECTION
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 14, 2020 at 2:57 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> Use newly added GPIO defines GPIO_LINE_DIRECTION_IN and
> GPIO_LINE_DIRECTION_OUT instead of using hard-coded 1 and 0.
>
> Main benefit is to make it easier to see which values mean IN and which
> OUT. As a side effect this helps GPIO framework to change the direction
> defines to something else if ever needed.
>
> Please note that return value from get_direction call on
> pinctrl-axp209 driver was changed. Previously pinctrl-axp209 might have
> returned value 2 for direction INPUT.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Reported-by: kbuild test robot <lkp@intel.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Patch applied!

Yours,
Linus Walleij
