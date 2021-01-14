Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503782F63AD
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jan 2021 16:05:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729125AbhANPFb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 10:05:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbhANPFa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2021 10:05:30 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC93AC061574
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 07:04:49 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id l9so2896407ejx.3
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 07:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DHncU0XWLrLTZ0f850njpy88wt0QOagTuf7R3b7bscY=;
        b=fbiTmzvzYQgj/tGJyJ5NLYmx4S8J6DvRhV5R1yBrkw84G5va13npWJlqE5adrvg50N
         FDO0rE3ZviHhtRezJckJrrw/b49nRoZMkjAFiS7/Obxy34SUR1NjMeSNdMmjay1+dt3e
         OcWYwlz5HFCbudnBlT4anQ/9wb3FHRD9DgPLvg/9yy5AyyY0GmEG6iVrY5b4E8m1Mfml
         BVjDa5ck3tcczdC0NkwAzcOff3C6lD3H2tQcp523j924X+dKez0Uch9pWCvfxRHZjuE6
         Sp6p2cb22CN2SLMxg+CQXlLBslqhr4FYuLZBaTFAgj3SvhG3kOgQHGegni0IDLfNq8Yn
         bTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DHncU0XWLrLTZ0f850njpy88wt0QOagTuf7R3b7bscY=;
        b=AMAhFxKgt7YaQ/LWVB424359ln8MC9Zllu8aHho+arhz3ZcSz1Xq3K4ZXTSfY6X4ZC
         3eMRtvQXaA8P7WDK0zefHcDkul6pCyR9vqmgPj73KHEor6cHKyn/tQffX0vXnxxPP1xk
         3tVplAqcCNAT+i7/igqRtAv9SqdlA1+oK3ZqtmBjEM6TSfY5hh31XitjORCpsHXHQjLL
         h61ifGLXTDg31h3jhIOsjCcQ3+tnDPZUCpIEeo+GesXSeV4FimtjsXy6RNU9tCasW5Tr
         W4VGsfulsUgHo/jZ6Jvp3cpfF5qKnYGqdGT7PE4FlRH2kLSyuf7b4r51NNiN2Fh2tNOM
         TcJg==
X-Gm-Message-State: AOAM530jkq/wUfDQ5fRD38ot84FC7amTn3pv6kkZY2t9uJRP7UU0Y5ww
        DOrYzkTzKbBnoAk9ddEOV0OuIz3HWoHQxjwFeJKSiQ==
X-Google-Smtp-Source: ABdhPJzXFPqR1B7US8btpRlcEiiF2CE+53QMk9IVpJn9QC+/vq9hs4X9BBcseaNg+/uqKLdfRoU0QjxbvwxWcj/lIvI=
X-Received: by 2002:a17:906:3146:: with SMTP id e6mr5306780eje.363.1610636688700;
 Thu, 14 Jan 2021 07:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20210107025731.226017-1-warthog618@gmail.com> <20210107025731.226017-3-warthog618@gmail.com>
In-Reply-To: <20210107025731.226017-3-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 14 Jan 2021 16:04:37 +0100
Message-ID: <CAMpxmJWnN0HyC95KFty0rHThH0_-2LU_eiVB_g4Fvz6vyM8xew@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] selftests: gpio: remove obsolete gpio-mockup-chardev.c
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-kselftest@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Shuah Khan <shuah@kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 7, 2021 at 3:58 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> GPIO selftests have changed to new gpio-mockup-cdev helper, so remove
> old gpio-mockup-chardev helper.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
