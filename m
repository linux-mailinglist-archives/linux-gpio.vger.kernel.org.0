Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49F6378218
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 00:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbfG1WjB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 18:39:01 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43675 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbfG1WjB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 18:39:01 -0400
Received: by mail-lj1-f196.google.com with SMTP id y17so32080930ljk.10
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 15:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t/9j/yxmeF8Pqa4iCxgaE6NdVglFbMeeDsyhpxD8WwU=;
        b=ypoCBkcIpo+tUbxNglus3ZODCy7vEu5ItPnwgXvJ82jLBY65hMMrCMShWWkeMmRKEz
         csGRd20tZk98tJ3+Y1vI1GioTuUPMHKddFh9c988UVUWwc0b0tLUlFFWX0dNlcdDTILt
         ct/u9LaQUY24VfN1auuKtLjkhi/f/oxT6NH2pZ/8GjgJYiopHo3lNGOuUy17DH61W3No
         nTmHJIGT15YT56ecEG3JdDoHdDyQhHmjfafUgQRaBPXU/ecynKFAkW2fYYoC9YPUaOkb
         9F0qBNpVsXpYi5cxVQiUaWVX23ZXWT0eIb54HAi6jVvQzHMvzupsZKicbghLkiRy8cbe
         htrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t/9j/yxmeF8Pqa4iCxgaE6NdVglFbMeeDsyhpxD8WwU=;
        b=CnIjEVEyIaFHsQiynBm6E/m/8mCEJck6oF+Xpezj0FCQ4rcOQTqnF0NPm2oEFgSl+z
         CKti+18G9RpmZXqLLq1Ep4nhlbojYyAVZmxaTOBRc2nbW9/dYoM//3p4G1rEG86jVOMj
         7MgqBaa90VvRQJjk5g4UcGCgcJhcFI+ROkZqiUsV3WLFBO/f6pKlFtubyxDonnuhybam
         LbxdIx+ny8gxaPu/YibHe6MBUfw8Dzt6vOLT2RQXkN4ys1gaYryGXB0J2wTZi6tPh35g
         1gxE3W0oUVm3cdKzCF0MbL1jcx1/bwn8dODp1oD0SUyj97czJHcztz7sUF2jOyxEVVhG
         StPg==
X-Gm-Message-State: APjAAAWtOTxfbEZ/rj9SxScNdkiRwIkPuKuAxhGHN8BwJbZnA0TAH26E
        JLnaNWEAi+tLnMnbsYQQL8ed6zGry7ZdsZ3z0NtQmWe3
X-Google-Smtp-Source: APXvYqxxRfAlq6Om3BISqeRGBQvNm5HBjikP2v0ljseK8IBwEt4DsqYNWZKqHEnN+LKmqlXVXLkXXKQfedcZFo7bfqU=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr8088189ljs.54.1564353538852;
 Sun, 28 Jul 2019 15:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190724083828.7496-1-linus.walleij@linaro.org> <20190724200007.GO7234@tuxbook-pro>
In-Reply-To: <20190724200007.GO7234@tuxbook-pro>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 00:38:47 +0200
Message-ID: <CACRpkdYuBoH90KBxTYizL4_iCiQ40JppfZ2HgHLfxgXi-t2nmA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Pass irqchip when adding gpiochip
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Lina Iyer <ilina@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 24, 2019 at 9:58 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Wed 24 Jul 01:38 PDT 2019, Linus Walleij wrote:
>
> > We need to convert all old gpio irqchips to pass the irqchip
> > setup along when adding the gpio_chip.
>
> Could you please elaborate on why we have this need?

We have two codepaths inside gpiolib depending on if the gpio_chip
is passed in along with the chip like this, or the separate calls
to set up the chain. It is a maintenance nightmare.

> > +     girq->default_type = IRQ_TYPE_NONE;
> > +     girq->handler = handle_bad_irq;
>
> It's been a while since i poked at this, but I think it's fine to change
> this from handle_edge_irq to handle_bad_irq.
>
>
> So this change does looks like a nice cleanup to me, but adding Lina wrt
> her PDC integration patch series.
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks!

Linus Walleij
