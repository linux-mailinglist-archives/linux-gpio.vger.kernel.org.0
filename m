Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 045F11680CE
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 15:52:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728723AbgBUOwF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 09:52:05 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34601 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbgBUOwF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 09:52:05 -0500
Received: by mail-lj1-f194.google.com with SMTP id x7so2492439ljc.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 06:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kUcPV2GCgbBShPmu+5wSCUq/MqsCE/eLeOt+CIDiVPc=;
        b=vFT4Hm/pk+T31nHv2shjLkufUz5Cr/t0N65CkFaj/Sizr5KyWlSV/Y8NA29qzs6vOh
         MeVM4rhiT7mGF/U9J0cFGfXC4E+d2qDAqZPdYyf3uUynt73NzlS/NfnoX5pYZ10Z9ITQ
         ErD0g67fAiDOSPP9VMlWTsyy0a9280MN8Tm8hUR1x6d71hPtomD5X6gDhYgRAXbkOIHu
         Rg4Z4vTZiQ3yXiMJVD5hNBWS1qYz5mpz2jE7BGQ/Xx8jI98IwwOvwvuNjp1N9YZS3oXu
         XOiP1934f3BQwQA6RTyPXSzx/zD74LqVWX10WsS1osnxtwklXTAqiMZivGo9dEFEuTrr
         fg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kUcPV2GCgbBShPmu+5wSCUq/MqsCE/eLeOt+CIDiVPc=;
        b=Eaw08NmYpdNbTGQk1JyGZ3GlPSpxbi/p4QDwR93Be8F/Go7oUjJf8wQfg06t27G/rM
         QC6Pt7tyjCkkceD3KAJkoqZ5NuUzi7zgvtdN6Vdl89bj3Y2AQkepYCBBnb6rO2v4sZsu
         UWXGLbXOXeS0qrVOKspKOn5dyZoSNzi+Tze87SLInPiIvda+Bxqx6pUQpWvwukh2/zAz
         L0u9S9P5nsIn3Tk06Gjo1uqYNp51MjsA6nG6VbaLWlYPrkOh00ajIlTAkc86lcMbAN7g
         iYQQ7sNTQG4UdlyG/dKA4YmC/yWAbyPtZ9BlgOVMiRv2wROR8+NabxeKreDI1pzOxby5
         BWXQ==
X-Gm-Message-State: APjAAAVaj2ixf4jgzlNJHl5u0paDkqhDTv+YkGblEJ3kT3kuzoilPUi9
        wX5wmXjuMa4oHbHB+oK8u6lzSRCupzRAp/9/yXZzaxrFPH0=
X-Google-Smtp-Source: APXvYqx7QzoUceGSUDS+UZI/PhAOHRPUfSUKows5za0erhmg+mfzJVs2uibGsDolvZSJht6gDa/ARZoYGCtEGtkDG/0=
X-Received: by 2002:a2e:81c3:: with SMTP id s3mr21788556ljg.168.1582296723350;
 Fri, 21 Feb 2020 06:52:03 -0800 (PST)
MIME-Version: 1.0
References: <20200219094702.6463-1-brgl@bgdev.pl>
In-Reply-To: <20200219094702.6463-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 15:51:52 +0100
Message-ID: <CACRpkdZxBcrXFMWDXddUGdQQku_FpdoojSq8-VBGjHHShWn0mA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: use gpiochip_get_desc() where applicable
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 19, 2020 at 10:47 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Whenever retrieving a descriptor from a gpiochip: use the provided
> helper which checks for errors.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Patch applied!

Yours,
Linus Walleij
