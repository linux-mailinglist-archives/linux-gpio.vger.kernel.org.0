Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D55A7A74FD
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Sep 2023 09:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233853AbjITH4l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Sep 2023 03:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233867AbjITH4P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Sep 2023 03:56:15 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B642138
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 00:56:02 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-59e88a28b98so9058087b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 00:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695196562; x=1695801362; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0W2F0GXbbtqn7CRR5nnsH3NJIOvd/wi06m4wX+wnCSk=;
        b=C3GN6J2+s9vi6NkInIZVTPJHhsLeNTnqqkADfsy10nKvVQDi2kRM7Dw3gxbGHd9Jqj
         i3nYoma+O4jBNi2Iqei9KbEQWwvK5qxdD418E13y/gZlv07xPr3hSZPPhjCFrqCGf1mH
         aEFKITaePrrMlmSm1KwB2L/+V64SqprAjTVBuYdC4MkuabbxY41wWYom7AW6SVC1mX+5
         TxbERl56q2jQpswFf03gBUasUY3Tm5/sXC0QoWRVzfpEVmU+3J2xaMwhiiYR08GQU1qg
         /I+k4hSoiT9GYK1RN539hHZZxxI9jqnaAu4Fg8E4KjjjBw0HmejD58ED2iwqhJHxh2UT
         BoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695196562; x=1695801362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0W2F0GXbbtqn7CRR5nnsH3NJIOvd/wi06m4wX+wnCSk=;
        b=LGpy6Dyz8bYdu6HwxaTxq5uAhNsBp2ddEFy7gouXZae6I89p+1g8HcFr6sruiN/s9U
         AoWoCLz0Vd/cOP4NtuO3ilh+Ai8Z86/bkHNTgHGNnGsv6enOxQpr28ExkuCVEiJAc73f
         7Fmk1/HnsEvIGvHg9CL5IVQIZtfukCpXWN/JOSim53LV/j8cUZO+Iu8CgugJn8ybWJ8e
         6cfDMy08LXsDB++uMKcwOcxFN8A/phollR2oXm47RT+TE1GyAKvoL72/50fZHhUtysWw
         VW8F5ERxPR3TO6R4V5fdTAT/TTBNvcb+DcfZVSOhuBa8nrAuVGFjeZLo9uGLRUNmEeF8
         B0hA==
X-Gm-Message-State: AOJu0Yzly6sXz0fhaMQy+xL53zYLKb76DvGbuJMwFBR2KRZY7+2BfmpX
        gUMrJjJZR2eTsp4xD+4HHm3gvJWnjzuucoXr9TDPHA==
X-Google-Smtp-Source: AGHT+IE8ZqLABHkmB1AmVdyVdn+zBjcBgUb4lYtT3ybz6pYiTkDfaC6C0g3wu5g0PMG3zmMsCIys38gLD8uinlOnnuw=
X-Received: by 2002:a81:6dd1:0:b0:59b:cf74:ee8d with SMTP id
 i200-20020a816dd1000000b0059bcf74ee8dmr5249310ywc.10.1695196561782; Wed, 20
 Sep 2023 00:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230916081615.4237-1-iuncuim@gmail.com>
In-Reply-To: <20230916081615.4237-1-iuncuim@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Sep 2023 09:55:49 +0200
Message-ID: <CACRpkdYPtxAZrf4=btbF53U3CGgSMOZ_39eJDWjBTwBU21XYaQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: sunxi: h616: add extra gpio banks
To:     Mikhail Kalashnikov <iuncuim@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andre Przywara <andre.przywara@arm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 16, 2023 at 10:16=E2=80=AFAM Mikhail Kalashnikov <iuncuim@gmail=
.com> wrote:

> From: iuncuim <iuncuim@gmail.com>
>
> Some SoCs from the H616 family (such as the T507) have the same die but
> more output pins that are used for additional peripherals. The T507 SoC
> don't have a built-in multiphy like the AC200 or AC300 connected to the
> bank A. With the T507 these pins can be freely used for any other applica=
tion.
> This patch adds the missing muxes on banks A, D and E.
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
>
> Changes from v2:
>  * replaced gpio alt functions from "h_i2s0" to "i2s0"
> https://lore.kernel.org/linux-sunxi/20230909094529.6083-1-iuncuim@gmail.c=
om/

No review on this yet, but I think Neil Armstrong is familiar with
the AMLogic stuff so paging him!

Yours,
Linus Walleij
