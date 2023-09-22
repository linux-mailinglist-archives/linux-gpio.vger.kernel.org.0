Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8459B7AAD2D
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Sep 2023 10:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbjIVIyb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Sep 2023 04:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbjIVIyb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Sep 2023 04:54:31 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBDF5A9
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2023 01:54:24 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-7a8aec82539so829435241.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2023 01:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695372864; x=1695977664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tODxC8RuSnqgyVnePtghCQQ3GtxSHLfWglP2jDJ4Mg0=;
        b=kXQzQM8tueUMpq5Gq8EtFPQ0okZj0V/h/qcgAgzL9pg8tDkiNmebi6xOvJ+ae0mkE2
         VOJ6UdOY1jebHFwNluH9S8c+f/X4At7tVkZqmVSBjLb9dHK0J5efk3vFrQ9tS+JToJol
         NvBZnV46eWtBjFU6GiADP9f8JDGSFrNRcPsyY4Hw02R00g5tWaX9zQDoYHvJSHluYGA5
         W3iw4hHgithRDrgGhgOwtkuQ1eMzvWqMMb9PYB6nvcVbevCuEawjmmrtN4KYkwmkXosJ
         Sm+KXHMiDXzh5vXNDXUU993z7u1n9mJKJfJOgBqYqQ2rYUHZz/MRGiGQOfKGGW66Mn8B
         bFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695372864; x=1695977664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tODxC8RuSnqgyVnePtghCQQ3GtxSHLfWglP2jDJ4Mg0=;
        b=sbM0/A3D9u1eGbf9WUQNowtwQTl7aYbnOekQ+nafBGjvj/3dn+8Z3xPtfrJ6JnUdO3
         jOkiKY+wUQu41QUJCN/GuPUl5zjsCvCaVFlgDGVx+fowseQVyCvTjQOPk6CDJgwimCdc
         Zfgy1LqqRVBjuW7CjcZFJMs0kY/EIit9zZHNAuAkARb1gDiowNGsBzsrmuejfIf01bDi
         jyQe0Fh09BBUupjd7d4pvGcv1pNEJyjwa1MUGPxCvmF8pzRZVUNeAPHF7WQJRVD83gC9
         e5xuJvespGrNn+9eRJ0bEBpNeHhqVjzaKilGVTuMUjSxlKoJ4OdJqtb5xs4+p8WJUWSq
         IzVw==
X-Gm-Message-State: AOJu0Yx5W75e5z59yQvMzOSTG/gkBJFzm487sAeI7Fif5/brTuhpzBh6
        NxawED14TfGXspbAADmiFSY916f2VxYl6pvKqU8ZaQ==
X-Google-Smtp-Source: AGHT+IHmD9gpLA3Gr6xcSinee4jqG5kfmGCwDcvqnuGBTIGSSC23j4syDvmSGrFnNor5EfBhpwz0ylhM8q1plzHBZNw=
X-Received: by 2002:a05:6102:3a14:b0:452:c2dc:9e37 with SMTP id
 b20-20020a0561023a1400b00452c2dc9e37mr4061303vsu.2.1695372863712; Fri, 22 Sep
 2023 01:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230920073253.51742-1-brgl@bgdev.pl>
In-Reply-To: <20230920073253.51742-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 22 Sep 2023 10:54:12 +0200
Message-ID: <CAMRc=MfFmuiAOv3kU4njnvMT=87Yf6e6oCLHbzK6Td-MnNqZMw@mail.gmail.com>
Subject: Re: [PATCH v5] gpio: sim: fix an invalid __free() usage
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        akpm@linux-foundation.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 20, 2023 at 9:32=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> gpio_sim_make_line_names() returns NULL or ERR_PTR() so we must not use
> __free(kfree) on the returned address. Split this function into two, one
> that determines the size of the "gpio-line-names" array to allocate and
> one that actually sets the names at correct offsets. The allocation and
> assignment of the managed pointer happens in between.
>
> Fixes: 3faf89f27aab ("gpio: sim: simplify code with cleanup helpers")
> Reported-by: Alexey Dobriyan <adobriyan@gmail.com>
> Closes: https://lore.kernel.org/all/07c32bf1-6c1a-49d9-b97d-f0ae4a2b42ab@=
p183/
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Hopefully this is the last version of this patch. I restored the max()
> assignment from v3 but kept the code simpler than v2. Tested most corner
> cases that occurred to me.
>

Patch queued for fixes.

Bartosz
