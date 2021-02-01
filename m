Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBA3F30A493
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 10:45:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232771AbhBAJpg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 04:45:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhBAJpg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Feb 2021 04:45:36 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9AF2C061574
        for <linux-gpio@vger.kernel.org>; Mon,  1 Feb 2021 01:44:55 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id s3so4354049edi.7
        for <linux-gpio@vger.kernel.org>; Mon, 01 Feb 2021 01:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x5sHWC9y/Hj/k3MjCweTDVJloPdNZBgsHShhsKDRTSM=;
        b=R8ksIxKy5SfvjU41UH/PxeyxXtcr4TiVkAZxtCsyaU7KuPxitA78UfQHfgMzb+qX9q
         pL1vHh7wOuipUUTmogr53O3lMNtd60IXHOqLfumDJ5qmME5MV3F2fOCOncE1Q1oa/qDz
         FEyAVRvi+fuvfoj2B7XcD/bBcKfSaLjLeuq1D5eNkh2k1+jjjAWiqQhd7wtaqQOHoexh
         RGpCL2k7dhyYYENh8p9Zmv5wW3fOpqNNBKEwRSlJsCX704YkbwsrGNkOFYsIkF25zK6Q
         A6H0jOZq3ikXZSr35HZnOqqu7QoHbJijhp9NjN1DZU3RolZHOY8Agt7FhOjVoO+ifzNO
         yTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x5sHWC9y/Hj/k3MjCweTDVJloPdNZBgsHShhsKDRTSM=;
        b=TkC410M3KHllxT2lp27vjWVKHpBjZPqTmraOe812Le6FXu9HIw2K817rW/74LssVtK
         gXUF/w3TIQ26U/aHPQOzR/g/6sqx+WodOsIQjK5zmEXY9r7u61lYOh+2J4kp4l0O9g0A
         Oty5o0LNP7YwdHUmh19CS6SYRxW7QOcicaFxAo/ibgbZVJYRoUXnIO+3PrIffj9DO5mD
         m49B/o0LVvsJHrxKoZzPsZJk1EXaFVuskQ3gcZZrgNKsM5UfBDiSJ18RWqCEm6i1787Y
         +HNnI9wNc0n/yxHttT8lK1r3rxNhhZHWfEpk06+cx631Cc8hssDopd947rCvgI49a4lD
         Xt1A==
X-Gm-Message-State: AOAM531SMvSU5aBm3S9JPXd7fhQLy8IFA+CGGys9y9+XZkAfDF2GAqdM
        KXXXmrIerD11C/gqEx4JiFDbY0featYSmaSJzvqTqA==
X-Google-Smtp-Source: ABdhPJxS2V+wmAKY/bIXVLBw6Tmt56CjvJHtjUWVkFY0SZrhceTrae2S21BcutZkTmqoTuqaccPqzSNqjCC+JSy0oLk=
X-Received: by 2002:a05:6402:3508:: with SMTP id b8mr17994271edd.341.1612172694552;
 Mon, 01 Feb 2021 01:44:54 -0800 (PST)
MIME-Version: 1.0
References: <20210127000303.436595-1-drew@beagleboard.org>
In-Reply-To: <20210127000303.436595-1-drew@beagleboard.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 1 Feb 2021 10:44:43 +0100
Message-ID: <CAMpxmJUqAMKHsc6_HRhps6KgmcqDtQK=fDKiyAEaNMbZMM1CBg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: am335x-pocketbeagle: unique gpio-line-names
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Benoit Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 27, 2021 at 1:04 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> Based on linux-gpio discussion [1], it is best practice to make the
> gpio-line-names unique. Generic names like "[ethernet]" are replaced
> with the name of the unique signal on the AM3358 SoC ball corresponding
> to the gpio line. "[NC]" is also renamed to the standard "NC" name to
> represent "not connected".
>
> [1] https://lore.kernel.org/linux-gpio/20201216195357.GA2583366@x1/
>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
