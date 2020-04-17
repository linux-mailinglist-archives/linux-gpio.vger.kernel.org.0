Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 735841ADD68
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 14:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728434AbgDQMiA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Fri, 17 Apr 2020 08:38:00 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40523 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727877AbgDQMh7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Apr 2020 08:37:59 -0400
Received: by mail-ot1-f65.google.com with SMTP id i27so1268123ota.7;
        Fri, 17 Apr 2020 05:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Gwu1rFcuaic1j0b6tK1OdMvf4DIWDJJOupEm/uBluyw=;
        b=p77FKrWHgF4FIdK7TuirX8L6POd6bPjWItGc104acxj8tzP4FtmSHkC72U6ChOuTkP
         DPFr9DAzw0eQxg3grNP8ziWLKNWZpFHs7f9v1oyBYwaCR338LqLzLuLwq5SdZ55Zpu7Q
         G+Ey70ikFb+pFuBlAATuoDRfn8ExPBoYNxrtUJS53AeTHrIT644np1Df5iOS8qRxfhfq
         Xgv8A/9IRy8jnisjzyaEDla/VHH7IOTRIw6cS+NoWB+Pqs9gstNZnhGmr35m0xaBMcGS
         KcUxbaw8pVmPVMvEE9sTVBaXbVz70AAplFlxZimYA3x9VDfdncG7BmOxUDVEUz4bKfNf
         np9w==
X-Gm-Message-State: AGi0PuavNX8qNg2J9aDo7lC+mxymnXtUEYYVVZyhLlX5Hh/x/bs5GUqM
        1+daKWupSWYSwZ5fhQo0CVo65Qlsow0IMxbDyTM=
X-Google-Smtp-Source: APiQypLH513kInQi94pjVMVTzvh2GL8EhQEu0a2cOU4WIN+0CSJv01ivUMKg7HsqNp4texpcEl/7HQn/KQRzhYeGXnQ=
X-Received: by 2002:a9d:6299:: with SMTP id x25mr2206719otk.107.1587127078809;
 Fri, 17 Apr 2020 05:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200417111604.19143-1-yanaijie@huawei.com>
In-Reply-To: <20200417111604.19143-1-yanaijie@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Apr 2020 14:37:47 +0200
Message-ID: <CAMuHMdUF-N+TpYHwQTJkOBOoqFVpa_zK2VM-C-qxkvYif-aqrQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rza1: fix wrong array assignment of rza1l_swio_entries
To:     Jason Yan <yanaijie@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 17, 2020 at 12:50 PM Jason Yan <yanaijie@huawei.com> wrote:
> The rza1l_swio_entries refered to the wrong array rza1h_swio_pins, which
> was intended to be rza1l_swio_pins. So let's fix it.
>
> This is detected by the following gcc warning:
>
> drivers/pinctrl/pinctrl-rza1.c:401:35: warning: ‘rza1l_swio_pins’
> defined but not used [-Wunused-const-variable=]
>  static const struct rza1_swio_pin rza1l_swio_pins[] = {
>                                    ^~~~~~~~~~~~~~~
>
> Reported-by: Hulk Robot <hulkci@huawei.com>

Fixes: 039bc58e73b77723 ("pinctrl: rza1: Add support for RZ/A1L")

> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.8.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
