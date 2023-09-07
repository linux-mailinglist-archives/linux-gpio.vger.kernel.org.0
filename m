Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61450797556
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 17:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233026AbjIGPqP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 11:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343796AbjIGPbU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 11:31:20 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0903E47
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 08:30:49 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6b9a2416b1cso791431a34.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 08:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694100607; x=1694705407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yT2zLt+lggSVzXUG2wimOweNQHus7+eb32MpOdUPep0=;
        b=LOeoXMYTWPXMSL17uhiEF+5I8Y7vA14hd5VBNYLx1zlLlVMV1aESVNC2ZtntkHxWdx
         xzB4uuuEiciOSN25CQ9L4u37CrRDz3xQZ5VhvQLoV7dnKTfWLPn4Qepk4d0nrXJk4RoL
         oHkxW9qhqAHgQFyukQklU3qf5QWjUb2J1zU6+GQ2XdquMQ3PEoysqS5+v5UyM3GahEa+
         5iYUBiND+Gsgrmm1m9HVB2fzSQ+5Vf7qf2P4tvi2wMlj0armY+nRNcMBPkSkl/HH5lCS
         qZDbrVMRc2UTJrmSnr1t3QoL9JlJGvQoGubA5Pp4gl3TPDG5AvR95RerAzQz767g2/U9
         UqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100607; x=1694705407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yT2zLt+lggSVzXUG2wimOweNQHus7+eb32MpOdUPep0=;
        b=Um5znxzGsd1tpVGW5VBpBol9BFtbP7pPYfyQvMeHzSY3a3x/mYe+4cNTA9I+/CnFOC
         y/EZcIomINMj8sa8mRWYvh+i33+PGDijSL8mqzZcVxEtpgFXaLcAzZHEto01Aa+mxcP0
         deeZqJWLnb11NdxjTmZPsqDvWZ4D6QUsD2pzo2i5SPgLGUtReIWHFIMks6vV88g2OBEi
         hiRn9i5vQrs7sHTzg9Hm+4w6yVPE7LnXse4LHXQTX/4wBvY4d7LWGrOQLhX9q2c2q7BB
         lHRwBWWOPm4wOM6C4kn4hk+OOyV00U0uCDUeN5y+YBz9XAmbvTnnozdOcmg//dcMCZkt
         Qg+Q==
X-Gm-Message-State: AOJu0Yw/C+Z6MnafZ6FVTWOk05ER315pP6e6TjJVxi6jwn1IKnrp9v5E
        luOwhh8tGpJadb5p+XeE8Cpk3jvgtY8m9GgSYsn93PT0eP8ZA604It0=
X-Google-Smtp-Source: AGHT+IEapBUe/2q4BqP1Fz3k3+uTpDMdMnbX48+PwRjLLwuQW6xXP+Kr1ttyV/Prp2f67wE2FiPm6I0EHEVM+H0MLdM=
X-Received: by 2002:a25:8206:0:b0:d78:21e0:c06d with SMTP id
 q6-20020a258206000000b00d7821e0c06dmr18532493ybk.64.1694072708967; Thu, 07
 Sep 2023 00:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230901113458.13323-1-brgl@bgdev.pl>
In-Reply-To: <20230901113458.13323-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:44:57 +0200
Message-ID: <CACRpkdbDkBUhP-ZaWaErr3MqjGgSyei0EUD7PR3URs6h_ZWMUQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: remove unnecessary extern specifiers from the
 driver header
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Fri, Sep 1, 2023 at 1:35=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> 'extern' doesn't do anything for function declarations. Remove it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Right I guess it should never be in headers, the one place
where is makes sense is if you're suddenly exporting something
in a C file, such as to expose it to assembly.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
