Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF407AFEC6
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 10:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbjI0IkP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 04:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbjI0IkO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 04:40:14 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C730695
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 01:40:13 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-59f55c276c3so97222737b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 01:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695804013; x=1696408813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEJzAqiuh7YsYGrmFQoNeBI4Btr9guZVsCa1FrfbSbk=;
        b=FiEGo2C6TNQC8u/OdlHUt7ae4ModckJ0Tf8q5cZ9AvZkvtHO2CplxcDmoXowp5G3lT
         6vM9O0sHhYBK36H9V9Tk8sl2Twn5u57NR0bgJstK+8YNJLNBH5t+BasmeKHkpiPLYk6J
         Sv/9cJwaSzFRwL2DfJEbTm4B6+vosnNwwlJcxoTts4a1Su+t5IjN8Iz73S7yQaYbgxb7
         ZYuNgFXCyJDt0pGTCqj4Xv2xNVQtX8YxRa+7uvozzwFjetRp5Bm/CrbJHjZfuW0LV6A+
         Xcrjye9nCmT3fZbbJETBRan3xMsYbmOk7a0YsVUcieR7BNzFYe/vJ83o0IkPWIzWhkXk
         699w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804013; x=1696408813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEJzAqiuh7YsYGrmFQoNeBI4Btr9guZVsCa1FrfbSbk=;
        b=qTlbwiP9oUkX1mQBbXXSs/uWBmuA21JFdZJ/8tu4FW5Mp2qqiTZMPRQDyPoN5M1Tf2
         DYSlCd4R6LeDizvq4adCSep5C4Qz/oWxf512y951Z5IM90nIe9R2CV8Hmo34B/sRBokl
         kgjFnE8e9KHDjX5qkL0f64WwxjBMmTMSyTMO4EGfc6rMUJEil1XJfzxO/UFGPA7mXwp6
         76VPFIXBh+rmywfOhbxog3ojS4gFXlrpkmOj6OtTWiHgOpj0/7ThpF/i/5yTCr+S08Ma
         HLBFMPAHwP38uLzIaYPhlzrmm5jC8EUZJDOCcZDB1TOAZOp/MieJg8REwTxeeKa+S12f
         ct8g==
X-Gm-Message-State: AOJu0YwTQfomVh2DZ7STyQR7iO7HKtMB7VUvrE0LTZFVd7fAESiyqXvi
        gjt95XSZMvH7eDcXX7izCjbHOp+OApWjliB7CQJGw3BzGfCCOXI0
X-Google-Smtp-Source: AGHT+IGmyazd4wfWowAjbKq2Sv+gk9iuixItrhfulmkXVde7rmDSb2ReUrJ1QjqIMP5nMuvY/4AhzPQBfrG1PL245Jw=
X-Received: by 2002:a0d:c786:0:b0:577:51cd:1b4a with SMTP id
 j128-20020a0dc786000000b0057751cd1b4amr1640879ywd.41.1695804013009; Wed, 27
 Sep 2023 01:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230922135926.3653428-1-k.yankevich@omp.ru>
In-Reply-To: <20230922135926.3653428-1-k.yankevich@omp.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Sep 2023 10:40:01 +0200
Message-ID: <CACRpkdYDLycp7YWodqVjW81irBmG70xkc+BWj+dqX+BcM9LAqA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: paris: handle mtk_hw_set_value()
 errors in mtk_pmx_set_mux()
To:     Karina Yankevich <k.yankevich@omp.ru>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-gpio@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 22, 2023 at 3:59=E2=80=AFPM Karina Yankevich <k.yankevich@omp.r=
u> wrote:

> mtk_pmx_set_mux() doesn't check the result of mtk_hw_set_value()
> despite it may return negative error code. Propagate error code
> to caller functions.
>
> Found by Linux Verification Center (linuxtesting.org) with the Svace stat=
ic
> analysis tool.
>
> Signed-off-by: Karina Yankevich <k.yankevich@omp.ru>

Patches make sense so applied both.

Yours,
Linus Walleij
