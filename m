Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26DAA12025A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 11:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbfLPK0Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 05:26:25 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36539 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbfLPK0Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 05:26:24 -0500
Received: by mail-lj1-f194.google.com with SMTP id r19so6210065ljg.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 02:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OkpVHHKfDIvE++qC7pqWmg/jiaUV0l9IrypFklbrI6o=;
        b=lDL84PL+2Ns4vFAqwLLrdQi1O+3TQ6U/1dl28aR2f5iPN84nonscwhbbksUFjIlS5R
         otbTznmgxLMJaAner5nrpGth72IVvBmT/6uaM4tx+Y+mEEawgORon/elo6UPVH5JvJYb
         Ck2/MV674z0jbmRgEZH0vAlKytoZnH/ItSxaGXx0K213YovI7A4yEtfAGr8qVFC8qILi
         94ezCXOUyfvLoV8f/yzdmpj1qIfvNUfwHHlA4TO3fmxjmrNVgk41krWYbwyb3SMyU9cr
         Nn8qkvnhE3ahvqrWYa02Vf4Ret+ZHDC4hZD4vr81kUyvgcplB6Y5bMnP2WfkMtddC/uN
         iXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OkpVHHKfDIvE++qC7pqWmg/jiaUV0l9IrypFklbrI6o=;
        b=nSXngXK4/qAMInDn215bAXAchDypjM572A8QYx/rH9Z492ocdktwG+tUze41xYG72C
         zkL8qHhCA3I5Y59MX6L9WaPcMK5C6hoEFZVEgeUEPiRgTSf+GHCbd1fRoVh2h2JdPpnf
         8lgmNg0HaZNnRTQMBstBq56oeZgvIpYoTJdfWkLRw3dH+0A7N/UMU9rH/oWHqCTol9t0
         4r2C2aAHJa88CnP0S9WUjGIA3FTKnJx1pNXk3SqIr72wdDSsRmuLeicKuaYV3kvGc50v
         oZlTWW8EHarJCMOCuNqA/NH9DQhkvHptNmcaBI4TqtolLXIaO6o5c6rk9JCYPzgbgy3z
         0gDQ==
X-Gm-Message-State: APjAAAXiTBiIcq7WZIMNXRvmTNDGJLowJhZnPFIBQpvqs3jEOnL6i4AX
        z0BFkqXGkYYp2AxpTaasEMIXah6julfD8BAmimy4dw==
X-Google-Smtp-Source: APXvYqyfCsSztFtNTTzlCe+aXkIxE7g02n2kJDD5isrSGVNYwnEfbfi911iDlZCap4HI8gvXspWAPVC8NvrEdEvcY0s=
X-Received: by 2002:a05:651c:1049:: with SMTP id x9mr18582325ljm.233.1576491982626;
 Mon, 16 Dec 2019 02:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20191215163810.52356-1-hdegoede@redhat.com>
In-Reply-To: <20191215163810.52356-1-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 11:26:10 +0100
Message-ID: <CACRpkdarJ5chDfgc5F=ntzG1pw7kchtzp0Upp+OH9CH6WLnvXw@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/i915/dsi: Control panel and backlight enable
 GPIOs from VBT
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 15, 2019 at 5:38 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Linus, this series starts with the already discussed pinctrl change to
> export the function to unregister a pinctrl-map. We can either merge this
> through drm-intel, or you could pick it up and then provide an immutable
> branch with it for merging into drm-intel-next. Which option do you prefer?

I have created an immutable branch with these changes and pulled it
to my "devel" branch for v5.6:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-pinctrl-unreg-mappings

Please pull this in and put the other patches on top of that.

I had a bit of mess in my subsystems last kernel cycle so I
want to avoid that by strictly including all larger commits
in my trees.

Yours,
Linus Walleij
