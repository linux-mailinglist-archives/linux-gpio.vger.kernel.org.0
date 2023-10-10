Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D665E7BFA9D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 14:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbjJJMCQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 08:02:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbjJJMBo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 08:01:44 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D781718
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 05:00:52 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5a7bbcc099fso9533397b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 05:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696939251; x=1697544051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URqL7nDWUnzyuM8apl7Oe6clHcQ+q18wy8Bzu+Hd0z8=;
        b=KZiCpfmApCbJ6HuyB2vfz2w2c0dYAxh7qq5doiDDsLV6B+96ePI90L+RjUmqtF22Xg
         Xg6Xj65l+uXOdWv+50EuYDjvbW2/57k82IgTqMg3eUukh7c2lwUXAd6NSI8sXKb+i+uU
         FEHFJW1NwGbw06hKJmQKQL0OcucL75wEMSRGBCjrxBZAnw0iDKZmKmihdFf5xPzcjhC/
         UuKV1Ob0fI+Sxp9B3kiWYqa23qVtAVsj5JFNBwwFjtUsSBdLyCydvk9OCbqWBgNxoqfG
         8FUsxuL25gshmVrbLMvOnoktX2/dBSYiqtw4aTleq03B3xhg/WDzadU4f0JcSPcxmWdz
         X0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696939251; x=1697544051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URqL7nDWUnzyuM8apl7Oe6clHcQ+q18wy8Bzu+Hd0z8=;
        b=HRt6bnDX8iCCHvSlnsm/PqM+u4ZjQG6Or6StM+i1mTkYyOaAweF2O3rSVUA5DlW47S
         H8bIzSWs67cRyclNDQuAEqgPV9cQj6wxBaX/82DoUMp5g+Ul0/0c05KLVudUPDmZv2AS
         pBGjnHI74vJN1/L6OrWZ6T/j7DFiGx5HSd6P9gNzeXu1M5QaeIYakESbULoXd4NxYONt
         8lbZvkztKCkNebSoaHtTz5COjIUNOrYtBxU/fdYyyIkGINKEJ4he0aQefhLx4FA6lTGF
         c9Y9+M0fnjDO8YJeAJWL/guu3FM5YN3uFG4z8YxCure/2cMg1WIE9LbpUokbtvlCtCcZ
         7bJw==
X-Gm-Message-State: AOJu0YzTCJHKul9H/VJVrEtVN8wWPx+ov9xq+lPAuyT5oYIGB60gRFvD
        RIKjq/zykHhwGGC5NN/b+XSuYxJHDZtE7t8phMLMoQ==
X-Google-Smtp-Source: AGHT+IGo2XtEzZbulptDKQTrpieV3yJduSWeYo0qpafU5hcwHDsxvZ0/86qGfIIJkxSBtmNHxpn/l5w8e1nfId9CER4=
X-Received: by 2002:a81:7309:0:b0:59b:2458:f608 with SMTP id
 o9-20020a817309000000b0059b2458f608mr18960119ywc.30.1696939251412; Tue, 10
 Oct 2023 05:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231005025843.508689-1-takahiro.akashi@linaro.org> <20231005025843.508689-5-takahiro.akashi@linaro.org>
In-Reply-To: <20231005025843.508689-5-takahiro.akashi@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 14:00:40 +0200
Message-ID: <CACRpkdZ+QkZp7_se7vN7i_Nx_c3woT_OzVnj3YHju3mZS+Ku8A@mail.gmail.com>
Subject: Re: [RFC v2 4/5] gpio: add pinctrl based generic gpio driver
To:     AKASHI Takahiro <takahiro.akashi@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     sudeep.holla@arm.com, cristian.marussi@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        Oleksii_Moisieiev@epam.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 5, 2023 at 4:59=E2=80=AFAM AKASHI Takahiro
<takahiro.akashi@linaro.org> wrote:


> Some pin controllers provide not only a method to set up lines but
> also gpio function. With this commit, a new generic gpio driver will
> be provided. It is implemented purely by using pinctrl interfaces.
> One of such pin controllers is Arm's SCMI.
>
> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> ---
> RFC v2 (Oct 5, 2023)

RFC v2 looks very good to me, definitely something that can be merged
as a starting point once the hardware has been tested.

> +static int pin_control_gpio_direction_input(struct gpio_chip *chip,
> +                                           unsigned int offset)
> +{
> +       return pinctrl_gpio_direction_input(chip->gpiodev->base + offset)=
;
> +}
> +
> +static int pin_control_gpio_direction_output(struct gpio_chip *chip,
> +                                            unsigned int offset, int val=
)
> +{
> +       return pinctrl_gpio_direction_output(chip->gpiodev->base + offset=
);
> +}

IIRC Bartosz is working on a patch set getting rid of this kludge having to
call with base + offset in every driver, replacing it with generic calls th=
at
you can just assign in the gpio_chip.

When this gets applied these changes will likely be in place so you will
get rid of this too.

Yours,
Linus Walleij
