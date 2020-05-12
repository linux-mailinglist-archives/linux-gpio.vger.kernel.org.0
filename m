Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF1721CF48F
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 14:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729616AbgELMjm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 08:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726891AbgELMjl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 08:39:41 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D0EC061A0E
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 05:39:41 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id c21so5813912lfb.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 05:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=25aT1ziSREt2eMOH6nsVJvOqQf6doh6zTNEBSQtRoDU=;
        b=iHTf3EVIIRiEb72XuGUomprsvnNGQ+UeAARBK2vWrskrSY0EB2+77Riro6pz/huYPp
         bXc9r/+Y7EzoPKPQtijEmDicF54n5WvN/plSpdFoE2+gM/c78SqKRKjvQ/sLjpJRPiwT
         2yNiOguiUBXgJYmxtkF9E+o9p+T6xno22cTWEOXs5HEdjSxOWkJcnc+WoGT1+GnZ+rXp
         BbamOfNgs59p25Gqv+z7pErjw7nLuJfvgDlxiwfxdGHmTpppohL1szGatZT8AThk1793
         KnYzculIZWcuF0Jh7O1Khd9V2wJ9y6anBy7F5P1rGWvPRTS5u5M+LOOzKXFtauObR6zQ
         mtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=25aT1ziSREt2eMOH6nsVJvOqQf6doh6zTNEBSQtRoDU=;
        b=S4ufq3imASD9rxGlRHJRx54BMbpP6jxACQo3ST1TLEHDpS9gd620xe4ZMcYjjNHZHK
         1sYPl4c0grvElBpdtGVeH8DZntGblN0y62BNFKI1+B+kOFZjoXsolrMRGjQAqC2im2NT
         e4s02/B6Cwx2YjYUTOV0U5QpwipS/X9Ou4kAwi5MUEHFAAGktk7e5t1i2kBfTCCRRv8I
         9D9Y08Vm6UpEcToRPJAfGExjeT3IRr14F8VyuDaZGD1bMnu7j3KeWpst8b418QE0kPan
         OcqZX2YWKu2M/aC9NH/3bp6k884hOUmUx97Bkbzcz1EAkwmw9YqWBbmo50lyBRkv4ODi
         96iA==
X-Gm-Message-State: AOAM532tWS2S8OW1I4BU0EDREQoeKDq1fJ39Y9u7jToz39YHVDyPDzFU
        5Bym9lVDavWEr9X9Rzp3u7sQvtWIKIIZX2aCmiWtjctK
X-Google-Smtp-Source: ABdhPJy982LB8WEWnoxD748+g+BE0ldEg+fuodtryc5lutvhkFozBxxrxRYRJy4YQkWQ3F5aEx64rkO/sq7gk+PeqNs=
X-Received: by 2002:a19:42c3:: with SMTP id p186mr14256672lfa.194.1589287179678;
 Tue, 12 May 2020 05:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200503164549.163884-1-paul@crapouillou.net>
In-Reply-To: <20200503164549.163884-1-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 May 2020 14:39:28 +0200
Message-ID: <CACRpkdaZzDXxuKnCiXpaWabO_ZDzmgGRVWAGXh9X_0+stii8Mw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ingenic: Add irq_{request,release}_resources callbacks
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 3, 2020 at 6:45 PM Paul Cercueil <paul@crapouillou.net> wrote:

> These are called when a GPIO is to be used as IRQ.
>
> Without these custom callbacks, when an interrupt is requested directly
> and not through gpiod_to_irq(), the request fails because the GPIO is
> not necesarily in input mode. These callbacks simply enforce that the
> requested GPIO is in input mode.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Patch applied.

Yours,
Linus Walleij
