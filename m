Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB759203EA5
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 20:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730273AbgFVSCK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 14:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730179AbgFVSCJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 14:02:09 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DBD8C061573;
        Mon, 22 Jun 2020 11:02:09 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id y10so4535240eje.1;
        Mon, 22 Jun 2020 11:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N8ncUP5m23nGjZIgL4bF3D8cjQSnQ88Xff+6y4avOsc=;
        b=ABekFSyvmWn68PLFbmT4LUVG8byPCMilHNm7vqnBdCBV55KzEnQ44pTMTSo26oUxdY
         WAptexDHEh/V+fsg2OvEgwKbMYSgYUDyL6fZiSv1yESvqW76EuzP33sBE8IHnKB16Eus
         GhZtYZDif3Q2YVkhzm87bR9EEF6sD5TXFTJQHyPOjPP9BT0mqcbA7M9TWVJ1DcTbqO2Y
         CrQG/MWr3rPtas4jUchxF2P+zWu0bN208z8Ayki7ULmdpJ4Pz2EcWRqLQuHH93esan9r
         LglKSKxuBw5Vo3YaGLEU/QzZM9CJ9R/+7eXHppK4C6rK0C1yXfz6awgN+GIU+cV8JVyC
         H4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N8ncUP5m23nGjZIgL4bF3D8cjQSnQ88Xff+6y4avOsc=;
        b=iw2FLWf5d156lZBePTTzbO/vlozDoO7nE7r+gN1lX/cEy/dNWJlc7zLZTmWEiHTCJg
         1dNwCIlo1gP+qIT4si44JgW8XQgDWk8GHeucA0eiBi6GVj5WnZA7vrcIqJEcx09R4EPQ
         NUO5vw0g7wANoxaUowzCg7S1SVeqw+7VU57DtoHAXrY1bk8TVHKjOD0dhzIGJx5sArdP
         inVXpHIv91N/VnRmWVAnfy8A+GwLZh9I4aMMIuXBPj5haX8rFLrypb5+hCUkV2I91dG2
         sG3XyUzhLGGbJrOaO/IKwR/KI24+MBBOz7MBImOBm0hKhSY2zI+XpqfL87kLj8sENu5+
         lVBg==
X-Gm-Message-State: AOAM533OGValjMni62UHdSAZGMGHhcu92Hn3a90WJXyc5q5iIJdNZRB0
        J7AZtwhUKl35mxIuK41hpkAYP51rEabpxf0EC4U=
X-Google-Smtp-Source: ABdhPJzy1eOtcrb4Ztzzlpxz2vyV7gDQb2/lcT2CNnTSaKFW0lqCRQKUk68wF2yJdSqy2wwTVxnzLyyxbek301vQtt4=
X-Received: by 2002:a17:906:f115:: with SMTP id gv21mr16115978ejb.340.1592848928328;
 Mon, 22 Jun 2020 11:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200622075749.21925-1-konradybcio@gmail.com> <20200622075749.21925-7-konradybcio@gmail.com>
 <20200622174920.GS128451@builder.lan>
In-Reply-To: <20200622174920.GS128451@builder.lan>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Mon, 22 Jun 2020 20:01:32 +0200
Message-ID: <CAMS8qEUP0ojnzww6T46cMTtA2kA2hZxdjepQUF+-ACSFRvTSSg@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: sdm630: Add sdm630 dts file
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
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

Hi Bjorn!

Thanks for your review. I will address these issues and send a v3 shortly.

Regards
Konrad
