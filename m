Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E527832AD1A
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381703AbhCBVXX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:23:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445677AbhCBPxQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 10:53:16 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D8E6C061788
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 07:51:50 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id r25so23545362ljk.11
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 07:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XkFRU+e2ZzErICVZt64la/N6SIBgvzln5FOCC2jd6us=;
        b=xKsYqyM5r9yaCIJiwpNenDF39ksE3ryaYQwvAn4/okoPAGVL1ZFGPZbU9M+LkDE3eN
         o+FbX82MqvpS/Bh3M2RBbpU6VMWwSY+Hu7bxQ8iYFIj0JsyPoATTvn9HK+mEcxVL0a6/
         ScXzj4GlGPUozGIjer7xj69cDVJ2T18fV0jAfNO40cRlgcZ2NMzPUnW0lDe687JtrkQt
         0leF6/WTClzcv3zM4ZHQqFe/QMPVaARG4MjDycua/DQZuY28N2gev3T3AzhcgkjM5Sd3
         WZ+MHK2IfNIZIJ3QEHXZok+8h+LAyLI7dH5aYrszlyogVOGslGeZuN1TG+00Rur+d8nU
         Fj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XkFRU+e2ZzErICVZt64la/N6SIBgvzln5FOCC2jd6us=;
        b=jPhVz8zJTqaNYdVy9b+B9NoBvQuccNwO1NJu/qAbJ/KogLyuBOscNwAT9RB39D5XT5
         osI8qv4HLmgWhn8FEUGb0Gd77ydrAUg8GT5ZGAISRgUmJfYkqlg4hyNuvMp/hLYdEuU5
         RwBXHJVUhNoIwdxojUiYb/mnZRHbJ+lp/5K0XQgC1SbnUxG8lXVtG8z7iWVLjpHz1HvO
         mfbfopENUZIHr4x2RwX3mzfUe92GjuNNc1JM6Go6nLQ9ghMNyr8XfSyItxoTMp53bve1
         EGQ3BzTv4W1W/hj6mw5CIrKMHN2Y/teHz9bM77R4iAYos5kzVjT9OtkxDxb5AwZ1dleu
         nhHA==
X-Gm-Message-State: AOAM530EdQKa9MFwmiJ81ug/jKk1X75cBIbsJeTf2qFnBQR71ZLqYIum
        N/xNYGRPbfl/e0Q7oXBHhJ/GA1sRtfEhAPGhvJAOcQ==
X-Google-Smtp-Source: ABdhPJzJhER6CVtwXGDeSmkG4Z+mAI8RxDwe/pgckeL+qTk+7//S8m+JgvnQlyNSiX++CUeWk1BMdwkaakM6qx3Cj6Y=
X-Received: by 2002:a2e:9cb:: with SMTP id 194mr3362574ljj.438.1614700308624;
 Tue, 02 Mar 2021 07:51:48 -0800 (PST)
MIME-Version: 1.0
References: <20201012154709.68521-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201012154709.68521-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 16:51:37 +0100
Message-ID: <CACRpkdZCrEpXq1DrWJ7Qq4P3xbOAcQQ3qUe0k0J8_FQv2vpZSg@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: Drop ARCH_NR_GPIOS definition
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Mon, Oct 12, 2020 at 5:47 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The conditional by the generic header is the same,
> hence drop unnecessary duplication.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

sorry for extremely slow reply.

I think we could merge this into the GPIO tree if Russell is OK with it,
alternatively put it in Russell's patch tracker. It looks absolutely correct.

Yours,
Linus Walleij
