Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62C9179E78C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Sep 2023 14:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236689AbjIMMED (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Sep 2023 08:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240216AbjIMMED (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Sep 2023 08:04:03 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8DA19AD
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 05:03:58 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-44d3fceb567so570792137.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 05:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694606638; x=1695211438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dODoLWu/YelyIGqkOwrbnzbgnk+82UR+y8rAxi0FW68=;
        b=K8nZ3MlZhPTh+zaIUg43rBHGSHusv83fjQ728GW/ruEHGVSbwSHR/LgqZL/0wPX/9i
         ZUvlmlgkUnhnVZv1XklWEq8EZgd8MfvQVJC4dUBpjqwc3TD/GafgImc455ELf1Kv5nQw
         hGuTx47uFn5Ys+jTN2/Rw2bJBIH5rD6DDdEYjq/ZBV4IXDzHXkJv2wQSQ6VzjWNf6CE7
         FFf1c0m7FrgAdEzqC4x8/CV167VpjZdlCX9XNm4IXU9TLrzv0GtVUjw3rC2W8L55JokF
         O5EXhjLcqXIPTQH1S25P1i5NLgSGK2zKRGm/5pscK4eG9T7K1hFCqz1D1+m38q3viSIv
         UDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694606638; x=1695211438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dODoLWu/YelyIGqkOwrbnzbgnk+82UR+y8rAxi0FW68=;
        b=sbeBanF+uOt6RsWb+rX/kEYmTwiqRp74ElsxdQ45BBDp55nW4TNSrZzmTwu5KLkdhm
         wkrbV+jl6Rio686qhaynQ9uPnTS4o25IYYkPYD97NW55ZV6OakwsrFxtWq6ynK6WxV89
         JjcEC+REssakdpTZ4Mb2TaTqvYT/WutrWOtOdkAYb6iy9UlNQjtfIDXA2R2c6RoX4Jwu
         XUHhUUdRtUu6PEzqnYZgBi4rlNZfOe+GrnYni1niIWoY7yncMHbQgVxsBcwEPKxXgsMU
         e9ucWaDB/SDphoWO0wdo8ZDbHiQp2r2RSu8fSW/y60kv1HqnQT+wAwRltSk8zP8ThjdG
         otNQ==
X-Gm-Message-State: AOJu0YykGdwSjCodMJXy8iZOkGU3gAnTyYoGZhyvjSnFC66dzg17G9CM
        ByIg2qojajrxswTJXXrZxLbovptbBwldXR8aeEaOlQ==
X-Google-Smtp-Source: AGHT+IH8NdVEUVp3Pv16G7XvmIVblMA4yv3sR+tUj8wjWpu+xg8/MJrlrUMbPl7byFjCyzXavDDejGm04ceaFC6cRfc=
X-Received: by 2002:a67:edd3:0:b0:44d:5c17:d065 with SMTP id
 e19-20020a67edd3000000b0044d5c17d065mr1195586vsp.13.1694606638019; Wed, 13
 Sep 2023 05:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <CVHO091CC80Y.3KUOSLSOBVL0T@ablu-work>
In-Reply-To: <CVHO091CC80Y.3KUOSLSOBVL0T@ablu-work>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 13 Sep 2023 14:03:47 +0200
Message-ID: <CAMRc=MdMKd+6-P-ma0E0f5yBTOGS_zVaBJD6wEywyjZ7JVE2YA@mail.gmail.com>
Subject: Re: [libgpiod] Thread safety API contract
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 13, 2023 at 11:47=E2=80=AFAM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> Hi all!
>
> Currently it looks like libgpiod does not document any kind of thread
> safety gurantee. However, the Python bindings tests

Indeed, the library is thread-aware but not thread-safe. Just like
what is recommended for low-level system libraries.

> (test_request_reconfigure_release_events) are using sequences like this:
>
> Thread 1 creates chip + some watches
> Thread 1 creates Thread 2
> Thread 2 issues a request_lines on the chip
> Thread 2 reconfigures the line direction
> Thread 1 joins Thread 2
> Thread 1 closes the chip
>
> Implicitly this depends on a couple guarantees:
> 1. Calling chip-related functions does not require synchronisation
>    primitives (other than keeping the chip open).
>    -> wait_info_event, read_info_event and request_lines are called
>       concurrently
> 2. Requests may be modified by other threads
>    -> at least reconfiguring the direction is done
>

Well, this is just a test-case that's meant to trigger a line state
event. Now that you're mentioning this, it does look like I should
have used an entirely separate chip object. Good catch!

> Looking at the C implementations, it indeed looks? like this is a safe
> thing to do - with the current implementation.
>

No it isn't. That is: maybe it is but it's not on purpose. There are
no thread-safety guarantees.

> My question is: Is this an intentional gurantee that will be guranteed
> in future releases? I am trying to figure out whether the current
> contract exposed by the Rust bindings is correct and/or may need to
> be extended. So which guarantees are provided by the current and future
> C lib?

None. Except reentrancy for all functions.

>
> Currently, the Rust bindings are advertising that the chip may be `Send`
> to other threads. This means one thread may forget about it and another
> thread receives it. In contrast, a request for a line is currently not
> allowed to be transferred to other threads (it is missing the `Send`
> marker).
>
> While in C and C++ thread-safety is typically not enforced by the
> compiler, Rust has mechanisms to do this. But I would like to document
> the C lib's situation before inventing rules for the Rust bindings :).
>

I cannot help you with that but whatever rust does, it needs to keep
in mind the C objects need to be synchronized as they offer no
guarantees.

Bartosz

> Trigger of my question was that we glossed over these details in
> vhost-device-gpio:
>
> https://github.com/rust-vmm/vhost-device/pull/435#issuecomment-1717205620
>
> - Erik
