Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 098EA1326C7
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 13:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbgAGMzk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 07:55:40 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33245 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727730AbgAGMzk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 07:55:40 -0500
Received: by mail-lf1-f65.google.com with SMTP id n25so38817256lfl.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 04:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/5M/Ch2CKDQ814/TnFy5fo83NcxCpktzh+5pz++zFSA=;
        b=AEgy7ABR047DoLjVm1VO0WwndfqDMR7kB3D+0j8w9A6HDCfcOm51PX/oqmApgcFxD3
         PzDu3j2hDWa7nH3TzAI517R6JqnBHA52XvUN2mmJjhEfVTU06u7/K76rmzjQoGqKOT1w
         Cppn6/Y6kCgDnYae6PKPxT7a64fF9aEcAyvXIcx9q6Fc73emY3ZpIRrxApElzeX7qX2B
         Yfjz/EWvd8PkFd/7F4Mvv5eFqxG4t4eonMSAVE7GXnEtV6u4Z0MjRNWbXXTA8tB4UIlg
         +PGKIr1r+Ay4fZQov/DS0z6MzKi61kxcpE3KtW7XSMGyl1gj0nPhISsArIhce5H1nJux
         aTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/5M/Ch2CKDQ814/TnFy5fo83NcxCpktzh+5pz++zFSA=;
        b=pTdWUAHyD2I8yJymhDI1dMASJEyGViEoY5ebLLKtFC8JZlMq7YKEEusfqvJW2UtMS9
         51v/3wqodG18jqLkXh6FRbylm7tLsN18nHoKyoLVjzu4XPFXOeA5ma/0TofKAR02OtUz
         V5wdBeRlTfGnknoMZlzVrXUCLzz+8hZAtFEUMRlRfmcKRcSVbbD2nw7qvxxMCdvPUse6
         5F+kA8hQTcLgJQN1yNpOtN0xlm8qtphm1Bk1Jm6n81HfqJTvORkK/Jidkta6MtkHkfUW
         Zetc8Wh6uPtiydgEmj+20zrWyr7mLS4RJIcoEOV7Pe+UZQsH+i0lrhSIotTffuefBI7b
         KmaQ==
X-Gm-Message-State: APjAAAVaoX0kf60GVUQutffhAdZhqXdDNR37wZuXD88uR26+BE3enZf8
        bOOYUWjvi7SVK4KLjckw3CGLKPXVB3GYTQ2vLQS1Ig==
X-Google-Smtp-Source: APXvYqywW+1cO2Qz4LzNkTfh2xOv5aLJq+BCzv7q5D/XXcrloWHW/cXsbAUd1IJYb+6RnSPN6O161babyzIRRq1xBFE=
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr58716304lfp.133.1578401738382;
 Tue, 07 Jan 2020 04:55:38 -0800 (PST)
MIME-Version: 1.0
References: <20191227230447.32458-1-hdegoede@redhat.com> <CACRpkdaR4vFp=huuqvsnZTFnAmKNJmjpwM8sPpVX2aERp-LogA@mail.gmail.com>
 <20200107123841.GE32742@smile.fi.intel.com>
In-Reply-To: <20200107123841.GE32742@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 13:55:27 +0100
Message-ID: <CACRpkdb5viFXj9S9nVU-p9ZFva1bFns83FrpXdFJHsnJMtomuA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: baytrail: Do not clear IRQ flags on direct-irq
 enabled pins
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bastien Nocera <hadess@hadess.net>,
        Dmitry Mastykin <mastichi@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 7, 2020 at 1:38 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Jan 07, 2020 at 11:35:17AM +0100, Linus Walleij wrote:

> > Patch applied as non-critical fix for v5.6 with Mika's ACK.
> > (Tell me if it's critical.)
>
> Can we collect it in our tree (what we are consider a proper for this) and
> submit a PR?

Sure that's true, I dropped the patch from my tree.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
