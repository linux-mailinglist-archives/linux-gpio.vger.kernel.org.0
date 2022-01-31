Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C787C4A4569
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Jan 2022 12:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359098AbiAaLke (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Jan 2022 06:40:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378509AbiAaLiI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jan 2022 06:38:08 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E271C035463
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jan 2022 03:25:05 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id j2so26123984ybu.0
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jan 2022 03:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q17FI0J/6Td6y/Zs5qVqHGExbrzgfzuZcJ5zgEigLzw=;
        b=ZnElFUnbfP6teOsTKtvs901N1Hz69FpXEbf1997Iw2lKz2XlmF9HQNruVH6TT6RIyj
         9tcfN29+lHToMPagXQsoz13RjMV0EtGJu+5Hc/WF6A2kbWK2rnmQwa5himp9CH2j8m6k
         nkovIr3hnb1RdSoySrf7OOXS94Im6nFxfiOgDh76mO6CgIKjvbheqfaz5bNxRvjtYvhN
         Y9BATgWz6+FgENI0EkRTN2/RuHp7wcQh+qfRmzbADJBSBDmqt0RUxuiiqeDw7KCOjol6
         X92v1D8sJRejBj7latxYG7MmQZp8tl9vVTLB8WNL01Jf9yOHTkW4eLXjh0aE4BW+xexW
         Z1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q17FI0J/6Td6y/Zs5qVqHGExbrzgfzuZcJ5zgEigLzw=;
        b=togHl5qdtrjpmmy6TyWeESPycyXpxLJZ/rTRpTy6/xDWlcoUItOtiqh1bQT5jP/IOO
         oX+LIta7qQW9W1CDuy+5tlUBJAYX0vvCSsokKIIJxOaJeBYXltmUen66ezwbhkUl5Td0
         616+BqEN9j1et2AnSueWOgZs9AsUmoIn2DeIWd8FL0KkCdUxUKBLFMLX6/jvOE4pVnja
         NB8k+fY+fz7+/CdYlYJ+VO+/rceOnQC35V5uHw1RkFIuuvXTp+WEhLyKUDkdbWfRprP1
         Mjt+DI5FY7LauwHw5WewtYuEJCpteFSNROe83co+8RQ+p0wSUFun+m9+plPcuAkUZEC5
         r4Aw==
X-Gm-Message-State: AOAM533XtRotktltFvVPKYpVSTRs4jWWASLDDkQe8aE8yJidFGlbfojS
        t9sKaM1B8LmCQW1+CgkSeEIOTwxeQbTFV2BK56EVtA==
X-Google-Smtp-Source: ABdhPJwp0dwnq3IdPpsxlsV0YJY6W/PB25vgHg+xrDLVleyc9L5AyaBJM0oHkJLfXeIzmiy9J7rAM7YsPwck8cwtBOk=
X-Received: by 2002:a25:df56:: with SMTP id w83mr28275297ybg.110.1643628304646;
 Mon, 31 Jan 2022 03:25:04 -0800 (PST)
MIME-Version: 1.0
References: <20220130073103.26792-1-rdunlap@infradead.org>
In-Reply-To: <20220130073103.26792-1-rdunlap@infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 31 Jan 2022 12:24:53 +0100
Message-ID: <CACRpkdYsqXqfxDbovvKOED-wbBOC3Q0OQqN-20LtmLt4SD-Orw@mail.gmail.com>
Subject: Re: [PATCH] gpio/consumer.h: don't use "/**" for non-kernel-doc comments
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 30, 2022 at 8:31 AM Randy Dunlap <rdunlap@infradead.org> wrote:

> Use "/*" to begin non-kernel-doc comments instead of "/**",
> which indicates the beginning of kernel-doc notation.
>
> Quietens these kernel-doc warnings:
>
> consumer.h:13: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Opaque descriptor for a GPIO. These are obtained using gpiod_get() and are
> consumer.h:13: warning: missing initial short description on line:
>  * Opaque descriptor for a GPIO. These are obtained using gpiod_get() and are
> consumer.h:22: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Opaque descriptor for a structure of GPIO array attributes.  This structure
> consumer.h:22: warning: missing initial short description on line:
>  * Opaque descriptor for a structure of GPIO array attributes.  This structure
> consumer.h:30: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Struct containing an array of descriptors that can be obtained using
> consumer.h:30: warning: missing initial short description on line:
>  * Struct containing an array of descriptors that can be obtained using
> consumer.h:46: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Optional flags that can be passed to one of gpiod_* to configure direction
> consumer.h:46: warning: missing initial short description on line:
>  * Optional flags that can be passed to one of gpiod_* to configure direction
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: linux-gpio@vger.kernel.org

In this case the ambition was to provide proper kerneldoc for sure.

Is it possible to just fix the documentation?

Yours,
Linus Walleij
