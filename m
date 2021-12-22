Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 659D347CB43
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 03:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238514AbhLVCHG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Dec 2021 21:07:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233790AbhLVCHG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Dec 2021 21:07:06 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB3EC061574
        for <linux-gpio@vger.kernel.org>; Tue, 21 Dec 2021 18:07:05 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id p4so1608826oia.9
        for <linux-gpio@vger.kernel.org>; Tue, 21 Dec 2021 18:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xZp5Syvi9swbAbG4sGP4XNG1v+Wua9e1JNvh0bGU+iM=;
        b=vp6eV6wy+QmDfhzjjj2nlCM1LgdwRyEd619nCE88VdHZQJ9hM1veZEs/IpKgodsApE
         zG/hTHLZMTnYUclwj6pSorNhcY57CXguyoMNOQk7Pzjh2daCXxI5H/JXpB5BjlRkTMh7
         UX6B++RyhcarxfeKEYH9IenZbe4VQrehklfPG8UJ7BGUHnw7uWm0pUftdymGO4gyiUtl
         ClK0PcSuliib+5bFFDUG1LjYKmTEkcxyLD8O3cQ/5QWuvNfUpsqGBWGM3GfUEzDtChQs
         9EkEAySPjUL+DPmmc2iM51ChPEpY5nqkQcVs7YL3Zm8vc2e65TQ5NewXkTq+L5o3lCeq
         2fKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xZp5Syvi9swbAbG4sGP4XNG1v+Wua9e1JNvh0bGU+iM=;
        b=cs321NWNvsnUrRMZFINIo35YsYsnZi1SvRqHZa/MU+9KSHv3hK2A3TaInyqT8oKh5f
         sr0mHLuQ3pQSOWAcmVg5FJma6ZPfJeFtH0HuQECI2I8jLAmUPoc8EhC/+7a2zRJFvMME
         1+0kmre+hehc21nGdY/HE0eeiCf4RfVzzjdMiZOFFuHOJMF7B+/yBNaxn3sDt7X70FLF
         s1aiVs+sMCnIB3Q131TT4uL2RHo3tCWki9V4AfZ1QhIC9ryis18pgnPyYMT0baZvWwpC
         jtHAo3km6XAHwaQwEvbML3YXyieXHqy/y3zQEyBqB36im6f4lz1DMqsyKEQjDXOkG8C2
         KTJQ==
X-Gm-Message-State: AOAM533COLA0b0r5ZnifpJ2R1o/lLRXR7ysF7NS2ENnYgo9kQ5wvbzE0
        CaW9GNhuVY4LDZ6+IMMw6dAVQrXNlh4oiZNbmV+f+A==
X-Google-Smtp-Source: ABdhPJwz54ZuX4l+30Rm2nkVpjaM0YQ7MpPDb0FW5J7qG5NQUKcy6LQfTpAsAJPZWuZOix2OHFXYIlfTUlRvCbiC6iM=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr656456oih.162.1640138824880;
 Tue, 21 Dec 2021 18:07:04 -0800 (PST)
MIME-Version: 1.0
References: <20211217112345.14029-1-nbd@nbd.name> <20211217112345.14029-14-nbd@nbd.name>
In-Reply-To: <20211217112345.14029-14-nbd@nbd.name>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 22 Dec 2021 03:06:53 +0100
Message-ID: <CACRpkdbhPs_0PT+LcMe=uc4XeXYPAv71EN=BLtAZmLtNupv7Kg@mail.gmail.com>
Subject: Re: [PATCH v7 13/14] gpio: Add support for Airoha EN7523 GPIO controller
To:     Felix Fietkau <nbd@nbd.name>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, john@phrozen.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 17, 2021 at 12:25 PM Felix Fietkau <nbd@nbd.name> wrote:

> From: John Crispin <john@phrozen.org>
>
> Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
> GPIOs. Each instance in DT is for a single bank.
>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Excellent and compact driver!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
