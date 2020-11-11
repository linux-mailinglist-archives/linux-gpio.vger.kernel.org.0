Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 794C32AF555
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 16:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgKKPqI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 10:46:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbgKKPqH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 10:46:07 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB63C0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 07:46:07 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id z1so1151844plo.12
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 07:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n2O8o1L0UWMgc04p4BtC/Wchl20SQj+qEX7O26ClcP8=;
        b=VWG2fqJcsgxuKrMf8g20wwPqFINIKhr2t7EpI4zPZKIjEl7m3Trv9dPTIAY7CKAd2o
         zwL+brQX9OtUl4tP5m71gBSKLjs3nT2ulM5rC/bwjrYJBYDbICDAA0Gic83Qo22lOYdP
         QxvEWOWCn6tMFCxayjBjSSeEy4vxZ1PHi/vq/lNfYAlVHt8JHrMzKZW9EuqptsN6TEnE
         ZkfkdNVe+AdczovZraK8uuvp7dN/icp9zGVeuTx+NaPHQsuJn796NFYZnPRoy5cpxTzG
         ctHY4rG2PC5nnaPBgpJoXd6wsh2x4nQiZ5Ga3I1UQXDBx/JnRUbeOve8rZOZ5dmPcFOw
         Kogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n2O8o1L0UWMgc04p4BtC/Wchl20SQj+qEX7O26ClcP8=;
        b=rEe3LiktVDlwqbciZ6UyFFkA3Qs8oaPMrudHOhmtbgJMD2QcIpLmCrxZ9PCh+3D09F
         X8frga+GLgXNOw4nDmuXQuuFI4UxItwFj2gDZfZbkshx6t7nJOsOPesIPQ9Dok9Dy/X2
         +Dall3896YAKjddUygA+KoTk1b+bnzvUOnTBY0gyvmF9RMNRmdn8rD6I2r4b8L+gbBo8
         6DN7YiqvkjiqRW0D112CBtcfLCWg/U1fKCxW0hI8bVfFRSC0MyBq3K5+jB8PtFgmRbgx
         6Kndivk7/bc4YZFwtbQPfTMq1Kt2l5HjAcnIrg+UN4O7stBdbtjfDwCnCnWXjBYmTAga
         fhGg==
X-Gm-Message-State: AOAM531ujVptCn04/J3b886RO0BXuAeowUs2x7Skr9t7kaoi6FEDD3q+
        76PG/2XvywhcoXDod7DgJEmV2kRIuY2rocL4YkM=
X-Google-Smtp-Source: ABdhPJy6gDzFCNmZBfwF2mC5G1evbWbvBSD/MePQqilCDIK41WV9umXcjmQ3c6PBo5P8KYpFqdIuoSn+A+0Gg1Sl20k=
X-Received: by 2002:a17:902:6bc8:b029:d6:d9d:f28c with SMTP id
 m8-20020a1709026bc8b02900d60d9df28cmr5922121plt.17.1605109566933; Wed, 11 Nov
 2020 07:46:06 -0800 (PST)
MIME-Version: 1.0
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
 <20201109205332.19592-9-andriy.shevchenko@linux.intel.com> <20201111153907.GE2495@lahna.fi.intel.com>
In-Reply-To: <20201111153907.GE2495@lahna.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 11 Nov 2020 17:46:55 +0200
Message-ID: <CAHp75VcfS7YDC=pEraqGaN1L4YT7EQEq6JHxMkq=Cz4PQPSkbQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/17] gpiolib: Extract gpio_set_debounce_timeout() for
 internal use
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2020 at 5:40 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Mon, Nov 09, 2020 at 10:53:23PM +0200, Andy Shevchenko wrote:

...

> Again I think mode variable is pretty useless here and does not improve
> readability.

You mean something like

    return gpio_set_config_with_argument_optional(desc,
                PIN_CONFIG_INPUT_DEBOUNCE, debounce);

is better?

-- 
With Best Regards,
Andy Shevchenko
