Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7E17787FB
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 09:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbjHKHRE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Aug 2023 03:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233911AbjHKHQx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Aug 2023 03:16:53 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A2F2D62
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 00:16:52 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d63c0a6568fso1347020276.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 00:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691738212; x=1692343012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuD+XvQj11PFtz40BWumJNEeWgFHkhlGekqR3/kY8Tw=;
        b=Isx2d+kCI1nozCWlKOycDEC/wKKMWgncq+rRxKn+Aavz3PnKQoTRMM23chl4bf3qC/
         IAyItdbnwXMJbKqBVFCG6nZ50LxGtXMA5A8GoeqpbMJxfN5WUhhq6ewUsWdhc8FoPNIG
         +G38wVz9cOtlJ3kUsyugz272OiTnaNNNd6fisF6+NV7cPFmH3l/C4ZnE74Zu3RBp+jSU
         /DG70x1ZWJ9GiirPTa8wZIZfm/Ej5smK3k69c7hm83e9tXjLTmEEBiKMcKi0ve9hKc+w
         WP3SfoFL8OTee71peLnOXEv1jKK+Wj5KVWkiXHxUR0u49FhPAR3Q4aoMaABbnvb2brkM
         Idjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691738212; x=1692343012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuD+XvQj11PFtz40BWumJNEeWgFHkhlGekqR3/kY8Tw=;
        b=TFmyIKPeLHh5gW5OWphCbQcMxlkfhAeckST9WWQGp/oiWUfCZgLZKYF+nR0Cv4FIx+
         imp7pp/D+ZZ3YeQP2KZDBLNGrDk/hEOzu5Y+Fo0E/GpeioWkac7vXKM3shyRS3gBxQKD
         pB2adn3A7JqxhgWEqxenOXjxd2rrE7UGwRiipR6C3gtrbvB6t3rkxkR2kQ65kzvrdA+t
         9j8nwLD6YKRZrSX/Ubra1/VpPJ6vhcalsl1l60rgODjdnSCPTs0oVfl7sqTzVjGoxqKi
         ROTt8sOvttrq93RWXeE7yVwzS/Mf0oxJMSx8YrHdsGSQbwV/J/9RBG5Yipg3oFot7KCv
         jwyA==
X-Gm-Message-State: AOJu0YzMkWjxGD62DyW0YdcWBm+4FiroXl2sh5YLiuKUEfCC8BoLJFqR
        sI9bNzTeE5NtMtAjiA7LoKFJk3tHMCPWzDPWK7u3xA==
X-Google-Smtp-Source: AGHT+IGVQUUyjKB7jXd+TkcIl2iAw4CLxpsQjkB+905Y9DhQVex8KMfUqPq06BZz/bPR5qyeXzBCsUa1bSHuCJGA+KE=
X-Received: by 2002:a25:34d8:0:b0:d12:77c7:b362 with SMTP id
 b207-20020a2534d8000000b00d1277c7b362mr971827yba.26.1691738212166; Fri, 11
 Aug 2023 00:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230810184846.22144-1-brgl@bgdev.pl> <CAMRc=Mf8g0JV0QQgpiTS2i+y68NVW-97vOMt+0389++wB1swqw@mail.gmail.com>
In-Reply-To: <CAMRc=Mf8g0JV0QQgpiTS2i+y68NVW-97vOMt+0389++wB1swqw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Aug 2023 09:16:40 +0200
Message-ID: <CACRpkdanyKRYSeRTB8=Sh4Dh4ODx13V6J3yRXUV7dY3V-qBiWA@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: fix reference leaks when removing GPIO chips
 still in use
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 10, 2023 at 8:58=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> I forgot to pick up Linus' tag. I'll do it when applying. I should
> really start using b4...

Well with b4 you still have to issue b4 trailers -u, I almost want to
make a cron script that just loop over my b4 branches and do that
every night when I'm asleep so tags get picked up in case I miss
them.

Hm, maybe not such a bad idea.

Yours,
Linus Walleij
