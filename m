Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA9E2877CC
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Oct 2020 17:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729360AbgJHPq5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 11:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729249AbgJHPq5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 11:46:57 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DDE2C061755
        for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2020 08:46:57 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id t20so20974edr.11
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2020 08:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5CLwKaQ/l8llf+Or4hYgPAZkrBIS2luSBRXVAMHRyvY=;
        b=xNikS+fWe8LCRBMr9n01Uq7Gf3g5dodK5oHiD32dOURBYTjQjnmcOaoVZjjGGQOdPr
         br2TMBcpkFAKpza5Yp9o1+jSYDgjLZU4DqRsBOswxcPHVPwn81SWd4y/p2zkOiRmNIbU
         +0SZm58XrZSj8Uy5zCytAbLvXR6QcsxSKupFg9Czm927mYzEc3tA53mW77yD3pn4vHBS
         41iHhrtk1k5mXSaZlc2ETJctfXdZJiNEFarDUeLsaTQ4a9k6KPwqO66McxxyVJ0InyuP
         6185NtD1IQ2Cq7Z95iAawzljBIbrXvA3OZSCudC3N9MwpOxj9copZsHSLt5suJaB9X+P
         gN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5CLwKaQ/l8llf+Or4hYgPAZkrBIS2luSBRXVAMHRyvY=;
        b=dKd7zGAj95wXkWV8mbaLccwuGY4wZ/S72xyo3zsWNusRtuQ7bT1sX6CGFV0yi+m6jq
         88XEciYNb9rudN7lDphV9J2FsIzY5OC0B9CU7jQB67xjGiQJChqS076m+CSE8aI3CEOp
         l/C4Siby0wb3jRnZPjIUCtpNW23tcJiQAVo0C9kQDgKheF6wwlqyH4vX7uw2e+/ghvhS
         uHOZPW0BU1iFg/6o9NWyE9hW0Hboet0jv7LJrF5bplWyh0Dus9yoyc7iprB6fP6kvNE5
         wb749ay5FdhCVWvLUKm6v3k9trm8661BYmo3Ea7ZGtm+MOmlegE9Ui9iTuEPtZFw76Ll
         XQkw==
X-Gm-Message-State: AOAM5307Vw8dZOdcavVLzKY0osX9k7t3Bv3XEg2Dwx3yCgXP+oqfGyKx
        4a8dGiEIHFcLJP4MSHJpC0rlmtD7Il8w+7Or5AwCwu+lHD0=
X-Google-Smtp-Source: ABdhPJwrl3LJ2qVIveN3fG1l3INuXOebOppLmo6R/dapnUKDQ/yDq7OGo9SBv5T7z1xcpuxHlY0PE/krnpdrjd6V6ik=
X-Received: by 2002:aa7:c3c7:: with SMTP id l7mr9647539edr.213.1602172015993;
 Thu, 08 Oct 2020 08:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201005070329.21055-1-warthog618@gmail.com>
In-Reply-To: <20201005070329.21055-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 8 Oct 2020 17:46:43 +0200
Message-ID: <CAMpxmJUbxuAHmcf_1vP27qb1gSXTfE1OBb8X3MSoESpa=pycgQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] gpio: uapi: documentation improvements
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 5, 2020 at 9:03 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> I'm intending to add some GPIO chardev documentation to
> Documentation/admin-guide/gpio/chardev.rst (or perhaps
> Documentation/userspace-api/??), but that is taking longer than I'd like,
> so in the meantime here is a collection of minor documentation tidy-ups
> and improvements to the kernel-doc that I've made along the way.
> Hopefully nothing controversial - mainly formatting improvements,
> and a couple of minor wording changes.
>
> Cheers,
> Kent.
>
> Kent Gibson (5):
>   gpio: uapi: fix kernel-doc warnings
>   gpio: uapi: comment consistency
>   gpio: uapi: kernel-doc formatting improvements
>   gpio: uapi: remove whitespace
>   gpio: uapi: clarify the meaning of 'empty' char arrays
>
>  include/uapi/linux/gpio.h | 106 +++++++++++++++++++-------------------
>  1 file changed, 54 insertions(+), 52 deletions(-)
>
>
> base-commit: 237d96164f2c2b33d0d5094192eb743e9e1b04ad
> --
> 2.28.0
>

For the entire series:

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus: can you take them for v5.10 through your tree directly?

Bartosz
