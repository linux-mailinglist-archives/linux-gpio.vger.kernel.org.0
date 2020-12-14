Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 730342D9565
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 10:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731599AbgLNJku (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 04:40:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731293AbgLNJku (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 04:40:50 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B1ACC0613D6;
        Mon, 14 Dec 2020 01:40:10 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id l207so18572064oib.4;
        Mon, 14 Dec 2020 01:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fqzM7e75UJFJjd3gnYlao0ic5zl7gtQUCIPOWPs96Ww=;
        b=OkWVeO8TRWXdf1hoWatNgy9+nYBfbN/r+HTm6Z7zBn4HQYbhWJJPF5YjNH8ti+tGLM
         WtcswV8KtWzaHZKgpXEwMhQpN1e9Oc59jT3oh/jIBqYGj+XWEO3fByV+lNGlon6jyLS/
         jtE467MahuKhATMxQlqHSk5RjdeDLGbdGDAz7hkTx9XrWi4t1b5g1Vt/tNmHL8fF9wBU
         hsv4o8xZtOmCmTfxxr34Rmlfvt4jGwGhc1HFffD48/7RF4b2PWGWDa1mtyD3Hw6au+vz
         NiIkvZp4v8XIrJxWv3fdpBQYbRqJrLOZqdg2VExk2U8YYWWBlNljWpXB/l8pU5yiKTMs
         3GrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fqzM7e75UJFJjd3gnYlao0ic5zl7gtQUCIPOWPs96Ww=;
        b=iTpkDHuQk16NnJWdnfcf4ZLIRo//3XY8Egf0vwVN/a+R8XWmwSB3cWBY1Ww4ktVjOQ
         up5S8FO2UqqqX3R9BIOtYnz+nqCO+hCZ9bzl3zsLE10HvEIAZ9tbO5q8PukFrhU+yz2C
         OVTH0guUre2alQ0y8ZhP8eVB9edoaou4Si7kYrs8WV43xWsHy4xxB0aLeCvND+/PstNy
         zvm/kkchj4DtarDCP+uhKAIWObUur09x6VMH6rD+wSp83d3gjUyEXgMch07rP7YSFpYA
         ZtMWQTssvUQJBGYi7lOBWh78mx7lKlLpcGzfCJvOT62lAEZOMRTKayArrv6I1JoqyZKF
         WH1g==
X-Gm-Message-State: AOAM530wHiG06P+F34ZCAPLM0kmxp9LycwMipxajC0wo2DnW02UDuqH7
        GIcoH8I3sDKvo4b0fls5IdQV8ElZ8r81Cfqfr1A=
X-Google-Smtp-Source: ABdhPJyQx9ElRrEpYfu6YbyoM1UD/VmFNB/bMFmoavOcrHCFhmWvWa8WBDfsHoHEGu1WPZ8oql6XZd5h4Gp0AI9aG2s=
X-Received: by 2002:aca:5a86:: with SMTP id o128mr17717137oib.23.1607938809521;
 Mon, 14 Dec 2020 01:40:09 -0800 (PST)
MIME-Version: 1.0
References: <20201213161721.6514-1-sergio.paracuellos@gmail.com> <CACRpkdaAd-wJuqspYTuj4RGTyJgobX+6j=5ZWWSCtdLLMnPoYw@mail.gmail.com>
In-Reply-To: <CACRpkdaAd-wJuqspYTuj4RGTyJgobX+6j=5ZWWSCtdLLMnPoYw@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Mon, 14 Dec 2020 10:39:58 +0100
Message-ID: <CAMhs-H8HKU0Rw3tpnrEUie7S42pq5y8uhDqjSiJBLqAkMUQ4UA@mail.gmail.com>
Subject: Re: [PATCH 0/8] pinctrl: ralink: rt2880: Some minimal clean ups
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jason Yan <yanaijie@huawei.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 14, 2020 at 10:02 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sun, Dec 13, 2020 at 5:17 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
>
> > After this driver was moved from staging into pinctrl subsytems
> > some reviews for bindigns and driver itself comes from Ron Herring
> > and Dan Carpenter. Get rid of all the comments to properly be in
> > a good shape before merge window.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> If Greg wants he can queue them last minute. Else I'll apply these
> after the merge window, no big deal.

Thanks, and sorry for the last minute.

>
> Yours,
> Linus Walleij

Best regards,
    Sergio Paracuellos
