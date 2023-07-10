Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7F3474CF38
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jul 2023 09:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbjGJH46 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jul 2023 03:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbjGJH4y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jul 2023 03:56:54 -0400
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D5E1A5
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jul 2023 00:56:49 -0700 (PDT)
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-47e85cffca9so1385952e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jul 2023 00:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688975809; x=1691567809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SMcg4ntVS4PMD7oU7uEd9PXhmzkVBAGMmfrBwEdvFs=;
        b=iZE3cTLqTyzvCtOmvj9sDwjVWhc1buL52BNF3H4kGzy6AKdxv0q2Vn/Tdr7hFl9lC7
         OpHD0yRFAhnnzwjLtfBggjDltoogNXaLmfJVv0qMNuMOG7R6nMx3KICPRgUhYH54XZB/
         wC5ksD0Ta7cBMma8swDrbkwbOHTYsowKLsuAqo+Iauzmr+ZAuj2f71cko+TEYBZLDEna
         8G9d3TqD4v6a2nbTpjIdNMz69418BWTE0ol+EOCDFQ0mq0fsBOdMXcOwj7jiK8E5a90E
         Fc/Xvie3PAE41Y+3rI2fPOvS6aIxXYW5VKWyLXnxwFD/qhlenQxQsz3mOnxa3t7J4/Sa
         eO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688975809; x=1691567809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SMcg4ntVS4PMD7oU7uEd9PXhmzkVBAGMmfrBwEdvFs=;
        b=hq/naOtlpJ8vhy78uB67RNJrWqIzy+ndrEmNqPvqcVt9b5V9aPAeY+INeSj7RSPgpq
         MLsw+njE3/0U2PqoVlMLxjNTjRNiAtZipZ5mXKi0SDkW8RLioZgTySl+kSsx3XRrRxh+
         /u+q1pvenvbZq1Ux0WRjUEkIYy4ib309yQMo0ArbnQ6qs3VHJ0EnXd2WxVhj/zP/C5rL
         9lKei1chnFgU5xg2DZSkp0lMn95tzUTJdJTksaJquZqW5cXwA67lA4VB32R2KW+L/GRR
         PY06+r4ENA3N6gZWSXMdw6rO0LJCdXhHb4+FfDKTywThK9rG6YlJiW14nCck3cR8KPSA
         aQ4Q==
X-Gm-Message-State: ABy/qLbDcqzlRUUDajERFgNYUUc1EwYxWIFWY1iQ/5oiq9yqvN9JzQPv
        d4yKgl9mT2V8ahPnpTAJRKYWRRy+DKqqujIk/cDtMg==
X-Google-Smtp-Source: APBJJlHbtkKPCuN968hSsPZ15vwYlllyPWVVaeU9IeAWkVivLjjFnvDr49kZ6qkiG8ULoxOc2Nv24hpxunNjBqn49nA=
X-Received: by 2002:a1f:5ed4:0:b0:47e:47d4:958 with SMTP id
 s203-20020a1f5ed4000000b0047e47d40958mr5516321vkb.15.1688975808865; Mon, 10
 Jul 2023 00:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230706145611.2660657-1-shenwei.wang@nxp.com>
In-Reply-To: <20230706145611.2660657-1-shenwei.wang@nxp.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 10 Jul 2023 09:56:37 +0200
Message-ID: <CAMRc=Mc1H+JQF6AOpBEMA5-jVvppQ+Va1QXGdTi=PDn-iD9-XA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: mxc: add runtime pm support
To:     Shenwei Wang <shenwei.wang@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        imx@lists.linux.dev, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 6, 2023 at 4:56=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:
>
> Add runtime PM support and allow the GPIO controller to enter
> into runtime suspend automatically when not in use to save power.
> However, it will automatically resume and enable clocks when a
> GPIO or IRQ is requested.
>
> While putting the GPIO module itself into power saving mode may not
> have an obvious impact on current dissipation, the function is necessary
> because the GPIO module disables its clock when idle. This enables the
> system an opportunity to power off the parent subsystem, and this conserv=
es
> more power. The typical i.MX8 SoC features up to 8 GPIO controllers, but
> most of the controllers often remain unused.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---

Applied, thanks!

Bart
