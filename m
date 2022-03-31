Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A8104ED1F3
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Mar 2022 04:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbiCaC5M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Mar 2022 22:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiCaC5L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Mar 2022 22:57:11 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98A711BE7E
        for <linux-gpio@vger.kernel.org>; Wed, 30 Mar 2022 19:55:16 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id m18so17312494plx.3
        for <linux-gpio@vger.kernel.org>; Wed, 30 Mar 2022 19:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=a7pOFdpgi4pkphQxhSULDsX9mt+t7xz2KkFov/WBcMQ=;
        b=VQ1DK295sBnAQ+WMfHPA5ONfFVPazSiUZVtFrRXhNZzTFLRiJzEOdrbcP1+3etKR32
         1fAgFIZZQtOD3JqXFv8shryRh3JNnlscWbcMAZ/f2gDwGcCJ06F39CPy+tqToCmtm1Jq
         WAta5GpKsNIWHTBpvDi/czXMYSsB8hp8xkKG1rkdx1qEOs8bzOmgCGNbMjXBWhOiCCHn
         ZrdPfv4Xlei5Y2HtnzTGnzFGHUZhmkOweaPBRDiDzxPBJa+8h/8yJC8cKQ1dxQ7sute1
         ddUQrwegzBAyLznkkko6eo1Xfjn6EGFe3QrBon4/tp1nDcyk+MSOLSWBG052nYNBI6UB
         W1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=a7pOFdpgi4pkphQxhSULDsX9mt+t7xz2KkFov/WBcMQ=;
        b=BGhWOKZuFHMmszBn5SDym3AgucIcbkh5UN5sCq0dLzuK27YYjw1lHOgDTSMwoPZit4
         yeEuRRC4P/KID9F159TX39MSidF4xglTDljJPqnoRmB5gY6IILUqdyW4YVugFKqVy67j
         K0ZtiJo+85S8G8d9Vl1jQwUjCxAaVYLONvZdjKI81F4cQtTg3DgOriv58PbHyxnp+dps
         ZmzSr5hJnciKh7jgOalirMCnSA5hh6sIRfAzI2d/bDHxf7Iw1bYilZVrJxTXD0howjkS
         kQ6zrrZGUfIcEEqTDwW+/I0aqCsXOZGnb4caNh1AYlRMd1Hz7NAU72TBWbNrUhA+PSt7
         1wSg==
X-Gm-Message-State: AOAM533LHDJIAfd3h+bfjVwlMCGFznPaTpEJsyMk2fsiNS03Q+ME6k7Y
        MuCikPArYQ2/T8urM5lZvgXdgoY48xaNmg==
X-Google-Smtp-Source: ABdhPJwEllNNUt2RW6S//NokB7KiMQ4d/pNp+fzsDUy22UIhM83SNYuo0iWIGN5BZilEjGNj2ENJZQ==
X-Received: by 2002:a17:90a:8d08:b0:1c6:5ada:9920 with SMTP id c8-20020a17090a8d0800b001c65ada9920mr3546416pjo.126.1648695128951;
        Wed, 30 Mar 2022 19:52:08 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id f15-20020a056a0022cf00b004fb32b9e000sm17914260pfj.1.2022.03.30.19.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 19:52:08 -0700 (PDT)
Date:   Thu, 31 Mar 2022 10:52:03 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        andriy.shevchenko@linux.intel.com, thomas.petazzoni@bootlin.com
Cc:     linus.walleij@linaro.org
Subject: gpiolib: why does gpio_set_bias() suppress ENOTSUPP?
Message-ID: <20220331025203.GA53907@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all,

It has recently come to my attention that the setting of bias by the
cdev uAPI is a best effort operation that quietly succeeds if bias is
not supported by the hardware. That strikes me as being a bug.
It seems I was aware of this when adding bias to the uAPI and intended
to fix it, as shown in the comments of v4 of the corrsponding patch
series[1]:

> > The setting of bias is performed by gpio_set_bias, which is hooked into
> > gpiod_direction_input and gpiod_direction_output.  It extends the setting
> > of bias that was already present in gpiod_direction_input.
> > In keeping with the existing behaviour, the bias is set on a best-effort
> > basis - no error is returned to the user if an error is returned by the
> > pinctrl driver.  Returning an error makes sense to me, particularly for
> > the uAPI, but that conflicts with the existing gpiod_direction_input
> > behaviour. So leave as best-effort, change gpiod_direction_input
> > behaviour, or restructure to support both behaviours?

> Thomas: is there any reason not to check the return value of these
> calls for errors other than -EOPNOTSUPP?

that being my comment, and Bart's followup question to Thomas.

That went unanswered AFAICT and the issue subsequently fell through the
cracks.

I would like to fix the uAPI such that if the hardware does not support
the requested configuration, or if it can't be emulated in the kernel,
that fact is returned to userspace - bias being the sole counter example
as far as I am aware.

The simplest fix involves changing gpio_set_bias() to call gpio_set_config()
rather than gpio_set_config_with_argument_optional(), but as mentioned in
my comment above, that would impact any existing users of
gpiod_direction_input() that assume the best-effort behaviour.
I haven't been able to find any such usage, but that could just be proof
that I'm not looking in the right place.
Any input on that front would be greatly appreciated.

Also, fixing this as mentioned could be considered an uAPI ABI change.
Is this a bug, so that is ok, or do I need to consider adding a strict
mode flag or somesuch to the API?

Bart, I'm also hoping to extend the gpiosim to optionally not support
bias in gc->set_config() to test this case.
Any suggstions on a configfs interface extension to do that?

My apologies for the verbage rather than proffering a patch, but the
different paths have vastly different costs, and the simplest solution
has the potential to introduce breakage.

Cheers,
Kent.

[1] https://www.spinics.net/lists/linux-gpio/msg43579.html
