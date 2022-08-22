Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3F0D59BA16
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Aug 2022 09:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232986AbiHVHRT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Aug 2022 03:17:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbiHVHRR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2022 03:17:17 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CD12983E
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 00:17:16 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id gb36so19319641ejc.10
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 00:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Gaa0lwSjZPTc4bVJ2hqicvvuLqdOW4udzcfR7NaiRHI=;
        b=M/UaYnsUtCt6mPqwP1lVf++v8xMIOrW9C6Kg9bDmxQ0QnAiExFRmK4h/k9NuIOFkVA
         VwjxItHNrcI70bQjQ2wBv/D3Sfd317muov+aHX9nsJt5Rh2MDEuE9Pso7KRnc0XvhUMf
         zpodMoTpFV7Oz5KtvFXNTlXeZe6s+8e/q0cIddnSiGzQZJcUL3PsGYe0UoX8VuLNyxYz
         w4D0wLZWnGzJ3fVonuENjQXosJzT1+jWKvXkSGfTbVM60qtBenZ3yt6RM3/AL6wpf+Bq
         I+eQIXX1C4NfmEIbfiOUW3etgh0y6wWrwSof/2XQ7moq2qZ7uNrtfDm0s9nkC+aT1H5K
         4zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Gaa0lwSjZPTc4bVJ2hqicvvuLqdOW4udzcfR7NaiRHI=;
        b=GKoY8c4+lUTdG8BiBCHKPn+/MGIFv5QOzB7YlhyGosTqnEq7AIzuCyhuAvt7v+OP+2
         oEedpgjbocUSM9KVKB5VFaKbBogcjDo4AM/ntlQm8OHrACnmhkRaIdlSR49BgrsP1vEL
         yRnV5Ykx/ZbCALRYdilVBotMtrhJZGRSpDuIzElbdeMpFJePtk4YcP3xwR/V1dHO+7aQ
         RkvUXcgp7u+i/SOZOvwiFdYMlKEACEhhn8HRxXyxDle9LWHZodBWJ5c5RHLLxvWhkikV
         PIp0EpetJJ+mLvrXXMRwBQoq+E0x3kZNtdwnvY0rj3w4plxgAEGqUu+rFJ5rzguPP/LG
         1Rcw==
X-Gm-Message-State: ACgBeo3kftQXnYGMY2uW8k7A0aHEwI4DMibAr6g8hW+YL8Ia801mmNYJ
        5WF+rVOasHWvV4HsEqRKebVAoNyirbaMHND3a1Bflw==
X-Google-Smtp-Source: AA6agR73uKO2M1GT0YRuKM53bMH2gd8jc1RJ7ufpRpKcAUtHxCYB8PQsgSIiqJd83qj16XYbBfYnbtBrJcQViywhxlg=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr12284228ejs.190.1661152634983; Mon, 22
 Aug 2022 00:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220728155652.29516-1-henning.schild@siemens.com> <20220728155652.29516-3-henning.schild@siemens.com>
In-Reply-To: <20220728155652.29516-3-henning.schild@siemens.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Aug 2022 09:17:04 +0200
Message-ID: <CACRpkda-OBwgAW1V8DOnw8z4-DLr=TpTAokm2jg_b31du-BRvg@mail.gmail.com>
Subject: Re: [PATCH 2/4] gpio-f7188x: use unique labels for banks/chips
To:     Henning Schild <henning.schild@siemens.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Tasanakorn Phaipool <tasanakorn@gmail.com>,
        Sheng-Yuan Huang <syhuang3@nuvoton.com>,
        Kuan-Wei Ho <cwho@nuvoton.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Thu, Jul 28, 2022 at 5:57 PM Henning Schild
<henning.schild@siemens.com> wrote:

> So that drivers building on top can find those pins with GPIO_LOOKUP
> helpers.
>
> Signed-off-by: Henning Schild <henning.schild@siemens.com>

That's nice.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
