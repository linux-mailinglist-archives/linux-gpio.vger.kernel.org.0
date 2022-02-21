Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4874BDD83
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Feb 2022 18:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349670AbiBUPmX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Feb 2022 10:42:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233371AbiBUPmW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Feb 2022 10:42:22 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D2A1205C1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 07:41:59 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id d10so34268728eje.10
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 07:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s58ZsTLNOT0Dd0mKE0sFiswMZMFhAJe13K4woKQqIGw=;
        b=GXVgVFxTpsOoQblnLn9vxlmT7vx1PulOSKfGJ8iKVh15nSFG8vksburGWaqS4+2NqL
         K4dMrTYdWV/qovQweON4/DKu8oTzKhN7JqNDH817dn9a6/JnoApx93TspgmKtNHQDqUG
         WJwbBT/j+ZDJ+hsvGKn5uFVgOpqZG/Doa6MlU0RkU6DNww1T3IMyMGYkXOEhmCkU9CNU
         Z4Q+ETfa+hCK050EdTTKtUrSO11HXwkunTitOJtDZd/1ydOW1FniNP44mEEajUKkkbRP
         NpTEdLGSUXUR80RKsHSaRZrRCMti1SYn9pCrttPjbisiG+I3QZx1ueIdS8JpBj7V3GU+
         KNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s58ZsTLNOT0Dd0mKE0sFiswMZMFhAJe13K4woKQqIGw=;
        b=0iYj6WMU29feP96CWfjzJNYyJldSNNqMZfKubjwbWY9uCCqQ2PNj6OOqt045m7FIUY
         cHuUHbfRy5dzX4zI3HUu8WMVKIoG7hquanuTZiH3tYxtBCpJacaiOCrWlRhgw3AEDF+0
         ZXPk9dMgL7qcWxP24RT2NBe9oDmiZsKRwjajZKFxL+T8BR8bzqnfq7/KunlEYk+N214w
         ivmkMkqOCXlGdUaGBlSFDEct/dohFijJHronpynZ2qCfDcThn/C+QZHdEtYZBZwNq+bi
         AnRmpRlSyBEB4F0NRynT5eGkKZNdaL2gfPcbObqoltsHtqf5Ohmj3aN4PwkLxIq9XWHk
         P/ZQ==
X-Gm-Message-State: AOAM532GBM7ZQjY59Bu/o4hcNcGMZR5fj9vT/U2XL1LvZjUr3Y7fLY+i
        RuMjqaR798IEgzwa7My/YV2BkD0X3UYg7oYdALVCTg==
X-Google-Smtp-Source: ABdhPJzTfySJNjd94IGN3YIRIOowow9fr0rj61tnKVrMiuWdkKH9XRa34A5LQXyioSrD0jJNbBiOi9n8lPwIpD1DqWk=
X-Received: by 2002:a17:906:8606:b0:6d1:5031:86da with SMTP id
 o6-20020a170906860600b006d1503186damr5468631ejx.734.1645458118005; Mon, 21
 Feb 2022 07:41:58 -0800 (PST)
MIME-Version: 1.0
References: <20220221154002.654638-1-brgl@bgdev.pl>
In-Reply-To: <20220221154002.654638-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 21 Feb 2022 16:41:47 +0100
Message-ID: <CAMRc=MehaWcwBBAc7XAbM1CdybaXMz66s936+d2+PuOt6GzH+g@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 0/2] libgpiod v2: rewrite tests for the C library
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 21, 2022 at 4:40 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> This series contains a rework of the line_config interface and a bit patch
> that replaces the old test suite for libgpiod v1 based on gpio-mockup with
> a one covering around 95% of the libgpiod v2 code based on the upcoming
> gpio-sim module.
>
> v1 -> v2:
> - drop applied patches
> - improve documentation
> - skip offsets that are overridden in line_config but not actually requested
>
> Bartosz Golaszewski (2):
>   line-config: expose the override logic to users
>   tests: rewrite core C tests using libgpiosim
>

Sorry for the noise, messed up the patch version here.

Bart
