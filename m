Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6DFA39DE40
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 16:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbhFGOCv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 10:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbhFGOCv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 10:02:51 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D960FC061766
        for <linux-gpio@vger.kernel.org>; Mon,  7 Jun 2021 07:00:59 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id b13so25089579ybk.4
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 07:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p9E8O5w/zkKI+sZ2afykxRWuriykTpkma4WIu7fNyIo=;
        b=FIt3KmJd++bHSzROQDE1qiyb4qF2bS66n6OFSnPYsreDNZpn5ikyqiNPMudRhHQE/o
         Q9yErBnO6nU8cItuUZqnITfjxBd6n8imCs4RajexvQvy1laeZScfSPWJJG2NuHdc8nhT
         TkRgHnqlXr7ukioUCXvlW5BWu4Fa0cWbzAR5Ju8MWFy0fZsazoqacWF+k+oGqsSMIl28
         XWDlL+VYSO3fhmx1rVxccM8s/kYFztMVjGXwc4pq84h7AWtySpUMsV9NBYNc8mDdn4hV
         2km8FRrWQk7UhYPrlemBLlKv8jqnPjSc6tMXVR0xxg+3pp8+vpS1gTfMUyA3QlxeMkT4
         vdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p9E8O5w/zkKI+sZ2afykxRWuriykTpkma4WIu7fNyIo=;
        b=rHnHsIzeKsSgQ9VHgXuQS+pnYbX3KFjLfkmviBO0DRXE8L5SUtBanXP/ZRj3yoqx21
         /nqiRh8p/ZWs45VicW85iA4428EnhAC9t9zO7OfGYjyF5o3bzYrQRHxEkkfcCZXpieLM
         1QRVCa3aJ09D+Rwfc3RToH9fbynm9sYnoRPgoiLbqq79aKTlWjS48r+uXPNvDgPyl3n5
         BxS8BLz6iELAEvkA3s4LR1JZDN5dORZ8EaBXErxjRZEf0vroDrOZpRABOTQ6jWtrvSsd
         Iv31bDEdl1x1j8zAOLkhSTcmAumPOaCiL2IDOnIeGUs7kl7AjSCvpKHJTK8IYIZYYYPD
         JXsQ==
X-Gm-Message-State: AOAM533UzdA5bX3Apygm2Lw0/y3U/W1yKfk2OGQ9UWUrE0Eb3yP20PVL
        HDdRuL6oMZS019y1PVoMXTnMrPWpAZ2E6JCtjwCeXQ==
X-Google-Smtp-Source: ABdhPJxQAjRPnrTamhPFtLVjNmDSjKsYm8FSssRCgIhEJ9WM4D5e+Rb2US2TlunEUXj5ul/iDseg0wsMSaRxHx6dEjE=
X-Received: by 2002:a25:420c:: with SMTP id p12mr23656144yba.25.1623074458505;
 Mon, 07 Jun 2021 07:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210514123309.134048-1-tsbogend@alpha.franken.de>
 <20210604122223.GA8940@alpha.franken.de> <CACRpkdafaMUjai4VCxePX2kWFkh4=Ks5qQvHTtYvVtkeHPhKKA@mail.gmail.com>
In-Reply-To: <CACRpkdafaMUjai4VCxePX2kWFkh4=Ks5qQvHTtYvVtkeHPhKKA@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 7 Jun 2021 16:00:47 +0200
Message-ID: <CAMpxmJUH7ap1r4EM8h=moXOinBP6=FKt9hDwOiu_oMedNinyeA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] gpio: Add support for IDT 79RC3243x GPIO controller
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 5, 2021 at 12:04 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Jun 4, 2021 at 2:22 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
>
> > is there anything a still need to do to get this integrated for v5.14 ?
>
> IMO not really:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Bartosz is collecting the patches for v5.14.
>
> Yours,
> Linus Walleij

Sorry for the delay, I'm currently overwhelmed with a house renovation
and the approaching move. Now applied (together with the bindings),
thanks!

Bartosz
