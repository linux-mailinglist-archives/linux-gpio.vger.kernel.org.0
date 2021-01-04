Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E12EE2E9774
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 15:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbhADOlW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 09:41:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726685AbhADOlW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 09:41:22 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1145C061793
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jan 2021 06:40:41 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id x20so64781628lfe.12
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jan 2021 06:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hCRXE92etGCL2gmwCYWtT//YdqZpTc6IMopsj3O+L2o=;
        b=DFJNZxyYzkPuaf089zNAZ4YNE2NNDVLFrR6W0xAHY3bpZAWCnKSzziXh/XZaO7i+xV
         bS8qg1Knn3qciPVqfh7Z7ANpLbVL7s2/cmtSXEOCbNH+NlrxNfrpTzpajLj15rmtcY8D
         Nsdp6OO4gmgrLjB3lSbudhCtKHsVYKvDivJn0otdLkOBit/67eFk8hdPvR+W0hTi75GT
         Yfy7YPr56s9kOi9TFDMO9CwHfX+/vWd9/exQhaY9hBWj5YuXL0qXmcyyzMJjE5UdAbKQ
         3pVPVcyNcTA6MrGREmoJ6MreODrfKDSzG44xQ73UxtAD/FACPnEg/i/vyzVJ8KRv0+/e
         koPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hCRXE92etGCL2gmwCYWtT//YdqZpTc6IMopsj3O+L2o=;
        b=YIi/JeJKDqjwIGh+sv1Xrf0EIBihxvMPxqkaObufjQjaTRrTCYi6asXQfcyfs5TdDV
         Rj2McUuyz9SdftztlTyfRyFoNGjS88RfV2HfwTjmdlkISFDnLPiTsjNMcYdrVPvW6ClZ
         hquSSwoT3u4DBMvSXXaziOnTlbJFbj4leYJ8s81PLwkbBFfk8x//zGFjInjPd14/DMcM
         WRNN1oLdMcueReWL3o1O5IRpoAvFs6ofD8Gru5WTYQI/XgF8ioFHJc/5kxmjLNVwsseQ
         3zlHQpIUrNJ7sHexV7R8iSITyp1+tLU8o0Fe7vA879w84qT5alk2JGcGX9Wg7TTMm/aJ
         yupw==
X-Gm-Message-State: AOAM533BXiB6LAAyNel7H7Dfjkgiyf1zaK5IpFr0ak8TTPkwxfmM3/Lh
        rZrlujiLP8xnfIXhCO6dlNi9n0eyOsT085yxK8xYoA==
X-Google-Smtp-Source: ABdhPJwSxTZHoE0YHKrVOJRhTCVEKJ3/l4yakKuFALZQTQ8KZr8ogIa2nRbgS9IZXp2Uidm6S9SQXnCfABhu0Nw4EXw=
X-Received: by 2002:a05:6512:3238:: with SMTP id f24mr31506177lfe.29.1609771240536;
 Mon, 04 Jan 2021 06:40:40 -0800 (PST)
MIME-Version: 1.0
References: <20201228064727.30098-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20201228064727.30098-1-sergio.paracuellos@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Jan 2021 15:40:29 +0100
Message-ID: <CACRpkdbC9=Vu1ODg+JLx+aRv1vVrJgTqEhZL3UAuqod6G6DPMQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ralink: rt2880: fix '-Wmissing-prototypes' in
 init function
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jason Yan <yanaijie@huawei.com>, NeilBrown <neil@brown.name>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 28, 2020 at 7:47 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:

> Kernel test robot reported the following warning:
> 'warning: no previous prototype for 'rt2880_pinmux_init''.
> This function is the entry point for the platform driver and
> it is private to this driver. Hence declare it 'static' which is
> the correct thing to do fixing also this warning.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Patch applied.

Yours,
Linus Walleij
