Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB9952074EB
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 15:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391104AbgFXNw6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 09:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391057AbgFXNw6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 09:52:58 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D2EC0613ED
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 06:52:56 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id u17so1721087qtq.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 06:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RotQdt23GZ/tJp+CxwHxGCEqy5trYaqrTxj7ioe/Xwo=;
        b=QxnnYnvz42ybPTFg1apAnhUzUZ454iV2P/EGA90HI2Akuw7VQXFkyFO+zoks8B01ue
         4CrOInVYBrJ6P4P+HvBHelHpzvAQAbZPGU3YX1Z36WT8+ZcTdPdvJVvcEupxVizavgKU
         QIBPflldhtJTqjS4ndjdOY+NB174fLS7kE2lUoVYZS4Bp+jPfxPrxaY92hMXInoGuE9s
         p0QZ9HveC7LQge7EZE/XqkRqRS3TYNLViFDmCWFK4hsPMj6rq3z3Tt8V+U4tUkbq9ZZs
         kaJWlnHgfU/03kFAKzTs4RD23XKe/ovROad6ditKCEhSklPNI1t1RQuwm52Gb6tqxaw0
         p/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RotQdt23GZ/tJp+CxwHxGCEqy5trYaqrTxj7ioe/Xwo=;
        b=fngQCWv0ZoBXra8hRJiXGIxjzK9qWgbtQ5LMM9HNZl/cl5sTENG99xihpfqtCtiHD9
         8HNQ0HQ1OM+hgtRAf8zPkl5eQOHV/VEU0xbbzxOXP0L8Iw+cnAwpLs2yf0EpHLONvR8w
         GlGCObzOr9DdaJUO088VBYiE49xtdsqSVf78y88Z1kVvZ4nGuQB189GKbxToLnzR5/C0
         C63q1Ih60yeBrJNtI5BDvR0beVy4XSRFqD53Ulwb33V75+/OW6SKtKnoLhSVdLMhPvQu
         RFqhg/r2k2ZUz2LscmLBUQo6aKC9IE1Cuu4VTH7A1DeBRIrXZWn3yj2KsrZQVjY5AcfP
         jI1g==
X-Gm-Message-State: AOAM533dKk22+DodFbSPTfYBl/QpyZi04Li300FSI5BxyTTUIn2EVvDC
        Kh7vWGoje5pJG0ZDkZeAbseDtxxLJAkjjR5ExyNHfw==
X-Google-Smtp-Source: ABdhPJwx7LzRoKN/hu6SDBTNcBzg9zaodEvjngfhryhi7Lcyxnnc/WfwkSBeIBLNHt0kJS62Z8SSaNCs2kVTBedSNd4=
X-Received: by 2002:aed:2a75:: with SMTP id k50mr11061947qtf.27.1593006776102;
 Wed, 24 Jun 2020 06:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-6-warthog618@gmail.com>
In-Reply-To: <20200623040107.22270-6-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 24 Jun 2020 15:52:45 +0200
Message-ID: <CAMpxmJVrerWDj15CCyAyC1fV4RhpBJzkEy_VCW+TDczzfkSFMw@mail.gmail.com>
Subject: Re: [PATCH 05/22] gpiolib: cdev: rename 'filep' and 'filp' to 'file'
 to be consistent with other use
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 23 cze 2020 o 06:02 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Rename 'filep' and 'filp' to 'file' to be consistent with other use
> and improve readability.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
