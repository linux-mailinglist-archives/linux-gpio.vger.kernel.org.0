Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 412D97BDCC6
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 14:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376284AbjJIMuB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 08:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376567AbjJIMuA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 08:50:00 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A456491
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 05:49:58 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-45765b55fb1so473027137.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2023 05:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696855798; x=1697460598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqVHBhsbROUYrkVKqcZNTMEbfx9Kq7hgDbRTjOfBx4Q=;
        b=TD1KH/s9wbTWECAbs0LvQcLKqYvLAdaDhMYOWGlr5Lzw78IsyGECowME0mMeGM+bxg
         RX5uYnEykgdNzSkhHv8LuOqrUTK+PNkaUHRa4mHrVMQ3i7ocxk5cDFpuY3ZAuEl66fkp
         hD1oMEGnodxdBHdpRn6pht/d9oIPiwbyAYmgXtNWuaGSpjnbfbEolP1hSldyXxd+X8Rs
         lVgiGuLXjOUE5TG/JYc/qrl+5CvsxolVuQ6RE74EMgs1+mW+a+yGjT8r8BW0A9LeQOjn
         J1ar3Fw7+ct/Q9AeOTUqt+RCwVbrggCpvXwjIqyWIwwOZOHUa0d/XGxn4V8jWfqYVW1d
         SzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696855798; x=1697460598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqVHBhsbROUYrkVKqcZNTMEbfx9Kq7hgDbRTjOfBx4Q=;
        b=sXSFFMWgiT+oiXtoErj/64RIeMdan/LUuJSi8RWk0Jyvj6bik7IMIwgYqtxI6GxxG8
         ba0jkWcasU9qNUueXFcY5F9QkHp9Nmw0OXX4rqUD25Cn77Iod71n7ghI28XvemIhbDUM
         FoaFZ77xy18fGz8AjUu2X6diyc9RWWnDXC9qvB/XCCbb/2m0MZ/b34QZk09tuoIWwVYW
         CTMbCeQV8sou2s3Tt7eSwvScgvM7JxGjPiH8wWpcwz1Pb+m/7fVvNMUk5V3O+GjJtjBL
         cbBfiThBnHNFneTbPJ63D6g7FiOmSwBpY+CNvzi30wWZoFhgYz7IYFgkMTB2vBqVcRSQ
         rs8Q==
X-Gm-Message-State: AOJu0YzH7gSZw5Epey0Jcg3RL21rUtV7HMfT/3xxQxiWRDyrB33QotJE
        X3Twg/97PXEE2wQN7QiGb5K4uvGp23dh+gxfyMCDZA==
X-Google-Smtp-Source: AGHT+IF8OlnQr0BKaBgObH7+v22TsSrBXBeHAOtNhq4x6SIT97e5mjB7RqcAehoKyOTYt/mv5/OuA3sc2lBTTsdGwGs=
X-Received: by 2002:a67:f585:0:b0:44e:8e28:2853 with SMTP id
 i5-20020a67f585000000b0044e8e282853mr11274007vso.35.1696855797782; Mon, 09
 Oct 2023 05:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230926145943.42814-1-brgl@bgdev.pl> <20230926145943.42814-5-brgl@bgdev.pl>
In-Reply-To: <20230926145943.42814-5-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 9 Oct 2023 14:49:47 +0200
Message-ID: <CAMRc=MevHb5pyrcCaGkC7uWChMtzovoP4OA5MZ2Ky7RPT4hn9A@mail.gmail.com>
Subject: Re: [RFT PATCH 4/4] gpio: acpi: remove acpi_get_and_request_gpiod()
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 26, 2023 at 4:59=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> With no more users, we can remove acpi_get_and_request_gpiod().
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

With Hans' patches applied, I queued this on top.

Bart
