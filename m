Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A726965920C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Dec 2022 22:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233924AbiL2VPr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Dec 2022 16:15:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbiL2VPr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Dec 2022 16:15:47 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8194B380
        for <linux-gpio@vger.kernel.org>; Thu, 29 Dec 2022 13:15:45 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id r130so18110545oih.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Dec 2022 13:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fP9vW+f4HJx2PMQOsthzDPalvVom8q67NEFiBnQA94Y=;
        b=sHcj50okRU6B4RqAXfb6NJ+nmRgPRo/rlHkaapygujJhm1hEjkTFWgRfejemKXgTbN
         BIqAT2liXTV+lmID/h1yAu9xeRvogJ3ToeQCkStzggAYdta6pHdiigYmDhoS1Ku9Rwxb
         kkgiHxE/b9ZtPeOrX3CnSkvqlTXj5i2C4x8o84yZQM92dQMuyEqJqnfYXBF51kN3dMjQ
         4bJ9eNncYoz/n0Z3/OVYXzrRbBj1SzyKcoVpQaRy/lPbF32N+L6cbrn+UEw/hDjljuGD
         aJ2mPsiKFPw6kC0ZUophFVuftwPj7J/isUk8/MzyQouffzPw/BiFE1El5WU5EtysTzcg
         z49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fP9vW+f4HJx2PMQOsthzDPalvVom8q67NEFiBnQA94Y=;
        b=X78yW4ZFdbpHrFEKK+oZYvj70w6Y78us9R1kR+j9fdbtYxRR8iWkBJr1LE5kfjre/4
         Mu3+LeQy3MgnFc5UWQPLJVjkOb87FSPNUS20q7ZQ0iORudx5TBRaSL/WTW957FJUmDPz
         XFk6e9Mfogk2nrgKjSFrf3v+wacnigPRaqLyCWcXjgPlolhsinYB+lyeJghEi8uMygAx
         a45acM981U3s9e+4AYBWhbzDYvTjGaKc2GN4WE2k4nfv1wAsjsGRPtR6bOczuqbKmQSV
         vhZFgtMLNdU7AJ91kKHcxJgldzNS5RaERNvB+/rE/HdasQj1Dt6ZYpR3NJS2hcx7TEjl
         v7Qw==
X-Gm-Message-State: AFqh2kq62VKYx+uG5qpYcT/Gc/XAEUdEUnDKAQz1D4Wi3jefi2n/XKXD
        tokwJDN5DC36CQiwZH1/KdrL8d6AWGPHRJctUvT9FYgmF7EW8t5S
X-Google-Smtp-Source: AMrXdXvN6Orftn3hmgTYONNYA8qEr00HxkF5nIDdY0voe6NhcGplTvdTO4P6MhjOsMrSDZf5MiLAE+bleRvSudQXAPY=
X-Received: by 2002:aca:3dd7:0:b0:35b:8358:aed4 with SMTP id
 k206-20020aca3dd7000000b0035b8358aed4mr1553371oia.291.1672348544838; Thu, 29
 Dec 2022 13:15:44 -0800 (PST)
MIME-Version: 1.0
References: <20221219124240.62781-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221219124240.62781-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 29 Dec 2022 22:17:37 +0100
Message-ID: <CACRpkdbDevAJSjEKHdi+kovzuhuxJ2cbyUYNb9w8qimYMa__Jw@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] pinctrl: Introduce struct pinfunction and
 PINCTRL_PINFUNCTION() macro
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 19, 2022 at 1:42 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There are many pin control drivers define their own data type for
> pin function representation which is the same or embed the same data
> as newly introduced one. Provide the data type and convenient macro
> for all pin control drivers.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Very nice and helpful!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
