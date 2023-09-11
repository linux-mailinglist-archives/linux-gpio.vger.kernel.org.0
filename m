Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2C6F79AEAE
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 01:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237171AbjIKU4C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235378AbjIKIau (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 04:30:50 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B901A2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 01:30:44 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-58dfe2d5b9aso57657357b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 01:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694421044; x=1695025844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zg32rEjDoEu1PGtZXp8/wlZ/iracuYWkm4l5HOAONA=;
        b=lyLDxFL1wVOZ7k/WPri6lhg/tsmjUDsAAfEEyaVfsOtt7U1Dgpn4awR0J1qgAiF7DR
         /o0kBZbohR/r6uf+EueBWiJmmsioRVrwBDJnEUo0Hi7VgQWdWeo+4M42xGMMGL1n+usR
         vxA72pL8pNbZdewu2CTj2nP7/A948nJBZj8h95nlNrW64bXDOYvPipSk5Dv9zcKWvvUG
         9kMmtNHzPnl+XLkJL8SAKhkAjLOa0DM58W5mGSk0J7kj0jyDQLIi0QSvWotURtrxUXLs
         tTbNouqxUuLW1uYeWWt5xsi2J8h4solAzigYCRyFeonpmmDnv8rQMnn87+RBYd7IChU0
         a0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694421044; x=1695025844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zg32rEjDoEu1PGtZXp8/wlZ/iracuYWkm4l5HOAONA=;
        b=YDgpFUmyqXcq0IcK40VfYpWR0j6tgFhsJ+mBE66ZSQwq9bXqkTyT+ncHZ0p9njLvM+
         J44EKDrAnmonyKX0yoKyr+Kb1aZhL12xapL51yxC0C1WCf1uv5uUXAMXr4ArM7gFNtHZ
         XXjMrFaxl+Bba4u69eJZVLSRz6s2VELCuSF3bMCC7vjdd0POwX1L1153AWU+RyIcT2zS
         d0K+bK48tjqIM3/IelH9WGYX8FtKCBpKMOX5yS91B+qJS0zIgREMtKXvM5CNJDQ2nrSX
         DinXv3EBHb2pFkpwyLF0PcQTKOksmkxXH9Iyg5GjRdm3GJk1WyoMMcb8Vo4b8IC5QhG+
         DrpA==
X-Gm-Message-State: AOJu0YzDx9uk8F5P67I9FeFPP6RCE/BwEj0wNPkGBku2YAuu+zeYghsR
        sJrNPpvkQ6it+dRPL4E2xOKZUeBE4fIcUiWrUTLjdg==
X-Google-Smtp-Source: AGHT+IEsImXmgKAD+TfIJklngPhS36fxrDS3Xx+JJKqoNkLnTxt1qEzhUft5sCOswiucbrguccWzTWb5PXFTld19dXA=
X-Received: by 2002:a81:4ed1:0:b0:58c:5598:be97 with SMTP id
 c200-20020a814ed1000000b0058c5598be97mr10510731ywb.15.1694421044046; Mon, 11
 Sep 2023 01:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230907145230.44085-1-brgl@bgdev.pl>
In-Reply-To: <20230907145230.44085-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Sep 2023 10:30:33 +0200
Message-ID: <CACRpkdYU5=jJ+hi3gKMT4GJe6_kAH8gw02Qt+kf-Lz7eu93Bmw@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: mockup: fix kerneldoc
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Thu, Sep 7, 2023 at 4:52=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The pull field of the line state struct is undocumented. Fix it.
>
> Fixes: 2a9e27408e12 ("gpio: mockup: rework debugfs interface")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

For the whole series.

Yours,
Linus Walleij
