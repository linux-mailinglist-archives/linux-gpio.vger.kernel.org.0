Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E61D6A94BB
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Mar 2023 11:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbjCCKDp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Mar 2023 05:03:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjCCKDo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Mar 2023 05:03:44 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C44E399
        for <linux-gpio@vger.kernel.org>; Fri,  3 Mar 2023 02:03:41 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-536bbe5f888so33590987b3.8
        for <linux-gpio@vger.kernel.org>; Fri, 03 Mar 2023 02:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SsisNO2mMfNoGA5eQWAHS89uZBYphbEU4aiMBf5Ri38=;
        b=OH7JL77vK/P4cj+2hIIZS9w0Cycs2eEbmig005xq8PfPVHrQswcweaSXM/D6o0Q0sO
         l6EwsT6G954WYK1dpIQE3y4nyL+lgFvp3xuqkfUul/VD62tm1gMTqjZ34AE1G2zXWHqN
         uwRz8PMUthScJXSqbRM2Ye1CfF7oCCMm6Q67afSXBz9xocCKjUf9wjxNs7reUWhuLOqm
         flkz4zbapQpXqLe3woa5ArINak0/ggH92COKBu3GHchGEFKxQQC3WlUnkT9CWuxp37O3
         9ZMCL7kx77tcXKO6Tv4JDTYrx7HKZe7K8K+nCdVijFFjEZGPgnknEM1RCLNrTV0/Y9pI
         nArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SsisNO2mMfNoGA5eQWAHS89uZBYphbEU4aiMBf5Ri38=;
        b=jcEGXxmkt9sBbEcxBth0ZS2rJ5+gOL653g487uH+tn00Pdtc659OJZULr42cNBdGvO
         8X+ihxP+XCdyivtNF2/M7PZzrVKFgRUt/eT8KBaRO3tWvLtnijx5LQQh9lvPhaJdLPBG
         i58JcnKKdHJ1HpJ+9nlPzLyYVSIjNr8VTv+sIxm71QUQTS0r/84HGwWhNEUiwOBfIUEf
         bAGw/w7CiZlDKTTJVbaKAjpzX1B0aus/h+8IupmYJcfSvcHqdrGEVSuOfbWJfP8QaqC2
         zw0Y2lfd4ryWY7gD34WFTg0fpfhEAx0sPAd6apOY4es7Dp52fZavQk+XQEbJ/dyLriX6
         ffQw==
X-Gm-Message-State: AO0yUKXkaSgK3TnjV3DvDtS1bo4vlXea16zFmCIj6+CR8/UiGNiEYPbk
        4fxmlM8tHpGWeHqzRVWU2s1m+i9F1ROSF9FCGt7D0Q==
X-Google-Smtp-Source: AK7set+FSeib/yAEyYdXwItGfXxkdAfpRD0BUMJEAJLOOvMSeCsGuH+TS7euU5idS1Ix8qXgIqAo/Adi0HMsXHvsC1k=
X-Received: by 2002:a81:a783:0:b0:533:9b80:a30e with SMTP id
 e125-20020a81a783000000b005339b80a30emr525928ywh.10.1677837820451; Fri, 03
 Mar 2023 02:03:40 -0800 (PST)
MIME-Version: 1.0
References: <CAMRc=Mc_QzqGPcrqCT-aDSYV3ggeDosxu=0bcutVkqC7P8wU2Q@mail.gmail.com>
In-Reply-To: <CAMRc=Mc_QzqGPcrqCT-aDSYV3ggeDosxu=0bcutVkqC7P8wU2Q@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 3 Mar 2023 11:03:28 +0100
Message-ID: <CACRpkdaOy6o5Ehh6D1=8oGgVeCPzafE47mAqqba7O0-+Kun7=g@mail.gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v2.0 released
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ferry Toth <fntoth@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Drew Fustini <dfustini@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 2, 2023 at 4:32 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> This has taken a long time but libgpiod v2.0 is finally out!

Congratulations on this milestone!

This release is an exemplary application of Fred Brooks famous
statement from his book "The Mythical Man-month" called "the
pilot system": always count on making one version that you just
throw away.

Now I need to buy cake for the office.

Linus
