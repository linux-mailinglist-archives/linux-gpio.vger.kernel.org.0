Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B767328E1C0
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 15:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731181AbgJNN4x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 09:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgJNN4x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 09:56:53 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5C8CC061755
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 06:56:52 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id l24so3218479edj.8
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 06:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=paqPYiERRMgvhnV66Rq5flhcdTclwlXWom5bceHq4f0=;
        b=xwoLP3hqNnOLphGE391Ki1PydFz6cRSDrvFGxEnLG3rlpL3AbZatV++ruGhSrG1No/
         nYx1J+qfLnx8lRBEXlacSGprck+QNRcyMq85uIaAW2iUUaXMnnj+cE1z0M4g0mvpemcx
         SC7OCe+9EkM3HHe5nIZZVW5NUH66EUaSgaFAivoAwksPfE1WyR7fu7bkNJ0bppaXjEld
         apTfPYdsXr+k0b+h0G+hTOB3wu/wwlloDJSNgMnzc3F8zLOgCbAAWwS4NIXIvRHPc7lY
         io/5XyNY2nzjahvHbqiA8nbAo/dZRGk3vnsCn7Jm8urFt28Lj2btmZYiQLBoAQbQYjdz
         BhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=paqPYiERRMgvhnV66Rq5flhcdTclwlXWom5bceHq4f0=;
        b=VUgL/cb3Z+dt9AV/bHkmY3E2aMHTjKifIfZv9zsJHXA7Ba+3hedEC30uW70YPymw78
         d4512Fm8BPGicUrluicPVYhtnaKtwABoDymqnDw0UhCGDIbfxD2MsVtf6WKG4xphzF66
         A1WQcBofj5pnUt8WapCgUg9Xd1pAvZLqF4hdpCEf6nRcF1k2K6kCyus0NEYbAFHDWrxe
         dm7ZOYpa6QnFgpPC9yiVPpT/CmGGCgU6nqNqeyLX0me3DWfL//WG+fcyRB6WFTtr5ItE
         ZX32Y/+X64dNHUkhrjrFFaxBsscvOjF1nmg92nmZi9ELa6wwiuHZ7qQqLh9KSSNFf2l+
         uYxg==
X-Gm-Message-State: AOAM532qNhhu8IBJ2qSlCRqVGHSRAv9+yEj9tG+Q+sPaqqgoEtpbeeE/
        2ro6cqlKdCl/OcgdncqGhc/p/dn460eSRU8KjL6AFQ==
X-Google-Smtp-Source: ABdhPJzw147U1SMAAC0SPsvQ0ETzZh9G5KPIG1WAdfPP2vg1krOf0IOiWKZywW5eABV4VsNmo3U0sCjpYkx219VYbjg=
X-Received: by 2002:a05:6402:943:: with SMTP id h3mr5379140edz.88.1602683811393;
 Wed, 14 Oct 2020 06:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201014034758.19427-1-warthog618@gmail.com> <20201014034758.19427-3-warthog618@gmail.com>
In-Reply-To: <20201014034758.19427-3-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 14 Oct 2020 15:56:40 +0200
Message-ID: <CAMpxmJU2_Hx5x0zMkCeRCEOnJCOZpXiCi1mQtmoy_S_vDzJjYw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 2/2] tests: add check of event offset to wait_multiple
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 5:48 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> The offset field is added for uAPI v2, so extend the test to check that
> the value returned is correct.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  tests/tests-event.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/tests-event.c b/tests/tests-event.c
> index a43f865..0e5effe 100644
> --- a/tests/tests-event.c
> +++ b/tests/tests-event.c
> @@ -570,6 +570,7 @@ GPIOD_TEST_CASE(wait_multiple, 0, { 8 })
>         ret = gpiod_line_event_read(line, &ev);
>         g_assert_cmpint(ret, ==, 0);
>         g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
> +       g_assert_cmpint(ev.offset, ==, 4);
>  }
>
>  GPIOD_TEST_CASE(get_fd_when_values_requested, 0, { 8 })
> --
> 2.28.0
>

Now applied to branch for-linux-v5.10-rc1. Thanks!

Bartosz
