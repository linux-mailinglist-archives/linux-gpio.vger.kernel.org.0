Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 840382B7343
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 01:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbgKRAmN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 19:42:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgKRAmN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 19:42:13 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16DF7C061A48
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 16:42:13 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id s30so483927lfc.4
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 16:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AhR3THGCBrVXjeOnV08F1d9p7PtDbHgRKWSpAOZFqT4=;
        b=fU0bhh5k3eRShZSzzLlUeI62qGuupsqefCbeZ/li72OmXBQ2khm3G8jECrz75cMZNU
         s22ZtbSPj/uhSGP8ePVsL3mPVoqrS8zBlR4M3DdDxLbYORA2YR+zG1yeiVzGc59kUb2L
         uoLxxXzUTChf8aXos/AfSrtc+9wRklE1iqg/C4kpxvVLzA8YMmY/BMVZzJhr41TIbFkR
         i2j+MJMHyXpWkmPwpQp0dTY31kzSjlFkptgvlRLr4r7DoXaFXDcLStnRb9+cYlGxKCXa
         +A4M7jhPkqP/j6pQ/LfTvQCWVBdmFXziXC5xFLJBeEBE35CyBLcxVydhHtCeU1cywO+f
         jHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AhR3THGCBrVXjeOnV08F1d9p7PtDbHgRKWSpAOZFqT4=;
        b=trLbsD9kGMxncaSmDInsvQH2YFnKKwHtyon3RF4uvOjPZbya9Llyj7PPrk8oqt8+tS
         +iD/+UDsqAnenUPDwHZdz24YqSmEZiTRKhk9LSckv2zUAogRd66wE8kOqbd8MI0wqQCM
         gzDmy/8eCbqBQ25rN5cKDycnTqD9c/JWcHy4dDv3BH9xlIn3ZsgvSs3jhv5U3D5AOR6A
         2vNjOOtD8SD3zZWbGGmO1Yvr23vXE09pbYjiI0X8T9c8yLwdtzz7W61VJ6SPQ/nFjpjM
         d8T2MkWLlAC2N0PoBZE4UXk+hr26OQdr40XpPuaS8v/tWS/y4XYAlJ7/InVBDcZVDL1y
         js4Q==
X-Gm-Message-State: AOAM533ALQLgD4gLFTm/Oube3ff9xmGLaNat3rHKE8kUoxBHDJGEb8xh
        nJ/Pq91P7xpTbr1H1lrTrLn//FcrpbZtk50/sJiDXA==
X-Google-Smtp-Source: ABdhPJw0Z1MAS/vi/P4IP9RH0EGyAdQXdsSNfUhmMjBWi26/jNaQWq9CK3LZDNXjLwLbOOu/2xbmCyc5ctaHWz7HkKI=
X-Received: by 2002:a19:546:: with SMTP id 67mr2481423lff.502.1605660131604;
 Tue, 17 Nov 2020 16:42:11 -0800 (PST)
MIME-Version: 1.0
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Nov 2020 01:42:00 +0100
Message-ID: <CACRpkdZMAKvCH6WmqV2cQtjrfMo1svBrqwSu=+QuMGwmunE90g@mail.gmail.com>
Subject: Re: [LINUX PATCH V3 0/9] gpio-xilinx: Update on xilinx gpio driver
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        sgoud@xilinx.com, Robert Hancock <hancock@sedsystems.ca>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 6:13 PM Srinivas Neeli
<srinivas.neeli@xilinx.com> wrote:

> Srinivas Neeli (9):

>   gpio: gpio-xilinx: Arrange headers in sorting order
>   dt-bindings: gpio: gpio-xilinx: Add clk support to xilinx soft gpio IP
>   gpio: gpio-xilinx: Add clock support
>   gpio: gpio-xilinx: Reduce spinlock array to single
>   gpio: gpio-xilinx: Add interrupt support
>   gpio: gpio-xilinx: Add remove function
>   gpio: gpio-xilinx: Add support for suspend and resume
>   gpio: gpio-xilinx: Check return value of of_property_read_u32
>   MAINTAINERS: add fragment for xilinx GPIO drivers

So I applied patches 1, 2, 3, 6, 8, 9 now so you can
focus on developing and resending the remaining patches.

Yours,
Linus Walleij
