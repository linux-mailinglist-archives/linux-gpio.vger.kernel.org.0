Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABFF7B828F
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 16:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242870AbjJDOmJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 10:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242897AbjJDOmI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 10:42:08 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3610D8
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 07:42:04 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-4510182fe69so1005867137.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 07:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696430524; x=1697035324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQ/PKazKBGaskeXfCLjbMk4s4xY7cDQZFwYK/MhY9C0=;
        b=QyUajYPkPwB0d13YUtn7lBpC9hJgkE6eytFbqDc19vak8Z8UzfCLo8B+yRvuFwzS39
         EKFUsW8qNHfe8ZsAye+Qms5JoHftxWjweIkH6zqcTqFM/+57SXqOu/hjqLdjWi0gGW7K
         XabpYRd3GDDLu/MYcD2tXsRkLEIQoz2o0Z+EW1+dl/UEaYJeFckX+rLK6BWVKrI7NnQC
         SsOulx7X/UZ4rde/LoY1MjWBSpFTMEvwUD4cpDtAOaSANP+VhhKbkttInCBXY/9S/CMJ
         8wVFv0RA1dz49e2t26X+mZykygrz6a88Fgn7T2OyZy/JytM4buCbIy61ZWNAHSuLhdyg
         f6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696430524; x=1697035324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQ/PKazKBGaskeXfCLjbMk4s4xY7cDQZFwYK/MhY9C0=;
        b=DYPKss7gB2vS3yiEg/1efuWds2WJxlspSuphkCXfXPO3JQHWDy6GLxeKN+Y+KdlMvL
         0zRqmFjxaoLirPh6MDgf1O+Fw32tnQ4COMezrUKa0UAUk7CCTm/O3DH9GqoTCsNAk3mM
         DQgiV96X8BgComo8aCY9Pqh7AgtZr35NW+O9xGc/ZQ+6EwPsnzoTa72nkKGIXCyX9w38
         XXSpNoVmOQEySv/3ALff5jyDVdIKtany1QsFAHhUb9R2cGda1IefkwwuK0eKnfs7DPgt
         6Vm+0/MELJu47wfYjf7sqghJUhK9aVJns3f7rPXszewjpyv1nLkD42YvF9fFwCXwrf8U
         q3bw==
X-Gm-Message-State: AOJu0YxvqzIBpRvknhuE4vdGeXUDzRHdQiUCQbLlS49EzRmJ1U7Aqb10
        LxArSKIBx+0hwTMh0md3MtXko11sPK51+ETF+lj+Ng==
X-Google-Smtp-Source: AGHT+IFZtnLwORrtscwN2sX8nr6tAZ5LtQ+jKg+DkcJgwR66XeM3VGDlZC5rQNSLF5LFlCZ7LabqvMNuZM2VjHtVat8=
X-Received: by 2002:a67:ad0f:0:b0:452:6fc1:a3e5 with SMTP id
 t15-20020a67ad0f000000b004526fc1a3e5mr2109757vsl.1.1696430523954; Wed, 04 Oct
 2023 07:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231004-rust-line-info-soundness-v4-1-cff89db04aa5@linaro.org>
In-Reply-To: <20231004-rust-line-info-soundness-v4-1-cff89db04aa5@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 4 Oct 2023 16:41:52 +0200
Message-ID: <CAMRc=MeBiuccxDVLzB6idwby3B9y-rSBk5ENt+KRkvQ16UV8bg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v4] bindings: rust: rename {event,settings}_clone
 to try_clone
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Linux-GPIO <linux-gpio@vger.kernel.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 4, 2023 at 3:00=E2=80=AFPM Erik Schilling <erik.schilling@linar=
o.org> wrote:
>
> What is getting cloned is already clear from the type. This also aligns
> a bit better with similar methods from the `std` crate [1].
>
> [1] https://doc.rust-lang.org/std/index.html?search=3Dtry_clone
>
> Link: https://lore.kernel.org/r/CVUKC1HXG1P8.13XIUCCXN95F0@ablu-work
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> Resending only the missing patch, rebased on the others.

Thanks, now applied.

Bart
