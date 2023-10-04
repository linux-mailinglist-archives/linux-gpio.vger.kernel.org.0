Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D267B7B7E1C
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 13:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242248AbjJDL0b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 07:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232944AbjJDL02 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 07:26:28 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF89A6
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 04:26:24 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-7b08ac3ce7fso994240241.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 04:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696418783; x=1697023583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPTmJqSZ7x18aAzf1qilhCc1A1W8G6ELW33nC7XbDn0=;
        b=Mkg5eKDu6Ayk5sLjgM6EkYtb5OqcUxpHVDs00L2EpqTD0VK/xWV/zpivsERPIYUwWg
         1HuxU/KsrFO+euadlmj2L4xS3aA4/L7RvZheWKBp4xR5O91xlH8tZCDWDvMG1LtvnLYC
         t/E/bVvpKkZeb9ic9vcwVqAklrfA0gSx4yQp3lCSUOvMUVUgHsDinj3oNiqmYJMs0iKU
         YEt2Y9IoBrr15HeL2DE1R2V5Yc9+3lYye6pV7FevVYCqnWZbIwA7I1w7omDUDON3TEQB
         z6ZTc3WeuAy47f4W9AwwXEguYDp/JdtL2zHpi0qBvBkP50w00KO4dNkD0uXoCIFqn2Xz
         6mHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696418783; x=1697023583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPTmJqSZ7x18aAzf1qilhCc1A1W8G6ELW33nC7XbDn0=;
        b=npHixgrgzyKzCvR+G0apIqnj9sJMrnuJHpECWiCmahjYUmgWRv2pHxhE+f6J2GHiHT
         5Bc8AtaDw7c9azm61MiDCjp8eI9dz7TXJ17xF4X+vOOO0Y075OaiII6gHNHCc2WizxHf
         noHk6WLHYQzXj5GV1OUxtmMEvs9FtINsolf5Xkv2lCpyIV3RBev8A63fPDSmMTFxzeKr
         WNw3iPCNLB3LIx5fBGm/BfaEWyqiZhZuSNarJ6OzsMCIudF4MERWSmATctUpW09c8bwB
         Jl1ST3kQNDJhY3nrvt3E1F/or7R4jdve0Mykk9ebjsiS0tc37jhGmcrCogH+nBSaUIpQ
         eNqw==
X-Gm-Message-State: AOJu0YzMIspZIU7wHyRJkHdaxY9+yD32zWk5RvBsKAISaLzXOFx1z/d3
        qM0U8LPBdlJVKgbS9Rm1qxdaVKy/iqBXjF2DgUHPmg==
X-Google-Smtp-Source: AGHT+IFVqlQYVCGNgWqaqty6H6YGhtZ0z9V1MECXO6G4uWt18LWb/76TgROOl8auGPcAwwZ6CmJuveb8+n7CDfBhqaE=
X-Received: by 2002:a67:f64e:0:b0:44d:4a41:893f with SMTP id
 u14-20020a67f64e000000b0044d4a41893fmr1837380vso.9.1696418783613; Wed, 04 Oct
 2023 04:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231003-rust-line-info-soundness-v3-0-555ba21b4632@linaro.org> <20231003-rust-line-info-soundness-v3-3-555ba21b4632@linaro.org>
In-Reply-To: <20231003-rust-line-info-soundness-v3-3-555ba21b4632@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 4 Oct 2023 13:26:12 +0200
Message-ID: <CAMRc=MdK96Qx4FE481V2J5Ca596-Og34ct_0z_tFj_1CAbuJVg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v3 3/3] bindings: rust: allow cloning
 line::InfoRef -> line::Info
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 3, 2023 at 11:40=E2=80=AFAM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> While one would usually use the ToOwned [1] contract in rust, libgpipd's
> API only allows copying that may fail.
>
> Thus, we cannot implement the existing trait and roll our own method. I
> went with `try_clone` since that seems to be used in similar cases across
> the `std` crate [2].
>
> It also closes the gap of not having any way to clone owned instances.
> Though - again - not through the Clone trait which may not fail [3].
>
> [1] https://doc.rust-lang.org/std/borrow/trait.ToOwned.html
> [2] https://doc.rust-lang.org/std/index.html?search=3Dtry_clone
> [3] https://doc.rust-lang.org/std/clone/trait.Clone.html
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---

Applied, thanks!

Bart
