Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EAAF7C86EA
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Oct 2023 15:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbjJMNdh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Oct 2023 09:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbjJMNdg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Oct 2023 09:33:36 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9486295
        for <linux-gpio@vger.kernel.org>; Fri, 13 Oct 2023 06:33:35 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5a7e5dc8573so25779507b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Oct 2023 06:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697204015; x=1697808815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IpNqgk1FLqWbB3lOZSW3ceHSRzD8IC3H49Z2d1r3fU4=;
        b=isOZjEMEmcf6iP04XdgAHC5aFp9D8l+GrVH6+l0jAkvanmXfw+P9dXW1JS14+XP9tx
         F+38M11qiw1dVHpmcjWUtHC6QpG2rnyKfKxvC/EWPlz9LRDSuaE0wpb/8Ssut2n5x4JW
         OHK0UJF7ZlJJFJ7LcApQck8Lrn5pskMftVmeY1OlZTGNdiFKCB0nx8CfKbrdYWZHvMWf
         LI/gR1iL2kxDRjZX0NQtuhy1sqVYoO4x90FQY2rhYA/UhnDaZaMXiL1Gj3vkmOiML7NC
         M3KucO0+cNRLAMFe+Uff1HcQio/O6PscpHtUPycq9q4ckjSisu6dQM6pSYAgLll9eKZH
         0GdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697204015; x=1697808815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IpNqgk1FLqWbB3lOZSW3ceHSRzD8IC3H49Z2d1r3fU4=;
        b=HCQ6sC18L2bBcYqKz9Rt3UjNd49XvdyVGKU263nt4IpDKSl7WbtA1V9G606Dzpf4L0
         xYFlnXRS8H7XpldWSyspQGi+gKW/fXp1FmR80kv9fMMf53J2N4Js6dSOrrtvKrBegVoX
         q6bD1CXRd9qZTe4QVXUYAVh3h3uoj0UVhYBB7VKyoRrsAYsXxfYjxZmw90CO8LkFfmL+
         npbBhz3NTXmTNyr2TVH1ZFVHrLNSgEo99B/LWSmywvDqoXJS9z84fWH1NQODjCChcGpk
         Xt0PLg3QeAJbLANthwm+TG3F+o2fJrmT6SDZ6FtTBTZZQaGoTN/ubahVJXAA7lX67Lrm
         rlyg==
X-Gm-Message-State: AOJu0Yx7sdHeldJFHxAr+PDlS1QcqO6dHMyf/1T74NU9Jqqgl2EWtOZn
        0haqxf1qR5x6c8hWEJaXVQfIPrE3VFrrbPwH+P2M+A==
X-Google-Smtp-Source: AGHT+IHbUvhUWaxb5EYaGOkB7z8oiCOEjuQyX+yr8AVZyEBfdPimgnnn0OM3QnfOghK2za948ckHNM/DFSkkIdAlno4=
X-Received: by 2002:a0d:e403:0:b0:589:f445:19e with SMTP id
 n3-20020a0de403000000b00589f445019emr26283446ywe.27.1697204014765; Fri, 13
 Oct 2023 06:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1697200929.git.geert+renesas@glider.be>
In-Reply-To: <cover.1697200929.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Oct 2023 15:33:23 +0200
Message-ID: <CACRpkdZ3uaWBiP8NrDp86G4ss_CmM3mzBja8oMvU37irJrngPg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.7 (take two)
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

On Fri, Oct 13, 2023 at 2:48=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit c385256611b1af79d180e35c07992b43e1be50=
67:
>
>   pinctrl: renesas: rzg2l: Rename rzg2l_gpio_configs[] (2023-09-26 09:44:=
51 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.7-tag2
>
> for you to fetch changes up to 583d8073205566468abf3a34000fccdd1d19c9cc:
>
>   pinctrl: renesas: rzn1: Convert to platform remove callback returning v=
oid (2023-10-13 09:38:05 +0200)

Pulled in, thanks!

And thanks for accounting for my screwups by dropping the duplicate patch.

Yours,
Linus Walleij
