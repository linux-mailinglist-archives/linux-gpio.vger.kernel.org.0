Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D206C2181A3
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 09:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgGHHr1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 03:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbgGHHr0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 03:47:26 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66023C08C5DC
        for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2020 00:47:26 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id q4so17297724lji.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 00:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jwgQk4hxB0u815VyD14iTdkDJc1dGDwOWq82/HI8OL4=;
        b=THButbdDWn+ub3xsg77v8ii5FhwFxDJlOeGBUfD3mM+xi+74SQZlyDr14GGhivyeC8
         s3t6wYmLKyiFEOuHRbCQkotAoaa9YYfImJHg2LdJ9bykYfFImaruITuPNc/Dsl0DwlAP
         MatRv+S0gXIrYhlci1pBRh53JBp4lVxHtXc6w2WIvy9GSKPdNV/NKefjGYIoWLXEqe0V
         ZHKM3FZPx0Jn3UcUA3MopFJW+CQpmklCm/626a4O9MRCd1gbnPYwVioZqc2NTVoaeWZT
         A5kJX8I1KC4zbDxeYweSH+7hxFeUVF99PaI6f+3I/5E83xrxxit+HKGR86OZuE3V1I4z
         cA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jwgQk4hxB0u815VyD14iTdkDJc1dGDwOWq82/HI8OL4=;
        b=DLYRgujs3llO8Ju/4IjjzPjnXfI6eZ1/EbTTxpvOzQwXOCdUnS9qLFM1mh6gzVP50e
         7nDYlSTVhJ/+G8+deLnZ8Z1KudQm01e0IplnWxNzi+RHJjVCWgW1J34sXZM0G7PSBlXs
         DLJMraHOUfU7gXCDIURcs70ZnSDtg+lIESlPtUobEO1jLC9a5WtKISucQ4dmjp4NROMJ
         kzzwmeArhwtMkiI2yLqc03xJQCa+SU0n2aVhcnP0dE2BiCvfdQ0xmmnRdQL4TmhZkKEN
         SgxxkbG4+DsvV8KeUCqpNqJMR2gR/TMAOUAGlh2O5CMNtpPdNdb2gGH9RPvL/EwP3q5a
         bFcQ==
X-Gm-Message-State: AOAM531OdbmzpAysnGzbpIEp/uKOb6fbVPhRR+ggzdTUEmaOv+kKufyM
        xoS+Mc06kdkDad/msBxBEBXfv3h6udnbTMvjovYKlC8cnvg=
X-Google-Smtp-Source: ABdhPJy7eKLcoaOty1RWVaBPYD1ofrMGU5FBs2Nu2Y118NsdmOZZ9nNtEh2lRkwUxs2g+QICAOhadamLtzzcLHx5iNU=
X-Received: by 2002:a05:651c:1291:: with SMTP id 17mr31606603ljc.286.1594194444952;
 Wed, 08 Jul 2020 00:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <5ed9d3ad-743f-e139-cf20-18eb418b24cd@kernel.org>
In-Reply-To: <5ed9d3ad-743f-e139-cf20-18eb418b24cd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Jul 2020 09:47:14 +0200
Message-ID: <CACRpkdbWYhbtR+Tv5fFdxuyPAXU68uAswFYNZQfNFaR_89k=nw@mail.gmail.com>
Subject: Re: chv-gpio interrupt storm on UMAX VisionBook 10Wi Pro
To:     Jiri Slaby <jirislaby@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 8, 2020 at 9:18 AM Jiri Slaby <jirislaby@kernel.org> wrote:

> I installed Linux on UMAX VisionBook 10Wi Pro. It sometimes boots, but
> even then it encounters lags, soft lockups:
> > watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:0]
> > watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [kworker/0:0H:6]
> > watchdog: BUG: soft lockup - CPU#0 stuck for 21s! [kworker/0:2:133]
> > watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:0]

Adding Hans de Goede to Cc, he often deals with this kind of weirdness
so he might have some ideas here.

Yours,
Linus Walleij
