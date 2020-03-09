Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC38017E302
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2020 16:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbgCIPDl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Mar 2020 11:03:41 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34979 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbgCIPDk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2020 11:03:40 -0400
Received: by mail-lj1-f196.google.com with SMTP id u12so6109664ljo.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2020 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=60I0dJLVgvesjlRdADndse4fCiuUHqW4MeJ9mZcs2iE=;
        b=jl72Qce2OLxZ5tZk9oBt/x/9/WVKwPY+lV3y0lk57qZKjsbO/qY5FQ6xldSAMLCYAm
         R1/3MDvO3mIzqS6FmGGqBd2LVg8DnqLTEjUzDGPiC+jhy++h3eyk1GNRqGw0MC7NqSPR
         S75G15YAhhG7ImcoyxpjL4EgiTfrz2pRGTnzhgm+P5SS8VY2jwes89+SS60d7ltdWnAt
         835bf3OpWVZmgICA/u4NRpKVH1uZhJuSUgosIVR793LavVJRnuG2ZFSTTsFjYOwcg+cp
         SaDZKujcZNoI/eOsPWPKldktQq7IPRvWu6CSiddDsd/Xtpzane12WwA7bovD9SdQ7lhA
         tSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=60I0dJLVgvesjlRdADndse4fCiuUHqW4MeJ9mZcs2iE=;
        b=AuYpOgPr3BEHcSDjjppPZU96YGrqUfqZDMnpuaW4NjXQDG5u+At/JXdKNN3QiEhAnV
         ixX3nmNgENt7MW/y48pLaG/JX3H5qqH1TY8y/S8Bt/OPFI3iCmP1ikaAAZqr01HxO3CI
         MKfzS7XHN6fvOtGeHJbvJsqQgZkNu7smMa5pN1zCQrDgnjCS3jWO8MsHsY7uY4Ykbo3r
         fsnpjt92PAuZxPqgsLDnXU0so7QVl4j2eeMe/KTDn91jRGpYxohHutFhql/Rt/5RN7lr
         u9GzK5cj6ZWLsZIV4BKEM0cP7WRzVPIQacYt9YvC1U3jAM4WfRPrD2OhNaFkDN42f5Cq
         HIrw==
X-Gm-Message-State: ANhLgQ3z5MES+O7m0lz+QTjL+gmh2N5wAbg6tbfOGQVsNGar2G6XG3Bx
        fBkcn+QFhRuPZJSsh5ZO9NnESFeJGcoSkO1Rmb0mzg==
X-Google-Smtp-Source: ADFU+vt9jkmrIyzpB7ZpvnSjQiZyiwUn9LDNiF7f/+vCV18J3gc4EbD9apUGt2+Jc1REBefNpNPwdexa0p3vm7Z1h0s=
X-Received: by 2002:a2e:9a90:: with SMTP id p16mr6708002lji.277.1583766217426;
 Mon, 09 Mar 2020 08:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200309125207.571840-1-linus.walleij@linaro.org> <1be9151d00160ef26a3900e0e6a5fd14@kernel.org>
In-Reply-To: <1be9151d00160ef26a3900e0e6a5fd14@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Mar 2020 16:03:26 +0100
Message-ID: <CACRpkdamdgMh-z6AHqEptAw_o9JtCu1-RXDVWkqVJsoQTpc2NQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Assign irq_disable/eoi conditionally
To:     Marc Zyngier <maz@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 9, 2020 at 3:54 PM Marc Zyngier <maz@kernel.org> wrote:

> On 2020-03-09 12:52, Linus Walleij wrote:

> > ChangeLog v1->v2:
> > - Noticed that the previous solution doesn't actually work,
> >   the machine hangs and reboots intead (even if it got rid of
> >   the most obvious crash). Make a more thorough solution that
> >   completely avoids using these callbacks if we don't have
> >   a parent.
>
> What is the problem with disable exactly?

There is no problem with .irq_disable, the system still works
if I keep that. But since the original patch added these two
callbacks for hierarchical I just moved them both to be
conditional.

The .irq_eoi callback is the culprit.

> >       pctrl->irq_chip.name = "msmgpio";
> >       pctrl->irq_chip.irq_enable = msm_gpio_irq_enable;
> > -     pctrl->irq_chip.irq_disable = msm_gpio_irq_disable;
>
> I find it really odd to have the enable callback, but not the disable.
> What is the rational for that? Can we drop the enable as well for old
> platforms and only use mask/unmask instead?

Hm I'm just working with the regression, and before the
patch I'm fixing the driver actually had just the .irq_enable
callback, so I'm restoring that state.

Would you prefer a patch where I just move the assignment
of the .irq_eoi callback to be conditional?

I have no idea *why* .irq_eoi() locks up the system, I suspect
one of those irqchip internal semantics that are sometimes
not entirely clear.

Yours,
Linus Walleij
