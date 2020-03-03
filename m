Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C031177636
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 13:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727726AbgCCMkY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Mar 2020 07:40:24 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33176 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727552AbgCCMkY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Mar 2020 07:40:24 -0500
Received: by mail-lj1-f196.google.com with SMTP id f13so3384936ljp.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Mar 2020 04:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zN8pyMGel5CV8Q9nKyqGu12Vu+yCXPWrrYbbRn/lVPU=;
        b=HwKCTO1rlByKTsfERL1oZ8pKPr5JopkC3uXIMLMJIlq5BKoyM0rhAXFSdGParUncGI
         gV7KLS2Ud8c3rgLcmIKl/JwbANUHsWH7ieo6Hf8lgu6sYMT4Gtij+ZyzjmfVPH9msRvu
         1zn/Nma3BCSgTDOXXliErlBP4mJgVTqAknqNjZoddALJjuSsgq804W9iLhlz0YdeWtii
         y7FT0h7C76rVSI7Dy4lvwije9Pbu2idIGncUJmoiAtlVd07EvvtevxoMQZjmz9W36fce
         5GUVEc3hD5Ne8dCmXdKLJ8T4cdJjcLyedUo91UsS6oNA3xb3pDYu1DG3MhVV8CW4PlPq
         1Aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zN8pyMGel5CV8Q9nKyqGu12Vu+yCXPWrrYbbRn/lVPU=;
        b=ominNIyMDim4HgyJc/TBqQRAJlILqd0CbZzWIrDrAdOny4ON62vXeNoMqwKZTdoRLJ
         YKYYeG5aBb70BC7lSkwt2M2UcYlhGOmNqHZLhIOxh/fU/ZgwBBPhhUrc2gOhqe60FPMl
         Ds2OVmp7fv7Hy1fMFjAgLwEdBhlh+oeyW5N0sFTFhqvireDBuQLNmmyLpBvpEaDTK7FM
         2tdEPNOPm7i4jzJwXnHMnUC0QFyVrIntAL2cKgXWEOIh4l/LuJ9/aBNirhw0M930yxBF
         Ki9RFLXJ5S1moLBb9mit1eixLdLHygHoRB6VerQzVdXZNocRGHPPDBwJSBdBI/fggyEv
         wxoA==
X-Gm-Message-State: ANhLgQ2AlqZ/qjFfa1pND65JosVtg+BYa1fmawzCceEg0lq1Knh+THk2
        S/xr8Hp61IdTbOufSO+SrjLo13m6BslMpzK6YVgnNA==
X-Google-Smtp-Source: ADFU+vvSSKGCj604RxzVxw0FhFpXHGXXjroDOMjzjjm8qVvTi5OQFjHlZtkT1au8AJ7UHhJzsPJpENZWs84jZE3Hfxk=
X-Received: by 2002:a05:651c:39b:: with SMTP id e27mr2176389ljp.99.1583239222137;
 Tue, 03 Mar 2020 04:40:22 -0800 (PST)
MIME-Version: 1.0
References: <1583124056-94785-1-git-send-email-christianshewitt@gmail.com>
In-Reply-To: <1583124056-94785-1-git-send-email-christianshewitt@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 3 Mar 2020 13:40:11 +0100
Message-ID: <CACRpkdZ4+-26Q01nx9iFJLUSCfM0Cuh6U8=gdtP=63xMd+2jqA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: add tsin pinctrl for meson gxbb/gxl/gxm
To:     Christian Hewitt <christianshewitt@gmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Igor Vavro <afl2001@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 2, 2020 at 5:41 AM Christian Hewitt
<christianshewitt@gmail.com> wrote:

> From: Igor Vavro <afl2001@gmail.com>
>
> Add the tsin pinctrl definitions needed for integrated DVB hardware
> support on Meson GXBB/GXL/GXM boards.
>
> Signed-off-by: Igor Vavro <afl2001@gmail.com>
> [updated commit message]
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

Can I get Martin and/or Neil to review this?

Yours,
Linus Walleij
