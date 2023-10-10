Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFE677BFAC2
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 14:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231548AbjJJMGS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 08:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbjJJMGO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 08:06:14 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4410DB7
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 05:06:12 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5a7b91faf40so11848857b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 05:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696939571; x=1697544371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+emiS3FobGYMfsvMtLsinNF+jfBFa+dN92hmrKe7R8=;
        b=DdCUofSWh2jhY+/KbfJJKI5l+KY8sL49LL4TSFidQk17Hu1nXvI6VQ5Vtfl/J+BsEL
         pbgeTA+y1pIalIosbojRDuoJJY8gofNEYBSQl2b58pn/vPEUacyOeRDd05kiAfdko2LS
         /uNLMkapy8Sf8DAIs7Aztfa7FOIMTReNJ4fBU/dVIKicMqpJyTd7diyrEZRbmOamsdGO
         HmACokbIEcwi2s4wSq2ufp+3rHxwIgg9/+Lo9GLXWCrtW1qB4NY3w7esB9Nvj2qjwn70
         6IlupiygAdyDDUk8323NLty2q2DZc50To6na4OrDCuXUH5Onxen7/xoKJkOtvuEG5cCS
         HXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696939571; x=1697544371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+emiS3FobGYMfsvMtLsinNF+jfBFa+dN92hmrKe7R8=;
        b=NZyuX0RBZmmDTMtzhyb8cRfBt8J1Y/p8LvQXzSaKgI7IH0EQZga9HEVeA1MDFxW+x2
         pYt3KLxWBCSKpgGVsMv/86ErPwA50jtvJdfm9kopmIAlcUAnd3eYtGK1U+qunMTwptWT
         CeHTAyjJCNgMPaCdEN4qpEYFaDzwZQmeIDtEyWUnLAWo3fUo9Fjbz2wWIvKG8W3xKIzq
         bwjYsBR92/DtErw8nIBcxFINVPI1e2pc7TcC9hJTcynOIviJx81gWG78B5mMO2ArsIpa
         O7Bzwi8vvVycMIQAuJKLXgNauFy+NzccUSsmZfDAlKLOKj2W9DUfYDfLX8tfAnfd/Fr5
         pQfQ==
X-Gm-Message-State: AOJu0Yw5OeydVlL69QFbTUNj4f+RAxkMw2PKt8KaPvP9OGfudifrZn/p
        3ernf1JsLG6/YOCCHJMn+ipr2prH1e0/IblsSbOALA==
X-Google-Smtp-Source: AGHT+IFGYJ5KguZWMbWcf7Fu7QiLPusFLe1oLIe9ZIHU9hn8kyONuZwR4EuT1YT90s3DBcqkbepLog7T0zaskA6hgL8=
X-Received: by 2002:a81:9c02:0:b0:585:ef4e:6d93 with SMTP id
 m2-20020a819c02000000b00585ef4e6d93mr18904963ywa.47.1696939571479; Tue, 10
 Oct 2023 05:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231003120648.2838047-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231003120648.2838047-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 14:05:59 +0200
Message-ID: <CACRpkdY0_BJqM=kv_5rpBDMZwGRi50j3CZxHAN0a6bHMmC-hmg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: core: Remove unneeded {} around one line
 conditional body
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 3, 2023 at 2:06=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:


> The one line conditional body doesn't require {} surrounding it.
> Remove unneeded {}.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
