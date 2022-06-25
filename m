Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A78BC55AD4F
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jun 2022 01:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233739AbiFYXB1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jun 2022 19:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233734AbiFYXB0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jun 2022 19:01:26 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75BDE14082
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jun 2022 16:01:25 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id p7so9180694ybm.7
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jun 2022 16:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PwbpiGb/oD8HIRJr2SFQWUk8LsGUtaqCnJOZxvy/+o0=;
        b=V+yhpskio4hPlK8rjes/emBa2rjzvau3LUHIdAcBCJR3RO0/NLbqI+anJji3SQxOw2
         BBC4fMCRVdvY/C8a2G9acKeUAA9YUUPl0g+XM9HYbISGUVd4DXW3exEv55z7lYSoAvZJ
         VErONOGzTxFaFuSao0Sl+II4MZ3yUIUJe2l+3E82zPfBUpU1mSMQgOCA+/CU/XGk64du
         YWjVA7s7a2/s6unqh1LdglB1GXPMwlAqkpYjqG5yfd/+koPvJ9YudXhB/DwdJevQh2Qn
         S01GSqJBKvOG4PCHQ3EL4oxrL5tyUhDQ7Lo6iMotnR9SQV3e+Bhk/4ua8YXcB08cLyu/
         fjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PwbpiGb/oD8HIRJr2SFQWUk8LsGUtaqCnJOZxvy/+o0=;
        b=WP6V0wf2hJrfJeEaZ2Un8xhD/D8+CmCrdEWt7pX/ktKmIrpTiBDMCxcggtNw70oWkG
         Alx7mvJ7c2wBpYeu/frdvlSVnPzwm2bPWwIoxyJaweTNHXBMvgnUOueO2IiuI9xZKJFP
         B9AM56KBcys6kFFfcVSkkM9ptaNP7JpLV71wYFADay5P/0OImc05+Izpd1TamGHsZpla
         cvogtqY2wmxAAHx/X6/RVB92MbvdBYZ+E/38swVstBCb73w2yWAg1kI2KXqBbwPMllJe
         mM7EBRBPqbC/fM3nzw6xVu3wP0dbkyY+YTE61we0Dkyy/23UdkK+4fOVKe5KwIiUDQXn
         uaJA==
X-Gm-Message-State: AJIora+B4PCNcM/ICDsyRKsJj/LxpU0qoKsSdKY/JBCR9cnzl1/CU/+W
        z2q3m7wB+3gdHh+fs7AYQg3vYhhhZHnYy324rViPRwH/5MA=
X-Google-Smtp-Source: AGRyM1ugdsOA7x4YN7zvSVE7L9XjNnzE//OLJLQO6gD+BWDuV1BmbFIqcseR3ErrjUKM40mN4Ppck9IVQDTKfo2rGEY=
X-Received: by 2002:a25:8403:0:b0:66c:a405:a01e with SMTP id
 u3-20020a258403000000b0066ca405a01emr490833ybk.369.1656198084729; Sat, 25 Jun
 2022 16:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220613122955.20714-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220613122955.20714-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 26 Jun 2022 01:01:13 +0200
Message-ID: <CACRpkdZhzxxnqGrTkcekky5BCmHWegNMeTOKf-bafNb1A0DZYw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add include/dt-bindings/pinctrl to PIN
 CONTROL SUBSYSTEM
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 13, 2022 at 2:30 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Maintainers of the directory Documentation/devicetree/bindings/pinctrl
> are also the maintainers of the corresponding directory
> include/dt-bindings/pinctrl.
>
> Add the file entry for include/dt-bindings/pinctrl to the appropriate
> section in MAINTAINERS.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Linus, please pick this MAINTAINERS addition to your section.

OK then, challenge accepted, patch applied.

Yours,
Linus Walleij
