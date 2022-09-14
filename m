Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B28B15B8875
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Sep 2022 14:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbiINMnz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Sep 2022 08:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbiINMny (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 08:43:54 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0043760D1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 05:43:52 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id l14so34430692eja.7
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 05:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=mgqw+6JpGXn2oifvzQVlVRMAL4x59CkZWm4PptgSgFk=;
        b=fVa4Ty+UkhM6eyVyz8m/FQl2wVTe94vkm2UAuMPeXqk2kvhGbi9GAU5q1ShPveFCZn
         Y++NRtsmc1f20iIFZZ1jtBAelomaavMORZ7kl661S2hDY2Ki22yd99XeiNU+hMQEsF26
         Ln9uS5aUrilbxCuv/oLwSqf+opxYiQfSkZeRaEXrwweq2TKKtGVw/Un182e4nemq5kcT
         JfpA0jPVg4RpMTyOE8AkuSHuTq2DQBydLaI2Q53HH4lNJi0bpVd7pyNI/kngC85VjiX+
         LB/1ka96RTB0//P+kPGd6+Rdu545gO1GB7WkbahmegUAs2GwUFLC0z7j2NXsp88vjzhl
         wb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=mgqw+6JpGXn2oifvzQVlVRMAL4x59CkZWm4PptgSgFk=;
        b=AIMTafxCHoxhwiBGc6fJV+e6B9oYUhb9NuyRI+9O/zhNpgmGSLoIJnD93SWnR4dv02
         OM/k8XqJohBJlCKK6nnKqvXcqrModNzvPJaQjN/FXxH5jWpQ0AAdNMCgEVW02+3sOhwt
         PqUKZvmDXDGqcdWKXOqFxiAb3Z4doz2lHCUVb8T+S0xBGx3GUYKNGHas5rdG6ZNiOP3a
         9mgP9cffcBk2DzBoN3uzamC5OKReTBXs17Hcvny4eYitHgWPyzYVwTCF0YJEQ3UxRO3Q
         i9uPmamdzAhPkBNEg51mxac4m6XtEfLWaR4AfKAHouZfWsHj1wWMhWgHILU/00H+Gyrd
         QZvw==
X-Gm-Message-State: ACgBeo1ZLcRuYs8xwSzsMncud4QlFQCjSSt0W8oDYYV+wik7O5CmuxFJ
        wxmaKr0bFlUWIM8A8kHcsfOA5BjRTxFzWrvw9tOdQA==
X-Google-Smtp-Source: AA6agR4aGz/CzCXBPA1eEHSbXj6QZOoC4n4RqZ/g4zieZlX6n+p/yT1Ft7+SAvQM3qQZZ8R1YS123Kdmx+ty0nhB+mQ=
X-Received: by 2002:a17:907:a0c6:b0:77d:7ad3:d05f with SMTP id
 hw6-20020a170907a0c600b0077d7ad3d05fmr10320261ejc.734.1663159431415; Wed, 14
 Sep 2022 05:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220913155348.38716-1-martyn.welch@collabora.co.uk> <20220913155348.38716-2-martyn.welch@collabora.co.uk>
In-Reply-To: <20220913155348.38716-2-martyn.welch@collabora.co.uk>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 14 Sep 2022 14:43:40 +0200
Message-ID: <CAMRc=MdSsLfQDGHD0w5GwvYQMZWteY_vwbLB6Y=urVpzNhQJGA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: gpio: pca95xx: add entry for pcal6534
 and PI4IOE5V6534Q
To:     Martyn Welch <martyn.welch@collabora.co.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martyn Welch <martyn.welch@collabora.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 13, 2022 at 5:54 PM Martyn Welch
<martyn.welch@collabora.co.uk> wrote:
>
> From: Martyn Welch <martyn.welch@collabora.com>
>
> The NXP PCAL6534 is a 34-bit I2C I/O expander similar to the PCAL6524. The
> Diodes PI4IOE5V6534Q is a functionally identical chip provided by Diodes
> Inc.
>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>

Can you rebase this on top of my for-next branch[1]? We've had some
new models added and the patch no longer applies.

Bart

[1] git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
