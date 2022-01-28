Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A782A49FE92
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jan 2022 18:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245683AbiA1RA5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jan 2022 12:00:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239133AbiA1RA5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jan 2022 12:00:57 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18EA8C061714
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jan 2022 09:00:57 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id e79so8449508iof.13
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jan 2022 09:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=allocor.tech; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=AoqAIBvSUNT5UuLr7zPUndOb6SydL/PaK9Vn3i7De3c=;
        b=ngI3XO0RKCALjWxZvV2a6WHVstU/T+j6rLgtcNOTQv5jMa9SLmtp5i+Lr6pTIhYaSg
         k2aNcrz5ZcE3n9DqEAAYHusURGJ8+v+aSZwoAV5WhF8kwnZHiZPvH6tFToMr/Jeu+PrV
         XpwCKDXdH8vha6LIn0C4ZSoOgZNrJTLqSe1pLi45NqmuyqoSKeak/Lb8Tn6Sy0pc5lNX
         u7yHC6q/nHfhu8iB4WCEe2tgrgJvSJD8qKDizs6jCeCRGPLBEjPBfsWytXhz+k8JsOd6
         W+NZ5rt3QScK8ru+GjXx3Km2VQCiZjO1Xz9yEWaaXHUHxfWu/R+NZ6FR1czPaMkwccHa
         t8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=AoqAIBvSUNT5UuLr7zPUndOb6SydL/PaK9Vn3i7De3c=;
        b=Me4k7IHt387UZtyogxu3sTI4BTwXebqK9moX1SLCUoUreV0wx2/Dy37PQZYoJ9dwfz
         Bg0pDZy3EuRW7XzSR8ZHVHB9rrcaS3orhWeaphsmulDmCwG9XjguEaP8+DntLIv+yKPQ
         cpxcFEq0za8jpsXi5hVw+Y4GxnNPf102apT+rxNJS1/YJm63lIFmDooMBS53i4cy6kH1
         T4iEj6+NCIBpfiV8hf6UsVD1G7MXmJkpgI8rYw/K7xo3ha0gZwxesvsASNHw7LJuZ+AJ
         fhloSXBchnaoGkddWDbyS1IIHUWgkz6T1/S4IvNhsjVcdDJBaLa9dsV3/xBLxUyUnUCO
         7ZIQ==
X-Gm-Message-State: AOAM532UrA3upkM8Gw+UicCS5espZRzxxgCKNIOuQZHQejiHF7RXH57N
        oX1u96Hsd3IAxqe3/7PjXMtgPlOOFVvlq7QCDmcrompDI/KfyuYe
X-Google-Smtp-Source: ABdhPJz7vmHrITwWnrYh2CXABx54Ib+QFyuoCbQXN2Nmra2d7/FfOCyk0tXMY7DjGY038QyIT31CIxdiWDy9bpO5AlI=
X-Received: by 2002:a05:6638:4195:: with SMTP id az21mr3918687jab.141.1643389255784;
 Fri, 28 Jan 2022 09:00:55 -0800 (PST)
MIME-Version: 1.0
From:   Matt Walker <m@allocor.tech>
Date:   Fri, 28 Jan 2022 12:00:44 -0500
Message-ID: <CACjtZiTK2oUbAQJ5W6CcB=RgNvA=5x0RiEev5eT-SS3RzF9_iQ@mail.gmail.com>
Subject: Device Tree Property for Setting of Labels
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

All;

I have a need to reliably identify GPIO pins in userspace,
specifically I would like the method I use to be invariant to
declaration order in the device tree (so not based on gpiochip#.)

There doesn't seem to be any existing method to accomplish this; and
there's no existing device tree property in pinctrl that I can see, or
in any driver that I looked at, that would persistently set a label,
name, or other queryable property. (Although some devices like the
stm32pinctrl add a sysfs node like st,bank-name.)

I propose that a new optional property `label` or `names` is added to
the base pinctrl schema that drivers would then use to set the `label`
property in `struct gpio_chip` which can be queried from userspace via
`GPIO_GET_CHIPINFO_IOCTL`.

Two things come to mind to consider in this scheme
1) I think I've seen other solutions like this where the device tree
node name is used instead of some additional property, but that seems
like it would be a breaking change if accepted because then all the
labels would change as the drivers are updated.

2) Some pinctrl devices (I'm dealing with an mcp23sxx) register
multiple chips under the same node. Right now the label is assigned by
<mcp23sxx>.<address> and it could be something similar such as <label
| mcp23sxx>.<address> but if we had a property that accepted a list of
strings then each one could have a unique label if desired.

If this is an acceptable proposal then I'll put together some patches.
Or if someone else has a method I could use instead that already
exists I'd love to hear about it.

Thanks,
Matt Walker
