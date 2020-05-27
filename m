Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 408F61E4429
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 15:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388654AbgE0Npm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 09:45:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388544AbgE0Npl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 09:45:41 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00317C08C5C1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 06:45:39 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z22so14537914lfd.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 06:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pqMjF481/emegOTyAnp90i2QSPi+4HPq/HRpDph3sd4=;
        b=cEtxG1QBb6k0/9pivnXsIM4fxxgTmO6eKy3cb4jjp5+kQNfHVlksx1KW++A7tdPXNv
         oY2Ob0P9vNNprE6p4NGP04bu/InKQ/EF4F2+wJwW+oY9E8YyJqJNZGtPMuzc5qLL0HWI
         fbhtYM7PcCz7DfVylsOzqby5Qs3IHhHLLbl9blKfUGBSf4zaaAgjnl5o0dbVSJ4DvPoW
         Lx+VZEycnhRAGhdVQAj29L9RY0uZ6YY2m8X2b2LqnnTUPWNtVuoZ+MHCVqwRrOEjYOq/
         EKnUL6kl2azL30dBaSZuMa/KxZcpN6UCJO8YV+KqgmxgC4f8GArCvy88KgPw8b2F4xLC
         ixNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pqMjF481/emegOTyAnp90i2QSPi+4HPq/HRpDph3sd4=;
        b=N0FdywudhpbSCK2zIoVH6AhKrde6anfJhhCiQSWeIyqCVDwPBwsdXH9q6dhQbo/kSf
         2AfMYM+18OjXOnoQA1fgEb0ndFhQ/Sl0Qn5yY/0LtcCEDjVpuxz0QkmdKky8qOE6A6sI
         JUXVrAk+DFykwD2wLz9fN/o2W3gboJ8B2NOPl3IFdKBFab3jf/8k4RuQZTUygB+Ttju2
         q6bmTBS/odPX1v3aFQgw8rr5FL/x+5NcHP/WhgHEukUcacHAy1ecvQoLzl0fz1ZOtoNW
         lBo/LFvLm4X+CoGSbgdCk//wUnowjuA5tozBOqfn4cLF7xxSwEhV7EVeC5nztQ8WSoAz
         4dyQ==
X-Gm-Message-State: AOAM531CXX/KBcwQwSWY3cPiGyw26HhckcAMxRwAHrAqniEWge4uxzQb
        13DcYWQgjowGPsjMm+ExaPeWfwGjTgi5h/lLpQrbHQ==
X-Google-Smtp-Source: ABdhPJywnRjyy63BmYPCVd6xtABhxO8rvnbtGtftY9/L9Axjxr/II+eDgYpm5vNmJPSCVWS3wWgZuzCOQirdIHM52xc=
X-Received: by 2002:ac2:5473:: with SMTP id e19mr3147605lfn.21.1590587138395;
 Wed, 27 May 2020 06:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200513141134.25819-1-lars.povlsen@microchip.com>
 <20200513141134.25819-2-lars.povlsen@microchip.com> <CACRpkdZa7OM3bqB+zRprEQ3M4m9hG3uPCoYxrdH_O=oxD8zi8Q@mail.gmail.com>
 <87pnb1nf2j.fsf@soft-dev15.microsemi.net> <CACRpkdYesD9sRQZXQNEaBY2Ouu3bjKKGWpRtU-Lpa4AcjyPwXw@mail.gmail.com>
 <87r1v8oz9f.fsf@soft-dev15.microsemi.net> <CACRpkdaJvaqPptPD-A1DriVgBOZGZ4Qf0UsbsjG39ptx6bSJKg@mail.gmail.com>
 <87pnappzun.fsf@soft-dev15.microsemi.net>
In-Reply-To: <87pnappzun.fsf@soft-dev15.microsemi.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 May 2020 15:45:27 +0200
Message-ID: <CACRpkdbfNPWKDU5zDaKT0kvJhCpL3X=jvTpLpicm1yMD5brA8Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add bindings for mscc,ocelot-sgpio
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 27, 2020 at 10:05 AM Lars Povlsen
<lars.povlsen@microchip.com> wrote:

> The only issue is that the gpios on the same "port" have restrictions on
> their status - they can only be enabled "all" or "none" for gpios that
> map to the same port. F.ex. gpio0, gpio32, gpio64 and gpio96 must all be
> enabled or disabled because at the hardware level you control the
> _port_.

This is fairly common. For example that an entire port/block share
a clock.

> But as I noted earlier, that could just be the driver enforcing
> this.

Yeps.

Yours,
Linus Walleij
