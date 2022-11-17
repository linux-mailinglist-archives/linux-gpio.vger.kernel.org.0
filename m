Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1574762D700
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 10:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234798AbiKQJav (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 04:30:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233466AbiKQJau (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 04:30:50 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8220D240A3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 01:30:49 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id kt23so3580911ejc.7
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 01:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wNBhtqHC535LWnDlp9MYa/W74wDNMvcel9i9BhgTEi0=;
        b=NN0Hxs3J4iPHStj4kGshx/gnFdm/qybI3s9/K+Jrk6bLx1dE4O8t9G1sR7vK/MJQBP
         PsDxsD/Scsse0GzFiidR5/f9BzpiWwuirwbyCSiNDVB5mvz76g7/jvfPYdrHAVkuflyO
         vSrFRlMOXyDtQcMKZoGhfvjFIFJIR9jXCrHEsjAUvR5dwy6K0T6rO/sRLFI249ZUiJ9E
         yor9KKyxnj6gMO+z9N6vCoK8j4oT+O6gWY2k4pUOwxLbntcmgjB71NdiSnFuRBk/QSko
         5HN+GSPqq48JtWar8firz02fz8kHHGkRmn/hERgC19bfh7WzBresQS7DuI3M7lXUGxQR
         ODdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wNBhtqHC535LWnDlp9MYa/W74wDNMvcel9i9BhgTEi0=;
        b=fOgRt6a+agq8xqNjGdnbi+O8ll8nszXz7bLi2IJYnnn4rscV+dQIkIypj0welCzIMC
         QNkengU+ZH7imUp+dGOPCogIXA3neUY1yv6mXsUZH5gWe4Lojkv/SwTR/hNu2k8rbmiY
         JoKEeyP5ABktUPB7j1skPRfye0M31aAIYgSOFOwIBU0VEUKe1yRwlxEGklgKCZy7Z8tN
         B7jhdi4VnRYxlod3BxfXY8zDVbOxQ16x+VZpIlWYd/s+XWWe7g8UX9FPbzIE1U96qfdX
         UIJqwLPjxYV2IPF4ePfyPEZPh6obyg8xgWXK0wv4OgZOYYJlr7A7ln/i0QEBJ8ScDgao
         sXqw==
X-Gm-Message-State: ANoB5pmCt4pZ2N/TQcBo6SwBbmb4Dk5Bxa6YIn8crOkZaqDoENBsAYKW
        l8Qel0xlNDDatiq+kZYghRJ8c6aBcyIYiki33Q+aJg==
X-Google-Smtp-Source: AA0mqf7ulCP0MKL0HMkhoKm26vlqmUVA7+kyan8XY8a4kM0DRU/hhNB9sNA4+4FFOLAEnPl2yF5up6+MnKDf0QUU0/Q=
X-Received: by 2002:a17:906:ce35:b0:7ae:215:2dd5 with SMTP id
 sd21-20020a170906ce3500b007ae02152dd5mr1452888ejb.208.1668677448112; Thu, 17
 Nov 2022 01:30:48 -0800 (PST)
MIME-Version: 1.0
References: <20221115175415.650690-1-niyas.sait@linaro.org> <20221115175415.650690-3-niyas.sait@linaro.org>
In-Reply-To: <20221115175415.650690-3-niyas.sait@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 17 Nov 2022 10:30:37 +0100
Message-ID: <CACRpkdarFa3GYprA98Q2zq5nepe_naY4mZJ0q+HVvz-MBqWEMw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/3] pinconf-generic: clarify pull up and pull down
 config values
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 15, 2022 at 6:54 PM Niyas Sait <niyas.sait@linaro.org> wrote:

> PIN_CONFIG_BIAS_PULL_DOWN and PIN_CONFIG_BIAS_PULL_UP values can
> be custom or an SI unit such as ohms
>
> Signed-off-by: Niyas Sait <niyas.sait@linaro.org>

This patch is good as-is so I just applied it. No need to resend with
the ACPI series.

Yours,
Linus Walleij
