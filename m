Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0FFC7B7E93
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 14:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242295AbjJDMBP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 08:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239727AbjJDMBO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 08:01:14 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C216C9
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 05:01:10 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-7ab68ef45e7so856615241.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 05:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696420869; x=1697025669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VxF9d0mojGG7o4cVpSUHCY76AoqXAbBRiV4n80jKEw=;
        b=oHwv6/DPYak/DiW3035/fi4o8vRulpJFL0nXAb1L5f5gW1bFQLIyz8cbFCYnMHUseq
         8x9SmHPE79FkiEj1M7fKZX3HEpq2T7M9fzoC720BtQVXC5zw8PsjPWRMPzK/ZCQ6/nhJ
         7MYHuApyLSVuLlJL7NaJ1dM2Q0R7TcVaEXQvH8YZSqHKKW6Sf7mUv6leK8FRU3rgHxVl
         S1ETvyihTnfD0chxYCSydvEmqQx1RJVPrNzRZPoHNiTTtYU5giP8d33q1Aisrjq3Viyx
         ajhhPkb+txsnhHvKJvp7PH+lbVkPjUQpwaYmMVgrFq0Ts+E/q/01c/zTSj+tCi47R95Y
         bzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696420869; x=1697025669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5VxF9d0mojGG7o4cVpSUHCY76AoqXAbBRiV4n80jKEw=;
        b=U/bd/OJ42oAtqap2ffxoB+AS+AsHq8xWFapRf2rvT8Gbi6LTapCQvbCb9Rr3WgEttn
         TUiC0G6+tNfsMBnPxYbZUtS+73CoGOl0oyI+DsdehP+jwAUln1009/miNW7y057hSUOY
         Kvi2Hz/tpK24ltHfSH9QQ/bM8rfr6SV4gCtDu93ZAR0O9luaeEuSLHpVOOkxcGTepDqq
         zYyg94N1R87v5/qxHAGlYBhK/3nKFM0BFmEFbPaun3k85bmehfa+BJnOc8hNfVuODmdx
         oTbPCqOaJR81mwwCqr33VBgkJLYhzSiXVktn/MIQsNolC2lhGg2cYMfqjcSyJFsqtNWV
         7tfw==
X-Gm-Message-State: AOJu0YxkHb1IFfJtsDflQdtzHisNM1sb30WYeKe+b2dCWzWN/83id91Y
        UGBN10GSBt8RjsFEsVWaBf80wJOb4tfubU+MMW3sbw==
X-Google-Smtp-Source: AGHT+IEx3AgtVmbiogi6y/J2HxxHzWhr7s02jCF0ZQyoHV8FsEEVFDac4kKEaiIaQ5/oedvf5e19/1rxUgniaHEkusM=
X-Received: by 2002:a67:efc8:0:b0:44e:9afe:c5b9 with SMTP id
 s8-20020a67efc8000000b0044e9afec5b9mr1545555vsp.23.1696420869527; Wed, 04 Oct
 2023 05:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-15-brgl@bgdev.pl>
 <CACRpkda9=VULj4Cy_sit-UpUQnVEbS-RJKAeULVCw8ZCRTq1sw@mail.gmail.com>
In-Reply-To: <CACRpkda9=VULj4Cy_sit-UpUQnVEbS-RJKAeULVCw8ZCRTq1sw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 4 Oct 2023 14:00:58 +0200
Message-ID: <CAMRc=MdTk1B4MEh9C624Upm_EcaQgJd9OU-AGfU0G-DU1+qk6A@mail.gmail.com>
Subject: Re: [RFT PATCH 14/21] hte: tegra194: don't access struct gpio_chip
To:     Linus Walleij <linus.walleij@linaro.org>,
        Dipen Patel <dipenp@nvidia.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 7, 2023 at 9:28=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Using struct gpio_chip is not safe as it will disappear if the
> > underlying driver is unbound for any reason. Switch to using reference
> > counted struct gpio_device and its dedicated accessors.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> As Andy points out add <linux/cleanup.h>, with that fixed:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> I think this can be merged into the gpio tree after leaving some
> slack for the HTE maintainer to look at it, things look so much
> better after this.
>
> Yours,
> Linus Walleij

Dipen,

if you could give this patch a test and possibly ack it for me to take
it through the GPIO tree (or go the immutable tag from HTE route) then
it would be great. This is the last user of gpiochip_find() treewide,
so with it we could remove it entirely for v6.7.

Bart
