Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80EA1167FE7
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 15:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbgBUOQF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 09:16:05 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42651 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728081AbgBUOQE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 09:16:04 -0500
Received: by mail-lj1-f194.google.com with SMTP id d10so2326393ljl.9
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 06:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9bkxUVE/BaGEsePvJG94FHSx4HKNwzho1ZimVG4ZU7U=;
        b=NHFJssvv1/a6TfSVnJMOtNTzSVZKMxcb+si901Fg2lUVauvB20CGGqCqJGgoe+1e1g
         Lbj4ou8rjIPF9xv9DKAYH90jZ+mObOp0rIjvZ7Dg9ySiio4iaK/btk0x2htCZeXbtCIs
         s/6iqp5Gry2+Cn6zijm95lF/j4t7ZzDSE8o0BWPX8/4eSxMP10r0KunPtjnJkN+cxZLS
         hrO4qp8YYuGoiQqOtGRt/oBkz38Qo3VLeSWUeTdL0KgCXOFPncrLa26IHW488Fp/bAVV
         JyVPUu8OgRqzn7esCc+CO76f3ej/1vpiQrHunvANngKpIiFP9V0rPnMltKixXQJd4lQO
         EcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9bkxUVE/BaGEsePvJG94FHSx4HKNwzho1ZimVG4ZU7U=;
        b=FS2EJf4BgNL17PWyjr0vIqAUJtwjUlk9CE84hUKHIgbbMcGzNuKLPKSMJI/8+IkMxz
         MNDdSQL/tiaOp8cC8K51Dje/ZNhwCWirSLl5pAx89pCpr26Wc6uzZNaltLwAaXIGeUj7
         /8IkXLN0UdrJa0l29iVb73dX7w90f36OMTynQFKYkZihvUlIfZX0h2j9zYfA+pf0PF1k
         W0etGj9JTOU9YmHOc2lrrIemcJXAfrv9HKvhNTfvA40MEntIfrS0zoOzunsnndBcTUwK
         rK2m1zLM5ruI/aJVWuv+oUgoCpBbP3UM0hUimbQoWVc63Zg4BGEvMzSwESa4mzZcJtLD
         4OGg==
X-Gm-Message-State: APjAAAVhrUkelklDgBKRSxuwuKz+8TVrE54oPi8iG+dAOMqhRPvfT/oa
        2x/ksKRBQF2gBYR52kKaHfi/++UbclYXZF+NBXn2dQ==
X-Google-Smtp-Source: APXvYqyMEW7xOoeU5aAqEunqkJEjZidoADakWQrFSuJrs2CPUv7HagGQ0QOJnoIk9QZdE7SPDJb+a06x21oCDVibGj4=
X-Received: by 2002:a2e:7d0c:: with SMTP id y12mr23122512ljc.39.1582294562607;
 Fri, 21 Feb 2020 06:16:02 -0800 (PST)
MIME-Version: 1.0
References: <20200117213340.47714-1-samuel@sholland.org> <20200117213340.47714-2-samuel@sholland.org>
In-Reply-To: <20200117213340.47714-2-samuel@sholland.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 15:15:51 +0100
Message-ID: <CACRpkdajokCMpJ98yfFp-s23jG96wO_N9R2ZXvXB+hU6XMs=ng@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: sunxi: Mask non-wakeup IRQs on suspend
To:     Samuel Holland <samuel@sholland.org>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 17, 2020 at 10:33 PM Samuel Holland <samuel@sholland.org> wrote:

> The pin controller hardware does not distinguish IRQs intended for
> wakeup from other IRQs, so we must mask non-wakeup IRQs in software to
> prevent inadvertent wakeups. This is accomplished at the irqchip level
> via the IRQCHIP_MASK_ON_SUSPEND flag.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Patch applied.

Yours,
Linus Walleij
