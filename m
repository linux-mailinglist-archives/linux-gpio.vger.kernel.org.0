Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBB4AE8A59
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2019 15:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389079AbfJ2OMH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Oct 2019 10:12:07 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:34292 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728306AbfJ2OMH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Oct 2019 10:12:07 -0400
Received: by mail-vs1-f66.google.com with SMTP id f8so2676945vsg.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Oct 2019 07:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xtktdibe6gBkHP4tPalXgDCM43ByFj/zHBOZyxypx60=;
        b=Qvlup8zh+vLsFrMkO5ZeuRaMLG8t9uMEwxGgfA94WDokIhbNSmVCtyY5vd1PLlUONQ
         hddCB9BL5rtyItUiFyH1HY4b9YOYbr8vntDY1XeFHIRvVoonKG8VsFvqpT2EfV2h9x9Z
         i0se1YYEoWyyXwb96308pcLUbl9QKmC6Sf1vRj1Nlzct1OcLSw/WLAkyBrczUB75lWW/
         LLLUfaDOyIJSjqUR3bcNYEYIiPFplhimNhZ/bYg1v4OYMeAFz17lv9i1SiNQ8Luq8Z/H
         WJUxOtuWg21TvkLrZbc/vThifzfQdFa63F/R1G74iOsmJ06i8uHoxw65zf9ZAkUbOU6m
         VoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xtktdibe6gBkHP4tPalXgDCM43ByFj/zHBOZyxypx60=;
        b=MXEiHM4VHmXYD70n7m1sRHM0L1OkthDli4PDdCYWBD6MsJEygYWxWM08mc0YifSQNQ
         IP1A0T8Jum1qZ6Nja7wfCr40O3nq84NXkHdfF9AzNST41nqWnVb+zmk1BJeAaWIdUnco
         TrUq6Pj1P29Z8KyZjXU1aSnsDwKSu4cx3WlUMVRr5ZR8iGSMR+KyOURlcSrCRcorySj0
         U98r3hFDDXSe9HefiNFMcNdQhaLrwR42KpUmzkfMCcTHvZdqUATf0w+LQIayuapXmj3P
         WAXttMsWf8/XSgrIyBnim2m7xdFBE6zDJe3mkRsd6H95bMDdkbpEQcIM3k01EzpgeVOU
         LqdQ==
X-Gm-Message-State: APjAAAW9wEI6xj5CpAQalsrIL2jI2l1b1oX6/gpjW0ZbhZ1Hiwb4GPf3
        0vz5Noco0K0YOQLCTTRtU1/Ar3cAIYN+GUVIoed37A==
X-Google-Smtp-Source: APXvYqx7ASj2tpxKnJFCPomdz3ErcWX3mA9SxsCo3/V2wa1imgq/JhXcbzExPy2tHa2a7tITSN4nUS0fO3+VSrk8K5Q=
X-Received: by 2002:a67:2e11:: with SMTP id u17mr1866632vsu.84.1572358324433;
 Tue, 29 Oct 2019 07:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191021064413.19840-1-manivannan.sadhasivam@linaro.org> <20191021064413.19840-3-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20191021064413.19840-3-manivannan.sadhasivam@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Oct 2019 15:11:53 +0100
Message-ID: <CACRpkdbQH+=ZMLeZ_uO14=XgadgKr0ogT9S4vTXNosjKT14MnA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ARM: dts: Add RDA8810PL GPIO controllers
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-unisoc@lists.infradead.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 21, 2019 at 8:44 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Add GPIO controllers for RDA8810PL SoC. There are 4 GPIO controllers
> in this SoC with maximum of 32 gpios. Except GPIOC, all controllers
> are capable of generating edge/level interrupts from first 8 lines.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
