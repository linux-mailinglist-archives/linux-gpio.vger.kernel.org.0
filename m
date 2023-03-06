Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFB546ABA92
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 10:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjCFJ7n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 04:59:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbjCFJ7m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 04:59:42 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC1310415
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 01:59:34 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id p2so6031092uap.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 01:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678096773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYIx7+Ak5uvLBEiqCaz2EjTEv5YVga1eqk3WlIV6f4M=;
        b=zK2NCcCpt9UU5XWW7P556fwgVJnEZEkgL1VUMcs6Mj43IYOEvoEhfp8gfGUsPfLC9y
         rr++bTyCnBcdN2dngclReRJLaxoST8UztHhb1fDmgWvgza6vB+TGcRfhIZnGtRSmxWAH
         1CVAD5hZIQVINYG5pgNlKMDawgjanCiHOlNjBOd0Fuk+W/0c+b4uiCC8Xb8KXBnI095x
         8QLYEPPLxrfg3p8bJIMPf18V36pTcBfCfQstjYus6E0Iq0L5ShKu8Tzt04xYxOeI4YvW
         nDIag/4yGtMlZV2g1dzKtMLxiEvkUPlPuFxOlgkxt4MZrtxvdOozHO6rLF0cmXE46pon
         ntHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678096773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYIx7+Ak5uvLBEiqCaz2EjTEv5YVga1eqk3WlIV6f4M=;
        b=j5EebTSD34Ong2pQpCiGENw57z+bhHyxG3R03xtZ9DRLj5oUoCaGr3slsPBl5jlz7t
         l99S762XZs9nzxt/Q8Dpz5urzow2xbUVcgxPKSzbYtBT7Y89RU1ofQ2aiiIXrNg3OKJ8
         QamWVX1WvqEQr0r+P++/IX3xQVCzS1gU9SL3Oxsg/7nWlzrM/GLaLLMgDsdw9tBzjg0N
         AcULqgYTQEQ08s28Ahwz/0M7+Bj7tGiGEWhtoYpYZ/BpEhQ5yN18KxrO9pHbn0QG20BQ
         Ua3+D43EYWLT6F0Ecaz2pjzFY2HF6nS8zYmt3KaPy+eQvEVV2CR5jL4XG153JHzx4Ir8
         oIsA==
X-Gm-Message-State: AO0yUKV3WpO5SnEFlu3FGUcooGmwEeDRaE5Z3mVg3bNFzIc1wKmtyTxr
        10vN/9IxsGQ6WPu+a/DKOefCYr/0j68+h9ZNfe9YdA==
X-Google-Smtp-Source: AK7set86O3qpveh/FrKfkd3g2XuLPEZoo2Pf5KYA5+piHq15fqYnN6m4NMoJVYTy0MLAeYsy8UJPiyEY5BxmJfkfHGE=
X-Received: by 2002:a1f:2dcb:0:b0:401:42e5:6d2e with SMTP id
 t194-20020a1f2dcb000000b0040142e56d2emr6188621vkt.1.1678096773108; Mon, 06
 Mar 2023 01:59:33 -0800 (PST)
MIME-Version: 1.0
References: <20230222121453.91915-1-nick.alcock@oracle.com> <20230222121453.91915-28-nick.alcock@oracle.com>
In-Reply-To: <20230222121453.91915-28-nick.alcock@oracle.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Mar 2023 10:59:22 +0100
Message-ID: <CAMRc=Mc76TT+y_OZokRBptgDzA=Tnf6_0BuiBNqB2FRjCEGuHg@mail.gmail.com>
Subject: Re: [PATCH 27/27] kbuild, gpio: gpio-aspeed-sgpio: remove
 MODULE_LICENSE in non-modules
To:     Nick Alcock <nick.alcock@oracle.com>
Cc:     mcgrof@kernel.org, linux-modules@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 22, 2023 at 1:17=E2=80=AFPM Nick Alcock <nick.alcock@oracle.com=
> wrote:
>
> Since commit 8b41fc4454e ("kbuild: create modules.builtin without
> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
> are used to identify modules. As a consequence, uses of the macro
> in non-modules will cause modprobe to misidentify their containing
> object file as a module when it is not (false positives), and modprobe
> might succeed rather than failing with a suitable error message.
>
> So remove it in the files in this commit, none of which can be built as
> modules.
>

Applied, thanks!

Bart
