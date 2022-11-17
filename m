Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDBB62DA87
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 13:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240097AbiKQMSo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 07:18:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240059AbiKQMSl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 07:18:41 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22CF8716F4
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 04:18:18 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id l190so1305920vsc.10
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 04:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AgvtbeF1yF8fqN20VrfNgYPozbYIq0o5rEH1cjyl26Q=;
        b=fFB+uTxDDDCfZmvf5A4NTlV2oeuFK3su3M4ugRQNHNR4ycep1i4UR9EVWY/77kLyzK
         gGNDQE5CU+nJBmLgCvXPIOPfJZRoJq6Jw8G7zh9gkXtCD/BfnvLCwQUjeaYfb8sy2oc6
         rz3o+6rqmmjjCiNPKhGwpjTVxJWlsTRSlXMHZdgJEHfORDaNnXF5+M2rwGguGWCnuGqa
         VvfEEp/mk8Owv0NBsGEv6V5Ii9xJ668ZpoYIzVcjjv1YEl8EHu9vZ0q2KPY1EQfabMvI
         zRw8WZeK0WJNvEUwYAwPyfwcUKzuuycIPzLhdKpcHAeC89O8mxNg2uK41lOrU7WPguRe
         mSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AgvtbeF1yF8fqN20VrfNgYPozbYIq0o5rEH1cjyl26Q=;
        b=HtkPJzJm9ywcTytcCFYIOnMoJ/8XbDlvrhiwiWh8vYoYuYOW3uB7VEq8VGyfRM3PWE
         t9lPkrAppyg5O4d1blUmPfUksfukpxcVEuWnMNB3nriAZmjs5m/8O3d74bgwZTBr2g7X
         b74ocKD2tPVJFCAvxZA/AwPylJT4JD8OXdEWG/GJ6m1+xu8nsx8hOXXIxOMQq1vorLlY
         rWAZ0KhyuQHwOnVqbFfF3svqUSCpa7KkbShzrcMZDSP+jCc+ArW/K1jAh9sW4jq3/hRY
         0o04rQq5bU/g1DA3qgJFFbCVlq0IGMfPgrs2I5gmWhI2eIK04jubqQuRjTViQkVBmNHC
         YtHw==
X-Gm-Message-State: ANoB5plq+RIr1KcEVgJc0KInvB07kfhCMLDGfcov7NJ/PFAQwhBNMCEv
        zuIfq9YJgw4yGByDYhBof/m94nD0mz2uqxTTBmd71A==
X-Google-Smtp-Source: AA0mqf613+kWaOq0XnmVfZzrl5W9GzW+PnnflO4NUtoC+wB0FJyf8ESGuZkSmoQzIxH/Lf7gf46s1z5NAUvs76RJfWA=
X-Received: by 2002:a05:6102:114f:b0:3a9:afe1:eef6 with SMTP id
 j15-20020a056102114f00b003a9afe1eef6mr1378031vsg.61.1668687495018; Thu, 17
 Nov 2022 04:18:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org> <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7> <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
 <20221117095609.uyamyqi5uuchrxdt@vireshk-i7> <CANiq72nxJn3F0hvWerUJvbgRjfyutQ=CCnpNqfMOEBumX62_SQ@mail.gmail.com>
 <CAMRc=McUTqUJzV-9yEA-7LxrQ8ktWzaPMv+x-1mOLZ0M2W+uJg@mail.gmail.com> <20221117112517.64fvaynvjwbcqeix@vireshk-i7>
In-Reply-To: <20221117112517.64fvaynvjwbcqeix@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 17 Nov 2022 13:18:03 +0100
Message-ID: <CAMRc=Mdyk4Fx5aKvjKjZSRhsSOq03wiHcMP7=Y2TG4ovWf-+zA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        y86-dev <y86-dev@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 17, 2022 at 12:25 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 17-11-22, 12:15, Bartosz Golaszewski wrote:
> > So I'd say - just use CC0-1.0 license in Cargo.toml?
>
> The Cargo.toml files already have following currently:
>
> license = "Apache-2.0 OR BSD-3-Clause"
>

Then let's just add the SPDX identifier on top to make reuse happy.

Bart
