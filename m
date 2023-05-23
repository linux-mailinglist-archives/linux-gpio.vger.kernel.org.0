Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4CEA70D8BC
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 11:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236345AbjEWJSQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 05:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236344AbjEWJSI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 05:18:08 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315711B9
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 02:17:51 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-456fc318dd4so1570726e0c.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 02:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684833470; x=1687425470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pk8OMJU/i+DL9domkx1SxECiIr/Cw8hUh9Jh7kwNm3g=;
        b=Bdx1POUAqFJkjBgUi/GS0mdhya6BUMSBtxOpkjIYslelvZMDyOxdXjpHp6KFSmNEva
         DoOqH5YE55cxw/OsjFJJBF7wk+RyoXA8VtxHSZvBNTT0mSO8EX9QoDi84yUx7KqeYkWM
         oqiwIFlMfqGgdQYrLVnv/dQdV1Exbu+tyWFoImqXR8cukKC/BBLWaXTz+7CeDZc5dyUO
         mv7Iigd20c11CjpzH0Rhi20M4szWE9i55a9Z3Y0CGMM6wTnhtwEoBPSPVTp1v1eRPpOD
         jaQYgGUuWkjbZD8Ehm6yhyBOBpTB0prxNiEUCIpa25Ccs88q+Ero7ifnfv/B6SOMwhQ2
         e/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684833470; x=1687425470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pk8OMJU/i+DL9domkx1SxECiIr/Cw8hUh9Jh7kwNm3g=;
        b=lHzhoCMUqBWU3yX1ohnInZgi2EwtIp/p2xcuHFiwuKi84S91hpuI0BVPSHghyfTxfb
         RZrroS0PNY8YDbgICSw/H87vphWRJeGr2P0KBLRKbOU+w4ZIr1rzrvtKJtZJYLWHw/3f
         shufkLdPfJ5lQ2XBETNXf5Mv9y6EcuGbemMBNixA4tHkuK11m2U/mW/gNk1GvtZ83s0k
         hKHuV6lALHDcWpwQhn9nQzmRGnnUprugtTN4mboH5p8vBjmtKc83P9U4lZrWLTnqWz/z
         UD8XoUN/k1gD4pe4EN3F8zXpIfNr6mKT5rPLDHo9v1bpUXmwAN9d8zYTFnBMU6GuOqQf
         3JeA==
X-Gm-Message-State: AC+VfDxEYeh+hWcTFJVgOrMibV8zFu2wJfCbgQGFHheLXxtGtwBr8u36
        Q4rGw/QSghUTtUzVphG1yE7t7uaQk8EjveV2CWo3EA==
X-Google-Smtp-Source: ACHHUZ7CHtarrucWGhxACF3S5WCro6uTcboj0GJAKcNxdbnYzGOU1NsbYTqH38dbQghvd72lmfdBvFudK2a6RwnqVzQ=
X-Received: by 2002:a05:6102:2f4:b0:437:e5d1:a0e0 with SMTP id
 j20-20020a05610202f400b00437e5d1a0e0mr3647966vsj.19.1684833470145; Tue, 23
 May 2023 02:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <Yz62XmiH8YG3Dtsf@orome> <20221007055936.5446-1-pshete@nvidia.com>
 <CACRpkdYkJdZ67kyTnDg3xFzO8MJhC0nHK98O+KJwCLBqV_5f-Q@mail.gmail.com> <1de5b7fb-a39e-183a-1407-7d6489f706b4@nvidia.com>
In-Reply-To: <1de5b7fb-a39e-183a-1407-7d6489f706b4@nvidia.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 May 2023 11:17:39 +0200
Message-ID: <CAMRc=MdCiieaYR3BeATm+2o8UDz+9D5vs=dTNDAavi19BmKZ8w@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: tegra186: Check GPIO pin permission before access.
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Prathamesh Shete <pshete@nvidia.com>, thierry.reding@gmail.com,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        smangipudi@nvidia.com, kyarlagadda@nvidia.com,
        Manish Bhardwaj <mbhardwaj@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 23, 2023 at 8:22=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 17/10/2022 10:31, Linus Walleij wrote:
> > On Fri, Oct 7, 2022 at 7:59 AM Prathamesh Shete <pshete@nvidia.com> wro=
te:
> >
> >> This change checks if we have the necessary permission to
> >> access the GPIO. For devices that have support for virtualisation
> >> we need to check both the TEGRA186_GPIO_VM_REG and the
> >> TEGRA186_GPIO_SCR_REG registers. For device that do not have
> >> virtualisation support for GPIOs we only need to check the
> >> TEGRA186_GPIO_SCR_REG register.
> >>
> >> Signed-off-by: Manish Bhardwaj <mbhardwaj@nvidia.com>
> >> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> >
> > Very nice patch!
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
>
> I did not see this anywhere in the mainline/next. However, I also
> noticed that we don't have the correct email address for Bartosz (again).
>

I have only ever changed my address in MAINTAINERS once, so "again" is
not really the right term. And scripts/get_maintainer.pl should be
used anyway every time when submitting patches.

> Bartosz, let me know if you can pick this up? Thierry also ack'ed
> previously for Tegra too.
>
> FWIW ...
>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
>

This doesn't apply to v6.4-rc1. Prathmesh: could you rebase and resend?

Bart

> Thanks
> Jon
>
> --
> nvpublic
