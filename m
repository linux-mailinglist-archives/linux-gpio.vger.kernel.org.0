Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4F070F990
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 17:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbjEXPCJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 11:02:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbjEXPCI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 11:02:08 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 085A6B0
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 08:02:07 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-75b14216386so86150085a.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 08:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684940526; x=1687532526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDxDZ0JY5177GKHc+Kwhce3BjxX4Mzz101bzwVkrEs4=;
        b=g6eX8Cc+yy5nsdPvTCAZnwW9cbKQMmsVWDwU9/2roTtDL96apvX6dsRLtDonHOWtwM
         EFpA97EwsaqGE/5ltfONlZDF8BKsU4I4dP9lrWKs56Cu+vc4MiRz0s3eTH3hGN/YuhRS
         PlMHCJCqJYEQvfC3r9nxQxdZvY1eQoiMtfcjDAE0zhwtYFfsivdTd1f75iS3t4pXooC7
         sawJNzWiBxKhZ+ITPecjdElY4OYbAwvOrgYdAAId737OF1rYOI3Fqa1lOuMLqoCdl5ZX
         lI+CL5bYu7WFtXqlkOqi+25y+HIyfnS2KD1qy+QfnbEwo7wMePlwZ/d8GkvBteR3ibYx
         DWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684940526; x=1687532526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDxDZ0JY5177GKHc+Kwhce3BjxX4Mzz101bzwVkrEs4=;
        b=KLjNer90kZsbUHLmwJU4ahKwLzx73a2jjTSNlEOdGS/4G9eoKHbdKe9x1rOOqI5AVf
         Uj0Pd29KpSTq4QMpq+vOxcUKMqA+l9uMzCLDlGrGdFLeYvwwjPx9WEDNMjd0UuKrLg7+
         WvAand85JQ7y/mFjkGHB596klMz3/9D8Nni1pSyYGg3zK2yhXeFWw2F5dbYi9xB06FSz
         uNB/bS7l7MWSr+X1NBy2ABh9zR++bQ0Vde3lV0Tuxb14LV+p0gQaaAP5c0EWhTkPxO5O
         PTyGdEnhRMAvi7WjTxGRHOmfxS0dMtsT8ow+OlSnDEtVZBj8nDjd9SvfIwHsYOBrssaY
         FW6Q==
X-Gm-Message-State: AC+VfDz20eooQXvZeJ8Rs4ao86UNv32KqV+5y0Qz2wHeZqOlYA5JM30R
        DiFElTNA+BlHDR7Y8hbHhKUVufXDkbuyRrTnw3rfwg==
X-Google-Smtp-Source: ACHHUZ4+VK5U0LjmijJr4F/KQP+HndeDPMyYHN9E/8OnVzoHVmVUdx8Bzj3SWnWEVroLpVsJH5f0QJmSuT9r4pkpyA4=
X-Received: by 2002:a05:620a:4fc:b0:75b:23a0:e7c3 with SMTP id
 b28-20020a05620a04fc00b0075b23a0e7c3mr6988390qkh.36.1684940526115; Wed, 24
 May 2023 08:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230523133427.194558-1-brgl@bgdev.pl> <9113444.CDJkKcVGEf@steina-w>
In-Reply-To: <9113444.CDJkKcVGEf@steina-w>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 24 May 2023 17:01:55 +0200
Message-ID: <CAMRc=McaSzB0-a8q0rh+rUsHcqCUGZ8rpcvqg7D-oV7e3vMP0Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: change the interpretation of
 None in event wait
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 24, 2023 at 9:00=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Dienstag, 23. Mai 2023, 15:34:27 CEST schrieb Bartosz Golaszewski:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The docs don't mention it but currently passing None as the timeout to
> > one of the event wait methods works like passing 0 to select() - the wa=
it
> > method returns immediately. Change it to a more standard behavior - Non=
e
> > makes the method block indefinitely until an even becomes available for
>
> Small typo: 'an event becomes'

Thanks, applied with that fixed.

Bart
