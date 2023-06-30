Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4BA743B5C
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 14:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbjF3MCH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 08:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjF3MCF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 08:02:05 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE201BE9
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 05:02:03 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6b7206f106cso1436022a34.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 05:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688126522; x=1690718522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TqyqOm5qilIW7cgur6kMDvDJlw3YFoa+Fn/upSKqwI=;
        b=Pm4PMdrp72OkTFFsudNQ1p7FOTU81rUL8ImRyMuDA4cBko1jbGEJi7YhqMwG0o9yT5
         G+EvQDFDoqL8IuDh5G5YGdG+XRw0HUqh3eOMa/N7IR4i20xyUvZhoFVHTkAuk02KGd5H
         EOmiqyzWc3O5ThfNjkCckEqE4so8vSD/mDlV3GcwwaMAV2O77Y0uYiV2ZVN9IWA4zyuP
         lN04ZQRPeFnteDj76i9QuwZFzfbK0ySu2O07qnSp3mbZgzngxGCPGVMXikhXb/rx7FfM
         YX0j9DnyZkbYFwQuVRZH3iLMgxI9qaYIH/pycB1mYLYITSue/X1qm/bWsRPp38RctHZ/
         04mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688126522; x=1690718522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2TqyqOm5qilIW7cgur6kMDvDJlw3YFoa+Fn/upSKqwI=;
        b=iXF0UWk/Rd5ypXQA9zOXjH57tciFz8mRxhC/jwlivsx8PljzTnje0OOzH/XOdhNQBD
         IEz53tXwwokTIwLTUfRfJmAnjVFnDV5E4CUAlz0XGVceV22Cva26tnavQH3U0SxOagBT
         E2wHZWOA/NMYY+QKOm2/ClA1LwL1mQDmPOYPtDp099Q8fzKRVvgSyUeMzs3r7xHdg9bT
         uUz+DlrJYRYFfb2eXjIjdT0+FVGzXrXJtw39iAT/AODRI1jdeKzb0IKMZR0KJ9TlYVP5
         NzDbXalutpN43XZ3ce2sR2MCyqH4xv+5Lrh/gaIlCufJApuTBDxK2WSrxORzN69+nmDi
         T5mg==
X-Gm-Message-State: ABy/qLZKP1XGWIzf+rCoOPgegEIcpNjKgwhFa/5vcCVAkm0CEvpRkiV8
        s2YoyIuxtiBWmsuHMb2ISxBi3uhZuexXWOmNOkmTGR6QgSJcYDbc
X-Google-Smtp-Source: APBJJlH1F60Ol/CYDhuLl4gaGYfSqtYihj2GPxTM9JJHUJnc64G/OcK0YUXeWCzaXayDEQ09kJ7OceQBHB/aMvRM/do=
X-Received: by 2002:a05:6359:a1f:b0:134:d45b:7dd1 with SMTP id
 el31-20020a0563590a1f00b00134d45b7dd1mr1962608rwb.21.1688126522411; Fri, 30
 Jun 2023 05:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230629101455.127795-1-warthog618@gmail.com> <20230629101455.127795-3-warthog618@gmail.com>
In-Reply-To: <20230629101455.127795-3-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 30 Jun 2023 14:01:51 +0200
Message-ID: <CAMRc=McT=kdGur0N7Oy3Xt8xhCb4D3kLXpSyjjUsB74bdx_T2w@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 2/2] bindings: rust: fix unclear resolver warning
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 29, 2023 at 12:15=E2=80=AFPM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> Fix the following warning:
>
> "some crates are on edition 2021 which defaults to `resolver =3D "2"`,
>  but virtual workspaces default to `resolver =3D "1"`"
>
> Clarify the resolver selection as the 2021 edition by setting the
> workspace.resolver to "2".
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  bindings/rust/Cargo.toml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
> index 2e026b4..e385027 100644
> --- a/bindings/rust/Cargo.toml
> +++ b/bindings/rust/Cargo.toml
> @@ -9,3 +9,5 @@ members =3D [
>      "libgpiod",
>      "libgpiod-sys"
>  ]
> +
> +resolver =3D "2"
> --
> 2.41.0
>

Applied, thanks!

Bart
