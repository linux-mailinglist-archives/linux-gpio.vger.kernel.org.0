Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79993120260
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 11:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbfLPK1w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 05:27:52 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42020 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727226AbfLPK1w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 05:27:52 -0500
Received: by mail-lj1-f195.google.com with SMTP id e28so6167698ljo.9
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 02:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kc8cYBIPzK7WSX6Dhpknsv+Az7sG/90zzv4gmeMoX/I=;
        b=W8eY0lMy6Qgx6i4PCyCCiBvKfrdmAknD/ElHqjjw1MmaCLGGVpfqimMzwD1KrZptEq
         SmGOOMB6K3EOysXDm1NJibNn3lksuBlHSOBZrz7e9YSXZZ0/0O6PP09e6gPdiqPt3m5B
         Mzcdx5+SQBHVInfd1/jdFHaDUeTp0P1+OMJdM1fjj5O8gEMcfmVDBZX0mnqwtI0FHoC+
         +JUpPJrkD3KtCHDJhkPV8xNvd5tGBAAQXPgmTaEpRRoIKPhM13zRhxUl2XeCnablcB1K
         ZJsSS4yXSWQpyFNu04ukz20OTdBlqcQ4In2zbgGsTFzFdFnwdgDL7N3EYLh7dEwVzQDp
         aAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kc8cYBIPzK7WSX6Dhpknsv+Az7sG/90zzv4gmeMoX/I=;
        b=hC9GFG/MZebKaQhRHQN1+N8gshCkM/BGG6Rgwn07jVFcA0/dsDVPyQtweDNtj+bSHA
         sh6qirey4TLQoG0x2+KQVK+0oZ3u6ttlFYm8kmQtFNz8VagNRx26T7x+QAGHE9/059Yk
         fcYdvklXNcEX4vAqZ9/x1MLEDBMUXRjkxblY7OzthPQkEdbnRHdAUBA8biG0SPE1+9UX
         5CjnxcPZudD0r69GtMuQcxga28hrPU+GLigmXCZpQp5gqwP7krW8tRFk9WhJ8aB1rs/s
         LKydPyz8IsJ/rsanlYHFJJszzJ9oOcHqtxTQmhRq4HM8ml2So/HqO/r/2Pd2Hb8cZYR1
         vsjA==
X-Gm-Message-State: APjAAAWcPh52YJ2y4bQyF0bqBL1HI8dQ6tWIfAv1Z0oq0m9eHgUJVPGi
        BiZzO0VXw62iEtWArUrufAb2OK9ltO1ge+2Zn8aKFw==
X-Google-Smtp-Source: APXvYqxyqyrkWKlQ1gXsP1WttRxjmUxJOJGIdWOtatnGZNr2dHpk3W2tQ6LrXKWaSo/Xkh46gNIkzci0Gfo9VddG5bc=
X-Received: by 2002:a2e:8045:: with SMTP id p5mr18792305ljg.251.1576492069993;
 Mon, 16 Dec 2019 02:27:49 -0800 (PST)
MIME-Version: 1.0
References: <20191215163810.52356-1-hdegoede@redhat.com> <20191215163810.52356-3-hdegoede@redhat.com>
In-Reply-To: <20191215163810.52356-3-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 11:27:38 +0100
Message-ID: <CACRpkdYWi5dX8jRBoJmrA3Mrig-JUKw+qq5gth2veY3EyUALqQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/i915/dsi: Move poking of panel-enable GPIO to intel_dsi_vbt.c
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

> On some older devices (BYT, CHT) which may use v2 VBT MIPI-sequences,
> we need to manually control the panel enable GPIO as v2 sequences do
> not do this.
>
> So far we have been carrying the code to do this on BYT/CHT devices
> with a Crystal Cove PMIC in vlv_dsi.c, but as this really is a shortcoming
> of the VBT MIPI-sequences, intel_dsi_vbt.c is a better place for this,
> so move it there.
>
> This is a preparation patch for adding panel-enable and backlight-enable
> GPIO support for BYT devices where instead of the PMIC the SoC is used
> for backlight control.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

The kernel looks prettier after than before and it seems correct so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
