Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06D2C1321B9
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 09:56:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgAGI4p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 03:56:45 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34745 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgAGI4p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 03:56:45 -0500
Received: by mail-lj1-f196.google.com with SMTP id z22so49066150ljg.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 00:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ctj6sikyhwaxqLLgtUVE5aDnj2N4KcBorQ42k7PIXFE=;
        b=dOcuvdscd1a6LSt1ycJxEnJtA06EpOT3zVFcM9CuC+STEKRX6gdjAFLEgdhrjo56oT
         eqlE+eum4FXjJcxuMt935FoL3hoGfTzbWD1I47w260OqThGmNaK5cFlavt8AoR+OwigK
         2befC3q21eprd/82HB4DZ9akLqFZJIfo9PjBcdn/J7hg3Oya9jt1/81VaNtUG1RNsMqU
         1qlAuDUcIQCk4gAIdv+WqeqQ3Kjkb8Z/Ch1wExNjDBA+XURQTTUA78G9lhr6dfYlE6ns
         RMR+5UGTYgGBCYFk/erI4/5F0XDIKZZOlsimzhiYWNb22oLyJ9PcMt/Cc/e1435qo3p7
         1EvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ctj6sikyhwaxqLLgtUVE5aDnj2N4KcBorQ42k7PIXFE=;
        b=oj6ega+AfLBlvI+DxTqGhJNIyqsurzLSNWQfs9YPCaFInj8VFSAewZBMaJ8Q9hNUvw
         owT+j+NeO1g5kNgAAHntAsZVED9TBJiCMgr5WDhqfr9x1NMAH2wpYE3xKbQOHmH6lrdM
         Etg4u5rGZRKN+KvZ2xZ2adLfOskAz4Vomjq8+l1nCuixhwiYpKdDbNSNs19J2Jl0XjRH
         lvdUBZyZbr97vH0VPihSwaZE8lJ+rL8njnJQmm3nd0WaAqrGicPfz9Nh8mB4j+AY325v
         xkWGMjTHQXQCk4LbgtWUsGC6/61gSBuWZw7adMVB8t/aUrIISRZmQ0U0pgdgQGKtEhSo
         uQNA==
X-Gm-Message-State: APjAAAX5HulOj6ndP7Agc9WQUDY8OqNAV/BqzdffHiPhLovqYKiX2aDG
        x1wsRYHR1OxJtT4iWesqSvHtQmKnv0zPBfZ0/C6vLg==
X-Google-Smtp-Source: APXvYqwU4UwpfhwoGurh/0gW0myH1xF7IqVAA3/tnxBcBXUobTlgEPrEorcKTT9po95usIsDhZrUIHThQ6qDlOdGasw=
X-Received: by 2002:a2e:9587:: with SMTP id w7mr60111635ljh.42.1578387402873;
 Tue, 07 Jan 2020 00:56:42 -0800 (PST)
MIME-Version: 1.0
References: <1576672860-14420-1-git-send-email-peng.fan@nxp.com> <1576672860-14420-2-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1576672860-14420-2-git-send-email-peng.fan@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 09:56:32 +0100
Message-ID: <CACRpkdYqen88nJU9VtpTKmPShCAzTK+S=im4zeWjU45m766o3Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: sunxi: sun50i-h5 use platform_irq_count
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "andrew@lunn.ch" <andrew@lunn.ch>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "wens@csie.org" <wens@csie.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 18, 2019 at 1:43 PM Peng Fan <peng.fan@nxp.com> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> platform_irq_count() is the more generic way (independent of
> device trees) to determine the count of available interrupts. So
> use this instead.
>
> As platform_irq_count() might return an error code (which
> of_irq_count doesn't) some additional handling is necessary.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

This is clearly nicer code, patch applied.
(You only need to reiterate patch 1/2 if you decide to
keep working on that.)

Yours,
Linus Walleij
