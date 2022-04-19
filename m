Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E57EA507C10
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Apr 2022 23:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244023AbiDSVtY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Apr 2022 17:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbiDSVtW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2022 17:49:22 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F353B3FD93
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 14:46:38 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id d19so5096517ybc.5
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 14:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nKYuve66AKuyzZwtLmTm5fhvpMnjjCQQv7on1/gZMDA=;
        b=oMmQWIW7ezel+AcddhNS6+Fief60wzC8kdJy+d2gMju5rVn9dqzW6YtVgbZvBtOG7y
         9h91A0P7dG3Ox7TljjfRZwOoaIv/p49QjkoWJOFsMQL9L3c77WwpZOSpYei9CR7nePAV
         DHi5Eo2JRrZdXChw9tnctcKtdJmlWxyoAgq+qiNWFrybJxXMv8bDcfItJigjlKH9rPrO
         cyD+zhbanq45r49EOrO2+/Kcq/isjfuLhCdJUSyEidvdeYX4txFDdU5VhZIIpAZ3jIPA
         JmVCby38SDggvh7BKyuuqNsINreWqTZJ751UQp5NDoatS+eIkZsfRaLHK8QKDGssMdlz
         hTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nKYuve66AKuyzZwtLmTm5fhvpMnjjCQQv7on1/gZMDA=;
        b=nDPC0HDsT0JZBIC6zIMMT15jggjK56DP7+O0FJmmI0ho9UnyvZSnjti6qRwqJk9Xl9
         8p/cwNxPFPbIU0DP+1qsswEx3xsmZ562FW5heEOLxfmmOo88nJoE+KR5+K/cxyl9sMy2
         NIP6K6tPWc3vFMcwOCM58Y8fr/0mfddv/A5pSEfjIEc+cPCoegpFiMps98u1e+c0Xyb6
         QlrwztsjQoH4RDV/BiNleWuOWXP15qLJZLNolLKMIRGVzlgwSCIEKERU1jO5JwtRxIsh
         LvDPqzhOOMyDyHZmALixYjqfJVZMhMwa3d2K/qxTxj+bo5y8+XgS0f/TYP7J6h06CNE2
         Qo3w==
X-Gm-Message-State: AOAM532+WJz8nRdVRenIAYCL0+EwmdWhX/669lYyxfKh7rfSd0VZI+Mj
        NyJcT6YOUhFRcLAXSkvbm5jgbt1W9kfTYNr5hFe9zRwI3FfaLw==
X-Google-Smtp-Source: ABdhPJyGJe+uXKv+pKIJl5COC86/oFAQYoW5Il8D885KDlEUZ4hTXW0rikD/fIZqDdKKMk7GZyACCWrJrqFzKNqYwRs=
X-Received: by 2002:a25:4e82:0:b0:633:68d7:b864 with SMTP id
 c124-20020a254e82000000b0063368d7b864mr17788319ybb.514.1650404798233; Tue, 19
 Apr 2022 14:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220412115554.159435-1-andrei.lalaev@emlid.com>
In-Reply-To: <20220412115554.159435-1-andrei.lalaev@emlid.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 19 Apr 2022 23:46:26 +0200
Message-ID: <CACRpkdZkg2S1LHsyyv3U5wEfeUqH5G+Dw1aiFV0hNhxYYNMTSw@mail.gmail.com>
Subject: Re: gpiolib: of: gpio-reserved-ranges interpretation
To:     Andrei Lalaev <andrei.lalaev@emlid.com>
Cc:     angelogioacchino.delregno@somainline.org,
        bhupesh.sharma@linaro.org, andy.shevchenko@gmail.com,
        brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 12, 2022 at 1:56 PM Andrei Lalaev <andrei.lalaev@emlid.com> wrote:

> Could you please help me realize how you interpreted the elements of
> "gpio-reserved-ranges"? Did you mean "start size" or "start end"?

It's related to ngpios.
See Documentation/devicetree/bindings/gpio/gpio.txt:
2) gpio-controller nodes

Yours,
Linus Walleij
