Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7BF5B1E8D
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 15:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232392AbiIHNTn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 09:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232414AbiIHNTl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 09:19:41 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330B713E1E
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 06:19:32 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id q21so16692253edc.9
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2022 06:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hD5OXMtLiYSOIRBjRrAVL/u0p1vcpt9OcFktqvDydiU=;
        b=bx/YRchjyb2nOvHtoc75bCkN+oQIDERZe+EWlS4MzTd/8AuxA+O7Eo1NA2SEwCTzSL
         h8DkRnlHGEaUUFNJVJATXqpBeaaUbO3ARMeRfqkuPjaaizT5yWx0Yf2loL90POmHI44A
         /jhooV0tZJ3bTKhdB3VgkqL32zGkfRJGpqXm+6WYnsAgmHYuaY7Y5U+e8mSfJ/eLAj/X
         Y9EWJoz3h4H9v4203B5s5EDpH4wHAs6UKSB88A/fwRIbyDHCgeDMzG74LGWBW2faPz1r
         bMH5iYbnJlQb2P3yxa81E/VjGHr02uZTbvDXsXhpClnk7wcKZ1nC4eJ8vBfVbOEYzNsv
         N/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hD5OXMtLiYSOIRBjRrAVL/u0p1vcpt9OcFktqvDydiU=;
        b=2j+X/vGKkltGgydm6Anm/tXqo2y+BlVuYylKb8ngahCE4bDqcNJDfXEssmJCJBMU54
         qxE5z0mSD50oHX2FkBS1tuGSyfnTt8fTRzkp+ujdaDs3HhMj2GI+shdT/m8B8JpNRJvs
         IwBi+TncHk5tKtG8YZdwGyFy5l0k5qcYiPETXxg3bAZbJiKXuj315rFp9TBVRFRJqaYQ
         JRC0fT9LvoR40pTAf78MH8hWQGTc3Pnt6WMWlXSpz5ftGOoAW0u1Kck6TKUPW1Q8nsJx
         lfRg/X58ZSVYcG2nqhuW+UPGjCL+y1Wt36NDH0uP9GQIFMeFp8wSBfOpMOyZpwlYO137
         YLRw==
X-Gm-Message-State: ACgBeo2tOwhZMWHKjP4/Cx5bWICaqxPN7pjB1mZeBAERsCXCozYU5eM9
        dN0+R1adu2et3jOyaS5YytsrNY/b1r7lwdMKdq7J5/z9W6Q=
X-Google-Smtp-Source: AA6agR7n/EBgjUAQ2j0IRBf7HDTjCCp6RUdm9MKV1Rxspw/JVsknP74Cazms8OeJnnN3GyZCJCFI4exGXDkDcMFAeww=
X-Received: by 2002:a05:6402:1f8c:b0:43e:8fab:76c with SMTP id
 c12-20020a0564021f8c00b0043e8fab076cmr7085760edc.126.1662643171530; Thu, 08
 Sep 2022 06:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220908094323.31965-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220908094323.31965-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Sep 2022 15:19:20 +0200
Message-ID: <CACRpkdZRtXxAUaXkpWemsAZp_F36k2skz0wmnv8jX1Hv_xgh+g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: pistachio: Correct the fwnode_irq_get()
 return value check
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 8, 2022 at 11:43 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> fwnode_irq_get() may return all possible signed values, such as Linux
> error code or 0. Fix the code to handle this properly.
>
> Fixes: 1074e1d23a5c ("pinctrl: pistachio: Switch to use fwnode instead of")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
