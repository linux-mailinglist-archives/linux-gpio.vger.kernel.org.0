Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E75328DB8A
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 10:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbgJNI3y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 04:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728436AbgJNI3e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 04:29:34 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947C1C051123
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 00:50:20 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id l24so2107001edj.8
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 00:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zY3oecCX+jOcs39wRf2PBqtxkzOv7GeIF+fTCMhkg64=;
        b=pvoZ8Kx1Rx/6uAkqRCXKDE5aIGStWslhgyvWwebgHkO8QJtNpxdWQ6lZH6a4Bq5jgO
         PuSL5ZimCxTVSrJXllau6akbo7X+wzJK52KafbzOy2IktOMVgZ4z6yXQ4A11rBVYlprT
         lkGpf/LDBPrd89w60PX6/q7Z3+MsUzeZ6kVJ+gMO3uiNr7dBbeggEO7Cu0equFlgCGaZ
         EOIvoiO0nGevg9n57mdq49p9baYxFXW5/wrPZcoey74abE1nCCCnleeMVQnBRPKVC8+n
         zaSeq5jNEPnMBkTN4y/A3k/mk7uFIvbpC+FUW5lr2ReGFeb08aJ3JAdDHL+LyBHvXSn9
         1Cnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zY3oecCX+jOcs39wRf2PBqtxkzOv7GeIF+fTCMhkg64=;
        b=FSPbN1lADE8S6RnMSnC0osVTbBYyYeWC+miuVh9BUpxZ59DHbJL0rMQCjl8EWJBJWX
         prmUbqNvaZtNP3H9ojth3G9miob6E0Zr+f8XOVIiHzMGWJPcNsHJ2qXUSwdzEx/ZZTuq
         IW8i8qaOTeBMEg0it9lXeA/iTgnIgVlResnNKjPQtiAXzuV2G5OwKhxyFlEwOoXYS8OW
         za+wbvWyeN+sSSeHDp+jjJS2GGiPOtrjC7PGwi6pSjPIlBP+vdLMOHxWQ8TGqQ5i7akW
         fgvrJYWtCeIOkceVSGr1sBYhsq5xZ7GhM5EF/tl9vG35NPUnMBErH1g6ZjM30ipPLUrt
         NLwg==
X-Gm-Message-State: AOAM532yGDyYBpQYiMYRCg+AjAipX8seOmW0CfM4Xto6iUoCApX+z7kQ
        fPwlhyHdhcaOJoGvR5JEDc4A9MmJ51DvQomNdL6IsbAU0ns=
X-Google-Smtp-Source: ABdhPJwrZtd5K1GAXlQxVxEjky8GK/kbYzQTHwYe4chyQPMHjIdFaqgpZR3UahJ2Hria16NIs8Vt8N+JTwDL2+O95Ac=
X-Received: by 2002:a50:d987:: with SMTP id w7mr3816516edj.113.1602661819310;
 Wed, 14 Oct 2020 00:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201014034758.19427-1-warthog618@gmail.com>
In-Reply-To: <20201014034758.19427-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 14 Oct 2020 09:50:08 +0200
Message-ID: <CAMpxmJX0E+awshoBJykp2C1ZOK-oCgSDTE2xmeKKZdYW0m4q8Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/2] tests: improve wait_multiple coverage
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 5:48 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> A couple of patches for the v2 branch that improve the coverage of the
> wait_multiple test case.
>
> The first creates a mismatch between the chip offsets and bulk offsets
> to highlight the problem with my initial implementation of
> gpiod_line_event_wait_bulk() for uAPI v2.
>
> The second adds a check on the event.offset field added for uAPI v2.
>
> Kent Gibson (2):
>   tests: create mismatch between chip and bulk offsets in wait_multiple
>   tests: add check of event offset to wait_multiple
>
>  tests/tests-event.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> --
> 2.28.0
>

I suppose that, if we don't want to do the backward compatible port
for now, these can be ignored?

Bartosz
