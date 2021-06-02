Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2F54398AB9
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 15:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhFBNea (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 09:34:30 -0400
Received: from mail-yb1-f177.google.com ([209.85.219.177]:42684 "EHLO
        mail-yb1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbhFBNdw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 09:33:52 -0400
Received: by mail-yb1-f177.google.com with SMTP id x6so3811725ybl.9
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jun 2021 06:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cNER4NQtwZ5xWdo+26Tmrkvw8GRzt+nxDgpp1wW+2Ts=;
        b=QxqPoJT3+KN4MMpNRXYccWtL45RfJt6GvLyC3rs+GlQu2BuPW/9us9JE3jwLiulAU/
         sWLYoHaC/44+yyrCfQg3i6XYqcwFC7bE1Dnf/Fj6UpGip1in5LcBwIwjrVflPXPDpXFW
         xCtKFN9ZMpOZL7KxXYAegOa6Rsid+p0bPrNv88V7Px3+0w2Di9Os78OPth0fgO5OcegR
         Uwn2b14dQUy719Sxrq7p06/Peq/hr3uiX5BKool8KsZ2E0nu0eLLghnDrFziXVWpRYCB
         1OnKHThVBLUgwpQthQSPDfKHzqLcjWcXmSDfr1LGahyaR7oqB5zs1tefhlZj8c6GxAii
         uvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cNER4NQtwZ5xWdo+26Tmrkvw8GRzt+nxDgpp1wW+2Ts=;
        b=JpHnu890tj/DqL65ov4lyE92NzP4u24B2Dxz+f4DF+MdVKQe4S9lG1wm8ltoUoU0mR
         6vbmFS/QRwVhDUOs6wNiVyYNmJmAzkMOvb0gWxQBokGg44och9GwQhEnIg/FtJq1Oanh
         ZMy2eqmTkJjR7RukZOY0DSSebPpa44L80u75ZEODLX0N3YLKEnbEt3WhaFHfZCeBkFae
         STlsSq6HtCyIdAnvvUTcHglDiP5NTtZDKhTsc+RMV1OCitGGk0Qfpy8AkHxGeodmWSQV
         SpDLVqnZ/xS4VApQnU9jcjEpftloNS9DBwqHnei8DBz7JGUSIShyHXSI5OLVW1qolMuu
         TKWw==
X-Gm-Message-State: AOAM530lQSujg03WtwJtHo+CIQB2U+guTyyifq5J+eTnTXU47dqjrjt1
        fBSl85dK+FnBkKB1vftUeWzlCV4Ri//U15tmc5px4Q==
X-Google-Smtp-Source: ABdhPJxQPDE2xGfYkRSOj4oxRSKoBW1LR7SjHN4xu3Y58xs2ZK6P1q/ByomauopvW4wJJYm8IrTmKibl1oFCNtpIUL8=
X-Received: by 2002:a25:8804:: with SMTP id c4mr47260792ybl.469.1622640669520;
 Wed, 02 Jun 2021 06:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210525045717.20652-1-navin@linumiz.com>
In-Reply-To: <20210525045717.20652-1-navin@linumiz.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 2 Jun 2021 15:30:58 +0200
Message-ID: <CAMpxmJWCcHYs1wkhqcdUdc74_mwdJOD7WwcDFwwCs3cp16+zRw@mail.gmail.com>
Subject: Re: [PATCH] gpio: 104-idio-16: Fix coding style issues
To:     Navin Sankar Velliangiri <navin@linumiz.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 25, 2021 at 6:57 AM Navin Sankar Velliangiri
<navin@linumiz.com> wrote:
>
> Fixed multiple bare uses of 'unsigned' without int.
> Reported by checkpatch.
>
> Signed-off-by: Navin Sankar Velliangiri <navin@linumiz.com>
> ---

Applied, thanks!

Bart
