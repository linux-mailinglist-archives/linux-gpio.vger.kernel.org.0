Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA152F63C1
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jan 2021 16:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729256AbhANPGA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 10:06:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729233AbhANPF7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2021 10:05:59 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 284F1C061575
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 07:05:19 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id c7so6033851edv.6
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 07:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aKnKChUIIayxE2Wo/59bE7n39rx9TTcYcskO/VCzqOE=;
        b=d/G8cH4jkgGe6emD5Z/XtAfty4owj+MVmIboB1D6jdKSMdcQcbMRLfURzra5R4IGyz
         R83P3r9+PmYLZw4VoyC+ws8nABmztJ6Y34tWwW2ze48u2c08Tli6JjeGRQOy3HhJhmhO
         +w7mbzYA+395UpTGPQwFqImoV1x3/248o79wbsUMnm+gp0ic0RQTbbXomg+wpVoP58CK
         Uu6zhjF4lOALzaqCEje2Z2eVAjBtGYGxCt48MypkImdkSSnkSrFtuxywpbHaPxwvPP/w
         PdXwwPn+qrvsz1xtwoz79aRGEBMrnLYKRAzNVZ6mk5wyTI4UoXnYIcc3EerGx8+s8ata
         nnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aKnKChUIIayxE2Wo/59bE7n39rx9TTcYcskO/VCzqOE=;
        b=NK0bcx4+wA6PmGk2lM6BV1ZD/serxQWd0oelmgbjYRBxH22uCEwM+hRvtUfAKnuog/
         jgNsBxLPHHAa5M5NtgVA9b9bxCajxDC7AV9dp0Ul2o90qzgh1eKwiF/F4wPo0XXEEEJk
         RBW1UmxZJhrII1wOZ4FM+EUDecDA+qixHo1zUrxa6GFQnqGa+waNZ2acozARsNOGrzcJ
         sa4dQL3N4I8643ZUShiL2DABXcjJm+kw/CtsqkDQ/19D4WRo+VBYwZaxa+fqJhrMMDxR
         Ww8Nth0w0yHuPMVw6l17tGeHW2TFGaokWShlrYfgKObE5F8Fl1T3ltGIyKJ5gGZ4IXbO
         yPNw==
X-Gm-Message-State: AOAM5334z5sWp857+IG/BwaWAKW6cQtkD0S6a1i2BGAvBEuWRRY3B/eF
        V11IJgW+Jrsf2fCVP30p1SPyWTVtdpXEVQtUKM3nhw==
X-Google-Smtp-Source: ABdhPJwa1l4V8lZoS2mSgTaYt2mO7UIudMwv149lnMlACenH7pwvBOs+0wankLNCs43BzvhjV8ezzjozKz6xZa2X8F4=
X-Received: by 2002:a05:6402:17:: with SMTP id d23mr6125499edu.341.1610636717885;
 Thu, 14 Jan 2021 07:05:17 -0800 (PST)
MIME-Version: 1.0
References: <20210107025731.226017-1-warthog618@gmail.com> <20210107025731.226017-5-warthog618@gmail.com>
In-Reply-To: <20210107025731.226017-5-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 14 Jan 2021 16:05:06 +0100
Message-ID: <CAMpxmJXf6ELSAyMvNfwBUkmdzCZMqv6A5H2BesZHHruHPgTOag@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] selftests: remove obsolete gpio references from kselftest_deps.sh
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
> GPIO Makefile has been greatly simplified so remove references to lines
> which no longer exist.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  tools/testing/selftests/kselftest_deps.sh | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/kselftest_deps.sh b/tools/testing/selftests/kselftest_deps.sh
> index bbc04646346b..00e60d6eb16b 100755
> --- a/tools/testing/selftests/kselftest_deps.sh
> +++ b/tools/testing/selftests/kselftest_deps.sh
> @@ -129,13 +129,11 @@ l2_tests=$(grep -r --include=Makefile ": LDLIBS" | \
>                 grep -v "VAR_LDLIBS" | awk -F: '{print $1}')
>
>  # Level 3
> -# gpio,  memfd and others use pkg-config to find mount and fuse libs
> +# memfd and others use pkg-config to find mount and fuse libs
>  # respectively and save it in VAR_LDLIBS. If pkg-config doesn't find
>  # any, VAR_LDLIBS set to default.
>  # Use the default value and filter out pkg-config for dependency check.
>  # e.g:
> -# gpio/Makefile
> -#      VAR_LDLIBS := $(shell pkg-config --libs mount) 2>/dev/null)
>  # memfd/Makefile
>  #      VAR_LDLIBS := $(shell pkg-config fuse --libs 2>/dev/null)
>
> --
> 2.30.0
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
