Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80D206E4091
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Apr 2023 09:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjDQHTv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Apr 2023 03:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbjDQHTq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Apr 2023 03:19:46 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234762D69
        for <linux-gpio@vger.kernel.org>; Mon, 17 Apr 2023 00:19:44 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id n193so2238394ybf.12
        for <linux-gpio@vger.kernel.org>; Mon, 17 Apr 2023 00:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681715982; x=1684307982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LezI5N06gUfL5VofBpxCgnhm0O11oB3isx+9Mg+GBQQ=;
        b=CPMdF9/el+rtkzp7YpCWqGDoSW1U2oiym3NrO9uV4H6JnBztqIWxyh7oVJhat6ENmW
         Hq74if1BquvMgI/1dWEq364oXps/TdQI6yEso5aURXjTuTb+P2Nvf5mUBw66p2MoVYsL
         +lUYFUC9HER7ZU3Up6UVWViCqvc4nIxg4Mtyjwm6LR1h24KJjyB2WTIrTX0A/n+FJ5Pp
         yYNRnhiWLXuM6qVtfsPH7GaWlq237fNVtiTPm1QE8wZ012RcqEywRvs2mFT4Y611xpRi
         NLf8d8mDaBMRVKqSRsBlCXedCHkp1ol+t9suH/yZo0RwK8oUsELnEhREinTpK6OgtEIp
         n5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681715982; x=1684307982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LezI5N06gUfL5VofBpxCgnhm0O11oB3isx+9Mg+GBQQ=;
        b=TfRHJmfbjWfLRoDSn2xw5noXrNv7Oy7SWPB8KGu96KaX1EcgE2X/Q7XH3P4ONmIBJb
         UMCKDLW3aok3lN65mo7OAyr7qBb/g3vvYTtoCM1iGDSh7fU4q30wrjmr+1GcFYcFVk2c
         Yc2hUmSQmsGn/5RPRcRX+eYVYMUbcsD7WIkFlYuxQbW1QW3dCKQT02XCOHCBO5qkeIw4
         RKwoxFWlWeX33vSHtlDlHXzJFVNPECFYnW6r1T5NC41WfzRp+sRtpvEOfZdPTipbEN9Z
         qOL32tG/twLPtCFVOrhBNmyYhZ3DLAGPlPWpKMnesmmkShdJPFRT9lFBGo7wCFloJUAM
         N/wA==
X-Gm-Message-State: AAQBX9ccVq5CG37tRhpBpVMxd+By9JhfiIS5vn5GNUoYUCKpJeiroKMb
        T1D74ZOuQqtgztTLEAvH6efPGKuKhXhLkv1mOPFORQ==
X-Google-Smtp-Source: AKy350ZSDXiRkRB0XzZ06b+WZU9a+1WWRR7+3OqW6fz9YLhF4pt4K0gJDZ5/Pn7FrsHRllwne80GePfA2ZD3X950KkM=
X-Received: by 2002:a25:d057:0:b0:b8f:5c64:cc2e with SMTP id
 h84-20020a25d057000000b00b8f5c64cc2emr6750036ybg.12.1681715982402; Mon, 17
 Apr 2023 00:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <CABrMOxZY6Q3wiYsJUaXZiSET_gjMJ3GWaMrDCXwXC6nf7AX2_g@mail.gmail.com>
In-Reply-To: <CABrMOxZY6Q3wiYsJUaXZiSET_gjMJ3GWaMrDCXwXC6nf7AX2_g@mail.gmail.com>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Mon, 17 Apr 2023 09:19:31 +0200
Message-ID: <CACMJSevuPg=bWkE5fTdechJMrTUWiaM9nn1f8G1tTDdphcPWFQ@mail.gmail.com>
Subject: Re: [libgpiod] Question regarding locks / race conditions
To:     Sameh Mohamed <sameh4@gmx.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 16 Apr 2023 at 18:20, Sameh Mohamed <sameh4@gmx.com> wrote:
>
> Hello,
>
> Many thanks for your excellent work and contributions.  I've been learnin=
g about libgpiod in the last few days.
>
> Studying the cxx bindings examples, particularly around line request, I l=
ooked up the C code for gpiod_line_request_get_values_subset  and saw that =
it does not deal with any potential locks.
>
> I searched a bit on stackoverflow regarding Linux device drivers, and saw=
 that it's basically up to the application to manage locks.
>
> As an inexperienced programmer in the Linux user-space; I have worked pri=
marily in python and C++ client applications at a higher level, I wanted to=
 confirm my understanding.  If I am writing some library to run the Raspber=
ryPi that will make use of libgpiod-2.0.1, it will be up to me to avoid loc=
ks when making line requests, etc.
>
> Thanks,
> Sameh

Yes! It's a design approach low-level C libraries usually take and
libgpiod is no exception.

Bart
