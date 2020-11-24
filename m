Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD8F2C2005
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 09:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730481AbgKXIbv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 03:31:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727444AbgKXIbv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 03:31:51 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894D3C0613D6
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 00:31:49 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id y10so5563897ljc.7
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 00:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=16QF7XhShhktCs4QGKdZlDBAWyTS6RGhCF5bhmI9nIU=;
        b=XKQu+a7MWxQNywkc5tChjFZhLkTlwFMs4SacKOtS1zcg+S92ttYuFtCfH2ATOJ5Zjh
         6TGaoDqak3t/uLXBEbi/VvoQF8q5/L80yWskqa8quj529FfQIYsOlej1HXriY3wu0CyA
         KANtvB4KScmqfn/J6zPmZ+KqbFswnARpu0l7sG7Ace0a6SgPhTFNn7U0iX3pxswsJUEZ
         Kfzi2su+V9351kCnkcnPm5bYeaMy+ZS3M1IyBzJ29qtO6fvza7JEUXOU9S0X8+GFhN85
         2p8oI+li0YP9v5H72ERFnodmVpDMNM+r0gPWQUeApbiGMx9soN0ay+6I/5Pd0E2rAVxM
         U81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=16QF7XhShhktCs4QGKdZlDBAWyTS6RGhCF5bhmI9nIU=;
        b=Rnug7tojnpNTmGmgzQ7guazc/qcJ2oZeKN97eqpnXYgj1CNlz4pkFRyFKfIUIbvVYO
         CvteCp9fVExTDnAJd6vUuDO0nZlTQzryqp2iwPfP/L+inXzdr+XY4UqY/AfYIAVL1xU0
         QJczTDo+sQ1OrAJTC0gl7SjLRtPyRtAzQo29u59XFG/Z1vtX89gt5gXGtgq+QSmlkH9D
         mlX0CToWRR0C7gsDrTJzPzpSsO71JcsevoeyADhTQ/5MMjWZi+p92DhGOkilcMSiz/JO
         zUDKG4xtC9dUk3uscnWBTKZ53ZeXxKlmwTP0la5WECzvfadq1nKzr2uO6jwzKVJ0nWoa
         AjRA==
X-Gm-Message-State: AOAM533WDZQQ6+jLsQSS9N11Vqc7NvYweyxuaqZMURAZFNcshDrxyKnz
        zdEzvgFPPuz1D1YPTY08l0c7HxmeWe11+V5BXJES6XWtCcfVZw==
X-Google-Smtp-Source: ABdhPJzdm74z6S8plIzDqYnOXlksQUFMLdzxuDdR6uL9Sl8hgVbkjIYKdKpoHzgGULA/DXjfo2LC4401wFjtMge48fo=
X-Received: by 2002:a2e:93cd:: with SMTP id p13mr1315195ljh.144.1606206706953;
 Tue, 24 Nov 2020 00:31:46 -0800 (PST)
MIME-Version: 1.0
References: <20201113132429.420940-1-eugen.hristev@microchip.com>
In-Reply-To: <20201113132429.420940-1-eugen.hristev@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 Nov 2020 09:31:36 +0100
Message-ID: <CACRpkdYdPp_ihSEHkPaLa0_mcX+8ypnPZ4dn0d-PY9Mes1XntQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91-pio4: add support for fewer lines on last
 PIO bank
To:     Eugen Hristev <eugen.hristev@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     inux-arm-kernel@lists.infradead.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 13, 2020 at 2:25 PM Eugen Hristev
<eugen.hristev@microchip.com> wrote:

> Some products, like sama7g5, do not have a full last bank of PIO lines.
> In this case for example, sama7g5 only has 8 lines for the PE bank.
> PA0-31, PB0-31, PC0-31, PD0-31, PE0-7, in total 136 lines.
> To cope with this situation, added a data attribute that is product dependent,
> to specify the number of lines of the last bank.
> In case this number is different from the macro ATMEL_PIO_NPINS_PER_BANK,
> adjust the total number of lines accordingly.
> This will avoid advertising 160 lines instead of the actual 136, as this
> product supports, and to avoid reading/writing to invalid register addresses.
>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Nico/Ludovic: can you please look at this patch?

Yours,
Linus Walleij
