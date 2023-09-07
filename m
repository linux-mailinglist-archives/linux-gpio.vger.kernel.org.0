Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D17E87978C5
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 18:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244476AbjIGQyq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 12:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244592AbjIGQyo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 12:54:44 -0400
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808A31BF3
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 09:54:13 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7926a450a0aso47866739f.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 09:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105529; x=1694710329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZM5LCrIIZq6Cza2RJhNNmn9rDXfdqmiDRo4rHF5ssg=;
        b=INq4WBnNxj2H4t1eIwPbXet9t0Q+eYO2rD0D60iy/G6YktHybIOveOY+c5HETTz808
         8eGVvhLqsXAAwMvI1QIPrplacCZSTpZ6CznkCvC00C9pHOid/BA+/bfq5frzyvJbOTXx
         ql9q22Ay+w8RNR47PKljQIDKA+L2sMSoIF8MiQweCIB1F2jqWmKAA5EX0eIOcHUk9VbM
         wCszuYbnzJVr2MXqZeqU8CjUdydj1iG0jBTR8AgEkxkc6+VWqMU8UdS4dqmFkoQ6oFMz
         u6T7NyGB0ZUVoQ77ETl0V+8hKwGnbsSe1zqBQP6fxfqSLVgfQ09l5DZWQH2qaKt1lOHV
         rOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694105529; x=1694710329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZM5LCrIIZq6Cza2RJhNNmn9rDXfdqmiDRo4rHF5ssg=;
        b=Pr5+zYmhc7sTgBD5IoK3qFLz+ZtMvEMhZubo1cGAh9q0ZlVD9w7fGqYScUY44SfY7u
         4bUBZFCalpGrJ5qhYWN8HVKv/SADmJuNybcWGt8ebYc59AkVs0mvkDYiIBrugz6dFtZ2
         I1UcuKnTvtIR8XjXwbDIt14/ApL0gSBlWpaj6tk9Sb6PAJh+dTqX5oB6rHF66oLVAO9U
         E+EOvwB7QzdUjPxfYTYmudB/gMe1en6miMBuk2bTp8xnS6mHbz4z5Bw11xUUWeW3YBno
         M7PZBfi0j1uZlhCYdNVHt20c+9B3x59FwyBZ2Cd52/wOBpTNY65BzNAWEV+yRlIFkUx6
         PImg==
X-Gm-Message-State: AOJu0YzzYQcSAko9h1rPVI+A9K+i8uGrGvhavL5reMXkC8Q5kJNaSDUg
        Etcd+1BySUK8VR10ZSv6PnIJeUzY9HtjwHWs7kVwwhPcgLSDJoYr5dY=
X-Google-Smtp-Source: AGHT+IHhj18itEgT7Zkm6inaHN3nE+QPEGLPicrIzqqx/vXBzW0adJyqRztqORI4Xy/4ylPWC4tCJ9Ht9cCQq18uOlw=
X-Received: by 2002:a25:aae3:0:b0:d1a:955f:304d with SMTP id
 t90-20020a25aae3000000b00d1a955f304dmr18305004ybi.64.1694070633444; Thu, 07
 Sep 2023 00:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-7-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-7-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:10:22 +0200
Message-ID: <CACRpkdadcw=E38o=cNWT4fQ_PK0UPifJZdVjuXTw0cjxPAEaKw@mail.gmail.com>
Subject: Re: [PATCH 06/21] gpiolib: provide gpiod_to_device()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_desc is opaque so provide a way for users to retrieve the
> underlying GPIO device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
