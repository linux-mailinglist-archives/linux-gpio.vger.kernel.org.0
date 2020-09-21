Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6939E27349C
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Sep 2020 23:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgIUVGa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 17:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbgIUVGa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 17:06:30 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E70C061755
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2020 14:06:30 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id b12so15621487lfp.9
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2020 14:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2WKSSAHDfVCoyCUQfWspqrM2DoC97pf2hEZksUAZMLw=;
        b=PNtNTTdDi99VVnCdtgTfy2YXYC32w2+S9ygIZQGAI8B+/xIAXFfRctzH7MPJa5NwIJ
         LGP9J+mFFywRJ4790qaYgGsHJZQnpgQIkEO89naDQWqrfRVMEdq3d5LXwKaXCM0290Rt
         HHLt6HQiRlIUOMh8D//lU09cTxjvRN194CgJsLvh5siIGdJS+Z5gNosuxpK7Q6TjliUX
         IJEwnJHdc2y9ynpUlXsA7zfD5GXWcU4vXbMuZlSMokf4qTcmFha2oruuf+tsD3Uia16k
         5ZOLu80VFlZ6AZ69/4wmZTwCYVoRkH5duaqzobexRT14H8E/aiMlR9RzqiG7mOyv2JvQ
         KP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2WKSSAHDfVCoyCUQfWspqrM2DoC97pf2hEZksUAZMLw=;
        b=h8wW5plS2aIoj+QorgX/Q372bKql87kw0MarUliKMepbDtdIDtQeB8wwTyg20d8p5e
         zTUhkZa1eEOCIVSHmi4pmFyNAQ+su5/xkX1Um8rp9lGuz9OQmL6NWvTIYjN0LkoQopfb
         wtDo+ct2vt9VHNwx8UmS5AUsuxOtT4OETSV2f9sKyTrRIh/FmV8nf8ntsTe472rdJSTO
         auFqxUUdYNkH2I6hQ2QLJA/I1Lrm98qexnUbrDx6oNqSmulSyqgkp8j2StRf5hVM1dnK
         92ZU+jItixBrm29FcoY7Lg64qvgmkcpWMZ78eCOb1QuuCmosC+/nYaEZhPk9ZDY8NIyR
         jpHw==
X-Gm-Message-State: AOAM530fiX8/sr3ZC4BWhsLU7cy/C6jyPd3MRvyGh1vljoN/R4bH4HQ6
        z0jtoifDsAadzkvMt/ioQm9rpTHHA4Z9PEc93OwFjNC/3U57pg==
X-Google-Smtp-Source: ABdhPJwUn+/ITzg4Tb8b8i4/qi3SJS4/qc/7kCW3LnMXPg5b31D0cqrh8mOHwRQ0/JzJ3dkMc5uxji1f4ND27BGd8O8=
X-Received: by 2002:a19:1c8:: with SMTP id 191mr519865lfb.585.1600722388353;
 Mon, 21 Sep 2020 14:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200914155714.GA43910@black.fi.intel.com>
In-Reply-To: <20200914155714.GA43910@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Sep 2020 23:06:17 +0200
Message-ID: <CACRpkdb7tP-Zz0ycpss885nWOx-LoT6iPmRT5b-FrBM+x8aLpA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.9-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 14, 2020 at 5:57 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> One fix for v5.9 cycle from Hans.

Hm the pinctrl fixes are based on v5.9-rc2 and I got a ton of changes with this
so I suppose it is based on some other -rc.

I will attempt to just cherry-pick it to fixes.

Yours,
Linus Walleij
