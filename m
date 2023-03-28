Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB106CC0D9
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Mar 2023 15:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233178AbjC1NaH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Mar 2023 09:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbjC1N3x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2023 09:29:53 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76ADDB774
        for <linux-gpio@vger.kernel.org>; Tue, 28 Mar 2023 06:29:52 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-545cb3c9898so154538057b3.7
        for <linux-gpio@vger.kernel.org>; Tue, 28 Mar 2023 06:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680010191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tecdx6nWRwoN0Q2Hu1krMUTcGTmyxfVrTsPRMfdDUWY=;
        b=jjdTExd0i8jgXnc251h2cJPO1q0ltzJ1t1BJls1fzGT5UHJV1YTJC1TTAhEYqJnTYh
         wWAW8UOeUdSlEiVRtl3zDGu1oy4rlOb+1nQyhQnm0Vzkg8gXZYdDo2ioCkZYMCNR/kl3
         Sv4jm/kjHah8xoNrJJiwvRHDTQ0AWK55Jg1vtqHefly1e8k/5phH0tGOH1y7rey3mNGE
         7DxaCVB7ROz/2XXuYRwUtD+PTYv0eUnbase8XsrTIErsWfsRMFfw9vne/StsgLYdmYFn
         vyj0Zh+qQRv0eopCSbq2n7IbrOcyCSxbp0MtragnPbSUBjTjN9OKIUIaISCeitIwcDHM
         bwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680010191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tecdx6nWRwoN0Q2Hu1krMUTcGTmyxfVrTsPRMfdDUWY=;
        b=Bn5rsn3O3dbT3+tPXTUZBEWDRwoKuYIewqXLORCbnlQ79nmRJXALqamKblqG44igJ5
         gug1WVIbDg8IAnBTmurRew0vdNhO57Co7ZRePYkkcAifV2OvutcTlxJUlPQF0GZafAoo
         3wVj8oYVHp7vZAcRRBIM5no8Cgl55wR0icaklOGj/aiY96crlUNPgQKY3nO9raHkG0pc
         Hi3z/cHbwZn605nsu2EMPa2xLy1N6z1xsdYN2L5FVfnnn7ZzSm4zWrmMGf+zAcD0NUaj
         WWJ4oFF/Ri9E/CS6B6CapF/MA9ZjP3j0d8G9KEwUf9ZFigicZdA42zC6PFuASK7T1BMd
         mQ0g==
X-Gm-Message-State: AAQBX9d7VK+jVx8rcs3ovBSDontMpEWnRJV1jOuj/6z3YHT6ow5+QWl3
        WjaTsNmuTc791i9sbRMKWX2nMp95dM+uc98d9m8hQg==
X-Google-Smtp-Source: AKy350ZvXq/h1ZTm2/g50xJmWWcThX2fK7L0G7R0ZBE2vZb/vaIA2g+UPyc+5tAHnPj8qebI1BnHCQ+CMMrQaju5mNk=
X-Received: by 2002:a81:eb02:0:b0:545:883a:544d with SMTP id
 n2-20020a81eb02000000b00545883a544dmr7414073ywm.9.1680010191720; Tue, 28 Mar
 2023 06:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230323122910.991148-1-d-gole@ti.com> <20230323122910.991148-2-d-gole@ti.com>
In-Reply-To: <20230323122910.991148-2-d-gole@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Mar 2023 15:29:40 +0200
Message-ID: <CACRpkdYYW-ZYnzqsHEurzwwgUvEEM64CuMb2nkRMLi=Tge57jA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] gpio: davinci: Add irq chip flag to skip set wake
To:     Dhruva Gole <d-gole@ti.com>
Cc:     Keerthy <j-keerthy@ti.com>, Vibhore Vardhan <vibhore@ti.com>,
        Tony Lindgren <tony@atomide.com>, Vignesh <vigneshr@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 23, 2023 at 1:29=E2=80=AFPM Dhruva Gole <d-gole@ti.com> wrote:

> Add the IRQCHIP_SKIP_SET_WAKE flag since there are no special IRQ Wake
> bits that can be set to enable wakeup IRQ.
>
> Fixes: 3d9edf09d452 ("[ARM] 4457/2: davinci: GPIO support")
> Signed-off-by: Dhruva Gole <d-gole@ti.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
