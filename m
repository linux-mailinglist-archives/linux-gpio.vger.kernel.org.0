Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84CF920753A
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 16:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404085AbgFXOFQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 10:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403982AbgFXOFQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 10:05:16 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6183BC0613ED
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 07:05:16 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id z63so1866607qkb.8
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 07:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FRVORTjqa/+9DcZnDp26I3NHb37aWoGaEMjOHVlHQMg=;
        b=jbyBL2rWyxn8MXrza0tPa/CArnHR7kI4gNj29oS2jJr50BwyZkRsKZjA3JMDZvPVrq
         EoDD6Ef0I4VD1SmtYGbL4oNs+SGiSJZg/sPg8SpmHI6x9gNGNSsy4Ux3kS9QJLmZZ6CQ
         nfvGXvaNrzcTZiyo/HR6ym7yyvQwvz5dNdqCykSehIGEm7CkLbPE/xWU5FrtnNlgvmfz
         SS05v1SdEH+dX8Y3s8m48NrJfl3mpy+Ul2Fvbem04v4G5IALaUTfM1qiCIs6UEuECrQU
         zJbN3MI2+dPwrKkhS+hepHxhJD9y0xfbuglxXK7nOAnGKxJl7M93UiodT4fW2IY2tEgD
         b42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FRVORTjqa/+9DcZnDp26I3NHb37aWoGaEMjOHVlHQMg=;
        b=L+3ctjWU7SKchnPADKESLLmGnc+w246SL7yiu/GWx2DAeCr1Sv+Vd7QKk5i/Fdcwqn
         bhOe6yy1l5niqOQVg9l99l6zGWxO5CU5XbBLzFNN058a7ZYpZOn0xf1lioEi/NXBXhor
         GZ0qENooCDCOPdcSGxrv6fr3bNfLZTF/g5ntjy0burDAi7kFdM5cZ/YrzCvbYKg9wyD5
         m+sQ1jsOzdhPFHyMercxzPXUV9EYh2jAAxQVXgjun2kILkKfMfyY66VdLcTBEz+Wf290
         vW+V0zviNWfxYQBxv65ZIJQVn5klTKKY+sTYxdEpxMbCFZjaOvo2uDywoBMBnN8xhxFd
         I0Yw==
X-Gm-Message-State: AOAM5333LIvT/7STcMJbNrgCarNJoJQVXdrPDX2InBvryl448s0lQUfP
        GCC3beq3kqn6Kd6uvk8MkjeiqcQuG/ZMto4Kx+dFYQ==
X-Google-Smtp-Source: ABdhPJyCdrudEswTFhDtUcrXSG3JdheRsImFD5tg333cqdp5wa4NI3anAkORe0gFYYWQRnfzVWqcTR6XI7sOpHo0IZA=
X-Received: by 2002:a37:9c81:: with SMTP id f123mr1967271qke.21.1593007515407;
 Wed, 24 Jun 2020 07:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-11-warthog618@gmail.com>
In-Reply-To: <20200623040107.22270-11-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 24 Jun 2020 16:05:04 +0200
Message-ID: <CAMpxmJXajkf2F5KsWj2MpRsLjiuAdGT=XnLY_Ka3YN_WLsviiw@mail.gmail.com>
Subject: Re: [PATCH 10/22] gpiolib: cdev: fix minor race in GET_LINEINFO_WATCH
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 23 cze 2020 o 06:02 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Merge separate usage of test_bit/set_bit into test_and_set_bit to remove
> the possibility of a race between the test and set.
>
> Similarly test_bit and clear_bit.
>
> In the existing code it is possible for two threads to race past the
> test_bit and then set or clear the watch bit, and neither return EBUSY.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
