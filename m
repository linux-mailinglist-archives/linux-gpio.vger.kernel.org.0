Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18EEE7BFAB9
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 14:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbjJJMEj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 08:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbjJJMEh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 08:04:37 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2434FB
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 05:04:32 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d84f18e908aso5881562276.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 05:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696939472; x=1697544272; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRm5xwGlZJf/KJnLdBDBwdoT05gZC5H+vASV2Jvu/KQ=;
        b=TyNTCWuo266bHgiNm+q+Hok6E3nyqyNcwNpxUwClJIBu6FUZQJ9r3f4Xk8y/hqkwGf
         qRSjkMVrO0VR+p6idEIXDjV6LhE9LfIUZUlRZTcw4EcFUHP3s0w7ZUV7kwl0j0wbHsKa
         80I8lDp1kZBikaZfdIFLlBZB6XQVIZumNEaeM3EiPccynX3UR7MKnnGQor4R/XNt4uIy
         9otCZXVPvCJV+VSTmOBD/Srq1H35UEBTWXRCw+VjxQmNBH25AsaZqKCF3I0Elpx4f2Ss
         YxaoSuejDQnQPibdgMoF2GXw7kT6pjYq2YG4WWNTolSN2Qzx7u1VtZmZ0DsKOoWBold9
         uQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696939472; x=1697544272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRm5xwGlZJf/KJnLdBDBwdoT05gZC5H+vASV2Jvu/KQ=;
        b=FpG4wiKCIyedpcn/m+It1v0I3HsK5t/YHq0TOmbRNIURYYV7bcQUIHbCXcM5i5TQSp
         1mqTUPHz87GzfLVFt+iW6fdP/P8BVmMNz3TGKXHcBxo3dRLDvyMVcFV98qj6fJqAxaeG
         jHEnj3ZTy46QdFTKpFEzn4hEpKdtrE7UTaKY5n7Bzg8kwv4656RxddISlg98c4+HfpMn
         Zp/V9+Nj+/SHtT8oE9OVCi+qBOqyt+CVy9gC48y+RqDnnHhBWcdm0iOS3Fwni6qRBJbb
         WzouO2f94XkEmon4mdtR2r1aUBqGjHYn2GMS2B0kClygBvCFJM1nsUN7vCXkCMoD6kuz
         f41A==
X-Gm-Message-State: AOJu0Yxd+hEhmrmrRJxcx5jvXPyEnhvxKBLxD/x4893X+sqNmvs8YQRf
        vkZYkswXm7hneSnSuEeI7ESZoYI4OgeROl4w9ZNFMQ==
X-Google-Smtp-Source: AGHT+IGVDD7+S69xO3pfTbF949zNCe6yFAK3r96QtSxjKtmrwM3HcJu3N1ThxZ9DhlR9SLOx/kn6XhBTxLOkp/VyWj4=
X-Received: by 2002:a25:a101:0:b0:d4e:4103:7807 with SMTP id
 z1-20020a25a101000000b00d4e41037807mr16143064ybh.60.1696939471954; Tue, 10
 Oct 2023 05:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231004183906.97845-1-brgl@bgdev.pl>
In-Reply-To: <20231004183906.97845-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 14:04:21 +0200
Message-ID: <CACRpkdaP1AxUyAo2kOm5o3wn-gwfki_52-YJiPpu20cEKLXxjQ@mail.gmail.com>
Subject: Re: [PATCH] spi: bcm2835: add a sentinel at the end of the lookup array
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Mark Brown <broonie@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-spi@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 4, 2023 at 8:39=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:


> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> GPIOLIB expects the array of lookup entries to be terminated with an
> empty member. We need to increase the size of the variable length array
> in the lookup table by 1.
>
> Fixes: 21f252cd29f0 ("spi: bcm2835: reduce the abuse of the GPIO API")
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Closes: https://lore.kernel.org/lkml/29764d46-8d3d-9794-bbde-d7928a91cbb5=
@redhat.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

OK my bad (I think?)
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
