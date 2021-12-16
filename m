Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00556476854
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 03:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233129AbhLPCw5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Dec 2021 21:52:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbhLPCw5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Dec 2021 21:52:57 -0500
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E1EC06173E
        for <linux-gpio@vger.kernel.org>; Wed, 15 Dec 2021 18:52:56 -0800 (PST)
Received: by mail-oo1-xc29.google.com with SMTP id p2-20020a4adfc2000000b002c2676904fdso6492803ood.13
        for <linux-gpio@vger.kernel.org>; Wed, 15 Dec 2021 18:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6bA5KZJCgbZaGmVUKUnOxXmUKox0JOzc9HB8W9FHxh4=;
        b=iK9v0tRPQz5DD7bA0FVOc/H9XAv0EuZ1iF732YxaSPNXhl3DEsHzscdzMNSJn2q34A
         uItLen0gHFrnGxaY+mCNNNXlMRPIwpDEbUFdyh2/AxIr9gonh3Gqp2lYsnVZxKS6H9pI
         71smu6auQNkyeEGQ4Pcx9cu5p3deciwHEBajUA2Zhw+z+I2UN/VvTg3yh/lRmYHZaOy1
         FbCQAPzm0/yjQr6gzLixdgXYcJqCZcrMTV7bBOKj6qQUzi1Ct6Uv9bgTeVjFAfnsVpLD
         9t0LZRdAMn9Qx8WIQ0zH+gn2/8MwCXXssxMchQnkZ0M7y2lzoNTT9RhR8rkrKNQF7BrV
         ISjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6bA5KZJCgbZaGmVUKUnOxXmUKox0JOzc9HB8W9FHxh4=;
        b=h2EarJ80fOIPo1CKO5bPeNc57wdtUYt4AIwOqTi2VPCWB4PERht2RBOs/Iyy7iLd/A
         K3f4bx39yua6pUWh8i9Ie3ou0cdhv04P4cluToKkaiS8m1DE8jb8fAiJn/aHuO8foM04
         p91copbzx/pfnK8R6X9nwAGEjwryZb2pAKFtgsi/cEsg3wJKNaAfteGz6kU4WzMbIgCu
         6Elx7kvUiNzG8ziKA/2dUJKk0q4mywNtNaJMyQ9Sxfzk5oPuCd9jP5gwXEu5+xTiN4oN
         +6SHs6rPTR1xe9U5psi+fujZwGX8Z4DBYPAfzKEGPk+YtUORJVdjw5l2VGDWnsdthFsI
         0/dA==
X-Gm-Message-State: AOAM5306bGW7FSsqIiVkWSf2gn2BlbhsQCVVs53pCEUenjyYOr9sNjy2
        WrwIABO958d6i3/p39QLvUMvWWhFZ2LoafawCV8F1g==
X-Google-Smtp-Source: ABdhPJwe8Gv7xlJXX1+7FD93vVO+Y0q8ZUkdsKGlAc03PTI77S65d6S/+ti60iwCHcGyZqdl9nZWqxo1vyZVa99jaTQ=
X-Received: by 2002:a4a:8515:: with SMTP id k21mr9633690ooh.71.1639623176178;
 Wed, 15 Dec 2021 18:52:56 -0800 (PST)
MIME-Version: 1.0
References: <20211213094036.1787950-1-daniel@0x0f.com>
In-Reply-To: <20211213094036.1787950-1-daniel@0x0f.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Dec 2021 03:52:44 +0100
Message-ID: <CACRpkdaLt8O4ONZL0vY44gMbuSR_tT3Gkbh9f3sg7m23tUKO2g@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] gpio: msc313: Add gpio support for ssd20xd
To:     Daniel Palmer <daniel@0x0f.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 13, 2021 at 10:40 AM Daniel Palmer <daniel@0x0f.com> wrote:

> As suggested by Linus I have dropped the DTS commits that were
> in the series to add a usage of this code to a target.
> If possible can you take the first 4 commits for the GPIO driver
> for me? The final DTS commit will go via our tree.

Looks to me like patches 1-4 are good to go, but Bartosz
must decide if he wants to merge this late in the development
cycle.

Yours,
Linus Walleij
