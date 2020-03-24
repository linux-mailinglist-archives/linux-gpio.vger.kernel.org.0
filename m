Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D19E819086F
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 10:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbgCXJFE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Mar 2020 05:05:04 -0400
Received: from mail-lj1-f181.google.com ([209.85.208.181]:42485 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgCXJFE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Mar 2020 05:05:04 -0400
Received: by mail-lj1-f181.google.com with SMTP id q19so17669213ljp.9
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2020 02:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SAIXqHToSo9jTaMlxPe0U+XSPNCPfimwxAOX7EBA8vQ=;
        b=O+2CEPTm99I3oazFNaEz0F0XDKNSeEXlVVOlqnDKuRin15LiUeq820ZoCFVP0q0Pms
         8HZPZtbXOotysXaXE3gMYkGfIKH7X9MsE4hXjjG8ynNdY21LhfgOTpdI65qSBSPNjKmI
         qya/9U88yDBXgdXxNbO3ArpLtIwhLq9B1XVr7pJ6Xlse5HH+7G3BiiJWUM//4D7ta901
         5iDLJ7s1msQAXYJocOT/GzsxbxyWMf6P8VchipIwaNcw9o4B5CZzgNjlaZaijrG0qHVb
         J6IFygcOsYhxollEXj9/v1fhVpWO3UNk9gadDsFUqHUXeWSbQGZCEizfADfTK+pGq0wK
         +sBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SAIXqHToSo9jTaMlxPe0U+XSPNCPfimwxAOX7EBA8vQ=;
        b=qkIMd8/y2u+FmzPqqmoMVnb6L9JBvYpj8XGIH1pPXqIMdMkVbfT21coKM/rmKl2Qf7
         5y5GrzddZTTEzvuePOfU6WbFQLMBGlqF9WUVoC0SSssUWqhsbnFwPNEDjiQGKFFdSJdU
         RyR28HIa9zt7oNCv0E7TOZjnGA6p8CyyeHLI/d+xWlP84Dy+H/QPcw7m2T8WwWyU5J8W
         IjCXGD9Oa0PZPvzo4XnQifLSxsSDpbPhdY/qMpqGbleHYoWy54x2B5+/KX8tVx2l+6bu
         o4EhMSMx8jVIX9yl/bACHbzuw4PqIFuxJSypRPHmZ9p+Z+1Igr2TFTo1089yiWwnSgtC
         Tc1A==
X-Gm-Message-State: ANhLgQ3q6qo0cRa89Yhf6Q5/7dH7+3uTNkf9BYiuGMRplAjKqX/Ufghn
        rCaUc9Rg1ur2Kayo5Oj0G3eo21QHy7yDwCAydf8LlbBr/C0=
X-Google-Smtp-Source: ADFU+vuYwsP0Hycg+N3jDimLyr9N3LsHsIEVpDQ8ZTHYRnyGYYWwhecD1jrgTDAHJdFxJABRAp+/KKCe5snqAUz/qZc=
X-Received: by 2002:a2e:9605:: with SMTP id v5mr4531862ljh.258.1585040701134;
 Tue, 24 Mar 2020 02:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200324082903.19366-1-brgl@bgdev.pl>
In-Reply-To: <20200324082903.19366-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 Mar 2020 10:04:50 +0100
Message-ID: <CACRpkdYk19NMMW9ua12475om-jKWWf5u8Rd=VU==2vhXRocnoA@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.7 part 3
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Tue, Mar 24, 2020 at 9:29 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> this is the third and probably last batch of changes for v5.7 I picked up
> into my tree. Details are in the signed tag. Please pull.

Which rc is this based on? I got a bunch of unrelated changes, so
I suppose I need to merge the right rc base to the devel branch
first.

Yours,
Linus Walleij
