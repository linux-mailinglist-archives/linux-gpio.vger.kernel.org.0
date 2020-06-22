Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08D8B202FD4
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 08:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgFVGjT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 02:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgFVGjT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 02:39:19 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C511CC061794;
        Sun, 21 Jun 2020 23:39:18 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id mb16so16843514ejb.4;
        Sun, 21 Jun 2020 23:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UTfi4b8erlafdjROIQMGSunv2DNbIWrzkDCZLv011tE=;
        b=DFK98p1wLeynT/wsoxfmOQMAl5w+7qY8JSvESy9eH1v/rvYDHPqu6IAplDSWkC04md
         rqCDl2dBYvoSQigQJdoB/KsF7/Tn87GvcgffgEpRtUHo7o2ztPJVrFxM2EbAnFDIShUP
         Zxn/hkfTTH4BtxZWHV1qsmVaGAUZAdiYxkHTwFKFCZyMzLyxUQ4g3XTe1j7V6ST91Pfc
         41qr2/WzM5MT5POyYA2Ia6YKiEoE+XjGGWODVXztEKFBp/tsGAJflQd+VUXVGUnn2WwN
         hhMmUC05v4mzLSlbmXkOprdGl+B4knk7knd3YfWQpdPvwyAZwv/sotrPOueGnngf/3ft
         x4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UTfi4b8erlafdjROIQMGSunv2DNbIWrzkDCZLv011tE=;
        b=eBTRG2m5Kea9JYj5APKa8qyRdHsb4ubo8aoPS/dayISVrfYkj9oazlDb4k+uaWgH0l
         4trAiyWHodNnvQCszzoQLVfJtcBSjvXuv8iWB5pQ679+YEXrdGKnTI16T2EsuF2I3yDX
         L8ihIlSeYpsP2f/Sp10q+Jeqy+4MOWqcB73R+tXg/6hhDKszt2Y1PEGiJoURLvfiOnf2
         yZRtWzwWiJteWbZDoUDQT/DYgvtcAUFo+S1e75XWV6SsgbHMDS1k32lipr/+3coHAnFW
         ZDPrQlSIBjafUnm68FJ0EVgG25upCCmdyt5lqi1ZoBYnRaR6bEuxKgJKghjkH2Uj9KRH
         1VkQ==
X-Gm-Message-State: AOAM5315cOvhHTqtOdvbx3/SPLRyyGlDZplTsBrWcJHkuqVZnizCGh8G
        r2//Ql6of2surwzb8kgIjn83w0EVe634shSOtKw=
X-Google-Smtp-Source: ABdhPJwmb95kBquCZL4hUerl8N+Bx61Cmy8RB0rTg0YvcGRWZm5k/9ODdc6AKUOl7Bp+hr+WaQeoZhRXeU7wRyWqVCs=
X-Received: by 2002:a17:906:945:: with SMTP id j5mr14496147ejd.52.1592807957515;
 Sun, 21 Jun 2020 23:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200621213806.551879-1-konradybcio@gmail.com>
 <20200621213806.551879-7-konradybcio@gmail.com> <CANi4RBQ-o=K+X_AoZf_NvB19Hum0d9tpr6qjqPThsSNQZaj74A@mail.gmail.com>
In-Reply-To: <CANi4RBQ-o=K+X_AoZf_NvB19Hum0d9tpr6qjqPThsSNQZaj74A@mail.gmail.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Mon, 22 Jun 2020 08:38:41 +0200
Message-ID: <CAMS8qEW+7sjtdUcdUOcdDFCXSv2R4U4O-puyCP2utG_2rjBQ+A@mail.gmail.com>
Subject: Re: [PATCH 6/8] arm64: dts: qcom: sdm630: Add sdm630 dts file
To:     Alexey Minnekhanov <alexey.min@gmail.com>
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
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Qualcomm keeps them separate, so there's probably a good reason to,
and I would prefer to do so as well. But if you guys really want it
merged, then it's doable I guess..

Regards
Konrad
