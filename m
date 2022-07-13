Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3721572F6F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jul 2022 09:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234748AbiGMHoK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jul 2022 03:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234739AbiGMHoH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jul 2022 03:44:07 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC8E6EE8E
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 00:44:06 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id t3so12761260edd.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 00:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XpXyhJ4QNFnL4f5EJCGYwB18DxuLMU3vuswmDUU/6LM=;
        b=dv3RBfCUzpoDhS6Aea9fT3Naw2N/mY3ENtgcsvmkZHsy0KNLqjQJD/v4UUGYYT65Bv
         L42ePuEoaXv/CD2/0uxp4pR+Hk1qomsNDWmfSSncSfwjW74/Uy4iVCSiFHpQHjYU1jjR
         NGrqCSVjggpKE46fk3cabnS3319GztqOzcgIkw/Lncbgn7eBhO4m1ffr7mATJwIWL1LJ
         N2pPTmCI2kAMFJ3m5VnH6tFz8nYeAukT1AoyfYmrO4nVWXA51RstI6RO8+9iK5gPRGMR
         a2F6/+etVy9DY7zf0MJF6p/PRDsRk6EtY/DxEGWsFb+KqZDKhBN1si7KrDXIuTAT5fDL
         8SGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XpXyhJ4QNFnL4f5EJCGYwB18DxuLMU3vuswmDUU/6LM=;
        b=Rk+zEmgxTUl6jrUDiJ74u8IuV5k+GA1tOouojSMEfsvNNlMKMAmSHDViPsXt6iw6NI
         K+YDzgEb0/hHHYsEgru91cFpgvDF7I0k+8VCS3z0TMRSY9GBK+Kj+iQDmtrbfvPktGoW
         5nnH0wRp0B3BEeV+YjrZ3VB8XtbwYLdMaYQ69bRz+x21m30keRS6sRtlqfLo5oeftC+4
         hTWV3kzNZIk2CSCX/SxrtPouHddKmIqUKlXRTnjL06ERlA1DWM8xcrjXHL1OUlbcE5wa
         uhqLLCMqmhL6fDuPn6X/uQLRJgV38SntKClDeRzTCIoGMu/8DHSRak5foln1+J62Cp5f
         D6fA==
X-Gm-Message-State: AJIora/M01QALaZjq9RWb8TCCtyg5alZuZYenZCmewE/F5W8wvtblLuP
        E8q5UWNKtWjLVT03A3kxNvDB2laBvnNX/dyuz5FOcwh8D4R9Ww==
X-Google-Smtp-Source: AGRyM1sX4F6SiKqMB+JxZ5Wx2Pmtxkg3bpG8fzVwjszy4OPlIxdaH/u7IdCdfjlRCKG7QJCUEHdRq0RDeziupAcS4J8=
X-Received: by 2002:a05:6402:430f:b0:43a:d521:bda with SMTP id
 m15-20020a056402430f00b0043ad5210bdamr3077496edc.69.1657698245380; Wed, 13
 Jul 2022 00:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220712110232.329164-1-francesco.dolcini@toradex.com> <20220712110232.329164-3-francesco.dolcini@toradex.com>
In-Reply-To: <20220712110232.329164-3-francesco.dolcini@toradex.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 13 Jul 2022 09:43:54 +0200
Message-ID: <CAMRc=MeBE=V8cE2ZnuHzw65i5mx2S6iM9LDC8=M-Pa0RWHR7yg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] dt-bindings: gpio: stmpe: Remove node name requirement
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 12, 2022 at 1:02 PM Francesco Dolcini
<francesco.dolcini@toradex.com> wrote:
>
> STMPE driver does not require a specific node name anymore, only the
> compatible is checked, update binding according to this.
>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-stmpe.txt | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt b/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
> index a0e4cf885213..b33f8f02c0d7 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
> @@ -8,8 +8,7 @@ Optional properties:
>   - st,norequest-mask: bitmask specifying which GPIOs should _not_ be requestable
>     due to different usage (e.g. touch, keypad)
>
> -Node name must be stmpe_gpio and should be child node of stmpe node to which it
> -belongs.
> +Node should be child node of stmpe node to which it belongs.
>
>  Example:
>         stmpe_gpio {
> --
> 2.25.1
>

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
