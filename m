Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F110A470EA8
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Dec 2021 00:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243107AbhLJXab (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 18:30:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240000AbhLJXab (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 18:30:31 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B87C061746
        for <linux-gpio@vger.kernel.org>; Fri, 10 Dec 2021 15:26:55 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso11217868otj.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Dec 2021 15:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=79vI1NIk+laQzOU68I94bqeIMQr1o28LL9pW3tDSdD4=;
        b=SvbhddfMgD9HanlXe7y3VkxWUVq7MPOmoEK6rMTj3gpg5ZPygaMy1bZnCSqqk9fwNV
         R5tWPX4S+hGl2NczNk18G23tGxQ5hmPPP4zG4TF9Y1SeV/hM4ZMfnCOCQDRSznPgZdiB
         sduFqNGxjYoSJE4QvopPMTHdakMIBR6F0AK08NAaD25alhHjIQ3MFy1tiqDjbW6pOD/9
         rb4qlr4yiEe4NJCS5OxlfPAvetkswtaeKjskVh1Wb60m3YI8Xi3EyOGwzL/QLyXWfzA5
         RgTrd0fToQNQ3yCZeR/P9CkkjCDcYDHtY5z2puw3lBz4/oSRTXaXNw1Wv9HrUrkdzkPY
         BMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=79vI1NIk+laQzOU68I94bqeIMQr1o28LL9pW3tDSdD4=;
        b=QdwRgnm/N/NhUbr8/aVkpXrUcn2RxKsoss5W3+7h+JUQabAsQNqF8GaVIkBBizsm7h
         8Nx7YnpNCl3+WB/6Sx0JN4VddEP/tFd4AxDtbVPfD5/CmYchaZToKijBv4ArFJH1uIYu
         JjVrNsakl5M4FnONZCB2mcCXR6izeArGVU32SFmlWSRLl287YO4uDn4DEXWG5R9zfWq6
         Bzq5yKpxUn8KsHb3iU4apX/WGD1xAQuXfYudewhzCHiSrRa7QXbBxMaOokYetxuPY4c0
         G6j5keQy8v7P306g66L13fqAtg5LcmvEkdD+/7YPA7SDk3N6g3+0GhGGnf6UNnxaT0S3
         dD0g==
X-Gm-Message-State: AOAM531GvgFJUfI1WtAA2TjmbUb5+VdnsuqLNzqlBhvZmKFQpeCVdS9R
        8WsiHOwxQvfv2tZ0tdiAPbqiXnXgrQiasrcPas/8xA==
X-Google-Smtp-Source: ABdhPJw7MPDjy5jN2QA10VHjXtV8hz9J1nqSiEB+sbB/AhvHsDNJnBlR0cW9mjd0RDRt14jx/+z60PNhHFeD7FolqBg=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr13479805otj.35.1639178814350;
 Fri, 10 Dec 2021 15:26:54 -0800 (PST)
MIME-Version: 1.0
References: <20211210114222.26581-1-zajec5@gmail.com> <20211210114222.26581-2-zajec5@gmail.com>
In-Reply-To: <20211210114222.26581-2-zajec5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 11 Dec 2021 00:26:43 +0100
Message-ID: <CACRpkdbsb63EN5hmGws1eLaARg2VRXXhz+5AM_x7OhaS_ceGow@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: pinctrl: support specifying pins,
 groups & functions
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 10, 2021 at 12:42 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>=
 wrote:

> This binding change is meant to introduce a generic way of describing
> pinctrl blocks details. Every pinmux block is expected to have:
> 1. Named pins
> 2. Named groups containing one or more pins
> 3. Named functions referencing one or more groups
>
> It doesn't describe how hw should be programmed. That remains binding
> and driver specific.

So what this does is to take a large chunk of data that we known to be
associated with the compatible string (names of pins, groups and functions,
etc) and put it into the device tree instead of the alternative, which is
what most drivers do, and that is to compile in the data into the
operating system and just look it up by using a compatible
string.

The DT maintainers have already indicated that this is not desirable
and I don't see it getting merged before it has a Reviewed-by
tag from one of the DT binding maintainers.

I think we need to know what the USP (unique selling point) is?

Would it be something like not having to duplicate work across some
boot loaders and operating systems? (Well they all need to parse this
type of description but that can be put into a library.)

Or something else?

Yours,
Linus Walleij
