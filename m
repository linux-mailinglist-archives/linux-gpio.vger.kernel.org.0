Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83348777341
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 10:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233231AbjHJIp3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 04:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbjHJIp3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 04:45:29 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1DB1BFA
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:45:28 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-58969d4f1b6so8576307b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691657128; x=1692261928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Sobyis6t/R9sKnFYmx7TDgwyuIiNudrJSBXTDXZMwo=;
        b=VlZuVlbUmONl2nkJGvkahoLFEwSHucZ7BnipcqcOmM4JqUT9j+0kxaoyxQypkb+CQv
         eR/J7+BNoab/L0FjYtSTd0l5XtJO3LY9J0HBgN4xMg0nuBKJ3zqmt68qbyql95NgP84t
         dFhQJ1Wa7KxdzjlSqUkt8EaGH4ZJEKTFD+UPZyBTc36BZncX7n7yqfYD3+Mq4DWHK+kg
         h10v6R4UEdvLXOivR+kcov0UFC+HaKdFhJSu5rAWlzPAzP1nBRptSZ5z/ciK6ZaTjOKU
         ujvPl5ImgIkLo774dRDRh25HsCksDGQKCxPUJVgi9TNYhhShpACTwGuIN5rVshdzt8Ha
         TKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691657128; x=1692261928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Sobyis6t/R9sKnFYmx7TDgwyuIiNudrJSBXTDXZMwo=;
        b=hfhVpCM4PFc29R7+1zFWXTlTVE5vPbb+qZeqwJ6ThmWZIPB1qjoCiLYTqs2VBw3VG4
         wXFWJDWSPFTeyHWjJnGKfB684p6xYGTZtzZZqGftyD29PVtvcIAhHWVg/EAR2EAHUbWw
         BQi/npHnEnT8+mviP0X6I9bHD6XpXASY/wCCm3r5Ual/U5m92LhC41YVDo2k/G0Yu4RM
         Wjy2yjUjlPTof2rX2qT66x9trA33n1RP750GHmDjrd46PMBylI7oDZJDIBUK+6cK9RMa
         q5VCvtRYVNar5U8Fu7QhgNeZ3dpmbXKVSC6MqhGJ2Zw2I0hQzoa4Kc8CkYdATohj20GG
         quAg==
X-Gm-Message-State: AOJu0YyLNSi9VOPKR2gc4tP6SbOxEU5F9joPKmlRL+MnCBa+wgNOEX4h
        CDqfnOem/VqOt2H0Y6kTnAUDvg3itINFEggVTLc1rw==
X-Google-Smtp-Source: AGHT+IHQ1unvxDGigiQbvzdOZNWO1ksYbPirN6hLyDuLLbiH/nFAkQfiYa6HvqP4XciYPDM6NdMAgbOt4WeJSWmCYog=
X-Received: by 2002:a5b:646:0:b0:d62:b8f5:1041 with SMTP id
 o6-20020a5b0646000000b00d62b8f51041mr1686017ybq.18.1691657127829; Thu, 10 Aug
 2023 01:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdY02BbfkxSbyb5U+B29CYyNrhxtSADinYmYJ+ZCM04bjQ@mail.gmail.com>
 <20230809071738.2359532-1-mwalle@kernel.org>
In-Reply-To: <20230809071738.2359532-1-mwalle@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Aug 2023 10:45:16 +0200
Message-ID: <CACRpkdbYZRG-KrURmzxrU4j6iPUkSZ=zTkuvMounGF3XqvQ1mw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] gpio: ds4520: Add ADI DS4520 GPIO Expander Support
To:     Michael Walle <mwalle@kernel.org>
Cc:     brgl@bgdev.pl, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, okan.sahin@analog.com,
        robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 9, 2023 at 9:19=E2=80=AFAM Michael Walle <mwalle@kernel.org> wr=
ote:
> > On Thu, Jul 27, 2023 at 11:55=3DE2=3D80=3DAFAM Okan Sahin <okan.sahin@a=
nalog.com>=3D
> >  wrote:
> >
> >> The DS4520 is a 9-bit nonvolatile (NV) I/O expander.
> >> It offers users a digitally programmable alternative
> >> to hardware jumpers and mechanical switches that are
> >> being used to control digital logic node.
> >>
> >> Signed-off-by: Okan Sahin <okan.sahin@analog.com>
> >
> > Too late to add review tags but just pointing out what a beauty
> > this driver is when using regmap GPIO. Total success!
>
> Mh somehow I'm always missing consumers of regmap GPIO.
>
> Linus, Bartosz, what do you think about the patch below?
(...)
> +K:     (devm_)?gpio_regmap_(un)?register

I never saw that globbing trick before, but makes perfect sense so:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
