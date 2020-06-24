Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485B72074A8
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 15:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388320AbgFXNez (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 09:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389340AbgFXNew (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 09:34:52 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65BFC0613ED
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 06:34:51 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id h23so1673530qtr.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 06:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RXXqtRawr8fnQBmxzOrcDn6WkbSsj6aEmLiLCLvffeY=;
        b=TJ10NSBbdbHcca9GOb50HLC6gl7+wdozNxfqkwnltyYSh6mq20cM37+I7wKa+WstR/
         SNXNJvegXmA2r1KVFRsHKluttZAls9a0TaUp64TC/yzDHFNUN6JWiPNHeYPnT9ghxXvj
         DbKJ0nWjEsBc0a3Asm0wZek2qOuGhx34ZO99Ep91EUKPB+a8XED4NboMUlQITI1DB53T
         +oWGpSHclFY7pcAetEbkTpQjJ/KBEAuQXB95G6PrhXm3OeRJAeltU/BAd3A4dO0VtyMm
         3bOWWwoy/eyuNoRLbDbG8o87hmqlWCmXW4FI3q2NZ2k4MHSywPmK52BKgLGTZGHqb3eT
         eTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RXXqtRawr8fnQBmxzOrcDn6WkbSsj6aEmLiLCLvffeY=;
        b=Gabdorv5eWHNsOhDDdKfPr7yaDJ07T8guRDK5KApXn9BF3psIvGFvlG9V0XIlkwbVu
         aPfX7TXQECD0L3KbOnEXs6AKfieceJ6RU2/aJoVfEXp1dgTX3VXv5g8Ur94XC0zu6nYp
         GUYBNQS5QyjyCVJjJtuHJSMstPkE2KAn7dfFHkLmkmDRJNeAzN+Baof6AN4eExxaMp4u
         13NGYkfNzHkAT/9F4gE64IxsmzdLIFWV7ET5wK+ZWYWngHyPBf/ZBpfsmFUhce5MBMba
         7VAJ/dPUrjhPmEXbtAqWIKuiuchXkZXxlQ/kl8rRCIzcRS03Hsfoc6vvMZJC9y3hiLVI
         lQqw==
X-Gm-Message-State: AOAM530CvKYWkeAL11GVL0mnspLAESnlkZjgl6GOv4EloNTI7+L/ZIjV
        3j0iVLBCcix8ILcQryRUkX+MEEc2s0kSQM8pK7rFdQ==
X-Google-Smtp-Source: ABdhPJyzI+feGsGkCcvsqgt0cK92naz8D48uJ/UYy8VzAdvRImzxX3YufPYSscpk5vWifQ5tQ916Cqjrg1Y3lXJVpmE=
X-Received: by 2002:aed:2a75:: with SMTP id k50mr10983172qtf.27.1593005691057;
 Wed, 24 Jun 2020 06:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-3-warthog618@gmail.com>
In-Reply-To: <20200623040107.22270-3-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 24 Jun 2020 15:34:40 +0200
Message-ID: <CAMpxmJVUK6hJhY5h2dwAD74gjbAEzXvWfQxT_mKZ2_gpe_m=Vg@mail.gmail.com>
Subject: Re: [PATCH 02/22] gpiolib: cdev: sort includes
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

wt., 23 cze 2020 o 06:01 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Sort the includes of gpiolib-cdev.c to make it easier to identify if a
> module is included and to avoid duplication.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
