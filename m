Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E116B1355EF
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2020 10:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729750AbgAIJiv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jan 2020 04:38:51 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:41887 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729749AbgAIJiv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jan 2020 04:38:51 -0500
Received: by mail-qt1-f196.google.com with SMTP id k40so5314015qtk.8
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jan 2020 01:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2u8yX/6m8ka023+i3ocnOCOzpKH3BIMDen/cmCWdkZM=;
        b=1PwuSuSkQeo2awFeIpunataRcqxxnosFO8ylwONKpCfiRdEv2cMuQs1iPcpN39ve9e
         uVjH/aPbvGPFq8OavOOFJllWZHYTgp1MhtC8XftSjaXWezfpXGdWK5I844c8mx2xYCiI
         p7mugL6HvWl94X8/igMXHg4xsHF7undgc0pNCXTEBGCu6pRD472FMHh4BUXYkRTKJbMm
         KCkp8A17IH9xEnwOvI2pE1MNzKMo4RmJUZu148DpYF6hRQ1NDw4lLdbg7cdHcEksf+it
         JjPpkS5/lhlcQKNJ9Jjd0WoJCUdrPuZshMhwrF8bm7mi1HvxYCvaZjV7y2JvGSuRy2ir
         ADRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2u8yX/6m8ka023+i3ocnOCOzpKH3BIMDen/cmCWdkZM=;
        b=PgCJuOBF+VUohxtfj9lDx3m1krZvgCSEgfAym/1y8fw0iOm2Drr6CpdCulsdrzofoO
         aHcp2Xkdq0uYfbe8q2WBOd0LaM9evkqM1cxAuhnrQYBY9peq7FDdyjOISdiI0yHp1XK6
         gmtUm4Uuhh9tZzw6ReuTZh4Qfl3YrFqMZqk6Q+pCZWDpfIaFYzdO8DrhCqg8QIxl8WAy
         wwfxUvIGex+ksoTF0W02ZZQAOxC3HHuKv4+vC8zBV71uh2pt0VqFiqtOQpbsI1OAQX3B
         W0xxvVeO9s3q5LvKTfo+yPDg16xQOCv++jTnIFcMhfqL7JnUP4vpwZOvzS4FTXarKbOE
         77pg==
X-Gm-Message-State: APjAAAV4TzZAxHxx5ttvcqVHouxWe7RhibgpTV52slXvT6uitnxhBOPq
        ohFU1tdi1a5AvF6TbvpZpn/xkphohRlLCjDqTvihdg==
X-Google-Smtp-Source: APXvYqz2yXGoSQ7sbAosHgrWq7wGGl6W6TxGeK5uEo27I6GnFOmxS2ckbw/hoaEc3ak4D0wM+n9dhiGnP62y3LgUTHY=
X-Received: by 2002:aed:3b6e:: with SMTP id q43mr7032621qte.57.1578562730145;
 Thu, 09 Jan 2020 01:38:50 -0800 (PST)
MIME-Version: 1.0
References: <20200108161620.80105-1-joyce.ooi@intel.com>
In-Reply-To: <20200108161620.80105-1-joyce.ooi@intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 9 Jan 2020 10:38:39 +0100
Message-ID: <CAMpxmJUMhDeZ=EjjfNJnF+ikAfNq_hh2LP_TTnpoTb3oDMCCow@mail.gmail.com>
Subject: Re: [PATCH] gpio: altera: change to platform_get_irq_optional to
 avoid false-positive error
To:     "Ooi, Joyce" <joyce.ooi@intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        See Chin Liang <chin.liang.see@intel.com>,
        Tan Ley Foon <ley.foon.tan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 8 sty 2020 o 17:16 Ooi, Joyce <joyce.ooi@intel.com> napisa=C5=82(=
a):
>
> This patch switches to platform_get_irq_optional() from
> platform_get_irq() as it causes a false-positive error such as 'IRQ
> index 0 not found' when IRQ is not used. The IRQ usage is optional in
> this gpio-altera driver, so the error log is undesirable.
>
> Signed-off-by: Ooi, Joyce <joyce.ooi@intel.com>

Patch applied, thanks!

Bartosz
