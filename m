Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D691782709
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Aug 2023 12:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234679AbjHUKZr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Aug 2023 06:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234659AbjHUKZr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Aug 2023 06:25:47 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC36D3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Aug 2023 03:25:45 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d73c595b558so3160975276.2
        for <linux-gpio@vger.kernel.org>; Mon, 21 Aug 2023 03:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692613545; x=1693218345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ez2BpAO3dqmzbhEDkL2FsHTze/lp5x8CUx1YReeb/rA=;
        b=A2o4rloxuYU18UlpWnbgANwZd6BjRRzk3o39dXMCTe4lKCwcLz71ZX78uVwCgk/vNA
         5vH5yPYHSDDI18ZrG0a0QkkcDdVXRyzAKXLmJo7nWxl/JEVj/fIfOP5t5Z1wpXp4wYqF
         EdeAoGsIOFD7n9hkr+i8t8P4+I5s0szqZhnNzfxN0DnRAa15UZFt7z3MzJXUN+Q3qbKT
         Y2yl8yayYvEROHcuZVWqGNc68FmDhtOCTHHQVE92CuUIZxP6BsyC61O+KpDD6+50FPZS
         oOXoF37Cf2B7UKjr1uQ74AncLi+Ul2Z++w+2DIO7/qob756c9HUL3ziAzzu+QRLJigjI
         f2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692613545; x=1693218345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ez2BpAO3dqmzbhEDkL2FsHTze/lp5x8CUx1YReeb/rA=;
        b=DILUcg8hlAPJoRVP9tzsWEFM847Uf6LSEUDidxwF5d/NhHHsICqNqTXqdfmn+szwXJ
         oEPaOqxScX7bekepfJelvQYM5iCvprfgnER2WDp7WI17Mw+2VoYVwid1K8OwNB0V9gwm
         pPChtGUaxxXQ4UP26V26ePi0ikSzJWaOQu68noRZBRAOII5Cc5TGu3et1flqJQfzm+JZ
         hGTpuFWsaXmWtg57okBSQntIChjT4qW27RnjX44h6ZoLknAhs816DsjoFE4b5QL6Ii4J
         Gs4EUYLoFCAwcpoNUJSe8DAx5iTrPBX1OQk0I+kiALjf6uqQBFZ9hW6C0BOpcAsoKL8m
         YxFg==
X-Gm-Message-State: AOJu0Ywa4lx5XKgrh7f4pEulyqTvXlj+EOkbjb83/B8//IcyFqBxnLTo
        YJUUyV6LXNZEtORTZ2sNRlB0soO/DfrbcnldEq/SAQ==
X-Google-Smtp-Source: AGHT+IHeBmKHQWRNi1wx8FI+ncjEk454j7c4EzPbpFQ+LOU6EPvg3C61H+4IsJxPdNRPNtTDY9jDZRLBC8x8uRSi02Q=
X-Received: by 2002:a25:9e12:0:b0:d21:ef87:c1be with SMTP id
 m18-20020a259e12000000b00d21ef87c1bemr5697584ybq.27.1692613545223; Mon, 21
 Aug 2023 03:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692357172.git.geert+renesas@glider.be>
In-Reply-To: <cover.1692357172.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Aug 2023 12:25:34 +0200
Message-ID: <CACRpkdYBV-iHmphsXYMo2W4+sor16=67sJVZ-OYeZyDG5=sShQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Fixes for v6.5 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

On Fri, Aug 18, 2023 at 1:17=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit bfc374a145ae133613e05b9b89be561f169cb5=
8d:
>
>   pinctrl: renesas: rzg2l: Handle non-unique subnode names (2023-07-10 10=
:00:27 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-fixes-for-v6.5-tag2
>
> for you to fetch changes up to 8fcc1c40b747069644db6102c1d84c942c9d4d86:
>
>   pinctrl: renesas: rza2: Add lock around pinctrl_generic{{add,remove}_gr=
oup,{add,remove}_function} (2023-08-18 13:01:41 +0200)

Thanks!

We have an rc7 so I pulled this into my fixes branch on top of
that. Let's get this upstream this week.

Yours,
Linus Walleij
