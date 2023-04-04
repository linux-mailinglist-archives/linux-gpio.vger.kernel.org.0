Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEFA6D63E6
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Apr 2023 15:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235469AbjDDNvn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Apr 2023 09:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235462AbjDDNvm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Apr 2023 09:51:42 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA8FE7C
        for <linux-gpio@vger.kernel.org>; Tue,  4 Apr 2023 06:51:39 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id f188so20279964ybb.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Apr 2023 06:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680616299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4YY2Ln7i2hq0oc10Iv+F/nSMytyWqC2R8i3fihYHs0=;
        b=jEXr92riDH6mScM1Fihow1FOWAzi8pYv/T5kIddUMuA65pWwIJuwm2LtV71+gI/4uZ
         wkjoRDD16oEg+J9nlzLyY6thiJ0fehugt1GhSbqt9TAnR74/emUJTjuf0RlFUNBTytd+
         HAFIz0AsQG9cAgfZKtjuAou7GKOM4gwvM0/VZzw5htVBP4EoGOTjmA4Czty0cMnNDlID
         bBJXudPj9Z/1SW8YtcbaH4BLuNvd4g8ClEYW8l1e8R3N8KFQphotqe4Xno8y6dObansB
         a58/jSz5uCbYvZIderftEMt488mkZ29jWN+eOFzhoPav8H6gKYQeIoVeRjzKdwHnbfnY
         30oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680616299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4YY2Ln7i2hq0oc10Iv+F/nSMytyWqC2R8i3fihYHs0=;
        b=JhPDexWTi8uISuzsyvUNWV2Pp9H/u0PkLjZCRVczUIWTGfSPveMosK36ToY3tchaiU
         884HTeSzA94SdG4bPSkJ8o3KOX8YOiioiILfEFp+BMqmiEJX2bnC94ETAgQCKrzGdBl6
         JCXXBboLOGI3tg2wHeJcqOTO/TnbDIc4BzCT+RuBwq3ITcwVCiiN6maBwl7nH28Kprqd
         n13y5aiqCnLdw6or5aSF0afNx+E7fa3GUDRIYy9RumXfKoBcvLWifFrDNlovJVb7e9k8
         Yyjc4y72ZSPepPH62zzQULHBrvU9A8Czt8rkmTCxYA5CpvOqT4cZ1KXQNoM1EfWWu4zu
         vFQQ==
X-Gm-Message-State: AAQBX9c4ruKN1d1EG2oSZiCpE+CehJ5AS1QcBwpwbg/OqjlxzdiDWQK0
        1q7gJ6uAhfDmQRv7EjpaTMP4AJTOKXjXi/DfAIfbnw==
X-Google-Smtp-Source: AKy350Z4hDyA+CjN3AQPFsgwLGlpF5ADaypBPUYYOmGdeTdX3oUilschRwpkV4TvhhY8tQ+1aOxSAfnCjwa/6l6JBlQ=
X-Received: by 2002:a25:dfca:0:b0:b8a:b604:af0 with SMTP id
 w193-20020a25dfca000000b00b8ab6040af0mr1337682ybg.4.1680616298842; Tue, 04
 Apr 2023 06:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230403120235.939-1-lakshmi.sowjanya.d@intel.com>
In-Reply-To: <20230403120235.939-1-lakshmi.sowjanya.d@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Apr 2023 15:51:27 +0200
Message-ID: <CACRpkdaJW52QstfUM=AgFe39ZvK5mKj3ZMVrCzBmcKHfq4-Q7g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: Remove Intel Thunder Bay pinctrl driver
To:     lakshmi.sowjanya.d@intel.com
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        furong.zhou@intel.com, kris.pan@intel.com, pandith.n@intel.com,
        kenchappa.demakkanavar@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 3, 2023 at 2:02=E2=80=AFPM <lakshmi.sowjanya.d@intel.com> wrote=
:

> From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>
> Remove Thunder Bay specific code as the product got cancelled
> and there are no end customers or users.
>
> Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Patches applied!

Yours,
Linus Walleij
