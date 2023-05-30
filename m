Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDEE7716016
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 14:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbjE3Mla (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 08:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjE3Ml2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 08:41:28 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A5F81BE
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 05:41:03 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-568900c331aso24438497b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 05:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685450407; x=1688042407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOtUrb1jXt1YTc92Nx2K8yaF1tV0C2PLHIJDBXMJ1e8=;
        b=Xzaug7RhDfquxOwHHHTAUcmTCtkuzS5zRcWlYeEfobpHfoMjVlAS/CwdmhocJy+96e
         GWYVY+IToJWNf9RtM9CIM/4PkuKAlXjNuQvcsVuWPFSx3X7+/JzWNPUl91BQ2ra5ZCl9
         WONJg0uWUzsOzjrDyIK0shIC3ZgS5EfKxfg2hGcKlFIk5QoOXa0c6mbUMYZXh+tuhlZT
         /PitNi3wMZcN5EZ+MZKSUEOGbHJh1N3Gc9VcsdvFdffGhb2KSAG9ISFWbZVIgAazwWrD
         CTGPKjvp6w9IHZGE8jnBotfig/8ctvxCSmFJUU35tgunJYFbWHAKP83CjH6vJNj44Vm2
         b5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685450407; x=1688042407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOtUrb1jXt1YTc92Nx2K8yaF1tV0C2PLHIJDBXMJ1e8=;
        b=EQDx1EU0OFcLzzsDQeguIYW63mPto5hrGsXfcQo5D84ZrB8H6AuB8FyI8Hye4E3tjJ
         x5fAAdSRR/piry4O7OetQf65uiq1/qPJvW5Gzn+4+9I/8zyQ9MicrkvBGh7XofAt1jAn
         O0PcXrItFEH2kDjngd5ndfQZqmCxeqS4Ush81fiv4kHw7nzJkq7xUgRn6OFqMUcm6AAI
         nHmOawFzkH/29uJAkNmIh1N2xGE4a5tFG0ErF8EZzrgjSxPT2dLYIH9JyvIpGF/MAyqE
         c/j/0QXxIWbxjHKIOW7zISjqbgW9rvhx2kWJ/K1et/z0Mb2gujz/t8T3mKxTeGQaYyy1
         yqHQ==
X-Gm-Message-State: AC+VfDzGc8zshAw9qJnCcti2wYWTFONPz29UiAIjd5pGC5rP8AOajZ0+
        O+DD5HsRTbKBc7TfcKl3Smg1KKuQv1xlxMbsAQkUSg==
X-Google-Smtp-Source: ACHHUZ5IRGVEGgUUERDvrDWcgtVuSj/SsOzSJ38VVusLz/5pCio/b35QywJsy1pwoBoZoBBFa8YeImTExOj4H4CgVzs=
X-Received: by 2002:a81:83d6:0:b0:566:a76a:fcc2 with SMTP id
 t205-20020a8183d6000000b00566a76afcc2mr2345411ywf.4.1685450407354; Tue, 30
 May 2023 05:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
In-Reply-To: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 30 May 2023 14:39:56 +0200
Message-ID: <CACRpkdboHeg-=thHvZrQXcx_HnecwmuBJskJTPjxFOB9z9R0gw@mail.gmail.com>
Subject: Re: [PATCH 00/11] Add STM32MP25 support
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 29, 2023 at 6:20=E2=80=AFPM Alexandre Torgue
<alexandre.torgue@foss.st.com> wrote:

> Alexandre Torgue (10):
>   dt-bindings: pinctrl: stm32: support for stm32mp257 and additional
>     packages
>   pinctrl: stm32: add stm32mp257 pinctrl support

Can patch 1 & 2 be applied to the pinctrl tree separately?

Yours,
Linus Walleij
