Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7763F79450F
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Sep 2023 23:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244772AbjIFVY7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Sep 2023 17:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244768AbjIFVY6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Sep 2023 17:24:58 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10CE1198E
        for <linux-gpio@vger.kernel.org>; Wed,  6 Sep 2023 14:24:55 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6c09f1f9df2so241314a34.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 Sep 2023 14:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694035494; x=1694640294; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWC0scYfUcpjGiaSYDl8OTHYYNTx4MVTsQ/udlg5YMc=;
        b=t9FFcO4/Bi1wOZlcuwaJP82na8lU8yruTMEx4uoWdhz/e4JJKo2VNQf3rhtO40BqKd
         IA0g1unHNwQYiCEQYVhEASyWms1wn2iYM6reC98e+115PDQAU0okcCaAjwMnqWZ0jLlk
         UX+b6UD6CGTXcdhpz5+mqP7M0hn4OLa4udU0kyN1st29JwN+NcaNCRtN2Yw0OJYQAWBP
         zjmKFRK5UA26m+04fAbGjjJHzYXlMLLoTIKFMHgQKSkreq3tYlfvxcwV0x7S/YwBXCav
         E5HA3yy1srtgPebfiuSRcXjS/fiGLQRiEn7oCl6xjKjEyNVPGCVuDirYWtYOzemGaxKa
         luxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694035494; x=1694640294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWC0scYfUcpjGiaSYDl8OTHYYNTx4MVTsQ/udlg5YMc=;
        b=B67Ta7855hSWshzq1KqkhXOdBLod/F5y0RdBNvT6vr6ai6EZg6VBctRDUGUvMs49kT
         tVqz4+AkvquldvtGKe2/Wrt/fiG5qHzjgEjE3nlqd7kpiSdfdyINEpJCtFGSAXXUd8UO
         CKtSOEuTQee87d1A6ngaCwK7P/Eg8zDLdJOrHQm/azj3q/lQ+wqdvI143sDfFFFvcWpY
         LYxrkl/N5NTamYu084TN4ZA2dOf0ek/K39beExqZo9WBntZkDFLBcj3PXU1liNgeHRwd
         hRhd21oQSDk7XmHd9l329rWPZ0nUkK0P438Vvyj4WAGB5XoaN0v0Gk0z5OezLT1medKL
         FnKA==
X-Gm-Message-State: AOJu0YzBjfYzyp7s/7Ho+FQ0NCyCkdLFgtktSmoWJ6z9OMTHgOK8bd5N
        AbEkl8EaDvQY8oWyZzQaTdv6x3+Lxt1zxOpFECCwwE8IelYvl395
X-Google-Smtp-Source: AGHT+IFPsVndCeBo40u3rX9JIqhESaxWN53EdxLX74lsEc8fthP0isEFqBZ6PGo9Hmx69vN8M2MdelnkfIsuURtvkAg=
X-Received: by 2002:a9d:5c83:0:b0:6b9:b096:2617 with SMTP id
 a3-20020a9d5c83000000b006b9b0962617mr2966540oti.14.1694035494341; Wed, 06 Sep
 2023 14:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230906142357.138846-1-brgl@bgdev.pl>
In-Reply-To: <20230906142357.138846-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 6 Sep 2023 23:24:43 +0200
Message-ID: <CACRpkdZ86dery1k2Wh-Kxy8L3Tc=W+G=RGY5kAirDFXVrkML=g@mail.gmail.com>
Subject: Re: [PATCH] gpio: xgene-sb: don't include gpiolib.h
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 6, 2023 at 4:24=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The gpiolib.h is unnecessarily included in the driver. None of its
> symbols are used so drop it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
