Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D618428B251
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 12:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387522AbgJLKh6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 06:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387597AbgJLKh5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 06:37:57 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4ED5C0613CE
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 03:37:56 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id x7so12364361eje.8
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 03:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vGl+MXSWkjhrRuEtCvJFzg8Dl32n3OarYy4p8OICRaY=;
        b=LBa5mJcTjR13PYwqNinHrsUKpoFn71F9+n56SsVukd5tLUlNO/tWD7025LsQNLrtOm
         p6SqPE5mBcHjWgWAPLT5uznF1VM+zG+7glIY6C2iTuyATqkxlhjg+cwR5kp8cOwa59FO
         lTzmgTj8SRAt3rEQZdSUorM4I/w7pm6CpeYdZJIlC5Lzn1k20Zdxnv/+FJVaLJRQ5o3s
         gBnLGQD9DTX/rDccwzS96Y7kwOYpPucic6OeJPFBibscR35frtZxkf31g58U6fHRrDiJ
         mwmua3PK2OQUYEplbX8IRaVN3LsvgYFT2bwcF8UxbOh8ojsbZ6TEBOcG6T1EgHYxuErQ
         OZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vGl+MXSWkjhrRuEtCvJFzg8Dl32n3OarYy4p8OICRaY=;
        b=m+TjaeTTt7IAYWv1lcA9opbL3HeU9comVt0J7lNuZGn3PTcGwMOC4swLt/p+kZxj0q
         lM85zyXcSuvJtttaOE3BEtJQFES1RFUBMfpV7lCiObIsgvwQI7rJSbzzfV5PWnDIHlrR
         9fnJgSR52n+tfxpMrXTmv6/vj2IESEcajEoxDir8IA99RIDlX3N7jDjQS598MfLFqZ1T
         he9QVrXqj2Hf7gSyN58afWW4VBw6mtRfXQWRXkyDjisEQgdYO6NZYrQ5PB0kWzB5zcP1
         gCf6wiQBZnPpV6MRG+70Zp2tm+JTCtVUNog14ebO3DbUIPjUVHDjJR3RIGQNnlGo6gj8
         VKrw==
X-Gm-Message-State: AOAM530ZY7QuF0HlM5/ivVD6KAxdfB7qJjI/++PRA25dgz4KNQjRFBgn
        fX8xReFzh0eZf6WcT9tAl8LIccMtGtWexI1FHC2pbw==
X-Google-Smtp-Source: ABdhPJxyHSiCjCJKtA4C28Z21TrSkISp0LAOUDWAE7QnngCWGJujmJHklhxoTPVAdL9AhEEjQLTLGxdAL/x8JaoldrE=
X-Received: by 2002:a17:906:c1c3:: with SMTP id bw3mr27011905ejb.516.1602499075252;
 Mon, 12 Oct 2020 03:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201002063148.32667-1-warthog618@gmail.com>
In-Reply-To: <20201002063148.32667-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 12 Oct 2020 12:37:44 +0200
Message-ID: <CAMpxmJU88pw0JQ4zjsiORB9bi6nQmMuApkcD5dWMj6oXXo5SNg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] core: Basic port to uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 2, 2020 at 8:32 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Port existing implementation from GPIO uAPI v1 to v2.
> The libgpiod external interface remains unchanged, only the internal
> implementation switches from uAPI v1 to v2.
>
> This is a minimal port - uAPI v2 features are only used where it
> simplifies the implementation, specifically multiple events on a bulk can
> now be handled directly by the kernel in a single v2 line request rather
> than being emulated by multiple v1 event requests.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

Hi Kent,

I don't want to break the master branch before v5.10-rc1 is tagged so
I applied this patch to a separate branch I made available at:

    git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git  for-linux-v5.10-rc1

I'll make this my base for any v2.0 development for the next two weeks.

Best Regards,
Bartosz Golaszewski
