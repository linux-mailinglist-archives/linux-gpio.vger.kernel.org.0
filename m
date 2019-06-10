Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 237203B72F
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 16:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390793AbfFJOXU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 10:23:20 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:42564 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390708AbfFJOXU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 10:23:20 -0400
Received: by mail-qt1-f196.google.com with SMTP id s15so10741509qtk.9
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2019 07:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kyt1gkFUXh0ymRm66FYg+aduOK7LX9ifxRJWXh+F5zk=;
        b=H1QVvyx8oEFxT5H2+UZGtCWe7i4Egge2DZC889UbwMsClJs5kJCKkBt4kp6L+3cPdf
         xZlw1bJpa0aMWD7FaZod6fdhyLLzzNQ2WatmlbRi9Xc2DxrQoUekqObvo8U325jbCkIk
         TkV5ZOv4zXEV+CrNl9++JYpECLS2XgBPymyuAZOCYeA6bA5dNUk0VemPOHI2jUsbuQxs
         UCll9NGYwqSh/vcfH4FKIzskM2SZhAdEqYIRjEX1mH5mU5PUFkbgKDKwuhaA6eaRZ/+9
         n+ku5T2rh2tmyIp2cVYOlaH8GbAtMGBctmaKxVpQZ59nR7zQ/15y0aMBUgTJcpgT/UDN
         j74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kyt1gkFUXh0ymRm66FYg+aduOK7LX9ifxRJWXh+F5zk=;
        b=e5sWCY3lBev+9paNf8MuzvNZOqfcFVso2r41RHrVK7+tTFXzzp3dJ41jevhY5IraOq
         tqdcZj7F4Hr8d0f7NMheHkvKnnmyqoOkZQe6wiF/YQW2PMieebDiO9He0JgeiJ2hOkd4
         R1goIC5rs7UV55mncu22G2Lf3aH5XzSl5oMXw4xnAPHYFGvUXVG1zbYi30ryVCB+eDVp
         01SumNPEsKmuDlfWxkMo+GjmoMLHjfgsi4T2Z+nFCRkvV1c2jzpbKM2S5qeFE+Iv9QA9
         VOD1aqIxrgcjb+RzCCvdV9s5ik//73LE6iBkCV/8vS3L20ts3Sf7AHQ8ve5coM2Os/ar
         ePJw==
X-Gm-Message-State: APjAAAUSKaxELUwXvhvJNYid5ZEnTTkJ68KOjOBR3ws9UpAAvlue7SPs
        crPQfZk49tZgBdI3gFWv9khCh8PoLkjPd1xtxURDa0bR
X-Google-Smtp-Source: APXvYqx0uwDgR25sDw86oo3LGmR++J1Q1/6GoGKkEofglwXSEtjAhcbMJd5fM3i0X/iVfcd0DwXdwW225Gb3vnR9xHw=
X-Received: by 2002:ac8:2bb3:: with SMTP id m48mr58492402qtm.218.1560176599278;
 Mon, 10 Jun 2019 07:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <1559927056-12064-1-git-send-email-hancock@sedsystems.ca>
In-Reply-To: <1559927056-12064-1-git-send-email-hancock@sedsystems.ca>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 10 Jun 2019 16:23:13 +0200
Message-ID: <CACRpkdZbKF7Pq+NWNVi-8+f-EBQjVjA5xL3gpP-jEspZy3KyKw@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: xilinx: convert from OF GPIO to standard devm APIs
To:     Robert Hancock <hancock@sedsystems.ca>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 7, 2019 at 7:04 PM Robert Hancock <hancock@sedsystems.ca> wrote:

> This driver was using the OF GPIO helper API, but barely used any of its
> features and it cost more code than it saved. Also, the OF GPIO code is
> now deprecated. Convert it to use a more standard setup and use devm
> APIs for initialization to avoid the need for a remove function.
>
> Our rationale for this change is that we are using the Xilinx GPIO with
> resources injected using the MFD core rather than on the device tree
> itself. Using platform rather than OF-specific resources allows this to
> work for free.
>
> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>

Patch applied with Michal's ACK.

Yours,
Linus Walleij
