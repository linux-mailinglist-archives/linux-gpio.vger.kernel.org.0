Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B386DFBB5A
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 23:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfKMWFd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 17:05:33 -0500
Received: from mail-lj1-f179.google.com ([209.85.208.179]:41587 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfKMWFd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 17:05:33 -0500
Received: by mail-lj1-f179.google.com with SMTP id d22so4337875lji.8
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 14:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a+F9yIC916UCYgpD6YwmQTh4cUaRV6VijH4p/JXMPHA=;
        b=N2f1tq5hHGRyo8t7W03GCULnREam+nL5r42ls0xfv88crPtxKsWn0rTaWYrekP1Mj1
         /Lw2bl4EDoJGXTchApy18T26t3XijGzIDAo80G+D3X36pzpUNg/AnSIqXeMLAZKPA//T
         D2dow6RZuV71EKjuZpjsV6NVTkjRAjqoTy6Tvar9WkXykyHlBVmT/pZHDebSOAtE/fPD
         obfWtswl7tcKX13w6o79/ZeVuprWUhctbmAREpDaKSd1uWksELJiuhs3HV5nc+hzI/Cd
         bo1ve2kUAop49CEVL+iDK/IDVN/ZQYMyO2fkJEr/lmpbocWOF2D2y7WbUk6S5xb1DpUm
         bVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a+F9yIC916UCYgpD6YwmQTh4cUaRV6VijH4p/JXMPHA=;
        b=K2rXo+T++ajfw+2xXpTC3uAkt3rbgFIZ1wV3W0VHtvb6QMrgDkx9cfzPr/PFzGLLX2
         nIOZ9mSJL7shhrBYPeIXJylhF2NW6Bu2bhU7Qh5/Q14kzRpuyPHUSJ57qxr13qlDeFif
         9F2klouRDvtO3G3Y8wo5R9njquhjc4qOa4MFiHHvRTOmb5NBb63n/4QYVE1T8kM6vO60
         W1DX6h1diJ4nRysZmD0sKUuF8snfF/lhH5YHX2ZxsK2UbNtGsFM3STDN7Ksajm25JsYc
         MnoI451BiSeoEUGR8+v02w+++DJaiBLnTSkDtkksv/DA90NqSzBJGWNZnR62JtmuRATH
         9cyw==
X-Gm-Message-State: APjAAAVw6De0oRryoB3WtJyAFHTzG6uuPchoaCuoDi5f9NRSr8EqEF/Q
        xn0W6ZEvIVpl0+9BjYXUIwQFkLHgy5PYz8I+iE82w6GpGDk=
X-Google-Smtp-Source: APXvYqy5axTlBFBgF0Y92isbtb51hBDGeBYjcwjCh/6l1Va1h6+IpSVuaqJjeygUEZc/e0g/ouKsTQF/hixdoncMY5k=
X-Received: by 2002:a2e:9784:: with SMTP id y4mr4207657lji.77.1573682729613;
 Wed, 13 Nov 2019 14:05:29 -0800 (PST)
MIME-Version: 1.0
References: <20191113133614.GA18356@black.fi.intel.com>
In-Reply-To: <20191113133614.GA18356@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Nov 2019 23:05:17 +0100
Message-ID: <CACRpkdbko3Up5i+yrMKfso9BTommn0VCgb2T=MFviqw1KQyJ1g@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.5-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy!

On Wed, Nov 13, 2019 at 2:36 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This PR is done against gpio/for-next due to dependencies.
> It's for v5.5 cycle.

Excellent, pulled into my devel branch, thanks a lot for fixing up
all these things, and thanks for maintaining these critical drivers!

Yours,
Linus Walleij
