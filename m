Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A375507C30
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Apr 2022 23:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242939AbiDSV4f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Apr 2022 17:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiDSV4e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2022 17:56:34 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05433DA70
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 14:53:50 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-2ec04a2ebadso187343387b3.12
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 14:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XMSaAwxjrjiNU3osIbQVVRSLlzO7/jouyNe34lSDVJw=;
        b=kAI9LaEhHQzB9C8LRXYvLx7AzwTC1CilCLFWUwNhegBjdSI8VYhgrRl31FAore9MBR
         LiPei2LuFfF1nxtcKoA0sB30YxgVacMITMOSyt913xPd2wxQDHwgM7sZiaYqMN012h+h
         jaOAKXIeDCd7KSe6iElTB+sOKWIfLBlgC9NG4C9fJjNNpGNqKfuWqEu7L7V/9lcVcXDH
         CcLelVAuzR4syJmPg8n7RtliwnJ8XrnCkoYG+6u7rlAkXKi+rzFVE5lIe7pr7vQv+0Yf
         IvYb7qb38BZvsas9+N9fo5pV2MvtcdJeHBMvpu+r01JEzoyrsj3l9xqeXjxM1ow15U3Q
         /o3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XMSaAwxjrjiNU3osIbQVVRSLlzO7/jouyNe34lSDVJw=;
        b=d5TBa01MRMfZLV2xTUPrGLTc0HqhUXnjBFbPjj13qrGaSgW8OWQI7PowLGVJTndGmU
         uWVrKEoP3qnOirCOr9fAz3rVgKCm9KVbMkg7NnWC1xAtX787FoIfON1UWqiIaEimYiiq
         mq5hSpxRSx2LkAj7A3iIr6FJEvt2KKin06zSebD2mW45v34biL1cRFtAM8E464mUYA/y
         kHxW4yZgWNEDBgADx7aTWV+esoNGLeFIwsKlIfjmDcxE/vjepSGGIQGU65ydFFFVW+AS
         0xAGuT93N2Bf+0cH4LDuuLLV8ky6NBKQzw51xfnMk6RsyhmOqLWrUL+lpkC3JygUnSkV
         lqnQ==
X-Gm-Message-State: AOAM532YS+57Joo9W3IWEh1pvMRVl2/DGXlcbWfFK20bbWPtyNU01jTc
        m8HiGyrvT6Aslv6m0VFGLmejGkCfElvQnfBs6rlT9g==
X-Google-Smtp-Source: ABdhPJxLUQfrNE4OV5ZCsc+xOfrP2lvSC3nJxjsNYdmZ2zSGKKW1xN1z0ZGL1QAijqAvI8A4GYTYH2KxI6CSUWgAyAY=
X-Received: by 2002:a0d:ea46:0:b0:2ed:62f4:e23c with SMTP id
 t67-20020a0dea46000000b002ed62f4e23cmr17946391ywe.437.1650405230087; Tue, 19
 Apr 2022 14:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220415070710.220785-1-andrei.lalaev@emlid.com>
In-Reply-To: <20220415070710.220785-1-andrei.lalaev@emlid.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 19 Apr 2022 23:53:38 +0200
Message-ID: <CACRpkdYYA1CtSz_w8aioBC7FLgkEjO_Wk_XuL-LwLmpCouNfeQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: of: fix bounds check for 'gpio-reserved-ranges'
To:     Andrei Lalaev <andrei.lalaev@emlid.com>
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com
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

On Fri, Apr 15, 2022 at 9:09 AM Andrei Lalaev <andrei.lalaev@emlid.com> wrote:

> Gpiolib interprets the elements of "gpio-reserved-ranges" as "start,size"
> because it clears "size" bits starting from the "start" bit in the according
> bitmap. So it has to use "greater" instead of "greater or equal" when performs
> bounds check to make sure that GPIOs are in the available range.
> Previous implementation skipped ranges that include the last GPIO in
> the range.
>
> Fixes: 726cb3ba4969 ("gpiolib: Support 'gpio-reserved-ranges' property")
> Signed-off-by: Andrei Lalaev <andrei.lalaev@emlid.com>

Nice patch!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
