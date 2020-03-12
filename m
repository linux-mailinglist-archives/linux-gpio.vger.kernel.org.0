Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4324182AF3
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 09:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgCLIPs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 04:15:48 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42789 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgCLIPs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 04:15:48 -0400
Received: by mail-io1-f65.google.com with SMTP id q128so4743003iof.9
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2020 01:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SbKHysQUbZ/dh7ia72ifq4ypokfVjTOV8KRXEk2mm6E=;
        b=HW/3yzeGLwYUzKgBotCvQil10b5k3PMgnqNLNwh4LYMxBBipDNZnTparjCBsw75jmT
         LR9bPRQUyiMcBVQ35pZ+4gCO0TFQgxHSKGUJ4J6wd1Muuemsw5Rv5KJk4mRF4r/spil1
         kQ8MTVoYKrKO+mokZ0szhFARBQvPl5m6Mld7cpaKjIh9gSb1g3NlBBOgjynzb2UJlx2u
         Wnaiv/p6g90hBTsTSECFMiuM/twzlKLd/W9nDKBjg82bdFJvQB28bdn5t69t6p861hjA
         CuscM4BElkTTRIkaN0VRMuHvM/RMrtXYwHOo9RFcCGDj3w+tzVDHE75cJvEgoBVQWMPC
         4zbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SbKHysQUbZ/dh7ia72ifq4ypokfVjTOV8KRXEk2mm6E=;
        b=HU6Im04Py9vs0ubkwKYYnnEckKWMIgAurdk2xDU1pcZBvf8RiMynwRzGnedQTTxcnq
         04cBnizwIJHHIwBVii18Cs/a2ZEXXHjzHvDnM+j+05lDtPQARKY645F4cqHompBHr4jL
         o+5uXTU4bDvb/qxqzVniOFNayOHTH2djcLs4tC8BN7nnH6uakFhvai7BXQkcwPuim2P2
         MypMl71TNUmj+YAodXcEEVcWkq6SwNiCzhr6Qut/ikLg5rogZo1JqA1C1gImNpaUtS9y
         OgHEEmu2nJfBkLFQIArw8ob/9gbA5BJ0+0gOOr3VjSndGOlfqYVUuj/1GQOfRsr1Kr3y
         mKwA==
X-Gm-Message-State: ANhLgQ0dC+dx8eEsn7nWRn4CdKV5Tp2aLbl8zwCPCt2wWfMs/+6Jl12U
        /AyvJBocsdwMGwK4L3cpjP+OXOGeE1n4LVFK3XCwmw==
X-Google-Smtp-Source: ADFU+vsJK2Pg25haw7j27ecIOeODy3FgQxTo1Tl+FnV3LFLR4OX/Io9NTwxxprxHSAuuuRB9Jd4i/CNZrzCHWMxnj0M=
X-Received: by 2002:a5e:c70c:: with SMTP id f12mr6552071iop.130.1584000947547;
 Thu, 12 Mar 2020 01:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200211131240.15853-1-brgl@bgdev.pl> <20200211131240.15853-4-brgl@bgdev.pl>
 <20200308135117.7c60c881@why> <CAMRc=Me0AE7OgEVjiUfRUNODYoGj+LYy+1zGsGkXKput9AeKrA@mail.gmail.com>
In-Reply-To: <CAMRc=Me0AE7OgEVjiUfRUNODYoGj+LYy+1zGsGkXKput9AeKrA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 12 Mar 2020 09:15:36 +0100
Message-ID: <CAMRc=MdsQbm=L8sjJhnCcW+kb3UHHneSGqgCbTvWwsenCeMwxw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] irq/domain: add a new callback to domain ops
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-iio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

niedz., 8 mar 2020 o 18:59 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82=
(a):
>
> niedz., 8 mar 2020 o 14:51 Marc Zyngier <maz@kernel.org> napisa=C5=82(a):
> >
> > On Tue, 11 Feb 2020 14:12:37 +0100
> > Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > Add the remove() callback to irq_domain_ops which can be used to
> > > automatically dispose of any host data associated with the domain whe=
n
> > > irq_domain_remove() is called.
> >
> > I have a hard time buying this. Whatever data that is associated to the
> > domain is already owned known by whoever created the domain the first
> > place.
> >
> > Since the expected use case is that whoever created the domain also
> > destroys it, the caller is already in a position to do its own cleanup,
> > and we don't need any of this.
> >
> > So please explain what you are trying to achieve here.
> >
>
> I'm mainly trying to remove irq_domain_remove_sim() and make it
> possible to destroy the interrupt simulator domain with regular
> irq_domain_remove(). If you prefer that we retain this routine as is,
> I can limit this series to the first two patches, but I assumed the
> fewer functions in the interface, the better. If you have a different
> idea on how to do this - please let me know too.
>
> Bartosz

While this is being discussed - are the first two patches
uncontroversial enough to make it into v5.7?

Bartosz
