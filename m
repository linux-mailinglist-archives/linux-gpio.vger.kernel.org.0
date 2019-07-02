Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 892EA5D9BB
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 02:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbfGCAvu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jul 2019 20:51:50 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43788 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727364AbfGCAvs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jul 2019 20:51:48 -0400
Received: by mail-ot1-f66.google.com with SMTP id q10so484800otk.10;
        Tue, 02 Jul 2019 17:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ByhsgyjfPRCaYRtGVf0X74WgyTuKcSf1bOHMoBSZqlM=;
        b=DoR1ThEgGbjv19cCdz5BE+R5n05F1pnqjFfoBynSpfmBlQXLCSunPFhbew6NEfAxPs
         hvktSZdshjCkXciJetywqYC7halqVs7rQ//KLFsw2G6zRA5AsIWS+MKAiB3BahXdsdnG
         3pcSjZaiZgcd8FrveXvr89fZ0fLQgFuSogZ9Keg4qmRLU/wDp3HL5P22/Mw1kYoZQ5+G
         fuMux96KZ77382ZmWkZNoWLAaBNs9Wxu3z9DmmEm1nfFS9MPhHQDYbiOF++COdVen6EM
         7Bk7sB7xgr9U92H4vgfSCaES5Uuh91WVyRugW9AD2JAN7CGio1F23wG2jEvDRRzT8tfR
         wLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ByhsgyjfPRCaYRtGVf0X74WgyTuKcSf1bOHMoBSZqlM=;
        b=AbBJ5Hf5VLOiGy0ijgtAXlcJWJ4IXuu6MrNs3zBYgg9qnoSD59HHOQ2aMVYiUUFc2O
         LxXcX32WmOLPxWqcVVzS37hNZzBq/9MNf8a2L5LCpulyYKGHQJtNRz/AlE7Y3NvzN+0u
         q/vczSzK07IBWEjVGq8cQ4IFTwj9yDTRxs85koEDyh9rnHmCueAg6UenK6PqYatv+uWj
         BFXjQ7Gzck1EGt2gdmjXwFpmUAq26uF1M96L2LsBhJi5tddu84pZskNMTyhZP7tHCudU
         okdPbToO8BF5T2pRzneCxa52R1aZaDLwOUbMiFyCSVtW6c3w5h3LH3wsh4JDin2P2v+h
         fuFw==
X-Gm-Message-State: APjAAAVuOpXUJHOgUu9p6ChPVxuUYaNFzhF85lI2EK8uCjvoHtYovZVg
        rcisKdpQeKSrB+MQZasML6SqEq02hRTUYs9wzWh0Lowc
X-Google-Smtp-Source: APXvYqzMU6LhYLtDxe6IzTmM1WolsPD+74qKOzIux1HcUkzeXscSddhWfH+OlTyFXLefL/eH9LreXfId+iDH0UNqUbY=
X-Received: by 2002:a9d:6d8d:: with SMTP id x13mr4126550otp.6.1562108605726;
 Tue, 02 Jul 2019 16:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190701091258.3870-1-narmstrong@baylibre.com> <20190701091258.3870-9-narmstrong@baylibre.com>
In-Reply-To: <20190701091258.3870-9-narmstrong@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Wed, 3 Jul 2019 01:03:14 +0200
Message-ID: <CAFBinCAwvAb42uitinRr0k_Hkb_cDOc9dygQgg54E5nO69h=fg@mail.gmail.com>
Subject: Re: [RFC/RFT v3 08/14] clk: meson: g12a: expose CPUB clock ID for G12B
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     jbrunet@baylibre.com, khilman@baylibre.com,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Expose the CPUB clock id to add DVFS to the second CPU cluster of
> the Amlogic G12B SoC.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
