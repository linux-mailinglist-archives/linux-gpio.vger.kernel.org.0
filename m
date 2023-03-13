Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1D386B8478
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Mar 2023 23:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjCMWGp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Mar 2023 18:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjCMWGp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 18:06:45 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A271499A
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 15:06:44 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-536af432ee5so269575837b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 15:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678745203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDSutTgmKMCzkXOAh4dHXuGXia0yDOgzcFYr/UXcwBo=;
        b=TQ8/UrebPYQLD7/MbMOckpRJGA8ehjLooWQRX6dt802BjFz/lt6dIC3g3KMTcCv6Jc
         MpHMJKC4B7BJIWbabnfV9miaVRRYb0e+Qfex7EK+LM1o01rHy+tAGwmqdlv2fQLP3DMH
         XBQFZrih3hvJqL8c9iX1g5tJP7VVIoHgMg1XMpkjo9RqvJ6Z4C0MQmok3uHZbpG1DJgm
         7sZR2szCsMGhzNyn1EyvSZDKFlKDpN41To1sDM7HpuDcwncnYkTpxqXqtOpqAmNr1cid
         XATwgoBkKFDvbN2dTy6jyoQ2r7B6cciFQrwFmUEleYoAB6wVyUM5rh33dTPj3UmHQ0yO
         WYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678745203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zDSutTgmKMCzkXOAh4dHXuGXia0yDOgzcFYr/UXcwBo=;
        b=rTcUyCliz85GcFXIRnBm20OZef4GZhvBIWCmaiMOxWQwAmJQHcSTkVaMplrCFQVvld
         ZRq2UwiR77pK8gRnoairKk3XQPpi/uDqjbTqqazC4Ms2XiNwMZo+4gCe/YVf/rt0Q1Ki
         Tr/1N8XpvCENuf7+ad6amTrtdaM9t9QJUA7ODyVisMlQQoxzckPWYpAj2XHe+DTOoOQJ
         1lf8/qmQwixpvbdOgeft4uWtgiDukeZ3tQMWf6JIpuuD7MQCaTjJ/s7NX4ie24UyIkev
         Nt++s3feNXmK8qrNUD/BUUwyb/and0jjZ3VoxJmxgDPVI73uCKnAZa8WBqhvHwXRfN9S
         V8Gg==
X-Gm-Message-State: AO0yUKVpkkWz+VEKeyP0tOWaJXvoRYQV9COgfsanual09SCVwSQTHO1P
        4P6AzwTElati1TINq6uX3zJIbxtgzIgaNzpDs0wXe3Ed5R0DGctA
X-Google-Smtp-Source: AK7set8Ag63Icu1bHxui2dhPfOFZeJNUODABVZR0M7fZa+031ZIxGTNegsZqkT2OYg5dMl5RFeXcClvNs1o+nZ1gspE=
X-Received: by 2002:a05:690c:445:b0:53d:2dcf:890d with SMTP id
 bj5-20020a05690c044500b0053d2dcf890dmr9350195ywb.4.1678745203384; Mon, 13 Mar
 2023 15:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <ff9c14781110bbf19b56b45dd1f01e6da90319ad.1678704441.git.geert+renesas@glider.be>
In-Reply-To: <ff9c14781110bbf19b56b45dd1f01e6da90319ad.1678704441.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Mar 2023 23:06:32 +0100
Message-ID: <CACRpkdZJ_MsGDzMomoM9apXvcxppiUn+==5qUr+hGbs+pccNCw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: Drop support for Renesas-specific properties
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 13, 2023 at 11:49=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The last user of the Renesas-specific properties was converted to the
> standard properties in commit af897250ea54c6f2 ("ARM: dts: gose: use
> generic pinctrl properties in SDHI nodes") in v4.10.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Neat!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
