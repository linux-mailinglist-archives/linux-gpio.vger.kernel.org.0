Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A07917E995
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2020 21:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgCIUCD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Mar 2020 16:02:03 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:42165 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbgCIUCD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2020 16:02:03 -0400
Received: by mail-ua1-f67.google.com with SMTP id p2so3794878uao.9;
        Mon, 09 Mar 2020 13:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pTzxYDH2AxvhcoAC/Na4iwhOdxiHwUzqHjcxqLWpuxk=;
        b=GQCEV06Lm4xXvCKBt/YE3GSEpfgS9Y+DsuySxrA/FHkBxV8cXIq+RGg2ipv1u4sZYF
         Y1Niv6stWta6HJWJdBP2pxhMgSPsWIMQzQojVUSke1NPXKNcnAIHPK1BMqY2HAbSuNAI
         Bx8K+OfFMgeBn4tOLISC5hk2R3KD9lw9FFqN7bkDpzAR4qouBJXawHJxL1La34QCRuId
         QTnsRHKb70pRnU6u188Q1EVyhKdMnmg9neZn5tKeMF4p8k5vVen3/ke+M6kpszI3zP9V
         uSdZAvBbvnDqRut4/NG88abbk1/2tEN3dROun3iwv5g37DwLSTZCv+MOrJKrO/jJ6p1i
         zBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pTzxYDH2AxvhcoAC/Na4iwhOdxiHwUzqHjcxqLWpuxk=;
        b=X8tuGyxm0Uwra9FSTMjqjs4bJkOOZt/c7E5jbbjxnnM9l6gwkVsrc8md4LOCib9c+i
         Zr8cBkIbwPkRjII+aC/JX+jduL/oijME/ViyVuYABqdnhexGjBDzfjF43SV3rDXRw10P
         HbbFQmH4l6jpiLdMKSfvmv6zAG+RFyQPLxha4Vpq7beC+gRGlaYunFxY/8binCn+5AHf
         NK4/WPrpfX2creLtVNsRZ4FAUV3eDhdLvBsLh4fdGpkgFnAFNFCkHyj6tPjwytcMSbsR
         E+PlnaRA2D0ZLVUcs2aWCxzsi8EMzl0Fo2XAMg3d2Zi18QOXfxVE2xIZLsaJSZ7jzN8W
         W4KA==
X-Gm-Message-State: ANhLgQ1Mn8smSQ6xuUDmkAE9+5KOWfVMmc6jtNfWDFmYbL93gZ2HrJpV
        4doW1Bdu79LdI2cxOmGnghoKpO32sU+zcFhWcwg=
X-Google-Smtp-Source: ADFU+vvnyhaBj9HB+Vdqccw7wpInLbX76amumParBY6QdTNcO7OLeuGNAM4hdzC1UyzZYxq4D7RMbq+yXovPRruhtjU=
X-Received: by 2002:ab0:471a:: with SMTP id h26mr10219454uac.34.1583784120687;
 Mon, 09 Mar 2020 13:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <1583780521-45702-1-git-send-email-opendmb@gmail.com>
In-Reply-To: <1583780521-45702-1-git-send-email-opendmb@gmail.com>
From:   Gregory Fong <gregory.0xf0@gmail.com>
Date:   Mon, 9 Mar 2020 13:01:34 -0700
Message-ID: <CADtm3G6hwpOneYvwdrjiWHrRzsMmik5w7Y8gOhtJn7FaGMfw_A@mail.gmail.com>
Subject: Re: [PATCH V2] gpio: brcmstb: support gpio-line-names property
To:     Doug Berger <opendmb@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 9, 2020 at 12:02 PM Doug Berger <opendmb@gmail.com> wrote:
>
> The default handling of the gpio-line-names property by the
> gpiolib-of implementation does not work with the multiple
> gpiochip banks per device structure used by the gpio-brcmstb
> driver.
>
> This commit adds driver level support for the device tree
> property so that GPIO lines can be assigned friendly names.
>
> Signed-off-by: Doug Berger <opendmb@gmail.com>

Acked-by: Gregory Fong <gregory.0xf0@gmail.com>
