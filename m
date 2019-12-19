Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D35B61262DC
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 14:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfLSNFb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 08:05:31 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:40905 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbfLSNFb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 08:05:31 -0500
Received: by mail-io1-f67.google.com with SMTP id x1so5639681iop.7
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 05:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Q9IeE6+mers9j/OTuTOGvwYflrrqr9t/fsIYndVowUw=;
        b=L3/0EauOaRXnR88vYq71/LZuB5X8fi8V4T9P7Y8BksHjUR1VmgUIyzH8N9otJVP39S
         C5DKgTkmjx6iGzEMHfbR28APeKZRZdwISL6Q3QH80MHdTcGvOkaNERNMASgVWec4AndB
         SrvMy+vxnIfJ+ByFZvfzYjNgcKIRR2PIk3IqwlOyDjXiZsHuqWHTZ4+g+eBdIEnEa/lt
         YmbduU7AfrJoOjtx6HrfV5PemPZtGTKDNOdWrrnXo5jj4Jm1AIaWWXGDnhRGAnMCQo2h
         voqeISJ0leERTeUR8Cvz+2Yo+kG/3ETbDq5dI3/vjcYZtGzG2sDr9/OY04+2JlEEyFR8
         pdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Q9IeE6+mers9j/OTuTOGvwYflrrqr9t/fsIYndVowUw=;
        b=Kq1w58r21HzjifYPvbrUfeQ5mdD0YVTYK/bLB8FIy+bLrll2H7wtPQpWLGZ4hklBCM
         T0dAkSEyljI3vryEopRL3gs0LCccM7RkgivKd6Vy32pCXt7iUxXwBvgjhJvMNHCiq+u0
         tZOCP8Qso5CxrHqOc28luChL1z28xp/co0Y7XoTPR+I8tHtfvjCtoI5SVyr4cb1Fsemx
         nghF9wPpsT/3xahgMuJwfx5VdJh3r7DFnLCkGyRgJksQNZij3n39GVZxmVfWizz6mwgO
         5G9PBuojX3UR5kyLPoJFtzEx6loPiQ4FWK9wURgrszm99ttSIfzM+5hPFGeTg/hbKTNu
         50DA==
X-Gm-Message-State: APjAAAXZIE1C8eOu33gS8lgp4jVETKSMCfi8jkEz+KH8lBEvBUle9ZBr
        aBXbKKYWaTS5m4hrMY/Ot/CQtfT7JmUQyewTBlnzLB8/
X-Google-Smtp-Source: APXvYqy3xlLDr0/gRQDpMAxQavF9FnYrp/wUuQlcsVkS1ys9H2j774s8xBfPSlE5CcdpyDlWi8Wv2BNMMsJlu8yk57o=
X-Received: by 2002:a6b:fc0c:: with SMTP id r12mr5436644ioh.189.1576760730506;
 Thu, 19 Dec 2019 05:05:30 -0800 (PST)
MIME-Version: 1.0
References: <20191204155941.17814-1-brgl@bgdev.pl> <CAHp75VdiAtHtdrUP2EmLULh86oO37ha8si10gFKYRavXCEwRRQ@mail.gmail.com>
 <CAMpxmJVXVVVMPA_hRbs3mUsFs=s_VtQK9SvvYK3Xc5X27NPTKw@mail.gmail.com>
 <CAHp75VfXc88Fa6=zs=9iToz27QdXHqRCDPQwBPs2P-rsBF8nHw@mail.gmail.com>
 <CAMRc=Me4xWsQggmr=BvJrA9-FnPkxFkOYsRTsSXCtyNwFnsHNw@mail.gmail.com>
 <CAHp75VfzP8-0wKmPTTKYe+fc6=r_4sVcJPyOsM8YTuH=i4rxmA@mail.gmail.com>
 <CAMRc=MfxteQDmeZn_Et0uFs2cPvLGpJ5BTeBOn37o=2Oo_eU=Q@mail.gmail.com> <CAHp75VfeEB5RudwMaoiMTMMY3zW-kz-h=rJ3Cu5_tyRL6ZuF1w@mail.gmail.com>
In-Reply-To: <CAHp75VfeEB5RudwMaoiMTMMY3zW-kz-h=rJ3Cu5_tyRL6ZuF1w@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 19 Dec 2019 14:05:19 +0100
Message-ID: <CAMRc=Mcy=Q+9Eb6mb5JEq+CCbxgBY1CfTDsYj1Rt9bcLXgeY=g@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] gpiolib: add new ioctl() for monitoring changes
 in line info
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 10 gru 2019 o 18:00 Andy Shevchenko <andy.shevchenko@gmail.com> napisa=
=C5=82(a):
>
> > On a different note: why would endianness be an issue here? 32-bit
> > variables with 64-bit alignment should still be in the same place in
> > memory, right?
>
> With explicit padding, yes.
>
> > Any reason not to use __packed for this structure and not deal with
> > this whole compat mess?
>
> Have been suggested that explicit padding is better approach.
> (See my answer to Kent)
>
> > I also noticed that my change will only allow user-space to read one
> > event at a time which seems to be a regression with regard to the
> > current implementation. I probably need to address this too.
>
> Yes, but we have to have ABI v2 in place.

Hi Andy,

I was playing with some ideas for the new ABI and noticed that on
64-bit architecture the size of struct gpiochip_info is reported to be
68 bytes, not 72 as I would expect. Is implicit alignment padding not
applied to a struct if there's a non-64bit-aligned 32-bit field at the
end of it? Is there something I'm missing here?

Bart
