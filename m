Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACBFB79AD08
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 01:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240744AbjIKU4f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238158AbjIKNnD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 09:43:03 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BADFCD7
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 06:42:59 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-591ba8bd094so41593147b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 06:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694439778; x=1695044578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFi/sDA0mpFKVNKjPCaHuqfQrAl+HMj1tLlHcsCUpzI=;
        b=X/P0sGl5IsstvIicFfhNUBc2sVnbkLrl2LSwqZeh4Bqv9RFU2xDrH5Y1TcGAsL8kgM
         hC1O3VKKS6raUEr+wazo9l6n3E2EqAQw9q24TrcFNq+bAF8oValEkgOAD9YIAUqcKa4M
         AlJFqpVLHDe/TBcAn4JuJsD4OYRrd/+++zunzGZcvdDgoKQT06NK1bUmYjfUbmTqNlfl
         pdVgBZz2CfzhV56lK0POR3oEr0MfKQ5pVFeXfaqelrlI4ya51EnsVBCRzfMOHeBKPFRD
         PB/O8RmXZFwACAQbGBgXKOaBaA0sC9msI5IKVbuY8ckquq3gnfv6YEpIlfjnjeJlVxIO
         t/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694439778; x=1695044578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFi/sDA0mpFKVNKjPCaHuqfQrAl+HMj1tLlHcsCUpzI=;
        b=eRdnWp1PPnJya08Ud76pOz/IRwweONJehrFDZo2YjAiAdjBBhvoUsIx28SfsUUmCnI
         0VqayZeHW8vUHZprQ8JXl1rJ5wZZALWmfqFgRYXm2FXe8C6M/WlAtvVTvMdt6INfZt43
         2wHM/HN8yx5K1GDux6XUeEoO1/ReN11C6/QHHl4JrItLd3sL/Re67CvDGNrZYW5UHeYo
         3k9FX3E7g8DyjALp/qnzqSxEXBhIGR/Rxybl2bm3D0K/VwrJ/eRbdLWEO0DEZTzxD5Uj
         qn2Gj+jRQsVprAn0KBRCsOqlAOpiEz+cPpYbAdBqhoD0MEKNt5vuqeuYM7B23QiNTZ2U
         P1PQ==
X-Gm-Message-State: AOJu0YwvT1Uabs5IKnIhG+60ZdGSaRH6vv/PtWmEayGjsJ1wiFiITXgX
        Rbm2knMmkU0hc1Mw0dLtM+u/9zYbFqilz7zBqAYHfw==
X-Google-Smtp-Source: AGHT+IGCJDBzxyJwSnVTJ9qNX6U7qPwshhy0jI3iEwukYIwvyM1e3VMTsSd/EeJtCJMKIXhBS0NicWPOBRg8RHaJi9E=
X-Received: by 2002:a5b:68d:0:b0:d80:c94:3ea6 with SMTP id j13-20020a5b068d000000b00d800c943ea6mr8260405ybq.34.1694439778534;
 Mon, 11 Sep 2023 06:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230825092706.14680-1-yuehaibing@huawei.com>
In-Reply-To: <20230825092706.14680-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Sep 2023 15:42:47 +0200
Message-ID: <CACRpkdaSKHGb1jMv+oxAir2UUiFv868upt4Jh97Y9SN7k7G6jw@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: lantiq: Remove unsued declaration ltq_pinctrl_unregister()
To:     Yue Haibing <yuehaibing@huawei.com>
Cc:     andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org
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

On Fri, Aug 25, 2023 at 11:27=E2=80=AFAM Yue Haibing <yuehaibing@huawei.com=
> wrote:

> From: YueHaibing <yuehaibing@huawei.com>
>
> Commit 3f8c50c9b110 ("OF: pinctrl: MIPS: lantiq: implement lantiq/xway pi=
nctrl support")
> declared but never implemented it, so can be removed.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied for fixes, thanks for fixing this Yue!

Yours,
Linus Walleij
