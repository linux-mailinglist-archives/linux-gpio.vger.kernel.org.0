Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A44057CC036
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 12:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343644AbjJQKJK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 06:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343600AbjJQKJJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 06:09:09 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84BF78E
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 03:09:07 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-49d8fbd307fso2171269e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 03:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697537346; x=1698142146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJogVkchV3eYxGkzUKd5QI8mxG2ZZBYeTqGXBQ9+Arg=;
        b=qn4k3lzu5rQ7Skx2mvVf8LhSN40c5dfFCc3HMV+8joReTxV+hkBev6WvCir/vhL1R0
         0BPuRa/IjwCktqHcapEqd8anfUcRcO6zkTTEzkOYQH2kZQquxFuZryI5p741i1NV5p88
         KaOyeQL1EvrSacO2EiD1uAgbgd1XEVE7+H8nc+AJ7SmceQrcVES4N5f0Kai96G5oaUQq
         DuYYaJMMCvcSUFvdvosr2r6jtb0eUfZtEE9Xi9DLyIgIFC2Fvk6oHZAHWmulWvazMbo/
         nYXdbg2w8kj+6HNG7fVmsga7e5k6g2QSDg1pxw1zY9tM8DWexJ+uAZ6pvBnX6PgNJmZL
         DAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697537346; x=1698142146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJogVkchV3eYxGkzUKd5QI8mxG2ZZBYeTqGXBQ9+Arg=;
        b=GpShNKcKBDWwZAQtEy2kJp/WhcyA73W+QvK2jIHAGP0H/YKE3PC5J86UdEIywBj2Hg
         BrT1Auf8MN3wmlZCBHuT1B16iQ/ZyV+BTsXI77Ie80jpVGJ3GjPhZc5JWAJmlpwv0q7L
         GlDGYicRsViPRTjH6J8qABnFwOpyJjV7CSUMYOs7+edoS6wnBTY4b+2mlZklXWBvtntw
         mPkWW5EF4erLKmXIbyAKY0XeMtk51L5q+OfDwsEDm+sC+EAtVbroi1t9b4hajlwHKKVX
         S2Ci1rbD2AGqBxYzIv7LVZpOCdl90EP/GMux83CfVReEyNx/C+HRe46R/D8Rte9NT3zv
         YlYQ==
X-Gm-Message-State: AOJu0YzsKSHVOlh3U3sGNxwTB/u5HBarnB4UDEX4tyH5EYe0vmJXzjcB
        5f59VZAvwdgkxjJNC1P4CXVqgn549wmQbaLbJwQ6Lw==
X-Google-Smtp-Source: AGHT+IFcwTrj7968kiGkpeVnVoBTn9w9xqUmyquZxH3fvRuga0WWzKzt3fWvkSPkrfBG83Vb7iunXS+Fh0fG575NNgM=
X-Received: by 2002:a05:6122:2223:b0:49d:eeed:3ed5 with SMTP id
 bb35-20020a056122222300b0049deeed3ed5mr1986458vkb.14.1697537346626; Tue, 17
 Oct 2023 03:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231016151848.168209-1-phil@gadgetoid.com> <20231016151848.168209-2-phil@gadgetoid.com>
In-Reply-To: <20231016151848.168209-2-phil@gadgetoid.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 17 Oct 2023 12:08:55 +0200
Message-ID: <CAMRc=Mfwx5-sa231TP_di20uMUysfwUGXL-EN5mDALkqRj4AQQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v4 1/1] bindings: python: optionally include
 module in sdist
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 16, 2023 at 5:18=E2=80=AFPM Phil Howard <phil@gadgetoid.com> wr=
ote:
>
> Optionally vendor libgpiod source into sdist so that the
> Python module can be built from source, even with a missing
> or mismatched system libgpiod.
>
> Add optional environment variable "LINK_SYSTEM_LIBGPIOD=3D1"
> so that the sdist package can optionally be built and
> linked against a compatible system libgpiod.
>
> eg: LINK_SYSTEM_LIBGPIOD=3D1 pip install libgpiod
>
> Update build to add an additional sdist target for upload
> to pypi. Call setup.py with "GPIOD_VERSION_STR" set, which
> triggers a vendored package build. "GPIOD_VERSION_STR" is
> saved to "gpiod-version-str.txt" and included in the sdist
> for standalone builds.
>
> "GPIOD_VERSION_STR" must be specified in order to produce
> a standalone buildable sdist package, this requirement
> implicitly preserves the old build behaviour.
>
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---

Alright, this looks and works well. Before I merge it: the package
still shows up in 'pip freeze' as libgpiod. Now that we control the
name 'gpiod' on pypi, should we change it to 'gpiod' instead?

Once I apply the patch - how would we go about making a new proper
release? Do you also want to add a better homepage to setup.py so that
users of pypi don't bounce off the nonexistent documentation?

Bart
