Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC9A6072C9
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 10:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbiJUIrz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 04:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbiJUIrl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 04:47:41 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A34711DAAB
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 01:47:35 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id q19so3232388edd.10
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 01:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bavV4P7OKw1IgK2eENvgKNwFDV/aull6H4XXgOQpF28=;
        b=na72mVoy6itxA2pHRQgFnosyJadW+mGN6I6QtP7L3uR33LBrk0wJ1eosT21RUeIrbI
         xNXhR0wFZ74DBNa4nPMnI09fAf5iDTYdCKW6WDNpoJuPHfBqGYXMbqrxBZdFQeLCqs3a
         WQEuSzVQeo1ES8jA3UfXjxweeU5OAGz46OmBQoEBzzEYqiwSqgmDq9mcDzaITp2J4jMp
         1TiES7vsBseX++pJ+m4jDHSGVEjS8XgHo6zvFCCowrxccFK+7fmP+cwDP8s06BhsBksw
         FxJkKUmb7DZf9zFcEJNd3KDCbqeAvKIVeSUJIvMoYKoS0TsKrEg9IoJIfPYheVCzsdWQ
         s6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bavV4P7OKw1IgK2eENvgKNwFDV/aull6H4XXgOQpF28=;
        b=N3+ebryy6Ln8HDWRsCcVVHSTssV/0jITU3SqXF+5u6qO3Q9uf1uhAAswHW1K3OH/LA
         2qaZws4pRAg/z/Zj3mvmXEsO7D9XLws08H9nNvK00Iiif78gLamTsZCiXIJevdruxh8Z
         KEsjWxnZjwtv40A5VisZeIntw91n6pOxdMHSclWjoyG5jGF8W2mboTUK+tYkU+DV+fnr
         U3XHywuzcHdEsWPkE5Kg4Uljku53HDrb5R7vuhH2G8Njfq1u9YTQiJ/Ye7ehVjWmhZ9p
         27Gi8jj+gesM1XVTDanHZV3PE/vo7vyP0HmLfv1n0JQlIPmiXQZTjjxLRyYNSKYoZA7F
         DCJg==
X-Gm-Message-State: ACrzQf18Q3krqq9nsNTkDIvItc4o9hgbSasq5bIxSBzauyycmerWUy7L
        59ghtl/jzjustr6deZGj3Y3AB2udQkEg4Ltwy1UZjw==
X-Google-Smtp-Source: AMsMyM5m5PWCf90NaTE5OHeDUo06IyVSolnkSSrIJd0MYpGJ7n8h2an2M3VrJ2IRoqy4HZVLC44OdaLmgJ0Os3ekt0o=
X-Received: by 2002:a05:6402:4029:b0:45b:d50c:b9b0 with SMTP id
 d41-20020a056402402900b0045bd50cb9b0mr16152859eda.126.1666342053103; Fri, 21
 Oct 2022 01:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221018151223.80846-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221018151223.80846-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Oct 2022 10:47:21 +0200
Message-ID: <CACRpkdZ0EtkGS+3SPTtJ9Q_oHVAnbicViEYii0uZYo+SFQGPCg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: cy8c95x0: Don't use cy8c95x0_set_mode() twice
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 18, 2022 at 5:16 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Instead, call it once in cy8c95x0_pinmux_mode() and if selector is 0,
> shortcut the flow by returning 0 immediately.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
