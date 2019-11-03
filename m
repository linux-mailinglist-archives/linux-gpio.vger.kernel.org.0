Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3BCED614
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Nov 2019 23:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbfKCWXf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Nov 2019 17:23:35 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37447 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727473AbfKCWXe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Nov 2019 17:23:34 -0500
Received: by mail-lf1-f67.google.com with SMTP id b20so10796042lfp.4
        for <linux-gpio@vger.kernel.org>; Sun, 03 Nov 2019 14:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ESUhhN6edmpvHFOV1Utv000unf+voyNT/XqNjo94L3E=;
        b=QRCiTT4RtFkcbSgtjNd916P8LiP+fVE6O67kBgLv/qfB9arXpn+JSLOI9BH4ht8w5p
         KO911xAHoIUr2XcjLsIrtSJrqAIg3Qasmv8+1w5kf9IBMmZCyRQju63Wp5V55a43xrXN
         8ovnfJqkCmPQcjvSEwLq70modMTgbPR99uE3DigW7sy3fcFtk2miLcyWe1QfTA2wL+m4
         dg8noVdcjht1feN13oMlJxV2e5zNNV2q5SsIQ8N1+oERo0Zcwm0tnPK1UutkbuGvAh0v
         +BrnKqpxrWpfpHLar2RvsTp9piW4rgejaoXD1dWiwwDCLFBp2hXa7Ab6zkyeU8jcSK4a
         bz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ESUhhN6edmpvHFOV1Utv000unf+voyNT/XqNjo94L3E=;
        b=dqQb7N/jvPHznshTd7Ws4/C/PmxOREPgpV4Pd+v1lNh2fyX5qA93RDNLoG9Hw4iF/G
         TuMOI/g6+taSFiGsIpTHZf0Fvcc4eZ7BDUtw5QvTvKaDjc8uCiPoI5IyIFvvtAfxqRfm
         qErCKWt5nkumATw59I21yADAPSFUMmPONSs1Wm5+Rhk8iGi84Eld0RXjCPeombt0RsyG
         S0FcfQB/flf3XPuaTChxVm6Lsy+gc04ny9Km/ld/oYGaS59zwPym0dsulm7JUtaFVgRn
         ZDcoKyOqERB4EB+/lrj8GdqkWo3m/i+gmYqmXtVdOz8scwk5RsC7uH3IarLkqHAoMVsM
         XcLw==
X-Gm-Message-State: APjAAAUmH4YBHEWdzGHTzu83DLe5yMPCwVojORM9iiLVSD/9YzvbirQi
        IKGKs7tG1FMRZPmPJ2epRbJd5ROt6zFkj8Lg8GIWbA==
X-Google-Smtp-Source: APXvYqxPSzDXNKfugYnnHKUIKKHIHEvHG3nXTxP1PlQspCYo+knQSZ/r4By3eoLa9c19qr7bRZjXcrwmJ2fir+v3Ops=
X-Received: by 2002:a19:ca13:: with SMTP id a19mr14186914lfg.133.1572819812751;
 Sun, 03 Nov 2019 14:23:32 -0800 (PST)
MIME-Version: 1.0
References: <20191101015621.12451-1-chris.packham@alliedtelesis.co.nz>
 <20191101015621.12451-2-chris.packham@alliedtelesis.co.nz> <b681ed9d-a31a-e5cc-04ba-6f38a5cc745b@gmail.com>
In-Reply-To: <b681ed9d-a31a-e5cc-04ba-6f38a5cc745b@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 3 Nov 2019 23:23:21 +0100
Message-ID: <CACRpkdZ6xOmRUnNCRBAPak1Q_g9WSNYKGpLeU-ajroUbB_gSeA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: bcm: nsp: use gpiolib infrastructure for interrupts
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Nov 2, 2019 at 3:55 AM Florian Fainelli <f.fainelli@gmail.com> wrote:

> > +             girq = &chip->gc.irq;
> > +             girq->chip = irqc;
> > +             /* This will let us handle the parent IRQ in the driver */
> > +             girq->parent_handler = NULL;
> > +             girq->num_parents = 0;
> > +             girq->parents = NULL;
> > +             girq->default_type = IRQ_TYPE_NONE;
> > +             girq->handler = handle_simple_irq;
>
> It might be worth creating a helper that can be called to initialize all
> relevant members to the values that indicate: let me manage the
> interrupt. This would make us more future proof with respect to
> assumptions being made in gpiolib as well as if new fields are added in
> the future. This would be a separate patch obviously.

I have some different plans for this, but first I want to pull all
struct gpiolib_irq_chip *girq setup over to the new API,
so I can get rid of the old helper functions.

First chained variants, when that is done, threaded variants,
when that is done abstract this type that is using its own
parent handler and then eventually delete the old helper
functions.

Then I can think about adding new helper functions :D

Yours,
Linus Walleij
