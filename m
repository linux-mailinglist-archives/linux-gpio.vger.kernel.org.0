Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDB0107295
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 13:59:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbfKVM7s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 07:59:48 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44607 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbfKVM7s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 07:59:48 -0500
Received: by mail-lf1-f66.google.com with SMTP id v201so4398448lfa.11
        for <linux-gpio@vger.kernel.org>; Fri, 22 Nov 2019 04:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q8dmnxZ8Ub8Bxc2H8I3mPfzbqfpB7OPPdHaZygHcHFE=;
        b=DaPJMLk8AL1aq2ByFGb2IWSuYlXpiez43Oi25BeBN7wROv9RgVJ815FEIM9S8LtBJZ
         UtonKNOJCNB+rDeRCfVWO5NE1S5bLZRNGDZx5UjRfDgZm2YJuJxWT3yNlrS0LoHq2F9k
         VmT47cxRT8H/xf7AvyCN4gT1bdBoBYAV65OH4MLbzwZBnPytv2hJUwu3qpR9fvPqCcFS
         42q0IyZgsuI1qoYCQAr18hOe6tsMEwOYuN6ucIdogf/4horoUpS9E6Gyl91z//4QGT81
         7TaGOV1qU8P3so2gBU0fMgkq3aA5Sjpa17HQ6ejQ77o4kRSxZAXUcPe5NBsEVnvbzrEy
         lyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q8dmnxZ8Ub8Bxc2H8I3mPfzbqfpB7OPPdHaZygHcHFE=;
        b=dvMZ7B6nkXmhaaAfXB6LZ/2kwtrb1bfRGxAAThjBtfcNFuwc+znVXahqTUgol0L8op
         XmODzm6fZaJxNosdNnSMXXfra2Arq6fU/u33UMbH7qq84ZiRXuX/ntThbpiUnSruvHx9
         BAAo8wWp3yE3ZP1GamYGv58xk3KMbIcSRZvgSvUn8sk1/6XlrTut3e12S6Ift8QYfqhd
         924ovj3jIhKWho2+qnvmSihCxL4Bh72cQV4q6YW4MCV2klM2E2pyRaQxMphBuATAOier
         R+mIKtsjsFV90D9UHYrzjo64PubJ0UpQnkI+YUeMd4iLU6R9Q8fqNqqnAizh3ynBtYKC
         W1eA==
X-Gm-Message-State: APjAAAUFu9WogtLRxYrlenXgGBi2XKb3Zosgp52UBcWh6ACd6nOt8mqD
        X6own4jcbzITxhFdfhFpP25IdZsCBMoJTZjBX/gyYw==
X-Google-Smtp-Source: APXvYqwYz+6QGdIRe/6VX6sUO09vd4ONwLVaGPGso7wwY07jjid5xDn5gxKiF4dN+YxhEi01937w3jc/iLYs/k5FSsM=
X-Received: by 2002:ac2:5b86:: with SMTP id o6mr11970188lfn.44.1574427586437;
 Fri, 22 Nov 2019 04:59:46 -0800 (PST)
MIME-Version: 1.0
References: <20191122034702.58563-1-dwlsalmeida@gmail.com>
In-Reply-To: <20191122034702.58563-1-dwlsalmeida@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Nov 2019 13:59:33 +0100
Message-ID: <CACRpkdbaDEmZ4JCnWGinVVjzbVB=efTjMSTa+mrzuuaK_sCqmw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: driver.rst: Fix warnings
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 22, 2019 at 4:55 AM Daniel W. S. Almeida
<dwlsalmeida@gmail.com> wrote:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
>
> Fix warnings due to incorrect rst markup. Also improved the presentation
> a little without changing the underlying content.
>
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Thanks a lot, patch applied!

Yours,
Linus Walleij
