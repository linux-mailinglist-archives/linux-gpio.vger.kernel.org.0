Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1CD3714A1C
	for <lists+linux-gpio@lfdr.de>; Mon, 29 May 2023 15:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjE2NSD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 May 2023 09:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbjE2NSA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2023 09:18:00 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 575C211A
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2023 06:17:41 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5689335d2b6so8146307b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2023 06:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685366256; x=1687958256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkLhgfF7z4VebboFNthWQnJVUl4qCl0xXQ0idChm7qc=;
        b=yRZOG0Mt73HKtjIOzpwXs1psdJVvjTbMSi+aPnWR9D8L/JU4/+V8Droy7i2XO7Nrln
         /OMhPdxWNF0x5tuddrsINx46poxGXSWaMUIg52/yVgC/48A6kegjH54q9PTNxusSynrJ
         dMUEhG9yOrD+fQD8CMilMg1gPGLjcQjC89VHzSdsYwKOgXSTJe9XundLNsgefBteKTvH
         5uwRvSS7eHstDabc1FI/arnOxp32KrT7G5Gx5689Fr1OwKjXpZWt9bPieOixkdzPsGEk
         FOy2XHyrST+r80n3KIV80XVodx/9U2/gBy2nXYpM20GUL2n5MeIIJ+/pOnCEXc+eaBh9
         NKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685366256; x=1687958256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkLhgfF7z4VebboFNthWQnJVUl4qCl0xXQ0idChm7qc=;
        b=BGrNGZCC5GAhJwyU4b4JMRrZxIKsllucaHLUMh4wAOjclJS6NQaSn7PpWNe9AXXeXP
         k4YV+WqOF47sLN3hXJagWJ+nkpBdQgenRIXv6o30vNTCVIxsMkmaFCmKKFEyla/iFJ6/
         TWG+tzJVwD96q2LCy42L+4u/NKOh9n2ZbOFzi92/2ibxpD7pBE+GYZiOV5vpdeSYdAjr
         W6vAe+RCHFynehgERmvxKFg/W3spUEVAlv6wUVMV+ImLJINSkaNSxlQV5E7nJ1lWBJX6
         9In5Ma9R4iH6Vs74y0KbsCaG08CNkmMINh9QPBDhbgIYDWeHkVH5TWUfCS0nhXzAd0kK
         MRCQ==
X-Gm-Message-State: AC+VfDxxAPQLvhbTzjfL5TD3YMxPnKnoxKSuOEza5tE2Jg9zgChEaGpH
        Ng47brngnD1jb8jnROWzjejR7MGaUsvfTLbmtEioetePnjhfGgAo
X-Google-Smtp-Source: ACHHUZ7d32A5nZL6dVR+wJdgn0htVIe9PGZrJh7A5kUG5dSlL6GvvpfzNNi04X/kIlbjQv1yYoLpZBNx8j67AlzkHZU=
X-Received: by 2002:a0d:fac5:0:b0:565:a6b2:cbd2 with SMTP id
 k188-20020a0dfac5000000b00565a6b2cbd2mr11981816ywf.4.1685366256581; Mon, 29
 May 2023 06:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230525204258.711186-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230525204258.711186-1-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 May 2023 15:17:25 +0200
Message-ID: <CACRpkdb1gfh5wU5J+HSMEmo3h9gcpJyeArJAuO5Q=Puz224V-g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Switch i2c drivers back to use .probe()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 25, 2023 at 10:43=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
> convert back to (the new) .probe() to be able to eventually drop
> .probe_new() from struct i2c_driver.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied, thanks for driving this to conclusion.

Yours,
Linus Walleij
