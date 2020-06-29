Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E20EF20E262
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 00:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390266AbgF2VEj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jun 2020 17:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731103AbgF2TMo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jun 2020 15:12:44 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB4DBC00E3F4;
        Mon, 29 Jun 2020 05:13:59 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id d16so5980115edz.12;
        Mon, 29 Jun 2020 05:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Af8MV+kVnTa7zdW0E2E5KjHeensJMBWL2+gQQwCUvNQ=;
        b=Mt6YICf2k3JascEFwPr+DhVRtQVII9mitVMQBW+uLVMO8/WmyQT80jOuzZcBOBRepN
         3tzXW2b8Mjlq8B8TpjQH2Tm4bNtSxoR7BC3Ghx5abmvL9u/vB1JdEbT44qNQyVO7ATqh
         vhiHpEgAX3qNWmGPTqSgTxz1V9WXJ70C8RxRSdOpBFQEs+omcOyaBtsZEvBYihgp9WGg
         2buf1O+ocG/M3upbbAGl/w2ACJOYmw68GTIfmYtflzMC3yjUY+Bi+IDmAIHhyHnMsxY9
         hb78RlB/eUGpN8EF8ikWLyk9OuAjyuLVWBi8wDqq3TbqdoCE/aFcJv10R/pPmR2yCAyw
         qAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Af8MV+kVnTa7zdW0E2E5KjHeensJMBWL2+gQQwCUvNQ=;
        b=oFW2Lxj1CtqT32ZG8i8M/PS0hhpXotD7aL7aG3tzjZJ1/DauOurLYbcU2x/STLA36q
         x7AB39z0oq3IvzG0w6mVNCBpky10GdL6G5Q+Cy5PhfGlQvHFfcPTl6oSHBGuGS0MSP50
         0PgySA/IyLJ2BfnIylcfHpYS0kNrQc0VFvVUJLvEet/YYIsh93GKOvGxrSKQcaYkUsYJ
         x/+FNNNof/USi6M907qtWIFJ0ArGZFNs72IPPBC5w/i1SKgX0i1NcKIsRTXV++u4okJS
         X3l8qHVH65QyjJJy6Ps8qMm+mNLr08Qp6visdbEkt6MqbI8pXHQtD3iTeT+WCTqFzSfn
         Z/QQ==
X-Gm-Message-State: AOAM530rMQoSdMfCpNCtipfPBYu6ygGkR0qN6aY1tFVTMmE1oNHJ/O5c
        mSH4BnOk836TtYfVSuhUW9ZPBiQ8bEkFQ74wIls=
X-Google-Smtp-Source: ABdhPJx8GL2/LtvhYYnPZOnTG4JvnILLNC3i/hbToZbdsMBix31WyuKYxSB8w2InTRozYPvAU2y9b9ASSm/xVcLNwMA=
X-Received: by 2002:a50:ec8f:: with SMTP id e15mr16899806edr.70.1593432838641;
 Mon, 29 Jun 2020 05:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200621213806.551879-1-konradybcio@gmail.com>
 <20200621213806.551879-9-konradybcio@gmail.com> <20200629120918.GB1319@bug>
In-Reply-To: <20200629120918.GB1319@bug>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Mon, 29 Jun 2020 14:13:22 +0200
Message-ID: <CAMS8qEVaJ0ZpZ1HE8U9DbPfV0-cc=_qyLYdA1g7NYfz-WcE+aA@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: qcom: Add support for Sony Xperia 10/10
 Plus (Ganges platform)
To:     Pavel Machek <pavel@ucw.cz>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org, Martin Botka <martin.botka1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> This is not usual comment style.

This was fixed in a later revision and is currently applied to
qcom/linux in the correct form. [1]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=234d7d6b4cbfab0e900f12658053689bb3376141

Regards
Konrad
