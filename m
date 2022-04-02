Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2C944F01D9
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Apr 2022 15:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354854AbiDBNCD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 Apr 2022 09:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354858AbiDBNCB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Apr 2022 09:02:01 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CE613F32
        for <linux-gpio@vger.kernel.org>; Sat,  2 Apr 2022 06:00:09 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id p15so11070676ejc.7
        for <linux-gpio@vger.kernel.org>; Sat, 02 Apr 2022 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rVzenFHyyouE9ybR7xonTcc9JqXUEe9RfUST4jEx9Yw=;
        b=FUUn4gqKPOwlPJlcsrbGF8r9bEddRbGNTdRuPDKY5InH5Dkg3Y9x1HuTZ/KwMtr1jT
         /3W6HinGaKsTyn0f2OMl6o0JvxoH63/RubiVndcuxWyEvo2RkVK4xpYTm1KKh0g84Y5V
         3pnf0p7l6fiW+1iu3gHBd3DFyuJkFMkIBrtGbLzkVju9gqQALuQQf4zYXMPWjFhBUUpQ
         UaH/dMWAxoEYe+VEUwpsmTct4NrJA/zg7+xH2chOJSrj7p8pALSswWge+ZpoHqZWiWqq
         x+qQVEpkpUCi8HG1x5iVbk6HaCUxEgLPUOqDPw0bwS6DLzrL3T73ehTssJN1drIAQuaN
         D3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rVzenFHyyouE9ybR7xonTcc9JqXUEe9RfUST4jEx9Yw=;
        b=cUad7v3u6SahMxFoViVCokrteZi0x904tEoxO1nVVvv+Hn+76IzqVwL+kH+Fj7Jnd3
         oos0pCRlOKDnRD5fgksR2BkYIbR0Dk/cJJutcpEk/yJQ7UCNUe001LvOVdUULWZ3x6m7
         d65omkS8vUMxEwcf4oAn6SHmhcxZTPCBtuJsLTkTRfWA4o9WyCzwBEfxTzWl1Q77+rhC
         HoXHUeL7x8j1pZmDfwmVPJZYJnsMMb1rSeBSXvYyf++GhMoquaPIt8bMjJGRq7I565fr
         4VRmL+Fz7a5bL9oQFWc9jiY4XBp+dC0o2/4WGU8FqSO56IblJCavDxgdcNFZcKFH0Pvh
         jDvg==
X-Gm-Message-State: AOAM530nYuza8rNdx5lg5Qz9K1ETmKOSdKcxQTCyV9taVxh2sw7PsxMu
        XEK2v19Mvp/LscrdtBu9ODnbHELAB45ifnULeQEdPQXtAMHq0w==
X-Google-Smtp-Source: ABdhPJx+51+zOH1+fwrwq9r8TmK2HBsJXVGngtUUrzLe3tcH1DTK9GESQ2HlzdUsseeElxoxeLUmiYZn7N43BHr70L8=
X-Received: by 2002:a17:906:d554:b0:6df:a6f8:799a with SMTP id
 cr20-20020a170906d55400b006dfa6f8799amr3749405ejc.492.1648904408475; Sat, 02
 Apr 2022 06:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220327142553.217535-1-warthog618@gmail.com>
In-Reply-To: <20220327142553.217535-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 2 Apr 2022 14:59:57 +0200
Message-ID: <CAMRc=MdkHdvSgWzydOJTBfsutsd_Rbp8FK5aLnkQB7JGkCFTDg@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH] core: make line values unsigned
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Mar 27, 2022 at 4:26 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> Line values are either 0 or 1, so remove the possibility of a value
> being negative by changing the type from int to unsigned int, similar
> to offsets.
>
> The exception is the value returned by gpiod_line_request_get_value()
> which uses a negative value to indicate an error, as is common practice.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---

I don't see value in this. We now have an enum to represent the
logical states in the C API and enum's type in C is int. This change
would make it inconsistent with all other line properties for which we
use ints and represent their values with enumerations. If anything -
we shouldn't accept any value other than 0 and 1 but just like we do
with other properties in gpiod_line_config - when we fall-back to a
sane default for invalid values - we'd just use INACTIVE for 0 and
ACTIVE for everything else.

Bart
