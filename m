Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77AFA4DA087
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 17:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350279AbiCOQzR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 12:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350288AbiCOQzQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 12:55:16 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703644C7A7
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 09:54:03 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 17so25228512lji.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 09:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7w9l4K+vQSjlWhwnZW0PPcugEDNn1dSWiRZByr+CSKU=;
        b=QAV4mcQih963HLU1bA4pOimN2PrfqeizNgGTbtny64oUxGR4PaKLiXNb2hU38KQQeV
         uD1BWtxM/FROQJIkCF4vaEMfX/gDey6nC99+s3I2uinPXsMuIFZY7WAi/2WycG9lQ/OY
         +CuEdBPGpcv/BJegkz7QLBqTzNbUsop2p1KMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7w9l4K+vQSjlWhwnZW0PPcugEDNn1dSWiRZByr+CSKU=;
        b=1LUagRC4P4QfV6xznpZsH/+khXOfKvjEuTahtnOUY12xxN6bnZiKwqIpQ0Iyx4rTMr
         5fLjq41RIqEWXAdOk9JBSn3eDuamQ24DdRfUfLwj/AZyHChRhIAooAlV+wZyJTnlvTb9
         YgUHuIEwzclUt9HYe59Z5EKmKO14eYt0tSE98V1RRsvFpEsaogcHRcEEYBnuXDk+KZcT
         mkb7tGPR+XS2OrHim+IKP4Bl6jKqiok1+9LgrZGHL6/oXTEfvZ5b4Y5scpwe8mEilO0s
         oZC+Op0yXrZZI7Z7GTo02byGVD8bhD11UXIiW9aSGvGv0jY5IZfzQSc7Sflm8TVKhDUe
         2rsw==
X-Gm-Message-State: AOAM532iAL/7C918J3LGmI/0DMZpukGvfrtKqYuxdZuQqcGxZ2MFxT0L
        AERY7sSTyIQzN3lX3luWFmgRxQhr2Db8xb+T
X-Google-Smtp-Source: ABdhPJwEjX2ri1MAj8d9bVxb+G/g21lyjrn1iMrD4aWPkAcMvoQGBZ8sxKbZi+QczVHzbZO6VUe3Yw==
X-Received: by 2002:a2e:b014:0:b0:23c:9593:f7 with SMTP id y20-20020a2eb014000000b0023c959300f7mr17281756ljk.209.1647363240791;
        Tue, 15 Mar 2022 09:54:00 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id x40-20020a056512132800b004489691436esm1088512lfu.146.2022.03.15.09.53.55
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Mar 2022 09:53:56 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id s25so34056973lfs.10
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 09:53:55 -0700 (PDT)
X-Received: by 2002:a05:6512:2037:b0:448:92de:21de with SMTP id
 s23-20020a056512203700b0044892de21demr6965471lfs.52.1647363235312; Tue, 15
 Mar 2022 09:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220315165205.1502325-1-brgl@bgdev.pl>
In-Reply-To: <20220315165205.1502325-1-brgl@bgdev.pl>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 15 Mar 2022 09:53:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiN3gqjC_rDQ=b0W=XpC8oSsvLhT2O+MnGr1FWEVGMGVw@mail.gmail.com>
Message-ID: <CAHk-=wiN3gqjC_rDQ=b0W=XpC8oSsvLhT2O+MnGr1FWEVGMGVw@mail.gmail.com>
Subject: Re: [PATCH] Revert "gpio: Revert regression in sysfs-gpio (gpiolib.c)"
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 15, 2022 at 9:52 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> This commit - while attempting to fix a regression - has caused a number
> of other problems. As the fallout from it is more significant than the
> initial problem itself, revert it for now before we find a correct
> solution.

I'll add the links and the cc's to this and apply it.

                Linus
