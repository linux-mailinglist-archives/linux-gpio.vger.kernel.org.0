Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92F49797834
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 18:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233843AbjIGQnS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 12:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244050AbjIGQnG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 12:43:06 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01656420C
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 09:42:08 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1c504386370so811564fac.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 09:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694104869; x=1694709669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDyS14lOc9gIdV8qqpJN7dVOi7FiXE2O1crBwgTrNhg=;
        b=J3Q/jkTdEhestzhD7CGAm2XNF4sLhnmLogSETyUdTgrSYSleo9LdXW0sMc/c8MoH15
         kGxt+LGvbAffFOPHgQxHCiFNiuTa3hk+pZhN/FoEupBBfjIGL+eb0gCVPcy4voywuHqM
         NwtnmNE/RURDrb7BUqq+fW10UPjBP7Dlakdc7HyMtQkYgUb8Ap8j+CJyko3QMbshVtwu
         fSmcHb7MUCfH0st4m8Hbmy2zOILaUTQLkyw3ZlE5ywXyCFfX/spO841VniOii/CBSbrr
         tOH2RJUnG2iTvXePftBmZVvbR34lJCuBrmS+FnJLbCNsiAaCWZIBa80tDo6+Ebi7N+lC
         NzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694104869; x=1694709669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDyS14lOc9gIdV8qqpJN7dVOi7FiXE2O1crBwgTrNhg=;
        b=uayXpQT5mw+4LoZ5Q0g5n7lJACFSpIg5PYA7cFkTQ30VR8sOdA6WjrXcGoQckgg2jX
         To/SLE7vZ+bO6crB/72YY3P0LTnRlfCdr7DgmTcyI45G58OrB+Ms+pAohZvemmz25gss
         OSPDZm3+xgoxOR5kqvul94C3kEk3SZWrrrNe0n2nEyKQ3nsTyoT+X0olVuffWbRVA8Av
         XqWcFbfVEyPG4uQ40ou1Urdia58ufPwFtSbTMwWwwNZhzIBkNUmteffPHMDiPnM/tBX6
         kWyQ94Y3BIk1UH1OeIwq3WfnblEZOJPg6vPOYEllYA+JmG+AxI9QmcF1+uf58AwyqZm6
         eBdg==
X-Gm-Message-State: AOJu0YxvhJALDyJg7/x4TfAe9r2LeQtPE6F4EXkEYZp/lMNbWWqVLNvW
        fCi7k1Elw2DkfObXQgPCeieiwpmoFNsXjZtCgjHoSeAKekKuIsEp
X-Google-Smtp-Source: AGHT+IGJ2fOJYbfgZwCYkGOqpBoV8zRdwms0YQyjwmM812KoO4CG3kmEhKK7s/PjKGQeVe41+y3pVjBhSp9/fdWja/U=
X-Received: by 2002:a25:408a:0:b0:d06:49e9:a29c with SMTP id
 n132-20020a25408a000000b00d0649e9a29cmr19754022yba.34.1694071374753; Thu, 07
 Sep 2023 00:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-13-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-13-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:22:43 +0200
Message-ID: <CACRpkdYJhP5otaFXbn49sK_33GJMy85MszyD9rqoQT1-fqd9dA@mail.gmail.com>
Subject: Re: [PATCH 12/21] hte: allow building modules with COMPILE_TEST enabled
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Allow building all HTE modules with COMPILE_TEST Kconfig option enabled.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This should be a separate patch should it not?
Just send it separately to Dipen so he can merge it.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
