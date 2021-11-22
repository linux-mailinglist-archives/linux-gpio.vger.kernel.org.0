Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C27D1459888
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 00:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbhKVXtQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Nov 2021 18:49:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbhKVXtP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Nov 2021 18:49:15 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 500FDC061714
        for <linux-gpio@vger.kernel.org>; Mon, 22 Nov 2021 15:46:01 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id h16-20020a9d7990000000b0055c7ae44dd2so31136127otm.10
        for <linux-gpio@vger.kernel.org>; Mon, 22 Nov 2021 15:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HIB1oiHZ0iiGMICUTKXSMj/pebpoygCKH0iu3f2KlXo=;
        b=j8oaVLNLXUURGEz6MidWqEUBxbHKtCc7+5kr8NpBqGN8Fql3A3SSQ7oL16VTULcvKR
         O1NBWt/nOpsVbaEz0DJhinp3WPzht9FZwyWVJQV9tCluWbytuZbacLLTO+FU0PGY7/vl
         7VkIYvFjHc519CIVZ1Dc67u6XAk5F0WUjNV4UwDvW65B1/qTb2ZT8hz1PT1wkbo+fHAw
         9j+syovs/uXDNjw6484D9jVU43BL1WozFcFO+KEg/+C9UESrSlORsLxtP1HyD12BthmY
         9/9v1xKho+rb1z5qc/P1ce+zcLtGTCfz66ce/ywer17yZ8ni9UltMC5xfk3dfNKpPWhR
         iFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HIB1oiHZ0iiGMICUTKXSMj/pebpoygCKH0iu3f2KlXo=;
        b=434d1ph7+Je2BJ6+yu4ke7T4ei5piXiXrrFM6NxRWfqL2iciMoDtYHDkd2DIOdHwWn
         ivbbiWPrGdkpR0KBiYcu8RUA4knDIsgIZ0OlFuT9nyU2Mt8Jg+R6U/iMGtPjyPC3cA8o
         +ck1ygYyyw1pDlAdZd5afImDKwDfP8mnqrtW7L2Ju2hQP+gkggFpPkgcTFANfJ2aUWEA
         B3Gdoh6jRpQeSJUw6OoY06jOtrQPESFSJ7FM3cocaafd2nFwC90UNQrLWsR4hykd74XS
         gUtHFIfcYfhEJ0MkGiXQWX3kekvNTp7qKmt+L1LASwQm5X1euwf4uHGcG4/49WMRqFDX
         wo5Q==
X-Gm-Message-State: AOAM533FcLV15z6E1HPTHJ6svzPvZEIaPYUt1HUe20q88JsyzBG6dkNS
        BIO6KeBteN5GBJkYxu8sFOtMgBgULC4gj8W2BRxhYg==
X-Google-Smtp-Source: ABdhPJxpWRmJuQc45Mu2zDtBT8Yxx3zT/6RR/yC2BBhjIHeod2k0wQ/3KgvX7nHp9bI3uNpu/Wi17209pUXDUIvOQB0=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr209544otj.35.1637624760387;
 Mon, 22 Nov 2021 15:46:00 -0800 (PST)
MIME-Version: 1.0
References: <20211018112201.25424-1-noralf@tronnes.org> <CACRpkdZQSB+McOGK9HZUNAr2p+FX=6ddbY=5-sQ8difh1pEqGg@mail.gmail.com>
 <56881c23-8659-04e2-e7c1-264f7ef1b752@tronnes.org>
In-Reply-To: <56881c23-8659-04e2-e7c1-264f7ef1b752@tronnes.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 23 Nov 2021 00:45:48 +0100
Message-ID: <CACRpkdaGyiNubyxsTQtQ=VPj5-GiHwDS61L9kMVHEyNAN-yoBw@mail.gmail.com>
Subject: Re: [PATCH] gpio: dln2: Fix interrupts when replugging the device
To:     =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        stable <stable@vger.kernel.org>,
        Daniel Baluta <daniel.baluta@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 22, 2021 at 9:28 PM Noralf Tr=C3=B8nnes <noralf@tronnes.org> wr=
ote:

> Has this been applied, I can't see it in -next?

Bartosz is applying patches for the recent kernels, I bet he will
get to it.

Yours,
Linus Walleij
