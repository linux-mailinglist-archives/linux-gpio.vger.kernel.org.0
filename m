Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCC278208
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 00:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfG1WVB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 18:21:01 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45796 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbfG1WVB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 18:21:01 -0400
Received: by mail-lf1-f67.google.com with SMTP id u10so1908117lfm.12
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 15:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FLmMIDcIizWuPvrBmc4gpk3vuXYj+LUn4VJhWeYY47A=;
        b=SpW8mh5JmaUwmCYAUiN6Zc6xExwWIrOtwzT3K6hskMbzzxct7PtclBGvCvTicitGLf
         LIzVOV0uPD66YFu/1HFK3iDlSyDK23Jgtip/94zAhM2rxdAo1tepVdNhCYUZDIGh/Zzo
         AMwOoJSB6mqBJ2OBODr6Dy1qT1t9ROJGLge8btIfLcKdTqXA6ztYBiIMsZoBozdQvRzb
         03+n5uoHji2Mfc7XW7d0s5d65Nrbin1rZOdh4CTw/hisxod3/t/KDSj62K1vDV/2hkyi
         DeDRQYCwlhNSblnZMWJAOuEl7ChJr7jVyVmhC0BV64NRbICQFM08LxvXrkocTi15E/Xa
         3svA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FLmMIDcIizWuPvrBmc4gpk3vuXYj+LUn4VJhWeYY47A=;
        b=lpl7NeBXm9Vd2KWI8N06N8tQJblG1HXciqBHz2Ju/hrApnNB7F1gULCd+5S2aCnTma
         /5ocl2XHOAmnZho9Ffg6fKY6u3hgiPy7RjkVJQX9mbrgJd350G+vw57fTFvXUAHl5kkL
         oYj9xIaxfPziv+WVRZpCSpVAqEboZFqg9BmY/Fvp8/Uhl6/40lwe+OSMuzg23aX9udak
         7n9mcRUQRI5+8IU8EFfZttUOHxzt3hTGJpqcpvKWtWHtG6mcfTjQp5CCpYMcJKFv6g4n
         KjL6P6ryw6SgSevtO+htOsMf7UjNDHZ1AnXsncmuS8vRVS4+RA6M3hE2Z9P+PsWtN6rr
         99Bg==
X-Gm-Message-State: APjAAAWz2GlVLGjKwply/LFlLIl6dqEutdfolU1ib5ifIVQZCje4o2Dg
        mQi3OFxwmapCTS02fKreKzsaUpqFUwDNLCCfINFyTuVD
X-Google-Smtp-Source: APXvYqy9tXaK3FvDKV/nxxLTpRbvelziBiCAwnZac43l2iiP91Bvr49N28LMVps7+NvxEUQsozJwed2O5clCXGQ2s/Q=
X-Received: by 2002:a19:e006:: with SMTP id x6mr48865881lfg.165.1564352459718;
 Sun, 28 Jul 2019 15:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190705143043.1929-1-luca@lucaceresoli.net>
In-Reply-To: <20190705143043.1929-1-luca@lucaceresoli.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 00:20:48 +0200
Message-ID: <CACRpkdbJHPz78YfwRtbnmw_8Rk-Te4GHFvrL4MLCy1xTvjKGAg@mail.gmail.com>
Subject: Re: [PATCH] docs/pinctrl: fix compile errors in example code
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 5, 2019 at 4:30 PM Luca Ceresoli <luca@lucaceresoli.net> wrote:

> The code in the example does not build for a few trivial errors: type
> mismatch in callback, missing semicolon. Fix them to help newcomers using
> the example as a starting point.
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Patch applied.

Yours,
Linus Walleij
