Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4AEE7852BF
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Aug 2023 10:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233905AbjHWIeZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Aug 2023 04:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234741AbjHWIcu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Aug 2023 04:32:50 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11797170F
        for <linux-gpio@vger.kernel.org>; Wed, 23 Aug 2023 01:30:33 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d77a4e30e97so1012865276.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Aug 2023 01:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692779432; x=1693384232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sFWNBSVgWfwwyzkptIK1bm5jpkDtUUIJt8OoOmiIdc=;
        b=fG54giWH5j0Gw+n8ehE+FA1bCjhFI+J2FG9QY94BBcMD0tISPIgNLiVrwQ7kTRF3kG
         4cRCys2vxocLXZ2IaOvtWnu0Ee95slFcHSHm9iwV7qTBoWXOo7H5N5mSONxwnbgmrLoP
         tBwhWhTK6gAdB9K2F1HF+xlP2k60TdmjZs7NRLm958cISTWAwg30DSzriw996X7gbXi0
         jqy2tqMm00zWscnDk+CFWDoDBaJMkQCMQU2K/fzjC2H//drSsXuocBmQy49YcogIN13M
         Hi8/aLqitVH2MyXSzQtEymcNjuHqvNIGcy1C36BRZ+IQtyrkce/bu2EF49f2AW4cSUr8
         qe3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692779432; x=1693384232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sFWNBSVgWfwwyzkptIK1bm5jpkDtUUIJt8OoOmiIdc=;
        b=Sa5zLz4mSqDeAH5CAqUroG2gDpGVEdMs2r20WuDHGgaAwxMLM167R+RfGwFDnpDKIu
         LqCpjzEX/hQdmUah3s9anjo8EjsYzv55uDPGnqzHl8q0dAD7m9uxa6/peiBmWTGzkWPM
         5VqmhddFOhsEWNBA+7D16PXBVnAWrLJpg+MHrYID5aovVTxfRRWWcpeiSNLFiW5ypkfk
         SVrcmWGJ24OPsLBSW4rKI96gvVwd0dTxaXxFbonC5mYJw2q+wmdl1tC6jhJ8QXEIhbrd
         pOSlm/bSYSaiS6h6Cg0afez4JlY5syaBdz41dpwiq1Yu4DlQ0J9zq16+TLniCDl2pX7l
         Vplg==
X-Gm-Message-State: AOJu0YxBVyWMpcedxb1apXq9T2di1qPmhtsVAcMLRAMFCJff7OuGUe3L
        V/f0Y3ltpeYbN2E7roofFeBbljck6h9XLte28p/c0A==
X-Google-Smtp-Source: AGHT+IGmKgc0sIGRNnvHT+jksTER2+pCWn8DjFYht/5OPKfVjorc4lWRFK5bt/D9Jh7CpPtUZ7FPvz2mrFqyYMsir2I=
X-Received: by 2002:a25:6943:0:b0:d07:1bdb:7780 with SMTP id
 e64-20020a256943000000b00d071bdb7780mr12432751ybc.60.1692779432338; Wed, 23
 Aug 2023 01:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230821141827.18061-1-brgl@bgdev.pl>
In-Reply-To: <20230821141827.18061-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 23 Aug 2023 10:30:21 +0200
Message-ID: <CACRpkdb=sr+-fbt0CUyZF1Twn6JEP3wXZvpNLEB-uFY-zJjS=w@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: provide and use gpiod_line_state_notify()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 21, 2023 at 4:18=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Wrap the calls to blocking_notifier_call_chain() for the line state
> notifier with a helper that allows us to use fewer lines of code and
> simpler syntax.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Not to mention easier to read the code and understand what is
going on. I would have made it into a static inline in the header
file, maybe, but who cares about such details.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
