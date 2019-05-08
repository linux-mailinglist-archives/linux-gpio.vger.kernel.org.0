Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC5AB17871
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2019 13:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727675AbfEHLh1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 May 2019 07:37:27 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40641 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727622AbfEHLh1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 May 2019 07:37:27 -0400
Received: by mail-lj1-f196.google.com with SMTP id d15so17176625ljc.7
        for <linux-gpio@vger.kernel.org>; Wed, 08 May 2019 04:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BpnqPkoNie8VmWKHRIpsFiWwxyYHdk0y7DvESb47NKw=;
        b=mbcEThxtHl49DxJFwaowXuzI7O1hKSRz8ynBF7KQphTgOg3MvGiKlfJZKS+mbeD0VK
         qiaUydH/m8ZgkzN/cZl5xLXIua5/qZll5IJdOsSwi8QaUXxu023BnPON8Q7F0MLqojxb
         TGZHDF8CFVtIimWRZVMxojhfMcaBBQOlYYZ2PlgZWCOga6EtiKxjMuDHCTSv70E5BKhA
         uUu24qk0IqqvhlmNIvJqUYMA0DQm9uhFwnZZvHXs0raGlnEAj67zl0lw9dvpPcFbPCVB
         EEJ7zJ92TEpqsLLwjP3pmyAR9k7KywJOdupgZ4AVZhyh8880zi2uk0kt5NLcUx5C3UR5
         CCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BpnqPkoNie8VmWKHRIpsFiWwxyYHdk0y7DvESb47NKw=;
        b=UMb4F7KB81eGhnSs6yG7Ow5p3SSFFhHKqIDKEhwze43MgQscMQl6tG6x614BD8zN14
         2vHTPzvH84/DobB7gYiZCL/b//k45InK56hGMZQD1pBlEBXtC+07bfPjbB090DOqYXDI
         gvzqnbDQQrWGCCcY2gx6/KNMmMzAT8p0+DAm4+Ho4PWtgLMasXtV/h1SZUaxEdQyoW2D
         AYpRCBK4VVjlaSDUojYuDPz83l0nIHfrPxDig97CmoeEU6OZFJG7uWlmLYSDVjbsi+Qh
         AY2F9CBIobwsLzxUwu89T1iywWgSynAsl9iNff5YTLxick4dYINfBmFfBpji8885ENU5
         eSLw==
X-Gm-Message-State: APjAAAVxYCjJRwrf+FW+VNwIWAqNodEFfD388XS3K7XYsDaJ44AdSbQt
        9I/xhYW6eh2PTN1Tuash8C1w4j/VZ+B4DV2aPeX17w==
X-Google-Smtp-Source: APXvYqxzokkoYM0CYuKBdGSmRVEMfbeYgO/MyK+IGeHzFGxkNxpbkvrtGY9SLOeyBiISFuFxSx34VgJB+9ntDFcD0tg=
X-Received: by 2002:a2e:9547:: with SMTP id t7mr20959335ljh.153.1557315445260;
 Wed, 08 May 2019 04:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190420111404.6225-1-linus.walleij@linaro.org>
 <20190420111404.6225-2-linus.walleij@linaro.org> <20190508085447.GA16289@sirena.org.uk>
In-Reply-To: <20190508085447.GA16289@sirena.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 May 2019 13:37:13 +0200
Message-ID: <CACRpkdZethuC-da_ePjMyhXDmaxrcxTj8iK9taFptdAPp0FOhA@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: fsl: Convert to use CS GPIO descriptors
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-spi <linux-spi@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 8, 2019 at 10:54 AM Mark Brown <broonie@kernel.org> wrote:
> On Sat, Apr 20, 2019 at 01:14:04PM +0200, Linus Walleij wrote:
> > This converts the Freescale SPI master driver to use GPIO
> > descriptors for chip select handling.
>
> This doesn't apply against current code, please check and resend.

Let's hold this for the next kernel cycle. No rush.
I will rebase on v5.2-rc1 and resend.

Yours,
Linus Walleij
