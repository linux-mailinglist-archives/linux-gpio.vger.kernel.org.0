Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E62D11D108
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 16:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729009AbfLLP3g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 10:29:36 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41102 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729013AbfLLP3e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 10:29:34 -0500
Received: by mail-lj1-f194.google.com with SMTP id h23so2747436ljc.8
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2019 07:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qTpkotce35zOQrVkQ1ddp2xTck4OkTwMYGpdBkrE2zc=;
        b=UzEaq2vnzr9sjAB8ubKyX2pmHVWmdWkuu+kXjYG2MrzZD1H3BCHFpbhGTRmEhU2lOT
         OsxjshF4T1juteQFcTCADG9+eUhhqBXa1LK7eTSY3cUAUZTikyDVIqcbmcmZIQuRxA6L
         +517/FUr48FJvqV5Tr9xy3tuB2iRmccAiG9kYzTcjSSq3rCLDwyjpt18RS8SYr9PA0jr
         mXVoz/WVbIQmTmvhUapSfHUWf/g3WkNxTansBEtW996+m9U+dD+ToYp0AHoFboma2Umw
         ef2KrP/fZWJce09hRI69t023T50EAaAtJXUh5Omb32YPhdLcg5ruX60UShLSzSr14EEY
         d6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qTpkotce35zOQrVkQ1ddp2xTck4OkTwMYGpdBkrE2zc=;
        b=XyIjWQGa1JKoHIAldq33nEMLlUAQ+elkbu/Q7qwf30NWYdDPXxdPaPI1TXQHNlkzo9
         ouVDdta3gGjZcLNLppSzatN3izVsiCzlH7QwOCcNx1MTQo638Dcmwid1IYGntoXME4S5
         DFksZPN1MxrTbxb3oAJ7eXC3IOLDtVslm1aYMgQRa2W/TZpX0GC3XVB06rhc3D0uuopm
         yApJ5Yo3TJMttifP4sgPIk3VUi2sNMN/e9QCUgUdRhR9rfDvPf4pY9XZWVlfBVUbckLH
         ObTsGDQMOg+FanTJIj4U9+sEwPHtmU1gleZ83CzVOjh4imBE0vfzQfJJbGSXZnXogZka
         tEDA==
X-Gm-Message-State: APjAAAUi1cgS92UTC3WtnZe/ugkiSZGAWhYvshtCPlh2yZe1nilXmD+G
        O6QkbrMmItgKssBX3tjp0q6RYHAtfv6JSbohZjdBxA==
X-Google-Smtp-Source: APXvYqyj+Hsn41+C6NSE3ED5W7WfWudu0qa263fd1v1kKFO4Z7x5NLyw0A//WCDy2x3t0vaix6Qdu0vgTudDQt588nQ=
X-Received: by 2002:a2e:9ec4:: with SMTP id h4mr6403872ljk.77.1576164571573;
 Thu, 12 Dec 2019 07:29:31 -0800 (PST)
MIME-Version: 1.0
References: <1575352925-17271-1-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1575352925-17271-1-git-send-email-peng.fan@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Dec 2019 16:29:19 +0100
Message-ID: <CACRpkdaTLVNXd+-j_gkOfKnTk02XaZiMA_XxUeM0_4zZ_F-=ug@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: mvebu: use platform_irq_count
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "rjui@broadcom.com" <rjui@broadcom.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alice Guo <alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 3, 2019 at 7:04 AM Peng Fan <peng.fan@nxp.com> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use platform_irq_count to replace of_irq_count
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>
> V1:
>  Code inspection, not tested

Patch applied.

Yours,
Linus Walleij
