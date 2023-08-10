Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08A18777775
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 13:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235409AbjHJLrJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 07:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234101AbjHJLrB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 07:47:01 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2519E91
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 04:46:59 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d3d729a08e4so744795276.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 04:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691668018; x=1692272818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xK6gbJKDe0shzorD3XuL5DZoFclmN0M4H/xFiOklQE4=;
        b=wZoQihECP0qKmdzSH0AFkjpzPzgohj/MpAmHF57ewOuIEtxOM+/1rYK/lMIUi5JPSW
         pTBnculcbSfpTyCCS1GuviR/DT3QZ1TI+Pq2CTJZoNA7Z2o/IwrnQ33+xNOnrE3oHAT4
         Lr3dAKoU+v3smz4Og+tsdfD8SZGQSJ+r5yKBRVBop23dJm+i7idIhxycInZw7cPRGiPX
         2dWS7lM6LNuEDEZ11wTrquJXrtZpXV0sboeAQmpx8w7d47N83N1GOipGos6rohWquuB7
         3pfaBwow6i+7ItphGjStI04js43L3yJG4zlK/QyizjaegEjww4NtqFPhYut1spzQHJTW
         ODmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691668018; x=1692272818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xK6gbJKDe0shzorD3XuL5DZoFclmN0M4H/xFiOklQE4=;
        b=Qcvz5Ob86+AGEz9kC0y7QG5AsQODTZNQgEvnGPW78HfWwfRT3iyxcg9gy14phdWAzM
         sW0B7dFiro1BbliCp1Tw9Lb/h47RspQ1xI/84pnBndOj+wHEZOThOKVDBtg9/aoDHoqq
         459SfmIlK461ZBtnzFQQoXjMh9MLjU9epDoIV7HVgkae+5BIq/DasWdPthN6ZzdLUW0A
         s7LLVpnBnKPSHn+kvwsRrI9mgQae/b0k00bJSRV59MRKFErD4J2rMHKLZeV8NaD9VG0w
         M4Pt9M19Ovq94DELwn4vyIvlDcP6e9Ay9k30TfvZC08ZrUlROTYWzrLEI2i4cPpcAd02
         q+vQ==
X-Gm-Message-State: AOJu0YyE4RAiPNjwtkIdFVTBPO6/e22u+tPnrxZPhGhZywTJOW7V05zG
        jg3icPqVeQp4mkqDjZw7J/N3m+9hXUVLaVwzAj4qTR1XAeVf3buD
X-Google-Smtp-Source: AGHT+IFzUkae2xEZr0dzyo0by/2w26LhTLPG2hwdmnqT6GJvOjsbev/+UZaDJLtQEupkLyfOGVQ54xIeubQwkRbeKaI=
X-Received: by 2002:a25:58e:0:b0:d04:f936:556 with SMTP id 136-20020a25058e000000b00d04f9360556mr1878239ybf.36.1691668018380;
 Thu, 10 Aug 2023 04:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230810100335.9330-1-brgl@bgdev.pl>
In-Reply-To: <20230810100335.9330-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Aug 2023 13:46:47 +0200
Message-ID: <CACRpkdYVhr71pEB9wZWUTMh4MSVo9OziYsNz-9qcZGiFsr+Geg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix reference leaks when removing GPIO chips
 still in use
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 10, 2023 at 12:03=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> After we remove a GPIO chip that still has some requested descriptors,
> gpiod_free_commit() will fail and we will never put the references to the
> GPIO device and the owning module in gpiod_free().
>
> Rework this function to:
> - not warn on desc =3D=3D NULL as this is a use-case on which most free
>   functions silently return
> - put the references to desc->gdev and desc->gdev->owner unconditionally
>   so that the release callback actually gets called when the remaining
>   references are dropped by external GPIO users
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
