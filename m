Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3F4526BF6
	for <lists+linux-gpio@lfdr.de>; Fri, 13 May 2022 22:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384586AbiEMUzB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 May 2022 16:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384592AbiEMUzA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 May 2022 16:55:00 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 294AE2F008
        for <linux-gpio@vger.kernel.org>; Fri, 13 May 2022 13:54:58 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-2f7c57ee6feso102609607b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 May 2022 13:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LdknKTFAjuVV6cG3pEPQnMSdfNEMapIBJ9sGtA9Y09c=;
        b=xmMXBU3NmkyVtivyV63dP3bIvtMkreg3G2vlBW6VC6qDJftpmGZXb7rWsbSDpzwnbO
         soAf29nXLOaF4fnFpp0VKJ9Q/HJxJkgEfDnG/rcA7YSj5tJN3c/On8k+vdx5e16qGp+I
         Zn04CLtil4jLFL2MKQePF+OMCd4s3gl/O6i5GgHj7vP4YFxbzBKELPCKAtXGH71AbPdz
         EBSLGJl1PYdI304Gdwa2ruEvjYy/jZMpZjktq0WgI+RTyY0FGhDPwt9NDO/VT4xleHzS
         ymzu9R2WwIGGQxE1vO8YJ3I183gySCovNtEw2YJSZTavWsLdKsm3ik6/05PDHbo/5ltW
         javA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LdknKTFAjuVV6cG3pEPQnMSdfNEMapIBJ9sGtA9Y09c=;
        b=j3MDNQ+K9Z2I8kqrdRfS69DLYOKJmAUr/mHaR9ssUrFOlyiyn01fMO33vhuOIVnXEv
         gAN7kaMySxQzdDwtOGmZhAqXu1Xz3Rv7cg5nSoITG28ebG9EHaXXOINwNjep0x884Bsj
         BoKM4edvjR87IHKOFm6KbjDIi5YApWPFdO7s55I/1kAGS1RK6hmVp1jTsz8u1agKoouy
         DyI0TSqT70rXrlogRUTmqDQAkSrqxgEPtFsmuohFgse/ZzILlzJa4nTb1JloM7EMy++P
         flMpQoI9NMmMSviD6yQdcvIC0IJO2zqAm3DRRe1oIRQ3J3481QuWEex02rYM1CD7Lch1
         cPOQ==
X-Gm-Message-State: AOAM533jWR24HFiJLqwIPJlVlTmWHKIezaBdYMEyy2kxIE/QAaRsjwCf
        SFQHGHB+8RH0FnpGs1U2ZJza4YWcuDjL6I6Y8qXv2g==
X-Google-Smtp-Source: ABdhPJxPYfUJI+pU2KSqKyur2vWFLJAP5xoEG54qiHUWnn0lt/PmPx08z9HTjGpaf9iKB/bRclMaMq2/qf0xUEiybCM=
X-Received: by 2002:a0d:e5c6:0:b0:2f8:c866:7af9 with SMTP id
 o189-20020a0de5c6000000b002f8c8667af9mr8074972ywe.268.1652475297420; Fri, 13
 May 2022 13:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220512173921.8210-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220512173921.8210-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 May 2022 22:54:46 +0200
Message-ID: <CACRpkdZ50rd7dvZmsx5jTgkVKWHbx_Tsx9W-YY+mAO9RE3RfMw@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] Documentation: gpio: Fix IRQ mask and unmask examples
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Marc Zyngier <maz@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 12, 2022 at 7:52 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> After switching to immutable IRQ chips for GPIO drivers the examples become
> uncompilable due to wrong IRQ API, i.e. irq_desc_get_handler_data() in use.
> Replace it with proper irq_data_get_irq_chip_data() call where it applies.
>
> Fixes: 5644b66a9c63 ("Documentation: Update the recommended pattern for GPIO irqchips")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
