Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4C2111C969
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 10:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728546AbfLLJiv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 04:38:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:38664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728329AbfLLJit (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 04:38:49 -0500
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 05FE52173E;
        Thu, 12 Dec 2019 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576143529;
        bh=YiBHRvmzqwP2Wcik2ucd5vLbYHnFu3fPz1cXkn7qxfY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bXrka/lB2G+PKc73Fwbd0Cfp/zQWZGY5Qz1X1NztoqumrJjBf+Yny9ObSeBmb9ww9
         S9BA5Y3M7rBSUEqBtLbgixO3oYaKf0Zpjjyc13hZOounJN5qxo1Rf1FYzih03/V9bU
         mBJoMwttf4ouaDkFIrTRReMO0OyiNLPa44eAGEkk=
Received: by mail-lf1-f41.google.com with SMTP id r14so1174890lfm.5;
        Thu, 12 Dec 2019 01:38:48 -0800 (PST)
X-Gm-Message-State: APjAAAWMtM20YyZmGJFMDMv+0AWY5EccPS0uxzy9OiehGHgX2wjvdN0Y
        fAOT57yiTP55U0oWBcrsRjEJtPbba7HeqKfXkiM=
X-Google-Smtp-Source: APXvYqyu6b08O6ZGMeq8/kKx/orBKXWk5tK9GegZevaZ2Ce3P9wKAHrRq/kEDZ52TNvDve1nfF/peti7vg4C6vQePZ0=
X-Received: by 2002:a05:6512:1dd:: with SMTP id f29mr5132078lfp.106.1576143527223;
 Thu, 12 Dec 2019 01:38:47 -0800 (PST)
MIME-Version: 1.0
References: <20191212092726.41027-1-chenzhou10@huawei.com>
In-Reply-To: <20191212092726.41027-1-chenzhou10@huawei.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 12 Dec 2019 10:38:35 +0100
X-Gmail-Original-Message-ID: <CAJKOXPexCjtPB03kKLzLK+4LdrM1_qNstMa4cJW19OpHsN59eg@mail.gmail.com>
Message-ID: <CAJKOXPexCjtPB03kKLzLK+4LdrM1_qNstMa4cJW19OpHsN59eg@mail.gmail.com>
Subject: Re: [PATCH -next v2] pinctrl: samsung: fix build error without CONFIG_OF_GPIO
To:     Chen Zhou <chenzhou10@huawei.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>, s.nawrocki@samsung.com,
        linux-gpio@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 12 Dec 2019 at 10:30, Chen Zhou <chenzhou10@huawei.com> wrote:
>
> If CONFIG_OF_GPIO is n, build fails:
>
> drivers/pinctrl/samsung/pinctrl-samsung.c: In function samsung_gpiolib_register:
> drivers/pinctrl/samsung/pinctrl-samsung.c:969:5: error: struct gpio_chip has no member named of_node
>    gc->of_node = bank->of_node;
>
> Use #ifdef to guard this.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 2 ++
>  1 file changed, 2 insertions(+)

I was thinking about adding OF_GPIO but I could not trigger such case
as you mention. How can I reproduce this?

Anyway, the select/dependencies in Kconfig should be fixed up -
PINCTRL_SAMSUNG should depend on OF and GPIOLIB.

Best regards,
Krzysztof
