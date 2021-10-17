Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A398430C50
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Oct 2021 23:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344655AbhJQVbB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Oct 2021 17:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238344AbhJQVbB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Oct 2021 17:31:01 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DBB9C061765
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 14:28:49 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id x192so27922440lff.12
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 14:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zsn8elQmbP8+6ym/PKq69oNfHdL0TG2v2qvjNwrDBuc=;
        b=yblJz/fK1RLPblHA1D9kNN0zjYE1gdrBtsTPrVzppwlUPZo9SY/JHaxGzAljQfyJSv
         /RDV723xJI00NZ7/8ldu521UIX1fDxfP8T4/AmZl3U6oCnsPHjZ5diPdaIzQHXDOcTq1
         5PLXBC/zQc5AxXndv+dKb24zbNUfBMt8z9lC2EulIYbkjwH/LIpffNwKHavGJ3TxJ6tz
         2JmSqgWrI3ItNehPnPgiO3HV+BRk27bWvCuxmjv4moLJ9Grh2ll7LBpkN69epI5la6ex
         Zl+8fFXHalYVC378Fxk/fIR1MRC7TB33xFoVcOJjzegK/dXTIByvxES0XF0Xw2OC4Rs7
         /Mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zsn8elQmbP8+6ym/PKq69oNfHdL0TG2v2qvjNwrDBuc=;
        b=GQ+/EcW5YgI8c9L2m9pFOhok6tISFlmhJrF5DOPvmkCTP9hXmLD8KB1unIjbk3rsIp
         uLEl/qNmttaPu5hH7G/e4UVlsoOcMePFjNtW7GcaS5/2/BsIQ5sidNjN8X89dqCzcqHi
         zzxk98dPUKGaHO9CZ/MQzTEuRnOv0y2GJQKNjyN/Cz7nW7+Spi2K2AHwywzEQyRfhAgo
         jKiPcOVfjg5KVOzL3YUnNvc4ztAVVhcOFLe5DUBXXwTKPVaS5/BC/JyYq0/cFw9Um0xx
         t1DcyQ0P3ebPfPLpQQRNl3Sh+8aDrOxuzYUsMx4fwuhRNoy4D89ZbWplLaw475wppv31
         /kBg==
X-Gm-Message-State: AOAM530bJ+kcjukNfawnytcsp7uJau7vDRKZiGc8LwqxBUo3bToEwHGk
        8N4FIqZ4EVw5m3uG1BN9kKMG+Qg/r36dI4f1YMXZEw==
X-Google-Smtp-Source: ABdhPJyoXcFF1M1DCOj78D7bnibnBm7cX88CCtFOS+e5aCqqB++ybZwuwO7B7J2XZ9MqFTlv1MsOOwLM6UtgSyEWRMc=
X-Received: by 2002:a05:6512:3d27:: with SMTP id d39mr11858873lfv.229.1634506127737;
 Sun, 17 Oct 2021 14:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org> <20211008012524.481877-3-dmitry.baryshkov@linaro.org>
In-Reply-To: <20211008012524.481877-3-dmitry.baryshkov@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 17 Oct 2021 23:28:36 +0200
Message-ID: <CACRpkdbPV6Ua8cVZksqux2A_ntKRP=OeDjU-u+3JxM++qFdWig@mail.gmail.com>
Subject: Re: [PATCH v3 02/25] dt-bindings: mfd: qcom-pm8xxx: add missing child nodes
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 8, 2021 at 3:25 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> Add gpio@[0-9a-f]+, mpps@[0-9a-f]+ and xoadc@[0-9a-f]+ as possible child
> nodes of qcom,pm8xxx, referencing existint schema files. Schema for
> other possible nodes does not exist yet.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
