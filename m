Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F003E7B7D0A
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 12:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242160AbjJDKYA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 06:24:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242176AbjJDKX6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 06:23:58 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A983100
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 03:23:50 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5a200028437so23798907b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 03:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696415029; x=1697019829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyfjVAMzv/bLxGsL52LyGKbSX5nZSxF64UbLJwC2Pt0=;
        b=k9BBUc2AVetmYzXqtqI3pbjgIhMho46WtVNMYEgIECpTC/cpWwNn13Kgoed5pd8KBc
         O7CIYChWpSlFndEJkQdBF2pws+kVL4LQxfXP9VF67xMKAF3S2sR5hONCB3xDLDTED0GP
         BXHo+D2T+2UNfcFfHgYPZZLjeH9ucjriFg6tXmw+GPyFqbyUIL+K2EAzwNgqF1wPjHLP
         E2V8fgmlpje3EyVzk1jqKTDOgIGk4/HQVkJe7AG5mTQUguWqiXpZjQkm9DlFvRvDZ5X5
         ft+17Dw5cAgENWM1u4EGqZ+RqLMEg9wj45IMTAN8YA0lidx8sjp9v1oPWI3qFD3CqCmr
         R/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696415029; x=1697019829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyfjVAMzv/bLxGsL52LyGKbSX5nZSxF64UbLJwC2Pt0=;
        b=sfW78ytR3UUpFVQxX10/t8CcmjTt34xHE50xMXQyF7BZ4+5gAxT6/0BcaTcaY7DFA+
         MSpU5EggZ3e37+EpKsB0cP9ZnV+kBxhxfP/4mZGINxHMcPpvb5xj7eLhHzdUyrJbIqVj
         wZvVq6VlyHC6OFNxCM1RNpcsa0bdXrekuO8wT/HcImSs8aiNmHRhLNZbFZh2OopQll8x
         f4FTTbXzxtY0C85wW+1TIigmN+SN3HCo8fsbqUSu0TZRLlDlMqQ4pOv1AoEdOiKd78xq
         t1HlMgZlHRqF9dipOOpWHF56KKMEZdwx5ukUmXD3K90bLvlNSt3fDDpdU9OMybLdi0aT
         Yz6g==
X-Gm-Message-State: AOJu0YwcfRnHoFAZj2fvptDvt880CmAch7LUWRj+ojGCg9uMY4V8iB2M
        Wx8Xx5QzHuVKJd/2/yRa78mNUvduOQPmEAp8KiUcIBLYyZ2U3st5
X-Google-Smtp-Source: AGHT+IE0th6pEihyn2DBN0vwAeClnm8XTARfQrOeMoqRc9CMo3yMnCn1iGwUEhcUFn1RDG4x6PvDA5Lird8UHhV2vVg=
X-Received: by 2002:a0d:d690:0:b0:59b:eb64:bcc5 with SMTP id
 y138-20020a0dd690000000b0059beb64bcc5mr2136386ywd.8.1696415029221; Wed, 04
 Oct 2023 03:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230912-omap-mpuio-base-v1-1-290d9bd24b23@linaro.org>
 <20230926070953.GV5285@atomide.com> <2298936.ElGaqSPkdT@dell>
In-Reply-To: <2298936.ElGaqSPkdT@dell>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 Oct 2023 12:23:37 +0200
Message-ID: <CACRpkdZEHh=odohqRdGLF0vDvQU-gQQKTdV7uwXP9XzC0rAZ5Q@mail.gmail.com>
Subject: Re: [PATCH] OMAP/gpio: drop MPUIO static base
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
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

Ji Janusz,

On Wed, Oct 4, 2023 at 2:36=E2=80=AFAM Janusz Krzysztofik <jmkrzyszt@gmail.=
com> wrote:

> Tested-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Wow thanks a lot Janusz, I was really scared that this patch would not work
but here we are!

Yours,
Linus Walleij
