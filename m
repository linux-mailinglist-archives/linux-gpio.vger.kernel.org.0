Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEADC75B1BE
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 16:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbjGTOxK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 10:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232457AbjGTOxJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 10:53:09 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3F5C6
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 07:53:08 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-98e39784a85so438341866b.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 07:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689864786; x=1690469586;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIxp0Zwjdv878XOR80dkOFsW88+csVXqnn/K1mgVbp8=;
        b=QjfjSKrtD/LgbaOA+pbFWtNKZ7yFxIa05pwD4CN1cGRkm8pdPUh+WegxAVu82BnAdR
         +383/NXDp4UiKuvjDIW3f3i3ah6UryKLbSyoVljNUmZIMLfEk2pd7tn2aHebI06ZV+NK
         xZ7jAzGsj7qixaHf8sCUJFhfODliLwO+1k8cJbieVLENbUOmsWJNw3GLdg0eI0B4/9MP
         npUHjwEMki1vU7MzZKClQvBLfsOfsPQEKWObzglxBnslOw784bGLM/3zcYcaEyK0scWQ
         67ZXPKkntXwWdySrYXXFzmvTUC/nBuKDcytyPc9hNaXkwfERgOo/EERi//1y327Ypnda
         t/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689864786; x=1690469586;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jIxp0Zwjdv878XOR80dkOFsW88+csVXqnn/K1mgVbp8=;
        b=PdnCTeNCrwpKe1wMZDMG5SslkR2ZzV+WiuGTdAMWQb/Zv8ELWK+1TVZSbr/37piYYk
         mABWR9FCbvyV3eUcO4RsteMzfgSfoSe7Xe9Cd+ig/KSfpcaGazAdfi2KxKqX1seaqnW3
         k4lrjrJErf45ZI+EqmhXYnbwzBOsMJi38U4RP7TMUp1nOSrmc7MhTV4TRcCHBeBgId9q
         6XcSlIGouYx2QDhVsyAqJB4DWftQkejcRdrezyQ9nny3/4/COcou3a4eZ8mR85x7pC/C
         DgQO7MgKvLHiP5i24HHzfafpPklfsZ8s1ZAXT/zr1s5HKJkxNoTDhwPELZ7wurkRlPCM
         wUuA==
X-Gm-Message-State: ABy/qLbFrvgIK9KtGnoWzSxT+NWgvn8yOSf6KBK+Uii2EEX3XWepNOmX
        /nax1fMezVgdwJBScO8X5yI5dA==
X-Google-Smtp-Source: APBJJlH5orJv2amSsl6+jLfDocHbPlLg9n1j55ojG9kI0Mp3RDg38ZtBL5tW8zosv0MlxqZNNJcdCQ==
X-Received: by 2002:a17:906:74c6:b0:993:eee4:e704 with SMTP id z6-20020a17090674c600b00993eee4e704mr5341228ejl.38.1689864786644;
        Thu, 20 Jul 2023 07:53:06 -0700 (PDT)
Received: from localhost (i5C7438C1.versanet.de. [92.116.56.193])
        by smtp.gmail.com with ESMTPSA id kk1-20020a170907766100b00997bd42d210sm790463ejc.205.2023.07.20.07.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 07:53:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 20 Jul 2023 16:53:05 +0200
Message-Id: <CU732LF5D9PH.JX578TCYJ092@fedora>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH v2 5/5] bindings: rust: provide
 LineRequest::chip_name()
Cc:     <linux-gpio@vger.kernel.org>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
        "Kent Gibson" <warthog618@gmail.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Viresh Kumar" <viresh.kumar@linaro.org>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
X-Mailer: aerc 0.14.0
References: <20230720144747.73276-1-brgl@bgdev.pl>
 <20230720144747.73276-6-brgl@bgdev.pl>
In-Reply-To: <20230720144747.73276-6-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu Jul 20, 2023 at 4:47 PM CEST, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Provide a wrapper around gpiod_line_request_get_chip_name() for Rust
> bindings and add a test-case.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/rust/libgpiod/src/line_request.rs   | 16 ++++++++++++++++
>  bindings/rust/libgpiod/tests/line_request.rs | 14 ++++++++++++++
>  2 files changed, 30 insertions(+)

Reviewed-by: Erik Schilling <erik.schilling@linaro.org>
