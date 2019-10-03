Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0DB4C9E35
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 14:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729330AbfJCMS4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 08:18:56 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40016 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729439AbfJCMS4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 08:18:56 -0400
Received: by mail-lf1-f65.google.com with SMTP id d17so1658822lfa.7
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2019 05:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gKFKePabTD1eOvwmyyZFiqnLejhQ9oKYDwkVZ0ztKVU=;
        b=gE9aCLkU+HUkyDWPPSzlObegTNQaCKpp8gn7md0zriecl039Tw4imgWwXthG0mDvz0
         eHIr/Hm/AU5HBvVr1y57VpLbkfURQluNd+9TPyHWCL6OZ2doM77HkAvkUgbY/h2tegkk
         lf+yO9lNMbutkV7xay82pr01OhMbpO2as93K7JzqQtlGNyk6fBHj8Dm+I0RQoWBOmDIw
         VvwmGvu6VTXyWEi1dUkDLbE0ibBEsUyMPE3Z17/PpKgit/zlgfLv/gfye8gLaBPNCF/D
         GIFFDZgBsW20y0DpffzVhDBBPsP2TM1IcKuf7azQY42hmk799WIKHd1aGbCC7SUX5qi4
         GTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gKFKePabTD1eOvwmyyZFiqnLejhQ9oKYDwkVZ0ztKVU=;
        b=dB4but9irLnlaxzG6DIJKDsL0lPCAvc79YvD3UPv9nE1XbtuLL8PBxQsbhaMZiWM7T
         TCwYf6PppEqNaZvHm7/7U4Tljk3RSMVoWvvXF34YJBkXy10Rd+3a9k6PBwUbkXMItzDL
         JePTEOya0MsbNVqQjWOWnLEaUWq6sSK8zOd80ni5Pe6HmMQJLJXmGpWDw7SeU3VC1cmY
         toFwrOotoUpe3IQ439cXoJzIA9pKnbLFVXP2wEArLaXRKBP8H4CHSplzDGX1t8Yl33EI
         7wOiaCnl+PI9rwR6cLfW9SQBME3ceztwpE5oovsPXGEx5RPCrQE2RyCFCAh3i6Xf3g21
         xp+A==
X-Gm-Message-State: APjAAAXJ+xDHKv7lVI/JlTWQpncBynwoITcj+E+qYJuyhkrIOtucoo+3
        hHwnPRdEyTDGhdfM+2oYgiBhsiAQ2zqloTCukKOLCg==
X-Google-Smtp-Source: APXvYqy4ldz+Wc1aAPF/pbz6ZO/x6cgivxofY8VD+reWEZ8AWkh8iIOzKT3mib7xlGScF5RKod4tsA82CwjBy/zOloo=
X-Received: by 2002:a19:48c3:: with SMTP id v186mr5595003lfa.141.1570105134340;
 Thu, 03 Oct 2019 05:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org> <1568411962-1022-12-git-send-email-ilina@codeaurora.org>
In-Reply-To: <1568411962-1022-12-git-send-email-ilina@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Oct 2019 14:18:42 +0200
Message-ID: <CACRpkdYErXVLAvwBoKhHiKZBOR3CSKYUrTPngb9pWJGBiKCyDg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 11/14] drivers: pinctrl: sdm845: add PDC wakeup
 interrupt map for GPIOs
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Marc Zyngier <maz@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        mkshah@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 13, 2019 at 11:59 PM Lina Iyer <ilina@codeaurora.org> wrote:

> Add interrupt parents for wakeup capable GPIOs for Qualcomm SDM845 SoC.
>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
> Changes in RFC v2:
>         - Rearranged GPIO wakeup parent map

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
