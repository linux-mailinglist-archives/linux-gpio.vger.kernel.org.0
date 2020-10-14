Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30CF128DB2F
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 10:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbgJNIY4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 04:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728707AbgJNIYf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 04:24:35 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A711C051122
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 00:48:34 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id l24so2102390edj.8
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 00:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xetDITc/7mEeyM0mQQXYQxpJBEw2HRjBg21Uf9zDOLU=;
        b=kDAi/Wr+WCkbiMMBk5IciP29sWHK3+ZbS5gRzFzmTF52ESzntFl1FykvPChXfpoEPO
         WPmGpXIJjwSgneTuZD45bVHKtAoZSjFDJ9+CNyfg7X3yoekT6d6//uulXeRDKgqYJNjd
         M3k5FIkGgKBPvS5OHilvk6XWCgooxDVCf+z+JTZNVUt7cpcO/HdkyinzQ1T84nG4q1Jm
         iGaNSKRlygAcpkQjKFtbzHY6JWxh/7RRqmWco44UIy0brNsBcpfSaDXR1zSzbEDaU78C
         WZvOhk5aRV3HDySKCEHT/tfoI6prbqQCmuL1ZuZ0fMlyKPB23fpBuPg/3EbV2LN9fhF7
         Dcrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xetDITc/7mEeyM0mQQXYQxpJBEw2HRjBg21Uf9zDOLU=;
        b=Br3ySCQfxaXXszPnKDYukbCtS7dQG/T1mUXwR3x6WXrL7xLvdO7y8p8O3Mp7Zu9qnM
         BN1vItXSTuZvhDtqjbSEMkhH2hnyLBm8KikkmKWp05i+gRDhEQoTVGHigK84DjP1zNyq
         hczSdLHoCQMYtTNchARnAvUfJ35hlQxFq3UWub0J1APUBFpuAqTPIiG+zT8VdlnBLvMd
         fumbllrfQVZqxW18GdaM24dMcBBVwVl1GpMZWmhbA2qcxVu5vjArE0k0aeHje9sm1hoV
         7Ot8W3Pxb+2ZTvVit+YH89L9IAcNbP7Zdip6ueEt3i7qp055Kl7KQM3SU2uJXjb/zEjZ
         QCcw==
X-Gm-Message-State: AOAM532w+TMOKA6mQz+VXlHYVzEyW/xTk0usv1FUX6w+BAYJjQ0TKjzq
        JZ3qM6Y/pko73Q4jHGHM3TI86ERnJ/8WvlqTej7+GA==
X-Google-Smtp-Source: ABdhPJxqFSzVsUtJK2YvgqQEYvG8ptvqqwLIAj/EjfWM+L/sJ5Lk/aqHF2wjCKm9bX4ZFt5Z//lmQbj9EFWjeJYxSww=
X-Received: by 2002:a50:d987:: with SMTP id w7mr3810850edj.113.1602661712981;
 Wed, 14 Oct 2020 00:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201014034550.19290-1-warthog618@gmail.com>
In-Reply-To: <20201014034550.19290-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 14 Oct 2020 09:48:22 +0200
Message-ID: <CAMpxmJWAaaxs2n544v396QqxrFA9fJw4w=w60UT_jTWj19-q=w@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] tests: rename freq parameter to period_ms
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 5:46 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> The freq field of struct gpiod_test_event_thread is actually used as a
> period measured in milliseconds, so rename it to period_ms in the struct
> and wherever it is used as a function parameter.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---

Applied, thanks!

Bartosz
