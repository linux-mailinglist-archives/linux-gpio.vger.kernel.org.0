Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57562442F27
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 14:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbhKBNlZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 09:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbhKBNlY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 09:41:24 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCC4C0613F5
        for <linux-gpio@vger.kernel.org>; Tue,  2 Nov 2021 06:38:50 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id y73so305001iof.4
        for <linux-gpio@vger.kernel.org>; Tue, 02 Nov 2021 06:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NPmlFnsZtjOhlgu33qBtxP1UZOWSahyMoeO4vIQ/8Z0=;
        b=OVSrn46sf3M7ODJBsJzugoe0wCPuQeHMutpWsElQHERc7suWX1ETX3idIWCLex1Tlt
         UTq1fIJzkXsD1zhbzmcRcYq1D9k7lXVYOfUWaunuw6gA1J77xqRRhY/hC12Kg4OTsGp4
         wyZTjNHJDa2TubIWyoB5lBvoPN4gh+8fHdr2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NPmlFnsZtjOhlgu33qBtxP1UZOWSahyMoeO4vIQ/8Z0=;
        b=C+n/Q3Yy8c/tcOvlyXeXj9RJl2mgtqrw2vjra2T6IkcTKt4FEwLcqilcGO+VxyHN1C
         1/RuSFLIEzIg8MhHeklJ3JPW4N/gfYNPpMQYSBwBK7P8t06P4/SJKNk5CNsXVO1PLFfC
         nwOO7jj/LqmTk0mLCdMiiJu1S3tCdFQjMWDWtvcZ6fREg0/j5om7Z5WpJDnGHuqexu3i
         7Fpo+EbQEBeFbQ6I+xkzXG/JaTWbl9UvIxb5CuLtwEVGl2FBfi8C+vWOHCeeTX7UD8Lm
         y7c3Cyt+EIuJljj0Yr9pTiYVCgeKwsuD0pgH//y6wFXLW7/lXrq790hTizYAV1/6lfrc
         cwZA==
X-Gm-Message-State: AOAM5332XReZ+onmws2O+phgE4tA4vv/MxALBrqt7XQE8uPTZWSqBxPt
        tmmYKcCkEHCv0C/agAkEnmjzTz/0jVETsg==
X-Google-Smtp-Source: ABdhPJydBirM01kBEdLVkmLJ74CR3szQ+BG8Dkgg9gukUDe1o8TOHZbo9oz6ncalUwpHmutG7XHDfA==
X-Received: by 2002:a05:6638:2727:: with SMTP id m39mr27934226jav.125.1635860329206;
        Tue, 02 Nov 2021 06:38:49 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id u4sm9909073ilv.39.2021.11.02.06.38.48
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 06:38:48 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id i9so410598ilu.8
        for <linux-gpio@vger.kernel.org>; Tue, 02 Nov 2021 06:38:48 -0700 (PDT)
X-Received: by 2002:a05:6e02:18ce:: with SMTP id s14mr13331028ilu.142.1635860328172;
 Tue, 02 Nov 2021 06:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211102034115.1946036-1-bjorn.andersson@linaro.org>
In-Reply-To: <20211102034115.1946036-1-bjorn.andersson@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 2 Nov 2021 06:38:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VWN36A=O1V+2jfWM5jLShvZfVOCGnt_MSSGct=kFtoOw@mail.gmail.com>
Message-ID: <CAD=FV=VWN36A=O1V+2jfWM5jLShvZfVOCGnt_MSSGct=kFtoOw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sdm845: Enable dual edge errata
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Mon, Nov 1, 2021 at 8:41 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> It has been observed that dual edge triggered wakeirq GPIOs on SDM845
> doesn't trigger interrupts on the falling edge.
>
> Enabling wakeirq_dual_edge_errata for SDM845 indicates that the PDC in
> SDM845 suffers from the same problem described, and worked around, by
> Doug in 'c3c0c2e18d94 ("pinctrl: qcom: Handle broken/missing PDC dual
> edge IRQs on sc7180")', so enable the workaround for SDM845 as well.
>
> The specific problem seen without this is that gpio-keys does not detect
> the falling edge of the LID gpio on the Lenovo Yoga C630 and as such
> consistently reports the LID as closed.
>
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-sdm845.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
