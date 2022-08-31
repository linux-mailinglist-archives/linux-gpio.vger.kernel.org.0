Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABD085A7D89
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 14:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbiHaMhL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 08:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiHaMhD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 08:37:03 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E03A2408F
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 05:36:49 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id a36so14381789edf.5
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 05:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=p27ll8CtVSLpLMfWeALRUXdWHvLDiBdeF6arG5Pph7w=;
        b=wiLhC7O9iv+1pUBo9BF+Qrb6OCleD/V+QE4yUpyNjMA6pJHXp+pO/FAmC43UHbWW/x
         TJPDxakaNXWEAXeuNM0wXL4g8NB3WwsYB8EsuJ8aGlbIzR+OKC1Cae78kc/6t5ILvjHv
         eSCJQB6AYmZTGHdyEBp12kP8lI0E1PbJMywlnQ/k9TTdgKHRkhKH8falcdITjkPZoPXw
         v4uaqtxmbJXNErFTksjkmGWZd/2NdYmmmLu625O1VZV4V5s/zVdozurdB0R/aJOTpn8r
         jK7KeQALpNlgj68hbdMl2HZRRYpAiHmS2nYFGC+BDB/mPDDgJJEgzEABxXURo1nJeOhb
         TRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=p27ll8CtVSLpLMfWeALRUXdWHvLDiBdeF6arG5Pph7w=;
        b=qHQgOhUSqRtIoOKu4E1s3MB74r+K9mBFCb1QhiS6z8vPUD8R2GJF0O1uPGYtre6zID
         Aa7piI3tKqM8w+UBwGsFNZIculCc4bdbcDsQnh7LT4MMs8h5kcz15HA5x53BJGZvM0xj
         AJ7ryRf+u3yrQpWot4Iu6YIrLNMEPpi8cNAzWrsr/FNR7QuDxPLxBgqqn225drabJ8Cs
         jmGQFOdl3DGkBnchphGDQFz9NlpG3j6jFAlrDcRZiRxhaeLK1hgYiu1DJH9hNQB7h2CM
         UHIrb40K4S78aDw3p1zl6zZEpZ56LEYfqtY7Q//8CItqSONClE7ftDAyrJUgqapkz4yJ
         Q+EA==
X-Gm-Message-State: ACgBeo3G2rnPKsSOo1bYby2sGGtDM8RmJtPgjeO+T/s2G3YVfhFX7EX7
        3VV1g+1hydGQ6FO2SlnlOGZ/WAU+WbGbhfR+aHcXC+PKAKI=
X-Google-Smtp-Source: AA6agR54ninAXNMpIyo6FTmW+N42f5mTqy6RjeT5XkAHGh6UPTfWNqAS0AKjDeFW++mbyawDKUFpX1Kn3bAs2zrZmKI=
X-Received: by 2002:a05:6402:1f8c:b0:43e:8fab:76c with SMTP id
 c12-20020a0564021f8c00b0043e8fab076cmr24187606edc.126.1661949407977; Wed, 31
 Aug 2022 05:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220829133923.1114555-1-martyn.welch@collabora.com> <20220829133923.1114555-4-martyn.welch@collabora.com>
In-Reply-To: <20220829133923.1114555-4-martyn.welch@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 31 Aug 2022 14:36:37 +0200
Message-ID: <CACRpkdaPa0CbF2r9RbDnC5oEVdt4vM7O9xg3Y30dekJs3wuwEA@mail.gmail.com>
Subject: Re: [PATCH 4/5] gpio: pca953x: Swap if statements to save later complexity
To:     Martyn Welch <martyn.welch@collabora.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, kernel@collabora.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Aug 29, 2022 at 3:39 PM Martyn Welch <martyn.welch@collabora.com> wrote:

> A later patch in the series adds support for a further chip type that
> shares some similarity with the PCA953X_TYPE. In order to keep the logic
> simple, swap over the if and else portions where checks are made against
> PCA953X_TYPE and instead check for PCA957X_TYPE.
>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
