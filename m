Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 049772F63BF
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jan 2021 16:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbhANPF5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 10:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbhANPF4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2021 10:05:56 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1072DC0613D6
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 07:05:10 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id b2so6036119edm.3
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 07:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PoskbypxkT00wWzbYavGjYvgKHI4NdWsHemc342JeeU=;
        b=MJgWudY8tusLtxhO0R5P4nglVm+iYs4ZCKhvUV8weiPu9I/CUO4DiiCloQLGYiTrW4
         3dn98O65LVDWwVUo85UWnzEdGTlcKvxobyX5IdeGMJZnVCOWtyySIy8ECJ+3GoaDPTiC
         Rv+U1nP22mWfN9X9uM7ZOWqPj619151+RfRGoggvxKbyGxUqdEdU/8WiSq5j9hmy0C2o
         j02h4umBSDFTjJZpPK8VMJanmSZiZbvv2Mtk15YdWBOIDNHGmbr1ZmkYpR1sFb9j1zaO
         Iks5ZTfWuZ3FIXC7PLTZ38Vdk6ae3GG/xX6tjpRzKm8JSJhkLkwtXrGqauKcSjCABb5Y
         yIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PoskbypxkT00wWzbYavGjYvgKHI4NdWsHemc342JeeU=;
        b=QdeTSoCUJGmt7uHrfhN10p/YspY67S5jN0wXNl2D6c2+BJED0AACaqzMjIsw8LT3e/
         qYqsmi2Y8rJGw7nup+SZomFZPRpBqIdJwXsZuQZyWEHqyXfuaXVO+SN/gG0mA9QeU7Jc
         tt9xWj+oK/Gk9hOdGh8Sdxl5U2mwObssb/i9kf+vuGmRObJvQ1duEjg6gzLUQm9DDEyh
         rN9fxS1xKH6bA20zaq8e3j1JnFEhcJF86/oGwMZU8uPhW3OmdDRXn28bi/kU4sWWnuNB
         8itUE9DhPWiLsKgVdiu+pS1Zod+IgFJvuIOMVv77HzS+Fb2KDr8ebSc1GxXVWGUNUtty
         p3Dg==
X-Gm-Message-State: AOAM530bHXLL+5doaYAAlR000dvfZcB9fd4irhcLD4btqwUnizXsIumX
        TwXCKCjqPVZHanZJX6RQ5SmjlozVuAX0uhjFwtMmSA==
X-Google-Smtp-Source: ABdhPJznyXcMdazCTppxUqqiAc22eXO9WHpkaSNq4DdnREGauj/0BxYboWWaRD4gX8RqeRFaz6+qk33S2b8hqzTfmhA=
X-Received: by 2002:a50:b742:: with SMTP id g60mr5944200ede.113.1610636708850;
 Thu, 14 Jan 2021 07:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20210107025731.226017-1-warthog618@gmail.com> <20210107025731.226017-4-warthog618@gmail.com>
In-Reply-To: <20210107025731.226017-4-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 14 Jan 2021 16:04:57 +0100
Message-ID: <CAMpxmJUrkX-nM1pNSrtCx-KKG0edBD1FGuaaRvLKqXZhN4u=Vw@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] selftests: remove obsolete build restriction for gpio
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
> Build restrictions related to the gpio-mockup-chardev helper are
> no longer relevant so remove them.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  tools/testing/selftests/Makefile | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index d9c283503159..5411041e63a0 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -121,15 +121,6 @@ ARCH           ?= $(SUBARCH)
>  export KSFT_KHDR_INSTALL_DONE := 1
>  export BUILD
>
> -# build and run gpio when output directory is the src dir.
> -# gpio has dependency on tools/gpio and builds tools/gpio
> -# objects in the src directory in all cases making the src
> -# repo dirty even when objects are relocated.
> -ifneq (1,$(DEFAULT_INSTALL_HDR_PATH))
> -       TMP := $(filter-out gpio, $(TARGETS))
> -       TARGETS := $(TMP)
> -endif
> -
>  # set default goal to all, so make without a target runs all, even when
>  # all isn't the first target in the file.
>  .DEFAULT_GOAL := all
> --
> 2.30.0
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
