Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD146298FAC
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 15:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781850AbgJZOnX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 10:43:23 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:51105 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1781849AbgJZOnX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:43:23 -0400
Received: by mail-pj1-f67.google.com with SMTP id p21so3362314pju.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 07:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iB6W1YRGfACToPxj/ygoH3yqEA0d31y7OSOhA2AlbSc=;
        b=qPVb71XNGYrz0GF3747rwA8bCX5f6Ik6gtrhRbspMTWzHbsZnYvz1Q2xx4N3SZQ+FK
         I0brk/70jL/pH7CffrTYWIKhBLoFZFtSFylu87kWpUhrXGdV5jOtqRPeT1uzHka/xb2n
         Q1vNdIXH3fkLFi7WrJSmY0gmxowOOyjgb5FNWOKui4epV8nORFOv3cwkxrt7+UDk/3tg
         tn8atmtZxlnVzh2K3nxHQ9GBf2twDOamVeH2d9NGGYYyMqqT409RwP0Uyp4ce/65gwqA
         X9vfLqK9OOLETbKrR5t5k2RdHQwqmvKfYZIjQ9gGcTxk+wpcH/eFv7T0C5duA3d9s/Eb
         bevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iB6W1YRGfACToPxj/ygoH3yqEA0d31y7OSOhA2AlbSc=;
        b=tPECEhQG/IxRsUtjVp9IfErOmn8XGNZXojz6URVwxfyCI7liPdNuNy2u96Gf9gKua8
         WMh6aLGXGXyxrCEfk9tPvOE2/JFFrrFcwnoua0BayO6d9mFWZXuHTZPl0r7RLLjhHsxt
         bBH50jCh7ZxGkJJf4TFp+xxxEEz+qBbG/Se4iOVlDH0BOx88H18RukyeLkIqcYwc8AmI
         jI3U8/qEmqTlZmMOscJ5ywP1v9fJ3Al3ZPrIvmZpPUvGrDb8KV+3ZUdcEUu3pIxrE8Xu
         eIep7nwvOs2SoABzNtUJMU4yttgZw6lqcaA0TiRi+8CO+dN3KBk/IEMCPFFyhlKaQb/O
         TjfA==
X-Gm-Message-State: AOAM532pEi5vwi593NfWtaO7tknrd9iEwqPNNq7v2qGAt8wY2ihpWl4t
        6eX+d1hLeoJV3ND8AQg9TXRvJqTWOsSo7sJUCUY=
X-Google-Smtp-Source: ABdhPJwV5QSV0AMWcWTHLDkvFOYuUi+SNMzoP5HCC8LAQ71SEiaIkeZj0iFESIbCP5duMQU0sLkvx4gc89cLgQMLQhI=
X-Received: by 2002:a17:90a:fb92:: with SMTP id cp18mr21029595pjb.228.1603723402832;
 Mon, 26 Oct 2020 07:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201022165847.56153-1-andriy.shevchenko@linux.intel.com>
 <20201022165847.56153-3-andriy.shevchenko@linux.intel.com> <CAMpxmJWhENX6bEWihp5hFjDnbXz5asdmEpw96_SJdx1v3+U1AA@mail.gmail.com>
In-Reply-To: <CAMpxmJWhENX6bEWihp5hFjDnbXz5asdmEpw96_SJdx1v3+U1AA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Oct 2020 16:44:12 +0200
Message-ID: <CAHp75VdBahEEB5qnbbquPBG+iErEaupoAA-f1vTroAXoLLJFNw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpiolib: of: Use named item for enum gpiod_flags variable
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 26, 2020 at 4:40 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Thu, Oct 22, 2020 at 6:58 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Use named item instead of plain integer for enum gpiod_flags
> > to make it clear that even 0 has its own meaning.

> This patch doesn't seem to depend on the others in this series so I
> applied it to my tree. Let me know if that's not the case. I'll let
> you take the ACPI patches.

It's fine, thanks! I have just sent an additional message to elaborate
my vision, but again, the approach for this patch you chose is just
fine.

-- 
With Best Regards,
Andy Shevchenko
