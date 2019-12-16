Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 225541202CE
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 11:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbfLPKjv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 05:39:51 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40096 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727391AbfLPKjv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 05:39:51 -0500
Received: by mail-lf1-f65.google.com with SMTP id i23so3829731lfo.7
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 02:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eASUinPkaGZJHOgTIA6SaLKdBIe8ndKbRshIZuG4fiA=;
        b=gvMSEBB0eZnELFRmfIx+0Ef0369plyPv8mYJq1s4eaHxkEkW5VnmgwqeNz355t5TWl
         Sn+cFXB4DxEcHvFWI7u/LfZeMLEGqNlsyCnYcJp8bUraj4vhcVxezg0Dn86FM5UNxnmh
         FSOaLsLlCJHiE9/5Ins+lr6SDTlu88BPlvJwAG5AP7SlSiidb78l00dSDAhzJgtSnvX5
         lTut3TUCJ+O23llKsTL/fihV3fyGQQi4mkfQGkB5hadELN9w1ha3rPKL11fECr8lzCP9
         QhiWKUdJmBL98fMhEP1w1sU2at2NGKzQISN0OMgUzUCqFicb2X5kh7CXV543rRcmPfHq
         xygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eASUinPkaGZJHOgTIA6SaLKdBIe8ndKbRshIZuG4fiA=;
        b=O+FTfiu4oFzGkMYmGXiV+7koqXtPEzRhGnXUCx3DIlWdsTVoEb2+tnOVBLbF29lhnQ
         o3fmmlE4EUG1L+rZnZ9SISAaHfUbfsUyggzxhBeBwMqpqJ8Iw343ymG1okzITmZbVgYg
         d/YDCqFAsaUrDb5UsqSAYYpGkKjCC4kpWhyDq288nfQjL5bseaez+3vG53ncdK9s4f+t
         mAog/jq8gps3qpnntuvuvll38XtJQo3Eg5VA2kKnV9D8wdHTWfS0sjfr7lFnyjolbRnc
         QMgd0sL/G7EYXCwvGAAZbjosEWzv+PcgTGL6ISWqEw/m3LTe9L9LZ1tC7fNXosEy6F4c
         2UOA==
X-Gm-Message-State: APjAAAUamgr36zONnySfBDTZ3LV+OFNSUixRHdgFXjuXkAh2WWYZDYeX
        lB72U+QvGjr0D2QMODFe64hgvC9NqLxemGgQsOkjsBM+DzWO8Q==
X-Google-Smtp-Source: APXvYqxzt8KKeZI8wgfcQPj0YZ9QX8xthNB6bqmMjGdR0Pj43hONYwxcydmJ2yGX9OFyPLBM5DVYrwUa2gH8n7yfSjI=
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr15930092lfp.133.1576492788774;
 Mon, 16 Dec 2019 02:39:48 -0800 (PST)
MIME-Version: 1.0
References: <20191211192742.95699-1-brendanhiggins@google.com> <20191211192742.95699-2-brendanhiggins@google.com>
In-Reply-To: <20191211192742.95699-2-brendanhiggins@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 11:39:37 +0100
Message-ID: <CACRpkdaTJej2zFX0y7mAYymBdGNvHpp3VyU0kOd=ScA_gMAf-A@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] pinctrl: equilibrium: add unspecified HAS_IOMEM dependency
To:     Brendan Higgins <brendanhiggins@google.com>
Cc:     jdike@addtoit.com, Richard Weinberger <richard@nod.at>,
        anton.ivanov@cambridgegreys.com, linux-um@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        David Gow <davidgow@google.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 11, 2019 at 8:28 PM Brendan Higgins
<brendanhiggins@google.com> wrote:

> Currently CONFIG_PINCTRL_EQUILIBRIUM=y implicitly depends on
> CONFIG_HAS_IOMEM=y; consequently, on architectures without IOMEM we get
> the following build error:
>
> ld: drivers/pinctrl/pinctrl-equilibrium.o: in function `eqbr_pinctrl_probe':
> drivers/pinctrl/pinctrl-equilibrium.c:908: undefined reference to `devm_platform_ioremap_resource'
> ld: drivers/pinctrl/pinctrl-equilibrium.c:223: undefined reference to `devm_ioremap_resource'
>
> Fix the build error by adding the CONFIG_HAS_IOMEM=y dependency.
>
> Reported-by: Brendan Higgins <brendanhiggins@google.com>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>

Patch applied but I augmented it with the recently added
OF dependency so it now says:
depends on OF && HAS_IOMEM

Yours,
Linus Walleij
