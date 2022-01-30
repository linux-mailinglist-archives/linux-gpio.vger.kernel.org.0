Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D02E74A32E8
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jan 2022 01:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353471AbiA3Anx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jan 2022 19:43:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242625AbiA3Anw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jan 2022 19:43:52 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83576C06173B
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 16:43:52 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id k17so29587672ybk.6
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 16:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i0heOt0MsnfbggLnL41BYSYo+JW4b1v4laT3az03jyE=;
        b=NTUUoAwKu7RD+Vz0K3+O7Xn0Q+qJK8lQEW5wXkAOwblKwjVUeOWeoXjSuUyHQOm2WU
         QLR05VjCiSdHhC2r3/lfYWWwxot6fMes++uNzubU/E+IosIe0VZaK2yrLpeqYGxCFj6t
         qFNdYlyHv5gFrXHes9twon2u56e+90H5YMqGrOXE4MzzkTFwZ23E4ZtBJ+fUlSMO9n7k
         ivfk/0fKeZCdf8ARYxPfnEY7xjBDObjf0TTLwfcttTXLcf8GT7iatHOW1toEDwZPeH0b
         PpMtLUQWp+S/baBvVEqBvBBbuXp1QHTqyMILfqFgRxiyqoDR7Hb8a6Bla3MPFzt424Ko
         2Hhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i0heOt0MsnfbggLnL41BYSYo+JW4b1v4laT3az03jyE=;
        b=dbDST32NM0CR/ilNtpsQJ15M4eJJGZ23jPNmdIdQOyAsbfTKRkXZGWIN6Es3uIYIvu
         CJlLdQhb0HLzfmud6vNWhgB+GxrQb++NWnK4sVVE5dLMb0v6PmrbwqcmJYZM5OgaiBZ/
         JB+AYgRyX+oaFh6KpuQ2DDSef/8JL2xYOjYqClP7pEFWJkUq1KkB0SDKrscoyOVhyUHi
         ggHDrj88eviXmgDsCO4C7B6FolkKTTFRF910tO1OY/sDKxJtvvHIF2U6yP+pY/Wf7drE
         zNHW5wfLIW2bpzP0ho6rJJjUNulluxfB5jJ+fX8mdDXnn9aSMP5XTTv7G1RuZgQc6Dgb
         Yd4w==
X-Gm-Message-State: AOAM531jbixzwDlZ55SbCCIuj/Tk0MLuxo5QotBAD8wJQ3IspupJppkM
        mrFEERL36CqZtJVdqdflwiM2b47Srwya/6PPtfUDDA9zSDs=
X-Google-Smtp-Source: ABdhPJydy6ZkeacI3rT8jHNSi9nSVdfyeZ6fzuQWvUGVLQ53U3TfGwQChT4mT+0l3VMAP7QbbCFsXkBR31fK2hp451E=
X-Received: by 2002:a25:8c3:: with SMTP id 186mr21032329ybi.587.1643503431458;
 Sat, 29 Jan 2022 16:43:51 -0800 (PST)
MIME-Version: 1.0
References: <20220120150024.646714-1-paul.kocialkowski@bootlin.com> <20220120150024.646714-4-paul.kocialkowski@bootlin.com>
In-Reply-To: <20220120150024.646714-4-paul.kocialkowski@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 30 Jan 2022 01:43:40 +0100
Message-ID: <CACRpkdZnw-Tf2eQwO+LZRW4UacR09qWRWct00=XLb4pfa-N3=g@mail.gmail.com>
Subject: Re: [PATCH v10 3/6] gpio: logicvc: Support compatible with major
 version only
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 20, 2022 at 4:00 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:

> Support the newly-introduced common compatible for version 3.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Are there dependencies between the GPIO patches and the rest?
Doesn't look like that.
Can Bartosz just merge the GPIO stuff to the GPIO tree?

Yours,
Linus Walleij
