Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 119CB3C77AE
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jul 2021 22:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhGMUNQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jul 2021 16:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235043AbhGMUNP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jul 2021 16:13:15 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4036DC061788
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 13:10:24 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id gn32so43758250ejc.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 13:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t1yqQ1gIhB9mpxretSVZpOofSqINqdpXpqCBUYRV+W4=;
        b=MDCw2qTkqrpXZfpx5R377ufdWw+dkqWiW/YF9ClLYjY9PJXQHSKLo65PnRwONNIbYN
         /O4sg+aieASjQSQj4+wUFqy10Ytdfhj6Vibh5uyp/J7q5sZGZp+3Pr0C/kiOhDZHCjyW
         APB4n3E0xEjQm0VMswwTcZH6EhAZs8bh4H1cVmnwlPP841zm4HLAb+/xptUsnJlUv3C7
         TdRVzDCM9KpBay0niZKkOcl+7yNskzFzE0GNJ+Nk2UdrHAZufZ3QZZ3IVcoi9rLsCKaP
         ZUt3VJobq0iAz98qD7Q7VhlB/NnJErPd5m3g3QReTEi0XkMVc13KpWDv+zd8xTwxlOq5
         Rtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t1yqQ1gIhB9mpxretSVZpOofSqINqdpXpqCBUYRV+W4=;
        b=DZ5/6hFRnRylhM/0T5g2F37vpOWBgec+K46drcB7fsgxIjr7KUpU4OLmbuTTk1mE3q
         t7tFMWAnW/CYqEhwtGKNGHoh660gvv+xN97BHzjUZhiGVAsk42n+alni20ZSSHOiB/QK
         avyTm+6diggfdN05VGlv9bF6XM5d82DN+ncVtVTjyMBA18aSrDC/Zzy/I9uWINp2Yp6H
         fvhCGIoh5aSUw2iHvU6hkWBTYtrlhuHL2zGlmPkUBdd259Jr9Kc0eZ4u1AFtFYSyja4c
         h7HY4/xHwjG64Z/BnmVuLWBoHZgdPDqF9GeAHMFgQCoDcbxJnyPj8VxRk+T2+EYaCPXS
         SK4g==
X-Gm-Message-State: AOAM530kLa3K+DxtZir7mdifIwvlKMc+Tmq1yBSlqCmScVavV+5leb20
        zwTdWNlZ8U5U+eCjVwwF53WoNPWaJe/lPD31c/OUWg==
X-Google-Smtp-Source: ABdhPJzLswJC8LH8P8RzOVADmm5aQVhv45DmASPD1ZYjrn8mMherEySm2eNH5dTZy9HYkHonrjt2N29EaXlkhJ5RKvI=
X-Received: by 2002:a17:906:5f99:: with SMTP id a25mr7697276eju.101.1626207022630;
 Tue, 13 Jul 2021 13:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210712210836.GA3636@cephalopod>
In-Reply-To: <20210712210836.GA3636@cephalopod>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Jul 2021 22:10:12 +0200
Message-ID: <CAMRc=McqKfzS8EVA-RUitZMwn_TFQEzU2AOuTTxvcdSX+xLj2Q@mail.gmail.com>
Subject: Re: [libgpiod] How stable is the v2 API?
To:     Ben Hutchings <ben.hutchings@essensium.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 12, 2021 at 11:08 PM Ben Hutchings
<ben.hutchings@essensium.com> wrote:
>
> I'm working on a project that requires GPIO debouncing and is planned
> to use libgpiod.  But debouncing is only available on the unreleased
> next/libgpiod-2.0 branch.
>
> What we'd like to know is whether the current C API on that branch is
> expected to change much before release.  I don't expect any commitment
> to API or ABI stability, but it would be helpful to have some
> indication of how much change is likely to be needed in a client that
> is written for the current API.
>
> Thanks,
>
> Ben.
>

Hi Ben!

While - as you already assumed - there are no commitments to any API &
ABI stability yet, the interface should not change very much. I have a
single set of API changes in my queue that we discussed while
reviewing the C++ bindings and I don't expect there to be many more
coming after that.

Again: this is an estimation, not a promise.

Best Regards
Bartosz
