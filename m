Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78B59A37BE
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2019 15:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbfH3N2o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Aug 2019 09:28:44 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41067 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727751AbfH3N2o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Aug 2019 09:28:44 -0400
Received: by mail-lj1-f196.google.com with SMTP id m24so6484066ljg.8
        for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2019 06:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TJvHNL2AdVRlnzYmxNp7DsYkw06sTTa68cUgrZ7A/QY=;
        b=m69R61rDb/umuSZNG5d72JyrJPhAbsro+/Vftsw4pOMPCgdkCJNPiHVSfXIEukDhUW
         ErlYc6l3A1G5HBrJOmeheZq5ijBVZKjtInfrfHq9CzGPX0ftzMnTODlO7buOtawqzBtX
         1NupLasyTd5PcQKtKftY+4GL/b052k8B/xyFAbQGBTQ71jJ4YPk7IFaNQCMVkXUG9yfA
         rBMZitEzaSCkTjBCRFDSDKuPgDMHJopnxDzOBS3Kr5vhyw8jNQWEkAN7QLYKOEd7XpEC
         I6GBUY2idFs9UpHeXK2Ga+okGKoCzoW/2a5XkC3eCYLWxR79B7rQaHgD1sexyBT1JZTN
         gtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TJvHNL2AdVRlnzYmxNp7DsYkw06sTTa68cUgrZ7A/QY=;
        b=UGvGyHMN5VNpP+jRUw6SFLyfA5XChE8vm5KDIrgzOVreOc8sA4LfZdGMOtP6XlILSc
         xkgsABRllxfGCDTJ3NkPDZoUUokZaVa9THwe9LKFNmCFC+C2kanowjHl1PYa54fdsiEB
         vL/EmEjvIEWbHwx+OlTs+oDposNbQNAyQbX3JVnJKFv/FWvlZ/wOjey6ak+6jLxyVIHk
         5ajn3xk65sL2xTSGcD0qWnjgIQTKirg2ic5TszEmmvb+Lw62jly8AsArCDQvNp6oGXZw
         tO/u3zMGgqdKQqh/VnljiZtmqXEs7bp3D1UgHSUTffhm7pLrcI3IRXjXIVIZdqHs/WAo
         U/gw==
X-Gm-Message-State: APjAAAXqiFJA35Wm9+49FzKjH3qPzfShMBSY3tBudMLZXUFGIrSptavI
        lYM5mDNQghxpQmuSaIjIHuCB117FfKI871xpLf92xmnoeuU=
X-Google-Smtp-Source: APXvYqzBMEs2ndK6lnamks5rxnwg+0g283d7Ijc5aM7gHppTgNug2jetEsJd3El3RnxU2sBq8M6oMX3f2JhBZ/vQU9o=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr8704037ljo.69.1567171722389;
 Fri, 30 Aug 2019 06:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190830075856.9261-1-brgl@bgdev.pl>
In-Reply-To: <20190830075856.9261-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Aug 2019 15:28:31 +0200
Message-ID: <CACRpkdY=GFDtWRgTs9Gm6t2X+mP2Mic7NrkHjA9R=0baZvU-Pw@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.3-rc7
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 30, 2019 at 9:58 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Hi Linus,
>
> please pull the following fixes for a regression in pca953x.

Pulled to my fixes branch!

Thanks a lot!
Linus Walleij
