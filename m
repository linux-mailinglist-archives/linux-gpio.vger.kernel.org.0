Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5A537B27B3
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 23:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbjI1Vrv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 17:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbjI1Vru (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 17:47:50 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E977B19D
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 14:47:48 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d865685f515so18731276.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 14:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695937668; x=1696542468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEMGs1vgz/6gbs1d5dp2hfUQXzmFRliUSNIHCRqfXkY=;
        b=xENC8+J50BNWsfKzEEQoEpZTdIeI6RtfZovqo82XF7hv9ktSxz9eUc0I/qXVHC1iaY
         Fn8UY1wd9b/ymzcnvaKvE7HuVMdZM2GfmbizzhM+VUYWOUk361F7vzM8GA3espUWGJLq
         +5JxUhns6EO6PzTPzNVGjwkom8aJEg1g8InEBsg3/IPwz0WtBm8h4YnJYIG92D968CIy
         EtrrQ/yieRPQvPxOhpgCe/keqhfsY7+dBWhrW/uVFG250GP7sON7g3bJVIaNzImDtoKI
         y8jNjylNjX6rS9KX1pu8zg8heEuQ9x0RxH8u4YjXWllBWpS1w99ftcijHhfNGypERbCJ
         +w2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695937668; x=1696542468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEMGs1vgz/6gbs1d5dp2hfUQXzmFRliUSNIHCRqfXkY=;
        b=TEut6Oym2LIGAI1FmEhF9JtrGtKNEFZasPLDEhGNM8kPw+SmKEyUFdzJVoJ10S65ov
         mpTiJrX3sdQTHnPaZrgcqP3YXtKvNpccqm/CJ12QLB4LVmzZR8L2Si+g4kQ7B3eSQdh+
         ENhZT+H8EsfYguVpU0pTo55I3LFOFfAAqCOOVkRpIUjsdinK7f2jU3Rtwvr59HNAjP3v
         rt9yiblIx+xblrPn9PP4aaxUthjnLhXrsW88rxNiX1muKogdJPl6I8oxYEj+a5yOiakb
         4xUF3XBMe4FcDH2Bi3L0BvG4T5U2uNnP+zJPBUs1480wAOLwa7m5JnbBXB/zcgemF2bT
         82qA==
X-Gm-Message-State: AOJu0YzbSbuYMdtzeRIQfNaquPW8YrU+c7XIflCaD1V6GbRf0WlWKvWo
        hZJqbYP4bU1M4F4Np/2LJibo4FPUlIyMa4faY5SizA==
X-Google-Smtp-Source: AGHT+IHyP8J/6Rmx6r1ZNaVyrqMkNMrbYuIY2xH56GVEGPTsv/gf0R7/crKLTYV4ka7wcvWF8IpCR3fLEPBoRV0lfRU=
X-Received: by 2002:a25:ae96:0:b0:d86:5cb8:29e0 with SMTP id
 b22-20020a25ae96000000b00d865cb829e0mr2073234ybj.6.1695937668156; Thu, 28 Sep
 2023 14:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230920085639.152441-1-brgl@bgdev.pl> <CACRpkdYtbGqmMqN7FNhjYJGG+e0jWQmozf9kpNHiUBJvd2c=7Q@mail.gmail.com>
 <CAMRc=McrXEQbwcsK3yrfROujezjMd1L4EcJj7GNTCE5L6zD1gw@mail.gmail.com>
 <CACRpkdYNA1rkG5wJ0+rAT9g4EyzfbN5VP2a9vuMMk_RD6bMLFA@mail.gmail.com>
 <CAMRc=MeaAG5w_JzgSNs-EC5HY=2izC4W1FHZ54trEW_PvA8Yfg@mail.gmail.com>
 <CAMRc=McuKNg5r7m6OPtwYc3er7i6JB2JN=H6QVJU_G9BVtnuAA@mail.gmail.com> <CAMRc=Md6=UNVt-HygYoaqwXXDdjrqsPvbyOrQcThjHOWAzLQ9w@mail.gmail.com>
In-Reply-To: <CAMRc=Md6=UNVt-HygYoaqwXXDdjrqsPvbyOrQcThjHOWAzLQ9w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Sep 2023 23:47:37 +0200
Message-ID: <CACRpkdbbkw=Dp054c5TLFuXaVK9q3+hco9cxrjW+M0hnSZrNdQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: extend the critical sections of lookup tables
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Wed, Sep 27, 2023 at 9:01=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> If there are no objections, I'd like to queue it this week.

Go ahead.

Kernel looks better after this patch than before =3D> queue it

Yours,
Linus Walleij
