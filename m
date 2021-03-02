Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C189E32ACE8
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383773AbhCBVSE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:18:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378926AbhCBJGc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 04:06:32 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C9EC06178B
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 01:05:51 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id w1so33797172ejf.11
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 01:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nixeJubusGM7Feqhh7PvJHLMw88bPSUTUfdTR8eyzkY=;
        b=T7FhyODyGAEev8kKGIiZTBpLhwlf2YvrI6A3R7c1EW2KO9UcTnThjOQTiYGFCPz2QP
         kl/yw9BzFPAcUGtONnkAcQIBrCqtntzWy5RJNWcFwPTaNOncTe/AXDkdFNVR/VTXQmon
         DLY9CwFJOREM8NBRVwFZE9rYECRr483Rr53cMdVK3XYiWM63QMAGCpvWtQLrJdgmhq5v
         tYK1BRmy4C1ArzrdKUgTGQErIHLndp05Eir4hQNoP4e7XcVhyAvUmKEiWZTMsGqLcYsS
         knM4gCBjq/kYYoJ1K830Wg7eSC+atinPKyz3uq0J9aTVIo2cf+xjm0JgFkIqmGu0j+pZ
         D2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nixeJubusGM7Feqhh7PvJHLMw88bPSUTUfdTR8eyzkY=;
        b=hf2k2ZK4CDFLAm2qkdh9pZp80N3krYOe3sFewhCc58Wjd/qFJjp7CmGk0UA7gkWSv7
         ibMJAHyPnmRRRCGZMcKKeJBfGTpwjStp+dla2/XTiquCjcCMfAawa1JXOQ51B0MyXdKP
         ocNVMB+2gAAjrb6gCYJpuT2sIzUNOF6o15Y41Ce4sQHT9IMJOTLlHjsr765aQ2o1Ddfy
         ioOcwI/58rW3JWclt3rQsuJqmyUZK64LYbNha3JUL/wFm2V1VjlG/3CPHJQ2OKmRDe1p
         gDC+FwWvL7/54kaEUaWe4FF0AjJjxzFdSXX/C2y2CZ5jzwiufInTM4jzRkXHLRp+SRsT
         YKyQ==
X-Gm-Message-State: AOAM533+FAoa9mskdqwYhYdw6pLMWmgoDGinXb/1ht1FEMrs3DmAApEU
        IZ81G1Tkj8aCRqn7WSLTR3F8ImOHAiYfoPTw05FMsA==
X-Google-Smtp-Source: ABdhPJytVpDw3dkeL+Lm3SccbdNzpCbNqed7GQbqpmgh9AaReJpCUpiLuOmzka4tPzrEtZNSPdzFdd6lGL9f44MXrhE=
X-Received: by 2002:a17:906:ac6:: with SMTP id z6mr19195126ejf.505.1614675950096;
 Tue, 02 Mar 2021 01:05:50 -0800 (PST)
MIME-Version: 1.0
References: <20210217130225.6378-1-brgl@bgdev.pl>
In-Reply-To: <20210217130225.6378-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 10:05:39 +0100
Message-ID: <CACRpkdbSK-fFT4V89KQFwh_vxpUw5ALR8GK+0qK=35mVaOOx0Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/3] licensing: try to get licensing right
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 17, 2021 at 2:02 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This series tries to improve the licensing situation of libgpiod before we
> proceed with v2.0.
>
> The first patch is rather uncotroversial: it makes the project compliant
> with the REUSE v3.0 specification.
>
> Next two patches propose to change the licenses for certain files:
> non-library source files are relicensed under GPL-2.0-or-later while C++
> library code's license is upgraded to LGPL-3.0-or-later.
>
> The only person other than myself who contributed significant code to the
> relicensed files is Kent Gibson (Cc'ed) so these patches will need his
> ack.
>
> Bartosz Golaszewski (3):
>   licensing: make the project REUSE-compliant
>   licensing: relicense non-library code under GPL-2.0-or-later
>   licensing: relicense C++ library code under LGPL-3.0-or-later

LooksGoodToMe thanks for paying so much attention to detail here,
licenses give me migraine.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
