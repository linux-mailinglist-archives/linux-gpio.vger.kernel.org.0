Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5856533C14E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 17:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbhCOQLq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 12:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbhCOQLk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 12:11:40 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 413F6C061762
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 09:11:40 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 18so57693255lff.6
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 09:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UgG45DnJN104mZ62fCUJfdTRKEZH2usLGZgxXrdhPOk=;
        b=mUHiqeGQTBG3ZQjO21JCi06F5j/g81EQVWqMr0jkJFUuw2m8VNQYSIRrmXXJtvbL9s
         ymWakSrLdOt+OEtPOTx8bevz3/9tjkNwkZXJZkyaF5iExDAt3WutqrcPFzmcyDNhUSYu
         dD4LXIKry78u6jcezBwr+6gI8MHTm8Zvjc3F674jKislE2BFCEiQe6wwceID/aaBQPXA
         Mb8g2UWfuPFniTI4KR0bq56FbE+hlnRCW7v6WR2YUNBjfEkffWza+dtYk/sKWTiphGvW
         BaYYQrA0zVQpg8ZwMhzS7ZQ5AgoTmsqyxBMtkCn8ZmahzLXBWcTmkL0Anl69lQDC2uKl
         pCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UgG45DnJN104mZ62fCUJfdTRKEZH2usLGZgxXrdhPOk=;
        b=QlrmJMwX38ITBd94MdlrAlms2Gk6wo6bMNwG+5086gJbSJpn6g1QXXvqYnzU2OTlNe
         rYzKxgBii7O4qdP29LUvvXQnaINbsaZfLrNCpBflQvAuIVsO1I0UF1uSenRppdwad5KN
         b1XB1YQYDDiq8Y549g22887KbcbpNWfHM4RW3f5nh4YcvbEAdzSg0dCKXeJuEKmWKnqr
         aTRnmjMz0f6VprJ1NNQHR90H7uTdaT57W3Fq5pyPYElLTOLPIoIhILhB8NC5cNcHl4AR
         cHYwTwTWixFfv4WEgaGlhTwARqI5CsyOQbXPyWvRo4JBE6rc2zzeHDyBOKDjEbSgETnR
         8g8w==
X-Gm-Message-State: AOAM531JccEF5XfQGiFDQawKztjgOW5klKzaBiNLPLzsn6oBR8CSuy/V
        zaS+54HVjIjxqPiEDcsIEHt2N9JFYaKGOlUU+Uw98A==
X-Google-Smtp-Source: ABdhPJzSDII6RQrdm7IFyXHzh8DcTyH4MHf9A8Ug/h2fSz4PeMuCazMBlocNWblZcJ7uktAZ1fBY4YSWsRmi0FPulU4=
X-Received: by 2002:a19:4c08:: with SMTP id z8mr8010084lfa.157.1615824698726;
 Mon, 15 Mar 2021 09:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210303033106.549-1-shawn.guo@linaro.org> <20210303033106.549-2-shawn.guo@linaro.org>
 <YEKl7GbxBhui4eoT@builder.lan> <20210306012829.GL17424@dragon>
 <YELhMmDndOTSSJJO@builder.lan> <20210306080049.GM17424@dragon>
 <YEkOaK+UiLy8kSDu@builder.lan> <20210311011951.GT17424@dragon> <YEpLHSRKt651B6FP@builder.lan>
In-Reply-To: <YEpLHSRKt651B6FP@builder.lan>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 15 Mar 2021 17:11:27 +0100
Message-ID: <CACRpkdYNmT6c+RTLQAO1UEwWWWXHarYqTG4xnq8iR4i=rDfYfQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm845: fix number of pins in 'gpio-ranges'
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Evan Green <evgreen@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 11, 2021 at 5:53 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Wed 10 Mar 19:19 CST 2021, Shawn Guo wrote:

> > > But we don't have a "reset" GPIO specified in the ACPI node, or you mean
> > > with the introduction of .set_config DT no longer works?
> >
> > Yes, DT stops working because of the mismatch between
> > msm_pinctrl_soc_data.ngpio and gpio-ranges.
> >
>
> So what you're saying is that when Linus merged the .set_config patch
> yesterday he broke storage on every single Qualcomm device?

I took out that patch for now.

Maybe we can keep all the stuff in one series if it has strict
dependencies?

Yours,
Linus Walleij
