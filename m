Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27DDC2C2041
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 09:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730771AbgKXImC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 03:42:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730763AbgKXImB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 03:42:01 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5214DC0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 00:42:01 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id s27so7737376lfp.5
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 00:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wvJieEgip1g2WEMiOdWtOXx++qG4HU5IWILT3U6RFgs=;
        b=mJUb4iGMJjIWX8lPMq4tIdVYYwCQ67pBbsA+TPEjhQUqZSAatFbBhuCBKyZsKh8fCc
         JGpV0Cc2ww5FVkjK63FldrCA9Ig/lclWUIkH+vU/D421GHQ60WDTVS7RhVSTyJmRPPbm
         vlKNUUw+ltheJYgTJ6WBZ/vKeTtoG5+fj2fyzvIPf8kBhK4gxu6qfLs/P1Qgksfm4fvE
         gCqb1lv58LleBY/hA5uwf9esy/7WwKX1IeTsIZVNuXTpHvrVix6x+q/3uc+HHz85ECOP
         7c8+s1vq6e5L2fQCf1ooqPCMlZ5x42ijySwcRxEE/jL/qA+EjXMtSGYmuBEFllkrARzE
         mNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wvJieEgip1g2WEMiOdWtOXx++qG4HU5IWILT3U6RFgs=;
        b=loAdSV6/OHoiyffDbyTkJmCrCeMo6nCRtdQ0kWzYQE2JXOjCNRcoCud+fpa7kQIrpb
         wVPKcelQZL+CGfSblBh0MJf/DGk6aOyxdECCXSEOw2hTavcT1zqHZ7VYChyJS2U1Wj1v
         Jg9fAglGp1Bi5w25y1J/v45N0VmFSBRHVj1jkzf6yZiMnyxVXIKFGGoiwttmcpGtDF2b
         cqr1Unrw0yFS9+FlvxLCVdRGRgwW1Io1TGx25e0bjz28YmBtgtJnp/uKI+w/rcS+UR7X
         cSTVfGeXpGZwRxPkRfW3TktI8cSBdxiimSWDAif6OlKXeCI8oGOEVNsfr5s4LtX7JXGn
         ZjeA==
X-Gm-Message-State: AOAM532GFRIs/+9BZifYwwFP+MWS9RveCGGHqy1AIEzJMY3RUCp+eITL
        0GsvW5VKWFyYbCHpC8JyWZNs/5YIMPXFOiec9OcIPA==
X-Google-Smtp-Source: ABdhPJwq8vXwP1njCi8d7YRqNvXM/K6scFYWCwRR28xF1q8lPLVDfnosAP2q9vjrVciFTOlk0Ez/FkVcAKgB/NO8E4k=
X-Received: by 2002:a19:7b06:: with SMTP id w6mr1430812lfc.260.1606207319854;
 Tue, 24 Nov 2020 00:41:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604988979.git.frank@allwinnertech.com> <85263ce8b058e80cea25c6ad6383eb256ce96cc8.1604988979.git.frank@allwinnertech.com>
In-Reply-To: <85263ce8b058e80cea25c6ad6383eb256ce96cc8.1604988979.git.frank@allwinnertech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 Nov 2020 09:41:49 +0100
Message-ID: <CACRpkdbYe7dRLn=-+f0KPu_gzfaOKwz+=2VwzQKOS7xFHu0qPA@mail.gmail.com>
Subject: Re: [RESEND PATCH 03/19] pinctrl: sunxi: Always call
 chained_irq_{enter, exit} in sunxi_pinctrl_irq_handler
To:     Frank Lee <frank@allwinnertech.com>
Cc:     Frank Lee <tiny.windzz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        stable <stable@vger.kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 7:24 AM Frank Lee <frank@allwinnertech.com> wrote:

> From: Yangtao Li <frank@allwinnertech.com>
>
> It is found on many allwinner soc that there is a low probability that
> the interrupt status cannot be read in sunxi_pinctrl_irq_handler. This
> will cause the interrupt status of a gpio bank to always be active on
> gic, preventing gic from responding to other spi interrupts correctly.
>
> So we should call the chained_irq_* each time enter sunxi_pinctrl_irq_handler().
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>

Patch applied.

Yours,
Linus Walleij
