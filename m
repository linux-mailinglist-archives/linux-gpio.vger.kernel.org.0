Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3904743BDE
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 14:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbjF3M3E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 08:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbjF3M3D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 08:29:03 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498C91FFD
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 05:29:02 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-791b8525b59so711716241.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 05:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688128141; x=1690720141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11VfTjuiAWvI/13NheITRmlvosRPllQPpLXJyknz9Tg=;
        b=LMvzYBVHg5Hm69OsfGXJNiQCvtNhFPOGgJYZbt69gvd+csIKdhGpCnr0qoiWHhqI4n
         JjlXFp/LOgkfPOA1hU27wTb7d3fjFTRes8O0ptYneha043xWz2FGaktEJcCTtkY7t77B
         +WE1u4PtHipyrkRMRZRw7gWI14nthMVsYptHzTx5ofUGv5B8NZQdxMM+jSb5M3Agzy0q
         ahncti18mOIkiKKljFJJ0HWJiZvYRxkxKvfkbSxK2hhsDkJFyOjj0gRMt76hYPtxC7Ve
         IYx05oPlmYPXA2kWHGmvrNXHj62avPBJjTE3rPMlnF3vZChRraqeNtVD/76OVVd9bwvd
         wkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688128141; x=1690720141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11VfTjuiAWvI/13NheITRmlvosRPllQPpLXJyknz9Tg=;
        b=XmJJyegDRWSkVVOmH240ff/LBObTiQfPPz/y0E1mCNYzAIHiEnJs6ZpCgfntH9qchb
         zhO4jiQe5BJC7HMMC8nXwBB6GZWygx/Tl4FqslvLd/blWpZsO6BjYgCZfOYMKNZ+OkXB
         deJvZLy0CIOJ6b5BrnUjbI2fnRFSYY0Dejq1xnjLNJos4j0zWebPC42KRgbSFp6ggvDZ
         YbPsH3hZ7R/VnlYI438Zx+iwzCvU8xhfJgUKM+6mpwaPOK/wCDxvjofg4MIqRonNTx+p
         P6XlRGi9bUpdjXkUzrvG5ZZMapD8pSvQpWw4XGe+2dqFgzrQZVQ00kqZptQLPv56IqM3
         TxDg==
X-Gm-Message-State: ABy/qLa/Q1HTjw86NHnskBcBQPXBGG1gg/ZQ+66BmnYxoS9AkeTvQs3d
        Rm9eCVlNRRvj3h1T3I7VvBtGLVM3LKSl3zDDWhdhoA==
X-Google-Smtp-Source: APBJJlGUGKdfHIgETwXbQ/9fYjY+gmX2G4ZBVeT186/2AV/nPK71gmFtIu9UZBIdY9ORNwm94FMv8ciZa9HF+AhKrmI=
X-Received: by 2002:a67:ea88:0:b0:443:8f10:7f72 with SMTP id
 f8-20020a67ea88000000b004438f107f72mr1778335vso.14.1688128141366; Fri, 30 Jun
 2023 05:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230630122758.117871-1-brgl@bgdev.pl>
In-Reply-To: <20230630122758.117871-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 30 Jun 2023 14:28:50 +0200
Message-ID: <CAMRc=McsLPeD+pD++eN1fVh3=BOtr9ZpaLdOrAdVXuKH2kiKJw@mail.gmail.com>
Subject: Re: [PATCH] build: remove redundant SOURCES assignments
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 30, 2023 at 2:28=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> For any given target (let's say foobar), automake defaults to looking for
> foobar.c if foobar_SOURCES are not specified. Remove redundant assignment=
s
> as we've seen multiple hidden typos in makefiles already.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Sorry for the noise, sent it without the libgpiod tag.

Bart
