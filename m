Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8765B7B32B9
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 14:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232977AbjI2MmF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 08:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232990AbjI2MmE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 08:42:04 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA3591AB
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 05:42:00 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-49369d29be3so5669276e0c.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 05:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695991320; x=1696596120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEVCN2cknuV222YNiOig/5fjLrqs68kty1B92YZT3FU=;
        b=C9KCVO4hmnYOn3Yi+w1qo60kg9WCteZfwN3rIA+0dxC27RJrekn2lEgmbnFWgugkjO
         +zgLEI0XeW6e+yG9NpUrVZ14uDsE1T8vJLFiGtC96mZvxHi03/f10t8Gf67EWZg5+Xkn
         o4pLSvPt2WzVwNinUVRyMzf2Vq+o2t8EmhRlZ0/WOKq4L4jHy2EDg6OCXHgTakFFQq1e
         jIKN8WFBl9dCLiXJof3X6cmj2LyPFORc7qHCAbiYh4fyFI7yABkcarnFei3FRxlANIVy
         SMH8/8+4OPBiiEC0hZpAug+qZE8dcUbJoJPncqtqYixA3aNiiu4s6Q+bDINu6UGKJGCr
         3vNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695991320; x=1696596120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DEVCN2cknuV222YNiOig/5fjLrqs68kty1B92YZT3FU=;
        b=WVH4OmtakAL9i/2yzZCdlqFAhJbctb8hW/aXN4s+3lLY9TbCGKhkZa87BaaJd450OD
         bsgau8Mi6I7gzh8FhS9h2WPdQw7LC98u0XBVREIDIiaFUYssjWHCJV7vr6Bc19KVf/fl
         GBZuA9XDnxsddpufgN6eUQuUPvEose/mW21OtWS9YQxNK+wQIDNAaYCcQWq39991nqcV
         dWia7gaIzvTJTdadT+Z7myc3QAjy1C7t23TGtEpL1RDiBzl6zJv1sLRBn83ttEvYtnJG
         xFUJ1OIRh53r4Qv5iamJn+bJBtns7Jn3eAnr9DRDjVBXSyQPT1ZqzGViGU7CXQpXfavT
         im+g==
X-Gm-Message-State: AOJu0YwdCM/gDGWYeK6ejEgNh7yNd6Jlzho2CvWLV4P7eYajZq8mznjc
        uRkLheeShzVfEO5f7QAX9GSwVTwebIwnou7UaCsitA==
X-Google-Smtp-Source: AGHT+IG4CrI6vpWuzVQc7OFaLIxG4ikYChf8pfo0WyJ5d4jVOgdDNmaGfhYDrzXr/Db1u4hskV7C1Pee5gNqWbM95aY=
X-Received: by 2002:ac5:cdda:0:b0:49d:611:a8cb with SMTP id
 u26-20020ac5cdda000000b0049d0611a8cbmr3191738vkn.11.1695991320003; Fri, 29
 Sep 2023 05:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230927-chip-drop-arc-v1-0-28013bf95948@linaro.org>
In-Reply-To: <20230927-chip-drop-arc-v1-0-28013bf95948@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 29 Sep 2023 14:41:49 +0200
Message-ID: <CAMRc=Me0xEoa4G0OKNWdogUPXu5gzHed7mq6oe+-jJH3foyn2Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/2] rust: bindings: drop unneeded Arc within Chip
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 27, 2023 at 11:25=E2=80=AFAM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> While reviewing code for thread-safety. I realized that this structure
> was a bit more complex than it should be...
>
> To: Linux-GPIO <linux-gpio@vger.kernel.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> Erik Schilling (2):
>       bindings: rust: construct chip infos by reference
>       bindings: rust: drop unneeded Arc within Chip
>
>  bindings/rust/libgpiod/src/chip.rs | 83 +++++++++++++++-----------------=
------
>  1 file changed, 33 insertions(+), 50 deletions(-)
> ---
> base-commit: ced90e79217793957b11414f47f8aa8a77c7a2d5
> change-id: 20230927-chip-drop-arc-57debbe1e52a
>
> Best regards,
> --
> Erik Schilling <erik.schilling@linaro.org>
>

Applied, thanks!

Bart
