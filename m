Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C11306BAC55
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Mar 2023 10:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbjCOJle (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Mar 2023 05:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbjCOJl2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2023 05:41:28 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A5F29430
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 02:41:27 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id f13so16431544vsg.6
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 02:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678873287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKozuywKlHNFG1M+fIENfKeYZSPH074aGyEOF/Nq6hM=;
        b=8BmfpCg3XZJDTeiOOcsSpYcw6Ijfu6fJD2TYIdzKVp6Z/j7N6ROo4qByH0fzqCyYt2
         3VDWxeo+dFKv1jrs3cXCiVKq4mRXQX20XhJ7sEV01Mb1k3rHTtjLWqhtjzeQJxF685dC
         ChcKfgo7z+NDFbcf9VBddQVg0iGfGnbJVQ0lBGw4Ed4Yhba9OLFgKRENj+J9WP3+FuLW
         q5YAvFLum4sUHOojWJS1iUuc116FepbAZ1pl6K3PuCpoQQQE9ZQuEM7eDB7RIwfdlC9R
         dyLqI4rRkGwVGcFKxIdk77vBMAdKWSvQ0oTmdzUX3DPFWoGf2U1gcSXx6pD4Vr4rOfoj
         bqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678873287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKozuywKlHNFG1M+fIENfKeYZSPH074aGyEOF/Nq6hM=;
        b=LjZ3R9pS8CcANCkdA4K2PECPyjTELHLYOoaYwpiadtW68nBgu3ijj7rrMZ9i6jNppe
         /+WDBAww9CDzjuuV2xiteH7tV3WS6OCOZMMX9xeQNE/RykKgSWd6K2IslxSDxSgM98O5
         yhoFT6Q0Ccm9eB7EoM1hsVJRVy8kivPh0nvTPpJOZaHaqNaZ7ZkP9DMmp15PIvxDIg9s
         Aq/OWsRajy6TlLJI/Rlby36xnLGP1digQEb5pd2I9sXtKrWzzxgPi8mVOJYR5E16rOlg
         QmuSzLyvFCDrzza8wcs+e1FsTZLJPVRYaBhv3GU5xY+cQ8KCPPv/ECZ/XdftROTDvcYp
         GglQ==
X-Gm-Message-State: AO0yUKXx5JkxcMfVXdBpbCKyAZ+HQRsa7NrSpNoP+C6QrOsThyxEiPu2
        +zh/HP6oTYU0JY3GR/pgyJmRqVtpZW9VqW/L1/Gd4YmtEcOh5Zu4L30=
X-Google-Smtp-Source: AK7set9Yge/FICFjx/6zQ2bG1iv5bwIl1WcG4yEKEoLejOW505qcqTYMR04dl2tLn1cchDe9FKQPzHH95gn+xAbtSvc=
X-Received: by 2002:a05:6102:10c:b0:425:aec3:694 with SMTP id
 z12-20020a056102010c00b00425aec30694mr2823481vsq.0.1678873287047; Wed, 15 Mar
 2023 02:41:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230309185600.84948-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230309185600.84948-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 15 Mar 2023 10:41:16 +0100
Message-ID: <CAMRc=Mfes=70xQQ=ZHsC0DCRVL3_bKc3SESJC-aK1NMzdd6Gig@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Get rid of devprop prefix in one function
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
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

On Thu, Mar 9, 2023 at 7:59=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The devprop prefix in the devprop_gpiochip_set_names() adds confusion.
> Get rid of it.
>
> Note we have more than one function in the same module that handles
> one or more device properties. This change will unify the naming schema
> for all of them.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied, thanks!

Bart
