Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38F90393AC9
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 02:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234430AbhE1A62 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 20:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233932AbhE1A61 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 May 2021 20:58:27 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34705C061760
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 17:56:52 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id v5so3137349ljg.12
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 17:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DUgWyOBumw89BDGTv+7X0vdxC7JeU7hCOGrHDiF3VwA=;
        b=BSasaDEaLbIQAzgG1IrhjeTDlHWhNMV9Ajsb72ajXQiKtkmoo4OTX4hdRx/jXFe9lH
         tbpf5Q0hHvwAIkDrX9OnHynDLd5s3Z8+XSnnH9qvkAU+4yOVYyktN0m7fkRoIYnaKRJI
         KzTWxxz9q0+1x/GVWp4Ig53vqH1huvR/cHjdqejfapdGaWwwTqiQBp+UcbEePxYlH1Q7
         5HKEuJkjGfUtGLrS5Op63iNk/NqiKbWZCre1sDGHMWpCpHklhAmDjllKZkwlHQET1k6q
         s6FJeU6fp7L/1WlQtCon2B5zwcVnrrMiEzrrdnVw0Huk5FIfYZB92UnJPC3M6oIqBg2K
         CngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DUgWyOBumw89BDGTv+7X0vdxC7JeU7hCOGrHDiF3VwA=;
        b=AkbGqi66RVBXWMEC/wnJt8eZc1JXlH+vvrZpIQKsbuzaQ/ow0tLX/uxOqBkZuja+OU
         jqJCJjxzpbcuz4BPIcuSC5ICh+LagZINpvXWxsRgP3HdGjbcOv9WERAU8+L+ZzBRY/JP
         Cl6dYDWsp6myIS/hI+X1jfexb5DODF9C6uJEPJ9UbD6n2J+QLxVj1SHX0nW9F9lpVDNr
         Pm+UL9uYdvbblOEeM3CBLIvzD1dJofJs7apE+Xpu2mfbCmPAyXeHh9IP4I49Zkg6g8sZ
         8zG77Tnzn00sZAhf7w21sBMGiu/KkXkVEZtqcV4tpsnlIJowxvcQ6pY5vfrN1+lDCm1U
         LseA==
X-Gm-Message-State: AOAM531ChhZzfstKl8X475G3OY0MmcEi3R+9adztopUjKgrIGWDSGi+6
        AxzpPPnArQsacQj3Jvjww3XmEuZeYFJN73z2xNRI9w==
X-Google-Smtp-Source: ABdhPJwkOKyubRtDMGrbWIPiVD0SnCCFb04nXbS/cSkd+iam3V+/E9XBgUnCx6hyWBnbMftdQo+GIHXCWBc3bzLiQGM=
X-Received: by 2002:a05:651c:1049:: with SMTP id x9mr4489456ljm.467.1622163410555;
 Thu, 27 May 2021 17:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090158.26932-1-iivanov@suse.de>
In-Reply-To: <20210521090158.26932-1-iivanov@suse.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 May 2021 02:56:39 +0200
Message-ID: <CACRpkdYW9KCOOH_FjuPR6o4x41DvSgfmLOw201tssjAOt7q6vw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm2835: Accept fewer than expected IRQs
To:     "Ivan T. Ivanov" <iivanov@suse.de>
Cc:     Phil Elwell <phil@raspberrypi.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 21, 2021 at 11:02 AM Ivan T. Ivanov <iivanov@suse.de> wrote:

> From: Phil Elwell <phil@raspberrypi.com>
>
> The downstream .dts files only request two GPIO IRQs. Truncate the
> array of parent IRQs when irq_of_parse_and_map returns 0.
>
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>

Patch applied.

Yours,
Linus Walleij
