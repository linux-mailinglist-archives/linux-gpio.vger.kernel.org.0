Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 925C721924C
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 23:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgGHVTg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 17:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgGHVTg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 17:19:36 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD5D5C08C5C1
        for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2020 14:19:35 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id x13so20555002vsx.13
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 14:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/y9ZwmNn+oHS/YG99lAA1vbL+yYfWBpKvPtygJNnx1Y=;
        b=RbdOVmNLjU1dmqCFDkewrU07toCP6wp5eolc5J+eZG1aV0cymd0po74ugeBqP50Ln5
         mAerEGGHvwIPfsv/GD4tVXPwsYeKgvvwwJdzSeEtH5wxNt2BIMmDwhaxXREjc6ohOSRe
         oPjk2ZFYEIOsgoY5s+WuADTF1hRrBpUNm5+WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/y9ZwmNn+oHS/YG99lAA1vbL+yYfWBpKvPtygJNnx1Y=;
        b=VlGKE2eF3gc7spi4qdvy50xL4I3mxf/0hxPP+O9TU1fDYZ2RotMSTg1ghY5N/fmb1d
         ksnw1iNmoeKB77Ep+CLLKK6J5BujeGkYvH0nwRS534w0Rrfsh8j6BKyx71pyyz5kgoGM
         zBP8B6OSxhq5a+A2nG1+u08RDMCBid+oq6KLbw1UOxKL7oYLbaMuswzlLbiXWdcZEt1J
         DCl3ZHMUG8vQv3JOVPcrkuutjkaenqpBTOJ63J/KfhG8sStWe7x81e6fTvpfUWYkF0RL
         B0gYeJSgzMFpFdAdfij13MnJyVkgWmAwBAp0H0aE6twJNVG3AB9vZp7T86DOz6oPAinW
         muAQ==
X-Gm-Message-State: AOAM530u6pCuEhYwW7ct6u5FswCmPOOBrtXki7OE6CFFLV9STpjjhQbp
        9ZMi2CxQ0MJpVvJ1LFGKZaXnT2rRDI4=
X-Google-Smtp-Source: ABdhPJwBuAFvYCComq3MxEY5KW+KY0fhubz5BH6gVhEpP0Q1t6DzGmygM/qS5QveBfE2ye6Yaml0fw==
X-Received: by 2002:a67:2f43:: with SMTP id v64mr23503919vsv.128.1594243174896;
        Wed, 08 Jul 2020 14:19:34 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id h77sm149835vke.21.2020.07.08.14.19.32
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 14:19:33 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id k7so23955025vso.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 14:19:32 -0700 (PDT)
X-Received: by 2002:a67:69c1:: with SMTP id e184mr13796424vsc.119.1594243172403;
 Wed, 08 Jul 2020 14:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <1593762506-32680-1-git-send-email-rnayak@codeaurora.org>
 <CAD=FV=WyhJ6g0DZS=ysT-AyXJoiRX=UFE9fXY2NEHfuUHYUXCQ@mail.gmail.com>
 <20200706203805.GS388985@builder.lan> <c747043d-c69e-4153-f2ca-16f1fc3063c2@codeaurora.org>
 <CAD=FV=Xs9Z37hv=CPgLEALoSoX=Uyir0s=ker=YKecA+Lhy1Qg@mail.gmail.com>
 <56fb02df-372d-935a-cc39-c13289d65c0d@codeaurora.org> <CAD=FV=VcBK02CS+ms0HtV0f_t7G7-0rzJ11xDKWdLanGVrx0QA@mail.gmail.com>
In-Reply-To: <CAD=FV=VcBK02CS+ms0HtV0f_t7G7-0rzJ11xDKWdLanGVrx0QA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 Jul 2020 14:19:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WeXKAfWTK9q9u4m7=OU51rqQ975B+NBQDJT_sedPFOfQ@mail.gmail.com>
Message-ID: <CAD=FV=WeXKAfWTK9q9u4m7=OU51rqQ975B+NBQDJT_sedPFOfQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: sc7180: Make gpio28 non wakeup capable
 for google,lazor
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LinusW <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Lina Iyer <ilina@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Wed, Jul 8, 2020 at 6:42 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Was there something wrong with my proof of concept patch?  Unless I
> get swamped with other things, my plan was to try to make that more
> real and post it unless someone told me why it was wrong...

OK, I spent a bit of time poking at it and cleaning it.  I _think_
this is right now:

https://lore.kernel.org/r/20200708141610.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid

Please test and/or review.

-Doug
