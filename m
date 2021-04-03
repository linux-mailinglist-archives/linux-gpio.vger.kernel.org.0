Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B335F35334E
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Apr 2021 11:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232194AbhDCJjo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Apr 2021 05:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232178AbhDCJjo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Apr 2021 05:39:44 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC28DC0613E6
        for <linux-gpio@vger.kernel.org>; Sat,  3 Apr 2021 02:39:41 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id b17so1329673pgh.7
        for <linux-gpio@vger.kernel.org>; Sat, 03 Apr 2021 02:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zMHMdNnT/bTa6NKKHBWkkx3puPLUmXQJL9jDRDODg3Y=;
        b=UEywlDimN8VhjALrFx3Uoi6PYUR+CJ3DXEjGE8Jdi6zZ93Nk2IzoXG049iJW9y+9Ey
         mCSkF0v/QwJsTgiLiNZehmgW+E/ZjqxJQnIdgbqipO/VlNbM093z67P2tPyeONhkrQ0D
         WNIe0+dnE29R0R/nAwA4uNAgkXHcWE7vE6obw/u6GJK6h490OHKEgzyIzLrOBir9k44k
         7MOLDziPfYFXPnOkxlVX01HeGdZOWbcQKIGOKtCfIO1HJU8vxqZxIULkAI9I2RFVkWLn
         Z8NlVqIx9JKhHAS/wE0eEGk+HkposXS8RtcyTl9g+rokZL9W0MmBlcN7uAyzMF32RO2b
         iagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zMHMdNnT/bTa6NKKHBWkkx3puPLUmXQJL9jDRDODg3Y=;
        b=Xfgh7CvAovXsANK867JAJfgVDCDLrJW2svcSDTqtYKRSHGDFk7pcMjUQwDTaFFASs5
         fCPIEJ5aNYXH70fyrArNHG1AmI01nyHWEkVNREtmzh1Znr4FBjA4FrqZu9Xx/N353Agh
         MKgszSbqDHEv/lqMyjGhpj4BknniSxM3BWx7VIxbPHLwzJSJqN8XUBvVVUqZZ/Zl/+/O
         dPcfPr9X+GX5OVzKJl2NAf+2+llDbm+hRBE/68P4UPaMS3jljTfMfcc9bZRVCvXvubPz
         WPUslxCW4kjPp1hj1Y8lRV5KYv6hrfgmLJk6OYpSC5quQrYBLzK12kKzdlzPBfke0e6g
         /ElA==
X-Gm-Message-State: AOAM533qD0tp3Vyk4E397/VRXpYYtzIN4wxjiXFeF83aM+XZWl6j1iCD
        bUZPlYX6tWIfSjuzi0cGRhbKBDuHrOEmNdyqaVQDU7YOSaQonw==
X-Google-Smtp-Source: ABdhPJwvcntphDNsYEYJCzU1zqeDa/E69iVZGm6uS9VpXmpGCCf8zajaocVPtrkbhtwaCGBf9rdq/EyxLEnUScQcAlg=
X-Received: by 2002:a62:e50f:0:b029:214:8e4a:ae46 with SMTP id
 n15-20020a62e50f0000b02902148e4aae46mr15795714pff.73.1617442781227; Sat, 03
 Apr 2021 02:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210223195326.1355245-2-sandberg@mailfence.com> <202102240738.f1R6dsfs-lkp@intel.com>
In-Reply-To: <202102240738.f1R6dsfs-lkp@intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 3 Apr 2021 12:39:24 +0300
Message-ID: <CAHp75Ve0y=U5JDGBjnFyRBRcgUZUt=bnAUMd-mjXa-GRMK3ReQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: driver for the NXP 74HC153 chip
To:     kernel test robot <lkp@intel.com>
Cc:     Mauri Sandberg <sandberg@mailfence.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kbuild-all@lists.01.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 24, 2021 at 2:56 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Mauri,

Mauri, besides kbuild bot complaints, this patch has several major issues:
 - it doesn't use gpio-mux and mux APIs
 - it supports a single mux chip (or similar ones, like 4->2), however
we would like to have something more generic
 - it uses outdated GPIO APIs
 - it doesn't use managed resources API
 - it has traces of legacy platform data (kbuild bot)

Sorry, but NAK from me. Please, reconsider the design, that we may
discuss even without code. When settled, we may have the first
implementations done.

-- 
With Best Regards,
Andy Shevchenko
