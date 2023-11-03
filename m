Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F38C77E0977
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Nov 2023 20:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbjKCTaA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Nov 2023 15:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbjKCTaA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Nov 2023 15:30:00 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4EAD62
        for <linux-gpio@vger.kernel.org>; Fri,  3 Nov 2023 12:29:57 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-49d8dd34f7bso1020882e0c.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 Nov 2023 12:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1699039796; x=1699644596; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1/W7vV9eG4o8tV9uW+EQCaonwN69FbvU4OREBbTYm2M=;
        b=cZldmB73qCpVmpA0JxlPA8oTMfsPvv8peiP7Rb80MGDy6ly4qy3gIwTotoyZa5hhUK
         6mxX2gT9Bq12Xx9iTWDeW39dg8su5wR+83anHVZeYFtkABmHn28UKD3SJim1WbrGqLDp
         uoMET3FHOubp+50B70fC2NKUl/d9cnkiV6QDUkxltpxoe2Rvu2WLKoZ3pAe0CHV4QjzD
         rW4/UxBpriW4lZu1ex72Ax1mZhpUPIuOSU5vzRA2uVWNkrztrOTOpLLPM+nPmCF6PXEB
         R4I2npCgvZe5CAwzDmIsDFm2/W5uk72dW2WZtU3fW04eV4S2xqETD0XfYhQaHfnxSAbA
         Jbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699039796; x=1699644596;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1/W7vV9eG4o8tV9uW+EQCaonwN69FbvU4OREBbTYm2M=;
        b=KrjkecRN1W6lD+9N5McCsAIW7K0nF9KDFb2z4JcIn3x4hCd0HOf964J4LoQ0oZpr2v
         Hptb3DPbNbfFYKRi640Xucv6YIusWT+GC/iZ3qy/sAMaGaHVMaZHCOWceFrSI60Kg8ca
         xJhBl93I+NyNZ/75VFSC9e4E4Tl6Nz+QDM70SZ0TA94OOJ9UyhITk6OlYiTVgmUt+LhG
         /NvaeM7JrZtvwD3Fyi4Y8k7Yq+b03VyvZZCuw1k6DORjKzQZ5mxktVmSgCHDTTbzWnLi
         HMp44/RGd7yFFtYdfzQHs4puoqOA8MUeN5Zyp+k3JpMbo2lBDqpHpMTmvEmvor33Ehyl
         0QLQ==
X-Gm-Message-State: AOJu0Yw2qroSvo03qrwp4eQHJ89oYwi7eH/s+n26WBO1D3U0c6ZyUL2P
        ORwGJvyDS3eP61+5teeTdfIIoprqv0jMexBypO+opA/MgQRgmg6lFw0=
X-Google-Smtp-Source: AGHT+IE++Jb+edFYAZI9hk2G6jy0ITPgmEbvrfAp112xhHl+KW4gEA/b8SqJQY+hkPKu1lZ7sSKfjc1PUGC+SQAcFZc=
X-Received: by 2002:a05:6102:5486:b0:45b:c7e1:426c with SMTP id
 bk6-20020a056102548600b0045bc7e1426cmr15982642vsb.14.1699039796019; Fri, 03
 Nov 2023 12:29:56 -0700 (PDT)
MIME-Version: 1.0
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 3 Nov 2023 20:29:45 +0100
Message-ID: <CAMRc=MemF-cr6R1i9z7FL2jpoQ3SWbhtXT_=35bLVAEs1oY_0g@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v2.1 released
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Phil Howard <phil@gadgetoid.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I've released libgpiod v2.1. This is a minor release with a few new
features but mostly it serves to facilitate the new way of preparing
pypi release tarballs (thanks to Phil for his contributions on that).

Details can be found in NEWS and the tarball and git tag in their
usual places[1][2].

Bart

[1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
[2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
