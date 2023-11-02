Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B52E7DF2BB
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Nov 2023 13:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbjKBMt3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Nov 2023 08:49:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbjKBMt2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Nov 2023 08:49:28 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07376112
        for <linux-gpio@vger.kernel.org>; Thu,  2 Nov 2023 05:49:23 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5a822f96aedso10694517b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 02 Nov 2023 05:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698929362; x=1699534162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=widlyZwBYPlMRjGOv/8GxlBrQ6R1o+G/iEjecWXMJTc=;
        b=x4StsjNlXJ7hQpUzAKfTqAQGM25dai7i9xjomn39z9mlqqdF0imr4UOSuwcJvJcOnf
         eGOrmXpj14eqY5qwSoV7ld9u0fGe9pfOXwawshKayB+sjistry++tR+7oVzDzFb9LwXt
         cZ1As7CbO8WCaVaFCeF2arTTxKpHgnV4FkN6qq9yX9zDPCwxnJMBwlJawlrQPjbq7A4e
         GOgKOucm2g421u01pHS+1sZ4et2553eYVSvumOB7biy5LeKoEH+2zGcwmJb0S16sPSjx
         vrxSqebKEOSTmX7sk/NUdleSbFsNuoeiCaN+6n5c66j3n9WZHf1iGRR0ZEzTjAURNJuh
         i3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698929362; x=1699534162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=widlyZwBYPlMRjGOv/8GxlBrQ6R1o+G/iEjecWXMJTc=;
        b=HhBiOFjXB0AJeys4LYkA1xbfSRdLQeF0OfzqZJsoAc/lw/ZoNmkY9W1zAEtAiXMnOt
         +OHSUIIbjx9LeZ74V0LCWMHx3HSF1+J/9XPORdWxoWnl6o1OwN1IosfbFvNqjQUKTt0e
         fnYg2uuBKYQdvgM8b5TorP12UKBK+Z97hhNLDcQMw3yDCsjGEa8cYXjFQuf5lBccMZ3A
         +JuERRNb6bsCV2Eb9qfw5UwLEfyF7jFfTNz2UC4Bbdej6x2pH/gUGaJ7ZkFvKNynYYdg
         kEjCEUrDeB17DLf+CALq036y6v/HZqToT0j/wFt2G/CcQkOyyqa21E3sdmQItuecL1fd
         gzhg==
X-Gm-Message-State: AOJu0YwNO2SAuTlEse8OZ5cIiw2u48WaYhtKy+XnlV7NRBa+Hn+ouJix
        hQUmNGTgohtpKvr9c4gN7WoHy1I2GzbHW9CQPXDPyg==
X-Google-Smtp-Source: AGHT+IHt90STRVe8je/Z5zX/p4SgI7q02TIIO9EFzScpg845KJIIMk9ZkoVKpvO0vaU75EWje+slqqI/wuSSqst9a5E=
X-Received: by 2002:a81:7e06:0:b0:5b4:2a52:d18a with SMTP id
 o6-20020a817e06000000b005b42a52d18amr4113501ywn.36.1698929362230; Thu, 02 Nov
 2023 05:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231101025110.1704543-1-jim.t90615@gmail.com> <20231101025110.1704543-4-jim.t90615@gmail.com>
In-Reply-To: <20231101025110.1704543-4-jim.t90615@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 2 Nov 2023 13:49:09 +0100
Message-ID: <CACRpkdZgqfzti8KW25m++VG2GhU7LZCgzxeWW+uaNO7rh1kmjg@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] gpio: nuvoton: Add Nuvoton NPCM sgpio driver
To:     Jim Liu <jim.t90615@gmail.com>
Cc:     JJLIU0@nuvoton.com, krzysztof.kozlowski+dt@linaro.org,
        andy@kernel.org, benjaminfair@google.com, brgl@bgdev.pl,
        robh@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jim,

thanks for your patch!

I saw that Andy already provided some good feedback but couldn't help
but to notice this:

On Wed, Nov 1, 2023 at 3:52=E2=80=AFAM Jim Liu <jim.t90615@gmail.com> wrote=
:

> Changes for v6:
>    - Remove bus-frequency property set
>    - Use GPIO_GENERIC
(...)
> +config GPIO_NPCM_SGPIO
> +       bool "Nuvoton SGPIO support"
> +       depends on (ARCH_NPCM || COMPILE_TEST) && OF_GPIO
> +       select GPIO_GENERIC

You select GPIO_GENERIC but you don't actually use it.
If you were using it, your code would be calling bgpio_init()
and it does not.

Yours,
Linus Walleij
