Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C75451C5D6E
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2020 18:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729455AbgEEQZm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 May 2020 12:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729398AbgEEQZl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 May 2020 12:25:41 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84908C061A10
        for <linux-gpio@vger.kernel.org>; Tue,  5 May 2020 09:25:41 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id c10so2912845qka.4
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2020 09:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UY/NVbvy0jUH1oe5m6J3EeGv70DJDE0UW3gaQi7+53w=;
        b=e3hvcYNBhR3uTaY0xynvVRREMNwCB9JyCpaPGbngvSzrXREV7mL8g3lpQR3wWaJXwS
         WYXIIaBJ+uUME2tO0kkCco4KPee3tHN39eQD/RiIEcNPbpNrnNVwtH1qC3y7KCBbDezC
         ARWqaMZIEWTIjbA6ahAhOHIyz5CyMCy6pUjJnhFb+yAWjwF0OZKUNrMGFsIuezFKh73Q
         eLDKmL86IOksgBJJjNLVcW3NhW/tUJWX3dO/tj4egwmZPmcWaWOJVZZGMoGafcc7DILr
         QMD29OC2vBKKDjruk7piNzZOUrpgLPxjbQPJct8iI2t2FmSl/iWBoScSKlgqVD0eD6uy
         9u8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UY/NVbvy0jUH1oe5m6J3EeGv70DJDE0UW3gaQi7+53w=;
        b=Ay0B2FW1H7e+F0XkFXH24gGA9ZT0o/+fG/TirG4H9G9zHSZDChENR+Fa4EmEgU3/ij
         OM/RDN3BhJtmFgAN/+Mu71YWHyHNxqZ+1Vkgyqrz2tFcIqo4G/osfVCh5+pxywxsoQh6
         H7fc7PCRkUzjqFI3b0QG5+GFNzDCaowfPUoQyRTWpxB5Q1AfbyIBnDc4hUv+wUgoYVRy
         FAcHSTPmwuONQwANBbiVIgUQvkEOVqTZf0+ugzcpyhuFrF+G/ti/MPanUJ0kwwAtwbi8
         mBYtfMGrdcCdY77Q6fiLh5/EabStsSh+gTTBOQzi5kBqzyB6YnY9hLgEliIjskm+pJDn
         wgTA==
X-Gm-Message-State: AGi0PuY1lqp7aUqz9WDuA1Z+9gg5up1PJgWfy+GSCj0hCIDQBsor5aZl
        wgoNM/o/6jc/Xm9LBFnheEgjD3lywis6ks9ObySFFg==
X-Google-Smtp-Source: APiQypLqgtPcnpgxGc2jGD8qsguBpbnG6jZ+F/5eo+Igm20nElK33fVb7JZ0XLKsuSa6Op7louZ3zMNi3nNYiXFZwu0=
X-Received: by 2002:a05:620a:1395:: with SMTP id k21mr4346176qki.120.1588695940818;
 Tue, 05 May 2020 09:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200429135654.30120-1-tiwai@suse.de>
In-Reply-To: <20200429135654.30120-1-tiwai@suse.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 5 May 2020 18:25:30 +0200
Message-ID: <CAMpxmJU+6K-tGMCoTsz-6RzbNqhL-hnuTnY5T7Y0jQ4rr5u62A@mail.gmail.com>
Subject: Re: [PATCH] gpio: exar: Fix bad handling for ida_simple_get error path
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kangjie Lu <kjlu@umn.edu>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 29 kwi 2020 o 15:56 Takashi Iwai <tiwai@suse.de> napisa=C5=82(a):
>
> The commit 7ecced0934e5 ("gpio: exar: add a check for the return value
> of ida_simple_get fails") added a goto jump to the common error
> handler for ida_simple_get() error, but this is wrong in two ways:
> it doesn't set the proper return code and, more badly, it invokes
> ida_simple_remove() with a negative index that shall lead to a kernel
> panic via BUG_ON().
>
> This patch addresses those two issues.
>
> Fixes: 7ecced0934e5 ("gpio: exar: add a check for the return value of ida=
_simple_get fails")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Patch applied for fixes, thanks!

Bart
