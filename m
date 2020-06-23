Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14621204BF0
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 10:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731605AbgFWIIn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 04:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730977AbgFWIIn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 04:08:43 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0234C061573;
        Tue, 23 Jun 2020 01:08:42 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id dp18so20670267ejc.8;
        Tue, 23 Jun 2020 01:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AS7TimUz7z8+rMZyTH97GIezLjZkUeEIVCpiJ6Gw7B0=;
        b=S47ZPXC+FYwh8V7L5c2+8itWpI9KDfD8p1uh9U7fo57c18jaGgRyDzTW+VhNwH8Lsx
         MtX4+YmNcZEGMCTZDonFL1qWh+jSKC3RprK/vwB2F73qqvTU503k8bHuvsKvvZP5PFQX
         jUOlYllMjYf9G+Svf3u8HYyPJ4JjnpHT77U0BXwsv0eptbsZnW+GlQ8g8WYP8cpkF0pp
         4Kej3r6TvPPrq9I7mqoTtpCsM54uN1YOA6J1QAiCZu2/4IJdboPdXlOWF0lta7QH4w88
         DsEpcjJx1j1B5PQkJ7RybvRnF0zp5XHNpsLHCAFoGowa83Df9QzsfC4+kwnTp81mbOOg
         dCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AS7TimUz7z8+rMZyTH97GIezLjZkUeEIVCpiJ6Gw7B0=;
        b=CmeHKrgP3BrzrDpVqnkhP31KmRh/Y2tITuNuU92ZwdSDw/FEMZlxhMV0lnKkQZh4po
         anSIBatQjbHTCii3kWJ2VrZ1cEDBAkwAYOF6hSvfy1AzrOrYLAyd4I3vTccny8uufUQa
         rz0Rle6f+dLO1lK7kZWztUmwuRKq3BjRP6SphWd4wINjFlQiwtfQCiHSEmfZesE1+f50
         cI/WD7xwo90lIo3SMP1zJEdJ27LtDCh8g7vqopiNj0g62nCgTbwkTIFYKJ2Sxf6HtM/v
         VBYEnpPS81dLGtPyczzqx4MDEjdQkvCuvrUUNB7WgO/RzKUdDQwL8Gcws8DFj1kxPfj4
         R7Wg==
X-Gm-Message-State: AOAM533WABqrjb/rQRPHZBcsFUI/pzALeprIorD4eBIMmw4d1r+AuuGX
        WzEni9xdin4TIowJ8RMsru/6znJ/6kmQeWL49tQ=
X-Google-Smtp-Source: ABdhPJwljkT+moXY2qJ3jfsDmyXMt4qZ00+PFRngJKCMxSGvmEn/oJ58VvG6Tsg7akvsEz/4uYjX8RZRvl3tN1aan9U=
X-Received: by 2002:a17:907:94ca:: with SMTP id dn10mr18453143ejc.348.1592899721577;
 Tue, 23 Jun 2020 01:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200622192558.152828-1-konradybcio@gmail.com>
 <20200622192558.152828-6-konradybcio@gmail.com> <20200623073515.GA128451@builder.lan>
In-Reply-To: <20200623073515.GA128451@builder.lan>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Tue, 23 Jun 2020 10:08:05 +0200
Message-ID: <CAMS8qEULN_3_j17-kh9zmX=iJU0XVVj0=nPDj8G1OnZ9Oen0xA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] arm64: dts: qcom: Add support for Sony Xperia
 XA2/Plus/Ultra (Nile platform)
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org, "??ukasz Patron" <priv.luk@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks for applying them.

In case I have some updates to these DTs,
(they are being rapidly developed!) could I
submit them now, or should I want for the next
merge window? I saw that they are already
applied to qcom/for-next, so I guess the
former?

Regards
Konrad
