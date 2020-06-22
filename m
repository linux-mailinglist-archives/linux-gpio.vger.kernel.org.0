Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7A3202DDD
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 02:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgFVAWV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 20:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbgFVAWT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2020 20:22:19 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6836CC061794;
        Sun, 21 Jun 2020 17:22:18 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id w15so8548905lfe.11;
        Sun, 21 Jun 2020 17:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0lg2uKJKReGcJ/SN0dspdmB6LnpVWoA9FveJXoHvwkY=;
        b=mwOE4MyfbAS1tKiNvOT6CPPxIYnHmqKecesQNuBi3IZ0UFofg3RlE3bbVu9nrtV5kG
         3EJE8YdXNXbObffPDwiAxYCUZOjsy+JpK6Lmx90Q1X3orgKUt8eXEFwygjhQ1cixJxdE
         q9DcknfPWD/BhFpQRiYNf10lS1vkcBFs/uHAD1IBOpl3CzIoFkOXpU/MWc2TijgSpq65
         jBSNwfZdxJvOz0oBISSJrSiQpHKoWlAAfLS7BQitRPIGY9n1DYlVPerrCT7WFjj5PXMW
         7eyunCd1FbrofrszRt4FnU86IDdZoA8ytY0zZLUK6JXzuitOLNTJ9btYweKV81bd2Rzf
         PGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0lg2uKJKReGcJ/SN0dspdmB6LnpVWoA9FveJXoHvwkY=;
        b=nL5WW26TRuO02ddNrPnnmuTVG+GCLEnHVPg5NcSf4Do/ScFikyRn0BGis3kb8jjPBx
         RyOEZ7R59oQt9n+NBTeWY1jxKwFEeXLM1TyKmfiuU5mKDL05QK1q0L2NNcVGlRK7tZmZ
         pWq5hcMFzeo1BhCfx27IGsFLbw/l2EqBNv9W6t821eXkjEGokTA23Ar2XUmU//rFQeLO
         zvv5y+egz+zHJD5pxLEbLt4HELSFznm6iP5CgqLHXewUDaJ70xuLw//weWC91SBuTDe7
         RL+6YOp1S8wL/fpOwHNIaFOleKq/XBCpQI895RTcz/W8tFLe96yVcUrSiJH50fC90Vbh
         dpWQ==
X-Gm-Message-State: AOAM531E663MpazRQRTuo3nsvG+g6xdb4tOjgLqHeJcTana4ftsC5Z6J
        L6X9FZ9O16b0CpxMghv8cVGaoCbn4w6SDIAGtCA=
X-Google-Smtp-Source: ABdhPJyUc+wlDsye7zDHRg9OmC1EKYoLXxqlS+dIOZ94ext3KQifTcuvkirB1xfQuxg8dCrh2qPrArxAeAT9VPppQd8=
X-Received: by 2002:a19:b07:: with SMTP id 7mr8088813lfl.38.1592785336823;
 Sun, 21 Jun 2020 17:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200621213806.551879-1-konradybcio@gmail.com> <20200621213806.551879-5-konradybcio@gmail.com>
In-Reply-To: <20200621213806.551879-5-konradybcio@gmail.com>
From:   Alexey Minnekhanov <alexey.min@gmail.com>
Date:   Mon, 22 Jun 2020 03:22:32 +0300
Message-ID: <CANi4RBT=MDvN8PVKr19OjsX=LEAiN43JGPycnY1DTFw2qvYBkA@mail.gmail.com>
Subject: Re: [PATCH 4/8] clk: qcom: smd: Add support for SDM660 rpm clocks
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I have almost identical patch in my working sdm660 kernel tree, maybe
this can be counted as tested by?

Tested-by: Alexey Minnekhanov <alexey.min@gmail.com>

=D0=BF=D0=BD, 22 =D0=B8=D1=8E=D0=BD. 2020 =D0=B3. =D0=B2 00:40, Konrad Dybc=
io <konradybcio@gmail.com>:
>
> Add rpm smd clocks, PMIC and bus clocks which are required on
> SDM630/660 (and APQ variants) for clients to vote on.
>
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
