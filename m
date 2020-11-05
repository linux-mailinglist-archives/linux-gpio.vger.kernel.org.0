Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF51E2A7BDA
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 11:31:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgKEKbB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 05:31:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgKEKbB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 05:31:01 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C64A7C0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 02:31:00 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id 23so1014797ljv.7
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 02:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+STEvDWSPpyjXbxWzeCVl3ZLCJ/8rAlbhYThKp235O4=;
        b=erYe7fdN1ndaO1KUQS7t7lI4ArGIXBL+GaJQrta92aoZ0/ui/NvpxpZEEnP7Fzr7lg
         ArY0kb9gDg4DOMQqhZw82hOJGOZkpM3uua61p6GO70zejPk67kqT7z9nOcbJf1YBdCCJ
         taXE3Ai+IvWFOCEx1tHBmO+5GcwOfZfucVSExaCDT5MXJemJMJSy18puPC8/so3jYyV4
         2H/qSw/aHBtJaN7m7+SQVNKOKeF5zbIcITAbUuGJz+leOpPHhOKgpuRRM4mXk+6K2Hi4
         MOncymitTCM65Hm4pfmsyttYhTMgmxTAGZXiIaT7+YSrBzKKbSpghKA9FeswZR+5TVi1
         E5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+STEvDWSPpyjXbxWzeCVl3ZLCJ/8rAlbhYThKp235O4=;
        b=YB/ImUpv+duzdpUA9r98+GpW3G7jgW06lBDO2vD7qfy7mKMKRRr4Ib31p3QJInL5mT
         lukOcbnhMy0sa4Pi+d0wCsOObWFaMVdzy9h7CeF0+1h+5hMrIeQpI9JzmZ1mvjYrzaQW
         Xdz65j0m+3k3hynNKmuh7xFU19fi58MWgf6RomlgM9yhRtSoirtc/N+ODmEWhx8Xjbld
         D3b7kWHFrrTptbbbAhaI0DVhPP1yqBJ9ywzPSRkFz8FPv2zG9Pte+rPKwSqAUeD88FlJ
         l6thD9G7fbwVr3p6hdCi52tZG6TNRoodFbYHjoX6j52rBVZxJPp4Tikd+ltAV6DSVhbJ
         RG2w==
X-Gm-Message-State: AOAM533rXpoFZpkVGln9QzXUw8Gog/ij4/+CIBx3h5OUrCsnG3ZymbFl
        fqIChKeCYtgei2yprUiuMxjl7PZZXzOgXkcQDhfyQQ==
X-Google-Smtp-Source: ABdhPJx7ijVKse7Mg3HaGdmL9BG11JdZiJJUBsaP6nOLbDWBOtEauIzECLSCLM7Qze1qaRXYP5Vi/ZPTvdXCuU5rQY8=
X-Received: by 2002:a2e:80d2:: with SMTP id r18mr691108ljg.286.1604572259320;
 Thu, 05 Nov 2020 02:30:59 -0800 (PST)
MIME-Version: 1.0
References: <20201009180856.4738-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdYaOnxunieAGTvr5HVvf2BhTgzMFECpSVj5urjtUorj2w@mail.gmail.com> <2f13a7e2-75b7-4269-8079-2fd85c36bb68@cesnet.cz>
In-Reply-To: <2f13a7e2-75b7-4269-8079-2fd85c36bb68@cesnet.cz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 11:30:48 +0100
Message-ID: <CACRpkdZwqqaKYnTVJ+wfVHp5U1fdcsXH6pCxgNqPmBJ3=9wu6Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: mcp23s08: Use full chunk of memory for
 regmap configuration
To:     =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 26, 2020 at 5:40 PM Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz> wr=
ote:

> > Patches applied, fixed the extra typos in the process,
> > thanks!
>
> Hi Linus,
> are these patches already pushed? I've checked the gpio and pinctrl trees=
,
> and I don't think you've pushed them.
>
> Anyway, they fix a boot-time oops with 5.9.0 for me, so:
>
> Tested-by: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>

I applied them as non-critical fixes but now I will move them
to fixes, add your tested-by and merge ASAP.

Yours,
Linus Walleij
