Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 488A6320D0
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2019 23:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfFAVvi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jun 2019 17:51:38 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34941 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfFAVvi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jun 2019 17:51:38 -0400
Received: by mail-lf1-f66.google.com with SMTP id a25so10708648lfg.2
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jun 2019 14:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e/fA2K8PrzB1jzFtKj1KZmk5ZpVS5fL2enH+KYuh69g=;
        b=x/GDyO2XuXoTlcNQ7tm1eIqf60Z4zkayMFYCr625Ajxcy0V1iEi+0ebkkh7mLtVxZp
         n5amR+ciipB8T1uUtj6x/IwcEGekWvOTkv+g/bc4kh2sgbUjpBWkZgE/6mQJwj5uIA0z
         q6Nst+EIdmH8DUO+R5XBH88YcmC7zVTRnXl3XYb7j/4vd4sjBgizUA8ROyMGLJZXzyqx
         JEUEZ1cjEJ8KFSz6iUXuUwQfyK18wxra2QcRNFt18828qAQwuC+4hp8ENWxNl+TaviRb
         tktcmbgXg80yneXcpTBnjLWPj5J8SJ0zmYg6s3Yo/2DBbarNMZxmd8Opk2s62sTrZn2Q
         pcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e/fA2K8PrzB1jzFtKj1KZmk5ZpVS5fL2enH+KYuh69g=;
        b=R07gQcqFvzk1FBw1c9T6XcHH+ch5fdF50CkfvUWqw4UqW4iq3EbdIzGj7tibAYgVEI
         Icdsp1ZHnuuN+IjU9uGvW57ISjhUvJCS5T769tp6RW/r1OWdvKbWa1dFZAfQ49R6PM0Y
         108eUqhYb18llEXJDxAmGaAPWnE6AEVdqrkpcR2Q6igDA5lqg7Pt16DYK5nPUhCMnvXZ
         AYAnZDJoAQfUl6CUmAiki4pkGhP40sw8F81yjL9zC9SCgYe07gxW180IBf6/DE5zVkX8
         EWjC5sWBs4yGnY9oTeKZy2+5/GNv2KCOx8SHU2BPIP3dyi8CXnnwNp8gw0tiGhPjJCnD
         N8yg==
X-Gm-Message-State: APjAAAVwxgdybI/QcJUrxE45Ihopy2rlV0ddNgbkWr8SENlKPcl7XkJQ
        PSMfPfvPc+Hp2cyC1NDoayCXxA3NolhCY/rWvWIAOh8q
X-Google-Smtp-Source: APXvYqyTDBeAsH/4uGxC1VKRgcopM6L6dXSXBV2IoORNAEqX3Y9ZIc3SyQdz7VuJL8gn/qYJqjqyUB90/6bR/8I69qU=
X-Received: by 2002:a19:ae09:: with SMTP id f9mr9531384lfc.60.1559425896564;
 Sat, 01 Jun 2019 14:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190601071218.27958-1-pbrobinson@gmail.com>
In-Reply-To: <20190601071218.27958-1-pbrobinson@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 1 Jun 2019 23:51:25 +0200
Message-ID: <CACRpkdYWCOHeai7JMrC-csZhNTC8wp_AnerDrcJYY=mAZkf84Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Add support for the TI TCA9539
To:     Peter Robinson <pbrobinson@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 1, 2019 at 9:12 AM Peter Robinson <pbrobinson@gmail.com> wrote:

> The TI TCA9539 is a variant of the PCA953x GPIO expander,
> with 16 GPIOs and interrupt functionality.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

I noticed that this compatible string is already in the bindings doc
too!

Patch applied.

Yours,
Linus Walleij
