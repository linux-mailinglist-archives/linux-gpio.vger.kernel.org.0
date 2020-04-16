Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEEE61ABA05
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 09:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439372AbgDPHet (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 03:34:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2439363AbgDPHes (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 03:34:48 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD753C061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 00:34:47 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id w145so4822208lff.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 00:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nrt+67omyziFxx3WaLfBQr2iyIgq4drGGzCS11Pkerg=;
        b=mSND34R/NPjH0H/0avQv/GDBtGeBVrz4jiUZ6dKhw825DHjKKCGbhVeb98eNBh/1lP
         42lWNFlMmYMoKFMDcgAS5HYu0ytaxjo2hlH251n2ufZlWDm4zyr9CqoU+evd2rbh55m0
         Bj+/Z9DnPuhSPPX7cfwtO3NuMO0hxhcKs+1slZoPxOAITSw/+bykBUvaYrhXqo5KGg86
         GAnKhe1e8G/lLe1Y9FhUsV1vUBXGC7v2Vi8ELIqu6t4G+ury5THipSvuC5sMbQgKxUBg
         CWZTFGymLDxL79/bVdS7NcoFQHa9ypZTFSwI+ipiJ88bRe1uopT0bJQE2I7RPkxNaCIE
         p54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nrt+67omyziFxx3WaLfBQr2iyIgq4drGGzCS11Pkerg=;
        b=aRBRwhBkXkf/8hWQ0GOwxqJwywuAYC69JZCctn3qD+ro+3DcYLlvyf4nEm/BJPh/n4
         iRX8C4hhDAXB8VMCVWEyvGZ4/6V2QmoI3M12aVqJ8X18wdrCuLP0zwGGxOe9+c6ALUO9
         Y0km+CkfR19whjySCw2zuWZ/1wJNdkzscTzC3Wx+qLcqGVmv4/SGApDeHoaRCiCwlili
         IkBR7HhXm3G0UrDWBw8NRmJjmkviQyvcrMBcZgW6zZb7rMr5E2LcMux/xnfKyliPLgLV
         22HXfwohmSANDXD1u/Msj6Yu6LptYzvhR5Tu0Ljl4qwLm63njx+oGRUTxxTyFSNUQQOr
         o5Hg==
X-Gm-Message-State: AGi0PubLTE5VCb/cWAiRczDfe03SK9AG+6/1SvTrHRKULpsCIZapCkcO
        97Pg4w3uwXTvcLxhhbSTA7RVsAL51twCmBNuvX2qOw==
X-Google-Smtp-Source: APiQypLhh2T+qM89diZg7iMorNOnJb7adMEVgj8G7IAhkT17uvQA0//jXFY3D/uUpCsjMQeXE4oyUGLHirCOJZBUgdk=
X-Received: by 2002:ac2:4a9d:: with SMTP id l29mr4969920lfp.4.1587022486345;
 Thu, 16 Apr 2020 00:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200325103956.109284-1-hdegoede@redhat.com> <20200325103956.109284-2-hdegoede@redhat.com>
In-Reply-To: <20200325103956.109284-2-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 09:34:35 +0200
Message-ID: <CACRpkdYz5224+whjXW_Xmv+usn_kBxuZW6+1Vb0z8RQsYeZ9cA@mail.gmail.com>
Subject: Re: [PATCH resend] gpiolib: acpi: Add missing __init(const) markers
 to initcall-s
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 25, 2020 at 11:40 AM Hans de Goede <hdegoede@redhat.com> wrote:

> The gpiolib ACPI code uses 2 initcall-s and the called function
> (and used DMI table) is missing __init(const) markers.
>
> This commit fixes this freeing up some extra memory once the kernel
> has completed booting.
>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Patch applied.

Yours,
Linus Walleij
