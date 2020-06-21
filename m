Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA6C1202D55
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 00:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgFUWEk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 18:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgFUWEj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2020 18:04:39 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 862A3C061794;
        Sun, 21 Jun 2020 15:04:39 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id dp18so16032293ejc.8;
        Sun, 21 Jun 2020 15:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Spk5YRbn2jPgWgpNhJ4Afpe8xXwIv2Baa1lVhBfdK3g=;
        b=NvVFmv++xc3M+rpsEWwV/zKk3ijoKtAhN9D0YPRD/f0m7ZBVvK643GM4fPA+aXsh00
         2rVBSn3FS+/73KTiGUgDRMc5nIqHCN0RR2dvoE57baVI6cKng9rOe8+Ng6NM7nHD+MfK
         kCsZIjFkbItc8Kyu2mJ0u1wv16/uLuhtXXHJFKS/LfZlEf12pCKGkD6UFYLAy2uZyRGP
         Q6tUMApFZXCuWxD2C9uHmTHqZ5zchxstYl3ikdj1wVBk4l27WBGs1meTeT5Zf85pkxI9
         itYNHiLfsxToJ9j590dfKzHQY3PiLHFULRg0auuQgX3FXuHCjH/FWY5UBQpmtoXr3p2L
         TZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Spk5YRbn2jPgWgpNhJ4Afpe8xXwIv2Baa1lVhBfdK3g=;
        b=BqKHGbPKiwZ0zXqqYtT2LIYvFhATzY1pDuRXWzgs4CQs5Ki8c+ettpZnJMDfsh/B+q
         yrpQAvgOL4j9x4hwiDYgt2IcLuFPjybljubDfq2o3asjx8l3ce6xrNIcJMbXDST7dNxf
         TGSDWLK77UH9N8TKEFVa5sjAv0tyFBLVMBOynZDYArIoM0evfxu5rjJPtsdcvGjT+7sL
         EIA9/rQcKG6MRb0Xu2W+ANJzzo2bB6xLYfRcK8kmGWvolN/QBl83Ye41wHLbtvC7xSe7
         oivSDF1z+HMC8HzlAgJ5uwl2oTLUKDq5Kb8+KskyIaJPlTxN8Oa3sbWj4w+TS4knFSoj
         /R6Q==
X-Gm-Message-State: AOAM530YizlYbpUVX4QK+VaF3trVOyQpCBSEn+gdUP/Nl+XpD8dj8uOM
        ik/UwPNpCXtyGbQ463GC2MLg19RPrU5aZkGdP0M=
X-Google-Smtp-Source: ABdhPJx+kTnECDHLiva+J35qqI7A50Jg5aty3u8bm4ZQJ1sj4hT06Q1D0+I8HzqDeV5LlOZqe+akncr8u/fSVdF2l6E=
X-Received: by 2002:a17:906:4cd0:: with SMTP id q16mr5134240ejt.418.1592777078219;
 Sun, 21 Jun 2020 15:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200621213806.551879-1-konradybcio@gmail.com>
 <20200621213806.551879-9-konradybcio@gmail.com> <CADQ2G_G8iFE_9oNRBFum_je8FGgZCEe-Hj1SMr06x+xoBanAnA@mail.gmail.com>
In-Reply-To: <CADQ2G_G8iFE_9oNRBFum_je8FGgZCEe-Hj1SMr06x+xoBanAnA@mail.gmail.com>
From:   Martin Botka <martin.botka1@gmail.com>
Date:   Mon, 22 Jun 2020 00:04:26 +0200
Message-ID: <CADQ2G_HN5XC76g7N1Co1fVxd=mg6zA+j8Wcyb+_1rzs2uWz=eQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: qcom: Add support for Sony Xperia 10/10
 Plus (Ganges platform)
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
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sorry made a typo in mail.

Tested-by: Martin Botka <martin.botka1@gmail.com>
