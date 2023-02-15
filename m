Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 360756979B4
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Feb 2023 11:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233948AbjBOKTo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Feb 2023 05:19:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233941AbjBOKTo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Feb 2023 05:19:44 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C9A3757D
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 02:19:40 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-52ecd867d89so208438557b3.8
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 02:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RVe4n2guCkN77wNmksIatS/+asEPT2MRD6rguYoxF6s=;
        b=PCdeAIr8THAY1l7JPPRZv64oTEfGmHyPM6gBpyUwXvh2+HRj8ZlKXd8pYSuATlTx/c
         wK2K+8tfhHWJDn9Xh4i+7UTK2K8mOqDZqemaZjeoqiAX5TBjhneuRZlwE7JT9cC1Br1t
         2eFkt92WEQWMJXrQAr3voTw067cqScYvszFl/KJiYVPqg9pm0L9itXSA52l6waimlr74
         rK2F5qJTLzscYrFCOSUM+2uF5DTJ+4HD1rWPXk8zilox7qP9YARMSSvmKxKGpGvI0q5S
         Fl2ZRQctuk25C+tefpNApe/tADH707p3kcTTtyQ7K0JeOTIUVfwryG+KATPsc0L5eRlU
         iDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RVe4n2guCkN77wNmksIatS/+asEPT2MRD6rguYoxF6s=;
        b=yt8UIY+klf0IINUlJZLQ4Wf2icB6E6xPtBRbndnwRuPx22RgR0hr0ixIrMquqOwk1H
         8mOdr5WjckN0dfOmTpMSQ987cTK3zV+FLVn4bgR9lmusEBVUBC7e9g5BeXXSF4ESmFW5
         HERTjwT7YrUisEUAyJvZ0cAx1vbOj4U3iIx+WaFNOlOPrvgqgtMcx15I4dRbL8r+Ltew
         1LCkF2eybNBYj8u5mBdIyjFA0eBwKtWeUAuP6vYMZGziJlScPtejs3l4OCxQ/aGq3Pup
         2l5+rpweDJ3/hpO6qN48jlQ12wkSYKSGNPTrJ0qXmPe2l+qW0JLeubgulZfvsoPOYI5Q
         6Daw==
X-Gm-Message-State: AO0yUKXuHLAWmhmo72vk+qBZ4EXZzXXZLLrp8I/pd+ax8s165gVoi6Ij
        Bt1vDltK/EWXJBy1JwNR1TUNtzFR+MFqXeRmI3np6g==
X-Google-Smtp-Source: AK7set8HcBJ9ltkOoWGhonkvU78QtPV0gE5DCXlJwMwgVLUa1iKBGsaH2he5xkm03TZ5jeDcrUyTwaK2WtAmmVBV3Yg=
X-Received: by 2002:a05:6902:384:b0:921:b101:d37a with SMTP id
 f4-20020a056902038400b00921b101d37amr226910ybs.411.1676456379746; Wed, 15 Feb
 2023 02:19:39 -0800 (PST)
MIME-Version: 1.0
References: <20230214073638.571417-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230214073638.571417-1-alexander.stein@ew.tq-group.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Feb 2023 11:19:28 +0100
Message-ID: <CACRpkdaV3Jv8=ynw5HUH8x7VGuCjFAiULbt-tRMZAU3T+Wo1Ug@mail.gmail.com>
Subject: Re: [PATCH 1/1] gpio: vf610: make irq_chip immutable
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 14, 2023 at 8:36 AM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:

> Since recently, the kernel is nagging about mutable irq_chips:
>
>     "not an immutable chip, please consider fixing it!"
>
> Drop the unneeded copy, flag it as IRQCHIP_IMMUTABLE, add the new
> helper functions and call the appropriate gpiolib functions.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Looks good to me, CC to Marc Z.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

We fixed quite a few of these now, Marc do you have an idea about
how much we have left until we can make immutable the default?

Yours,
Linus Walleij
