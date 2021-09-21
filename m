Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66DE74136C1
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 17:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231690AbhIUP5x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 11:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234190AbhIUP5w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Sep 2021 11:57:52 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E638EC061574
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 08:56:23 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id i4so83876565lfv.4
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 08:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3dRRvOoGnmIrwwlsxrjhXDNUq+Kqf2aFZjcm4Fpvb7k=;
        b=XjT8euJ1tczso29kfHXmNCJHZRMAS1oX71/URiU3zEEb64+9uDWgmIwauvqNThaKd2
         LY6KbMerapB+rxaOPqzMXMMoo13WjSu99La0jzgxrbYC3oRmbVXsvwOc2eDBkPiST4AE
         Vx9Y2HZ3utTbU1zwoIfIwYQ+f72e96CJ5i+98x8/LpRPLGQrfmZd5Vg/WlsDPIFtkbA9
         8kAuY8odwAUT+MFeuVlE9RbB11tnFs90USfJY66NmOhc7dplcF6vSuI2yrSdO9+9lu+L
         9I6tocdkqJ7EcfnoXSqvvJfk2mQ/2gDyYNoFBYC30GH0lx/hspNQtok0n2XFWFxX4J1d
         IWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3dRRvOoGnmIrwwlsxrjhXDNUq+Kqf2aFZjcm4Fpvb7k=;
        b=Ps7G4sj3wZw6BvX4yix2HsdPgRjgONzz5d4ygR/FrVth2tbwZgilW0kcXwStLeVkjH
         DaDyH1wlUM6dTpmK00RjwNcwxGTtSGLZ6i6x3frNNic8QKFuwoZPxSMUzwxt+EVgTR7A
         oTVshbby8V6YQvL2za3LKDtyYcCscSxVQ2keqFx79wYJJZhwlQ6mM3mG9l66tBggPwWK
         rF/YYjdN9uQKsxio0cncwwXVjnul+DKgxqAq1mgcvAFFvDdZXb2cYyLed+rszC3lXN3+
         ycZykKVAzPvTUlulwZwyMmYtocZoAZAj2VHKzve9FS+UMAsYenMOjNuXC49XtJ4mUvyZ
         1goQ==
X-Gm-Message-State: AOAM532QYZtwlUFNsV5IOQTY0CCA/smYEhw+cm7fsqQjcKauLycLYrmN
        KJ9RifkbTgRmbwUP425XZUYgM0mPme3OgenU8dq2OA==
X-Google-Smtp-Source: ABdhPJwFv538xdJK2HBZc2Lz0Yc451rwEukRVrSDiTltXNyPlcvQxBCy+cpnqY1P/Xjdy+Z5BZBlkAZXIBjSs9HGGEU=
X-Received: by 2002:a05:6512:10cb:: with SMTP id k11mr13874613lfg.72.1632239775245;
 Tue, 21 Sep 2021 08:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <1631860648-31774-1-git-send-email-rnayak@codeaurora.org>
 <YUfZbsf3MX1aQJ2+@builder.lan> <d2f28d34-99b3-30f8-8504-bc819946876f@codeaurora.org>
In-Reply-To: <d2f28d34-99b3-30f8-8504-bc819946876f@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 21 Sep 2021 17:56:04 +0200
Message-ID: <CACRpkdaJm_UbJu=kXGOFs76MiAiTkqToEpOnf1Pk-by4FsCcgQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Add egpio feature support
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 21, 2021 at 12:39 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
> On 9/20/2021 6:14 AM, Bjorn Andersson wrote:

> > It seems reasonable that this would be another pinmux state for these
> > pins, rather than just flipping them all in one or the other direction.
>
> hmm, I don't understand. This is not a pinmux state, its a switch to decide
> the ownership.
> These egpio pins have regulator mux functions, some for apps, some for the
> island processor, they might not always be used as gpios.

The pinmux API is for muliplexing a pin between owners, and that
is what is going on is it not?

If the bit(s) select different processors that is changing the owner
and creating a usage matrix, e.g.

TLMM_GPIO
ISLAND_GPIO
TLMM_I2C
ISLAND_I2C
etc etc

They become different muxing states nevertheless. How to encode them,
such as (a) bitfields in the enums, (b) more cells in the device tree or
(c) ... that is another question.

Shoehorning it into pinconf is not the answer IMO.

Yours,
Linus Walleij
