Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DA430D715
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Feb 2021 11:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233658AbhBCKLB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Feb 2021 05:11:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233598AbhBCKK5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Feb 2021 05:10:57 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02EAC061573;
        Wed,  3 Feb 2021 02:10:17 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id b145so9541175pfb.4;
        Wed, 03 Feb 2021 02:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DoB57/GdnOhZzAwyihcxZDpe6LyI6oMLXZvxSKgJCaY=;
        b=toIlDrY7Ho0sFEq4JE6cP7fGZ7+Dd2Vf0lqpzflFCt0JbZxwZh5vjPeNWXMUpqp4iP
         qP9NgWs1LCBu/QDeaWTNeEWN07/jqQQvGLn5Gm/s6yvKP5YN4MotmyaOzLdGrXNiwY1E
         Pprtmf7gDDwedysuFPe2QLw3ZF3inf1HDT4WwOtp6xgi7HsS1kIEDm7OcFL3zQedOMA+
         PbsTeyniaD+tKosafaUNA6X5VL3Wi77FiAlVOYDCdZ9W38wmNNomRd74LBqENbDgRrnN
         CSOfJXlMjUiROMPWsmxjmPUWsJPVUPmszjMejc4pVN2KBRc3y2hp2cgt4+f5XLAzi8Ic
         W32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DoB57/GdnOhZzAwyihcxZDpe6LyI6oMLXZvxSKgJCaY=;
        b=JB9p08J+pvR0wzeW8pVekzyefnwVToMw3iXmiaFjqL2lahsQWta18X1dPzv/CBQSbF
         9nCJvWzwHc8wC8VEvh5rkn/EK2juh3dsWcsipQL2z8qplMoVpCHJaRej2m7U9SM5qymH
         pb0SwYzt6T0ZRsyzmzxrhNfGxR6FXAD3MyatD3OEatBgnRE9IxDWYwYFj0Y7/DHXSqtF
         uVcmFZs1nbUvJYxKi0jB0PXdT0NYO4BtcmqqR30gwYL7fTbid5EPtAw/8ObsbEP327hD
         lr7dnQszt/SRdKc0Rdlw00iHoJbDgeRYV0MUL6fIdqenD4axYboVTtYlkfy4j/fVGrPm
         FFaQ==
X-Gm-Message-State: AOAM5333NQ9V5M/nCwQD4B68N0mYOCPa05Y5KxNJRIbk9m3UOQ76Kmb5
        06rl7lthlPwR3achnTIWklYxBNiFZ4oBTV1Gt84=
X-Google-Smtp-Source: ABdhPJz5i7fhk6njS7K7gm5n1HmI0LkS3RTacC99zszmrGRtX8IfrAJ5X996gPIdv34BMeqSIJBFPNceZV8fVUf1OB4=
X-Received: by 2002:a63:e50:: with SMTP id 16mr2824641pgo.74.1612347017178;
 Wed, 03 Feb 2021 02:10:17 -0800 (PST)
MIME-Version: 1.0
References: <20210128153601.153126-1-alban.bedel@aerq.com>
In-Reply-To: <20210128153601.153126-1-alban.bedel@aerq.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 3 Feb 2021 12:10:01 +0200
Message-ID: <CAHp75Ve5t4_ocv0YMsPP2+nnuXvMj74yjhVF01ROGCELxXKGSw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: add support for open drain pins on PCAL6524
To:     Alban Bedel <alban.bedel@aerq.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 28, 2021 at 5:38 PM Alban Bedel <alban.bedel@aerq.com> wrote:
>
> From a quick glance at various datasheet the PCAL6524 seems to be the
> only chip in this familly that support setting the drive mode of

chips
family

> single pins. Other chips either don't support it at all, or can only
> set the drive mode of whole banks, which doesn't map to the GPIO API.
>
> Add a new flag, PCAL6524, to mark chips that have the extra registers
> needed for this feature. Then mark the needed register banks as
> readable and writable, here we don't set OUT_CONF as writable,
> although it is, as we only need to read it. Finally add a function
> that configure the OUT_INDCONF register when the GPIO API set the

configures
sets

> drive mode of the pins.

Can we actually convert the driver to be a pin control for the starter?
Or split it for some chips to be a pin control, while the rest keeps
just being GPIO.
I would like to avoid more complex changes in it until it's properly
converted to the pin control.

-- 
With Best Regards,
Andy Shevchenko
