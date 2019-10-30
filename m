Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 696F0E9935
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 10:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbfJ3Jd4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 05:33:56 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35805 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfJ3Jdz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 05:33:55 -0400
Received: by mail-lj1-f193.google.com with SMTP id m7so1872648lji.2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2019 02:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9FaMbIuUnATFvYypP69k7V4953tKf5UNxzpiowBIYTA=;
        b=DC3e+WBeQhrMlfNA3klze+1WpSFUMG1hWnCKj+7NNiQCu1/ypk2xH0YeVmYUA0JzVu
         PgxlZnUK5eAVr3ipZ9a2ZtxBGccVu+7h9pdzVi7ssH5w2rMBWSJalmRLRZ85npWY32dX
         wgzy4NfHC8uwb41wSlV1qzmLeCAWLLKS+RNmqyhbn68skdnxRMf7B2FPbLvZX8kZntmM
         4p4LorMztjEBQF/Fz0+wa5WDVXfpjH6WWlUC+8MhPmDBwamlZxj3dUT4Da7NjxVPFKvP
         BzWPAsswXXTwLEyb7ngnYDVi1mtG4izR2wWyPGEbCmd7by4RJarxNnXdFoOIsBca2rah
         6IzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9FaMbIuUnATFvYypP69k7V4953tKf5UNxzpiowBIYTA=;
        b=f7x4AjOLKaGjsF2RhStMUlWx/f5bEsD09wLbNIMPirg0KeUPN1HJS+IkHDRKPRhrtm
         klYyb0CDLCPifJFcs/givb5+Wtvw4QyhYQJUGim20zJd/m5AJkURNGjamFCAFqTr7e4U
         wRPvjxdWZwO2X95W9tyy/dozeA4xcw6Zj/4Ukab53Oe9qjrNe4WdW3Dg6vT0TeOJ+ZMo
         oWEqOECENLNUFQV/K5XRCrH6yl9KQRtJCQQMpjHZIw3UknZydsqa0Pe7mekSDqQbxHz/
         zsrZaIlpJiA2G7URfQWE6EPbT7Z32JmZ7sQGQ0JKzJVbQ6goHBwSmTTWcxGZYJUx1sFg
         mWdQ==
X-Gm-Message-State: APjAAAXjg7DELlqmTFJTWy3Wp/ODeYaIMqchHXRymT52eQy2krqrCpVr
        eA/AcG16MWc+AQfNMOOCeNg2aUSvn1MHXp8WrMIn6/KopT4=
X-Google-Smtp-Source: APXvYqyKcoCzD8ijwJU9pjr9PSkYrzndSBq2UbskZ9do49zViYQPQbstZPqC2q99I1GXsScXSJ3A98GZ5e3o2Cin56g=
X-Received: by 2002:a05:651c:1202:: with SMTP id i2mr6012835lja.218.1572428032405;
 Wed, 30 Oct 2019 02:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191029181156.GP2593@lahna.fi.intel.com>
In-Reply-To: <20191029181156.GP2593@lahna.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Oct 2019 10:33:40 +0100
Message-ID: <CACRpkdb13GAqfMRYaGhcox47Jm52qXnBmjcQCEjXtyFWoHyWMw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl fixes for v5.4 part 2
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux pin control <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 29, 2019 at 7:12 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> The following changes since commit 260996c30f4f3a732f45045e3e0efe27017615e4:
>
>   pinctrl: cherryview: restore Strago DMI workaround for all versions (2019-10-01 17:36:40 +0300)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-fixes-v5.4-2
>
> for you to fetch changes up to 67d33aecd030226f0a577eb683aaa6853ecf8f91:
>
>   pinctrl: cherryview: Allocate IRQ chip dynamic (2019-10-25 12:54:10 +0300)

Pulled in to my fixes branch, thanks for all help, excellent work
as usual.

Yours,
Linus Walleij
