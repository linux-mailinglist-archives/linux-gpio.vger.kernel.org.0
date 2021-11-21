Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D58D458727
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 00:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbhKUXcK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 18:32:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbhKUXcK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Nov 2021 18:32:10 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC70BC061714
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 15:29:04 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso26185481ots.6
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 15:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uawdrL9VOMlIqlvJ0mj5tyfriQh05XU0vtoIzgfnGzw=;
        b=B3a6gp5YyLEyWRk2RBPz4+9gEODV95HoQcpiVwp6PIKpBPC/dm0wRZAqBydbs0IUtU
         Vy4ud2krF6fE1+/NDYoGjMeVbCEMVPFMS+lZe1tnZf0G6ZKVcJIa2NbD5l2qCkWjzXrG
         MFX5m/l9RoOdGEyiASjFLLyM/tAHysbmS8VsgJrTxpRGkFWKfAWx3kVd0zVZ2aL+i9gm
         2gc4cjD8y8eO23vdCs0mblQp9p7KaUMIeFNFCJkY5zP8judtj+sYkv+8cJf+ewNbkyCH
         IYH2El+UGJ8h219SYHJMdsFyBAtcglqPkMJ1pOQ4Vv5tfkq93ysVx+7V4S6x5f65eWAo
         XjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uawdrL9VOMlIqlvJ0mj5tyfriQh05XU0vtoIzgfnGzw=;
        b=P375kCt8ohDjLWOrY0dJ+aoNU1B1A3KAloyVQzh3OsHcKUgGK63AASPxWebfpDwdyD
         xfCJ43rbxFYyNjQwVPIUOlHP574ShoBx4Ib/xlKEqhBpRRGab5EcInEfWlXi1J7dpGTF
         5l6Um6yQHAXDPdOm0k3QhThNxlPKykEhprTM7Ho6l9/4QzPye1pOkf64AS3UDu7fkYAf
         lhL8W/XUUr7lE9pQyi4g1GshBWI+rozisHpF29n6L/h2vsL9S3wc3PktcGuQ3xidmlBo
         36dKVNUxdi63lSfvb8mdkRq6eeU87G2vkD3P37zo5LIN15+8ysbi/RI3Q1x0j+AUopBr
         0wRA==
X-Gm-Message-State: AOAM533AK9H8KrWZaFn7NRknpSVAVi2d6V8HWkdF3eLJD0gRopG5vp4v
        qKr1KyKSa9v9PZLKBABQ5aHKcajZszKo/wTZ0TX7TA==
X-Google-Smtp-Source: ABdhPJzaxxQYv3+ed3jVIfR+ikdBi3My7RqP2nQArMaBHdQPUz2wbnV0Ic/1oih14zYbo/y3Ko52yHuTC+/gee84Dm8=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr21445284otg.179.1637537344362;
 Sun, 21 Nov 2021 15:29:04 -0800 (PST)
MIME-Version: 1.0
References: <1637041084-3299-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1637041084-3299-1-git-send-email-rnayak@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Nov 2021 00:28:53 +0100
Message-ID: <CACRpkdY8Vw-UGGmFEGzXYd_tVf7Sv252UPrBhd_jmrmW0T7uWg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] pinctrl: qcom: Add egpio feature support
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, psodagud@codeaurora.org,
        dianders@chromium.org, swboyd@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 16, 2021 at 6:38 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:

> From: Prasad Sodagudi <psodagud@codeaurora.org>
>
> egpio is a scheme which allows special power Island Domain IOs
> (LPASS,SSC) to be reused as regular chip GPIOs by muxing regular
> TLMM functions with Island Domain functions.
> With this scheme, an IO can be controlled both by the cpu running
> linux and the Island processor. This provides great flexibility to
> re-purpose the Island IOs for regular TLMM usecases.
>
> 2 new bits are added to ctl_reg, egpio_present is a read only bit
> which shows if egpio feature is available or not on a given gpio.
> egpio_enable is the read/write bit and only effective if egpio_present
> is 1. Once its set, the Island IO is controlled from Chip TLMM.
> egpio_enable when set to 0 means the GPIO is used as Island Domain IO.
>
> To support this we add a new function 'egpio' which can be used to
> set the egpio_enable to 0, for any other TLMM controlled functions
> we set the egpio_enable to 1.
>
> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

This patch 1/2 does not have Bjorn's ACK but since he acked
patch 2 I just applied both anyway, Bjorn if you don't like this
just tell me and I pull them out again.

Yours,
Linus Walleij
