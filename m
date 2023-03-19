Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09C666C04F8
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Mar 2023 21:52:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbjCSUw0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Mar 2023 16:52:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbjCSUwY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Mar 2023 16:52:24 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DB915CAD
        for <linux-gpio@vger.kernel.org>; Sun, 19 Mar 2023 13:52:23 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id y5so10840691ybu.3
        for <linux-gpio@vger.kernel.org>; Sun, 19 Mar 2023 13:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679259142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eau3b7zPmqe7SmciaTScsBbHt1A+72uIepOJsfjNRg=;
        b=d9rPCtzOByh1+cJSI9d+76Q8bzYJmz1Ss1IdljLbzJW1S2zN1kEkjYm0FbFBc1UO2z
         4VKgH2omJwDFhFG3kHc7m+cN7CVCXDwLdJF1INgIXvceYTfbyGzn3NusESedXEphCaJi
         fYf1Eyb3H5GHmP/iTIyZTllbV3z56rO7Fq/eyPoWUWIq2Jk12zv2MKsCelc6vdAXl7Oh
         lGK7qmVJaa5htjrPA2WYArc6QRp5h5Wx2PlI8V/9WGd3jM9AM+LNs7cKR0Gq3brf/2kT
         8Ncw4tWtcVDLCihENNmB2PvhUwKZFgaB3KEpr1jqcaF/XRtFzyqzc0W8+99Qoyj4AFos
         3MnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679259142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eau3b7zPmqe7SmciaTScsBbHt1A+72uIepOJsfjNRg=;
        b=cDyqLXARU8dTUKgr0WXbMPuFWfnzj/L/W75JrWtzhQGkamm9cLxoFWU/ZEZXU7S2EA
         vMQq1F1Zh48cpjcyNPULofD8OgfKRc+gcN6kynrBKmILf7VUYcBR2RgRzLpIFHLpCA6Q
         is8PyE/2CiOsPIE66ptGvxl+XpilIMhaEXiEyFw1aavMrTJ6s5AyNf1zd+pi8maKQoHU
         j1qboJfl2hsHq4WEm/TyPcNXIUsxIdeNFYUp724A6vpKebTASHeeWgGKXQaSCosnjYlK
         FBO9zbYkWu6onjs3Gah2aDUnIeyYF0+09rGbp3G7iArV//qe6Etw7L7xFQ5SA3bTrLQm
         k1KA==
X-Gm-Message-State: AO0yUKUt0TvLvSSWYCZnfGv7QMm4+U8vgyLqKDYulCLfdM7xDVX+qu7l
        Du/71DwoowKeLuwcbmBzseBk3trqQimaAAqRuYhx2g==
X-Google-Smtp-Source: AK7set/tQ7OCelzEWdJsjsAkSRB+acENSH9SOXjaQ+EzOAXU2pgfkbMlHMfZQKUnyi4ylSBu7BTeUegXoKPqED2SmRY=
X-Received: by 2002:a05:6902:1025:b0:b3b:d433:b063 with SMTP id
 x5-20020a056902102500b00b3bd433b063mr2931680ybt.4.1679259142289; Sun, 19 Mar
 2023 13:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230311212114.108870-1-danila@jiaxyga.com>
In-Reply-To: <20230311212114.108870-1-danila@jiaxyga.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Mar 2023 21:52:11 +0100
Message-ID: <CACRpkdboobW7dQ=77=e+-EBEQAxQCkmVG_J49EaYcDFBUquS-w@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: qcom: Add support for SM7150
To:     Danila Tikhonov <danila@jiaxyga.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Mar 11, 2023 at 10:21=E2=80=AFPM Danila Tikhonov <danila@jiaxyga.co=
m> wrote:

> This series adds pinctrl support for Qualcomm SM7150 SoC.

I don't see any issues with it and the DT bindings are reviewed so
patches applied, unless Bjorn get upset they stay in.

Yours,
Linus Walleij
