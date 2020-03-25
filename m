Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFC3193416
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2020 00:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbgCYXCH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Mar 2020 19:02:07 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38759 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727384AbgCYXCG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2020 19:02:06 -0400
Received: by mail-lf1-f68.google.com with SMTP id c5so3255415lfp.5
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2020 16:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BhYWNeuI7fxySpW45Kxze00QPvGt6EkBnz4YWCMRr38=;
        b=OpH/8hZQTg2SJikq6biTXo8/bYAy9RmjdvGqmZlTRV2KiX5dw9BrFyEVWY6DgVdUOh
         0vO/66dL7horRhNEjDgdgJPwTyV9MMkTE5UhTxhsUFyXanIrspkrbwp8IqF1pJ6iXl2U
         mHUwamaKdQXgC/T6Y1RSX+Qz09H5nRkqHt4Rt6fq2OEz3G7aI53HRH4nsQ2b9VHdh9JH
         Oo4b4ZYlplhiUGso2Sr+Dd7tmT5AjYI86K0z4RUj3FeckZDawYobat7KQQL7H4RBVU0s
         Z/M61Qqb8q7PxeWcPaY+/eZ9V1xuvzhqWx9OgL7tI8A7cJVCac7b99AFBV4dJg+1FVEq
         AxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BhYWNeuI7fxySpW45Kxze00QPvGt6EkBnz4YWCMRr38=;
        b=s+moQGGBMkr7O+D5rInShUWV/fwHDbkxs8p06qNi6fPSRmmgpgf7lFohhT++mwiSDb
         C9MJzNUkMWZlCLm6LypUAbu7SfZ7rKPhFj/3jBuuJFEHG6HILdP57of4YqBAe7pc84qs
         RaDiUS4Swy2eV3MmyOWR3wgNDDASX2U+8DY1n1uFRIAdpP/NUlCODQ4RUPgBGpaaV9BI
         rgkM5YksSfEpjnIze/i1kyY4qv5Bn026OyZRCJ893Y8Pmvq4Xl0w478k/I7AVtaFVgWP
         21FZC8lcgszlHFPkJOFweCLZYuepsCpgEyyrG+32zN6OUVByqKS8sbBaqf6Lbyc0DVwD
         Ky1w==
X-Gm-Message-State: ANhLgQ1FdIn/RqW7cuY4CiOVQcC96ws/txXiyoF6uAwklxklQ7muAmfi
        KUKL3Y/TGn9whTvmuICDzUEO/WLAyY6T1ODK2kfmcQ==
X-Google-Smtp-Source: ADFU+vtJik8NSp1FnZI4YjNb2Y+iw3oCOKRIyxD47R3rfEGrNA1Ywfe/cEKGAWBVGf9RtW8IvODoCsveb82PZVjsVao=
X-Received: by 2002:ac2:5f7c:: with SMTP id c28mr3528125lfc.4.1585177322363;
 Wed, 25 Mar 2020 16:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <1583780521-45702-1-git-send-email-opendmb@gmail.com>
In-Reply-To: <1583780521-45702-1-git-send-email-opendmb@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Mar 2020 00:01:51 +0100
Message-ID: <CACRpkdZiqT4hOS6bqucW7uG1ZQeijKQ1_OX2n3F8xO_H3y4-xw@mail.gmail.com>
Subject: Re: [PATCH V2] gpio: brcmstb: support gpio-line-names property
To:     Doug Berger <opendmb@gmail.com>
Cc:     Gregory Fong <gregory.0xf0@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 9, 2020 at 8:02 PM Doug Berger <opendmb@gmail.com> wrote:

> The default handling of the gpio-line-names property by the
> gpiolib-of implementation does not work with the multiple
> gpiochip banks per device structure used by the gpio-brcmstb
> driver.
>
> This commit adds driver level support for the device tree
> property so that GPIO lines can be assigned friendly names.
>
> Signed-off-by: Doug Berger <opendmb@gmail.com>

Patch applied with the ACKs!

Yours,
Linus Walleij
