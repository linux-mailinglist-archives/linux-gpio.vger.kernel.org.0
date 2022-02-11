Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6AB4B1AD8
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Feb 2022 02:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346635AbiBKBA0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Feb 2022 20:00:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346634AbiBKBAZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 20:00:25 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E624410BB
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 17:00:25 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id g14so20483382ybs.8
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 17:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WIDkP+UZjRsiSQWkVvyjS0bhDfj4yHGdnjb56uFKkqc=;
        b=oPc/VtDbvJ5xdR+F5EjLqss73GzSSMZ83MK/qQ94DQ2ewUdsC9GJj7idJxQJAMQEP1
         Y9ehthayIHFX8IgQGbsxrOvnf6vfWaXBkCE7InAxIy1Y5bUDLe6WKkGjevb0/aj5joLI
         tQOr5giDHTQOEyl4sOrAWWCrPGBPktgX6/65bEUUtn80HJiXktW3MeDGv4rNvQaa2953
         c4FZdoUj+IaQOUq+ET3LUjpJgQ1u8qRN2K/knfW/W2MSEUPhfqWTYSd9xFrNdD3GMRRm
         5Da5tCcCvTxirpusRKEjN6utN50DbddWPWVYtHHgLEicSloM67vZtlqIZM24l2zGRtvV
         vMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WIDkP+UZjRsiSQWkVvyjS0bhDfj4yHGdnjb56uFKkqc=;
        b=sVDK78NTrBqmuH1mrFYoN9l4cnBOmH1VYzTh638Yjd0hGEPcoYj5mkBVcz+SUlcZ3L
         M9tM6G+GzzDLRdw7K8HC6FqlCzzElZPh+ZW7kbIG0CVyf1yZXYJwZ9bigZ7D/FsT5OBs
         zaWQ2BCJ/uolitm5jJ4qx0JOD9OUjDB0mU+sa9vZT1QKOo/ogExJ+tkrnjgPUv1oJsE0
         k78cDkgZjMphNCR34pBdOLzp2VQbGDxLF3zdr4aJFESfxbCUqAQpI5Zbmy9VmfrGYPx+
         +jYRgapkL1zeJiijCJ2tsqP2LRsMBsDKxGnZOqfaad0pl8OzZLkydeYwnUYlSQm1W9n+
         tprw==
X-Gm-Message-State: AOAM532wJB1WKneIG3IEs25N5eTnW1ceQyXyjNqnI9T39rFxwzIO3hb4
        k8iWmhsLcMAc6HIjTmI9xFcaP1jF5YUblFX9JSy63aamJlE2jQ==
X-Google-Smtp-Source: ABdhPJygE7mUe4mxNoMa5wIo3MDF9IoyoY8qTZnJ3OJ5MpKCksp/AMCTD9rcOVERCgZDpgx0maGUdtrhblBp5EdMEQg=
X-Received: by 2002:a05:6902:247:: with SMTP id k7mr9466845ybs.322.1644541225166;
 Thu, 10 Feb 2022 17:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20220202125438.19345-1-j.neuschaefer@gmx.net> <20220202125438.19345-2-j.neuschaefer@gmx.net>
In-Reply-To: <20220202125438.19345-2-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Feb 2022 02:00:14 +0100
Message-ID: <CACRpkdYZBF2Gy-7cUBDv11WomjZFXLoUmcUcWKtUq8Dz58i9jw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: nuvoton: npcm7xx: Use %zd printk format for ARRAY_SIZE()
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joel Stanley <joel@jms.id.au>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        kernel test robot <lkp@intel.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 2, 2022 at 1:54 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> When compile-testing on 64-bit architectures, GCC complains about the
> mismatch of types between the %d format specifier and value returned by
> ARRAY_LENGTH(). Use %zd, which is correct everywhere.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

These two patches applied!

Yours,
Linus Walleij
