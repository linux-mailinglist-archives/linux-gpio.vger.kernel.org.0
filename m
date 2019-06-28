Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 757515975D
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 11:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbfF1JW7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jun 2019 05:22:59 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33645 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbfF1JW7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jun 2019 05:22:59 -0400
Received: by mail-lj1-f196.google.com with SMTP id h10so5297496ljg.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2019 02:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QS9DMSc7qvLXoc68IREn9BTGGnz5fo+uaPh177/Kv9c=;
        b=TTPgmF9swmXaC9agJgRRNXOZhcqwRay5Dd4in4NHkb7VpCygxTK0m+aI84lWqFOp/j
         4MB6oHgvGHyU+j81sL5SPLPjTgYmjzc91MsIjwNbUcm5RlF2//G8CxCiJwtzHnnQPMVW
         Y+/jqPxvyiutvLFle58HToRkyTFm6T4UCGa1l/zOO5dExd3i4IgMuuNAnGRAqFtcsCcp
         2a9bHKdWreDdJbFLvwEOoq2/x7nZE2BwmRCTW8BbLd5+zZBlkdj7sRMdUVVjtPZCpvPL
         wGEsIifDJtY8s54y425OQWd0v5j3P2e0GThC7Zs6kbxH8BhvvvLCVgoXa16GxcGxPewx
         Z+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QS9DMSc7qvLXoc68IREn9BTGGnz5fo+uaPh177/Kv9c=;
        b=oqNefOLFRswzFWkC3o+Avk4wkGp77JsPzW1u73yCVfTSaZ51WZi0A9+hh38wf14vJX
         rN4rJ1r3sA7iCgJM4BCrYEbSCfcctjP/aIqwiodBDBJ2i0pqnF6ue36RMkQZKBUUZkNP
         Pj3WfbeDZQUBPsy0Sfumfh6hov2d5K2OzjF+idT4tfaYcAAs7qZJj/NmkR4TeSSFAG60
         QNwuPiJiyPAdqzL+pUv8EsmRtHEZxpsfHXIzR9WUqxblFuDcx5MLrJqQnnM+NmwT/BSL
         fbkprw455zQBQxdwIS8zKVCZe+usN8slqwbsoLT7kIn3hW754Sc3tGo3PsfJypwEhY+u
         6m8Q==
X-Gm-Message-State: APjAAAXNXVwPIHSCVatd78NplBFG8GlO4Dtdg6OzlCG44QZEMZj0DTbN
        d8/nwNTeuLlFATFLkIQucru4PS74KCQAcSWsdY15/A==
X-Google-Smtp-Source: APXvYqyPM21v4V34qP7W9YgKAMGb9PxkP+hle9xqn4OUZPxQmKUz8MQot7pW1xczghxph4M1Dv6qd7HrK9NBipXFLKM=
X-Received: by 2002:a2e:650a:: with SMTP id z10mr5539752ljb.28.1561713777464;
 Fri, 28 Jun 2019 02:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <1561699236-18620-1-git-send-email-harish_kandiga@mentor.com>
 <1561699236-18620-2-git-send-email-harish_kandiga@mentor.com>
 <CACRpkdZQpr78=ZzBQEkbjS714W0HPEurO8haM8PpmpvYFivm-A@mail.gmail.com> <d70eec4a-a2e3-f312-d3ef-4a2f653ec9de@mentor.com>
In-Reply-To: <d70eec4a-a2e3-f312-d3ef-4a2f653ec9de@mentor.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Jun 2019 10:22:45 +0100
Message-ID: <CACRpkdZeFbrF5GrVaaQUtEy=3imr8J7XQW+KRVhy1cFPoXz1_Q@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] gpio: inverter: Add Inverter controller for gpio configuration
To:     Harish Jenny K N <harish_kandiga@mentor.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 28, 2019 at 10:16 AM Harish Jenny K N
<harish_kandiga@mentor.com> wrote:
> On 28/06/19 2:25 PM, Linus Walleij wrote:

> > We still need some review from the DT people before I
> > apply it.
>
> Are the DT people in the same mailing list or do I need to send review request separately ?

Ah I see why you don't get any review on that part.
Make sure to send the DT binding patch to
devicetree@vger.kernel.org

You can just resend that one patch if you like.

Yours,
Linus Walleij
